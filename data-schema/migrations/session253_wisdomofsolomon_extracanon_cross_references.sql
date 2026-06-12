-- =====================================================================
-- Session 253 — Wisdom of Solomon FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py ../data-schema/migrations/session253_wisdomofsolomon_extracanon_cross_references.sql
-- =====================================================================

\echo 'session253 — Wisdom of Solomon cross-references starting...'
BEGIN;

-- ----- fragment: minion_thewisdomofsolomon_01.sql (session253 the-wisdom-of-solomon 1) -----
-- Source anchor: apocrypha/the-wisdom-of-solomon ch1. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: wis01 (view _session253_wis01_lookup). Sort band base 58000, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_wis01_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: wisdom-1-seek-him-in-singleness-of-heart
  ('apocrypha', 'the-wisdom-of-solomon', 1, 1, 'canon', 'deuteronomy', 4, 29, 'free', E'Deuteronomy 4:29 — *But if from thence thou shalt seek Yahuah Elohayka (the LORD thy God), thou shalt find him, if thou seek him with all thy heart and with all thy soul.* The single-heartedness Wisdom 1:1 demands is Moses'' own promise that the whole-hearted seeker finds Yahuah.'),
  ('apocrypha', 'the-wisdom-of-solomon', 1, 2, 'canon', 'proverbs', 8, 35, 'free', E'Proverbs 8:35 — *For whoso findeth me findeth life, and shall obtain favour of Yahuah (LORD).* The Wisdom who is found of those who distrust her not (Wisdom 1:2) is the Wisdom of Proverbs who gives life to those who find her.'),
  ('apocrypha', 'the-wisdom-of-solomon', 1, 1, 'canon', 'psalms', 34, 12, 'free', E'Psalm 34:12 — *What man is he that desireth life, and loveth many days, that he may see good?* The love of righteousness Wisdom 1:1 commands is the psalmist''s path to life and to seeing good.'),
  -- thread: wisdom-1-the-spirit-of-yahuah-filleth-the-world
  ('apocrypha', 'the-wisdom-of-solomon', 1, 7, 'canon', 'psalms', 139, 7, 'free', E'Psalm 139:7 — *Whither shall I go from thy spirit? or whither shall I flee from thy presence?* The Spirit that fills the world in Wisdom 1:7 is the inescapable presence David confesses he cannot flee.'),
  ('apocrypha', 'the-wisdom-of-solomon', 1, 7, 'canon', 'jeremiah', 23, 24, 'free', E'Jeremiah 23:24 — *Can any hide himself in secret places that I shall not see him? saith Yahuah (LORD). Do not I fill heaven and earth? saith Yahuah (LORD).* Wisdom 1:7''s claim that the Spirit fills the world is Yahuah''s own word that He fills heaven and earth, so none can hide.'),
  ('apocrypha', 'the-wisdom-of-solomon', 1, 8, 'canon', 'proverbs', 15, 3, 'free', E'Proverbs 15:3 — *The eyes of Yahuah (LORD) are in every place, beholding the evil and the good.* Because His eyes are everywhere, he that speaks unrighteous things cannot be hid (Wisdom 1:8).'),
  ('apocrypha', 'the-wisdom-of-solomon', 1, 6, 'canon', '1-corinthians', 2, 10, 'free', E'1 Corinthians 2:10 — *But Elohim (God) hath revealed them unto us by his Spirit: for the Spirit searcheth all things, yea, the deep things of Elohim (God).* The Spirit who is witness of the reins and beholder of the heart (Wisdom 1:6) is the searching Spirit Paul says knows the deep things of Elohim.'),
  -- thread: wisdom-1-refrain-the-tongue-account-for-words
  ('apocrypha', 'the-wisdom-of-solomon', 1, 11, 'canon', 'matthew', 12, 36, 'free', E'Matthew 12:36 — *But I say unto you, That every idle word that men shall speak, they shall give account thereof in the day of judgment.* Wisdom 1:11''s no word shall go for nought is the Master''s word that even idle speech is brought to account.'),
  ('apocrypha', 'the-wisdom-of-solomon', 1, 11, 'canon', 'psalms', 34, 13, 'free', E'Psalm 34:13 — *Keep thy tongue from evil, and thy lips from speaking guile.* The charge to refrain the tongue from backbiting (Wisdom 1:11) is the psalmist''s same discipline of the lips.'),
  ('apocrypha', 'the-wisdom-of-solomon', 1, 10, 'apocrypha', 'ecclesiasticus', 23, 19, 'extras', E'Ecclesiasticus 23:19 — *Such a man only fears the eyes of men, and knoweth not that the eyes of Yahuah (God) are ten thousand times brighter than the sun, beholding all the ways of men, and considering the most secret parts.* Ben Sira''s brighter-than-the-sun eyes are the same all-hearing ear of jealousy from which murmuring is not hid in Wisdom 1:10.'),
  -- thread: wisdom-1-elohim-made-not-death
  ('apocrypha', 'the-wisdom-of-solomon', 1, 14, 'canon', 'genesis', 1, 31, 'free', E'Genesis 1:31 — *And Elohim (God) saw every thing that he had made, and, behold, it was very good. And the evening and the morning were the sixth day.* Wisdom 1:14''s healthful generations with no poison of destruction is the very-good creation in which death had no place.'),
  ('apocrypha', 'the-wisdom-of-solomon', 1, 13, 'canon', 'ezekiel', 18, 32, 'free', E'Ezekiel 18:32 — *For I have no pleasure in the death of him that dieth, saith Adonai Yahuah (the Lord GOD): wherefore turn yourselves, and live ye.* Wisdom 1:13''s Elohim who has no pleasure in the destruction of the living is the very Yahuah who bids the dying turn and live.'),
  ('apocrypha', 'the-wisdom-of-solomon', 1, 13, 'canon', 'ezekiel', 33, 11, 'free', E'Ezekiel 33:11 — *Say unto them, As I live, saith Adonai Yahuah (the Lord GOD), I have no pleasure in the death of the wicked; but that the wicked turn from his way and live: turn ye, turn ye from your evil ways; for why will ye die, O house of Yashar''el (Israel)?* The oath that Elohim made not death (Wisdom 1:13) is Yahuah''s own sworn ''As I live'' that He wills not death but turning.'),
  ('apocrypha', 'the-wisdom-of-solomon', 1, 13, 'canon', 'genesis', 2, 17, 'free', E'Genesis 2:17 — *But of the tree of the knowledge of good and evil, thou shalt not eat of it: for in the day that thou eatest thereof thou shalt surely die.* Death entered not from Elohim''s making but by the breaking of the one word, which is exactly Wisdom 1:13''s claim that He made not death.'),
  -- thread: wisdom-1-ungodly-call-death-covenant-with-it
  ('apocrypha', 'the-wisdom-of-solomon', 1, 16, 'canon', 'romans', 6, 23, 'free', E'Romans 6:23 — *For the wages of sin is death; but the gift of Elohim (God) is eternal life through Yahusha HaMashiach (Jesus Christ) our Lord.* The ungodly who call death to them by works and words (Wisdom 1:16) earn the wage of sin, while life remains Elohim''s gift.'),
  ('apocrypha', 'the-wisdom-of-solomon', 1, 12, 'canon', 'genesis', 2, 17, 'free', E'Genesis 2:17 — *But of the tree of the knowledge of good and evil, thou shalt not eat of it: for in the day that thou eatest thereof thou shalt surely die.* To seek death in the error of one''s life (Wisdom 1:12) is to repeat the first reaching of the hand that pulled destruction down.'),
  ('apocrypha', 'the-wisdom-of-solomon', 1, 16, 'apocrypha', 'the-wisdom-of-solomon', 11, 24, 'extras', E'Wisdom of Solomon 11:24 — *For you lovest all the things that are, and abhorrest nothing which you have made: for never wouldest you have made any thing, if you had hated it.* The covenant the ungodly make with death (Wisdom 1:16) is set against the Maker who, as the same book later says, hates nothing He has made.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_wis01_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_wis01_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-1-seek-him-in-singleness-of-heart',
       E'Seek Yahuah in singleness of heart',
       E'Wisdom opens not with speculation but with a summons to the will: *Love righteousness, you that be judges of the earth: think of Yahuah (God) with a good (heart,) and in simplicity of heart seek him* (Wisdom of Solomon 1:1), *For he will be found of them that tempt him not; and sheweth himself to such as do not distrust him* (Wisdom of Solomon 1:2). It ain''t new — this is Moses'' charge to a scattered people: *But if from thence thou shalt seek Yahuah Elohayka (the LORD thy God), thou shalt find him, if thou seek him with all thy heart and with all thy soul* (Deuteronomy 4:29). The seeking is single-hearted, undivided. And the One sought is not an abstraction but the living Wisdom of Proverbs, who promises *For whoso findeth me findeth life, and shall obtain favour of Yahuah (LORD)* (Proverbs 8:35) — so that the psalmist''s question, *What man is he that desireth life, and loveth many days, that he may see good?* (Psalm 34:12), is answered here in the love of righteousness itself.',
       sv.verse_id, ev.verse_id, 'extras', 58000
  FROM _session253_wis01_lookup sv, _session253_wis01_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=1 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=1 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-1-the-spirit-of-yahuah-filleth-the-world',
       E'The Spirit of Yahuah filleth the world — nothing hid',
       E'Why can the seeker not deceive nor hide? Because *the holy spirit of discipline will flee deceit* (Wisdom of Solomon 1:5), and above all because *the Spirit of Yahuah (God) filleth the world: and that which containeth all things has knowledge of the voice* (Wisdom of Solomon 1:7). It ain''t new — David asked it long before: *Whither shall I go from thy spirit? or whither shall I flee from thy presence?* (Psalm 139:7); and Yahuah answered through the prophet, *Can any hide himself in secret places that I shall not see him? saith Yahuah (LORD). Do not I fill heaven and earth? saith Yahuah (LORD)* (Jeremiah 23:24). His eyes are not far off: *The eyes of Yahuah (LORD) are in every place, beholding the evil and the good* (Proverbs 15:3). And the Spirit who fills the world is the same Spirit Paul names as searching the depths: *But Elohim (God) hath revealed them unto us by his Spirit: for the Spirit searcheth all things, yea, the deep things of Elohim (God)* (1 Corinthians 2:10).',
       sv.verse_id, ev.verse_id, 'extras', 58003
  FROM _session253_wis01_lookup sv, _session253_wis01_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=1 AND sv.verse_number=5
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=1 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-1-refrain-the-tongue-account-for-words',
       E'Refrain the tongue — every word brought to account',
       E'The hidden Spirit hears the hidden word: *For the ear of jealousy heareth all things: and the noise of murmurings is not hid* (Wisdom of Solomon 1:10), *Therefore beware of murmuring, which is unprofitable; and refrain your tongue from backbiting: for there is no word so secret, that shall go for nought: and the mouth that belieth slayeth the soul* (Wisdom of Solomon 1:11). It ain''t new — the Master taught the same reckoning: *But I say unto you, That every idle word that men shall speak, they shall give account thereof in the day of judgment* (Matthew 12:36); and the psalm-discipline behind it is plain: *Keep thy tongue from evil, and thy lips from speaking guile* (Psalm 34:13). Ben Sira, in the kindred wisdom of the same library, presses the warning home — the slanderer forgets the watching eye: *Such a man only fears the eyes of men, and knoweth not that the eyes of Yahuah (God) are ten thousand times brighter than the sun, beholding all the ways of men, and considering the most secret parts* (Ecclesiasticus 23:19).',
       sv.verse_id, ev.verse_id, 'extras', 58006
  FROM _session253_wis01_lookup sv, _session253_wis01_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=1 AND sv.verse_number=10
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=1 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-1-elohim-made-not-death',
       E'Elohim made not death — the creation was very good',
       E'Here is the heart of the chapter, and a verse cited again and again in the live apparatus: *For Yahuah (God) made not death: neither has he pleasure in the destruction of the living* (Wisdom of Solomon 1:13), *For he created all things, that they might have their being: and the generations of the world were healthful; and there is no poison of destruction in them, nor the kingdom of death upon the earth* (Wisdom of Solomon 1:14), *(For righteousness is immortal:)* (Wisdom of Solomon 1:15). It ain''t new — at the first, *Elohim (God) saw every thing that he had made, and, behold, it was very good. And the evening and the morning were the sixth day* (Genesis 1:31): no death was woven into it. And Yahuah Himself swears He takes no joy in dying men: *For I have no pleasure in the death of him that dieth, saith Adonai Yahuah (the Lord GOD): wherefore turn yourselves, and live ye* (Ezekiel 18:32), *As I live, saith Adonai Yahuah (the Lord GOD), I have no pleasure in the death of the wicked; but that the wicked turn from his way and live* (Ezekiel 33:11). Death came not from Elohim but by transgression of the one word — *for in the day that thou eatest thereof thou shalt surely die* (Genesis 2:17).',
       sv.verse_id, ev.verse_id, 'extras', 58009
  FROM _session253_wis01_lookup sv, _session253_wis01_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=1 AND sv.verse_number=13
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=1 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-1-ungodly-call-death-covenant-with-it',
       E'The ungodly call death to themselves',
       E'Death is not of Elohim; the ungodly summon it: *Seek not death in the error of your life: and pull not upon yourselves destruction with the works of your hands* (Wisdom of Solomon 1:12), *But ungodly men with their works and words called it to them: for when they thought to have it their friend, they consumed to nought, and made a covenant with it, because they are worthy to take part with it* (Wisdom of Solomon 1:16). It ain''t new — Paul states the wage plainly: *For the wages of sin is death; but the gift of Elohim (God) is eternal life through Yahusha HaMashiach (Jesus Christ) our Lord* (Romans 6:23) — death is earned, not assigned by the Maker. The covenant with death is a covenant against the One who *lovest all the things that are, and abhorrest nothing which you have made: for never wouldest you have made any thing, if you had hated it* (Wisdom of Solomon 11:24) — the same Author of life testifying through the same book that He hates none of His works.',
       sv.verse_id, ev.verse_id, 'extras', 58012
  FROM _session253_wis01_lookup sv, _session253_wis01_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=1 AND sv.verse_number=12
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=1 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: wisdom-1-seek-him-in-singleness-of-heart
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 4:29 — *But if from thence thou shalt seek Yahuah Elohayka (the LORD thy God), thou shalt find him, if thou seek him with all thy heart and with all thy soul.* The single-heartedness Wisdom 1:1 demands is Moses'' own promise that the whole-hearted seeker finds Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session253_wis01_lookup sv, _session253_wis01_lookup tv
 WHERE t.slug='wisdom-1-seek-him-in-singleness-of-heart'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=1 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=4 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 8:35 — *For whoso findeth me findeth life, and shall obtain favour of Yahuah (LORD).* The Wisdom who is found of those who distrust her not (Wisdom 1:2) is the Wisdom of Proverbs who gives life to those who find her.'
  FROM cross_reference_threads t, cross_references x, _session253_wis01_lookup sv, _session253_wis01_lookup tv
 WHERE t.slug='wisdom-1-seek-him-in-singleness-of-heart'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=1 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=8 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 34:12 — *What man is he that desireth life, and loveth many days, that he may see good?* The love of righteousness Wisdom 1:1 commands is the psalmist''s path to life and to seeing good.'
  FROM cross_reference_threads t, cross_references x, _session253_wis01_lookup sv, _session253_wis01_lookup tv
 WHERE t.slug='wisdom-1-seek-him-in-singleness-of-heart'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=1 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=34 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-1-the-spirit-of-yahuah-filleth-the-world
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 139:7 — *Whither shall I go from thy spirit? or whither shall I flee from thy presence?* The Spirit that fills the world in Wisdom 1:7 is the inescapable presence David confesses he cannot flee.'
  FROM cross_reference_threads t, cross_references x, _session253_wis01_lookup sv, _session253_wis01_lookup tv
 WHERE t.slug='wisdom-1-the-spirit-of-yahuah-filleth-the-world'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=1 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=139 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 23:24 — *Can any hide himself in secret places that I shall not see him? saith Yahuah (LORD). Do not I fill heaven and earth? saith Yahuah (LORD).* Wisdom 1:7''s claim that the Spirit fills the world is Yahuah''s own word that He fills heaven and earth, so none can hide.'
  FROM cross_reference_threads t, cross_references x, _session253_wis01_lookup sv, _session253_wis01_lookup tv
 WHERE t.slug='wisdom-1-the-spirit-of-yahuah-filleth-the-world'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=1 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=23 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 15:3 — *The eyes of Yahuah (LORD) are in every place, beholding the evil and the good.* Because His eyes are everywhere, he that speaks unrighteous things cannot be hid (Wisdom 1:8).'
  FROM cross_reference_threads t, cross_references x, _session253_wis01_lookup sv, _session253_wis01_lookup tv
 WHERE t.slug='wisdom-1-the-spirit-of-yahuah-filleth-the-world'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=1 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=15 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Corinthians 2:10 — *But Elohim (God) hath revealed them unto us by his Spirit: for the Spirit searcheth all things, yea, the deep things of Elohim (God).* The Spirit who is witness of the reins and beholder of the heart (Wisdom 1:6) is the searching Spirit Paul says knows the deep things of Elohim.'
  FROM cross_reference_threads t, cross_references x, _session253_wis01_lookup sv, _session253_wis01_lookup tv
 WHERE t.slug='wisdom-1-the-spirit-of-yahuah-filleth-the-world'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=1 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=2 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-1-refrain-the-tongue-account-for-words
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 12:36 — *But I say unto you, That every idle word that men shall speak, they shall give account thereof in the day of judgment.* Wisdom 1:11''s no word shall go for nought is the Master''s word that even idle speech is brought to account.'
  FROM cross_reference_threads t, cross_references x, _session253_wis01_lookup sv, _session253_wis01_lookup tv
 WHERE t.slug='wisdom-1-refrain-the-tongue-account-for-words'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=1 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=12 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 34:13 — *Keep thy tongue from evil, and thy lips from speaking guile.* The charge to refrain the tongue from backbiting (Wisdom 1:11) is the psalmist''s same discipline of the lips.'
  FROM cross_reference_threads t, cross_references x, _session253_wis01_lookup sv, _session253_wis01_lookup tv
 WHERE t.slug='wisdom-1-refrain-the-tongue-account-for-words'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=1 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=34 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ecclesiasticus 23:19 — *Such a man only fears the eyes of men, and knoweth not that the eyes of Yahuah (God) are ten thousand times brighter than the sun, beholding all the ways of men, and considering the most secret parts.* Ben Sira''s brighter-than-the-sun eyes are the same all-hearing ear of jealousy from which murmuring is not hid in Wisdom 1:10.'
  FROM cross_reference_threads t, cross_references x, _session253_wis01_lookup sv, _session253_wis01_lookup tv
 WHERE t.slug='wisdom-1-refrain-the-tongue-account-for-words'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=1 AND sv.verse_number=10
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=23 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-1-elohim-made-not-death
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:31 — *And Elohim (God) saw every thing that he had made, and, behold, it was very good. And the evening and the morning were the sixth day.* Wisdom 1:14''s healthful generations with no poison of destruction is the very-good creation in which death had no place.'
  FROM cross_reference_threads t, cross_references x, _session253_wis01_lookup sv, _session253_wis01_lookup tv
 WHERE t.slug='wisdom-1-elohim-made-not-death'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=1 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 18:32 — *For I have no pleasure in the death of him that dieth, saith Adonai Yahuah (the Lord GOD): wherefore turn yourselves, and live ye.* Wisdom 1:13''s Elohim who has no pleasure in the destruction of the living is the very Yahuah who bids the dying turn and live.'
  FROM cross_reference_threads t, cross_references x, _session253_wis01_lookup sv, _session253_wis01_lookup tv
 WHERE t.slug='wisdom-1-elohim-made-not-death'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=1 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=18 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 33:11 — *Say unto them, As I live, saith Adonai Yahuah (the Lord GOD), I have no pleasure in the death of the wicked; but that the wicked turn from his way and live: turn ye, turn ye from your evil ways; for why will ye die, O house of Yashar''el (Israel)?* The oath that Elohim made not death (Wisdom 1:13) is Yahuah''s own sworn ''As I live'' that He wills not death but turning.'
  FROM cross_reference_threads t, cross_references x, _session253_wis01_lookup sv, _session253_wis01_lookup tv
 WHERE t.slug='wisdom-1-elohim-made-not-death'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=1 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=33 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 2:17 — *But of the tree of the knowledge of good and evil, thou shalt not eat of it: for in the day that thou eatest thereof thou shalt surely die.* Death entered not from Elohim''s making but by the breaking of the one word, which is exactly Wisdom 1:13''s claim that He made not death.'
  FROM cross_reference_threads t, cross_references x, _session253_wis01_lookup sv, _session253_wis01_lookup tv
 WHERE t.slug='wisdom-1-elohim-made-not-death'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=1 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-1-ungodly-call-death-covenant-with-it
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Romans 6:23 — *For the wages of sin is death; but the gift of Elohim (God) is eternal life through Yahusha HaMashiach (Jesus Christ) our Lord.* The ungodly who call death to them by works and words (Wisdom 1:16) earn the wage of sin, while life remains Elohim''s gift.'
  FROM cross_reference_threads t, cross_references x, _session253_wis01_lookup sv, _session253_wis01_lookup tv
 WHERE t.slug='wisdom-1-ungodly-call-death-covenant-with-it'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=1 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=6 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 2:17 — *But of the tree of the knowledge of good and evil, thou shalt not eat of it: for in the day that thou eatest thereof thou shalt surely die.* To seek death in the error of one''s life (Wisdom 1:12) is to repeat the first reaching of the hand that pulled destruction down.'
  FROM cross_reference_threads t, cross_references x, _session253_wis01_lookup sv, _session253_wis01_lookup tv
 WHERE t.slug='wisdom-1-ungodly-call-death-covenant-with-it'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=1 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Wisdom of Solomon 11:24 — *For you lovest all the things that are, and abhorrest nothing which you have made: for never wouldest you have made any thing, if you had hated it.* The covenant the ungodly make with death (Wisdom 1:16) is set against the Maker who, as the same book later says, hates nothing He has made.'
  FROM cross_reference_threads t, cross_references x, _session253_wis01_lookup sv, _session253_wis01_lookup tv
 WHERE t.slug='wisdom-1-ungodly-call-death-covenant-with-it'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=1 AND sv.verse_number=16
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=11 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_thewisdomofsolomon_02.sql (session253 the-wisdom-of-solomon 2) -----
-- Source anchor: apocrypha/the-wisdom-of-solomon ch2. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: wis02 (view _session253_wis02_lookup). Sort band base 58025, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_wis02_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: wisdom-2-suffering-righteous-passion
  ('apocrypha', 'the-wisdom-of-solomon', 2, 13, 'canon', 'matthew', 27, 43, 'free', E'Matthew 27:43 — *He trusted in Elohim (God); let him deliver him now, if he will have him: for he said, I am the Son of Elohim (God).* The mockers at the cross speak the ungodly''s reasoning of Wisdom of Solomon 2:13 almost word for word — the righteous one who calls himself the child of Yahuah.'),
  ('apocrypha', 'the-wisdom-of-solomon', 2, 18, 'canon', 'psalms', 22, 8, 'free', E'Psalm 22:8 — *He trusted on Yahuah (LORD) that he would deliver him: let him deliver him, seeing he delighted in him.* The taunt ''if the just man be the son of Yahuah, he will help him'' of Wisdom of Solomon 2:18 is the psalmist''s scornful ''let him deliver him.'''),
  ('apocrypha', 'the-wisdom-of-solomon', 2, 20, 'canon', 'john', 19, 7, 'free', E'John 19:7 — *The Yahudim (Jews) answered him, We have a law, and by our law he ought to die, because he made himself the Son of Elohim (God).* The shameful-death verdict of Wisdom of Solomon 2:20 is pressed on the exact ground that he made himself the Son of Elohim.'),
  ('apocrypha', 'the-wisdom-of-solomon', 2, 19, 'canon', 'isaiah', 53, 7, 'free', E'Isaiah 53:7 — *He was oppressed, and he was afflicted, yet he opened not his mouth: he is brought as a lamb to the slaughter, and as a sheep before her shearers is dumb, so he openeth not his mouth.* The despite, torture, and meekness tested in Wisdom of Solomon 2:19 is the silent Lamb of Isaiah''s suffering servant.'),
  ('apocrypha', 'the-wisdom-of-solomon', 2, 12, 'canon', 'isaiah', 3, 10, 'free', E'Isaiah 3:10 — *Say ye to the righteous, that it shall be well with him: for they shall eat the fruit of their doings.* The ungodly''s lying-in-wait for the righteous in Wisdom of Solomon 2:12 inverts the prophet''s promise that it shall be well with the just.'),
  -- thread: wisdom-2-the-falsely-condemned-just
  ('apocrypha', 'the-wisdom-of-solomon', 2, 20, 'canon', 'james', 5, 6, 'free', E'James 5:6 — *Ye have condemned and killed the just; and he doth not resist you.* James names the very crime the ungodly plot in Wisdom of Solomon 2:20 — condemning the unresisting righteous one to death.'),
  ('apocrypha', 'the-wisdom-of-solomon', 2, 19, 'apocrypha', 'the-history-of-susanna', 1, 28, 'extras', E'The History of Susanna 1:28 — *And it came to pass the next day, when the people were assembled to her husband Joacim, the two elders came also full of mischievous imagination against Susanna to put her to death.* Susanna''s accusers act out the despiteful examination of the righteous in Wisdom of Solomon 2:19.'),
  ('apocrypha', 'the-wisdom-of-solomon', 2, 18, 'apocrypha', 'the-history-of-susanna', 1, 60, 'extras', E'The History of Susanna 1:60 — *With that all the assembly cried out with a loud voice, and praised Yahuah (God), who saves them that trust in him.* Susanna''s deliverance answers the ungodly''s wager in Wisdom of Solomon 2:18 — the just man''s Elohim does help him.'),
  -- thread: wisdom-2-let-us-eat-and-drink
  ('apocrypha', 'the-wisdom-of-solomon', 2, 6, 'canon', 'isaiah', 22, 13, 'free', E'Isaiah 22:13 — *And behold joy and gladness, slaying oxen, and killing sheep, eating flesh, and drinking wine: let us eat and drink; for to morrow we shall die.* The ''let us enjoy the good things that are present'' of Wisdom of Solomon 2:6 is the very feast the prophet rebukes.'),
  ('apocrypha', 'the-wisdom-of-solomon', 2, 6, 'canon', '1-corinthians', 15, 32, 'free', E'1 Corinthians 15:32 — *If after the manner of men I have fought with beasts at Ephesus, what advantageth it me, if the dead rise not? let us eat and drink; for to morrow we die.* Paul ties this creed to denying the resurrection — exactly the ''no returning'' reasoning behind Wisdom of Solomon 2:6.'),
  ('apocrypha', 'the-wisdom-of-solomon', 2, 9, 'canon', 'luke', 12, 19, 'free', E'Luke 12:19 — *And I will say to my soul, Soul, thou hast much goods laid up for many years; take thine ease, eat, drink, and be merry.* The rich fool''s portion echoes ''this is our portion, and our lot is this'' of Wisdom of Solomon 2:9.'),
  -- thread: wisdom-2-oppress-the-poor-righteous
  ('apocrypha', 'the-wisdom-of-solomon', 2, 10, 'canon', 'amos', 2, 6, 'free', E'Amos 2:6 — *Thus saith Yahuah (LORD); For three transgressions of Yashar''el (Israel), and for four, I will not turn away the punishment thereof; because they sold the righteous for silver, and the poor for a pair of shoes.* The oppression of the poor righteous man in Wisdom of Solomon 2:10 is the sin Yahuah swears to judge.'),
  ('apocrypha', 'the-wisdom-of-solomon', 2, 10, 'canon', 'amos', 2, 7, 'free', E'Amos 2:7 — *That pant after the dust of the earth on the head of the poor, and turn aside the way of the meek: and a man and his father will go in unto the same maid, to profane my holy name.* The trampling of the poor and the meek answers the unsparing cruelty of Wisdom of Solomon 2:10.'),
  ('apocrypha', 'the-wisdom-of-solomon', 2, 11, 'canon', 'james', 5, 6, 'free', E'James 5:6 — *Ye have condemned and killed the just; and he doth not resist you.* Making strength ''the law of justice'' in Wisdom of Solomon 2:11 ends in the condemned and unresisting just one of James.'),
  -- thread: wisdom-2-immortal-image-envy-of-devil
  ('apocrypha', 'the-wisdom-of-solomon', 2, 23, 'canon', 'genesis', 1, 27, 'free', E'Genesis 1:27 — *So Elohim (God) created man in his own image, in the image of Elohim (God) created he him; male and female created he them.* The man made ''an image of his own eternity'' in Wisdom of Solomon 2:23 is the image of Elohim in the creation account.'),
  ('apocrypha', 'the-wisdom-of-solomon', 2, 24, 'canon', 'genesis', 3, 4, 'free', E'Genesis 3:4 — *And the serpent said unto the woman, Ye shall not surely die.* The ''envy of the devil'' that brought death in Wisdom of Solomon 2:24 is the serpent''s lie that began it.'),
  ('apocrypha', 'the-wisdom-of-solomon', 2, 24, 'canon', 'john', 8, 44, 'free', E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him.* The devil who brought death by envy in Wisdom of Solomon 2:24 is the murderer and liar from the beginning.'),
  ('apocrypha', 'the-wisdom-of-solomon', 2, 24, 'canon', 'romans', 5, 12, 'free', E'Romans 5:12 — *Wherefore, as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned.* Paul''s account of death entering the world matches ''through envy of the devil came death into the world'' of Wisdom of Solomon 2:24.'),
  ('apocrypha', 'the-wisdom-of-solomon', 2, 23, 'apocrypha', 'the-wisdom-of-solomon', 3, 1, 'extras', E'The Wisdom of Solomon 3:1 — *But the souls of the righteous are in the hand of Yahuah (God), and there shall no torment touch them.* The immortality for which man was created in Wisdom of Solomon 2:23 is secured for the righteous in the next chapter''s hope.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_wis02_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_wis02_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-2-suffering-righteous-passion',
       E'The just man who calls himself the child of Yahuah — condemned to a shameful death',
       E'The ungodly resolve against the righteous one: *Therefore let us lie in wait for the righteous; because he is not for our turn, and he is clean contrary to our doings: he upbraideth us with our offending the law, and objecteth to our infamy the transgressings of our education* (Wisdom of Solomon 2:12); *He professeth to have the knowledge of Yahuah (God): and he calls himself the child of Yahuah (God)* (Wisdom of Solomon 2:13); *For if the just man be the son of Yahuah (God), he will help him, and deliver him from the hand of his enemies* (Wisdom of Solomon 2:18); *Let us condemn him with a shameful death: for by his own saying he shall be respected* (Wisdom of Solomon 2:20). It ain''t new — this is the script the mockers read aloud at Golgotha. *He trusted in Elohim (God); let him deliver him now, if he will have him: for he said, I am the Son of Elohim (God)* (Matthew 27:43); the same taunt the psalmist heard, *He trusted on Yahuah (LORD) that he would deliver him: let him deliver him, seeing he delighted in him* (Psalm 22:8); and the very charge of the accusers, *We have a law, and by our law he ought to die, because he made himself the Son of Elohim (God)* (John 19:7). The prophet already named the silent Lamb of that shameful death — *He was oppressed, and he was afflicted, yet he opened not his mouth: he is brought as a lamb to the slaughter* (Isaiah 53:7). The Passion was written into the witness centuries before the cross stood up.',
       sv.verse_id, ev.verse_id, 'extras', 58025
  FROM _session253_wis02_lookup sv, _session253_wis02_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=2 AND sv.verse_number=12
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=2 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-2-the-falsely-condemned-just',
       E'Ye have condemned and killed the just — the righteous one slain by false counsel',
       E'The plot is to put the innocent to a violent end: *Let us examine him with despitefulness and torture, that we may know his meekness, and prove his patience* (Wisdom of Solomon 2:19); *Let us condemn him with a shameful death: for by his own saying he shall be respected* (Wisdom of Solomon 2:20). The apostle pronounces the verdict over every such tribunal: *Ye have condemned and killed the just; and he doth not resist you* (James 5:6). This is the very pattern judged in Susanna, where the wicked elders *came also full of mischievous imagination against Susanna to put her to death* (The History of Susanna 1:28) — and the righteous one is vindicated when *all the assembly cried out with a loud voice, and praised Yahuah (God), who saves them that trust in him* (The History of Susanna 1:60). The condemnation is real; so is the deliverance.',
       sv.verse_id, ev.verse_id, 'extras', 58028
  FROM _session253_wis02_lookup sv, _session253_wis02_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=2 AND sv.verse_number=19
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=2 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-2-let-us-eat-and-drink',
       E'Let us eat and drink, for to morrow we die — the creed of those who deny the resurrection',
       E'Because they say *after our end there is no returning: for it is fast sealed, so that no man comes again* (Wisdom of Solomon 2:5), the ungodly conclude: *Come on therefore, let us enjoy the good things that are present: and let us speedily use the creatures like as in youth* (Wisdom of Solomon 2:6); *Let none of us go without his part of our voluptuousness... for this is our portion, and our lot is this* (Wisdom of Solomon 2:9). It ain''t new — this is the carousing the prophet condemned: *let us eat and drink; for to morrow we shall die* (Isaiah 22:13). The apostle quotes the same creed as the fruit of denying the resurrection — *if the dead rise not? let us eat and drink; for to morrow we die* (1 Corinthians 15:32) — and the Master casts it as the rich fool''s soul-talk, *Soul, thou hast much goods laid up for many years; take thine ease, eat, drink, and be merry* (Luke 12:19). The denial of the world to come always ends at the same table.',
       sv.verse_id, ev.verse_id, 'extras', 58031
  FROM _session253_wis02_lookup sv, _session253_wis02_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=2 AND sv.verse_number=6
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=2 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-2-oppress-the-poor-righteous',
       E'Let us oppress the poor righteous man — strength made the law of justice',
       E'The ungodly enthrone might over right: *Let us oppress the poor righteous man, let us not spare the widow, nor reverence the ancient gray hairs of the aged* (Wisdom of Solomon 2:10); *Let our strength be the law of justice: for that which is feeble is found to be nothing worth* (Wisdom of Solomon 2:11). This is the very oppression Yahuah swore to judge: *because they sold the righteous for silver, and the poor for a pair of shoes; That pant after the dust of the earth on the head of the poor, and turn aside the way of the meek* (Amos 2:6-7). And it ends where chapter 2 began — in the condemned just one: *Ye have condemned and killed the just; and he doth not resist you* (James 5:6). Torah stands: it is the widow, the poor, and the aged whom the covenant defends.',
       sv.verse_id, ev.verse_id, 'extras', 58034
  FROM _session253_wis02_lookup sv, _session253_wis02_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=2 AND sv.verse_number=10
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=2 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-2-immortal-image-envy-of-devil',
       E'Yahuah created man immortal, the image of his eternity — death by envy of the devil',
       E'The chapter closes by exposing the lie under the ungodly''s despair: *For Yahuah (God) created man to be immortal, and made him to be an image of his own eternity* (Wisdom of Solomon 2:23); *Nevertheless through envy of the devil came death into the world: and they that do hold of his side do find it* (Wisdom of Solomon 2:24). It ain''t new — this is Eden read straight. Man bears the divine image: *So Elohim (God) created man in his own image, in the image of Elohim (God) created he him* (Genesis 1:27). The devil''s envy and lie brought death — *And the serpent said unto the woman, Ye shall not surely die* (Genesis 3:4) — for *He was a murderer from the beginning, and abode not in the truth* (John 8:44). The apostle states it plainly: *as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned* (Romans 5:12). And the contrary portion stands — *But the souls of the righteous are in the hand of Yahuah (God), and there shall no torment touch them* (Wisdom of Solomon 3:1).',
       sv.verse_id, ev.verse_id, 'extras', 58037
  FROM _session253_wis02_lookup sv, _session253_wis02_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=2 AND sv.verse_number=23
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=2 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: wisdom-2-suffering-righteous-passion
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 27:43 — *He trusted in Elohim (God); let him deliver him now, if he will have him: for he said, I am the Son of Elohim (God).* The mockers at the cross speak the ungodly''s reasoning of Wisdom of Solomon 2:13 almost word for word — the righteous one who calls himself the child of Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session253_wis02_lookup sv, _session253_wis02_lookup tv
 WHERE t.slug='wisdom-2-suffering-righteous-passion'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=2 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=27 AND tv.verse_number=43
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 22:8 — *He trusted on Yahuah (LORD) that he would deliver him: let him deliver him, seeing he delighted in him.* The taunt ''if the just man be the son of Yahuah, he will help him'' of Wisdom of Solomon 2:18 is the psalmist''s scornful ''let him deliver him.'''
  FROM cross_reference_threads t, cross_references x, _session253_wis02_lookup sv, _session253_wis02_lookup tv
 WHERE t.slug='wisdom-2-suffering-righteous-passion'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=2 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=22 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 19:7 — *The Yahudim (Jews) answered him, We have a law, and by our law he ought to die, because he made himself the Son of Elohim (God).* The shameful-death verdict of Wisdom of Solomon 2:20 is pressed on the exact ground that he made himself the Son of Elohim.'
  FROM cross_reference_threads t, cross_references x, _session253_wis02_lookup sv, _session253_wis02_lookup tv
 WHERE t.slug='wisdom-2-suffering-righteous-passion'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=2 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=19 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 53:7 — *He was oppressed, and he was afflicted, yet he opened not his mouth: he is brought as a lamb to the slaughter, and as a sheep before her shearers is dumb, so he openeth not his mouth.* The despite, torture, and meekness tested in Wisdom of Solomon 2:19 is the silent Lamb of Isaiah''s suffering servant.'
  FROM cross_reference_threads t, cross_references x, _session253_wis02_lookup sv, _session253_wis02_lookup tv
 WHERE t.slug='wisdom-2-suffering-righteous-passion'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=2 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Isaiah 3:10 — *Say ye to the righteous, that it shall be well with him: for they shall eat the fruit of their doings.* The ungodly''s lying-in-wait for the righteous in Wisdom of Solomon 2:12 inverts the prophet''s promise that it shall be well with the just.'
  FROM cross_reference_threads t, cross_references x, _session253_wis02_lookup sv, _session253_wis02_lookup tv
 WHERE t.slug='wisdom-2-suffering-righteous-passion'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=2 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=3 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-2-the-falsely-condemned-just
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'James 5:6 — *Ye have condemned and killed the just; and he doth not resist you.* James names the very crime the ungodly plot in Wisdom of Solomon 2:20 — condemning the unresisting righteous one to death.'
  FROM cross_reference_threads t, cross_references x, _session253_wis02_lookup sv, _session253_wis02_lookup tv
 WHERE t.slug='wisdom-2-the-falsely-condemned-just'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=2 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=5 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'The History of Susanna 1:28 — *And it came to pass the next day, when the people were assembled to her husband Joacim, the two elders came also full of mischievous imagination against Susanna to put her to death.* Susanna''s accusers act out the despiteful examination of the righteous in Wisdom of Solomon 2:19.'
  FROM cross_reference_threads t, cross_references x, _session253_wis02_lookup sv, _session253_wis02_lookup tv
 WHERE t.slug='wisdom-2-the-falsely-condemned-just'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=2 AND sv.verse_number=19
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-history-of-susanna' AND tv.chapter_number=1 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'The History of Susanna 1:60 — *With that all the assembly cried out with a loud voice, and praised Yahuah (God), who saves them that trust in him.* Susanna''s deliverance answers the ungodly''s wager in Wisdom of Solomon 2:18 — the just man''s Elohim does help him.'
  FROM cross_reference_threads t, cross_references x, _session253_wis02_lookup sv, _session253_wis02_lookup tv
 WHERE t.slug='wisdom-2-the-falsely-condemned-just'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=2 AND sv.verse_number=18
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-history-of-susanna' AND tv.chapter_number=1 AND tv.verse_number=60
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-2-let-us-eat-and-drink
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 22:13 — *And behold joy and gladness, slaying oxen, and killing sheep, eating flesh, and drinking wine: let us eat and drink; for to morrow we shall die.* The ''let us enjoy the good things that are present'' of Wisdom of Solomon 2:6 is the very feast the prophet rebukes.'
  FROM cross_reference_threads t, cross_references x, _session253_wis02_lookup sv, _session253_wis02_lookup tv
 WHERE t.slug='wisdom-2-let-us-eat-and-drink'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=2 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=22 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Corinthians 15:32 — *If after the manner of men I have fought with beasts at Ephesus, what advantageth it me, if the dead rise not? let us eat and drink; for to morrow we die.* Paul ties this creed to denying the resurrection — exactly the ''no returning'' reasoning behind Wisdom of Solomon 2:6.'
  FROM cross_reference_threads t, cross_references x, _session253_wis02_lookup sv, _session253_wis02_lookup tv
 WHERE t.slug='wisdom-2-let-us-eat-and-drink'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=2 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Luke 12:19 — *And I will say to my soul, Soul, thou hast much goods laid up for many years; take thine ease, eat, drink, and be merry.* The rich fool''s portion echoes ''this is our portion, and our lot is this'' of Wisdom of Solomon 2:9.'
  FROM cross_reference_threads t, cross_references x, _session253_wis02_lookup sv, _session253_wis02_lookup tv
 WHERE t.slug='wisdom-2-let-us-eat-and-drink'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=2 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=12 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-2-oppress-the-poor-righteous
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Amos 2:6 — *Thus saith Yahuah (LORD); For three transgressions of Yashar''el (Israel), and for four, I will not turn away the punishment thereof; because they sold the righteous for silver, and the poor for a pair of shoes.* The oppression of the poor righteous man in Wisdom of Solomon 2:10 is the sin Yahuah swears to judge.'
  FROM cross_reference_threads t, cross_references x, _session253_wis02_lookup sv, _session253_wis02_lookup tv
 WHERE t.slug='wisdom-2-oppress-the-poor-righteous'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=2 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=2 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Amos 2:7 — *That pant after the dust of the earth on the head of the poor, and turn aside the way of the meek: and a man and his father will go in unto the same maid, to profane my holy name.* The trampling of the poor and the meek answers the unsparing cruelty of Wisdom of Solomon 2:10.'
  FROM cross_reference_threads t, cross_references x, _session253_wis02_lookup sv, _session253_wis02_lookup tv
 WHERE t.slug='wisdom-2-oppress-the-poor-righteous'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=2 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'James 5:6 — *Ye have condemned and killed the just; and he doth not resist you.* Making strength ''the law of justice'' in Wisdom of Solomon 2:11 ends in the condemned and unresisting just one of James.'
  FROM cross_reference_threads t, cross_references x, _session253_wis02_lookup sv, _session253_wis02_lookup tv
 WHERE t.slug='wisdom-2-oppress-the-poor-righteous'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=2 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=5 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-2-immortal-image-envy-of-devil
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:27 — *So Elohim (God) created man in his own image, in the image of Elohim (God) created he him; male and female created he them.* The man made ''an image of his own eternity'' in Wisdom of Solomon 2:23 is the image of Elohim in the creation account.'
  FROM cross_reference_threads t, cross_references x, _session253_wis02_lookup sv, _session253_wis02_lookup tv
 WHERE t.slug='wisdom-2-immortal-image-envy-of-devil'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=2 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:4 — *And the serpent said unto the woman, Ye shall not surely die.* The ''envy of the devil'' that brought death in Wisdom of Solomon 2:24 is the serpent''s lie that began it.'
  FROM cross_reference_threads t, cross_references x, _session253_wis02_lookup sv, _session253_wis02_lookup tv
 WHERE t.slug='wisdom-2-immortal-image-envy-of-devil'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=2 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him.* The devil who brought death by envy in Wisdom of Solomon 2:24 is the murderer and liar from the beginning.'
  FROM cross_reference_threads t, cross_references x, _session253_wis02_lookup sv, _session253_wis02_lookup tv
 WHERE t.slug='wisdom-2-immortal-image-envy-of-devil'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=2 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 5:12 — *Wherefore, as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned.* Paul''s account of death entering the world matches ''through envy of the devil came death into the world'' of Wisdom of Solomon 2:24.'
  FROM cross_reference_threads t, cross_references x, _session253_wis02_lookup sv, _session253_wis02_lookup tv
 WHERE t.slug='wisdom-2-immortal-image-envy-of-devil'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=2 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=5 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'The Wisdom of Solomon 3:1 — *But the souls of the righteous are in the hand of Yahuah (God), and there shall no torment touch them.* The immortality for which man was created in Wisdom of Solomon 2:23 is secured for the righteous in the next chapter''s hope.'
  FROM cross_reference_threads t, cross_references x, _session253_wis02_lookup sv, _session253_wis02_lookup tv
 WHERE t.slug='wisdom-2-immortal-image-envy-of-devil'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=2 AND sv.verse_number=23
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=3 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_thewisdomofsolomon_03.sql (session253 the-wisdom-of-solomon 3) -----
-- Source anchor: apocrypha/the-wisdom-of-solomon ch3. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: wis03 (view _session253_wis03_lookup). Sort band base 58050, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_wis03_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: wisdom-of-solomon-3-souls-in-the-hand-of-elohim
  ('apocrypha', 'the-wisdom-of-solomon', 3, 1, 'canon', 'revelation', 6, 9, 'free', E'Revelation 6:9 — *And when he had opened the fifth seal, I saw under the altar the souls of them that were slain for the word of Elohim (God), and for the testimony which they held:* the souls held in Elohim''s hand in Wisdom of Solomon 3:1 are the souls John sees under the altar, kept and awaiting their vindication.'),
  ('apocrypha', 'the-wisdom-of-solomon', 3, 3, 'canon', 'revelation', 14, 13, 'free', E'Revelation 14:13 — *And I heard a voice from heaven saying unto me, Write, Blessed are the dead which die in Yahuah (Lord) from henceforth: Yea, saith the Spirit, that they may rest from their labours; and their works do follow them.* What the unwise call destruction Wisdom of Solomon 3:3 calls peace, and heaven calls the faithful dead blessed and at rest.'),
  ('apocrypha', 'the-wisdom-of-solomon', 3, 1, 'enoch', '1-enoch', 103, 4, 'extras', E'1 Enoch 103:4 — *And the righteous shall be victorious in the name of Yahuah (God) of Spirits: And He will cause His light to appear on them, And He will make peace for them.* The watcher-book and Wisdom of Solomon 3:1 speak one tongue: the righteous souls are kept, lit, and given peace in Yahuah''s hand.'),
  -- thread: wisdom-of-solomon-3-tried-as-gold-in-the-furnace
  ('apocrypha', 'the-wisdom-of-solomon', 3, 6, 'canon', 'malachi', 3, 3, 'free', E'Malachi 3:3 — *And he shall sit as a refiner and purifier of silver: and he shall purify the sons of Levi, and purge them as gold and silver, that they may offer unto Yahuah (LORD) an offering in righteousness.* The gold tried in the furnace of Wisdom of Solomon 3:6 is the same refining by which Yahuah purges His own that they may be offered in righteousness.'),
  ('apocrypha', 'the-wisdom-of-solomon', 3, 6, 'apocrypha', 'ecclesiasticus', 2, 5, 'extras', E'Ecclesiasticus 2:5 — *For gold is tried in the fire, and acceptable men in the furnace of adversity.* Ben Sira''s proverb is Wisdom of Solomon 3:6 in miniature: the acceptable are assayed like gold in the furnace and found worthy for Elohim.'),
  -- thread: wisdom-of-solomon-3-they-shall-shine-and-judge-the-nations
  ('apocrypha', 'the-wisdom-of-solomon', 3, 7, 'canon', 'daniel', 12, 3, 'free', E'Daniel 12:3 — *And they that be wise shall shine as the brightness of the firmament; and they that turn many to righteousness as the stars for ever and ever.* The shining at the visitation in Wisdom of Solomon 3:7 is Daniel''s wise rising from the dust to shine as the firmament.'),
  ('apocrypha', 'the-wisdom-of-solomon', 3, 8, 'canon', 'matthew', 19, 28, 'free', E'Matthew 19:28 — *And Yahusha (Jesus) said unto them, Verily I say unto you, That ye which have followed me, in the regeneration when the Son of Adam shall sit in the throne of his glory, ye also shall sit upon twelve thrones, judging the twelve tribes of Yashar''el (Israel).* That the righteous shall judge the nations in Wisdom of Solomon 3:8 the Messiah seats on twelve thrones in the regeneration.'),
  -- thread: wisdom-of-solomon-3-faithful-in-love-shall-abide
  ('apocrypha', 'the-wisdom-of-solomon', 3, 9, 'apocrypha', '2-maccabees', 7, 9, 'extras', E'2 Maccabees 7:9 — *And when he was at the last gasp, he said, You like a fury takest us out of this present life, but the King of the world shall raise us up, who have died for his laws, to everlasting life.* The saints who abide with Him in Wisdom of Solomon 3:9 are the Torah-faithful martyrs whom the King of the world raises to everlasting life.'),
  ('apocrypha', 'the-wisdom-of-solomon', 3, 10, 'apocrypha', '2-maccabees', 7, 14, 'extras', E'2 Maccabees 7:14 — *So when he was ready to die he said thus, It is good, being put to death by men, to look for hope from Yahuah (God) to be raised up again by him: as for you, you shall have no resurrection to life.* The two destinies of Wisdom of Solomon 3:9-10 are the martyr''s own: resurrection-life for the faithful, no resurrection for those who forsook Yahuah.'),
  -- thread: wisdom-of-solomon-3-the-barren-and-the-eunuch-blessed
  ('apocrypha', 'the-wisdom-of-solomon', 3, 14, 'canon', 'isaiah', 56, 5, 'free', E'Isaiah 56:5 — *Even unto them will I give in mine house and within my walls a place and a name better than of sons and of daughters: I will give them an everlasting name, that shall not be cut off.* The eunuch''s inheritance in the temple of Yahuah in Wisdom of Solomon 3:14 is Isaiah''s place and name better than sons, an everlasting name that shall not be cut off.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_wis03_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_wis03_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-of-solomon-3-souls-in-the-hand-of-elohim',
       E'The souls of the righteous in the hand of Elohim',
       E'*But the souls of the righteous are in the hand of Yahuah (God), and there shall no torment touch them.* (Wisdom of Solomon 3:1) — *In the sight of the unwise they seemed to die: and their departure is taken for misery,* (Wisdom of Solomon 3:2) *And their going from us to be utter destruction: but they are in peace.* (Wisdom of Solomon 3:3). It ain''t new: the seer of the seals sees these very souls — *I saw under the altar the souls of them that were slain for the word of Elohim (God), and for the testimony which they held* (Revelation 6:9), and a voice from heaven seals it, *Blessed are the dead which die in Yahuah (Lord) from henceforth... that they may rest from their labours* (Revelation 14:13). And the restored watcher-book already named their portion: *the righteous shall be victorious in the name of Yahuah (God) of Spirits: And He will cause His light to appear on them, And He will make peace for them* (1 Enoch 103:4). The grave is not destruction but peace; the hand that holds them is Yahuah''s own.',
       sv.verse_id, ev.verse_id, 'extras', 58050
  FROM _session253_wis03_lookup sv, _session253_wis03_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=3 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=3 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-of-solomon-3-tried-as-gold-in-the-furnace',
       E'Tried as gold in the furnace, received as a burnt offering',
       E'*And having been a little chastised, they shall be greatly rewarded: for Yahuah (God) proved them, and found them worthy for himself.* (Wisdom of Solomon 3:5) *As gold in the furnace has he tried them, and received them as a burnt offering.* (Wisdom of Solomon 3:6). The chastening is not the curse of the law but the refiner''s love. Malachi saw the same fire: *And he shall sit as a refiner and purifier of silver: and he shall purify the sons of Levi, and purge them as gold and silver, that they may offer unto Yahuah (LORD) an offering in righteousness* (Malachi 3:3). And ben Sira, in the very next room of the library, sets the proverb beside it: *For gold is tried in the fire, and acceptable men in the furnace of adversity* (Ecclesiasticus 2:5). The furnace is not destruction; it is the assaying of the elect, who come out as gold and go up as a whole burnt offering pleasing to Elohim.',
       sv.verse_id, ev.verse_id, 'extras', 58053
  FROM _session253_wis03_lookup sv, _session253_wis03_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=3 AND sv.verse_number=5
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=3 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-of-solomon-3-they-shall-shine-and-judge-the-nations',
       E'In their visitation they shall shine and judge the nations',
       E'*And in the time of their visitation they shall shine, and run to and fro like sparks among the stubble.* (Wisdom of Solomon 3:7) *They shall judge the nations, and have dominion over the people, and their Elohim (God) shall reign for ever.* (Wisdom of Solomon 3:8). This is the resurrection-glory and the rule of the saints. Daniel saw the shining: *And many of them that sleep in the dust of the earth shall awake, some to everlasting life... And they that be wise shall shine as the brightness of the firmament* (Daniel 12:2-3). And the Messiah promised the dominion: *That ye which have followed me, in the regeneration when the Son of Adam shall sit in the throne of his glory, ye also shall sit upon twelve thrones, judging the twelve tribes of Yashar''el (Israel)* (Matthew 19:28). The righteous do not merely escape death — they wake, they shine, and they reign with their Elohim who reigns for ever.',
       sv.verse_id, ev.verse_id, 'extras', 58056
  FROM _session253_wis03_lookup sv, _session253_wis03_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=3 AND sv.verse_number=7
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=3 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-of-solomon-3-faithful-in-love-shall-abide',
       E'The faithful in love abide with Him; the ungodly forsake Yahuah',
       E'*They that put their trust in him shall understand the truth: and such as be faithful in love shall abide with him: for grace and mercy is to his saints, and he has care for his elect.* (Wisdom of Solomon 3:9) — set against *But the ungodly shall be punished according to their own imaginations, which have neglected the righteous, and forsaken Yahuah (God).* (Wisdom of Solomon 3:10). Election is not a church replacing Israel but Yahuah''s care for His elect who keep faith. The martyr-mother''s sons confessed the same hope under torture: *the King of the world shall raise us up, who have died for his laws, to everlasting life* (2 Maccabees 7:9), and *to look for hope from Yahuah (God) to be raised up again by him: as for you, you shall have no resurrection to life* (2 Maccabees 7:14) — the very two ends Wisdom sets side by side, abiding with Him or punished for forsaking Him.',
       sv.verse_id, ev.verse_id, 'extras', 58059
  FROM _session253_wis03_lookup sv, _session253_wis03_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=3 AND sv.verse_number=9
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=3 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-of-solomon-3-the-barren-and-the-eunuch-blessed',
       E'Blessed the barren and the eunuch who keep the covenant',
       E'*Wherefore blessed is the barren that is undefiled, which has not known the sinful bed: she shall have fruit in the visitation of souls.* (Wisdom of Solomon 3:13) *And blessed is the eunuch, which with his hands has wrought no iniquity, nor imagined wicked things against Yahuah (God): for to him shall be given the special gift of faith, and an inheritance in the temple of Yahuah (God) more acceptable to his mind.* (Wisdom of Solomon 3:14). It ain''t new: Isaiah had already overturned the reproach of the dry tree — *Even unto them will I give in mine house and within my walls a place and a name better than of sons and of daughters: I will give them an everlasting name, that shall not be cut off* (Isaiah 56:5). Fruitfulness is reckoned not by the bed but by faithfulness; the covenant-keeper, childless by men, is given an inheritance in Yahuah''s house and an everlasting name.',
       sv.verse_id, ev.verse_id, 'extras', 58062
  FROM _session253_wis03_lookup sv, _session253_wis03_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=3 AND sv.verse_number=13
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=3 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: wisdom-of-solomon-3-souls-in-the-hand-of-elohim
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 6:9 — *And when he had opened the fifth seal, I saw under the altar the souls of them that were slain for the word of Elohim (God), and for the testimony which they held:* the souls held in Elohim''s hand in Wisdom of Solomon 3:1 are the souls John sees under the altar, kept and awaiting their vindication.'
  FROM cross_reference_threads t, cross_references x, _session253_wis03_lookup sv, _session253_wis03_lookup tv
 WHERE t.slug='wisdom-of-solomon-3-souls-in-the-hand-of-elohim'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=3 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=6 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 14:13 — *And I heard a voice from heaven saying unto me, Write, Blessed are the dead which die in Yahuah (Lord) from henceforth: Yea, saith the Spirit, that they may rest from their labours; and their works do follow them.* What the unwise call destruction Wisdom of Solomon 3:3 calls peace, and heaven calls the faithful dead blessed and at rest.'
  FROM cross_reference_threads t, cross_references x, _session253_wis03_lookup sv, _session253_wis03_lookup tv
 WHERE t.slug='wisdom-of-solomon-3-souls-in-the-hand-of-elohim'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=3 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=14 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 103:4 — *And the righteous shall be victorious in the name of Yahuah (God) of Spirits: And He will cause His light to appear on them, And He will make peace for them.* The watcher-book and Wisdom of Solomon 3:1 speak one tongue: the righteous souls are kept, lit, and given peace in Yahuah''s hand.'
  FROM cross_reference_threads t, cross_references x, _session253_wis03_lookup sv, _session253_wis03_lookup tv
 WHERE t.slug='wisdom-of-solomon-3-souls-in-the-hand-of-elohim'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=3 AND sv.verse_number=1
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=103 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-of-solomon-3-tried-as-gold-in-the-furnace
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Malachi 3:3 — *And he shall sit as a refiner and purifier of silver: and he shall purify the sons of Levi, and purge them as gold and silver, that they may offer unto Yahuah (LORD) an offering in righteousness.* The gold tried in the furnace of Wisdom of Solomon 3:6 is the same refining by which Yahuah purges His own that they may be offered in righteousness.'
  FROM cross_reference_threads t, cross_references x, _session253_wis03_lookup sv, _session253_wis03_lookup tv
 WHERE t.slug='wisdom-of-solomon-3-tried-as-gold-in-the-furnace'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=3 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=3 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ecclesiasticus 2:5 — *For gold is tried in the fire, and acceptable men in the furnace of adversity.* Ben Sira''s proverb is Wisdom of Solomon 3:6 in miniature: the acceptable are assayed like gold in the furnace and found worthy for Elohim.'
  FROM cross_reference_threads t, cross_references x, _session253_wis03_lookup sv, _session253_wis03_lookup tv
 WHERE t.slug='wisdom-of-solomon-3-tried-as-gold-in-the-furnace'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=3 AND sv.verse_number=6
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=2 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-of-solomon-3-they-shall-shine-and-judge-the-nations
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 12:3 — *And they that be wise shall shine as the brightness of the firmament; and they that turn many to righteousness as the stars for ever and ever.* The shining at the visitation in Wisdom of Solomon 3:7 is Daniel''s wise rising from the dust to shine as the firmament.'
  FROM cross_reference_threads t, cross_references x, _session253_wis03_lookup sv, _session253_wis03_lookup tv
 WHERE t.slug='wisdom-of-solomon-3-they-shall-shine-and-judge-the-nations'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=3 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 19:28 — *And Yahusha (Jesus) said unto them, Verily I say unto you, That ye which have followed me, in the regeneration when the Son of Adam shall sit in the throne of his glory, ye also shall sit upon twelve thrones, judging the twelve tribes of Yashar''el (Israel).* That the righteous shall judge the nations in Wisdom of Solomon 3:8 the Messiah seats on twelve thrones in the regeneration.'
  FROM cross_reference_threads t, cross_references x, _session253_wis03_lookup sv, _session253_wis03_lookup tv
 WHERE t.slug='wisdom-of-solomon-3-they-shall-shine-and-judge-the-nations'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=3 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=19 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-of-solomon-3-faithful-in-love-shall-abide
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Maccabees 7:9 — *And when he was at the last gasp, he said, You like a fury takest us out of this present life, but the King of the world shall raise us up, who have died for his laws, to everlasting life.* The saints who abide with Him in Wisdom of Solomon 3:9 are the Torah-faithful martyrs whom the King of the world raises to everlasting life.'
  FROM cross_reference_threads t, cross_references x, _session253_wis03_lookup sv, _session253_wis03_lookup tv
 WHERE t.slug='wisdom-of-solomon-3-faithful-in-love-shall-abide'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=3 AND sv.verse_number=9
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Maccabees 7:14 — *So when he was ready to die he said thus, It is good, being put to death by men, to look for hope from Yahuah (God) to be raised up again by him: as for you, you shall have no resurrection to life.* The two destinies of Wisdom of Solomon 3:9-10 are the martyr''s own: resurrection-life for the faithful, no resurrection for those who forsook Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session253_wis03_lookup sv, _session253_wis03_lookup tv
 WHERE t.slug='wisdom-of-solomon-3-faithful-in-love-shall-abide'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=3 AND sv.verse_number=10
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=7 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-of-solomon-3-the-barren-and-the-eunuch-blessed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 56:5 — *Even unto them will I give in mine house and within my walls a place and a name better than of sons and of daughters: I will give them an everlasting name, that shall not be cut off.* The eunuch''s inheritance in the temple of Yahuah in Wisdom of Solomon 3:14 is Isaiah''s place and name better than sons, an everlasting name that shall not be cut off.'
  FROM cross_reference_threads t, cross_references x, _session253_wis03_lookup sv, _session253_wis03_lookup tv
 WHERE t.slug='wisdom-of-solomon-3-the-barren-and-the-eunuch-blessed'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=3 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=56 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_thewisdomofsolomon_04.sql (session253 the-wisdom-of-solomon 4) -----
-- Source anchor: apocrypha/the-wisdom-of-solomon ch4. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: wis04 (view _session253_wis04_lookup). Sort band base 58075, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_wis04_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: wisdom-of-solomon-4-righteous-taken-into-rest
  ('apocrypha', 'the-wisdom-of-solomon', 4, 7, 'canon', 'isaiah', 57, 1, 'free', E'Isaiah 57:1 — *The righteous perisheth, and no man layeth it to heart: and merciful men are taken away, none considering that the righteous is taken away from the evil to come.* The prophet''s reason for the early death of the just — taken from the evil to come — is exactly the rest Wisdom of Solomon 4:7 promises the one prevented with death.'),
  ('apocrypha', 'the-wisdom-of-solomon', 4, 7, 'canon', 'isaiah', 57, 2, 'free', E'Isaiah 57:2 — *He shall enter into peace: they shall rest in their beds, each one walking in his uprightness.* The rest into which the early-taken righteous enters in Isaiah is the same rest Wisdom of Solomon 4:7 names for him.'),
  ('apocrypha', 'the-wisdom-of-solomon', 4, 7, 'canon', 'psalms', 37, 37, 'free', E'Psalm 37:37 — *Mark the perfect man, and behold the upright: for the end of that man is peace.* The Psalmist''s verdict that the perfect man''s end is peace underwrites Wisdom of Solomon 4:7''s claim that the righteous, though dead, is in rest.'),
  -- thread: wisdom-of-solomon-4-pleased-god-and-translated-enoch
  ('apocrypha', 'the-wisdom-of-solomon', 4, 10, 'canon', 'genesis', 5, 24, 'free', E'Genesis 5:24 — *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him.* The man who pleased Yahuah and was translated in Wisdom of Solomon 4:10 is Enoch, whom Genesis says walked with Elohim and was taken.'),
  ('apocrypha', 'the-wisdom-of-solomon', 4, 10, 'canon', 'hebrews', 11, 5, 'free', E'Hebrews 11:5 — *By faith Enoch was translated that he should not see death; and was not found, because Elohim (God) had translated him: for before his translation he had this testimony, that he pleased Elohim (God).* Hebrews uses Wisdom of Solomon 4:10''s very word — pleased — and verb — translated — of Enoch''s taking.'),
  ('apocrypha', 'the-wisdom-of-solomon', 4, 11, 'apocrypha', 'ecclesiasticus', 44, 16, 'extras', E'Ecclesiasticus 44:16 — *Enoch pleased Yahuah (God), and was translated, being an example of repentance to all generations.* Sirach''s catalogue of the fathers describes the same pleasing-and-translation that Wisdom of Solomon 4:11 calls being speedily taken away.'),
  ('apocrypha', 'the-wisdom-of-solomon', 4, 11, 'jubilees', 'jubilees', 4, 23, 'extras', E'The Book of Jubilees 4:23 — *And he was taken from amongst the children of men, and we conducted him into the Garden of Eden in majesty and honour, and behold there he writes down the condemnation and judgment of the world, and all the wickedness of the children of men.* Jubilees narrates the very taking-away from among men that Wisdom of Solomon 4:11 says spared Enoch from wickedness.'),
  -- thread: wisdom-of-solomon-4-memorial-of-virtue-immortal
  ('apocrypha', 'the-wisdom-of-solomon', 4, 1, 'canon', 'proverbs', 10, 7, 'free', E'Proverbs 10:7 — *The memory of the just is blessed: but the name of the wicked shall rot.* The Proverb''s blessed memory of the just is precisely the immortal memorial of virtue that Wisdom of Solomon 4:1 prizes above children.'),
  -- thread: wisdom-of-solomon-4-ungodly-brood-rooted-out
  ('apocrypha', 'the-wisdom-of-solomon', 4, 4, 'canon', 'psalms', 1, 4, 'free', E'Psalm 1:4 — *The ungodly are not so: but are like the chaff which the wind driveth away.* The wind that drives away the chaff in the Psalm is the same wind that roots out the ungodly''s branches in Wisdom of Solomon 4:4.'),
  ('apocrypha', 'the-wisdom-of-solomon', 4, 3, 'canon', 'psalms', 1, 3, 'free', E'Psalm 1:3 — *And he shall be like a tree planted by the rivers of water, that bringeth forth his fruit in his season; his leaf also shall not wither; and whatsoever he doeth shall prosper.* The deep-rooted, fruitful tree of the Psalm is the foil to the bastard slips that take no deep rooting in Wisdom of Solomon 4:3.'),
  ('apocrypha', 'the-wisdom-of-solomon', 4, 5, 'canon', 'matthew', 13, 40, 'free', E'Matthew 13:40 — *As therefore the tares are gathered and burned in the fire; so shall it be in the end of this world.* The Messiah''s harvest of the tares brings to its end the imperfect, unprofitable branches that Wisdom of Solomon 4:5 says are broken off and meet for nothing.'),
  -- thread: wisdom-of-solomon-4-righteous-dead-condemns-ungodly
  ('apocrypha', 'the-wisdom-of-solomon', 4, 18, 'canon', 'psalms', 2, 4, 'free', E'Psalm 2:4 — *He that sitteth in the heavens shall laugh: Yahuah (Lord) shall have them in derision.* The enthroned Yahuah''s derisive laughter in the Psalm is the very laugh-to-scorn that Wisdom of Solomon 4:18 turns on the ungodly who despised the righteous.'),
  ('apocrypha', 'the-wisdom-of-solomon', 4, 16, 'apocrypha', 'the-wisdom-of-solomon', 5, 3, 'extras', E'The Wisdom of Solomon 5:3 — *And they repenting and groaning for anguish of spirit shall say within themselves, This was he, whom we had sometimes in derision, and a proverb of reproach.* The next chapter voices the too-late confession of the ungodly whom the righteous dead condemns in Wisdom of Solomon 4:16.'),
  ('apocrypha', 'the-wisdom-of-solomon', 4, 16, 'apocrypha', 'the-wisdom-of-solomon', 5, 4, 'extras', E'The Wisdom of Solomon 5:4 — *We fools accounted his life madness, and his end to be without honour.* The ungodly''s confession that they misjudged the righteous man''s end completes the condemnation Wisdom of Solomon 4:16 says the righteous dead pronounces over them.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_wis04_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_wis04_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-of-solomon-4-righteous-taken-into-rest',
       E'Though prevented with death, yet in rest',
       E'The Wisdom of Solomon turns the world''s reckoning upside down: *But though the righteous be prevented with death, yet shall he be in rest* (Wisdom of Solomon 4:7). The just one cut off early is not robbed but spared — he enters peace. This is the very word of the prophet, who marvels that no one perceives the mercy in the early grave: *The righteous perisheth, and no man layeth it to heart: and merciful men are taken away, none considering that the righteous is taken away from the evil to come* (Isaiah 57:1), and what follows is rest, not ruin — *He shall enter into peace: they shall rest in their beds, each one walking in his uprightness* (Isaiah 57:2). The Psalmist seals the same end: *Mark the perfect man, and behold the upright: for the end of that man is peace* (Psalm 37:37). It ain''t new — the deuterocanon carries the Tanakh''s own comfort: the righteous gathered early is gathered into Yahuah''s rest, away from the evil to come.',
       sv.verse_id, ev.verse_id, 'extras', 58075
  FROM _session253_wis04_lookup sv, _session253_wis04_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=4 AND sv.verse_number=7
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=4 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-of-solomon-4-pleased-god-and-translated-enoch',
       E'He pleased Yahuah and was translated — Enoch',
       E'*He pleased Yahuah (God), and was beloved of him: so that living among sinners he was translated. Yea speedily was he taken away, lest that wickedness should alter his understanding, or deceit beguile his soul* (Wisdom of Solomon 4:10-11). The portrait is unmistakable: this is Enoch, the man who pleased Elohim and was taken. Genesis tells it bare: *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him* (Genesis 5:24). The Letter to the Hebrews names the same testimony in the same words Wisdom of Solomon uses — *pleased* — *By faith Enoch was translated that he should not see death; and was not found, because Elohim (God) had translated him: for before his translation he had this testimony, that he pleased Elohim (God)* (Hebrews 11:5). The restored editions hold the same witness: Sirach remembers that *Enoch pleased Yahuah (God), and was translated, being an example of repentance to all generations* (Ecclesiasticus 44:16), and Jubilees records the taking — *And he was taken from amongst the children of men, and we conducted him into the Garden of Eden in majesty and honour* (The Book of Jubilees 4:23). It ain''t new: the translation of Enoch is the deuterocanon''s plain reading of why a righteous man is taken early.',
       sv.verse_id, ev.verse_id, 'extras', 58078
  FROM _session253_wis04_lookup sv, _session253_wis04_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=4 AND sv.verse_number=10
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=4 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-of-solomon-4-memorial-of-virtue-immortal',
       E'The memorial of virtue is immortal',
       E'Against the world''s measure of legacy by offspring, the Wisdom of Solomon sets virtue: *Better it is to have no children, and to have virtue: for the memorial thereof is immortal: because it is known with Yahuah (God), and with men* (Wisdom of Solomon 4:1). And the memorial endures in triumph — *When it is present, men take example at it; and when it is gone, they desire it: it wears a crown, and triumpheth for ever, having gotten the victory, striving for undefiled rewards* (Wisdom of Solomon 4:2). The Proverb says the same in a breath: *The memory of the just is blessed: but the name of the wicked shall rot* (Proverbs 10:7). It ain''t new — Solomon''s own Proverb already declared that it is the just man''s remembrance, not his progeny, that abides; the deuterocanon only unfolds it.',
       sv.verse_id, ev.verse_id, 'extras', 58081
  FROM _session253_wis04_lookup sv, _session253_wis04_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=4 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=4 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-of-solomon-4-ungodly-brood-rooted-out',
       E'The bastard slips rooted out by the wind',
       E'The Wisdom of Solomon denies the ungodly the endurance the world assumes their many children buy them: *But the multiplying brood of the ungodly shall not thrive, nor take deep rooting from bastard slips, nor lay any fast foundation* (Wisdom of Solomon 4:3), *For though they flourish in branches for a time; yet standing not last, they shall be shaken with the wind, and through the force of winds they shall be rooted out* (Wisdom of Solomon 4:4). This is the Psalter''s first contrast: the righteous is the rooted tree, but *The ungodly are not so: but are like the chaff which the wind driveth away* (Psalm 1:4) — over against the just man who *shall be like a tree planted by the rivers of water, that bringeth forth his fruit in his season; his leaf also shall not wither* (Psalm 1:3). And the harvest''s end is the Messiah''s parable of the tares: *As therefore the tares are gathered and burned in the fire; so shall it be in the end of this world* (Matthew 13:40). It ain''t new — the wind that uproots the ungodly slips is the chaff-scattering wind of Psalm 1 and the fire of the great gathering.',
       sv.verse_id, ev.verse_id, 'extras', 58084
  FROM _session253_wis04_lookup sv, _session253_wis04_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=4 AND sv.verse_number=3
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=4 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-of-solomon-4-righteous-dead-condemns-ungodly',
       E'The righteous dead condemns the ungodly',
       E'The chapter ends at the judgment scene: *Thus the righteous that is dead shall condemn the ungodly which are living; and youth that is soon perfected the many years and old age of the unrighteous* (Wisdom of Solomon 4:16). The ungodly who once despised him now see him vindicated and are themselves derided: *They shall see him, and despise him; but Yahuah (God) shall laugh them to scorn: and they shall hereafter be a vile carcase, and a reproach among the dead for evermore* (Wisdom of Solomon 4:18). That scorning laugh is the Psalmist''s enthroned Yahuah: *He that sitteth in the heavens shall laugh: Yahuah (Lord) shall have them in derision* (Psalm 2:4). And the next chapter delivers the too-late confession the ungodly will groan — the Wisdom of Solomon''s own continuation, the kings and the mighty seeing the vindicated righteous too late: *And they repenting and groaning for anguish of spirit shall say within themselves, This was he, whom we had sometimes in derision, and a proverb of reproach* (The Wisdom of Solomon 5:3), *We fools accounted his life madness, and his end to be without honour* (The Wisdom of Solomon 5:4). It ain''t new — this is the same too-late awakening the live apparatus binds to the kings before the Son of Adam (1 Enoch 62-63 / Revelation 6:15-17).',
       sv.verse_id, ev.verse_id, 'extras', 58087
  FROM _session253_wis04_lookup sv, _session253_wis04_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=4 AND sv.verse_number=16
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=4 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: wisdom-of-solomon-4-righteous-taken-into-rest
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 57:1 — *The righteous perisheth, and no man layeth it to heart: and merciful men are taken away, none considering that the righteous is taken away from the evil to come.* The prophet''s reason for the early death of the just — taken from the evil to come — is exactly the rest Wisdom of Solomon 4:7 promises the one prevented with death.'
  FROM cross_reference_threads t, cross_references x, _session253_wis04_lookup sv, _session253_wis04_lookup tv
 WHERE t.slug='wisdom-of-solomon-4-righteous-taken-into-rest'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=4 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=57 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 57:2 — *He shall enter into peace: they shall rest in their beds, each one walking in his uprightness.* The rest into which the early-taken righteous enters in Isaiah is the same rest Wisdom of Solomon 4:7 names for him.'
  FROM cross_reference_threads t, cross_references x, _session253_wis04_lookup sv, _session253_wis04_lookup tv
 WHERE t.slug='wisdom-of-solomon-4-righteous-taken-into-rest'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=4 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=57 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 37:37 — *Mark the perfect man, and behold the upright: for the end of that man is peace.* The Psalmist''s verdict that the perfect man''s end is peace underwrites Wisdom of Solomon 4:7''s claim that the righteous, though dead, is in rest.'
  FROM cross_reference_threads t, cross_references x, _session253_wis04_lookup sv, _session253_wis04_lookup tv
 WHERE t.slug='wisdom-of-solomon-4-righteous-taken-into-rest'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=4 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=37 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-of-solomon-4-pleased-god-and-translated-enoch
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 5:24 — *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him.* The man who pleased Yahuah and was translated in Wisdom of Solomon 4:10 is Enoch, whom Genesis says walked with Elohim and was taken.'
  FROM cross_reference_threads t, cross_references x, _session253_wis04_lookup sv, _session253_wis04_lookup tv
 WHERE t.slug='wisdom-of-solomon-4-pleased-god-and-translated-enoch'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=4 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 11:5 — *By faith Enoch was translated that he should not see death; and was not found, because Elohim (God) had translated him: for before his translation he had this testimony, that he pleased Elohim (God).* Hebrews uses Wisdom of Solomon 4:10''s very word — pleased — and verb — translated — of Enoch''s taking.'
  FROM cross_reference_threads t, cross_references x, _session253_wis04_lookup sv, _session253_wis04_lookup tv
 WHERE t.slug='wisdom-of-solomon-4-pleased-god-and-translated-enoch'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=4 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ecclesiasticus 44:16 — *Enoch pleased Yahuah (God), and was translated, being an example of repentance to all generations.* Sirach''s catalogue of the fathers describes the same pleasing-and-translation that Wisdom of Solomon 4:11 calls being speedily taken away.'
  FROM cross_reference_threads t, cross_references x, _session253_wis04_lookup sv, _session253_wis04_lookup tv
 WHERE t.slug='wisdom-of-solomon-4-pleased-god-and-translated-enoch'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=4 AND sv.verse_number=11
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=44 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'The Book of Jubilees 4:23 — *And he was taken from amongst the children of men, and we conducted him into the Garden of Eden in majesty and honour, and behold there he writes down the condemnation and judgment of the world, and all the wickedness of the children of men.* Jubilees narrates the very taking-away from among men that Wisdom of Solomon 4:11 says spared Enoch from wickedness.'
  FROM cross_reference_threads t, cross_references x, _session253_wis04_lookup sv, _session253_wis04_lookup tv
 WHERE t.slug='wisdom-of-solomon-4-pleased-god-and-translated-enoch'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=4 AND sv.verse_number=11
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-of-solomon-4-memorial-of-virtue-immortal
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 10:7 — *The memory of the just is blessed: but the name of the wicked shall rot.* The Proverb''s blessed memory of the just is precisely the immortal memorial of virtue that Wisdom of Solomon 4:1 prizes above children.'
  FROM cross_reference_threads t, cross_references x, _session253_wis04_lookup sv, _session253_wis04_lookup tv
 WHERE t.slug='wisdom-of-solomon-4-memorial-of-virtue-immortal'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=4 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=10 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-of-solomon-4-ungodly-brood-rooted-out
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 1:4 — *The ungodly are not so: but are like the chaff which the wind driveth away.* The wind that drives away the chaff in the Psalm is the same wind that roots out the ungodly''s branches in Wisdom of Solomon 4:4.'
  FROM cross_reference_threads t, cross_references x, _session253_wis04_lookup sv, _session253_wis04_lookup tv
 WHERE t.slug='wisdom-of-solomon-4-ungodly-brood-rooted-out'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=4 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=1 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 1:3 — *And he shall be like a tree planted by the rivers of water, that bringeth forth his fruit in his season; his leaf also shall not wither; and whatsoever he doeth shall prosper.* The deep-rooted, fruitful tree of the Psalm is the foil to the bastard slips that take no deep rooting in Wisdom of Solomon 4:3.'
  FROM cross_reference_threads t, cross_references x, _session253_wis04_lookup sv, _session253_wis04_lookup tv
 WHERE t.slug='wisdom-of-solomon-4-ungodly-brood-rooted-out'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=4 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 13:40 — *As therefore the tares are gathered and burned in the fire; so shall it be in the end of this world.* The Messiah''s harvest of the tares brings to its end the imperfect, unprofitable branches that Wisdom of Solomon 4:5 says are broken off and meet for nothing.'
  FROM cross_reference_threads t, cross_references x, _session253_wis04_lookup sv, _session253_wis04_lookup tv
 WHERE t.slug='wisdom-of-solomon-4-ungodly-brood-rooted-out'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=4 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=13 AND tv.verse_number=40
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-of-solomon-4-righteous-dead-condemns-ungodly
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 2:4 — *He that sitteth in the heavens shall laugh: Yahuah (Lord) shall have them in derision.* The enthroned Yahuah''s derisive laughter in the Psalm is the very laugh-to-scorn that Wisdom of Solomon 4:18 turns on the ungodly who despised the righteous.'
  FROM cross_reference_threads t, cross_references x, _session253_wis04_lookup sv, _session253_wis04_lookup tv
 WHERE t.slug='wisdom-of-solomon-4-righteous-dead-condemns-ungodly'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=4 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'The Wisdom of Solomon 5:3 — *And they repenting and groaning for anguish of spirit shall say within themselves, This was he, whom we had sometimes in derision, and a proverb of reproach.* The next chapter voices the too-late confession of the ungodly whom the righteous dead condemns in Wisdom of Solomon 4:16.'
  FROM cross_reference_threads t, cross_references x, _session253_wis04_lookup sv, _session253_wis04_lookup tv
 WHERE t.slug='wisdom-of-solomon-4-righteous-dead-condemns-ungodly'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=4 AND sv.verse_number=16
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=5 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'The Wisdom of Solomon 5:4 — *We fools accounted his life madness, and his end to be without honour.* The ungodly''s confession that they misjudged the righteous man''s end completes the condemnation Wisdom of Solomon 4:16 says the righteous dead pronounces over them.'
  FROM cross_reference_threads t, cross_references x, _session253_wis04_lookup sv, _session253_wis04_lookup tv
 WHERE t.slug='wisdom-of-solomon-4-righteous-dead-condemns-ungodly'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=4 AND sv.verse_number=16
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=5 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_thewisdomofsolomon_05.sql (session253 the-wisdom-of-solomon 5) -----
-- Source anchor: apocrypha/the-wisdom-of-solomon ch5. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: wis05 (view _session253_wis05_lookup). Sort band base 58100, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_wis05_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: wisdom-5-too-late-confession
  ('apocrypha', 'the-wisdom-of-solomon', 5, 3, 'enoch', '1-enoch', 62, 9, 'extras', E'1 Enoch 62:9 — *And this Son of Adam whom thou hast seen Shall raise up the kings and the mighty from their seats, [And the strong from their thrones] And shall loosen the reins of the strong, And break the teeth of the sinners.* The mighty whom the Son of Adam casts down are the very ones who, in Wisdom of Solomon 5:3, repent and groan when they see the righteous exalted.'),
  ('apocrypha', 'the-wisdom-of-solomon', 5, 4, 'enoch', '1-enoch', 63, 8, 'extras', E'1 Enoch 63:8 — *And one portion of them shall look on the other, And they shall be terrified, And their countenance shall fall, And pain shall seize them, When they see that Son of Adam Sitting on the throne of his glory.* The fools who accounted his life madness (Wisdom of Solomon 5:4) are the kings whose faces fall when they at last behold him enthroned.'),
  ('apocrypha', 'the-wisdom-of-solomon', 5, 5, 'canon', 'revelation', 6, 15, 'free', E'Revelation 6:15 — *And the kings of the earth, and the great men, and the rich men, and the chief captains, and the mighty men, and every bondman, and every free man, hid themselves in the dens and in the rocks of the mountains.* The astonished cry of Wisdom of Solomon 5:5 over the saint numbered among the children of Yahuah is the same dread that drives the mighty to hide at the day of wrath.'),
  ('apocrypha', 'the-wisdom-of-solomon', 5, 3, 'canon', 'malachi', 4, 1, 'free', E'Malachi 4:1 — *For, behold, the day cometh, that shall burn as an oven; and all the proud, yea, and all that do wickedly, shall be stubble: and the day that cometh shall burn them up, saith Yahuah Tseva''ot (LORD of hosts), that it shall leave them neither root nor branch.* The proud who once held the righteous in derision (Wisdom of Solomon 5:3) become stubble in the burning day.'),
  -- thread: wisdom-5-righteous-shine-vindicated
  ('apocrypha', 'the-wisdom-of-solomon', 5, 1, 'canon', 'matthew', 13, 43, 'free', E'Matthew 13:43 — *Then shall the righteous shine forth as the sun in the kingdom of their Father. Who hath ears to hear, let him hear.* The boldness with which the righteous man stands before his afflicters (Wisdom of Solomon 5:1) is his shining forth as the sun in the Father''s kingdom.'),
  ('apocrypha', 'the-wisdom-of-solomon', 5, 15, 'canon', 'daniel', 12, 3, 'free', E'Daniel 12:3 — *And they that be wise shall shine as the brightness of the firmament; and they that turn many to righteousness as the stars for ever and ever.* The promise that the righteous live for evermore (Wisdom of Solomon 5:15) is Daniel''s vision of the wise shining as stars for ever.'),
  ('apocrypha', 'the-wisdom-of-solomon', 5, 16, 'canon', 'malachi', 4, 2, 'free', E'Malachi 4:2 — *But unto you that fear my name shall the Sun of righteousness arise with healing in his wings; and ye shall go forth, and grow up as calves of the stall.* The glorious kingdom and crown given from the hand of Yahuah (Wisdom of Solomon 5:16) belong to those over whom the Sun of righteousness rises.'),
  -- thread: wisdom-5-hope-of-ungodly-chaff
  ('apocrypha', 'the-wisdom-of-solomon', 5, 14, 'canon', 'psalms', 1, 4, 'free', E'Psalm 1:4 — *The ungodly are not so: but are like the chaff which the wind driveth away.* The hope of the ungodly blown away like dust and smoke (Wisdom of Solomon 5:14) is the Psalmist''s chaff driven off by the wind.'),
  ('apocrypha', 'the-wisdom-of-solomon', 5, 14, 'canon', 'psalms', 1, 6, 'free', E'Psalm 1:6 — *For Yahuah (LORD) knoweth the way of the righteous: but the way of the ungodly shall perish.* The vanishing of the ungodly''s hope (Wisdom of Solomon 5:14) is the perishing of the way of the ungodly known to Yahuah.'),
  ('apocrypha', 'the-wisdom-of-solomon', 5, 14, 'canon', 'daniel', 12, 2, 'free', E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The ungodly whose hope is dust without honour (Wisdom of Solomon 5:14) awake to shame and everlasting contempt.'),
  -- thread: wisdom-5-armour-of-zeal
  ('apocrypha', 'the-wisdom-of-solomon', 5, 18, 'canon', 'isaiah', 59, 17, 'free', E'Isaiah 59:17 — *For he put on righteousness as a breastplate, and an helmet of salvation upon his head; and he put on the garments of vengeance for clothing, and was clad with zeal as a cloke.* The breastplate of righteousness and helmet of judgment Yahuah dons (Wisdom of Solomon 5:18) is drawn straight from Isaiah''s armed Avenger.'),
  ('apocrypha', 'the-wisdom-of-solomon', 5, 17, 'canon', 'isaiah', 59, 18, 'free', E'Isaiah 59:18 — *According to their deeds, accordingly he will repay, fury to his adversaries, recompence to his enemies; to the islands he will repay recompence.* The jealousy taken as complete armour for revenge on His enemies (Wisdom of Solomon 5:17) is Isaiah''s repayment of fury to His adversaries.'),
  ('apocrypha', 'the-wisdom-of-solomon', 5, 19, 'canon', 'ephesians', 6, 13, 'free', E'Ephesians 6:13 — *Wherefore take unto you the whole armour of Elohim (God), that ye may be able to withstand in the evil day, and having done all, to stand.* The invincible shield Yahuah takes (Wisdom of Solomon 5:19) is the whole armour of Elohim Paul bids the saints put on to stand.'),
  ('apocrypha', 'the-wisdom-of-solomon', 5, 20, 'canon', 'ephesians', 6, 17, 'free', E'Ephesians 6:17 — *And take the helmet of salvation, and the sword of the Spirit, which is the word of Elohim (God):* The sharpened sword of Yahuah''s wrath (Wisdom of Solomon 5:20) is handed to the elect as the sword of the Spirit, the word of Elohim.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_wis05_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_wis05_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-5-too-late-confession',
       E'The Too-Late Confession of the Ungodly',
       E'At the judgment the proud are undone by the sight of the one they despised: *And they repenting and groaning for anguish of spirit shall say within themselves, This was he, whom we had sometimes in derision, and a proverb of reproach* (Wisdom of Solomon 5:3), and they cry, *We fools accounted his life madness, and his end to be without honour* (Wisdom of Solomon 5:4) — only to confess too late, *How is he numbered among the children of Yahuah (God), and his lot is among the saints!* (Wisdom of Solomon 5:5). This is no new thing. The LIVE Enoch apparatus already shows the same scene: *And this Son of Adam whom thou hast seen Shall raise up the kings and the mighty from their seats, [And the strong from their thrones] And shall loosen the reins of the strong, And break the teeth of the sinners* (1 Enoch 62:9), and when the mighty behold him *one portion of them shall look on the other, And they shall be terrified, And their countenance shall fall, And pain shall seize them, When they see that Son of Adam Sitting on the throne of his glory* (1 Enoch 63:8). John sees the same too-late terror: *And the kings of the earth, and the great men, and the rich men, and the chief captains, and the mighty men, and every bondman, and every free man, hid themselves in the dens and in the rocks of the mountains* (Revelation 6:15). Malachi warned it long before: *For, behold, the day cometh, that shall burn as an oven; and all the proud, yea, and all that do wickedly, shall be stubble* (Malachi 4:1). The proud are confounded; the despised is vindicated.',
       sv.verse_id, ev.verse_id, 'extras', 58100
  FROM _session253_wis05_lookup sv, _session253_wis05_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=5 AND sv.verse_number=3
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=5 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-5-righteous-shine-vindicated',
       E'The Righteous Stand and Shine',
       E'Over against the confounded proud, *Then shall the righteous man stand in great boldness before the face of such as have afflicted him, and made no account of his labours* (Wisdom of Solomon 5:1), for *the righteous live for evermore; their reward also is with Yahuah (God), and the care of them is with the Most High* (Wisdom of Solomon 5:15), and *Therefore shall they receive a glorious kingdom, and a beautiful crown from the hand of Yahuah (God): for with his right hand shall he cover them, and with his arm shall he protect them* (Wisdom of Solomon 5:16). It ain''t new — Yahusha says the same: *Then shall the righteous shine forth as the sun in the kingdom of their Father. Who hath ears to hear, let him hear* (Matthew 13:43); Daniel saw it: *And they that be wise shall shine as the brightness of the firmament; and they that turn many to righteousness as the stars for ever and ever* (Daniel 12:3); and Malachi names the rising light, *But unto you that fear my name shall the Sun of righteousness arise with healing in his wings* (Malachi 4:2). The election is vindicated and crowned.',
       sv.verse_id, ev.verse_id, 'extras', 58103
  FROM _session253_wis05_lookup sv, _session253_wis05_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=5 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=5 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-5-hope-of-ungodly-chaff',
       E'The Hope of the Ungodly Like Chaff',
       E'The proud who derided the righteous have built on nothing: *For the hope of the ungodly is like dust that is blown away with the wind; like a thin froth that is driven away with the storm; like as the smoke which is dispersed here and there with a tempest, and passeth away as the remembrance of a guest that tarrieth but a day* (Wisdom of Solomon 5:14). The Psalter said it first: *The ungodly are not so: but are like the chaff which the wind driveth away* (Psalm 1:4), and *For Yahuah (LORD) knoweth the way of the righteous: but the way of the ungodly shall perish* (Psalm 1:6). And the great divide of the resurrection answers both: *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt* (Daniel 12:2). The two ways — chaff and crown — are no new doctrine.',
       sv.verse_id, ev.verse_id, 'extras', 58106
  FROM _session253_wis05_lookup sv, _session253_wis05_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=5 AND sv.verse_number=14
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=5 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-5-armour-of-zeal',
       E'Yahuah Takes His Armour of Zeal',
       E'The chapter ends with the Warrior arming Himself for His people: *He shall take to him his jealousy for complete armour, and make the creature his weapon for the revenge of his enemies* (Wisdom of Solomon 5:17); *He shall put on righteousness as a breastplate, and true judgment instead of an helmet* (Wisdom of Solomon 5:18); *He shall take holiness for an invincible shield* (Wisdom of Solomon 5:19); *His severe wrath shall he sharpen for a sword, and the world shall fight with him against the unwise* (Wisdom of Solomon 5:20). This is lifted whole from Isaiah: *For he put on righteousness as a breastplate, and an helmet of salvation upon his head; and he put on the garments of vengeance for clothing, and was clad with zeal as a cloke* (Isaiah 59:17), the same garments of recompence, *According to their deeds, accordingly he will repay, fury to his adversaries, recompence to his enemies* (Isaiah 59:18). Paul then hands that very armour of Elohim to the saints: *Wherefore take unto you the whole armour of Elohim (God), that ye may be able to withstand in the evil day, and having done all, to stand* (Ephesians 6:13), *And take the helmet of salvation, and the sword of the Spirit, which is the word of Elohim (God)* (Ephesians 6:17). The breastplate and helmet of the Avenger become the inheritance of His elect.',
       sv.verse_id, ev.verse_id, 'extras', 58109
  FROM _session253_wis05_lookup sv, _session253_wis05_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=5 AND sv.verse_number=17
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=5 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: wisdom-5-too-late-confession
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 62:9 — *And this Son of Adam whom thou hast seen Shall raise up the kings and the mighty from their seats, [And the strong from their thrones] And shall loosen the reins of the strong, And break the teeth of the sinners.* The mighty whom the Son of Adam casts down are the very ones who, in Wisdom of Solomon 5:3, repent and groan when they see the righteous exalted.'
  FROM cross_reference_threads t, cross_references x, _session253_wis05_lookup sv, _session253_wis05_lookup tv
 WHERE t.slug='wisdom-5-too-late-confession'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=5 AND sv.verse_number=3
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=62 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 63:8 — *And one portion of them shall look on the other, And they shall be terrified, And their countenance shall fall, And pain shall seize them, When they see that Son of Adam Sitting on the throne of his glory.* The fools who accounted his life madness (Wisdom of Solomon 5:4) are the kings whose faces fall when they at last behold him enthroned.'
  FROM cross_reference_threads t, cross_references x, _session253_wis05_lookup sv, _session253_wis05_lookup tv
 WHERE t.slug='wisdom-5-too-late-confession'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=5 AND sv.verse_number=4
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=63 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 6:15 — *And the kings of the earth, and the great men, and the rich men, and the chief captains, and the mighty men, and every bondman, and every free man, hid themselves in the dens and in the rocks of the mountains.* The astonished cry of Wisdom of Solomon 5:5 over the saint numbered among the children of Yahuah is the same dread that drives the mighty to hide at the day of wrath.'
  FROM cross_reference_threads t, cross_references x, _session253_wis05_lookup sv, _session253_wis05_lookup tv
 WHERE t.slug='wisdom-5-too-late-confession'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=5 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=6 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Malachi 4:1 — *For, behold, the day cometh, that shall burn as an oven; and all the proud, yea, and all that do wickedly, shall be stubble: and the day that cometh shall burn them up, saith Yahuah Tseva''ot (LORD of hosts), that it shall leave them neither root nor branch.* The proud who once held the righteous in derision (Wisdom of Solomon 5:3) become stubble in the burning day.'
  FROM cross_reference_threads t, cross_references x, _session253_wis05_lookup sv, _session253_wis05_lookup tv
 WHERE t.slug='wisdom-5-too-late-confession'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=5 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=4 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-5-righteous-shine-vindicated
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 13:43 — *Then shall the righteous shine forth as the sun in the kingdom of their Father. Who hath ears to hear, let him hear.* The boldness with which the righteous man stands before his afflicters (Wisdom of Solomon 5:1) is his shining forth as the sun in the Father''s kingdom.'
  FROM cross_reference_threads t, cross_references x, _session253_wis05_lookup sv, _session253_wis05_lookup tv
 WHERE t.slug='wisdom-5-righteous-shine-vindicated'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=5 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=13 AND tv.verse_number=43
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 12:3 — *And they that be wise shall shine as the brightness of the firmament; and they that turn many to righteousness as the stars for ever and ever.* The promise that the righteous live for evermore (Wisdom of Solomon 5:15) is Daniel''s vision of the wise shining as stars for ever.'
  FROM cross_reference_threads t, cross_references x, _session253_wis05_lookup sv, _session253_wis05_lookup tv
 WHERE t.slug='wisdom-5-righteous-shine-vindicated'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=5 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Malachi 4:2 — *But unto you that fear my name shall the Sun of righteousness arise with healing in his wings; and ye shall go forth, and grow up as calves of the stall.* The glorious kingdom and crown given from the hand of Yahuah (Wisdom of Solomon 5:16) belong to those over whom the Sun of righteousness rises.'
  FROM cross_reference_threads t, cross_references x, _session253_wis05_lookup sv, _session253_wis05_lookup tv
 WHERE t.slug='wisdom-5-righteous-shine-vindicated'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=5 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=4 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-5-hope-of-ungodly-chaff
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 1:4 — *The ungodly are not so: but are like the chaff which the wind driveth away.* The hope of the ungodly blown away like dust and smoke (Wisdom of Solomon 5:14) is the Psalmist''s chaff driven off by the wind.'
  FROM cross_reference_threads t, cross_references x, _session253_wis05_lookup sv, _session253_wis05_lookup tv
 WHERE t.slug='wisdom-5-hope-of-ungodly-chaff'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=5 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=1 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 1:6 — *For Yahuah (LORD) knoweth the way of the righteous: but the way of the ungodly shall perish.* The vanishing of the ungodly''s hope (Wisdom of Solomon 5:14) is the perishing of the way of the ungodly known to Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session253_wis05_lookup sv, _session253_wis05_lookup tv
 WHERE t.slug='wisdom-5-hope-of-ungodly-chaff'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=5 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The ungodly whose hope is dust without honour (Wisdom of Solomon 5:14) awake to shame and everlasting contempt.'
  FROM cross_reference_threads t, cross_references x, _session253_wis05_lookup sv, _session253_wis05_lookup tv
 WHERE t.slug='wisdom-5-hope-of-ungodly-chaff'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=5 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-5-armour-of-zeal
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 59:17 — *For he put on righteousness as a breastplate, and an helmet of salvation upon his head; and he put on the garments of vengeance for clothing, and was clad with zeal as a cloke.* The breastplate of righteousness and helmet of judgment Yahuah dons (Wisdom of Solomon 5:18) is drawn straight from Isaiah''s armed Avenger.'
  FROM cross_reference_threads t, cross_references x, _session253_wis05_lookup sv, _session253_wis05_lookup tv
 WHERE t.slug='wisdom-5-armour-of-zeal'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=5 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=59 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 59:18 — *According to their deeds, accordingly he will repay, fury to his adversaries, recompence to his enemies; to the islands he will repay recompence.* The jealousy taken as complete armour for revenge on His enemies (Wisdom of Solomon 5:17) is Isaiah''s repayment of fury to His adversaries.'
  FROM cross_reference_threads t, cross_references x, _session253_wis05_lookup sv, _session253_wis05_lookup tv
 WHERE t.slug='wisdom-5-armour-of-zeal'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=5 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=59 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ephesians 6:13 — *Wherefore take unto you the whole armour of Elohim (God), that ye may be able to withstand in the evil day, and having done all, to stand.* The invincible shield Yahuah takes (Wisdom of Solomon 5:19) is the whole armour of Elohim Paul bids the saints put on to stand.'
  FROM cross_reference_threads t, cross_references x, _session253_wis05_lookup sv, _session253_wis05_lookup tv
 WHERE t.slug='wisdom-5-armour-of-zeal'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=5 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=6 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ephesians 6:17 — *And take the helmet of salvation, and the sword of the Spirit, which is the word of Elohim (God):* The sharpened sword of Yahuah''s wrath (Wisdom of Solomon 5:20) is handed to the elect as the sword of the Spirit, the word of Elohim.'
  FROM cross_reference_threads t, cross_references x, _session253_wis05_lookup sv, _session253_wis05_lookup tv
 WHERE t.slug='wisdom-5-armour-of-zeal'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=5 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=6 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_thewisdomofsolomon_06.sql (session253 the-wisdom-of-solomon 6) -----
-- Source anchor: apocrypha/the-wisdom-of-solomon ch6. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: wis06 (view _session253_wis06_lookup). Sort band base 58125, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_wis06_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: wisdom-6-powers-ordained
  ('apocrypha', 'the-wisdom-of-solomon', 6, 3, 'canon', 'romans', 13, 1, 'free', E'Romans 13:1 — *Let every soul be subject unto the higher powers. For there is no power but of God: the powers that be are ordained of God.* Sha''ul echoes Wisdom of Solomon 6:3 — every authority is a delegated stewardship granted of Yahuah, never self-owned.'),
  ('apocrypha', 'the-wisdom-of-solomon', 6, 3, 'canon', 'daniel', 2, 21, 'free', E'Daniel 2:21 — *And he changeth the times and the seasons: he removeth kings, and setteth up kings: he giveth wisdom unto the wise, and knowledge to them that know understanding.* The same Giver of sovereignty in Wisdom of Solomon 6:3 is the One who removes kings and bestows wisdom on the ruler who seeks it.'),
  ('apocrypha', 'the-wisdom-of-solomon', 6, 4, 'canon', 'psalms', 66, 7, 'free', E'Psalm 66:7 — *He ruleth by his power for ever; his eyes behold the nations: let not the rebellious exalt themselves. Selah.* The ministers of His kingdom in Wisdom of Solomon 6:4 who kept not the law are the rebellious whom the all-beholding King will not let exalt themselves.'),
  -- thread: wisdom-6-mighty-mightily-tormented
  ('apocrypha', 'the-wisdom-of-solomon', 6, 7, 'canon', 'deuteronomy', 1, 17, 'free', E'Deuteronomy 1:17 — *Ye shall not respect persons in judgment; but ye shall hear the small as well as the great; ye shall not be afraid of the face of man: for the judgment is God''s: and the cause that is too hard for you, bring it unto me, and I will hear it.* Wisdom of Solomon 6:7 voices the Torah''s own rule that the Judge who made small and great fears no man''s greatness.'),
  ('apocrypha', 'the-wisdom-of-solomon', 6, 7, 'canon', 'romans', 2, 11, 'free', E'Romans 2:11 — *For there is no respect of persons with God.* Sha''ul states plainly what Wisdom of Solomon 6:7 declares — the God over all stands in awe of no man''s greatness.'),
  ('apocrypha', 'the-wisdom-of-solomon', 6, 6, 'canon', '1-peter', 1, 17, 'free', E'1 Peter 1:17 — *And if ye call on the Father, who without respect of persons judgeth according to every man''s work, pass the time of your sojourning here in fear.* The strict reckoning of the mighty in Wisdom of Solomon 6:6 is Kepha''s impartial Father judging every man''s work.'),
  -- thread: wisdom-6-be-wise-o-kings
  ('apocrypha', 'the-wisdom-of-solomon', 6, 9, 'canon', 'psalms', 2, 10, 'free', E'Psalm 2:10 — *Be wise now therefore, O ye kings: be instructed, ye judges of the earth.* Wisdom of Solomon 6:9 speaks the second Psalm''s very summons — the kings and judges of the earth called to learn wisdom and not fall away.'),
  ('apocrypha', 'the-wisdom-of-solomon', 6, 21, 'canon', 'psalms', 2, 12, 'free', E'Psalm 2:12 — *Kiss the Son, lest he be angry, and ye perish from the way, when his wrath is kindled but a little. Blessed are all they that put their trust in him.* Honouring wisdom that the kings may reign for evermore (Wisdom of Solomon 6:21) is the Psalm''s homage to the Son that the rulers perish not.'),
  ('apocrypha', 'the-wisdom-of-solomon', 6, 9, 'canon', '1-kings', 3, 12, 'free', E'1 Kings 3:12 — *Behold, I have done according to thy words: lo, I have given thee a wise and an understanding heart; so that there was none like thee before thee, neither after thee shall any arise like unto thee.* Solomon''s charge to kings in Wisdom of Solomon 6:9 flows from his own throne, granted because he asked for wisdom and not power.'),
  -- thread: wisdom-6-she-is-found-of-them-that-seek
  ('apocrypha', 'the-wisdom-of-solomon', 6, 14, 'canon', 'proverbs', 8, 17, 'free', E'Proverbs 8:17 — *I love them that love me; and those that seek me early shall find me.* The Formed Wisdom of Proverbs speaks in her own voice the promise of Wisdom of Solomon 6:14 — she is found by them that seek her early.'),
  ('apocrypha', 'the-wisdom-of-solomon', 6, 12, 'canon', 'matthew', 7, 7, 'free', E'Matthew 7:7 — *Ask, and it shall be given you; seek, and ye shall find; knock, and it shall be opened unto you.* The Messiah confirms what Wisdom of Solomon 6:12 declares — wisdom is found of such as seek her.'),
  ('apocrypha', 'the-wisdom-of-solomon', 6, 12, 'canon', 'jeremiah', 29, 13, 'free', E'Jeremiah 29:13 — *And ye shall seek me, and find me, when ye shall search for me with all your heart.* The covenant promise that wisdom is found of such as seek her (Wisdom of Solomon 6:12) is Yahuah''s own pledge to the whole-hearted searcher.'),
  -- thread: wisdom-6-beginning-of-wisdom-keeping-laws
  ('apocrypha', 'the-wisdom-of-solomon', 6, 18, 'canon', 'john', 14, 15, 'free', E'John 14:15 — *If ye love me, keep my commandments.* The Messiah defines love precisely as Wisdom of Solomon 6:18 does — *love is the keeping of her laws* — obedience, not mere affection.'),
  ('apocrypha', 'the-wisdom-of-solomon', 6, 17, 'canon', 'proverbs', 9, 10, 'free', E'Proverbs 9:10 — *The fear of the LORD is the beginning of wisdom: and the knowledge of the holy is understanding.* The desire of discipline that is the *very true beginning* of wisdom in Wisdom of Solomon 6:17 is the fear of Yahuah that Proverbs names as wisdom''s start.'),
  ('apocrypha', 'the-wisdom-of-solomon', 6, 17, 'canon', 'proverbs', 1, 7, 'free', E'Proverbs 1:7 — *The fear of the LORD is the beginning of knowledge: but fools despise wisdom and instruction.* Wisdom''s beginning in the desire of discipline (Wisdom of Solomon 6:17) answers Proverbs'' opening axiom — the fear of Yahuah is where knowledge begins.'),
  ('apocrypha', 'the-wisdom-of-solomon', 6, 19, 'canon', '1-corinthians', 15, 53, 'free', E'1 Corinthians 15:53 — *For this corruptible must put on incorruption, and this mortal must put on immortality.* The *assurance of incorruption* that draws us near to Elohim in Wisdom of Solomon 6:19 is Sha''ul''s promise that the corruptible puts on incorruption.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_wis06_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_wis06_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-6-powers-ordained',
       E'Power is given you of Yahuah — the rulers who must answer',
       E'Solomon turns to the thrones of the earth: *For power is given you of Yahuah (God), and sovereignty from the Highest, who shall try your works, and search out your counsels.* (Wisdom of Solomon 6:3). Every crown is a delegated crown, held in trust and audited from above. Sha''ul says the same to Rome: *Let every soul be subject unto the higher powers. For there is no power but of God: the powers that be are ordained of God.* (Romans 13:1) — authority is real, but it is derived, never sovereign in itself. Daniel had already announced the Giver who is also the Remover: *And he changeth the times and the seasons: he removeth kings, and setteth up kings: he giveth wisdom unto the wise, and knowledge to them that know understanding.* (Daniel 2:21). And the same hand that grants the throne measures the king who *kept not the law*: *He ruleth by his power for ever; his eyes behold the nations: let not the rebellious exalt themselves.* (Psalm 66:7). The deuterocanon carries the covenant order: power is loaned, and the lender keeps account.',
       sv.verse_id, ev.verse_id, 'extras', 58125
  FROM _session253_wis06_lookup sv, _session253_wis06_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=6 AND sv.verse_number=3
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=6 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-6-mighty-mightily-tormented',
       E'The mighty shall be mightily tormented — no respecter of persons',
       E'The judgment falls heaviest on the high: *For mercy will soon pardon the meanest: but mighty men shall be mightily tormented.* (Wisdom of Solomon 6:6) — *For he which is Yahuah (God) over all shall fear no man''s person, neither shall he stand in awe of any man''s greatness: for he has made the small and great, and careth for all alike.* (Wisdom of Solomon 6:7). The Torah already wrote this impartiality into the bench: *Ye shall not respect persons in judgment; but ye shall hear the small as well as the great; ye shall not be afraid of the face of man: for the judgment is God''s.* (Deuteronomy 1:17). Kepha carries it into the assembly: *And if ye call on the Father, who without respect of persons judgeth according to every man''s work, pass the time of your sojourning here in fear.* (1 Peter 1:17). And Sha''ul seals it: *For there is no respect of persons with God.* (Romans 2:11). It ain''t new — the King who made small and great alike judges them by one weight.',
       sv.verse_id, ev.verse_id, 'extras', 58128
  FROM _session253_wis06_lookup sv, _session253_wis06_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=6 AND sv.verse_number=6
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=6 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-6-be-wise-o-kings',
       E'To you, O kings — be wise and fall not away',
       E'The address to the throne is an altar call to power itself: *To you therefore, O kings, do I speak, that you may learn wisdom, and not fall away.* (Wisdom of Solomon 6:9) — *If your delight be then in thrones and sceptres, O you kings of the people, honour wisdom, that you may reign for evermore.* (Wisdom of Solomon 6:21). This is the second Psalm preached to the rulers: *Be wise now therefore, O ye kings: be instructed, ye judges of the earth.* (Psalm 2:10) — *Kiss the Son, lest he be angry, and ye perish from the way, when his wrath is kindled but a little. Blessed are all they that put their trust in him.* (Psalm 2:12). Solomon''s own throne came of this very asking: *Behold, I have done according to thy words: lo, I have given thee a wise and an understanding heart; so that there was none like thee before thee.* (1 Kings 3:12). The crown that delights in wisdom is the crown that reigns for evermore.',
       sv.verse_id, ev.verse_id, 'extras', 58131
  FROM _session253_wis06_lookup sv, _session253_wis06_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=6 AND sv.verse_number=9
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=6 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-6-she-is-found-of-them-that-seek',
       E'Found of such as seek her — wisdom meets the early seeker',
       E'Wisdom is not hidden from the heart that wants her: *Wisdom is glorious, and never fadeth away: yes, she is easily seen of them that love her, and found of such as seek her.* (Wisdom of Solomon 6:12) — *Whoso seeks her early shall have no great travail: for he shall find her sitting at his doors.* (Wisdom of Solomon 6:14). The Formed Wisdom of Proverbs says it of herself: *I love them that love me; and those that seek me early shall find me.* (Proverbs 8:17). The Messiah confirms the promise to every seeker: *Ask, and it shall be given you; seek, and ye shall find; knock, and it shall be opened unto you.* (Matthew 7:7). And the covenant terms hold across the testaments: *And ye shall seek me, and find me, when ye shall search for me with all your heart.* (Jeremiah 29:13). She sits at the door of the one who rises early to look — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 58134
  FROM _session253_wis06_lookup sv, _session253_wis06_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=6 AND sv.verse_number=12
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=6 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-6-beginning-of-wisdom-keeping-laws',
       E'The desire of discipline — love is the keeping of her laws',
       E'Solomon traces wisdom back to her root, and the root is obedience: *For the very true beginning of her is the desire of discipline; and the care of discipline is love; And love is the keeping of her laws; and the giving heed to her laws is the assurance of incorruption; And incorruption makes us near to Yahuah (God).* (Wisdom of Solomon 6:17-19). The fear of Yahuah opens that whole chain: *The fear of the LORD is the beginning of knowledge: but fools despise wisdom and instruction.* (Proverbs 1:7) — *The fear of the LORD is the beginning of wisdom: and the knowledge of the holy is understanding.* (Proverbs 9:10). And the Messiah defines love exactly as Solomon does — not feeling but keeping: *If ye love me, keep my commandments.* (John 14:15). Torah stands: love IS the keeping of her laws, and that keeping draws us near to Elohim and toward incorruption.',
       sv.verse_id, ev.verse_id, 'extras', 58137
  FROM _session253_wis06_lookup sv, _session253_wis06_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=6 AND sv.verse_number=17
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=6 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: wisdom-6-powers-ordained
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Romans 13:1 — *Let every soul be subject unto the higher powers. For there is no power but of God: the powers that be are ordained of God.* Sha''ul echoes Wisdom of Solomon 6:3 — every authority is a delegated stewardship granted of Yahuah, never self-owned.'
  FROM cross_reference_threads t, cross_references x, _session253_wis06_lookup sv, _session253_wis06_lookup tv
 WHERE t.slug='wisdom-6-powers-ordained'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=6 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=13 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 2:21 — *And he changeth the times and the seasons: he removeth kings, and setteth up kings: he giveth wisdom unto the wise, and knowledge to them that know understanding.* The same Giver of sovereignty in Wisdom of Solomon 6:3 is the One who removes kings and bestows wisdom on the ruler who seeks it.'
  FROM cross_reference_threads t, cross_references x, _session253_wis06_lookup sv, _session253_wis06_lookup tv
 WHERE t.slug='wisdom-6-powers-ordained'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=6 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=2 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 66:7 — *He ruleth by his power for ever; his eyes behold the nations: let not the rebellious exalt themselves. Selah.* The ministers of His kingdom in Wisdom of Solomon 6:4 who kept not the law are the rebellious whom the all-beholding King will not let exalt themselves.'
  FROM cross_reference_threads t, cross_references x, _session253_wis06_lookup sv, _session253_wis06_lookup tv
 WHERE t.slug='wisdom-6-powers-ordained'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=6 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=66 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-6-mighty-mightily-tormented
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 1:17 — *Ye shall not respect persons in judgment; but ye shall hear the small as well as the great; ye shall not be afraid of the face of man: for the judgment is God''s: and the cause that is too hard for you, bring it unto me, and I will hear it.* Wisdom of Solomon 6:7 voices the Torah''s own rule that the Judge who made small and great fears no man''s greatness.'
  FROM cross_reference_threads t, cross_references x, _session253_wis06_lookup sv, _session253_wis06_lookup tv
 WHERE t.slug='wisdom-6-mighty-mightily-tormented'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=6 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=1 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 2:11 — *For there is no respect of persons with God.* Sha''ul states plainly what Wisdom of Solomon 6:7 declares — the God over all stands in awe of no man''s greatness.'
  FROM cross_reference_threads t, cross_references x, _session253_wis06_lookup sv, _session253_wis06_lookup tv
 WHERE t.slug='wisdom-6-mighty-mightily-tormented'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=6 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=2 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Peter 1:17 — *And if ye call on the Father, who without respect of persons judgeth according to every man''s work, pass the time of your sojourning here in fear.* The strict reckoning of the mighty in Wisdom of Solomon 6:6 is Kepha''s impartial Father judging every man''s work.'
  FROM cross_reference_threads t, cross_references x, _session253_wis06_lookup sv, _session253_wis06_lookup tv
 WHERE t.slug='wisdom-6-mighty-mightily-tormented'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=6 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=1 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-6-be-wise-o-kings
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 2:10 — *Be wise now therefore, O ye kings: be instructed, ye judges of the earth.* Wisdom of Solomon 6:9 speaks the second Psalm''s very summons — the kings and judges of the earth called to learn wisdom and not fall away.'
  FROM cross_reference_threads t, cross_references x, _session253_wis06_lookup sv, _session253_wis06_lookup tv
 WHERE t.slug='wisdom-6-be-wise-o-kings'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=6 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=2 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 2:12 — *Kiss the Son, lest he be angry, and ye perish from the way, when his wrath is kindled but a little. Blessed are all they that put their trust in him.* Honouring wisdom that the kings may reign for evermore (Wisdom of Solomon 6:21) is the Psalm''s homage to the Son that the rulers perish not.'
  FROM cross_reference_threads t, cross_references x, _session253_wis06_lookup sv, _session253_wis06_lookup tv
 WHERE t.slug='wisdom-6-be-wise-o-kings'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=6 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=2 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Kings 3:12 — *Behold, I have done according to thy words: lo, I have given thee a wise and an understanding heart; so that there was none like thee before thee, neither after thee shall any arise like unto thee.* Solomon''s charge to kings in Wisdom of Solomon 6:9 flows from his own throne, granted because he asked for wisdom and not power.'
  FROM cross_reference_threads t, cross_references x, _session253_wis06_lookup sv, _session253_wis06_lookup tv
 WHERE t.slug='wisdom-6-be-wise-o-kings'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=6 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=3 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-6-she-is-found-of-them-that-seek
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 8:17 — *I love them that love me; and those that seek me early shall find me.* The Formed Wisdom of Proverbs speaks in her own voice the promise of Wisdom of Solomon 6:14 — she is found by them that seek her early.'
  FROM cross_reference_threads t, cross_references x, _session253_wis06_lookup sv, _session253_wis06_lookup tv
 WHERE t.slug='wisdom-6-she-is-found-of-them-that-seek'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=6 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=8 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 7:7 — *Ask, and it shall be given you; seek, and ye shall find; knock, and it shall be opened unto you.* The Messiah confirms what Wisdom of Solomon 6:12 declares — wisdom is found of such as seek her.'
  FROM cross_reference_threads t, cross_references x, _session253_wis06_lookup sv, _session253_wis06_lookup tv
 WHERE t.slug='wisdom-6-she-is-found-of-them-that-seek'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=6 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 29:13 — *And ye shall seek me, and find me, when ye shall search for me with all your heart.* The covenant promise that wisdom is found of such as seek her (Wisdom of Solomon 6:12) is Yahuah''s own pledge to the whole-hearted searcher.'
  FROM cross_reference_threads t, cross_references x, _session253_wis06_lookup sv, _session253_wis06_lookup tv
 WHERE t.slug='wisdom-6-she-is-found-of-them-that-seek'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=6 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=29 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-6-beginning-of-wisdom-keeping-laws
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 14:15 — *If ye love me, keep my commandments.* The Messiah defines love precisely as Wisdom of Solomon 6:18 does — *love is the keeping of her laws* — obedience, not mere affection.'
  FROM cross_reference_threads t, cross_references x, _session253_wis06_lookup sv, _session253_wis06_lookup tv
 WHERE t.slug='wisdom-6-beginning-of-wisdom-keeping-laws'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=6 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=14 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 9:10 — *The fear of the LORD is the beginning of wisdom: and the knowledge of the holy is understanding.* The desire of discipline that is the *very true beginning* of wisdom in Wisdom of Solomon 6:17 is the fear of Yahuah that Proverbs names as wisdom''s start.'
  FROM cross_reference_threads t, cross_references x, _session253_wis06_lookup sv, _session253_wis06_lookup tv
 WHERE t.slug='wisdom-6-beginning-of-wisdom-keeping-laws'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=6 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=9 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 1:7 — *The fear of the LORD is the beginning of knowledge: but fools despise wisdom and instruction.* Wisdom''s beginning in the desire of discipline (Wisdom of Solomon 6:17) answers Proverbs'' opening axiom — the fear of Yahuah is where knowledge begins.'
  FROM cross_reference_threads t, cross_references x, _session253_wis06_lookup sv, _session253_wis06_lookup tv
 WHERE t.slug='wisdom-6-beginning-of-wisdom-keeping-laws'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=6 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=1 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Corinthians 15:53 — *For this corruptible must put on incorruption, and this mortal must put on immortality.* The *assurance of incorruption* that draws us near to Elohim in Wisdom of Solomon 6:19 is Sha''ul''s promise that the corruptible puts on incorruption.'
  FROM cross_reference_threads t, cross_references x, _session253_wis06_lookup sv, _session253_wis06_lookup tv
 WHERE t.slug='wisdom-6-beginning-of-wisdom-keeping-laws'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=6 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=53
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_thewisdomofsolomon_07.sql (session253 the-wisdom-of-solomon 7) -----
-- Source anchor: apocrypha/the-wisdom-of-solomon ch7. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: wis07 (view _session253_wis07_lookup). Sort band base 58150, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_wis07_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: wisdom-of-solomon-7-solomon-prayed-and-she-was-given
  ('apocrypha', 'the-wisdom-of-solomon', 7, 7, 'canon', '1-kings', 3, 9, 'free', E'1 Kings 3:9 — *Give therefore thy servant an understanding heart to judge thy people, that I may discern between good and bad: for who is able to judge this thy so great a people?* Wisdom of Solomon 7:7 retells in the first person the very prayer Solomon prayed at Gibeon.'),
  ('apocrypha', 'the-wisdom-of-solomon', 7, 7, 'canon', '1-kings', 3, 12, 'free', E'1 Kings 3:12 — *Behold, I have done according to thy words: lo, I have given thee a wise and an understanding heart; so that there was none like thee before thee, neither after thee shall any arise like unto thee.* The granting in 1 Kings is the answer to the prayer Wisdom of Solomon 7:7 voices — wisdom *came to me*.'),
  ('apocrypha', 'the-wisdom-of-solomon', 7, 7, 'canon', 'james', 1, 5, 'free', E'James 1:5 — *If any of you lack wisdom, let him ask of Elohim (God), that giveth to all men liberally, and upbraideth not; and it shall be given him.* The same covenant pattern Wisdom of Solomon 7:7 models — ask, and the spirit of wisdom is given.'),
  ('apocrypha', 'the-wisdom-of-solomon', 7, 7, 'canon', '1-corinthians', 1, 24, 'free', E'1 Corinthians 1:24 — *But unto them which are called, both Yahudim (Jews) and Greeks, Messiah (Christ) the power of Elohim (God), and the wisdom of Elohim (God).* The wisdom Solomon prayed for in Wisdom of Solomon 7:7 is unveiled in the NT as a Person, the Messiah.'),
  -- thread: wisdom-of-solomon-7-the-worker-of-all-things
  ('apocrypha', 'the-wisdom-of-solomon', 7, 22, 'canon', 'john', 1, 3, 'free', E'John 1:3 — *All things were made by him; and without him was not any thing made that was made.* Wisdom of Solomon 7:22 calls her *the worker of all things* — the same agency John ascribes to the Word.'),
  ('apocrypha', 'the-wisdom-of-solomon', 7, 22, 'canon', 'colossians', 1, 16, 'free', E'Colossians 1:16 — *For by him were all things created, that are in heaven, and that are in earth, visible and invisible, whether they be thrones, or dominions, or principalities, or powers: all things were created by him, and for him:* the creating Wisdom of Solomon 7:22 is the Messiah by whom all was made.'),
  ('apocrypha', 'the-wisdom-of-solomon', 7, 22, 'canon', 'proverbs', 8, 30, 'free', E'Proverbs 8:30 — *Then I was by him, as one brought up with him: and I was daily his delight, rejoicing always before him;* the Formed Wisdom of Proverbs stands behind the *worker of all things* of Wisdom of Solomon 7:22.'),
  ('apocrypha', 'the-wisdom-of-solomon', 7, 24, 'canon', 'colossians', 1, 17, 'free', E'Colossians 1:17 — *And he is before all things, and by him all things consist.* Wisdom *passeth and goes through all things* (Wisdom of Solomon 7:24) — the same all-pervading sustaining the NT names in Messiah.'),
  -- thread: wisdom-of-solomon-7-breath-brightness-image
  ('apocrypha', 'the-wisdom-of-solomon', 7, 26, 'canon', 'hebrews', 1, 3, 'free', E'Hebrews 1:3 — *Who being the brightness of his glory, and the express image of his person, and upholding all things by the word of his power, when he had by himself purged our sins, sat down on the right hand of the Majesty on high;* the exact triad of Wisdom of Solomon 7:26 — *brightness*, *image*, upholding all — fulfilled in the Son.'),
  ('apocrypha', 'the-wisdom-of-solomon', 7, 26, 'canon', 'colossians', 1, 15, 'free', E'Colossians 1:15 — *Who is the image of the invisible Elohim (God), the firstborn of every creature:* Wisdom is *the image of his goodness* (Wisdom of Solomon 7:26); Messiah is the image of the invisible Elohim.'),
  ('apocrypha', 'the-wisdom-of-solomon', 7, 25, 'canon', 'hebrews', 1, 2, 'free', E'Hebrews 1:2 — *Hath in these last days spoken unto us by his Son, whom he hath appointed heir of all things, by whom also he made the worlds;* the *breath of the power... flowing from the glory of the Almighty* (Wisdom of Solomon 7:25) is the Son by whom the worlds were made.'),
  ('apocrypha', 'the-wisdom-of-solomon', 7, 26, 'canon', 'john', 1, 14, 'free', E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The *brightness of the everlasting light* (Wisdom of Solomon 7:26) is the glory beheld when the Word took flesh.'),
  -- thread: wisdom-of-solomon-7-being-but-one-makes-all-new
  ('apocrypha', 'the-wisdom-of-solomon', 7, 27, 'apocrypha', 'ecclesiasticus', 24, 3, 'extras', E'Ecclesiasticus 24:3 — *I came out of the mouth of the Most High, and covered the earth as a cloud.* Sirach''s self-praising Wisdom is the same *one* who *can do all things* in Wisdom of Solomon 7:27 — a deuterocanon self-link.'),
  ('apocrypha', 'the-wisdom-of-solomon', 7, 27, 'apocrypha', 'ecclesiasticus', 24, 8, 'extras', E'Ecclesiasticus 24:8 — *So the Creator of all things gave me a commandment, and he that made me caused my tabernacle to rest, and said, Let your dwelling be in Jacob, and your inheritance in Yashar''el (Israel).* Wisdom entering *holy souls* (Wisdom of Solomon 7:27) is the same Wisdom given her inheritance in Israel.'),
  ('apocrypha', 'the-wisdom-of-solomon', 7, 27, 'apocrypha', 'the-wisdom-of-solomon', 8, 1, 'extras', E'Wisdom of Solomon 8:1 — *Wisdom reacheth from one end to another mightily: and sweetly does she order all things.* The continuation of Solomon''s own hymn: the *one* who *makes all things new* (Wisdom of Solomon 7:27) orders all things end to end.'),
  ('apocrypha', 'the-wisdom-of-solomon', 7, 27, 'canon', 'john', 1, 4, 'free', E'John 1:4 — *In him was life; and the life was the light of men.* The Wisdom who *makes all things new* and enters holy souls (Wisdom of Solomon 7:27) is the life and light of John''s Logos.'),
  -- thread: wisdom-of-solomon-7-fairer-than-the-sun
  ('apocrypha', 'the-wisdom-of-solomon', 7, 29, 'canon', 'john', 1, 5, 'free', E'John 1:5 — *And the light shineth in darkness; and the darkness comprehended it not.* Wisdom *found before* the light, against whom *vice shall not prevail* (Wisdom of Solomon 7:29-30), is John''s Light the darkness cannot overcome.'),
  ('apocrypha', 'the-wisdom-of-solomon', 7, 29, 'canon', 'john', 1, 9, 'free', E'John 1:9 — *That was the true Light, which lighteth every man that cometh into the world.* The Wisdom *more beautiful than the sun... found before* the light (Wisdom of Solomon 7:29) is the true Light of the Logos.'),
  ('apocrypha', 'the-wisdom-of-solomon', 7, 30, 'canon', '1-corinthians', 1, 24, 'free', E'1 Corinthians 1:24 — *But unto them which are called, both Yahudim (Jews) and Greeks, Messiah (Christ) the power of Elohim (God), and the wisdom of Elohim (God).* The Wisdom against whom *vice shall not prevail* (Wisdom of Solomon 7:30) is the Messiah, the power and wisdom of Elohim.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_wis07_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_wis07_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-of-solomon-7-solomon-prayed-and-she-was-given',
       E'I prayed, and understanding was given me',
       E'Solomon, *a mortal man, like to all*, lays bare that kings have no other beginning than any child, then turns to the one thing worth asking: *Wherefore I prayed, and understanding was given me: I called upon Yahuah (God), and the spirit of wisdom came to me* (Wisdom of Solomon 7:7). It ain''t new — this IS the night at Gibeon: Solomon asked not riches nor long life but *Give therefore thy servant an understanding heart to judge thy people, that I may discern between good and bad* (1 Kings 3:9), and the answer came, *lo, I have given thee a wise and an understanding heart* (1 Kings 3:12). The same open door stands in the NT: *If any of you lack wisdom, let him ask of Elohim (God), that giveth to all men liberally, and upbraideth not; and it shall be given him* (James 1:5). And the wisdom asked for has a Name — *Messiah (Christ) the power of Elohim (God), and the wisdom of Elohim (God)* (1 Corinthians 1:24).',
       sv.verse_id, ev.verse_id, 'extras', 58150
  FROM _session253_wis07_lookup sv, _session253_wis07_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=7 AND sv.verse_number=7
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=7 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-of-solomon-7-the-worker-of-all-things',
       E'Wisdom, the worker of all things',
       E'Solomon names her office: *For wisdom, which is the worker of all things, taught me* (Wisdom of Solomon 7:22), and again, *For wisdom is more moving than any motion: she passeth and goes through all things by reason of her pureness* (Wisdom of Solomon 7:24). It ain''t new — this is the Formed Wisdom of Proverbs, who was *by him, as one brought up with him* when *Yahuah (LORD) possessed me in the beginning of his way, before his works of old* (Proverbs 8:30, 22). The NT gives her the Name: *All things were made by him; and without him was not any thing made that was made* (John 1:3), and *by him were all things created, that are in heaven, and that are in earth... all things were created by him, and for him* (Colossians 1:16). The *worker of all things* is the Logos by whom all consists.',
       sv.verse_id, ev.verse_id, 'extras', 58153
  FROM _session253_wis07_lookup sv, _session253_wis07_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=7 AND sv.verse_number=22
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=7 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-of-solomon-7-breath-brightness-image',
       E'The breath of the power, the brightness, the image',
       E'Here is the high water mark: *For she is the breath of the power of Yahuah (God), and a pure influence flowing from the glory of the Almighty: therefore can no defiled thing fall into her* (Wisdom of Solomon 7:25); *For she is the brightness of the everlasting light, the unspotted mirror of the power of Yahuah (God), and the image of his goodness* (Wisdom of Solomon 7:26). It ain''t new — Hebrews answers it word for word: the Son is *the brightness of his glory, and the express image of his person, and upholding all things by the word of his power* (Hebrews 1:3). Paul: *Who is the image of the invisible Elohim (God), the firstborn of every creature* (Colossians 1:15). And John: *the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father)* (John 1:14). The *brightness* and *image* of Wisdom is the Formed Logos made flesh.',
       sv.verse_id, ev.verse_id, 'extras', 58156
  FROM _session253_wis07_lookup sv, _session253_wis07_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=7 AND sv.verse_number=25
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=7 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-of-solomon-7-being-but-one-makes-all-new',
       E'Being but one, she makes all things new',
       E'*And being but one, she can do all things: and remaining in herself, she makes all things new: and in all ages entering into holy souls, she makes them friends of Yahuah (God), and prophets* (Wisdom of Solomon 7:27). It ain''t new — the other restored books carry the same Wisdom. Sirach lets her speak: *I came out of the mouth of the Most High, and covered the earth as a cloud* (Ecclesiasticus 24:3), and she is given her dwelling, *Let your dwelling be in Jacob, and your inheritance in Yashar''el (Israel)* (Ecclesiasticus 24:8). The next breath of Solomon''s own song confesses her reach: *Wisdom reacheth from one end to another mightily: and sweetly does she order all things* (Wisdom of Solomon 8:1). And the NT: *In him was life; and the life was the light of men* (John 1:4) — the *one* who *makes all things new* and enters holy souls.',
       sv.verse_id, ev.verse_id, 'extras', 58159
  FROM _session253_wis07_lookup sv, _session253_wis07_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=7 AND sv.verse_number=27
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=7 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-of-solomon-7-fairer-than-the-sun',
       E'More beautiful than the sun, the light before light',
       E'Solomon closes the chapter where John opens his Gospel: *For she is more beautiful than the sun, and above all the order of stars: being compared with the light, she is found before it* (Wisdom of Solomon 7:29); *For after this comes night: but vice shall not prevail against wisdom* (Wisdom of Solomon 7:30). It ain''t new — *And the light shineth in darkness; and the darkness comprehended it not* (John 1:5): the uncreated Light is *found before* the created light, and the night does not master it. She *chose to have her instead of light: for the light that comes from her never goes out* (Wisdom of Solomon 7:10), the same everlasting brightness — and that Light is *Messiah (Christ) the power of Elohim (God), and the wisdom of Elohim (God)* (1 Corinthians 1:24), against whom no darkness prevails.',
       sv.verse_id, ev.verse_id, 'extras', 58162
  FROM _session253_wis07_lookup sv, _session253_wis07_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=7 AND sv.verse_number=29
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=7 AND ev.verse_number=30
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: wisdom-of-solomon-7-solomon-prayed-and-she-was-given
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Kings 3:9 — *Give therefore thy servant an understanding heart to judge thy people, that I may discern between good and bad: for who is able to judge this thy so great a people?* Wisdom of Solomon 7:7 retells in the first person the very prayer Solomon prayed at Gibeon.'
  FROM cross_reference_threads t, cross_references x, _session253_wis07_lookup sv, _session253_wis07_lookup tv
 WHERE t.slug='wisdom-of-solomon-7-solomon-prayed-and-she-was-given'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=7 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=3 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Kings 3:12 — *Behold, I have done according to thy words: lo, I have given thee a wise and an understanding heart; so that there was none like thee before thee, neither after thee shall any arise like unto thee.* The granting in 1 Kings is the answer to the prayer Wisdom of Solomon 7:7 voices — wisdom *came to me*.'
  FROM cross_reference_threads t, cross_references x, _session253_wis07_lookup sv, _session253_wis07_lookup tv
 WHERE t.slug='wisdom-of-solomon-7-solomon-prayed-and-she-was-given'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=7 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=3 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'James 1:5 — *If any of you lack wisdom, let him ask of Elohim (God), that giveth to all men liberally, and upbraideth not; and it shall be given him.* The same covenant pattern Wisdom of Solomon 7:7 models — ask, and the spirit of wisdom is given.'
  FROM cross_reference_threads t, cross_references x, _session253_wis07_lookup sv, _session253_wis07_lookup tv
 WHERE t.slug='wisdom-of-solomon-7-solomon-prayed-and-she-was-given'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=7 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Corinthians 1:24 — *But unto them which are called, both Yahudim (Jews) and Greeks, Messiah (Christ) the power of Elohim (God), and the wisdom of Elohim (God).* The wisdom Solomon prayed for in Wisdom of Solomon 7:7 is unveiled in the NT as a Person, the Messiah.'
  FROM cross_reference_threads t, cross_references x, _session253_wis07_lookup sv, _session253_wis07_lookup tv
 WHERE t.slug='wisdom-of-solomon-7-solomon-prayed-and-she-was-given'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=7 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=1 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-of-solomon-7-the-worker-of-all-things
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 1:3 — *All things were made by him; and without him was not any thing made that was made.* Wisdom of Solomon 7:22 calls her *the worker of all things* — the same agency John ascribes to the Word.'
  FROM cross_reference_threads t, cross_references x, _session253_wis07_lookup sv, _session253_wis07_lookup tv
 WHERE t.slug='wisdom-of-solomon-7-the-worker-of-all-things'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=7 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Colossians 1:16 — *For by him were all things created, that are in heaven, and that are in earth, visible and invisible, whether they be thrones, or dominions, or principalities, or powers: all things were created by him, and for him:* the creating Wisdom of Solomon 7:22 is the Messiah by whom all was made.'
  FROM cross_reference_threads t, cross_references x, _session253_wis07_lookup sv, _session253_wis07_lookup tv
 WHERE t.slug='wisdom-of-solomon-7-the-worker-of-all-things'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=7 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=1 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 8:30 — *Then I was by him, as one brought up with him: and I was daily his delight, rejoicing always before him;* the Formed Wisdom of Proverbs stands behind the *worker of all things* of Wisdom of Solomon 7:22.'
  FROM cross_reference_threads t, cross_references x, _session253_wis07_lookup sv, _session253_wis07_lookup tv
 WHERE t.slug='wisdom-of-solomon-7-the-worker-of-all-things'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=7 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=8 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Colossians 1:17 — *And he is before all things, and by him all things consist.* Wisdom *passeth and goes through all things* (Wisdom of Solomon 7:24) — the same all-pervading sustaining the NT names in Messiah.'
  FROM cross_reference_threads t, cross_references x, _session253_wis07_lookup sv, _session253_wis07_lookup tv
 WHERE t.slug='wisdom-of-solomon-7-the-worker-of-all-things'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=7 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=1 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-of-solomon-7-breath-brightness-image
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hebrews 1:3 — *Who being the brightness of his glory, and the express image of his person, and upholding all things by the word of his power, when he had by himself purged our sins, sat down on the right hand of the Majesty on high;* the exact triad of Wisdom of Solomon 7:26 — *brightness*, *image*, upholding all — fulfilled in the Son.'
  FROM cross_reference_threads t, cross_references x, _session253_wis07_lookup sv, _session253_wis07_lookup tv
 WHERE t.slug='wisdom-of-solomon-7-breath-brightness-image'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=7 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Colossians 1:15 — *Who is the image of the invisible Elohim (God), the firstborn of every creature:* Wisdom is *the image of his goodness* (Wisdom of Solomon 7:26); Messiah is the image of the invisible Elohim.'
  FROM cross_reference_threads t, cross_references x, _session253_wis07_lookup sv, _session253_wis07_lookup tv
 WHERE t.slug='wisdom-of-solomon-7-breath-brightness-image'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=7 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=1 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 1:2 — *Hath in these last days spoken unto us by his Son, whom he hath appointed heir of all things, by whom also he made the worlds;* the *breath of the power... flowing from the glory of the Almighty* (Wisdom of Solomon 7:25) is the Son by whom the worlds were made.'
  FROM cross_reference_threads t, cross_references x, _session253_wis07_lookup sv, _session253_wis07_lookup tv
 WHERE t.slug='wisdom-of-solomon-7-breath-brightness-image'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=7 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The *brightness of the everlasting light* (Wisdom of Solomon 7:26) is the glory beheld when the Word took flesh.'
  FROM cross_reference_threads t, cross_references x, _session253_wis07_lookup sv, _session253_wis07_lookup tv
 WHERE t.slug='wisdom-of-solomon-7-breath-brightness-image'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=7 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-of-solomon-7-being-but-one-makes-all-new
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ecclesiasticus 24:3 — *I came out of the mouth of the Most High, and covered the earth as a cloud.* Sirach''s self-praising Wisdom is the same *one* who *can do all things* in Wisdom of Solomon 7:27 — a deuterocanon self-link.'
  FROM cross_reference_threads t, cross_references x, _session253_wis07_lookup sv, _session253_wis07_lookup tv
 WHERE t.slug='wisdom-of-solomon-7-being-but-one-makes-all-new'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=7 AND sv.verse_number=27
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=24 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ecclesiasticus 24:8 — *So the Creator of all things gave me a commandment, and he that made me caused my tabernacle to rest, and said, Let your dwelling be in Jacob, and your inheritance in Yashar''el (Israel).* Wisdom entering *holy souls* (Wisdom of Solomon 7:27) is the same Wisdom given her inheritance in Israel.'
  FROM cross_reference_threads t, cross_references x, _session253_wis07_lookup sv, _session253_wis07_lookup tv
 WHERE t.slug='wisdom-of-solomon-7-being-but-one-makes-all-new'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=7 AND sv.verse_number=27
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=24 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Wisdom of Solomon 8:1 — *Wisdom reacheth from one end to another mightily: and sweetly does she order all things.* The continuation of Solomon''s own hymn: the *one* who *makes all things new* (Wisdom of Solomon 7:27) orders all things end to end.'
  FROM cross_reference_threads t, cross_references x, _session253_wis07_lookup sv, _session253_wis07_lookup tv
 WHERE t.slug='wisdom-of-solomon-7-being-but-one-makes-all-new'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=7 AND sv.verse_number=27
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=8 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'John 1:4 — *In him was life; and the life was the light of men.* The Wisdom who *makes all things new* and enters holy souls (Wisdom of Solomon 7:27) is the life and light of John''s Logos.'
  FROM cross_reference_threads t, cross_references x, _session253_wis07_lookup sv, _session253_wis07_lookup tv
 WHERE t.slug='wisdom-of-solomon-7-being-but-one-makes-all-new'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=7 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-of-solomon-7-fairer-than-the-sun
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 1:5 — *And the light shineth in darkness; and the darkness comprehended it not.* Wisdom *found before* the light, against whom *vice shall not prevail* (Wisdom of Solomon 7:29-30), is John''s Light the darkness cannot overcome.'
  FROM cross_reference_threads t, cross_references x, _session253_wis07_lookup sv, _session253_wis07_lookup tv
 WHERE t.slug='wisdom-of-solomon-7-fairer-than-the-sun'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=7 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 1:9 — *That was the true Light, which lighteth every man that cometh into the world.* The Wisdom *more beautiful than the sun... found before* the light (Wisdom of Solomon 7:29) is the true Light of the Logos.'
  FROM cross_reference_threads t, cross_references x, _session253_wis07_lookup sv, _session253_wis07_lookup tv
 WHERE t.slug='wisdom-of-solomon-7-fairer-than-the-sun'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=7 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Corinthians 1:24 — *But unto them which are called, both Yahudim (Jews) and Greeks, Messiah (Christ) the power of Elohim (God), and the wisdom of Elohim (God).* The Wisdom against whom *vice shall not prevail* (Wisdom of Solomon 7:30) is the Messiah, the power and wisdom of Elohim.'
  FROM cross_reference_threads t, cross_references x, _session253_wis07_lookup sv, _session253_wis07_lookup tv
 WHERE t.slug='wisdom-of-solomon-7-fairer-than-the-sun'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=7 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=1 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_thewisdomofsolomon_08.sql (session253 the-wisdom-of-solomon 8) -----
-- Source anchor: apocrypha/the-wisdom-of-solomon ch8. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: wis08 (view _session253_wis08_lookup). Sort band base 58175, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_wis08_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: wisdom-8-orders-all-things-the-logos
  ('apocrypha', 'the-wisdom-of-solomon', 8, 1, 'apocrypha', 'the-wisdom-of-solomon', 7, 25, 'extras', E'Wisdom of Solomon 7:25 — *For she is the breath of the power of Yahuah (God), and a pure influence flowing from the glory of the Almighty: therefore can no defiled thing fall into her.* The wisdom who orders all things end-to-end in 8:1 is the same breath of Elohim''s power, so her sweet governance is the operation of the divine Logos.'),
  ('apocrypha', 'the-wisdom-of-solomon', 8, 1, 'apocrypha', 'the-wisdom-of-solomon', 7, 26, 'extras', E'Wisdom of Solomon 7:26 — *For she is the brightness of the everlasting light, the unspotted mirror of the power of Yahuah (God), and the image of his goodness.* The reaching, ordering Wisdom of 8:1 is the radiance and image of Elohim — the formed Wisdom the NT names the Word.'),
  ('apocrypha', 'the-wisdom-of-solomon', 8, 1, 'canon', 'proverbs', 8, 30, 'free', E'Proverbs 8:30 — *Then I was by him, as one brought up with him: and I was daily his delight, rejoicing always before him;* The Wisdom that sweetly orders all things in 8:1 is the same craftsman who was beside Yahuah ordering creation from the beginning.'),
  ('apocrypha', 'the-wisdom-of-solomon', 8, 1, 'canon', 'john', 1, 1, 'free', E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Wisdom reaching from end to end and ordering all things in 8:1 is named by John as the Word who was with Elohim and was Elohim.'),
  ('apocrypha', 'the-wisdom-of-solomon', 8, 1, 'canon', 'colossians', 1, 16, 'free', E'Colossians 1:16 — *For by him were all things created, that are in heaven, and that are in earth, visible and invisible, whether they be thrones, or dominions, or principalities, or powers: all things were created by him, and for him:* The Wisdom who ordereth all things sweetly in 8:1 is the One by whom and for whom all things were made.'),
  -- thread: wisdom-8-solomon-loves-her-as-spouse
  ('apocrypha', 'the-wisdom-of-solomon', 8, 2, 'canon', 'proverbs', 4, 6, 'free', E'Proverbs 4:6 — *Forsake her not, and she shall preserve thee: love her, and she shall keep thee.* Solomon''s desire to make Wisdom his spouse in 8:2 is the Proverbs charge to love her so that she preserves and keeps the one who holds her.'),
  ('apocrypha', 'the-wisdom-of-solomon', 8, 2, 'canon', 'proverbs', 4, 8, 'free', E'Proverbs 4:8 — *Exalt her, and she shall promote thee: she shall bring thee to honour, when thou dost embrace her.* The bride imagery of 8:2 — loving her beauty and embracing her — is the Proverbs promise that embracing Wisdom brings honour.'),
  ('apocrypha', 'the-wisdom-of-solomon', 8, 2, 'apocrypha', 'the-wisdom-of-solomon', 6, 12, 'extras', E'Wisdom of Solomon 6:12 — *Wisdom is glorious, and never fadeth away: yes, she is easily seen of them that love her, and found of such as seek her.* The youth who sought her out and loved her beauty in 8:2 is the lover whom 6:12 promises will easily find her.'),
  ('apocrypha', 'the-wisdom-of-solomon', 8, 2, 'apocrypha', 'the-wisdom-of-solomon', 6, 18, 'extras', E'Wisdom of Solomon 6:18 — *And love is the keeping of her laws; and the giving heed to her laws is the assurance of incorruption;* The love of Wisdom that Solomon professes in 8:2 is defined within the same book as the keeping of her laws — Torah-fidelity, not mere affection.'),
  -- thread: wisdom-8-privy-to-the-mysteries-of-elohim
  ('apocrypha', 'the-wisdom-of-solomon', 8, 4, 'apocrypha', 'ecclesiasticus', 24, 3, 'extras', E'Ecclesiasticus 24:3 — *I came out of the mouth of the Most High, and covered the earth as a cloud.* The Wisdom privy to the mysteries of Yahuah in 8:4 is the same who in Sirach proceeds from the mouth of the Most High to fill the earth.'),
  ('apocrypha', 'the-wisdom-of-solomon', 8, 4, 'apocrypha', 'ecclesiasticus', 24, 8, 'extras', E'Ecclesiasticus 24:8 — *So the Creator of all things gave me a commandment, and he that made me caused my tabernacle to rest, and said, Let your dwelling be in Jacob, and your inheritance in Yashar''el (Israel).* The Wisdom conversant with Yahuah in 8:3 is given her dwelling among the covenant people — election kept, not a church replacing Israel.'),
  ('apocrypha', 'the-wisdom-of-solomon', 8, 4, 'canon', '1-corinthians', 1, 24, 'free', E'1 Corinthians 1:24 — *But unto them which are called, both Yahudim (Jews) and Greeks, Messiah (Christ) the power of Elohim (God), and the wisdom of Elohim (God).* The Wisdom privy to the mysteries of Elohim in 8:4 is named the wisdom of Elohim — Messiah Himself.'),
  ('apocrypha', 'the-wisdom-of-solomon', 8, 4, 'canon', 'colossians', 2, 3, 'free', E'Colossians 2:3 — *In whom are hid all the treasures of wisdom and knowledge.* The mysteries of the knowledge of Yahuah to which Wisdom is privy in 8:4 are the treasures hid in Messiah.'),
  -- thread: wisdom-8-teaches-temperance-prudence-justice-fortitude
  ('apocrypha', 'the-wisdom-of-solomon', 8, 7, 'canon', '1-kings', 3, 9, 'free', E'1 Kings 3:9 — *Give therefore thy servant an understanding heart to judge thy people, that I may discern between good and bad: for who is able to judge this thy so great a people?* The justice and prudence Wisdom teaches in 8:7 is the very discerning heart Solomon asked of Yahuah at Gibeon.'),
  ('apocrypha', 'the-wisdom-of-solomon', 8, 7, 'canon', '1-kings', 3, 12, 'free', E'1 Kings 3:12 — *Behold, I have done according to thy words: lo, I have given thee a wise and an understanding heart; so that there was none like thee before thee, neither after thee shall any arise like unto thee.* The virtues Wisdom imparts in 8:7 are the wise and understanding heart Yahuah granted Solomon above all men.'),
  ('apocrypha', 'the-wisdom-of-solomon', 8, 8, 'canon', 'james', 1, 5, 'free', E'James 1:5 — *If any of you lack wisdom, let him ask of Elohim (God), that giveth to all men liberally, and upbraideth not; and it shall be given him.* The wisdom that knows things of old and what is to come in 8:8 is the gift James says is freely given to any who ask Elohim.'),
  ('apocrypha', 'the-wisdom-of-solomon', 8, 8, 'apocrypha', 'ecclesiasticus', 24, 4, 'extras', E'Ecclesiasticus 24:4 — *I dwelt in high places, and my throne is in a cloudy pillar.* The Wisdom who foresees signs, wonders, and the events of seasons in 8:8 is the same enthroned heavenly Wisdom of Sirach 24, surveying the times from on high.'),
  -- thread: wisdom-8-immortality-and-prayer-to-obtain
  ('apocrypha', 'the-wisdom-of-solomon', 8, 21, 'apocrypha', 'the-wisdom-of-solomon', 9, 9, 'extras', E'Wisdom of Solomon 9:9 — *And wisdom was with you: which knoweth your works, and was present when you madest the world, and knew what was acceptable in your sight, and right in your commandments.* The prayer Solomon begins in 8:21 unfolds in chapter 9, confessing that Wisdom was present at creation and knows Yahuah''s commandments.'),
  ('apocrypha', 'the-wisdom-of-solomon', 8, 13, 'apocrypha', 'the-wisdom-of-solomon', 3, 1, 'extras', E'Wisdom of Solomon 3:1 — *But the souls of the righteous are in the hand of Yahuah (God), and there shall no torment touch them.* The immortality Wisdom secures in 8:13 is the same resurrection hope of chapter 3, the righteous kept safe in Elohim''s hand.'),
  ('apocrypha', 'the-wisdom-of-solomon', 8, 17, 'canon', 'daniel', 12, 2, 'free', E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The alliance with wisdom that is immortality in 8:17 is grounded in the prophetic promise of resurrection to everlasting life.'),
  ('apocrypha', 'the-wisdom-of-solomon', 8, 21, 'apocrypha', 'the-wisdom-of-solomon', 6, 19, 'extras', E'Wisdom of Solomon 6:19 — *And incorruption makes us near to Yahuah (God):* Solomon''s plea to obtain Wisdom as the gift of Elohim in 8:21 reaches toward the incorruption that 6:19 says brings the seeker near to Yahuah.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_wis08_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_wis08_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-8-orders-all-things-the-logos',
       E'Wisdom reacheth from end to end and ordereth all things — the Formed Logos',
       E'Solomon opens chapter 8 with the cosmic reach of Wisdom: *Wisdom reacheth from one end to another mightily: and sweetly does she order all things.* (Wisdom of Solomon 8:1) She is no abstraction but the same Formed Wisdom of chapter 7 — *she is the breath of the power of Yahuah (God), and a pure influence flowing from the glory of the Almighty: therefore can no defiled thing fall into her.* (Wisdom of Solomon 7:25) and *she is the brightness of the everlasting light, the unspotted mirror of the power of Yahuah (God), and the image of his goodness.* (Wisdom of Solomon 7:26) This is the very figure of Proverbs, the craftsman daily delighting before Yahuah at the founding of the world — *Then I was by him, as one brought up with him: and I was daily his delight, rejoicing always before him;* (Proverbs 8:30) The NT names her plainly: *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* (John 1:1) and *All things were made by him; and without him was not any thing made that was made.* (John 1:3) — the One by whom and for whom all was created, *For by him were all things created, that are in heaven, and that are in earth, visible and invisible, whether they be thrones, or dominions, or principalities, or powers: all things were created by him, and for him:* (Colossians 1:16). It ain''t new: the deuterocanon already confessed the ordering Word.',
       sv.verse_id, ev.verse_id, 'extras', 58175
  FROM _session253_wis08_lookup sv, _session253_wis08_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=8 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=8 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-8-solomon-loves-her-as-spouse',
       E'I desired to make her my spouse — love her and she shall preserve thee',
       E'Solomon courts Wisdom as a bride: *I loved her, and sought her out from my youth, I desired to make her my spouse, and I was a lover of her beauty.* (Wisdom of Solomon 8:2) She is the LiveLikeMessiah delight, the one to be embraced — Proverbs gives the same nuptial charge: *Forsake her not, and she shall preserve thee: love her, and she shall keep thee.* (Proverbs 4:6) and *Exalt her, and she shall promote thee: she shall bring thee to honour, when thou dost embrace her.* (Proverbs 4:8) Within the apocrypha itself she answers those who love her early — *Wisdom is glorious, and never fadeth away: yes, she is easily seen of them that love her, and found of such as seek her.* (Wisdom of Solomon 6:12). The love is not sentiment but Torah-keeping: *And love is the keeping of her laws; and the giving heed to her laws is the assurance of incorruption;* (Wisdom of Solomon 6:18) — the same covenant fidelity the whole library guards.',
       sv.verse_id, ev.verse_id, 'extras', 58178
  FROM _session253_wis08_lookup sv, _session253_wis08_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=8 AND sv.verse_number=2
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=8 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-8-privy-to-the-mysteries-of-elohim',
       E'Privy to the mysteries of Yahuah — in whom are hid all the treasures',
       E'Wisdom is kin to Elohim and keeper of His counsels: *In that she is conversant with Yahuah (God), she magnifies her nobility: yes, Yahuah (God) of all things himself loved her.* (Wisdom of Solomon 8:3) and *For she is privy to the mysteries of the knowledge of Yahuah (God), and a lover of his works.* (Wisdom of Solomon 8:4) Sirach makes her the very word from the divine mouth, given an inheritance in the covenant people — *I came out of the mouth of the Most High, and covered the earth as a cloud.* (Ecclesiasticus 24:3) and *So the Creator of all things gave me a commandment, and he that made me caused my tabernacle to rest, and said, Let your dwelling be in Jacob, and your inheritance in Yashar''el (Israel).* (Ecclesiasticus 24:8). The NT seals it: this hidden mystery is Messiah, *Messiah (Christ) the power of Elohim (God), and the wisdom of Elohim (God).* (1 Corinthians 1:24), *In whom are hid all the treasures of wisdom and knowledge.* (Colossians 2:3). The mysteries to which Wisdom is privy are hid in Him.',
       sv.verse_id, ev.verse_id, 'extras', 58181
  FROM _session253_wis08_lookup sv, _session253_wis08_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=8 AND sv.verse_number=3
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=8 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-8-teaches-temperance-prudence-justice-fortitude',
       E'She teacheth the virtues — knoweth things of old and what is to come',
       E'Wisdom is the teacher of the cardinal virtues and the discerner of times: *And if a man love righteousness her labours are virtues: for she teaches temperance and prudence, justice and fortitude: which are such things, as men can have nothing more profitable in their life.* (Wisdom of Solomon 8:7) and *If a man desire much experience, she knoweth things of old, and conjectureth aright what is to come: she knoweth the subtilties of speeches, and can expound dark sentences: she foreseeth signs and wonders, and the events of seasons and times.* (Wisdom of Solomon 8:8) This is exactly what Solomon begged of Yahuah at Gibeon — *Give therefore thy servant an understanding heart to judge thy people, that I may discern between good and bad: for who is able to judge this thy so great a people?* (1 Kings 3:9) — and which was granted, *Behold, I have done according to thy words: lo, I have given thee a wise and an understanding heart; so that there was none like thee before thee, neither after thee shall any arise like unto thee.* (1 Kings 3:12). Such wisdom is still ours for the asking: *If any of you lack wisdom, let him ask of Elohim (God), that giveth to all men liberally, and upbraideth not; and it shall be given him.* (James 1:5).',
       sv.verse_id, ev.verse_id, 'extras', 58184
  FROM _session253_wis08_lookup sv, _session253_wis08_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=8 AND sv.verse_number=7
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=8 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-8-immortality-and-prayer-to-obtain',
       E'By her immortality — Solomon prays to obtain the gift of Elohim',
       E'Solomon''s pursuit ends where it must, in immortality and in prayer: *Moreover by the means of her I shall obtain immortality, and leave behind me an everlasting memorial to them that come after me.* (Wisdom of Solomon 8:13) and *Now when I considered these things in myself, and pondered them in my heart, how that to be allied to wisdom is immortality;* (Wisdom of Solomon 8:17). For Wisdom cannot be seized, only received as gift — *Nevertheless, when I perceived that I could not otherwise obtain her, except Yahuah (God) gave her me; and that was a point of wisdom also to know whose gift she was; I prayed to Yahuah (God), and besought him, and with my whole heart I said,* (Wisdom of Solomon 8:21). Within the book this prayer breaks open into chapter 9 — *And wisdom was with you: which knoweth your works, and was present when you madest the world, and knew what was acceptable in your sight, and right in your commandments.* (Wisdom of Solomon 9:9). The immortality wisdom secures is the resurrection hope the whole library carries — *the souls of the righteous are in the hand of Yahuah (God)* (Wisdom of Solomon 3:1) — answered in the prophets: *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* (Daniel 12:2).',
       sv.verse_id, ev.verse_id, 'extras', 58187
  FROM _session253_wis08_lookup sv, _session253_wis08_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=8 AND sv.verse_number=13
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=8 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: wisdom-8-orders-all-things-the-logos
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Wisdom of Solomon 7:25 — *For she is the breath of the power of Yahuah (God), and a pure influence flowing from the glory of the Almighty: therefore can no defiled thing fall into her.* The wisdom who orders all things end-to-end in 8:1 is the same breath of Elohim''s power, so her sweet governance is the operation of the divine Logos.'
  FROM cross_reference_threads t, cross_references x, _session253_wis08_lookup sv, _session253_wis08_lookup tv
 WHERE t.slug='wisdom-8-orders-all-things-the-logos'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=8 AND sv.verse_number=1
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=7 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Wisdom of Solomon 7:26 — *For she is the brightness of the everlasting light, the unspotted mirror of the power of Yahuah (God), and the image of his goodness.* The reaching, ordering Wisdom of 8:1 is the radiance and image of Elohim — the formed Wisdom the NT names the Word.'
  FROM cross_reference_threads t, cross_references x, _session253_wis08_lookup sv, _session253_wis08_lookup tv
 WHERE t.slug='wisdom-8-orders-all-things-the-logos'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=8 AND sv.verse_number=1
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=7 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 8:30 — *Then I was by him, as one brought up with him: and I was daily his delight, rejoicing always before him;* The Wisdom that sweetly orders all things in 8:1 is the same craftsman who was beside Yahuah ordering creation from the beginning.'
  FROM cross_reference_threads t, cross_references x, _session253_wis08_lookup sv, _session253_wis08_lookup tv
 WHERE t.slug='wisdom-8-orders-all-things-the-logos'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=8 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=8 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Wisdom reaching from end to end and ordering all things in 8:1 is named by John as the Word who was with Elohim and was Elohim.'
  FROM cross_reference_threads t, cross_references x, _session253_wis08_lookup sv, _session253_wis08_lookup tv
 WHERE t.slug='wisdom-8-orders-all-things-the-logos'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=8 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Colossians 1:16 — *For by him were all things created, that are in heaven, and that are in earth, visible and invisible, whether they be thrones, or dominions, or principalities, or powers: all things were created by him, and for him:* The Wisdom who ordereth all things sweetly in 8:1 is the One by whom and for whom all things were made.'
  FROM cross_reference_threads t, cross_references x, _session253_wis08_lookup sv, _session253_wis08_lookup tv
 WHERE t.slug='wisdom-8-orders-all-things-the-logos'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=8 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=1 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-8-solomon-loves-her-as-spouse
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 4:6 — *Forsake her not, and she shall preserve thee: love her, and she shall keep thee.* Solomon''s desire to make Wisdom his spouse in 8:2 is the Proverbs charge to love her so that she preserves and keeps the one who holds her.'
  FROM cross_reference_threads t, cross_references x, _session253_wis08_lookup sv, _session253_wis08_lookup tv
 WHERE t.slug='wisdom-8-solomon-loves-her-as-spouse'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=8 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=4 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 4:8 — *Exalt her, and she shall promote thee: she shall bring thee to honour, when thou dost embrace her.* The bride imagery of 8:2 — loving her beauty and embracing her — is the Proverbs promise that embracing Wisdom brings honour.'
  FROM cross_reference_threads t, cross_references x, _session253_wis08_lookup sv, _session253_wis08_lookup tv
 WHERE t.slug='wisdom-8-solomon-loves-her-as-spouse'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=8 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=4 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Wisdom of Solomon 6:12 — *Wisdom is glorious, and never fadeth away: yes, she is easily seen of them that love her, and found of such as seek her.* The youth who sought her out and loved her beauty in 8:2 is the lover whom 6:12 promises will easily find her.'
  FROM cross_reference_threads t, cross_references x, _session253_wis08_lookup sv, _session253_wis08_lookup tv
 WHERE t.slug='wisdom-8-solomon-loves-her-as-spouse'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=8 AND sv.verse_number=2
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=6 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Wisdom of Solomon 6:18 — *And love is the keeping of her laws; and the giving heed to her laws is the assurance of incorruption;* The love of Wisdom that Solomon professes in 8:2 is defined within the same book as the keeping of her laws — Torah-fidelity, not mere affection.'
  FROM cross_reference_threads t, cross_references x, _session253_wis08_lookup sv, _session253_wis08_lookup tv
 WHERE t.slug='wisdom-8-solomon-loves-her-as-spouse'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=8 AND sv.verse_number=2
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=6 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-8-privy-to-the-mysteries-of-elohim
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ecclesiasticus 24:3 — *I came out of the mouth of the Most High, and covered the earth as a cloud.* The Wisdom privy to the mysteries of Yahuah in 8:4 is the same who in Sirach proceeds from the mouth of the Most High to fill the earth.'
  FROM cross_reference_threads t, cross_references x, _session253_wis08_lookup sv, _session253_wis08_lookup tv
 WHERE t.slug='wisdom-8-privy-to-the-mysteries-of-elohim'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=8 AND sv.verse_number=4
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=24 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ecclesiasticus 24:8 — *So the Creator of all things gave me a commandment, and he that made me caused my tabernacle to rest, and said, Let your dwelling be in Jacob, and your inheritance in Yashar''el (Israel).* The Wisdom conversant with Yahuah in 8:3 is given her dwelling among the covenant people — election kept, not a church replacing Israel.'
  FROM cross_reference_threads t, cross_references x, _session253_wis08_lookup sv, _session253_wis08_lookup tv
 WHERE t.slug='wisdom-8-privy-to-the-mysteries-of-elohim'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=8 AND sv.verse_number=4
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=24 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Corinthians 1:24 — *But unto them which are called, both Yahudim (Jews) and Greeks, Messiah (Christ) the power of Elohim (God), and the wisdom of Elohim (God).* The Wisdom privy to the mysteries of Elohim in 8:4 is named the wisdom of Elohim — Messiah Himself.'
  FROM cross_reference_threads t, cross_references x, _session253_wis08_lookup sv, _session253_wis08_lookup tv
 WHERE t.slug='wisdom-8-privy-to-the-mysteries-of-elohim'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=8 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=1 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Colossians 2:3 — *In whom are hid all the treasures of wisdom and knowledge.* The mysteries of the knowledge of Yahuah to which Wisdom is privy in 8:4 are the treasures hid in Messiah.'
  FROM cross_reference_threads t, cross_references x, _session253_wis08_lookup sv, _session253_wis08_lookup tv
 WHERE t.slug='wisdom-8-privy-to-the-mysteries-of-elohim'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=8 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=2 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-8-teaches-temperance-prudence-justice-fortitude
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Kings 3:9 — *Give therefore thy servant an understanding heart to judge thy people, that I may discern between good and bad: for who is able to judge this thy so great a people?* The justice and prudence Wisdom teaches in 8:7 is the very discerning heart Solomon asked of Yahuah at Gibeon.'
  FROM cross_reference_threads t, cross_references x, _session253_wis08_lookup sv, _session253_wis08_lookup tv
 WHERE t.slug='wisdom-8-teaches-temperance-prudence-justice-fortitude'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=8 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=3 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Kings 3:12 — *Behold, I have done according to thy words: lo, I have given thee a wise and an understanding heart; so that there was none like thee before thee, neither after thee shall any arise like unto thee.* The virtues Wisdom imparts in 8:7 are the wise and understanding heart Yahuah granted Solomon above all men.'
  FROM cross_reference_threads t, cross_references x, _session253_wis08_lookup sv, _session253_wis08_lookup tv
 WHERE t.slug='wisdom-8-teaches-temperance-prudence-justice-fortitude'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=8 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=3 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'James 1:5 — *If any of you lack wisdom, let him ask of Elohim (God), that giveth to all men liberally, and upbraideth not; and it shall be given him.* The wisdom that knows things of old and what is to come in 8:8 is the gift James says is freely given to any who ask Elohim.'
  FROM cross_reference_threads t, cross_references x, _session253_wis08_lookup sv, _session253_wis08_lookup tv
 WHERE t.slug='wisdom-8-teaches-temperance-prudence-justice-fortitude'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=8 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ecclesiasticus 24:4 — *I dwelt in high places, and my throne is in a cloudy pillar.* The Wisdom who foresees signs, wonders, and the events of seasons in 8:8 is the same enthroned heavenly Wisdom of Sirach 24, surveying the times from on high.'
  FROM cross_reference_threads t, cross_references x, _session253_wis08_lookup sv, _session253_wis08_lookup tv
 WHERE t.slug='wisdom-8-teaches-temperance-prudence-justice-fortitude'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=8 AND sv.verse_number=8
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=24 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-8-immortality-and-prayer-to-obtain
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Wisdom of Solomon 9:9 — *And wisdom was with you: which knoweth your works, and was present when you madest the world, and knew what was acceptable in your sight, and right in your commandments.* The prayer Solomon begins in 8:21 unfolds in chapter 9, confessing that Wisdom was present at creation and knows Yahuah''s commandments.'
  FROM cross_reference_threads t, cross_references x, _session253_wis08_lookup sv, _session253_wis08_lookup tv
 WHERE t.slug='wisdom-8-immortality-and-prayer-to-obtain'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=8 AND sv.verse_number=21
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=9 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Wisdom of Solomon 3:1 — *But the souls of the righteous are in the hand of Yahuah (God), and there shall no torment touch them.* The immortality Wisdom secures in 8:13 is the same resurrection hope of chapter 3, the righteous kept safe in Elohim''s hand.'
  FROM cross_reference_threads t, cross_references x, _session253_wis08_lookup sv, _session253_wis08_lookup tv
 WHERE t.slug='wisdom-8-immortality-and-prayer-to-obtain'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=8 AND sv.verse_number=13
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=3 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The alliance with wisdom that is immortality in 8:17 is grounded in the prophetic promise of resurrection to everlasting life.'
  FROM cross_reference_threads t, cross_references x, _session253_wis08_lookup sv, _session253_wis08_lookup tv
 WHERE t.slug='wisdom-8-immortality-and-prayer-to-obtain'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=8 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Wisdom of Solomon 6:19 — *And incorruption makes us near to Yahuah (God):* Solomon''s plea to obtain Wisdom as the gift of Elohim in 8:21 reaches toward the incorruption that 6:19 says brings the seeker near to Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session253_wis08_lookup sv, _session253_wis08_lookup tv
 WHERE t.slug='wisdom-8-immortality-and-prayer-to-obtain'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=8 AND sv.verse_number=21
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=6 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_thewisdomofsolomon_09.sql (session253 the-wisdom-of-solomon 9) -----
-- Source anchor: apocrypha/the-wisdom-of-solomon ch9. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: wis09 (view _session253_wis09_lookup). Sort band base 58200, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_wis09_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: wisdom-9-solomon-asks-for-wisdom
  ('apocrypha', 'the-wisdom-of-solomon', 9, 4, 'canon', '1-kings', 3, 9, 'free', E'1 Kings 3:9 — *Give therefore thy servant an understanding heart to judge thy people, that I may discern between good and bad: for who is able to judge this thy so great a people?* Solomon''s plea for throne-wisdom in Wisdom 9:4 is the same petition for a discerning heart at Gibeon.'),
  ('apocrypha', 'the-wisdom-of-solomon', 9, 5, 'canon', '2-chronicles', 1, 10, 'free', E'2 Chronicles 1:10 — *Give me now wisdom and knowledge, that I may go out and come in before this people: for who can judge this thy people, that is so great?* Solomon''s confession of being too young for judgment (Wisdom 9:5) is answered by this Chronicles prayer for wisdom to govern.'),
  ('apocrypha', 'the-wisdom-of-solomon', 9, 6, 'canon', 'james', 1, 5, 'free', E'James 1:5 — *If any of you lack wisdom, let him ask of God, that giveth to all men liberally, and upbraideth not; and it shall be given him.* Wisdom 9:6 — that the perfect man is nothing without wisdom — is why James commands the lacking to ask the giving Elohim.'),
  -- thread: wisdom-9-wisdom-present-at-creation
  ('apocrypha', 'the-wisdom-of-solomon', 9, 9, 'canon', 'proverbs', 8, 30, 'free', E'Proverbs 8:30 — *Then I was by him, as one brought up with him: and I was daily his delight, rejoicing always before him.* Wisdom present when Yahuah made the world (Wisdom 9:9) is the formed Wisdom rejoicing beside Him in Proverbs 8.'),
  ('apocrypha', 'the-wisdom-of-solomon', 9, 9, 'canon', 'john', 1, 3, 'free', E'John 1:3 — *All things were made by him; and without him was not any thing made that was made.* Wisdom 9:9 — wisdom knowing the works and present at the world''s making — is the Logos through whom all was made.'),
  ('apocrypha', 'the-wisdom-of-solomon', 9, 9, 'canon', 'colossians', 1, 16, 'free', E'Colossians 1:16 — *For by him were all things created, that are in heaven, and that are in earth, visible and invisible, whether they be thrones, or dominions, or principalities, or powers: all things were created by him, and for him.* The wisdom present at creation in 9:9 is the One in whom and for whom all things were made.'),
  -- thread: wisdom-9-sent-from-the-throne
  ('apocrypha', 'the-wisdom-of-solomon', 9, 10, 'canon', 'proverbs', 2, 6, 'free', E'Proverbs 2:6 — *For the LORD giveth wisdom: out of his mouth cometh knowledge and understanding.* Solomon''s plea to have wisdom sent from the holy heavens (Wisdom 9:10) rests on Yahuah being the sole giver of wisdom.'),
  ('apocrypha', 'the-wisdom-of-solomon', 9, 10, 'canon', 'john', 3, 13, 'free', E'John 3:13 — *And no man hath ascended up to heaven, but he that came down from heaven, even the Son of man which is in heaven.* Wisdom sent down from the throne of glory (Wisdom 9:10) matches the descent of the Son who alone brings heavenly things.'),
  -- thread: wisdom-9-who-can-know-the-counsel
  ('apocrypha', 'the-wisdom-of-solomon', 9, 13, 'canon', 'isaiah', 40, 13, 'free', E'Isaiah 40:13 — *Who hath directed the Spirit of the LORD, or being his counsellor hath taught him?* Solomon''s question — what man can know the counsel of Yahuah (Wisdom 9:13) — is Isaiah''s challenge to the mind that would counsel its Maker.'),
  ('apocrypha', 'the-wisdom-of-solomon', 9, 13, 'canon', 'romans', 11, 34, 'free', E'Romans 11:34 — *For who hath known the mind of the Lord? or who hath been his counsellor?* Paul''s doxology echoes Wisdom 9:13 — no mortal can know the counsel of Yahuah apart from His own revealing.'),
  ('apocrypha', 'the-wisdom-of-solomon', 9, 16, 'canon', 'john', 3, 12, 'free', E'John 3:12 — *If I have told you earthly things, and ye believe not, how shall ye believe, if I tell you of heavenly things?* Wisdom 9:16 — that the things in heaven none has searched out — is the very gap Messiah names to Nicodemus.'),
  -- thread: wisdom-9-spirit-from-above-saved-through-wisdom
  ('apocrypha', 'the-wisdom-of-solomon', 9, 17, 'canon', '1-corinthians', 2, 10, 'free', E'1 Corinthians 2:10 — *But God hath revealed them unto us by his Spirit: for the Spirit searcheth all things, yea, the deep things of God.* Wisdom 9:17 — that none knows Yahuah''s counsel unless He sends the Ruach HaKodesh — is exactly the Spirit who searches the deep things of Elohim.'),
  ('apocrypha', 'the-wisdom-of-solomon', 9, 17, 'canon', 'john', 16, 13, 'free', E'John 16:13 — *Howbeit when he, the Spirit of truth, is come, he will guide you into all truth: for he shall not speak of himself; but whatsoever he shall hear, that shall he speak: and he will shew you things to come.* The Spirit sent from above to teach (Wisdom 9:17) is the Spirit of truth who guides into all truth.'),
  ('apocrypha', 'the-wisdom-of-solomon', 9, 18, 'canon', 'proverbs', 3, 6, 'free', E'Proverbs 3:6 — *In all thy ways acknowledge him, and he shall direct thy paths.* Wisdom 9:18 — men''s ways reformed and saved through wisdom — is the directed path of the one who acknowledges Yahuah in all his ways.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_wis09_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_wis09_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-9-solomon-asks-for-wisdom',
       E'Solomon''s prayer — give me wisdom that sits by Your throne',
       E'Solomon prays as a young, untried king: *Give me wisdom, that sits by your throne; and reject me not from among your children* (The Wisdom of Solomon 9:4), confessing *I your servant and son of yours handmaid am a feeble person, and of a short time, and too young for the understanding of judgment and laws* (The Wisdom of Solomon 9:5). This is the prayer the Tanakh records at Gibeon, where Yahuah is pleased that Solomon asks not for long life or riches but for discernment: *Give therefore thy servant an understanding heart to judge thy people, that I may discern between good and bad* (1 Kings 3:9), and the parallel *Give me now wisdom and knowledge, that I may go out and come in before this people* (2 Chronicles 1:10). The NT carries the same posture forward — wisdom is still a gift to be asked for: *If any of you lack wisdom, let him ask of God, that giveth to all men liberally, and upbraideth not; and it shall be given him* (James 1:5). It ain''t new: the throne-wisdom Solomon begs for is the same Spirit James says is given to the humble who ask.',
       sv.verse_id, ev.verse_id, 'extras', 58200
  FROM _session253_wis09_lookup sv, _session253_wis09_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=9 AND sv.verse_number=4
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=9 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-9-wisdom-present-at-creation',
       E'Wisdom present when You made the world',
       E'Solomon names wisdom as the one who stood beside Yahuah at the founding of all things: *And wisdom was with you: which knoweth your works, and was present when you madest the world, and knew what was acceptable in your sight, and right in your commandments* (The Wisdom of Solomon 9:9). This is the formed Wisdom of Proverbs, the craftsman beside Yahuah before the deep was: *Then I was by him, as one brought up with him: and I was daily his delight, rejoicing always before him* (Proverbs 8:30), the Wisdom by whom *Yahuah by wisdom hath founded the earth* (Proverbs 3:19). The NT names this Wisdom as the Logos through whom the worlds were framed: *All things were made by him; and without him was not any thing made that was made* (John 1:3), and *by him were all things created, that are in heaven, and that are in earth* (Colossians 1:16). It ain''t new: the Wisdom present at creation in 9:9 is the Word made flesh.',
       sv.verse_id, ev.verse_id, 'extras', 58203
  FROM _session253_wis09_lookup sv, _session253_wis09_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=9 AND sv.verse_number=9
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=9 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-9-sent-from-the-throne',
       E'Send her out of Your holy heavens — wisdom from the throne',
       E'Solomon asks not to summon wisdom upward but to have her sent down: *O send her out of your holy heavens, and from the throne of your glory, that being present she may labour with me, that I may know what is pleasing to you* (The Wisdom of Solomon 9:10). Wisdom is a gift dispatched from above, never grasped from below — *For Yahuah giveth wisdom: out of his mouth cometh knowledge and understanding* (Proverbs 2:6). The same descent-not-ascent logic anchors Messiah''s word to Nicodemus: heavenly things are known only because One came down from the throne — *And no man hath ascended up to heaven, but he that came down from heaven, even the Son of man which is in heaven* (John 3:13). It ain''t new: wisdom sent from the throne of glory in 9:10 is the heavenly gift that descends, not the human ascent that fails.',
       sv.verse_id, ev.verse_id, 'extras', 58206
  FROM _session253_wis09_lookup sv, _session253_wis09_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=9 AND sv.verse_number=10
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=9 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-9-who-can-know-the-counsel',
       E'Who can know the counsel of Yahuah?',
       E'Solomon presses the limit of the unaided mind: *For what man is he that can know the counsel of Yahuah (God)? or who can think what the will of Yahuah (God) is?* (The Wisdom of Solomon 9:13), for *the corruptible body presseth down the soul, and the earthy tabernacle weigheth down the mind that museth upon many things* (The Wisdom of Solomon 9:15), and *the things that are in heaven who has searched out?* (The Wisdom of Solomon 9:16). Isaiah set the question first: *Who hath directed the Spirit of the LORD, or being his counsellor hath taught him?* (Isaiah 40:13). Paul quotes that very line as the doxology closing his mystery of election: *For who hath known the mind of the Lord? or who hath been his counsellor?* (Romans 11:34). And Messiah seals it for Nicodemus: *If I have told you earthly things, and ye believe not, how shall ye believe, if I tell you of heavenly things?* (John 3:12). It ain''t new: the unsearchable counsel of 9:13-16 is the mind of Yahuah that only the sent Spirit reveals.',
       sv.verse_id, ev.verse_id, 'extras', 58209
  FROM _session253_wis09_lookup sv, _session253_wis09_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=9 AND sv.verse_number=13
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=9 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-9-spirit-from-above-saved-through-wisdom',
       E'Except You send Your Ruach HaKodesh from above',
       E'The chapter''s hinge is the gift of the Spirit: *And your counsel who has known, except you give wisdom, and send your Ruach HaKodesh (Holy Spirit) from above?* (The Wisdom of Solomon 9:17), so that *the ways of them which lived on the earth were reformed, and men were taught the things that are pleasing to you, and were saved through wisdom* (The Wisdom of Solomon 9:18). The counsel of Yahuah is searched out only by His Spirit: *the Spirit searcheth all things, yea, the deep things of God* (1 Corinthians 2:10), and the Comforter *will guide you into all truth* (John 16:13). It ain''t new: the Ruach HaKodesh sent from above to teach and to save in 9:17-18 is the same Spirit of truth poured out to lead the reformed into all that is pleasing to Yahuah.',
       sv.verse_id, ev.verse_id, 'extras', 58212
  FROM _session253_wis09_lookup sv, _session253_wis09_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=9 AND sv.verse_number=17
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=9 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: wisdom-9-solomon-asks-for-wisdom
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Kings 3:9 — *Give therefore thy servant an understanding heart to judge thy people, that I may discern between good and bad: for who is able to judge this thy so great a people?* Solomon''s plea for throne-wisdom in Wisdom 9:4 is the same petition for a discerning heart at Gibeon.'
  FROM cross_reference_threads t, cross_references x, _session253_wis09_lookup sv, _session253_wis09_lookup tv
 WHERE t.slug='wisdom-9-solomon-asks-for-wisdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=9 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=3 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Chronicles 1:10 — *Give me now wisdom and knowledge, that I may go out and come in before this people: for who can judge this thy people, that is so great?* Solomon''s confession of being too young for judgment (Wisdom 9:5) is answered by this Chronicles prayer for wisdom to govern.'
  FROM cross_reference_threads t, cross_references x, _session253_wis09_lookup sv, _session253_wis09_lookup tv
 WHERE t.slug='wisdom-9-solomon-asks-for-wisdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=9 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=1 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'James 1:5 — *If any of you lack wisdom, let him ask of God, that giveth to all men liberally, and upbraideth not; and it shall be given him.* Wisdom 9:6 — that the perfect man is nothing without wisdom — is why James commands the lacking to ask the giving Elohim.'
  FROM cross_reference_threads t, cross_references x, _session253_wis09_lookup sv, _session253_wis09_lookup tv
 WHERE t.slug='wisdom-9-solomon-asks-for-wisdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=9 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-9-wisdom-present-at-creation
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 8:30 — *Then I was by him, as one brought up with him: and I was daily his delight, rejoicing always before him.* Wisdom present when Yahuah made the world (Wisdom 9:9) is the formed Wisdom rejoicing beside Him in Proverbs 8.'
  FROM cross_reference_threads t, cross_references x, _session253_wis09_lookup sv, _session253_wis09_lookup tv
 WHERE t.slug='wisdom-9-wisdom-present-at-creation'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=9 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=8 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 1:3 — *All things were made by him; and without him was not any thing made that was made.* Wisdom 9:9 — wisdom knowing the works and present at the world''s making — is the Logos through whom all was made.'
  FROM cross_reference_threads t, cross_references x, _session253_wis09_lookup sv, _session253_wis09_lookup tv
 WHERE t.slug='wisdom-9-wisdom-present-at-creation'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=9 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Colossians 1:16 — *For by him were all things created, that are in heaven, and that are in earth, visible and invisible, whether they be thrones, or dominions, or principalities, or powers: all things were created by him, and for him.* The wisdom present at creation in 9:9 is the One in whom and for whom all things were made.'
  FROM cross_reference_threads t, cross_references x, _session253_wis09_lookup sv, _session253_wis09_lookup tv
 WHERE t.slug='wisdom-9-wisdom-present-at-creation'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=9 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=1 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-9-sent-from-the-throne
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 2:6 — *For the LORD giveth wisdom: out of his mouth cometh knowledge and understanding.* Solomon''s plea to have wisdom sent from the holy heavens (Wisdom 9:10) rests on Yahuah being the sole giver of wisdom.'
  FROM cross_reference_threads t, cross_references x, _session253_wis09_lookup sv, _session253_wis09_lookup tv
 WHERE t.slug='wisdom-9-sent-from-the-throne'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=9 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=2 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 3:13 — *And no man hath ascended up to heaven, but he that came down from heaven, even the Son of man which is in heaven.* Wisdom sent down from the throne of glory (Wisdom 9:10) matches the descent of the Son who alone brings heavenly things.'
  FROM cross_reference_threads t, cross_references x, _session253_wis09_lookup sv, _session253_wis09_lookup tv
 WHERE t.slug='wisdom-9-sent-from-the-throne'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=9 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=3 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-9-who-can-know-the-counsel
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 40:13 — *Who hath directed the Spirit of the LORD, or being his counsellor hath taught him?* Solomon''s question — what man can know the counsel of Yahuah (Wisdom 9:13) — is Isaiah''s challenge to the mind that would counsel its Maker.'
  FROM cross_reference_threads t, cross_references x, _session253_wis09_lookup sv, _session253_wis09_lookup tv
 WHERE t.slug='wisdom-9-who-can-know-the-counsel'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=9 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=40 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 11:34 — *For who hath known the mind of the Lord? or who hath been his counsellor?* Paul''s doxology echoes Wisdom 9:13 — no mortal can know the counsel of Yahuah apart from His own revealing.'
  FROM cross_reference_threads t, cross_references x, _session253_wis09_lookup sv, _session253_wis09_lookup tv
 WHERE t.slug='wisdom-9-who-can-know-the-counsel'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=9 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 3:12 — *If I have told you earthly things, and ye believe not, how shall ye believe, if I tell you of heavenly things?* Wisdom 9:16 — that the things in heaven none has searched out — is the very gap Messiah names to Nicodemus.'
  FROM cross_reference_threads t, cross_references x, _session253_wis09_lookup sv, _session253_wis09_lookup tv
 WHERE t.slug='wisdom-9-who-can-know-the-counsel'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=9 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=3 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-9-spirit-from-above-saved-through-wisdom
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Corinthians 2:10 — *But God hath revealed them unto us by his Spirit: for the Spirit searcheth all things, yea, the deep things of God.* Wisdom 9:17 — that none knows Yahuah''s counsel unless He sends the Ruach HaKodesh — is exactly the Spirit who searches the deep things of Elohim.'
  FROM cross_reference_threads t, cross_references x, _session253_wis09_lookup sv, _session253_wis09_lookup tv
 WHERE t.slug='wisdom-9-spirit-from-above-saved-through-wisdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=9 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=2 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 16:13 — *Howbeit when he, the Spirit of truth, is come, he will guide you into all truth: for he shall not speak of himself; but whatsoever he shall hear, that shall he speak: and he will shew you things to come.* The Spirit sent from above to teach (Wisdom 9:17) is the Spirit of truth who guides into all truth.'
  FROM cross_reference_threads t, cross_references x, _session253_wis09_lookup sv, _session253_wis09_lookup tv
 WHERE t.slug='wisdom-9-spirit-from-above-saved-through-wisdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=9 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=16 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 3:6 — *In all thy ways acknowledge him, and he shall direct thy paths.* Wisdom 9:18 — men''s ways reformed and saved through wisdom — is the directed path of the one who acknowledges Yahuah in all his ways.'
  FROM cross_reference_threads t, cross_references x, _session253_wis09_lookup sv, _session253_wis09_lookup tv
 WHERE t.slug='wisdom-9-spirit-from-above-saved-through-wisdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=9 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=3 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_thewisdomofsolomon_10.sql (session253 the-wisdom-of-solomon 10) -----
-- Source anchor: apocrypha/the-wisdom-of-solomon ch10. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: wis10 (view _session253_wis10_lookup). Sort band base 58225, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_wis10_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: wisdom-10-adam-formed-and-fallen
  ('apocrypha', 'the-wisdom-of-solomon', 10, 2, 'canon', 'genesis', 1, 28, 'free', E'Genesis 1:28 — *And Elohim (God) blessed them, and Elohim (God) said unto them, Be fruitful, and multiply, and replenish the earth, and subdue it: and have dominion over the fish of the sea, and over the fowl of the air, and over every living thing that moveth upon the earth.* The dominion Wisdom *gave him power to rule all things* (10:2) is the garden mandate given to the first-formed father.'),
  ('apocrypha', 'the-wisdom-of-solomon', 10, 3, 'canon', 'genesis', 4, 8, 'free', E'Genesis 4:8 — *And Cain talked with Abel his brother: and it came to pass, when they were in the field, that Cain rose up against Abel his brother, and slew him.* This is *the fury with which he murdered his brother* (10:3) — the unrighteous who *went away from her in his anger*.'),
  -- thread: wisdom-10-noah-ark-righteous-preserved
  ('apocrypha', 'the-wisdom-of-solomon', 10, 4, 'canon', 'genesis', 7, 1, 'free', E'Genesis 7:1 — *And Yahuah (LORD) said unto Noah, Come thou and all thy house into the ark; for thee have I seen righteous before me in this generation.* This is *the righteous* whose course Wisdom *directed... in a piece of wood of small value* (10:4).'),
  ('apocrypha', 'the-wisdom-of-solomon', 10, 4, 'canon', 'hebrews', 11, 7, 'free', E'Hebrews 11:7 — *By faith Noah, being warned of Elohim (God) of things not seen as yet, moved with fear, prepared an ark to the saving of his house; by the which he condemned the world, and became heir of the righteousness which is by faith.* The ark of *small value* (10:4) is the saving of the righteous house by faith.'),
  ('apocrypha', 'the-wisdom-of-solomon', 10, 4, 'jubilees', 'jubilees', 5, 22, 'extras', E'Jubilees 5:22 — *And Noah made the ark in all respects as He commanded him, in the twenty-seventh jubilee of years, in the fifth week in the fifth year (on the new moon of the first month).* The now-live Jubilees self-links Wisdom''s *piece of wood* (10:4) to the dated building of the ark.'),
  -- thread: wisdom-10-abraham-and-lot-from-the-fire
  ('apocrypha', 'the-wisdom-of-solomon', 10, 5, 'canon', 'hebrews', 11, 8, 'free', E'Hebrews 11:8 — *By faith Abraham, when he was called to go out into a place which he should after receive for an inheritance, obeyed; and he went out, not knowing whither he went.* This is *the righteous... preserved blameless* whom Wisdom *found out* amid the confounded nations (10:5).'),
  ('apocrypha', 'the-wisdom-of-solomon', 10, 6, 'canon', 'genesis', 19, 24, 'free', E'Genesis 19:24 — *Then Yahuah (LORD) rained upon Sodom and upon Gomorrah brimstone and fire from Yahuah (LORD) out of heaven.* This is *the fire which fell down upon the five cities*, from which Wisdom *delivered the righteous man* Lot (10:6).'),
  ('apocrypha', 'the-wisdom-of-solomon', 10, 7, 'canon', 'genesis', 19, 26, 'free', E'Genesis 19:26 — *But his wife looked back from behind him, and she became a pillar of salt.* This is *a standing pillar of salt... a monument of an unbelieving soul* (10:7).'),
  ('apocrypha', 'the-wisdom-of-solomon', 10, 6, 'jubilees', 'jubilees', 16, 6, 'extras', E'Jubilees 16:6 — *And, in like manner, Elohim (God) will execute judgment on the places where they have done according to the uncleanness of the Sodomites, like to the judgment of Sodom. But Lot we saved; for Elohim (God) remembered Abraham, and sent him out from the midst of the overthrow.* The now-live Jubilees self-links Wisdom''s deliverance of *the righteous man* from the fire (10:6).'),
  -- thread: wisdom-10-jacob-fled-shewn-the-kingdom
  ('apocrypha', 'the-wisdom-of-solomon', 10, 10, 'canon', 'genesis', 28, 13, 'free', E'Genesis 28:13 — *And, behold, Yahuah (LORD) stood above it, and said, I am Yahuah Elohim (the LORD God) of Abraham thy father, and the Elohim (God) of Isaac: the land whereon thou liest, to thee will I give it, and to thy seed.* This is the *kingdom of Yahuah (God)* Wisdom *shewed him* when the righteous fled (10:10).'),
  ('apocrypha', 'the-wisdom-of-solomon', 10, 10, 'canon', 'genesis', 28, 15, 'free', E'Genesis 28:15 — *And, behold, I am with thee, and will keep thee in all places whither thou goest, and will bring thee again into this land; for I will not leave thee, until I have done that which I have spoken to thee of.* This is Wisdom guiding Jacob *in right paths* and keeping him through the flight (10:10).'),
  -- thread: wisdom-10-joseph-the-pit-to-the-sceptre
  ('apocrypha', 'the-wisdom-of-solomon', 10, 13, 'canon', 'genesis', 39, 3, 'free', E'Genesis 39:3 — *And his master saw that Yahuah (LORD) was with him, and that Yahuah (LORD) made all that he did to prosper in his hand.* This is Wisdom who *forsook him not* when the righteous was sold (10:13).'),
  ('apocrypha', 'the-wisdom-of-solomon', 10, 14, 'canon', 'genesis', 41, 40, 'free', E'Genesis 41:40 — *Thou shalt be over my house, and according unto thy word shall all my people be ruled: only in the throne will I be greater than thou.* This is *the sceptre of the kingdom* Wisdom brought him out of bonds (10:14).'),
  ('apocrypha', 'the-wisdom-of-solomon', 10, 13, 'jubilees', 'jubilees', 39, 3, 'extras', E'Jubilees 39:3 — *And he set Joseph over all his house, and the blessing of Yahuah (God) came upon the house of the Egyptian on account of Joseph, and Yahuah (God) prospered him in all that he did.* The now-live Jubilees self-links Wisdom who *delivered him from sin* and went down into the pit (10:13).'),
  -- thread: wisdom-10-exodus-the-sea-divided
  ('apocrypha', 'the-wisdom-of-solomon', 10, 18, 'canon', 'exodus', 14, 22, 'free', E'Exodus 14:22 — *And the children of Yashar''el (Israel) went into the midst of the sea upon the dry ground: and the waters were a wall unto them on their right hand, and on their left.* This is Wisdom that *brought them through the Red sea, and led them through much water* (10:18).'),
  ('apocrypha', 'the-wisdom-of-solomon', 10, 17, 'canon', 'psalms', 105, 37, 'free', E'Psalm 105:37 — *He brought them forth also with silver and gold: and there was not one feeble person among their tribes.* This is the *reward of their labours* Wisdom rendered to the righteous (10:17), the providence over the fathers.'),
  ('apocrypha', 'the-wisdom-of-solomon', 10, 19, 'jubilees', 'jubilees', 48, 14, 'extras', E'Jubilees 48:14 — *And all the peoples whom he brought to pursue after Yashar''el (Israel), Yahuah our Elohim (the LORD our God) cast them into the midst of the sea, into the depths of the abyss beneath the children of Yashar''el (Israel), even as the people of Egypt had cast their children into the river. He took vengeance on 1,000,000 of them, and one thousand strong and energetic men were destroyed on account of one suckling of the children of your people which they had thrown into the river.* The now-live Jubilees self-links Wisdom who *drowned their enemies, and cast them up out of the bottom of the deep* (10:19).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_wis10_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_wis10_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-10-adam-formed-and-fallen',
       E'Wisdom kept the first-formed father — and Cain''s fury',
       E'Chapter 10 unfolds the saving providence — Wisdom walking through history: *She preserved the first formed father of the world, that was created alone, and brought him out of his fall, And gave him power to rule all things* (Wisdom of Solomon 10:1-2). The first-formed father is Adam, *created alone* — and the dominion he was given is the dominion of the garden mandate: *And Elohim (God) blessed them, and Elohim (God) said unto them, Be fruitful, and multiply, and replenish the earth, and subdue it: and have dominion over the fish of the sea, and over the fowl of the air, and over every living thing that moveth upon the earth* (Genesis 1:28). Wisdom *brought him out of his fall* — grace into the ruin, not abandonment. But the next generation rejected her: *But when the unrighteous went away from her in his anger, he perished also in the fury with which he murdered his brother* (Wisdom of Solomon 10:3) — Cain, who *rose up against Abel his brother, and slew him* (Genesis 4:8). It ain''t new: the deuterocanon reads Eden and the first murder exactly as Torah tells it.',
       sv.verse_id, ev.verse_id, 'extras', 58225
  FROM _session253_wis10_lookup sv, _session253_wis10_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=10 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=10 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-10-noah-ark-righteous-preserved',
       E'Wisdom steered the ark — Noah the righteous through the flood',
       E'When the world drowned, Wisdom became the pilot: *For whose cause the earth being drowned with the flood, wisdom again preserved it, and directed the course of the righteous in a piece of wood of small value* (Wisdom of Solomon 10:4). The *piece of wood of small value* is Noah''s ark, and *the righteous* is Noah himself, called in by Yahuah: *And Yahuah (LORD) said unto Noah, Come thou and all thy house into the ark; for thee have I seen righteous before me in this generation* (Genesis 7:1). Hebrews reads the same faith: *By faith Noah, being warned of Elohim (God) of things not seen as yet, moved with fear, prepared an ark to the saving of his house; by the which he condemned the world, and became heir of the righteousness which is by faith* (Hebrews 11:7). The now-live Jubilees keeps the very timetable: *And Noah made the ark in all respects as He commanded him, in the twenty-seventh jubilee of years, in the fifth week in the fifth year (on the new moon of the first month)* (Jubilees 5:22). One witness across four books — the saving providence over one righteous house.',
       sv.verse_id, ev.verse_id, 'extras', 58228
  FROM _session253_wis10_lookup sv, _session253_wis10_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=10 AND sv.verse_number=4
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=10 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-10-abraham-and-lot-from-the-fire',
       E'Wisdom found Abraham at Babel — and snatched Lot from the fire',
       E'At the scattering of Babel Wisdom singled out the patriarch: *Moreover, the nations in their wicked conspiracy being confounded, she found out the righteous, and preserved him blameless to Yahuah (God), and kept him strong against his tender compassion toward his son* (Wisdom of Solomon 10:5) — Abraham *kept strong* at the binding of Isaac. *By faith Abraham, when he was called to go out into a place which he should after receive for an inheritance, obeyed; and he went out, not knowing whither he went* (Hebrews 11:8). Then Wisdom delivered Lot: *When the ungodly perished, she delivered the righteous man, who fled from the fire which fell down upon the five cities* (Wisdom of Solomon 10:6) — *Then Yahuah (LORD) rained upon Sodom and upon Gomorrah brimstone and fire from Yahuah (LORD) out of heaven* (Genesis 19:24). And Wisdom marks Lot''s wife: *a standing pillar of salt is a monument of an unbelieving soul* (Wisdom of Solomon 10:7) — *But his wife looked back from behind him, and she became a pillar of salt* (Genesis 19:26). The now-live Jubilees reads the rescue the same way: *But Lot we saved; for Elohim (God) remembered Abraham, and sent him out from the midst of the overthrow* (Jubilees 16:6).',
       sv.verse_id, ev.verse_id, 'extras', 58231
  FROM _session253_wis10_lookup sv, _session253_wis10_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=10 AND sv.verse_number=5
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=10 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-10-jacob-fled-shewn-the-kingdom',
       E'Wisdom guided Jacob fleeing — and shewed him the kingdom',
       E'Wisdom became Jacob''s road and his defender: *When the righteous fled from his brother''s wrath she guided him in right paths, shewed him the kingdom of Yahuah (God), and gave him knowledge of holy things, made him rich in his travels, and multiplied the fruit of his labours* (Wisdom of Solomon 10:10). The kingdom *shewed him* is Bethel''s ladder, where Yahuah stood and spoke: *And, behold, Yahuah (LORD) stood above it, and said, I am Yahuah Elohim (the LORD God) of Abraham thy father, and the Elohim (God) of Isaac: the land whereon thou liest, to thee will I give it, and to thy seed* (Genesis 28:13). And the keeping in *right paths* on the road is the Bethel promise itself: *And, behold, I am with thee, and will keep thee in all places whither thou goest, and will bring thee again into this land; for I will not leave thee, until I have done that which I have spoken to thee of* (Genesis 28:15). Wisdom *defended him from his enemies, and kept him safe from those that lay in wait, and in a sore conflict she gave him the victory; that he might know that goodness is stronger than all* (Wisdom of Solomon 10:12) — Laban behind, Esau ahead, and Peniel''s wrestle between. The saving providence over the heel-holder.',
       sv.verse_id, ev.verse_id, 'extras', 58234
  FROM _session253_wis10_lookup sv, _session253_wis10_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=10 AND sv.verse_number=10
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=10 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-10-joseph-the-pit-to-the-sceptre',
       E'Wisdom went down into the pit with Joseph — and raised the sceptre',
       E'Wisdom descended with the sold son and lifted him to the throne: *When the righteous was sold, she forsook him not, but delivered him from sin: she went down with him into the pit, And left him not in bonds, till she brought him the sceptre of the kingdom, and power against those that oppressed him: as for them that had accused him, she shewed them to be liars, and gave him perpetual glory* (Wisdom of Solomon 10:13-14). The *forsook him not* is the refrain of Genesis: *And his master saw that Yahuah (LORD) was with him, and that Yahuah (LORD) made all that he did to prosper in his hand* (Genesis 39:3). The *sceptre of the kingdom* is Pharaoh''s word: *Thou shalt be over my house, and according unto thy word shall all my people be ruled: only in the throne will I be greater than thou* (Genesis 41:40). The now-live Jubilees keeps both halves — the prospering and the exalting: *And he set Joseph over all his house, and the blessing of Yahuah (God) came upon the house of the Egyptian on account of Joseph, and Yahuah (God) prospered him in all that he did* (Jubilees 39:3). The pit, the prison, the palace — Wisdom *left him not in bonds*.',
       sv.verse_id, ev.verse_id, 'extras', 58237
  FROM _session253_wis10_lookup sv, _session253_wis10_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=10 AND sv.verse_number=13
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=10 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-10-exodus-the-sea-divided',
       E'Wisdom entered Moses — the pillar, the Red Sea, the drowned foe',
       E'Wisdom became the deliverer of the nation through Moses: *She entered into the soul of the servant of Yahuah (God), and withstood dreadful kings in wonders and signs; Rendered to the righteous a reward of their labours, guided them in a marvellous way, and was to them for a cover by day, and a light of stars in the night season; Brought them through the Red sea, and led them through much water: But she drowned their enemies, and cast them up out of the bottom of the deep* (Wisdom of Solomon 10:16-19). The sea-crossing is Exodus told plain: *And the children of Yashar''el (Israel) went into the midst of the sea upon the dry ground: and the waters were a wall unto them on their right hand, and on their left* (Exodus 14:22). The providence over the fathers is Psalm 105''s song: *He brought them forth also with silver and gold: and there was not one feeble person among their tribes* (Psalm 105:37) — Wisdom *rendered to the righteous a reward of their labours* (10:17). And the now-live Jubilees keeps the drowning of the foe: *And all the peoples whom he brought to pursue after Yashar''el (Israel), Yahuah our Elohim (the LORD our God) cast them into the midst of the sea, into the depths of the abyss beneath the children of Yashar''el (Israel)* (Jubilees 48:14). The book closes on the saving providence that *fought for them*.',
       sv.verse_id, ev.verse_id, 'extras', 58240
  FROM _session253_wis10_lookup sv, _session253_wis10_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=10 AND sv.verse_number=16
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=10 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: wisdom-10-adam-formed-and-fallen
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:28 — *And Elohim (God) blessed them, and Elohim (God) said unto them, Be fruitful, and multiply, and replenish the earth, and subdue it: and have dominion over the fish of the sea, and over the fowl of the air, and over every living thing that moveth upon the earth.* The dominion Wisdom *gave him power to rule all things* (10:2) is the garden mandate given to the first-formed father.'
  FROM cross_reference_threads t, cross_references x, _session253_wis10_lookup sv, _session253_wis10_lookup tv
 WHERE t.slug='wisdom-10-adam-formed-and-fallen'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=10 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 4:8 — *And Cain talked with Abel his brother: and it came to pass, when they were in the field, that Cain rose up against Abel his brother, and slew him.* This is *the fury with which he murdered his brother* (10:3) — the unrighteous who *went away from her in his anger*.'
  FROM cross_reference_threads t, cross_references x, _session253_wis10_lookup sv, _session253_wis10_lookup tv
 WHERE t.slug='wisdom-10-adam-formed-and-fallen'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=10 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-10-noah-ark-righteous-preserved
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 7:1 — *And Yahuah (LORD) said unto Noah, Come thou and all thy house into the ark; for thee have I seen righteous before me in this generation.* This is *the righteous* whose course Wisdom *directed... in a piece of wood of small value* (10:4).'
  FROM cross_reference_threads t, cross_references x, _session253_wis10_lookup sv, _session253_wis10_lookup tv
 WHERE t.slug='wisdom-10-noah-ark-righteous-preserved'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=10 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=7 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 11:7 — *By faith Noah, being warned of Elohim (God) of things not seen as yet, moved with fear, prepared an ark to the saving of his house; by the which he condemned the world, and became heir of the righteousness which is by faith.* The ark of *small value* (10:4) is the saving of the righteous house by faith.'
  FROM cross_reference_threads t, cross_references x, _session253_wis10_lookup sv, _session253_wis10_lookup tv
 WHERE t.slug='wisdom-10-noah-ark-righteous-preserved'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=10 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 5:22 — *And Noah made the ark in all respects as He commanded him, in the twenty-seventh jubilee of years, in the fifth week in the fifth year (on the new moon of the first month).* The now-live Jubilees self-links Wisdom''s *piece of wood* (10:4) to the dated building of the ark.'
  FROM cross_reference_threads t, cross_references x, _session253_wis10_lookup sv, _session253_wis10_lookup tv
 WHERE t.slug='wisdom-10-noah-ark-righteous-preserved'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=10 AND sv.verse_number=4
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=5 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-10-abraham-and-lot-from-the-fire
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hebrews 11:8 — *By faith Abraham, when he was called to go out into a place which he should after receive for an inheritance, obeyed; and he went out, not knowing whither he went.* This is *the righteous... preserved blameless* whom Wisdom *found out* amid the confounded nations (10:5).'
  FROM cross_reference_threads t, cross_references x, _session253_wis10_lookup sv, _session253_wis10_lookup tv
 WHERE t.slug='wisdom-10-abraham-and-lot-from-the-fire'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=10 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 19:24 — *Then Yahuah (LORD) rained upon Sodom and upon Gomorrah brimstone and fire from Yahuah (LORD) out of heaven.* This is *the fire which fell down upon the five cities*, from which Wisdom *delivered the righteous man* Lot (10:6).'
  FROM cross_reference_threads t, cross_references x, _session253_wis10_lookup sv, _session253_wis10_lookup tv
 WHERE t.slug='wisdom-10-abraham-and-lot-from-the-fire'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=10 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=19 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 19:26 — *But his wife looked back from behind him, and she became a pillar of salt.* This is *a standing pillar of salt... a monument of an unbelieving soul* (10:7).'
  FROM cross_reference_threads t, cross_references x, _session253_wis10_lookup sv, _session253_wis10_lookup tv
 WHERE t.slug='wisdom-10-abraham-and-lot-from-the-fire'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=10 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=19 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 16:6 — *And, in like manner, Elohim (God) will execute judgment on the places where they have done according to the uncleanness of the Sodomites, like to the judgment of Sodom. But Lot we saved; for Elohim (God) remembered Abraham, and sent him out from the midst of the overthrow.* The now-live Jubilees self-links Wisdom''s deliverance of *the righteous man* from the fire (10:6).'
  FROM cross_reference_threads t, cross_references x, _session253_wis10_lookup sv, _session253_wis10_lookup tv
 WHERE t.slug='wisdom-10-abraham-and-lot-from-the-fire'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=10 AND sv.verse_number=6
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=16 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-10-jacob-fled-shewn-the-kingdom
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 28:13 — *And, behold, Yahuah (LORD) stood above it, and said, I am Yahuah Elohim (the LORD God) of Abraham thy father, and the Elohim (God) of Isaac: the land whereon thou liest, to thee will I give it, and to thy seed.* This is the *kingdom of Yahuah (God)* Wisdom *shewed him* when the righteous fled (10:10).'
  FROM cross_reference_threads t, cross_references x, _session253_wis10_lookup sv, _session253_wis10_lookup tv
 WHERE t.slug='wisdom-10-jacob-fled-shewn-the-kingdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=10 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=28 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 28:15 — *And, behold, I am with thee, and will keep thee in all places whither thou goest, and will bring thee again into this land; for I will not leave thee, until I have done that which I have spoken to thee of.* This is Wisdom guiding Jacob *in right paths* and keeping him through the flight (10:10).'
  FROM cross_reference_threads t, cross_references x, _session253_wis10_lookup sv, _session253_wis10_lookup tv
 WHERE t.slug='wisdom-10-jacob-fled-shewn-the-kingdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=10 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=28 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-10-joseph-the-pit-to-the-sceptre
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 39:3 — *And his master saw that Yahuah (LORD) was with him, and that Yahuah (LORD) made all that he did to prosper in his hand.* This is Wisdom who *forsook him not* when the righteous was sold (10:13).'
  FROM cross_reference_threads t, cross_references x, _session253_wis10_lookup sv, _session253_wis10_lookup tv
 WHERE t.slug='wisdom-10-joseph-the-pit-to-the-sceptre'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=10 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=39 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 41:40 — *Thou shalt be over my house, and according unto thy word shall all my people be ruled: only in the throne will I be greater than thou.* This is *the sceptre of the kingdom* Wisdom brought him out of bonds (10:14).'
  FROM cross_reference_threads t, cross_references x, _session253_wis10_lookup sv, _session253_wis10_lookup tv
 WHERE t.slug='wisdom-10-joseph-the-pit-to-the-sceptre'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=10 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=41 AND tv.verse_number=40
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 39:3 — *And he set Joseph over all his house, and the blessing of Yahuah (God) came upon the house of the Egyptian on account of Joseph, and Yahuah (God) prospered him in all that he did.* The now-live Jubilees self-links Wisdom who *delivered him from sin* and went down into the pit (10:13).'
  FROM cross_reference_threads t, cross_references x, _session253_wis10_lookup sv, _session253_wis10_lookup tv
 WHERE t.slug='wisdom-10-joseph-the-pit-to-the-sceptre'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=10 AND sv.verse_number=13
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=39 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-10-exodus-the-sea-divided
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 14:22 — *And the children of Yashar''el (Israel) went into the midst of the sea upon the dry ground: and the waters were a wall unto them on their right hand, and on their left.* This is Wisdom that *brought them through the Red sea, and led them through much water* (10:18).'
  FROM cross_reference_threads t, cross_references x, _session253_wis10_lookup sv, _session253_wis10_lookup tv
 WHERE t.slug='wisdom-10-exodus-the-sea-divided'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=10 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=14 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 105:37 — *He brought them forth also with silver and gold: and there was not one feeble person among their tribes.* This is the *reward of their labours* Wisdom rendered to the righteous (10:17), the providence over the fathers.'
  FROM cross_reference_threads t, cross_references x, _session253_wis10_lookup sv, _session253_wis10_lookup tv
 WHERE t.slug='wisdom-10-exodus-the-sea-divided'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=10 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=105 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 48:14 — *And all the peoples whom he brought to pursue after Yashar''el (Israel), Yahuah our Elohim (the LORD our God) cast them into the midst of the sea, into the depths of the abyss beneath the children of Yashar''el (Israel), even as the people of Egypt had cast their children into the river. He took vengeance on 1,000,000 of them, and one thousand strong and energetic men were destroyed on account of one suckling of the children of your people which they had thrown into the river.* The now-live Jubilees self-links Wisdom who *drowned their enemies, and cast them up out of the bottom of the deep* (10:19).'
  FROM cross_reference_threads t, cross_references x, _session253_wis10_lookup sv, _session253_wis10_lookup tv
 WHERE t.slug='wisdom-10-exodus-the-sea-divided'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=10 AND sv.verse_number=19
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=48 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_thewisdomofsolomon_11.sql (session253 the-wisdom-of-solomon 11) -----
-- Source anchor: apocrypha/the-wisdom-of-solomon ch11. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: wis11 (view _session253_wis11_lookup). Sort band base 58250, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_wis11_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: wisdom-11-water-from-the-rock
  ('apocrypha', 'the-wisdom-of-solomon', 11, 4, 'canon', 'exodus', 17, 6, 'free', E'Exodus 17:6 — *Behold, I will stand before thee there upon the rock in Horeb; and thou shalt smite the rock, and there shall come water out of it, that the people may drink. And Moses did so in the sight of the elders of Yashar''el (Israel).* The Horeb rock is the very flinty stone Wisdom of Solomon 11:4 says quenched their thirst.'),
  ('apocrypha', 'the-wisdom-of-solomon', 11, 4, 'canon', 'numbers', 20, 11, 'free', E'Numbers 20:11 — *And Moses lifted up his hand, and with his rod he smote the rock twice: and the water came out abundantly, and the congregation drank, and their beasts also.* The water out of the hard stone in Wisdom of Solomon 11:4 is the Meribah gift, given abundantly to the thirsty congregation.'),
  ('apocrypha', 'the-wisdom-of-solomon', 11, 4, 'canon', '1-corinthians', 10, 4, 'free', E'1 Corinthians 10:4 — *And did all drink the same spiritual drink: for they drank of that spiritual Rock that followed them: and that Rock was Messiah (Christ).* Paul names the Rock Wisdom of Solomon 11:4 remembers — the wilderness draught was Messiah Himself.'),
  -- thread: wisdom-11-punished-by-what-they-sinned
  ('apocrypha', 'the-wisdom-of-solomon', 11, 6, 'canon', 'exodus', 7, 20, 'free', E'Exodus 7:20 — *And Moses and Aaron did so, as Yahuah (LORD) commanded; and he lifted up the rod, and smote the waters that were in the river, in the sight of Pharaoh, and in the sight of his servants; and all the waters that were in the river were turned to blood.* The perpetual river troubled with foul blood in Wisdom of Solomon 11:6 is the first plague turning the Nile to blood.'),
  -- thread: wisdom-11-measure-number-weight
  ('apocrypha', 'the-wisdom-of-solomon', 11, 20, 'canon', 'job', 28, 25, 'free', E'Job 28:25 — *To make the weight for the winds; and he weigheth the waters by measure.* Job''s wisdom-poem gives the same weighing and measuring Wisdom of Solomon 11:20 ascribes to the Creator who ordered all things.'),
  ('apocrypha', 'the-wisdom-of-solomon', 11, 20, 'canon', 'isaiah', 40, 12, 'free', E'Isaiah 40:12 — *Who hath measured the waters in the hollow of his hand, and meted out heaven with the span, and comprehended the dust of the earth in a measure, and weighed the mountains in scales, and the hills in a balance?* Isaiah''s measuring, meting, and weighing is the cosmic order Wisdom of Solomon 11:20 names as measure and number and weight.'),
  -- thread: wisdom-11-world-a-grain-of-the-balance
  ('apocrypha', 'the-wisdom-of-solomon', 11, 22, 'apocrypha', 'ecclesiasticus', 18, 10, 'extras', E'Ecclesiasticus 18:10 — *As a drop of water to the sea, and a gravelstone in comparison of the sand; so are a thousand years to the days of eternity.* Ben Sira''s drop-and-gravelstone matches Wisdom of Solomon 11:22''s grain of the balance and drop of dew — creation is nothing beside the Eternal.'),
  ('apocrypha', 'the-wisdom-of-solomon', 11, 22, 'apocrypha', 'ecclesiasticus', 18, 11, 'extras', E'Ecclesiasticus 18:11 — *Therefore is Yahuah (God) patient with them, and poureth forth his mercy upon them.* Ben Sira draws the same conclusion Wisdom of Solomon 11:22-23 draws — the world''s smallness is the ground of His patience and outpoured mercy.'),
  -- thread: wisdom-11-thou-lovest-all-thou-sparest-all
  ('apocrypha', 'the-wisdom-of-solomon', 11, 23, 'canon', 'psalms', 145, 9, 'free', E'Psalms 145:9 — *Yahuah (LORD) is good to all: and his tender mercies are over all his works.* David''s mercy over all His works is the very confession of Wisdom of Solomon 11:23-24, that He loves all He has made.'),
  ('apocrypha', 'the-wisdom-of-solomon', 11, 24, 'canon', 'jonah', 4, 11, 'free', E'Jonah 4:11 — *And should not I spare Nineveh, that great city, wherein are more than sixscore thousand persons that cannot discern between their right hand and their left hand; and also much cattle?* Yahuah''s plea to spare Nineveh enacts Wisdom of Solomon 11:24''s truth that He abhors nothing He has made.'),
  ('apocrypha', 'the-wisdom-of-solomon', 11, 26, 'canon', 'ezekiel', 18, 32, 'free', E'Ezekiel 18:32 — *For I have no pleasure in the death of him that dieth, saith Adonai Yahuah (the Lord GOD): wherefore turn yourselves, and live ye.* The God who takes no pleasure in death is the lover of souls who spares all in Wisdom of Solomon 11:26.'),
  ('apocrypha', 'the-wisdom-of-solomon', 11, 26, 'apocrypha', 'ecclesiasticus', 18, 13, 'extras', E'Ecclesiasticus 18:13 — *The mercy of man is toward his neighbour; but the mercy of Yahuah (God) is upon all flesh: he reproveth, and nurtureth, and teaches and brings again, as a shepherd his flock.* Ben Sira''s mercy upon all flesh is the same lover-of-souls confession Wisdom of Solomon 11:26 makes.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_wis11_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_wis11_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-11-water-from-the-rock',
       E'Water out of the flinty rock — and the Rock was Messiah',
       E'Wisdom rehearses the wilderness mercy: *When they were thirsty, they called upon you, and water was given them out of the flinty rock, and their thirst was quenched out of the hard stone.* (the-wisdom-of-solomon 11:4). This is the Horeb miracle remembered: *Behold, I will stand before thee there upon the rock in Horeb; and thou shalt smite the rock, and there shall come water out of it, that the people may drink. And Moses did so in the sight of the elders of Yashar''el (Israel).* (Exodus 17:6) — and again at Meribah, *And Moses lifted up his hand, and with his rod he smote the rock twice: and the water came out abundantly, and the congregation drank, and their beasts also.* (Numbers 20:11). It ain''t new: Paul reads the same rock messianically, *And did all drink the same spiritual drink: for they drank of that spiritual Rock that followed them: and that Rock was Messiah (Christ).* (1 Corinthians 10:4). Wisdom''s wilderness draught and the smitten stone are one witness — the provision that followed Yashar''el was the Anointed.',
       sv.verse_id, ev.verse_id, 'extras', 58250
  FROM _session253_wis11_lookup sv, _session253_wis11_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=11 AND sv.verse_number=4
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=11 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-11-punished-by-what-they-sinned',
       E'Punished by the very thing wherewith they sinned — the river to blood',
       E'Wisdom states the law of measured judgment plainly: *For by what things their enemies were punished, by the same they in their need were benefited.* (the-wisdom-of-solomon 11:5) — *For instead of a perpetual running river troubled with foul blood* (the-wisdom-of-solomon 11:6), Israel was given clean water. The fouled river is the first plague: *And Moses and Aaron did so, as Yahuah (LORD) commanded; and he lifted up the rod, and smote the waters that were in the river, in the sight of Pharaoh, and in the sight of his servants; and all the waters that were in the river were turned to blood.* (Exodus 7:20). Wisdom distills the principle into a maxim, *That they might know, that wherewithal a man sinneth, by the same also shall he be punished.* (the-wisdom-of-solomon 11:16) — the bloodied Nile that drowned the infants becomes the measure of Egypt''s reproof while Israel drinks from the rock.',
       sv.verse_id, ev.verse_id, 'extras', 58253
  FROM _session253_wis11_lookup sv, _session253_wis11_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=11 AND sv.verse_number=5
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=11 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-11-measure-number-weight',
       E'Ordered all things in measure and number and weight',
       E'Wisdom closes the plague-meditation with the great creation maxim: *but you have ordered all things in measure and number and weight.* (the-wisdom-of-solomon 11:20). This is the Creator who weighs creation: *To make the weight for the winds; and he weigheth the waters by measure.* (Job 28:25), and the One whom Isaiah praises, *Who hath measured the waters in the hollow of his hand, and meted out heaven with the span, and comprehended the dust of the earth in a measure, and weighed the mountains in scales, and the hills in a balance?* (Isaiah 40:12). The judgments on Egypt are no caprice but the same exact ordering by which the world was framed — measure, number, weight — the wisdom that lays out the wind and the sea.',
       sv.verse_id, ev.verse_id, 'extras', 58256
  FROM _session253_wis11_lookup sv, _session253_wis11_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=11 AND sv.verse_number=20
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=11 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-11-world-a-grain-of-the-balance',
       E'The whole world a little grain of the balance, a drop of dew',
       E'Against the measured power, Wisdom sets the smallness of creation before Yahuah: *For the whole world before you is as a little grain of the balance, yes, as a drop of the morning dew that falls down upon the earth.* (the-wisdom-of-solomon 11:22). The same scale runs in the wisdom of Yeshua ben Sira: *As a drop of water to the sea, and a gravelstone in comparison of the sand; so are a thousand years to the days of eternity.* (Ecclesiasticus 18:10) — and there too it is the ground of patience, *Therefore is Yahuah (God) patient with them, and poureth forth his mercy upon them.* (Ecclesiasticus 18:11). It ain''t new: the deuterocanon speaks with one voice — because the world weighs nothing against Him, His strength is never threatened, and so He can afford to be merciful.',
       sv.verse_id, ev.verse_id, 'extras', 58259
  FROM _session253_wis11_lookup sv, _session253_wis11_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=11 AND sv.verse_number=21
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=11 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-11-thou-lovest-all-thou-sparest-all',
       E'Thou lovest all, abhorrest nothing — O Yahuah, thou lover of souls',
       E'Wisdom ends with one of Scripture''s tenderest confessions of divine mercy: *But you have mercy upon all; for you can do all things, and winkest at the sins of men, because they should amend.* (the-wisdom-of-solomon 11:23) — *For you lovest all the things that are, and abhorrest nothing which you have made: for never wouldest you have made any thing, if you had hated it.* (the-wisdom-of-solomon 11:24) — *But you sparest all: for they are yours, O Yahuah (God), you lover of souls.* (the-wisdom-of-solomon 11:26). This is the David of the Psalms: *Yahuah (LORD) is good to all: and his tender mercies are over all his works.* (Psalms 145:9), and the Yahuah who reasons with Jonah, *And should not I spare Nineveh, that great city, wherein are more than sixscore thousand persons that cannot discern between their right hand and their left hand; and also much cattle?* (Jonah 4:11), the One who swears, *For I have no pleasure in the death of him that dieth, saith Adonai Yahuah (the Lord GOD): wherefore turn yourselves, and live ye.* (Ezekiel 18:32). It ain''t new — Ben Sira sang it already: *The mercy of man is toward his neighbour; but the mercy of Yahuah (God) is upon all flesh: he reproveth, and nurtureth, and teaches and brings again, as a shepherd his flock.* (Ecclesiasticus 18:13). Judgment is measured; mercy is over all His works.',
       sv.verse_id, ev.verse_id, 'extras', 58262
  FROM _session253_wis11_lookup sv, _session253_wis11_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=11 AND sv.verse_number=23
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=11 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: wisdom-11-water-from-the-rock
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 17:6 — *Behold, I will stand before thee there upon the rock in Horeb; and thou shalt smite the rock, and there shall come water out of it, that the people may drink. And Moses did so in the sight of the elders of Yashar''el (Israel).* The Horeb rock is the very flinty stone Wisdom of Solomon 11:4 says quenched their thirst.'
  FROM cross_reference_threads t, cross_references x, _session253_wis11_lookup sv, _session253_wis11_lookup tv
 WHERE t.slug='wisdom-11-water-from-the-rock'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=11 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=17 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 20:11 — *And Moses lifted up his hand, and with his rod he smote the rock twice: and the water came out abundantly, and the congregation drank, and their beasts also.* The water out of the hard stone in Wisdom of Solomon 11:4 is the Meribah gift, given abundantly to the thirsty congregation.'
  FROM cross_reference_threads t, cross_references x, _session253_wis11_lookup sv, _session253_wis11_lookup tv
 WHERE t.slug='wisdom-11-water-from-the-rock'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=11 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=20 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Corinthians 10:4 — *And did all drink the same spiritual drink: for they drank of that spiritual Rock that followed them: and that Rock was Messiah (Christ).* Paul names the Rock Wisdom of Solomon 11:4 remembers — the wilderness draught was Messiah Himself.'
  FROM cross_reference_threads t, cross_references x, _session253_wis11_lookup sv, _session253_wis11_lookup tv
 WHERE t.slug='wisdom-11-water-from-the-rock'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=11 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=10 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-11-punished-by-what-they-sinned
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 7:20 — *And Moses and Aaron did so, as Yahuah (LORD) commanded; and he lifted up the rod, and smote the waters that were in the river, in the sight of Pharaoh, and in the sight of his servants; and all the waters that were in the river were turned to blood.* The perpetual river troubled with foul blood in Wisdom of Solomon 11:6 is the first plague turning the Nile to blood.'
  FROM cross_reference_threads t, cross_references x, _session253_wis11_lookup sv, _session253_wis11_lookup tv
 WHERE t.slug='wisdom-11-punished-by-what-they-sinned'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=11 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=7 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-11-measure-number-weight
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Job 28:25 — *To make the weight for the winds; and he weigheth the waters by measure.* Job''s wisdom-poem gives the same weighing and measuring Wisdom of Solomon 11:20 ascribes to the Creator who ordered all things.'
  FROM cross_reference_threads t, cross_references x, _session253_wis11_lookup sv, _session253_wis11_lookup tv
 WHERE t.slug='wisdom-11-measure-number-weight'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=11 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=28 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 40:12 — *Who hath measured the waters in the hollow of his hand, and meted out heaven with the span, and comprehended the dust of the earth in a measure, and weighed the mountains in scales, and the hills in a balance?* Isaiah''s measuring, meting, and weighing is the cosmic order Wisdom of Solomon 11:20 names as measure and number and weight.'
  FROM cross_reference_threads t, cross_references x, _session253_wis11_lookup sv, _session253_wis11_lookup tv
 WHERE t.slug='wisdom-11-measure-number-weight'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=11 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=40 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-11-world-a-grain-of-the-balance
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ecclesiasticus 18:10 — *As a drop of water to the sea, and a gravelstone in comparison of the sand; so are a thousand years to the days of eternity.* Ben Sira''s drop-and-gravelstone matches Wisdom of Solomon 11:22''s grain of the balance and drop of dew — creation is nothing beside the Eternal.'
  FROM cross_reference_threads t, cross_references x, _session253_wis11_lookup sv, _session253_wis11_lookup tv
 WHERE t.slug='wisdom-11-world-a-grain-of-the-balance'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=11 AND sv.verse_number=22
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=18 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ecclesiasticus 18:11 — *Therefore is Yahuah (God) patient with them, and poureth forth his mercy upon them.* Ben Sira draws the same conclusion Wisdom of Solomon 11:22-23 draws — the world''s smallness is the ground of His patience and outpoured mercy.'
  FROM cross_reference_threads t, cross_references x, _session253_wis11_lookup sv, _session253_wis11_lookup tv
 WHERE t.slug='wisdom-11-world-a-grain-of-the-balance'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=11 AND sv.verse_number=22
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=18 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-11-thou-lovest-all-thou-sparest-all
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalms 145:9 — *Yahuah (LORD) is good to all: and his tender mercies are over all his works.* David''s mercy over all His works is the very confession of Wisdom of Solomon 11:23-24, that He loves all He has made.'
  FROM cross_reference_threads t, cross_references x, _session253_wis11_lookup sv, _session253_wis11_lookup tv
 WHERE t.slug='wisdom-11-thou-lovest-all-thou-sparest-all'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=11 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=145 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jonah 4:11 — *And should not I spare Nineveh, that great city, wherein are more than sixscore thousand persons that cannot discern between their right hand and their left hand; and also much cattle?* Yahuah''s plea to spare Nineveh enacts Wisdom of Solomon 11:24''s truth that He abhors nothing He has made.'
  FROM cross_reference_threads t, cross_references x, _session253_wis11_lookup sv, _session253_wis11_lookup tv
 WHERE t.slug='wisdom-11-thou-lovest-all-thou-sparest-all'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=11 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='jonah' AND tv.chapter_number=4 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 18:32 — *For I have no pleasure in the death of him that dieth, saith Adonai Yahuah (the Lord GOD): wherefore turn yourselves, and live ye.* The God who takes no pleasure in death is the lover of souls who spares all in Wisdom of Solomon 11:26.'
  FROM cross_reference_threads t, cross_references x, _session253_wis11_lookup sv, _session253_wis11_lookup tv
 WHERE t.slug='wisdom-11-thou-lovest-all-thou-sparest-all'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=11 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=18 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ecclesiasticus 18:13 — *The mercy of man is toward his neighbour; but the mercy of Yahuah (God) is upon all flesh: he reproveth, and nurtureth, and teaches and brings again, as a shepherd his flock.* Ben Sira''s mercy upon all flesh is the same lover-of-souls confession Wisdom of Solomon 11:26 makes.'
  FROM cross_reference_threads t, cross_references x, _session253_wis11_lookup sv, _session253_wis11_lookup tv
 WHERE t.slug='wisdom-11-thou-lovest-all-thou-sparest-all'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=11 AND sv.verse_number=26
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=18 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_thewisdomofsolomon_12.sql (session253 the-wisdom-of-solomon 12) -----
-- Source anchor: apocrypha/the-wisdom-of-solomon ch12. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: wis12 (view _session253_wis12_lookup). Sort band base 58275, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_wis12_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: wisdom-12-by-little-and-little
  ('apocrypha', 'the-wisdom-of-solomon', 12, 8, 'canon', 'exodus', 23, 29, 'free', E'Exodus 23:29 — *I will not drive them out from before thee in one year; lest the land become desolate, and the beast of the field multiply against thee.* The very Torah word Wisdom 12:8 is reading — the dispossession deliberately measured, not total at once.'),
  ('apocrypha', 'the-wisdom-of-solomon', 12, 8, 'canon', 'exodus', 23, 30, 'free', E'Exodus 23:30 — *By little and little I will drive them out from before thee, until thou be increased, and inherit the land.* Wisdom 12:8-10 lifts Torah''s exact phrase "by little and little" and reads its restraint as room for repentance.'),
  ('apocrypha', 'the-wisdom-of-solomon', 12, 10, 'canon', 'deuteronomy', 9, 4, 'free', E'Deuteronomy 9:4 — *Speak not thou in thine heart, after that Yahuah Elohayka (the LORD thy God) hath cast them out from before thee, saying, For my righteousness Yahuah (LORD) hath brought me in to possess this land: but for the wickedness of these nations Yahuah (LORD) doth drive them out from before thee.* The judgment in Wisdom 12:10 falls on a "naughty generation" for its own wickedness, never as Israel''s merit.'),
  ('apocrypha', 'the-wisdom-of-solomon', 12, 10, 'canon', 'romans', 2, 4, 'free', E'Romans 2:4 — *Or despisest thou the riches of his goodness and forbearance and longsuffering; not knowing that the goodness of Elohim (God) leadeth thee to repentance?* Paul names the principle Wisdom 12:10 dramatizes — the withheld stroke is goodness aimed at turning the sinner.'),
  -- thread: wisdom-12-no-elohim-but-thou
  ('apocrypha', 'the-wisdom-of-solomon', 12, 13, 'canon', 'deuteronomy', 4, 35, 'free', E'Deuteronomy 4:35 — *Unto thee it was shewed, that thou mightest know that Yahuah (LORD) he is Elohim (God); there is none else beside him.* Wisdom 12:13''s "no Elohim but thou" is the Shema''s exclusivity restated as the ground of righteous judgment.'),
  ('apocrypha', 'the-wisdom-of-solomon', 12, 13, 'canon', 'isaiah', 45, 5, 'free', E'Isaiah 45:5 — *I am Yahuah (LORD), and there is none else, there is no Elohim (God) beside me: I girded thee, though thou hast not known me:* The sole-Elohim confession of Wisdom 12:13 echoes Isaiah''s repeated "none else."'),
  ('apocrypha', 'the-wisdom-of-solomon', 12, 16, 'canon', 'psalms', 145, 9, 'free', E'Psalm 145:9 — *Yahuah (LORD) is good to all: and his tender mercies are over all his works.* Wisdom 12:16 — being Elohim of all makes him gracious to all — is this Psalm in argument form.'),
  ('apocrypha', 'the-wisdom-of-solomon', 12, 12, 'canon', 'romans', 9, 20, 'free', E'Romans 9:20 — *Nay but, O man, who art thou that repliest against Elohim (God)? Shall the thing formed say to him that formed it, Why hast thou made me thus?* Paul silences the same protest Wisdom 12:12 forecloses — none may say "What have you done?" to the Judge of all.'),
  -- thread: wisdom-12-place-of-repentance
  ('apocrypha', 'the-wisdom-of-solomon', 12, 20, 'canon', '2-peter', 3, 9, 'free', E'2 Peter 3:9 — *Yahuah (Lord) is not slack concerning his promise, as some men count slackness; but is longsuffering to us-ward, not willing that any should perish, but that all should come to repentance.* Peter names the very purpose of the "time and place" Wisdom 12:20 says God grants the condemned.'),
  ('apocrypha', 'the-wisdom-of-solomon', 12, 19, 'canon', 'ezekiel', 18, 23, 'free', E'Ezekiel 18:23 — *Have I any pleasure at all that the wicked should die? saith Adonai Yahuah (the Lord GOD): and not that he should return from his ways, and live?* The "good hope" of repentance in Wisdom 12:19 rests on this — God''s pleasure is the sinner''s return, not his death.'),
  ('apocrypha', 'the-wisdom-of-solomon', 12, 19, 'canon', '1-timothy', 2, 4, 'free', E'1 Timothy 2:4 — *Who will have all men to be saved, and to come unto the knowledge of the truth.* The God who gives repentance for sins in Wisdom 12:19 is the God whose will Paul says reaches toward all.'),
  ('apocrypha', 'the-wisdom-of-solomon', 12, 19, 'apocrypha', 'the-wisdom-of-solomon', 11, 23, 'extras', E'Wisdom of Solomon 11:23 — *But you have mercy upon all; for you can do all things, and winkest at the sins of men, because they should amend.* Solomon''s own prior verse self-links: omnipotence is bent toward amendment, the same hope Wisdom 12:19 gives God''s children.'),
  -- thread: wisdom-12-just-man-merciful
  ('apocrypha', 'the-wisdom-of-solomon', 12, 19, 'canon', 'matthew', 5, 7, 'free', E'Matthew 5:7 — *Blessed are the merciful: for they shall obtain mercy.* Wisdom 12:19 — God''s works teach that "the just man should be merciful" — is the Beatitude''s exact logic: mercy extended draws mercy received.'),
  ('apocrypha', 'the-wisdom-of-solomon', 12, 22, 'canon', 'luke', 6, 36, 'free', E'Luke 6:36 — *Be ye therefore merciful, as your Father also is merciful.* Wisdom 12:22 grounds our mercy in God''s goodness so that "when we ourselves are judged, we should look for mercy" — imitating the Father''s own mercy.'),
  -- thread: wisdom-12-idols-self-torment
  ('apocrypha', 'the-wisdom-of-solomon', 12, 24, 'canon', 'romans', 1, 23, 'free', E'Romans 1:23 — *And changed the glory of the uncorruptible Elohim (God) into an image made like to corruptible man, and to birds, and fourfooted beasts, and creeping things.* Paul''s idolatry indictment — exchanging the Creator for beast-images — is exactly the error Wisdom 12:24 names, men holding for gods what is despised among the beasts.'),
  ('apocrypha', 'the-wisdom-of-solomon', 12, 27, 'canon', 'romans', 1, 23, 'free', E'Romans 1:23 — *And changed the glory of the uncorruptible Elohim (God) into an image made like to corruptible man, and to birds, and fourfooted beasts, and creeping things.* Those in Wisdom 12:27 who "denied to know" the true Yahuah are Romans 1''s people who exchanged his glory — the deliberate refusal that brings damnation.'),
  ('apocrypha', 'the-wisdom-of-solomon', 12, 23, 'apocrypha', 'the-wisdom-of-solomon', 14, 27, 'extras', E'Wisdom of Solomon 14:27 — *For the worshipping of idols not to be named is the beginning, the cause, and the end, of all evil.* Solomon''s coming idolatry-polemic self-links: the "own abominations" that torment men in Wisdom 12:23 are idols, named the source and end of all evil.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_wis12_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_wis12_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-12-by-little-and-little',
       E'By little and little — judgment that gives place for repentance',
       E'Solomon reads the conquest of Canaan as restrained mercy, not raw conquest: *Nevertheless even those you sparedst as men, and did send wasps, forerunners of yours host, to destroy them by little and little* (Wisdom of Solomon 12:8), *But executing your judgments upon them by little and little, you gavest them place of repentance* (Wisdom of Solomon 12:10). It ain''t new — this is the Torah''s own cadence. Yahuah told Yashar''el the dispossession would be measured precisely so the land would not run wild: *I will not drive them out from before thee in one year; lest the land become desolate, and the beast of the field multiply against thee* (Exodus 23:29), *By little and little I will drive them out from before thee, until thou be increased, and inherit the land* (Exodus 23:30). And the conquest was never Yashar''el''s righteousness but the nations'' ripened wickedness: *but for the wickedness of these nations Yahuah (LORD) doth drive them out from before thee* (Deuteronomy 9:4). Paul names the same withheld stroke as kindness aimed at turning: *not knowing that the goodness of Elohim (God) leadeth thee to repentance?* (Romans 2:4). The slowness is the mercy.',
       sv.verse_id, ev.verse_id, 'extras', 58275
  FROM _session253_wis12_lookup sv, _session253_wis12_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=12 AND sv.verse_number=8
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=12 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-12-no-elohim-but-thou',
       E'There is no Elohim but thou that careth for all',
       E'Against any who would arraign the Most High, Solomon plants the bedrock: *For neither is there any Yahuah (God) but you that careth for all, to whom you might shew that your judgment is not unright* (Wisdom of Solomon 12:13), and the astonishing inversion — *For your power is the beginning of righteousness, and because you are Yahuah (God) of all, it makes you to be gracious to all* (Wisdom of Solomon 12:16). It ain''t new: this is the Shema''s exclusivity. *Unto thee it was shewed, that thou mightest know that Yahuah (LORD) he is Elohim (God); there is none else beside him* (Deuteronomy 4:35); *I am Yahuah (LORD), and there is none else, there is no Elohim (God) beside me* (Isaiah 45:5). His care reaches every creature — *Yahuah (LORD) is good to all: and his tender mercies are over all his works* (Psalm 145:9). And the same unanswerable sovereignty Wisdom 12:12 protests (*who shall say, What have you done?*) is Paul''s potter: *Nay but, O man, who art thou that repliest against Elohim (God)? Shall the thing formed say to him that formed it, Why hast thou made me thus?* (Romans 9:20). The One who alone is Elohim is the One whose power is the wellspring of mercy.',
       sv.verse_id, ev.verse_id, 'extras', 58278
  FROM _session253_wis12_lookup sv, _session253_wis12_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=12 AND sv.verse_number=12
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=12 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-12-place-of-repentance',
       E'Place of repentance — not willing that any should perish',
       E'The heart of Solomon''s theodicy is that Yahuah''s deliberate delay is gospel: *you gavest them place of repentance* (Wisdom of Solomon 12:10), *and have made your children to be of a good hope that you give repentance for sins* (Wisdom of Solomon 12:19), *giving them time and place, by which they might be delivered from their malice* (Wisdom of Solomon 12:20). This is the same divine longing the prophets and apostles confess. *Yahuah (Lord) is not slack concerning his promise, as some men count slackness; but is longsuffering to us-ward, not willing that any should perish, but that all should come to repentance* (2 Peter 3:9). The God of judgment takes no delight in the stroke: *Have I any pleasure at all that the wicked should die? saith Adonai Yahuah (the Lord GOD): and not that he should return from his ways, and live?* (Ezekiel 18:23); *Who will have all men to be saved, and to come unto the knowledge of the truth* (1 Timothy 2:4). Solomon had already said it plainly a chapter before — *But you have mercy upon all; for you can do all things, and winkest at the sins of men, because they should amend* (Wisdom of Solomon 11:23). It ain''t new: the patience is purposed for return.',
       sv.verse_id, ev.verse_id, 'extras', 58281
  FROM _session253_wis12_lookup sv, _session253_wis12_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=12 AND sv.verse_number=19
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=12 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-12-just-man-merciful',
       E'The just man should be merciful',
       E'Solomon draws the ethic straight out of the theodicy: because Yahuah judges with such restraint, his people must imitate it — *But by such works have you taught your people that the just man should be merciful* (Wisdom of Solomon 12:19), *to the intent that, when we judge, we should carefully think of your goodness, and when we ourselves are judged, we should look for mercy* (Wisdom of Solomon 12:22). It ain''t new — Yahusha makes mercy the hinge of judgment in the Sermon: *Blessed are the merciful: for they shall obtain mercy* (Matthew 5:7), and binds it to the Father''s own character: *Be ye therefore merciful, as your Father also is merciful* (Luke 6:36). The measure we extend in judging is the measure we plead to receive — Solomon''s "look for mercy" is the Beatitude in seed.',
       sv.verse_id, ev.verse_id, 'extras', 58284
  FROM _session253_wis12_lookup sv, _session253_wis12_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=12 AND sv.verse_number=19
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=12 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-12-idols-self-torment',
       E'Tormented by their own abominations — the idolatry that condemns',
       E'The chapter closes on the pagans'' self-inflicted ruin: *whereas men have lived dissolutely and unrighteously, you have tormented them with their own abominations* (Wisdom of Solomon 12:23), *For they went astray very far in the ways of error, and held them for gods, which even among the beasts of their enemies were despised* (Wisdom of Solomon 12:24), and at the last *they acknowledged him to be the true Yahuah (God), whom before they denied to know: and therefore came extreme damnation upon them* (Wisdom of Solomon 12:27). This is the very indictment Romans 1 will draw from Wisdom''s idolatry-polemic — men who exchange the Creator for the creature: *And changed the glory of the uncorruptible Elohim (God) into an image made like to corruptible man, and to birds, and fourfooted beasts, and creeping things* (Romans 1:23). Solomon''s own next chapters name it the headwaters of every evil — *For the worshipping of idols not to be named is the beginning, the cause, and the end, of all evil* (Wisdom of Solomon 14:27). It ain''t new: the idol is the lie, and the lie is its own torment.',
       sv.verse_id, ev.verse_id, 'extras', 58287
  FROM _session253_wis12_lookup sv, _session253_wis12_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=12 AND sv.verse_number=23
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=12 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: wisdom-12-by-little-and-little
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 23:29 — *I will not drive them out from before thee in one year; lest the land become desolate, and the beast of the field multiply against thee.* The very Torah word Wisdom 12:8 is reading — the dispossession deliberately measured, not total at once.'
  FROM cross_reference_threads t, cross_references x, _session253_wis12_lookup sv, _session253_wis12_lookup tv
 WHERE t.slug='wisdom-12-by-little-and-little'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=12 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=23 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 23:30 — *By little and little I will drive them out from before thee, until thou be increased, and inherit the land.* Wisdom 12:8-10 lifts Torah''s exact phrase "by little and little" and reads its restraint as room for repentance.'
  FROM cross_reference_threads t, cross_references x, _session253_wis12_lookup sv, _session253_wis12_lookup tv
 WHERE t.slug='wisdom-12-by-little-and-little'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=12 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=23 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 9:4 — *Speak not thou in thine heart, after that Yahuah Elohayka (the LORD thy God) hath cast them out from before thee, saying, For my righteousness Yahuah (LORD) hath brought me in to possess this land: but for the wickedness of these nations Yahuah (LORD) doth drive them out from before thee.* The judgment in Wisdom 12:10 falls on a "naughty generation" for its own wickedness, never as Israel''s merit.'
  FROM cross_reference_threads t, cross_references x, _session253_wis12_lookup sv, _session253_wis12_lookup tv
 WHERE t.slug='wisdom-12-by-little-and-little'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=12 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=9 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 2:4 — *Or despisest thou the riches of his goodness and forbearance and longsuffering; not knowing that the goodness of Elohim (God) leadeth thee to repentance?* Paul names the principle Wisdom 12:10 dramatizes — the withheld stroke is goodness aimed at turning the sinner.'
  FROM cross_reference_threads t, cross_references x, _session253_wis12_lookup sv, _session253_wis12_lookup tv
 WHERE t.slug='wisdom-12-by-little-and-little'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=12 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-12-no-elohim-but-thou
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 4:35 — *Unto thee it was shewed, that thou mightest know that Yahuah (LORD) he is Elohim (God); there is none else beside him.* Wisdom 12:13''s "no Elohim but thou" is the Shema''s exclusivity restated as the ground of righteous judgment.'
  FROM cross_reference_threads t, cross_references x, _session253_wis12_lookup sv, _session253_wis12_lookup tv
 WHERE t.slug='wisdom-12-no-elohim-but-thou'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=12 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=4 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 45:5 — *I am Yahuah (LORD), and there is none else, there is no Elohim (God) beside me: I girded thee, though thou hast not known me:* The sole-Elohim confession of Wisdom 12:13 echoes Isaiah''s repeated "none else."'
  FROM cross_reference_threads t, cross_references x, _session253_wis12_lookup sv, _session253_wis12_lookup tv
 WHERE t.slug='wisdom-12-no-elohim-but-thou'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=12 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=45 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 145:9 — *Yahuah (LORD) is good to all: and his tender mercies are over all his works.* Wisdom 12:16 — being Elohim of all makes him gracious to all — is this Psalm in argument form.'
  FROM cross_reference_threads t, cross_references x, _session253_wis12_lookup sv, _session253_wis12_lookup tv
 WHERE t.slug='wisdom-12-no-elohim-but-thou'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=12 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=145 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 9:20 — *Nay but, O man, who art thou that repliest against Elohim (God)? Shall the thing formed say to him that formed it, Why hast thou made me thus?* Paul silences the same protest Wisdom 12:12 forecloses — none may say "What have you done?" to the Judge of all.'
  FROM cross_reference_threads t, cross_references x, _session253_wis12_lookup sv, _session253_wis12_lookup tv
 WHERE t.slug='wisdom-12-no-elohim-but-thou'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=12 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=9 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-12-place-of-repentance
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Peter 3:9 — *Yahuah (Lord) is not slack concerning his promise, as some men count slackness; but is longsuffering to us-ward, not willing that any should perish, but that all should come to repentance.* Peter names the very purpose of the "time and place" Wisdom 12:20 says God grants the condemned.'
  FROM cross_reference_threads t, cross_references x, _session253_wis12_lookup sv, _session253_wis12_lookup tv
 WHERE t.slug='wisdom-12-place-of-repentance'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=12 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=3 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 18:23 — *Have I any pleasure at all that the wicked should die? saith Adonai Yahuah (the Lord GOD): and not that he should return from his ways, and live?* The "good hope" of repentance in Wisdom 12:19 rests on this — God''s pleasure is the sinner''s return, not his death.'
  FROM cross_reference_threads t, cross_references x, _session253_wis12_lookup sv, _session253_wis12_lookup tv
 WHERE t.slug='wisdom-12-place-of-repentance'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=12 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=18 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Timothy 2:4 — *Who will have all men to be saved, and to come unto the knowledge of the truth.* The God who gives repentance for sins in Wisdom 12:19 is the God whose will Paul says reaches toward all.'
  FROM cross_reference_threads t, cross_references x, _session253_wis12_lookup sv, _session253_wis12_lookup tv
 WHERE t.slug='wisdom-12-place-of-repentance'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=12 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='1-timothy' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Wisdom of Solomon 11:23 — *But you have mercy upon all; for you can do all things, and winkest at the sins of men, because they should amend.* Solomon''s own prior verse self-links: omnipotence is bent toward amendment, the same hope Wisdom 12:19 gives God''s children.'
  FROM cross_reference_threads t, cross_references x, _session253_wis12_lookup sv, _session253_wis12_lookup tv
 WHERE t.slug='wisdom-12-place-of-repentance'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=12 AND sv.verse_number=19
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=11 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-12-just-man-merciful
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 5:7 — *Blessed are the merciful: for they shall obtain mercy.* Wisdom 12:19 — God''s works teach that "the just man should be merciful" — is the Beatitude''s exact logic: mercy extended draws mercy received.'
  FROM cross_reference_threads t, cross_references x, _session253_wis12_lookup sv, _session253_wis12_lookup tv
 WHERE t.slug='wisdom-12-just-man-merciful'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=12 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Luke 6:36 — *Be ye therefore merciful, as your Father also is merciful.* Wisdom 12:22 grounds our mercy in God''s goodness so that "when we ourselves are judged, we should look for mercy" — imitating the Father''s own mercy.'
  FROM cross_reference_threads t, cross_references x, _session253_wis12_lookup sv, _session253_wis12_lookup tv
 WHERE t.slug='wisdom-12-just-man-merciful'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=12 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=6 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-12-idols-self-torment
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Romans 1:23 — *And changed the glory of the uncorruptible Elohim (God) into an image made like to corruptible man, and to birds, and fourfooted beasts, and creeping things.* Paul''s idolatry indictment — exchanging the Creator for beast-images — is exactly the error Wisdom 12:24 names, men holding for gods what is despised among the beasts.'
  FROM cross_reference_threads t, cross_references x, _session253_wis12_lookup sv, _session253_wis12_lookup tv
 WHERE t.slug='wisdom-12-idols-self-torment'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=12 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=1 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 1:23 — *And changed the glory of the uncorruptible Elohim (God) into an image made like to corruptible man, and to birds, and fourfooted beasts, and creeping things.* Those in Wisdom 12:27 who "denied to know" the true Yahuah are Romans 1''s people who exchanged his glory — the deliberate refusal that brings damnation.'
  FROM cross_reference_threads t, cross_references x, _session253_wis12_lookup sv, _session253_wis12_lookup tv
 WHERE t.slug='wisdom-12-idols-self-torment'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=12 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=1 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Wisdom of Solomon 14:27 — *For the worshipping of idols not to be named is the beginning, the cause, and the end, of all evil.* Solomon''s coming idolatry-polemic self-links: the "own abominations" that torment men in Wisdom 12:23 are idols, named the source and end of all evil.'
  FROM cross_reference_threads t, cross_references x, _session253_wis12_lookup sv, _session253_wis12_lookup tv
 WHERE t.slug='wisdom-12-idols-self-torment'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=12 AND sv.verse_number=23
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=14 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_thewisdomofsolomon_13.sql (session253 the-wisdom-of-solomon 13) -----
-- Source anchor: apocrypha/the-wisdom-of-solomon ch13. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: wis13 (view _session253_wis13_lookup). Sort band base 58300, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_wis13_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: wisdom-13-creator-known-from-creation
  ('apocrypha', 'the-wisdom-of-solomon', 13, 1, 'canon', 'romans', 1, 21, 'free', E'Romans 1:21 — *Because that, when they knew Elohim (God), they glorified him not as Elohim (God), neither were thankful; but became vain in their imaginations, and their foolish heart was darkened.* Paul''s *became vain* is Wisdom 13:1''s *vain are all men by nature, who are ignorant of Yahuah (God)* — the same failure to acknowledge the workmaster.'),
  ('apocrypha', 'the-wisdom-of-solomon', 13, 5, 'canon', 'romans', 1, 20, 'free', E'Romans 1:20 — *For the invisible things of him from the creation of the world are clearly seen, being understood by the things that are made, even his eternal power and Godhead; so that they are without excuse:* Romans quotes Wisdom 13:5 — the maker *proportionably seen* in the beauty of the creatures, leaving the idolater without excuse.'),
  ('apocrypha', 'the-wisdom-of-solomon', 13, 5, 'canon', 'psalms', 19, 1, 'free', E'Psalm 19:1 — *The heavens declare the glory of Elohim (God); and the firmament sheweth his handywork.* The same creation-preaching that Wisdom 13:5 makes the ground of the idolater''s guilt.'),
  ('apocrypha', 'the-wisdom-of-solomon', 13, 4, 'canon', 'job', 12, 7, 'free', E'Job 12:7 — *But ask now the beasts, and they shall teach thee; and the fowls of the air, and they shall tell thee:* Even the creatures testify to him that made them, the very inference Wisdom 13:4 demands — to understand the mightier one by his power and virtue.'),
  -- thread: wisdom-13-godhead-not-like-gold
  ('apocrypha', 'the-wisdom-of-solomon', 13, 6, 'canon', 'acts', 17, 27, 'free', E'Acts 17:27 — *That they should seek Yahuah (Lord), if haply they might feel after him, and find him, though he be not far from every one of us:* Paul names the very groping after God that Wisdom 13:6 calls the lesser error — men *seeking Yahuah (God), and desirous to find him.*'),
  ('apocrypha', 'the-wisdom-of-solomon', 13, 9, 'canon', 'acts', 17, 29, 'free', E'Acts 17:29 — *Forasmuch then as we are the offspring of Elohim (God), we ought not to think that the Godhead is like unto gold, or silver, or stone, graven by art and man''s device.* The answer to Wisdom 13:9''s reproach — those able to *aim at the world* should have found its God, not graven him in gold and stone.'),
  ('apocrypha', 'the-wisdom-of-solomon', 13, 9, 'canon', 'romans', 1, 25, 'free', E'Romans 1:25 — *Who changed the truth of Elohim (God) into a lie, and worshipped and served the creature more than the Creator, who is blessed for ever. Amen.* The unpardonable swap of Wisdom 13:8-9 — serving the creature, having failed to find the Creator thereof.'),
  -- thread: wisdom-13-carpenter-carves-a-god
  ('apocrypha', 'the-wisdom-of-solomon', 13, 13, 'canon', 'isaiah', 44, 13, 'free', E'Isaiah 44:13 — *The carpenter stretcheth out his rule; he marketh it out with a line; he fitteth it with planes, and he marketh it out with the compass, and maketh it after the figure of a man, according to the beauty of a man; that it may remain in the house.* Isaiah''s carpenter is Wisdom 13:13''s — carving the leftover wood *to the image of a man.*'),
  ('apocrypha', 'the-wisdom-of-solomon', 13, 12, 'canon', 'isaiah', 44, 16, 'free', E'Isaiah 44:16 — *He burneth part thereof in the fire; with part thereof he eateth flesh; he roasteth roast, and is satisfied: yea, he warmeth himself, and saith, Aha, I am warm, I have seen the fire:* The same refuse Wisdom 13:12 burns *to dress his meat* — and the residue becomes a god.'),
  ('apocrypha', 'the-wisdom-of-solomon', 13, 11, 'canon', 'jeremiah', 10, 3, 'free', E'Jeremiah 10:3 — *For the customs of the people are vain: for one cutteth a tree out of the forest, the work of the hands of the workman, with the axe.* Jeremiah''s felled tree is Wisdom 13:11''s carpenter *that felleth timber* — the vain custom of carving gods from the forest.'),
  -- thread: wisdom-13-prayer-to-the-dead-thing
  ('apocrypha', 'the-wisdom-of-solomon', 13, 10, 'canon', 'psalms', 115, 4, 'free', E'Psalm 115:4 — *Their idols are silver and gold, the work of men''s hands.* The very *gold and silver... the works of men''s hands* that Wisdom 13:10 calls a dead hope.'),
  ('apocrypha', 'the-wisdom-of-solomon', 13, 17, 'canon', 'psalms', 115, 5, 'free', E'Psalm 115:5 — *They have mouths, but they speak not: eyes have they, but they see not:* The lifeless idol Wisdom 13:17 prays to — speaking *to that which has no life.*'),
  ('apocrypha', 'the-wisdom-of-solomon', 13, 18, 'apocrypha', 'the-wisdom-of-solomon', 14, 8, 'extras', E'Wisdom of Solomon 14:8 — *But that which is made with hands is cursed, as well it, as he that made it: he, because he made it; and it, because, being corruptible, it was called god.* The next breath of the same polemic — the dead thing of Wisdom 13:18, *that which is weak... that which is dead*, named cursed along with its maker.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_wis13_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_wis13_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-13-creator-known-from-creation',
       E'The workmaster known from the works',
       E'Wisdom opens the idolatry polemic exactly where Paul will stand: *Surely vain are all men by nature, who are ignorant of Yahuah (God), and could not out of the good things that are seen know him that is: neither by considering the works did they acknowledge the workmaster* (Wisdom of Solomon 13:1), for *by the greatness and beauty of the creatures proportionably the maker of them is seen* (Wisdom of Solomon 13:5). This is the very seam Romans quarries — *For the invisible things of him from the creation of the world are clearly seen, being understood by the things that are made, even his eternal power and Godhead; so that they are without excuse* (Romans 1:20), and then *when they knew Elohim (God), they glorified him not as Elohim (God), neither were thankful; but became vain in their imaginations* (Romans 1:21) — Paul''s *vain* is Wisdom''s *vain*. The witness is older still: *The heavens declare the glory of Elohim (God); and the firmament sheweth his handywork* (Psalm 19:1), and even the dumb creatures preach it — *ask now the beasts, and they shall teach thee; and the fowls of the air, and they shall tell thee* (Job 12:7). It ain''t new: the Creator has always been legible in the creation, and the works indict the man who reads them and stops short of the workmaster.',
       sv.verse_id, ev.verse_id, 'extras', 58300
  FROM _session253_wis13_lookup sv, _session253_wis13_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=13 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=13 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-13-godhead-not-like-gold',
       E'We ought not to think the Godhead like gold',
       E'Wisdom is generous toward the seeking pagan and severe toward the settled one: *for they perhaps err, seeking Yahuah (God), and desirous to find him* (Wisdom of Solomon 13:6), *because the things are beautiful that are seen* (Wisdom of Solomon 13:7) — yet *neither are they to be pardoned* (Wisdom of Solomon 13:8), *for if they were able to know so much, that they could aim at the world; how did they not sooner find out Yahuah (God) thereof?* (Wisdom of Solomon 13:9). Paul preaches the identical mercy-and-summons on Mars'' hill: the Creator *that made the world and all things therein* set men *that they should seek Yahuah (Lord), if haply they might feel after him, and find him, though he be not far from every one of us* (Acts 17:27) — but the seeking forbids the carving: *Forasmuch then as we are the offspring of Elohim (God), we ought not to think that the Godhead is like unto gold, or silver, or stone, graven by art and man''s device* (Acts 17:29). The fall, both in Wisdom and in Romans, is the swap — men *changed the truth of Elohim (God) into a lie, and worshipped and served the creature more than the Creator, who is blessed for ever. Amen* (Romans 1:25). To see the world and miss its Maker is the one error that cannot be pardoned.',
       sv.verse_id, ev.verse_id, 'extras', 58303
  FROM _session253_wis13_lookup sv, _session253_wis13_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=13 AND sv.verse_number=6
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=13 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-13-carpenter-carves-a-god',
       E'The carpenter carves a god from the refuse wood',
       E'Wisdom''s carpenter is Isaiah''s carpenter, retold: he *felleth timber* and makes *a vessel thereof fit for the service of man''s life* (Wisdom of Solomon 13:11), spends *the refuse of his work to dress his meat* (Wisdom of Solomon 13:12), and then *taking the very refuse... being a crooked piece of wood, and full of knots, has carved it diligently, when he had nothing else to do... and fashioned it to the image of a man* (Wisdom of Solomon 13:13). He fastens it lest it fall, *knowing that it was unable to help itself; for it is an image, and has need of help* (Wisdom of Solomon 13:16). Isaiah drew the same picture centuries before: *The carpenter stretcheth out his rule... and maketh it after the figure of a man, according to the beauty of a man; that it may remain in the house* (Isaiah 44:13); *He heweth him down cedars* (Isaiah 44:14), and *He burneth part thereof in the fire; with part thereof he eateth flesh* (Isaiah 44:16) — half for warmth and bread, half worshipped. Jeremiah names the absurdity flatly: *For the customs of the people are vain: for one cutteth a tree out of the forest, the work of the hands of the workman, with the axe* (Jeremiah 10:3). It ain''t new — Wisdom is simply preaching Isaiah''s and Jeremiah''s woodpile: the part you burn and the part you bow to came off the same crooked log.',
       sv.verse_id, ev.verse_id, 'extras', 58306
  FROM _session253_wis13_lookup sv, _session253_wis13_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=13 AND sv.verse_number=11
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=13 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-13-prayer-to-the-dead-thing',
       E'Prayer to that which has no life',
       E'The polemic ends in the pity of it — *miserable are they, and in dead things is their hope, who call them gods, which are the works of men''s hands, gold and silver... and resemblances of beasts, or a stone good for nothing* (Wisdom of Solomon 13:10). Having nailed the idol fast, the maker *makes he prayer for his goods, for his wife and children, and is not ashamed to speak to that which has no life* (Wisdom of Solomon 13:17): *For health he calls upon that which is weak: for life prayeth to that which is dead* (Wisdom of Solomon 13:18). The Psalmist sang this scorn long before — *Their idols are silver and gold, the work of men''s hands* (Psalm 115:4); *They have mouths, but they speak not: eyes have they, but they see not* (Psalm 115:5). And Wisdom itself doubles down in the next chapter, the self-same library: *that which is made with hands is cursed, as well it, as he that made it: he, because he made it; and it, because, being corruptible, it was called god* (Wisdom of Solomon 14:8). To beg life of a dead thing is the headwater Romans will trace to all the rest — the creature served in the Creator''s place.',
       sv.verse_id, ev.verse_id, 'extras', 58309
  FROM _session253_wis13_lookup sv, _session253_wis13_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=13 AND sv.verse_number=10
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=13 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: wisdom-13-creator-known-from-creation
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Romans 1:21 — *Because that, when they knew Elohim (God), they glorified him not as Elohim (God), neither were thankful; but became vain in their imaginations, and their foolish heart was darkened.* Paul''s *became vain* is Wisdom 13:1''s *vain are all men by nature, who are ignorant of Yahuah (God)* — the same failure to acknowledge the workmaster.'
  FROM cross_reference_threads t, cross_references x, _session253_wis13_lookup sv, _session253_wis13_lookup tv
 WHERE t.slug='wisdom-13-creator-known-from-creation'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=13 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=1 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 1:20 — *For the invisible things of him from the creation of the world are clearly seen, being understood by the things that are made, even his eternal power and Godhead; so that they are without excuse:* Romans quotes Wisdom 13:5 — the maker *proportionably seen* in the beauty of the creatures, leaving the idolater without excuse.'
  FROM cross_reference_threads t, cross_references x, _session253_wis13_lookup sv, _session253_wis13_lookup tv
 WHERE t.slug='wisdom-13-creator-known-from-creation'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=13 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=1 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 19:1 — *The heavens declare the glory of Elohim (God); and the firmament sheweth his handywork.* The same creation-preaching that Wisdom 13:5 makes the ground of the idolater''s guilt.'
  FROM cross_reference_threads t, cross_references x, _session253_wis13_lookup sv, _session253_wis13_lookup tv
 WHERE t.slug='wisdom-13-creator-known-from-creation'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=13 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Job 12:7 — *But ask now the beasts, and they shall teach thee; and the fowls of the air, and they shall tell thee:* Even the creatures testify to him that made them, the very inference Wisdom 13:4 demands — to understand the mightier one by his power and virtue.'
  FROM cross_reference_threads t, cross_references x, _session253_wis13_lookup sv, _session253_wis13_lookup tv
 WHERE t.slug='wisdom-13-creator-known-from-creation'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=13 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=12 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-13-godhead-not-like-gold
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Acts 17:27 — *That they should seek Yahuah (Lord), if haply they might feel after him, and find him, though he be not far from every one of us:* Paul names the very groping after God that Wisdom 13:6 calls the lesser error — men *seeking Yahuah (God), and desirous to find him.*'
  FROM cross_reference_threads t, cross_references x, _session253_wis13_lookup sv, _session253_wis13_lookup tv
 WHERE t.slug='wisdom-13-godhead-not-like-gold'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=13 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=17 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Acts 17:29 — *Forasmuch then as we are the offspring of Elohim (God), we ought not to think that the Godhead is like unto gold, or silver, or stone, graven by art and man''s device.* The answer to Wisdom 13:9''s reproach — those able to *aim at the world* should have found its God, not graven him in gold and stone.'
  FROM cross_reference_threads t, cross_references x, _session253_wis13_lookup sv, _session253_wis13_lookup tv
 WHERE t.slug='wisdom-13-godhead-not-like-gold'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=13 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=17 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 1:25 — *Who changed the truth of Elohim (God) into a lie, and worshipped and served the creature more than the Creator, who is blessed for ever. Amen.* The unpardonable swap of Wisdom 13:8-9 — serving the creature, having failed to find the Creator thereof.'
  FROM cross_reference_threads t, cross_references x, _session253_wis13_lookup sv, _session253_wis13_lookup tv
 WHERE t.slug='wisdom-13-godhead-not-like-gold'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=13 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=1 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-13-carpenter-carves-a-god
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 44:13 — *The carpenter stretcheth out his rule; he marketh it out with a line; he fitteth it with planes, and he marketh it out with the compass, and maketh it after the figure of a man, according to the beauty of a man; that it may remain in the house.* Isaiah''s carpenter is Wisdom 13:13''s — carving the leftover wood *to the image of a man.*'
  FROM cross_reference_threads t, cross_references x, _session253_wis13_lookup sv, _session253_wis13_lookup tv
 WHERE t.slug='wisdom-13-carpenter-carves-a-god'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=13 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 44:16 — *He burneth part thereof in the fire; with part thereof he eateth flesh; he roasteth roast, and is satisfied: yea, he warmeth himself, and saith, Aha, I am warm, I have seen the fire:* The same refuse Wisdom 13:12 burns *to dress his meat* — and the residue becomes a god.'
  FROM cross_reference_threads t, cross_references x, _session253_wis13_lookup sv, _session253_wis13_lookup tv
 WHERE t.slug='wisdom-13-carpenter-carves-a-god'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=13 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 10:3 — *For the customs of the people are vain: for one cutteth a tree out of the forest, the work of the hands of the workman, with the axe.* Jeremiah''s felled tree is Wisdom 13:11''s carpenter *that felleth timber* — the vain custom of carving gods from the forest.'
  FROM cross_reference_threads t, cross_references x, _session253_wis13_lookup sv, _session253_wis13_lookup tv
 WHERE t.slug='wisdom-13-carpenter-carves-a-god'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=13 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=10 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-13-prayer-to-the-dead-thing
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 115:4 — *Their idols are silver and gold, the work of men''s hands.* The very *gold and silver... the works of men''s hands* that Wisdom 13:10 calls a dead hope.'
  FROM cross_reference_threads t, cross_references x, _session253_wis13_lookup sv, _session253_wis13_lookup tv
 WHERE t.slug='wisdom-13-prayer-to-the-dead-thing'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=13 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=115 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 115:5 — *They have mouths, but they speak not: eyes have they, but they see not:* The lifeless idol Wisdom 13:17 prays to — speaking *to that which has no life.*'
  FROM cross_reference_threads t, cross_references x, _session253_wis13_lookup sv, _session253_wis13_lookup tv
 WHERE t.slug='wisdom-13-prayer-to-the-dead-thing'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=13 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=115 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Wisdom of Solomon 14:8 — *But that which is made with hands is cursed, as well it, as he that made it: he, because he made it; and it, because, being corruptible, it was called god.* The next breath of the same polemic — the dead thing of Wisdom 13:18, *that which is weak... that which is dead*, named cursed along with its maker.'
  FROM cross_reference_threads t, cross_references x, _session253_wis13_lookup sv, _session253_wis13_lookup tv
 WHERE t.slug='wisdom-13-prayer-to-the-dead-thing'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=13 AND sv.verse_number=18
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=14 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_thewisdomofsolomon_14.sql (session253 the-wisdom-of-solomon 14) -----
-- Source anchor: apocrypha/the-wisdom-of-solomon ch14. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: wis14 (view _session253_wis14_lookup). Sort band base 58325, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_wis14_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: wisdom-of-solomon-14-devising-of-idols-spiritual-fornication
  ('apocrypha', 'the-wisdom-of-solomon', 14, 12, 'canon', 'exodus', 20, 4, 'free', E'Exodus 20:4 — *Thou shalt not make unto thee any graven image, or any likeness of any thing that is in heaven above, or that is in the earth beneath, or that is in the water under the earth:* the second commandment is the law Solomon traces idolatry''s whole corruption back to in Wisdom of Solomon 14:12.'),
  ('apocrypha', 'the-wisdom-of-solomon', 14, 12, 'canon', 'ezekiel', 23, 37, 'free', E'Ezekiel 23:37 — *That they have committed adultery, and blood is in their hands, and with their idols have they committed adultery, and have also caused their sons to pass through the fire, unto them to devour them.* Ezekiel names idolatry the very ''spiritual fornication'' Wisdom of Solomon 14:12 calls its beginning, joined as here to child-sacrifice.'),
  ('apocrypha', 'the-wisdom-of-solomon', 14, 12, 'canon', 'exodus', 20, 3, 'free', E'Exodus 20:3 — *Thou shalt have no other gods before me.* The first word of the covenant is the standard against which Wisdom of Solomon 14:12 measures the devising of idols as fornication.'),
  -- thread: wisdom-of-solomon-14-origin-of-idols-dead-child-king
  ('apocrypha', 'the-wisdom-of-solomon', 14, 15, 'canon', 'jeremiah', 10, 5, 'free', E'Jeremiah 10:5 — *They are upright as the palm tree, but speak not: they must needs be borne, because they cannot go. Be not afraid of them; for they cannot do evil, neither also is it in them to do good.* The dead image honoured as a god in Wisdom of Solomon 14:15 is Jeremiah''s breathless idol that can neither speak nor walk.'),
  ('apocrypha', 'the-wisdom-of-solomon', 14, 16, 'canon', 'jeremiah', 10, 14, 'free', E'Jeremiah 10:14 — *Every man is brutish in his knowledge: every founder is confounded by the graven image: for his molten image is falsehood, and there is no breath in them.* The artisan''s image worshipped by kings'' command in Wisdom of Solomon 14:16 is Jeremiah''s molten falsehood with no breath in it.'),
  ('apocrypha', 'the-wisdom-of-solomon', 14, 16, 'canon', 'daniel', 3, 18, 'free', E'Daniel 3:18 — *But if not, be it known unto thee, O king, that we will not serve thy gods, nor worship the golden image which thou hast set up.* When ''graven images were worshipped by the commandments of kings'' (Wisdom of Solomon 14:16), Daniel''s three refuse the king''s golden image at the cost of the furnace.'),
  ('apocrypha', 'the-wisdom-of-solomon', 14, 17, 'canon', 'habakkuk', 2, 19, 'free', E'Habakkuk 2:19 — *Woe unto him that saith to the wood, Awake; to the dumb stone, Arise, it shall teach! Behold, it is laid over with gold and silver, and there is no breath at all in the midst of it.* The flattering image of the absent king in Wisdom of Solomon 14:17 is Habakkuk''s gilded wood and stone with no breath at all.'),
  -- thread: wisdom-of-solomon-14-artificer-allured-multitude-craftsman
  ('apocrypha', 'the-wisdom-of-solomon', 14, 18, 'canon', 'isaiah', 44, 13, 'free', E'Isaiah 44:13 — *The carpenter stretcheth out his rule; he marketh it out with a line; he fitteth it with planes, and he marketh it out with the compass, and maketh it after the figure of a man, according to the beauty of a man; that it may remain in the house.* Isaiah''s craftsman shaping a beautiful man-figure is the very ''singular diligence of the artificer'' that sets forward superstition in Wisdom of Solomon 14:18.'),
  ('apocrypha', 'the-wisdom-of-solomon', 14, 20, 'canon', 'isaiah', 44, 17, 'free', E'Isaiah 44:17 — *And the residue thereof he maketh a god, even his graven image: he falleth down unto it, and worshippeth it, and prayeth unto it, and saith, Deliver me; for thou art my god.* The multitude ''allured by the grace of the work'' who take the image for a god (Wisdom of Solomon 14:20) is Isaiah''s man bowing to the leftover block and calling it his god.'),
  ('apocrypha', 'the-wisdom-of-solomon', 14, 20, 'canon', 'acts', 19, 25, 'free', E'Acts 19:25 — *Whom he called together with the workmen of like occupation, and said, Sirs, ye know that by this craft we have our wealth.* Demetrius the silversmith rallies the craftsmen of beautiful images, the same artificer''s allure that makes the ignorant multitude idolaters in Wisdom of Solomon 14:20.'),
  -- thread: wisdom-of-solomon-14-romans-1-knowledge-of-god-reprobate-mind
  ('apocrypha', 'the-wisdom-of-solomon', 14, 22, 'canon', 'romans', 1, 28, 'free', E'Romans 1:28 — *And even as they did not like to retain God in their knowledge, God gave them over to a reprobate mind, to do those things which are not convenient;* Paul''s reprobate mind is exactly the company who ''erred in the knowledge of Yahuah (God)'' in Wisdom of Solomon 14:22 — Romans 1 is quoting this idolatry polemic.'),
  ('apocrypha', 'the-wisdom-of-solomon', 14, 25, 'canon', 'romans', 1, 29, 'free', E'Romans 1:29 — *Being filled with all unrighteousness, fornication, wickedness, covetousness, maliciousness; full of envy, murder, debate, deceit, malignity; whisperers,* Paul''s vice-list of murder, deceit and unrighteousness is the same ''blood, manslaughter, theft... perjury'' that reigns after idolatry in Wisdom of Solomon 14:25.'),
  ('apocrypha', 'the-wisdom-of-solomon', 14, 24, 'canon', 'romans', 1, 24, 'free', E'Romans 1:24 — *Wherefore God also gave them up to uncleanness through the lusts of their own hearts, to dishonour their own bodies between themselves:* The defiled lives and marriages of Wisdom of Solomon 14:24 are the uncleanness God gives idolaters up to in Romans 1:24.'),
  ('apocrypha', 'the-wisdom-of-solomon', 14, 26, 'canon', 'romans', 1, 26, 'free', E'Romans 1:26 — *For this cause God gave them up unto vile affections: for even their women did change the natural use into that which is against nature:* The ''changing of kind... disorder in marriages... shameless uncleanness'' of Wisdom of Solomon 14:26 is precisely the vile affections against nature in Romans 1:26.'),
  ('apocrypha', 'the-wisdom-of-solomon', 14, 27, 'apocrypha', 'the-wisdom-of-solomon', 13, 1, 'extras', E'Wisdom of Solomon 13:1 — *Surely vain are all men by nature, who are ignorant of God, and could not out of the good things that are seen know him that is: neither by considering the works did they acknowledge the workmaster;* the thesis that idolatry is ''the beginning, the cause, and the end, of all evil'' (Wisdom of Solomon 14:27) completes the polemic begun in 13:1, the Creator unknown though seen — the very pairing Romans 1:20 and 1:25 draw on.'),
  -- thread: wisdom-of-solomon-14-idols-no-life-false-swearing-vengeance
  ('apocrypha', 'the-wisdom-of-solomon', 14, 29, 'canon', 'psalms', 115, 8, 'free', E'Psalms 115:8 — *They that make them are like unto them; so is every one that trusteth in them.* The lifeless idols in which men trust in Wisdom of Solomon 14:29 are the Psalmist''s dumb images that make their trusters like themselves.'),
  ('apocrypha', 'the-wisdom-of-solomon', 14, 30, 'canon', 'exodus', 20, 7, 'free', E'Exodus 20:7 — *Thou shalt not take the name of the LORD thy God in vain; for the LORD will not hold him guiltless that taketh his name in vain.* The false swearing ''in deceit, despising holiness'' punished in Wisdom of Solomon 14:30 breaks the third commandment, which will not hold the swearer guiltless.'),
  ('apocrypha', 'the-wisdom-of-solomon', 14, 31, 'canon', 'deuteronomy', 32, 35, 'free', E'Deuteronomy 32:35 — *To me belongeth vengeance, and recompence; their foot shall slide in due time: for the day of their calamity is at hand, and the things that shall come upon them make haste.* The ''just vengeance of sinners'' that always punishes the ungodly in Wisdom of Solomon 14:31 is the vengeance God reserves to Himself in the Song of Moses.'),
  ('apocrypha', 'the-wisdom-of-solomon', 14, 31, 'canon', 'romans', 12, 19, 'free', E'Romans 12:19 — *Dearly beloved, avenge not yourselves, but rather give place unto wrath: for it is written, Vengeance is mine; I will repay, saith the Lord.* Paul claims the same ''just vengeance'' that Wisdom of Solomon 14:31 assigns to God against the ungodly, forbidding the believer to take it up himself.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_wis14_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_wis14_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-of-solomon-14-devising-of-idols-spiritual-fornication',
       E'The devising of idols — the beginning of spiritual fornication',
       E'Solomon names the root: *For the devising of idols was the beginning of spiritual fornication, and the invention of them the corruption of life.* (Wisdom of Solomon 14:12). They are not of the beginning and will not endure — *For neither were they from the beginning, neither shall they be for ever.* (Wisdom of Solomon 14:13). The whole Tanakh sounds the same charge that idolatry is harlotry against the covenant: *And they shall know that I am the LORD, that I have brought this evil upon them. Then I saw, and behold a likeness as the appearance of fire... whoredom and her idols.* The first commandment forbade it — *Thou shalt have no other gods before me.* (Exodus 20:3) — *Thou shalt not make unto thee any graven image* (Exodus 20:4) — and Israel''s apostasy is named adultery — *they have committed adultery, and blood is in their hands, and with their idols have they committed adultery* (Ezekiel 23:37). Paul carries the indictment forward to the reprobate mind: idolatry exchanges the truth of God for a lie. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 58325
  FROM _session253_wis14_lookup sv, _session253_wis14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=14 AND sv.verse_number=12
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=14 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-of-solomon-14-origin-of-idols-dead-child-king',
       E'The origin of idols — the grieving father and the king''s image',
       E'Wisdom gives the genealogy of the idol: grief and flattery, not revelation. *For a father afflicted with untimely mourning, when he has made an image of his child soon taken away, now honoured him as a god, which was then a dead man, and delivered to those that were under him ceremonies and sacrifices.* (Wisdom of Solomon 14:15). *Thus in process of time an ungodly custom grown strong was kept as a law, and graven images were worshipped by the commandments of kings.* (Wisdom of Solomon 14:16). The prophets had already exposed the manufacture: the idol is shaped wood that cannot speak or move — *They are upright as the palm tree, but speak not: they must needs be borne, because they cannot go. Be not afraid of them; for they cannot do evil, neither also is it in them to do good.* (Jeremiah 10:5) — and the workman who makes it is shamed — *Every man is brutish in his knowledge: every founder is confounded by the graven image: for his molten image is falsehood, and there is no breath in them.* (Jeremiah 10:14). Habakkuk mocks the same dumb thing — *Woe unto him that saith to the wood, Awake; to the dumb stone, Arise, it shall teach! Behold, it is laid over with gold and silver, and there is no breath at all in the midst of it.* (Habakkuk 2:19). Daniel''s three would not bow to Nebuchadnezzar''s golden image kept ''as a law'' by a king''s command — *we will not serve thy gods, nor worship the golden image which thou hast set up.* (Daniel 3:18).',
       sv.verse_id, ev.verse_id, 'extras', 58328
  FROM _session253_wis14_lookup sv, _session253_wis14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=14 AND sv.verse_number=15
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=14 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-of-solomon-14-artificer-allured-multitude-craftsman',
       E'The artificer''s skill — beauty that allures the multitude to a god',
       E'The idol''s power is aesthetic seduction: the craftsman''s skill makes the lie beautiful. *Also the singular diligence of the artificer did help to set forward the ignorant to more superstition.* (Wisdom of Solomon 14:18). *And so the multitude, allured by the grace of the work, took him now for a god, which a little before was but honoured.* (Wisdom of Solomon 14:20). Isaiah dissects the same workshop — the smith and carpenter labour over a block, burn half for warmth and bow to the rest — *The carpenter stretcheth out his rule; he marketh it out with a line; he fitteth it with planes, and he marketh it out with the compass, and maketh it after the figure of a man, according to the beauty of a man; that it may remain in the house.* (Isaiah 44:13) — *And the residue thereof he maketh a god, even his graven image: he falleth down unto it, and worshippeth it, and prayeth unto it, and saith, Deliver me; for thou art my god.* (Isaiah 44:17). In the New Testament the Ephesian silversmiths riot precisely because the craft of beautiful images is their livelihood — *Sirs, ye know that by this craft we have our wealth.* (Acts 19:25). The grace of the work, not the truth of God, allures the crowd.',
       sv.verse_id, ev.verse_id, 'extras', 58331
  FROM _session253_wis14_lookup sv, _session253_wis14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=14 AND sv.verse_number=18
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=14 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-of-solomon-14-romans-1-knowledge-of-god-reprobate-mind',
       E'Idolatry the headwaters — Romans 1 quotes this catalogue',
       E'Here Wisdom of Solomon supplies the very vice-list and verdict Paul fires into Romans 1. *Moreover this was not enough for them, that they erred in the knowledge of Yahuah (God); but whereas they lived in the great war of ignorance, those so great plagues called they peace.* (Wisdom of Solomon 14:22). The collapse follows the idol: *So that there reigned in all men without exception blood, manslaughter, theft, and dissimulation, corruption, unfaithfulness, tumults, perjury,* (Wisdom of Solomon 14:25) and *Disquieting of good men, forgetfulness of good turns, defiling of souls, changing of kind, disorder in marriages, adultery, and shameless uncleanness.* (Wisdom of Solomon 14:26). And the thesis: *For the worshipping of idols not to be named is the beginning, the cause, and the end, of all evil.* (Wisdom of Solomon 14:27). Paul echoes it almost line for line — God gives the idolaters over: *Wherefore God also gave them up to uncleanness through the lusts of their own hearts, to dishonour their own bodies between themselves:* (Romans 1:24) — *For this cause God gave them up unto vile affections* (Romans 1:26) — *And even as they did not like to retain God in their knowledge, God gave them over to a reprobate mind, to do those things which are not convenient;* (Romans 1:28) — *Being filled with all unrighteousness, fornication, wickedness, covetousness, maliciousness; full of envy, murder, debate, deceit, malignity; whisperers,* (Romans 1:29). Paul''s catalogue is Wisdom''s catalogue; idolatry is the headwaters of all evil. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 58334
  FROM _session253_wis14_lookup sv, _session253_wis14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=14 AND sv.verse_number=22
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=14 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-of-solomon-14-idols-no-life-false-swearing-vengeance',
       E'Idols that have no life — false oaths and the just vengeance',
       E'The chapter closes on the impotence of the idol and the certainty of judgment. *For insomuch as their trust is in idols, which have no life; though they swear falsely, yet they look not to be hurt.* (Wisdom of Solomon 14:29). Yet the verdict stands: *both because they thought not well of Yahuah (God), giving heed to idols, and also unjustly swore in deceit, despising holiness* (Wisdom of Solomon 14:30), *For it is not the power of them by whom they swear: but it is the just vengeance of sinners, that punishes always the offence of the ungodly.* (Wisdom of Solomon 14:31). The Psalmist already declared the idols lifeless and their makers like them — *They have mouths, but they speak not: eyes have they, but they see not; ... They that make them are like unto them; so is every one that trusteth in them.* (Psalm 115:5,8). The law forbade the false oath that despises holiness — *Thou shalt not take the name of the LORD thy God in vain; for the LORD will not hold him guiltless that taketh his name in vain.* (Exodus 20:7). And the ''just vengeance'' belongs to God alone — *To me belongeth vengeance, and recompence; their foot shall slide in due time:* (Deuteronomy 32:35), which Paul claims for the same Judge — *for it is written, Vengeance is mine; I will repay, saith the Lord.* (Romans 12:19).',
       sv.verse_id, ev.verse_id, 'extras', 58337
  FROM _session253_wis14_lookup sv, _session253_wis14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=14 AND sv.verse_number=29
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=14 AND ev.verse_number=31
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: wisdom-of-solomon-14-devising-of-idols-spiritual-fornication
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 20:4 — *Thou shalt not make unto thee any graven image, or any likeness of any thing that is in heaven above, or that is in the earth beneath, or that is in the water under the earth:* the second commandment is the law Solomon traces idolatry''s whole corruption back to in Wisdom of Solomon 14:12.'
  FROM cross_reference_threads t, cross_references x, _session253_wis14_lookup sv, _session253_wis14_lookup tv
 WHERE t.slug='wisdom-of-solomon-14-devising-of-idols-spiritual-fornication'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=14 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 23:37 — *That they have committed adultery, and blood is in their hands, and with their idols have they committed adultery, and have also caused their sons to pass through the fire, unto them to devour them.* Ezekiel names idolatry the very ''spiritual fornication'' Wisdom of Solomon 14:12 calls its beginning, joined as here to child-sacrifice.'
  FROM cross_reference_threads t, cross_references x, _session253_wis14_lookup sv, _session253_wis14_lookup tv
 WHERE t.slug='wisdom-of-solomon-14-devising-of-idols-spiritual-fornication'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=14 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=23 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 20:3 — *Thou shalt have no other gods before me.* The first word of the covenant is the standard against which Wisdom of Solomon 14:12 measures the devising of idols as fornication.'
  FROM cross_reference_threads t, cross_references x, _session253_wis14_lookup sv, _session253_wis14_lookup tv
 WHERE t.slug='wisdom-of-solomon-14-devising-of-idols-spiritual-fornication'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=14 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-of-solomon-14-origin-of-idols-dead-child-king
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 10:5 — *They are upright as the palm tree, but speak not: they must needs be borne, because they cannot go. Be not afraid of them; for they cannot do evil, neither also is it in them to do good.* The dead image honoured as a god in Wisdom of Solomon 14:15 is Jeremiah''s breathless idol that can neither speak nor walk.'
  FROM cross_reference_threads t, cross_references x, _session253_wis14_lookup sv, _session253_wis14_lookup tv
 WHERE t.slug='wisdom-of-solomon-14-origin-of-idols-dead-child-king'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=14 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=10 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 10:14 — *Every man is brutish in his knowledge: every founder is confounded by the graven image: for his molten image is falsehood, and there is no breath in them.* The artisan''s image worshipped by kings'' command in Wisdom of Solomon 14:16 is Jeremiah''s molten falsehood with no breath in it.'
  FROM cross_reference_threads t, cross_references x, _session253_wis14_lookup sv, _session253_wis14_lookup tv
 WHERE t.slug='wisdom-of-solomon-14-origin-of-idols-dead-child-king'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=14 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=10 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 3:18 — *But if not, be it known unto thee, O king, that we will not serve thy gods, nor worship the golden image which thou hast set up.* When ''graven images were worshipped by the commandments of kings'' (Wisdom of Solomon 14:16), Daniel''s three refuse the king''s golden image at the cost of the furnace.'
  FROM cross_reference_threads t, cross_references x, _session253_wis14_lookup sv, _session253_wis14_lookup tv
 WHERE t.slug='wisdom-of-solomon-14-origin-of-idols-dead-child-king'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=14 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=3 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Habakkuk 2:19 — *Woe unto him that saith to the wood, Awake; to the dumb stone, Arise, it shall teach! Behold, it is laid over with gold and silver, and there is no breath at all in the midst of it.* The flattering image of the absent king in Wisdom of Solomon 14:17 is Habakkuk''s gilded wood and stone with no breath at all.'
  FROM cross_reference_threads t, cross_references x, _session253_wis14_lookup sv, _session253_wis14_lookup tv
 WHERE t.slug='wisdom-of-solomon-14-origin-of-idols-dead-child-king'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=14 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='habakkuk' AND tv.chapter_number=2 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-of-solomon-14-artificer-allured-multitude-craftsman
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 44:13 — *The carpenter stretcheth out his rule; he marketh it out with a line; he fitteth it with planes, and he marketh it out with the compass, and maketh it after the figure of a man, according to the beauty of a man; that it may remain in the house.* Isaiah''s craftsman shaping a beautiful man-figure is the very ''singular diligence of the artificer'' that sets forward superstition in Wisdom of Solomon 14:18.'
  FROM cross_reference_threads t, cross_references x, _session253_wis14_lookup sv, _session253_wis14_lookup tv
 WHERE t.slug='wisdom-of-solomon-14-artificer-allured-multitude-craftsman'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=14 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 44:17 — *And the residue thereof he maketh a god, even his graven image: he falleth down unto it, and worshippeth it, and prayeth unto it, and saith, Deliver me; for thou art my god.* The multitude ''allured by the grace of the work'' who take the image for a god (Wisdom of Solomon 14:20) is Isaiah''s man bowing to the leftover block and calling it his god.'
  FROM cross_reference_threads t, cross_references x, _session253_wis14_lookup sv, _session253_wis14_lookup tv
 WHERE t.slug='wisdom-of-solomon-14-artificer-allured-multitude-craftsman'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=14 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 19:25 — *Whom he called together with the workmen of like occupation, and said, Sirs, ye know that by this craft we have our wealth.* Demetrius the silversmith rallies the craftsmen of beautiful images, the same artificer''s allure that makes the ignorant multitude idolaters in Wisdom of Solomon 14:20.'
  FROM cross_reference_threads t, cross_references x, _session253_wis14_lookup sv, _session253_wis14_lookup tv
 WHERE t.slug='wisdom-of-solomon-14-artificer-allured-multitude-craftsman'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=14 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=19 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-of-solomon-14-romans-1-knowledge-of-god-reprobate-mind
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Romans 1:28 — *And even as they did not like to retain God in their knowledge, God gave them over to a reprobate mind, to do those things which are not convenient;* Paul''s reprobate mind is exactly the company who ''erred in the knowledge of Yahuah (God)'' in Wisdom of Solomon 14:22 — Romans 1 is quoting this idolatry polemic.'
  FROM cross_reference_threads t, cross_references x, _session253_wis14_lookup sv, _session253_wis14_lookup tv
 WHERE t.slug='wisdom-of-solomon-14-romans-1-knowledge-of-god-reprobate-mind'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=14 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=1 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 1:29 — *Being filled with all unrighteousness, fornication, wickedness, covetousness, maliciousness; full of envy, murder, debate, deceit, malignity; whisperers,* Paul''s vice-list of murder, deceit and unrighteousness is the same ''blood, manslaughter, theft... perjury'' that reigns after idolatry in Wisdom of Solomon 14:25.'
  FROM cross_reference_threads t, cross_references x, _session253_wis14_lookup sv, _session253_wis14_lookup tv
 WHERE t.slug='wisdom-of-solomon-14-romans-1-knowledge-of-god-reprobate-mind'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=14 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=1 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 1:24 — *Wherefore God also gave them up to uncleanness through the lusts of their own hearts, to dishonour their own bodies between themselves:* The defiled lives and marriages of Wisdom of Solomon 14:24 are the uncleanness God gives idolaters up to in Romans 1:24.'
  FROM cross_reference_threads t, cross_references x, _session253_wis14_lookup sv, _session253_wis14_lookup tv
 WHERE t.slug='wisdom-of-solomon-14-romans-1-knowledge-of-god-reprobate-mind'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=14 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=1 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 1:26 — *For this cause God gave them up unto vile affections: for even their women did change the natural use into that which is against nature:* The ''changing of kind... disorder in marriages... shameless uncleanness'' of Wisdom of Solomon 14:26 is precisely the vile affections against nature in Romans 1:26.'
  FROM cross_reference_threads t, cross_references x, _session253_wis14_lookup sv, _session253_wis14_lookup tv
 WHERE t.slug='wisdom-of-solomon-14-romans-1-knowledge-of-god-reprobate-mind'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=14 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=1 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Wisdom of Solomon 13:1 — *Surely vain are all men by nature, who are ignorant of God, and could not out of the good things that are seen know him that is: neither by considering the works did they acknowledge the workmaster;* the thesis that idolatry is ''the beginning, the cause, and the end, of all evil'' (Wisdom of Solomon 14:27) completes the polemic begun in 13:1, the Creator unknown though seen — the very pairing Romans 1:20 and 1:25 draw on.'
  FROM cross_reference_threads t, cross_references x, _session253_wis14_lookup sv, _session253_wis14_lookup tv
 WHERE t.slug='wisdom-of-solomon-14-romans-1-knowledge-of-god-reprobate-mind'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=14 AND sv.verse_number=27
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=13 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-of-solomon-14-idols-no-life-false-swearing-vengeance
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalms 115:8 — *They that make them are like unto them; so is every one that trusteth in them.* The lifeless idols in which men trust in Wisdom of Solomon 14:29 are the Psalmist''s dumb images that make their trusters like themselves.'
  FROM cross_reference_threads t, cross_references x, _session253_wis14_lookup sv, _session253_wis14_lookup tv
 WHERE t.slug='wisdom-of-solomon-14-idols-no-life-false-swearing-vengeance'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=14 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=115 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 20:7 — *Thou shalt not take the name of the LORD thy God in vain; for the LORD will not hold him guiltless that taketh his name in vain.* The false swearing ''in deceit, despising holiness'' punished in Wisdom of Solomon 14:30 breaks the third commandment, which will not hold the swearer guiltless.'
  FROM cross_reference_threads t, cross_references x, _session253_wis14_lookup sv, _session253_wis14_lookup tv
 WHERE t.slug='wisdom-of-solomon-14-idols-no-life-false-swearing-vengeance'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=14 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 32:35 — *To me belongeth vengeance, and recompence; their foot shall slide in due time: for the day of their calamity is at hand, and the things that shall come upon them make haste.* The ''just vengeance of sinners'' that always punishes the ungodly in Wisdom of Solomon 14:31 is the vengeance God reserves to Himself in the Song of Moses.'
  FROM cross_reference_threads t, cross_references x, _session253_wis14_lookup sv, _session253_wis14_lookup tv
 WHERE t.slug='wisdom-of-solomon-14-idols-no-life-false-swearing-vengeance'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=14 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 12:19 — *Dearly beloved, avenge not yourselves, but rather give place unto wrath: for it is written, Vengeance is mine; I will repay, saith the Lord.* Paul claims the same ''just vengeance'' that Wisdom of Solomon 14:31 assigns to God against the ungodly, forbidding the believer to take it up himself.'
  FROM cross_reference_threads t, cross_references x, _session253_wis14_lookup sv, _session253_wis14_lookup tv
 WHERE t.slug='wisdom-of-solomon-14-idols-no-life-false-swearing-vengeance'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=14 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=12 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_thewisdomofsolomon_15.sql (session253 the-wisdom-of-solomon 15) -----
-- Source anchor: apocrypha/the-wisdom-of-solomon ch15. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: wis15 (view _session253_wis15_lookup). Sort band base 58350, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_wis15_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: wisdom-of-solomon-15-to-know-thee-is-immortality
  ('apocrypha', 'the-wisdom-of-solomon', 15, 3, 'canon', 'john', 17, 3, 'free', E'John 17:3 — *And this is life eternal, that they might know thee the only true Elohim (God), and Yahusha HaMashiach (Jesus Christ), whom thou hast sent.* Wisdom 15:3 names knowing the living Elohim ''the root of immortality''; Yahusha names that same knowing as life eternal itself.'),
  ('apocrypha', 'the-wisdom-of-solomon', 15, 2, 'canon', 'jeremiah', 18, 6, 'free', E'Jeremiah 18:6 — *O house of Yashar''el (Israel), cannot I do with you as this potter? saith Yahuah (LORD). Behold, as the clay is in the potter''s hand, so are ye in mine hand, O house of Yashar''el (Israel).* Wisdom 15:2''s ''if we sin, we are yours, knowing your power'' rests on the same potter-claim — Israel is clay held in the Maker''s own hand.'),
  -- thread: wisdom-of-solomon-15-potter-makes-a-god-of-clay
  ('apocrypha', 'the-wisdom-of-solomon', 15, 7, 'canon', 'romans', 9, 21, 'free', E'Romans 9:21 — *Hath not the potter power over the clay, of the same lump to make one vessel unto honour, and another unto dishonour?* Wisdom 15:7''s one clay shaped into clean and contrary vessels is exactly Paul''s lump made into honour and dishonour — the Potter''s sovereign right.'),
  ('apocrypha', 'the-wisdom-of-solomon', 15, 7, 'canon', 'isaiah', 45, 9, 'free', E'Isaiah 45:9 — *Woe unto him that striveth with his Maker! Let the potsherd strive with the potsherds of the earth. Shall the clay say to him that fashioneth it, What makest thou? or thy work, He hath no hands?* The clay declaring itself god in Wisdom 15:8 is the very woe Isaiah pronounces on the potsherd that contends with its Maker.'),
  ('apocrypha', 'the-wisdom-of-solomon', 15, 8, 'canon', 'genesis', 2, 7, 'free', E'Genesis 2:7 — *And Yahuah Elohim (the LORD God) formed man of the dust of the ground, and breathed into his nostrils the breath of life; and man became a living soul.* Wisdom 15:8''s man ''made of earth himself'' who ''returns to the same'' is the Adam of the dust — the creature presuming to fashion a creator.'),
  -- thread: wisdom-of-solomon-15-idol-no-breath-no-sight
  ('apocrypha', 'the-wisdom-of-solomon', 15, 15, 'canon', 'psalms', 115, 7, 'free', E'Psalm 115:7 — *They have hands, but they handle not: feet have they, but they walk not: neither speak they through their throat.* Wisdom 15:15''s idol with fingers that cannot handle and feet ''slow to go'' is the Psalmist''s catalogue of the silver-and-gold idol that cannot move.'),
  ('apocrypha', 'the-wisdom-of-solomon', 15, 16, 'canon', 'psalms', 115, 8, 'free', E'Psalm 115:8 — *They that make them are like unto them; so is every one that trusteth in them.* Wisdom 15:16''s ''no man can make a god like to himself'' is the obverse of the Psalm''s verdict — the maker sinks to the deadness of the thing he made.'),
  ('apocrypha', 'the-wisdom-of-solomon', 15, 5, 'canon', 'habakkuk', 2, 18, 'free', E'Habakkuk 2:18 — *What profiteth the graven image that the maker thereof hath graven it; the molten image, and a teacher of lies, that the maker of his work trusteth therein, to make dumb idols?* Wisdom 15:5''s ''dead image, that has no breath'' is Habakkuk''s dumb idol — a teacher of lies that profits nothing.'),
  -- thread: wisdom-of-solomon-15-romans-1-idolatry-headwaters
  ('apocrypha', 'the-wisdom-of-solomon', 15, 11, 'canon', 'romans', 1, 20, 'free', E'Romans 1:20 — *For the invisible things of him from the creation of the world are clearly seen, being understood by the things that are made, even his eternal power and Godhead; so that they are without excuse.* Wisdom 15:11''s idolater who ''knew not his Maker'' is the very man Paul leaves without excuse for not knowing the Creator the creation declares.'),
  ('apocrypha', 'the-wisdom-of-solomon', 15, 18, 'canon', 'romans', 1, 23, 'free', E'Romans 1:23 — *And changed the glory of the uncorruptible Elohim (God) into an image made like to corruptible man, and to birds, and fourfooted beasts, and creeping things.* Wisdom 15:18''s worship of ''those beasts also that are most hateful'' is Paul''s exchange of the Creator''s glory for the image of beasts.'),
  ('apocrypha', 'the-wisdom-of-solomon', 15, 17, 'canon', 'romans', 1, 25, 'free', E'Romans 1:25 — *Who changed the truth of Elohim (God) into a lie, and worshipped and served the creature more than the Creator, who is blessed for ever. Amen.* Wisdom 15:17''s mortal who ''is better than the things which he worshippeth'' yet worships them is Paul''s man serving the creature above the Creator.'),
  ('apocrypha', 'the-wisdom-of-solomon', 15, 13, 'apocrypha', 'the-wisdom-of-solomon', 14, 8, 'extras', E'Wisdom of Solomon 14:8 — *But that which is made with hands is cursed, as well it, as he that made it: he, because he made it; and it, because, being corruptible, it was called god.* Wisdom 15:13''s craftsman who ''knoweth himself to offend above all others'' is the same self-condemned maker the book has just cursed in chapter 14.'),
  -- thread: wisdom-of-solomon-15-his-heart-is-ashes
  ('apocrypha', 'the-wisdom-of-solomon', 15, 10, 'canon', 'isaiah', 44, 19, 'free', E'Isaiah 44:19 — *And none considereth in his heart, neither is there knowledge nor understanding to say, I have burned part of it in the fire... and shall I make the residue thereof an abomination? shall I fall down to the stock of a tree?* Wisdom 15:10''s idolater whose ''heart is ashes'' is Isaiah''s man feeding on ashes, unable to consider the folly of bowing to a block of wood.'),
  ('apocrypha', 'the-wisdom-of-solomon', 15, 15, 'canon', 'deuteronomy', 4, 28, 'free', E'Deuteronomy 4:28 — *And there ye shall serve gods, the work of men''s hands, wood and stone, which neither see, nor hear, nor eat, nor smell.* Wisdom 15:15''s idols that cannot see, breathe, or hear are Moses'' wood-and-stone gods that ''neither see, nor hear, nor eat, nor smell'' — the curse of forgetting the living Elohim.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_wis15_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_wis15_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-of-solomon-15-to-know-thee-is-immortality',
       E'To know thee is the root of immortality',
       E'The idolatry-polemic closes where Israel begins: *But you, O Yahuah (God), art gracious and true, longsuffering, and in mercy ordering all things* (Wisdom of Solomon 15:1). Over against the dead idol stands the living covenant Elohim — *For to know you is perfect righteousness: yes, to know your power is the root of immortality* (Wisdom of Solomon 15:3). This is no abstract monotheism; it is the eternal life Yahusha names: *And this is life eternal, that they might know thee the only true Elohim (God), and Yahusha HaMashiach (Jesus Christ), whom thou hast sent* (John 17:3). And the assurance that we are his even in our sin echoes the prophet''s potter-word — *O house of Yashar''el (Israel), cannot I do with you as this potter? saith Yahuah (LORD). Behold, as the clay is in the potter''s hand, so are ye in mine hand, O house of Yashar''el (Israel)* (Jeremiah 18:6). It ain''t new: to know the living Elohim is righteousness and life; the idol can give neither.',
       sv.verse_id, ev.verse_id, 'extras', 58350
  FROM _session253_wis15_lookup sv, _session253_wis15_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=15 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=15 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-of-solomon-15-potter-makes-a-god-of-clay',
       E'The potter who fashions a god of the same clay',
       E'The book''s sharpest mockery: the same craftsman who *of the same clay he makes both the vessels that serve for clean uses, and likewise also all such as serve to the contrary* turns and *makes a vain god of the same clay, even he which a little before was made of earth himself, and within a little while after returns to the same* (Wisdom of Solomon 15:7-8). Isaiah had already cried the woe — *Shall the clay say to him that fashioneth it, What makest thou?* (Isaiah 45:9) — and Jeremiah set Israel as clay in Yahuah''s hand. Paul gathers the whole figure into the gospel: *Hath not the potter power over the clay, of the same lump to make one vessel unto honour, and another unto dishonour?* (Romans 9:21). The folly is exposed by inversion — the clay-man crowns a clay-thing as Maker. It ain''t new: the Potter is Elohim; the pot is never god.',
       sv.verse_id, ev.verse_id, 'extras', 58353
  FROM _session253_wis15_lookup sv, _session253_wis15_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=15 AND sv.verse_number=7
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=15 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-of-solomon-15-idol-no-breath-no-sight',
       E'The idol has no breath, no sight, no step',
       E'The dead image is catalogued limb by limb: men *desire the form of a dead image, that has no breath* (Wisdom of Solomon 15:5), and the heathen gods *neither have the use of eyes to see, nor noses to draw breath, nor ears to hear, nor fingers of hands to handle; and as for their feet, they are slow to go* (Wisdom of Solomon 15:15). This is the Psalmist''s taunt almost word for word — *They have mouths, but they speak not: eyes have they, but they see not... feet have they, but they walk not* — and his verdict falls on the maker: *They that make them are like unto them; so is every one that trusteth in them* (Psalm 115:8). Habakkuk seals it: *What profiteth the graven image that the maker thereof hath graven it... to make dumb idols?* (Habakkuk 2:18). It ain''t new: a god that cannot breathe is no god, and its maker shares its deadness.',
       sv.verse_id, ev.verse_id, 'extras', 58356
  FROM _session253_wis15_lookup sv, _session253_wis15_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=15 AND sv.verse_number=5
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=15 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-of-solomon-15-romans-1-idolatry-headwaters',
       E'The idolatry that Romans 1 indicts',
       E'Wisdom 15 sits inside the very polemic Paul quarries for Romans 1. The idol-maker *knew not his Maker, and him that inspired into him an active soul, and breathed in a living spirit* (Wisdom of Solomon 15:11) — the creature who, though the Creator gave him breath, will not know him. Paul: *For the invisible things of him from the creation of the world are clearly seen, being understood by the things that are made... so that they are without excuse* (Romans 1:20). And where Wisdom 15:18 has them worshipping the beasts, *those beasts also that are most hateful*, Paul names the same descent — they *changed the glory of the uncorruptible Elohim (God) into an image made like to corruptible man, and to birds, and fourfooted beasts, and creeping things* (Romans 1:23). The self-link runs back through the same book: *that which is made with hands is cursed, as well it, as he that made it* (Wisdom of Solomon 14:8). It ain''t new: Romans 1 is reading Wisdom — the Creator known, refused, and exchanged for the creature.',
       sv.verse_id, ev.verse_id, 'extras', 58359
  FROM _session253_wis15_lookup sv, _session253_wis15_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=15 AND sv.verse_number=11
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=15 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-of-solomon-15-his-heart-is-ashes',
       E'His heart is ashes, his hope more vile than earth',
       E'The maker''s portrait ends in dust: *His heart is ashes, his hope is more vile than earth, and his life of less value than clay* (Wisdom of Solomon 15:10). Isaiah had drawn the same man feeding on ashes — *he hath shut their eyes, that they cannot see; and their hearts, that they cannot understand... shall I fall down to the stock of a tree?* (Isaiah 44:18-19). The covenant warned this would be Israel''s lot in exile if she forgot — *And there ye shall serve gods, the work of men''s hands, wood and stone, which neither see, nor hear, nor eat, nor smell* (Deuteronomy 4:28) — and the closing word of the chapter is that the idolaters *went without the praise of Yahuah (God) and his blessing* (Wisdom of Solomon 15:19). It ain''t new: the heart that cleaves to ashes inherits ashes; only the living Elohim gives blessing.',
       sv.verse_id, ev.verse_id, 'extras', 58362
  FROM _session253_wis15_lookup sv, _session253_wis15_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=15 AND sv.verse_number=10
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=15 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: wisdom-of-solomon-15-to-know-thee-is-immortality
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 17:3 — *And this is life eternal, that they might know thee the only true Elohim (God), and Yahusha HaMashiach (Jesus Christ), whom thou hast sent.* Wisdom 15:3 names knowing the living Elohim ''the root of immortality''; Yahusha names that same knowing as life eternal itself.'
  FROM cross_reference_threads t, cross_references x, _session253_wis15_lookup sv, _session253_wis15_lookup tv
 WHERE t.slug='wisdom-of-solomon-15-to-know-thee-is-immortality'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=15 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=17 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 18:6 — *O house of Yashar''el (Israel), cannot I do with you as this potter? saith Yahuah (LORD). Behold, as the clay is in the potter''s hand, so are ye in mine hand, O house of Yashar''el (Israel).* Wisdom 15:2''s ''if we sin, we are yours, knowing your power'' rests on the same potter-claim — Israel is clay held in the Maker''s own hand.'
  FROM cross_reference_threads t, cross_references x, _session253_wis15_lookup sv, _session253_wis15_lookup tv
 WHERE t.slug='wisdom-of-solomon-15-to-know-thee-is-immortality'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=15 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=18 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-of-solomon-15-potter-makes-a-god-of-clay
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Romans 9:21 — *Hath not the potter power over the clay, of the same lump to make one vessel unto honour, and another unto dishonour?* Wisdom 15:7''s one clay shaped into clean and contrary vessels is exactly Paul''s lump made into honour and dishonour — the Potter''s sovereign right.'
  FROM cross_reference_threads t, cross_references x, _session253_wis15_lookup sv, _session253_wis15_lookup tv
 WHERE t.slug='wisdom-of-solomon-15-potter-makes-a-god-of-clay'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=15 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=9 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 45:9 — *Woe unto him that striveth with his Maker! Let the potsherd strive with the potsherds of the earth. Shall the clay say to him that fashioneth it, What makest thou? or thy work, He hath no hands?* The clay declaring itself god in Wisdom 15:8 is the very woe Isaiah pronounces on the potsherd that contends with its Maker.'
  FROM cross_reference_threads t, cross_references x, _session253_wis15_lookup sv, _session253_wis15_lookup tv
 WHERE t.slug='wisdom-of-solomon-15-potter-makes-a-god-of-clay'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=15 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=45 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 2:7 — *And Yahuah Elohim (the LORD God) formed man of the dust of the ground, and breathed into his nostrils the breath of life; and man became a living soul.* Wisdom 15:8''s man ''made of earth himself'' who ''returns to the same'' is the Adam of the dust — the creature presuming to fashion a creator.'
  FROM cross_reference_threads t, cross_references x, _session253_wis15_lookup sv, _session253_wis15_lookup tv
 WHERE t.slug='wisdom-of-solomon-15-potter-makes-a-god-of-clay'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=15 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-of-solomon-15-idol-no-breath-no-sight
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 115:7 — *They have hands, but they handle not: feet have they, but they walk not: neither speak they through their throat.* Wisdom 15:15''s idol with fingers that cannot handle and feet ''slow to go'' is the Psalmist''s catalogue of the silver-and-gold idol that cannot move.'
  FROM cross_reference_threads t, cross_references x, _session253_wis15_lookup sv, _session253_wis15_lookup tv
 WHERE t.slug='wisdom-of-solomon-15-idol-no-breath-no-sight'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=15 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=115 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 115:8 — *They that make them are like unto them; so is every one that trusteth in them.* Wisdom 15:16''s ''no man can make a god like to himself'' is the obverse of the Psalm''s verdict — the maker sinks to the deadness of the thing he made.'
  FROM cross_reference_threads t, cross_references x, _session253_wis15_lookup sv, _session253_wis15_lookup tv
 WHERE t.slug='wisdom-of-solomon-15-idol-no-breath-no-sight'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=15 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=115 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Habakkuk 2:18 — *What profiteth the graven image that the maker thereof hath graven it; the molten image, and a teacher of lies, that the maker of his work trusteth therein, to make dumb idols?* Wisdom 15:5''s ''dead image, that has no breath'' is Habakkuk''s dumb idol — a teacher of lies that profits nothing.'
  FROM cross_reference_threads t, cross_references x, _session253_wis15_lookup sv, _session253_wis15_lookup tv
 WHERE t.slug='wisdom-of-solomon-15-idol-no-breath-no-sight'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=15 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='habakkuk' AND tv.chapter_number=2 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-of-solomon-15-romans-1-idolatry-headwaters
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Romans 1:20 — *For the invisible things of him from the creation of the world are clearly seen, being understood by the things that are made, even his eternal power and Godhead; so that they are without excuse.* Wisdom 15:11''s idolater who ''knew not his Maker'' is the very man Paul leaves without excuse for not knowing the Creator the creation declares.'
  FROM cross_reference_threads t, cross_references x, _session253_wis15_lookup sv, _session253_wis15_lookup tv
 WHERE t.slug='wisdom-of-solomon-15-romans-1-idolatry-headwaters'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=15 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=1 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 1:23 — *And changed the glory of the uncorruptible Elohim (God) into an image made like to corruptible man, and to birds, and fourfooted beasts, and creeping things.* Wisdom 15:18''s worship of ''those beasts also that are most hateful'' is Paul''s exchange of the Creator''s glory for the image of beasts.'
  FROM cross_reference_threads t, cross_references x, _session253_wis15_lookup sv, _session253_wis15_lookup tv
 WHERE t.slug='wisdom-of-solomon-15-romans-1-idolatry-headwaters'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=15 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=1 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 1:25 — *Who changed the truth of Elohim (God) into a lie, and worshipped and served the creature more than the Creator, who is blessed for ever. Amen.* Wisdom 15:17''s mortal who ''is better than the things which he worshippeth'' yet worships them is Paul''s man serving the creature above the Creator.'
  FROM cross_reference_threads t, cross_references x, _session253_wis15_lookup sv, _session253_wis15_lookup tv
 WHERE t.slug='wisdom-of-solomon-15-romans-1-idolatry-headwaters'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=15 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=1 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Wisdom of Solomon 14:8 — *But that which is made with hands is cursed, as well it, as he that made it: he, because he made it; and it, because, being corruptible, it was called god.* Wisdom 15:13''s craftsman who ''knoweth himself to offend above all others'' is the same self-condemned maker the book has just cursed in chapter 14.'
  FROM cross_reference_threads t, cross_references x, _session253_wis15_lookup sv, _session253_wis15_lookup tv
 WHERE t.slug='wisdom-of-solomon-15-romans-1-idolatry-headwaters'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=15 AND sv.verse_number=13
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=14 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-of-solomon-15-his-heart-is-ashes
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 44:19 — *And none considereth in his heart, neither is there knowledge nor understanding to say, I have burned part of it in the fire... and shall I make the residue thereof an abomination? shall I fall down to the stock of a tree?* Wisdom 15:10''s idolater whose ''heart is ashes'' is Isaiah''s man feeding on ashes, unable to consider the folly of bowing to a block of wood.'
  FROM cross_reference_threads t, cross_references x, _session253_wis15_lookup sv, _session253_wis15_lookup tv
 WHERE t.slug='wisdom-of-solomon-15-his-heart-is-ashes'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=15 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 4:28 — *And there ye shall serve gods, the work of men''s hands, wood and stone, which neither see, nor hear, nor eat, nor smell.* Wisdom 15:15''s idols that cannot see, breathe, or hear are Moses'' wood-and-stone gods that ''neither see, nor hear, nor eat, nor smell'' — the curse of forgetting the living Elohim.'
  FROM cross_reference_threads t, cross_references x, _session253_wis15_lookup sv, _session253_wis15_lookup tv
 WHERE t.slug='wisdom-of-solomon-15-his-heart-is-ashes'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=15 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=4 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_thewisdomofsolomon_16.sql (session253 the-wisdom-of-solomon 16) -----
-- Source anchor: apocrypha/the-wisdom-of-solomon ch16. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: wis16 (view _session253_wis16_lookup). Sort band base 58375, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_wis16_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: wisdom-16-brazen-serpent-healing-look
  ('apocrypha', 'the-wisdom-of-solomon', 16, 6, 'canon', 'numbers', 21, 8, 'free', E'Numbers 21:8 — *And the LORD said unto Moses, Make thee a fiery serpent, and set it upon a pole: and it shall come to pass, that every one that is bitten, when he looketh upon it, shall live.* This is the very ''sign of salvation'' Wisdom of Solomon 16:6 says was set up to put Yashar''el in remembrance of the commandment of the law.'),
  ('apocrypha', 'the-wisdom-of-solomon', 16, 7, 'canon', 'numbers', 21, 9, 'free', E'Numbers 21:9 — *And Moses made a serpent of brass, and put it upon a pole, and it came to pass, that if a serpent had bitten any man, when he beheld the serpent of brass, he lived.* Wisdom of Solomon 16:7 reads this scene precisely: the beholder ''was not saved by the thing that he saw, but by thee, that art the Saviour of all.'''),
  ('apocrypha', 'the-wisdom-of-solomon', 16, 7, 'canon', 'john', 3, 14, 'free', E'John 3:14 — *And as Moses lifted up the serpent in the wilderness, even so must the Son of man be lifted up.* Yahusha names the type Wisdom of Solomon 16:7 already saw — the look toward the lifted-up One, not the bronze, is what saves.'),
  ('apocrypha', 'the-wisdom-of-solomon', 16, 7, 'canon', 'john', 3, 15, 'free', E'John 3:15 — *That whosoever believeth in him should not perish, but have eternal life.* The believing look of Wisdom of Solomon 16:7 — saved ''by thee, that art the Saviour of all'' — finds its fullness in the lifted-up Messiah.'),
  -- thread: wisdom-16-word-that-healeth-all-things
  ('apocrypha', 'the-wisdom-of-solomon', 16, 12, 'canon', 'psalms', 107, 20, 'free', E'Psalm 107:20 — *He sent his word, and healed them, and delivered them from their destructions.* This is the same confession as Wisdom of Solomon 16:12 — not herb nor plaister but the sent word of Yahuah heals all things.'),
  ('apocrypha', 'the-wisdom-of-solomon', 16, 13, 'canon', 'deuteronomy', 32, 39, 'free', E'Deuteronomy 32:39 — *See now that I, even I, am he, and there is no god with me: I kill, and I make alive; I wound, and I heal: neither is there any that can deliver out of my hand.* The song of Moses says exactly what Wisdom of Solomon 16:13 says — power of life and death, none escaping His hand (Wisdom 16:15).'),
  ('apocrypha', 'the-wisdom-of-solomon', 16, 13, 'canon', '1-samuel', 2, 6, 'free', E'1 Samuel 2:6 — *The LORD killeth, and maketh alive: he bringeth down to the grave, and bringeth up.* Hannah''s song is Wisdom of Solomon 16:13 word for word: He ''leadest to the gates of hell, and bringest up again.'''),
  -- thread: wisdom-16-angels-food-bread-from-heaven
  ('apocrypha', 'the-wisdom-of-solomon', 16, 20, 'canon', 'exodus', 16, 4, 'free', E'Exodus 16:4 — *Then said the LORD unto Moses, Behold, I will rain bread from heaven for you; and the people shall go out and gather a certain rate every day, that I may prove them, whether they will walk in my law, or no.* This is the manna Wisdom of Solomon 16:20 calls ''bread prepared without their labour'' sent from heaven.'),
  ('apocrypha', 'the-wisdom-of-solomon', 16, 20, 'canon', 'psalms', 78, 25, 'free', E'Psalm 78:25 — *Man did eat angels'' food: he sent them meat to the full.* The Psalm and Wisdom of Solomon 16:20 use the same phrase — ''angels'' food'' — for the manna that filled every taste.'),
  ('apocrypha', 'the-wisdom-of-solomon', 16, 21, 'canon', 'john', 6, 32, 'free', E'John 6:32 — *Then Jesus said unto them, Verily, verily, I say unto you, Moses gave you not that bread from heaven; but my Father giveth you the true bread from heaven.* The manna ''tempered itself to every man''s liking'' (Wisdom of Solomon 16:21) was the shadow; Yahusha is the true bread from heaven.'),
  ('apocrypha', 'the-wisdom-of-solomon', 16, 21, 'canon', 'john', 6, 33, 'free', E'John 6:33 — *For the bread of God is he which cometh down from heaven, and giveth life unto the world.* The sweetness of the heavenly sustenance in Wisdom of Solomon 16:21 finds its substance in the Bread that gives life to the world.'),
  -- thread: wisdom-16-man-lives-by-the-word
  ('apocrypha', 'the-wisdom-of-solomon', 16, 26, 'canon', 'deuteronomy', 8, 3, 'free', E'Deuteronomy 8:3 — *And he humbled thee, and suffered thee to hunger, and fed thee with manna, which thou knewest not, neither did thy fathers know; that he might make thee know that man doth not live by bread only, but by every word that proceedeth out of the mouth of the LORD doth man live.* Wisdom of Solomon 16:26 distils this Torah lesson: not fruits but His word nourisheth and preserveth.'),
  ('apocrypha', 'the-wisdom-of-solomon', 16, 26, 'canon', 'matthew', 4, 4, 'free', E'Matthew 4:4 — *But he answered and said, It is written, Man shall not live by bread alone, but by every word that proceedeth out of the mouth of God.* Yahusha wields the truth Wisdom of Solomon 16:26 confesses — the word, not the growing of fruits, sustains the children of Yahuah.'),
  -- thread: wisdom-16-quails-and-the-stinging-serpents
  ('apocrypha', 'the-wisdom-of-solomon', 16, 2, 'canon', 'numbers', 11, 31, 'free', E'Numbers 11:31 — *And there went forth a wind from the LORD, and brought quails from the sea, and let them fall by the camp, as it were a day''s journey on this side, and as it were a day''s journey on the other side, round about the camp, and as it were two cubits high upon the face of the earth.* These are the ''quails to stir up their appetite'' of Wisdom of Solomon 16:2.'),
  ('apocrypha', 'the-wisdom-of-solomon', 16, 10, 'canon', 'numbers', 21, 6, 'free', E'Numbers 21:6 — *And the LORD sent fiery serpents among the people, and they bit the people; and much people of Israel died.* These are the ''venomous dragons'' Wisdom of Solomon 16:10 says could not overcome Yahuah''s sons, for His mercy healed them.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_wis16_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_wis16_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-16-brazen-serpent-healing-look',
       E'The sign of salvation — the look that healed',
       E'When the serpents stung Yashar''el in the wilderness, the cure was not the bronze on the pole but the One it pointed to: *But they were troubled for a small season, that they might be admonished, having a sign of salvation, to put them in remembrance of the commandment of thy law* (Wisdom of Solomon 16:6), *For he that turned himself toward it was not saved by the thing that he saw, but by thee, that art the Saviour of all* (Wisdom of Solomon 16:7). Wisdom reads Moses'' serpent exactly as the Tanakh sets it — *And the LORD said unto Moses, Make thee a fiery serpent, and set it upon a pole: and it shall come to pass, that every one that is bitten, when he looketh upon it, shall live* (Numbers 21:8) — and Yahusha makes the type explicit: *And as Moses lifted up the serpent in the wilderness, even so must the Son of man be lifted up* (John 3:14). The look of faith toward the lifted-up One is the sign of salvation; it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 58375
  FROM _session253_wis16_lookup sv, _session253_wis16_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=16 AND sv.verse_number=6
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=16 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-16-word-that-healeth-all-things',
       E'Not herb nor plaister, but thy word',
       E'Wisdom presses past the means to the Healer Himself: *For it was neither herb, nor mollifying plaister, that restored them to health: but thy word, O Yahuah (God), which healeth all things* (Wisdom of Solomon 16:12). This is the Psalmist''s confession — *He sent his word, and healed them, and delivered them from their destructions* (Psalm 107:20) — the spoken word of the Maker as the true medicine. And the next breath of Wisdom presses to the deepest power: *For thou hast power of life and death: thou leadest to the gates of hell, and bringest up again* (Wisdom of Solomon 16:13), echoing the song of Moses — *I kill, and I make alive; I wound, and I heal: neither is there any that can deliver out of my hand* (Deuteronomy 32:39) — and Hannah''s — *The LORD killeth, and maketh alive: he bringeth down to the grave, and bringeth up* (1 Samuel 2:6). The Word that heals and raises is the same Word made flesh.',
       sv.verse_id, ev.verse_id, 'extras', 58378
  FROM _session253_wis16_lookup sv, _session253_wis16_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=16 AND sv.verse_number=12
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=16 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-16-angels-food-bread-from-heaven',
       E'Angels'' food — the bread from heaven',
       E'Against Egypt''s plagued harvest, Yahuah fed His people the bread of heaven: *Instead of which thou feddest thine own people with angels'' food, and didst send them from heaven bread prepared without their labour, able to content every man''s delight, and agreeing to every taste* (Wisdom of Solomon 16:20); *For thy sustenance declared thy sweetness unto thy children, and serving to the appetite of the eater, tempered itself to every man''s liking* (Wisdom of Solomon 16:21). This is the manna of Exodus — *Then said the LORD unto Moses, Behold, I will rain bread from heaven for you* (Exodus 16:4) — sung in the Psalms as *the corn of heaven* and *angels'' food* — *And had rained down manna upon them to eat, and had given them of the corn of heaven. Man did eat angels'' food: he sent them meat to the full* (Psalm 78:24-25). Yahusha gathers the whole figure: *Moses gave you not that bread from heaven; but my Father giveth you the true bread from heaven* (John 6:32). The manna was a shadow; the Bread of Life is the substance.',
       sv.verse_id, ev.verse_id, 'extras', 58381
  FROM _session253_wis16_lookup sv, _session253_wis16_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=16 AND sv.verse_number=20
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=16 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-16-man-lives-by-the-word',
       E'Not fruits but thy word nourisheth man',
       E'Wisdom draws the manna to its lesson: *That thy children, O Yahuah (God), whom thou lovest, might know, that it is not the growing of fruits that nourisheth man: but that it is thy word, which preserveth them that put their trust in thee* (Wisdom of Solomon 16:26). This is Moses'' own teaching from the manna — *And he humbled thee, and suffered thee to hunger, and fed thee with manna... that he might make thee know that man doth not live by bread only, but by every word that proceedeth out of the mouth of the LORD doth man live* (Deuteronomy 8:3) — and it is the sword Yahusha drew in the wilderness against the tempter: *But he answered and said, It is written, Man shall not live by bread alone, but by every word that proceedeth out of the mouth of God* (Matthew 4:4). The bread feeds the body for a day; the word of Yahuah preserves the trusting forever.',
       sv.verse_id, ev.verse_id, 'extras', 58384
  FROM _session253_wis16_lookup sv, _session253_wis16_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=16 AND sv.verse_number=26
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=16 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-16-quails-and-the-stinging-serpents',
       E'Quails to the appetite, serpents to the sting',
       E'Wisdom contrasts the two wilderness tables: mercy gave Yashar''el quails, while the venomous creatures that stung them were turned to a discipline, not a death — *Instead of which punishment, dealing graciously with thine own people, thou preparedst for them meat of a strange taste, even quails to stir up their appetite* (Wisdom of Solomon 16:2); *But thy sons not the very teeth of venomous dragons overcame: for thy mercy was ever by them, and healed them* (Wisdom of Solomon 16:10). The quails are from Numbers — *And there went forth a wind from the LORD, and brought quails from the sea, and let them fall by the camp* (Numbers 11:31) — and the serpents from the same wandering — *And the LORD sent fiery serpents among the people, and they bit the people; and much people of Israel died* (Numbers 21:6). The same wilderness held both the gift and the rod; mercy ran through the judgment.',
       sv.verse_id, ev.verse_id, 'extras', 58387
  FROM _session253_wis16_lookup sv, _session253_wis16_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=16 AND sv.verse_number=2
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=16 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: wisdom-16-brazen-serpent-healing-look
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 21:8 — *And the LORD said unto Moses, Make thee a fiery serpent, and set it upon a pole: and it shall come to pass, that every one that is bitten, when he looketh upon it, shall live.* This is the very ''sign of salvation'' Wisdom of Solomon 16:6 says was set up to put Yashar''el in remembrance of the commandment of the law.'
  FROM cross_reference_threads t, cross_references x, _session253_wis16_lookup sv, _session253_wis16_lookup tv
 WHERE t.slug='wisdom-16-brazen-serpent-healing-look'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=16 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=21 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 21:9 — *And Moses made a serpent of brass, and put it upon a pole, and it came to pass, that if a serpent had bitten any man, when he beheld the serpent of brass, he lived.* Wisdom of Solomon 16:7 reads this scene precisely: the beholder ''was not saved by the thing that he saw, but by thee, that art the Saviour of all.'''
  FROM cross_reference_threads t, cross_references x, _session253_wis16_lookup sv, _session253_wis16_lookup tv
 WHERE t.slug='wisdom-16-brazen-serpent-healing-look'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=16 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=21 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 3:14 — *And as Moses lifted up the serpent in the wilderness, even so must the Son of man be lifted up.* Yahusha names the type Wisdom of Solomon 16:7 already saw — the look toward the lifted-up One, not the bronze, is what saves.'
  FROM cross_reference_threads t, cross_references x, _session253_wis16_lookup sv, _session253_wis16_lookup tv
 WHERE t.slug='wisdom-16-brazen-serpent-healing-look'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=16 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=3 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'John 3:15 — *That whosoever believeth in him should not perish, but have eternal life.* The believing look of Wisdom of Solomon 16:7 — saved ''by thee, that art the Saviour of all'' — finds its fullness in the lifted-up Messiah.'
  FROM cross_reference_threads t, cross_references x, _session253_wis16_lookup sv, _session253_wis16_lookup tv
 WHERE t.slug='wisdom-16-brazen-serpent-healing-look'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=16 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-16-word-that-healeth-all-things
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 107:20 — *He sent his word, and healed them, and delivered them from their destructions.* This is the same confession as Wisdom of Solomon 16:12 — not herb nor plaister but the sent word of Yahuah heals all things.'
  FROM cross_reference_threads t, cross_references x, _session253_wis16_lookup sv, _session253_wis16_lookup tv
 WHERE t.slug='wisdom-16-word-that-healeth-all-things'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=16 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=107 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 32:39 — *See now that I, even I, am he, and there is no god with me: I kill, and I make alive; I wound, and I heal: neither is there any that can deliver out of my hand.* The song of Moses says exactly what Wisdom of Solomon 16:13 says — power of life and death, none escaping His hand (Wisdom 16:15).'
  FROM cross_reference_threads t, cross_references x, _session253_wis16_lookup sv, _session253_wis16_lookup tv
 WHERE t.slug='wisdom-16-word-that-healeth-all-things'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=16 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=39
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Samuel 2:6 — *The LORD killeth, and maketh alive: he bringeth down to the grave, and bringeth up.* Hannah''s song is Wisdom of Solomon 16:13 word for word: He ''leadest to the gates of hell, and bringest up again.'''
  FROM cross_reference_threads t, cross_references x, _session253_wis16_lookup sv, _session253_wis16_lookup tv
 WHERE t.slug='wisdom-16-word-that-healeth-all-things'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=16 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=2 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-16-angels-food-bread-from-heaven
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 16:4 — *Then said the LORD unto Moses, Behold, I will rain bread from heaven for you; and the people shall go out and gather a certain rate every day, that I may prove them, whether they will walk in my law, or no.* This is the manna Wisdom of Solomon 16:20 calls ''bread prepared without their labour'' sent from heaven.'
  FROM cross_reference_threads t, cross_references x, _session253_wis16_lookup sv, _session253_wis16_lookup tv
 WHERE t.slug='wisdom-16-angels-food-bread-from-heaven'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=16 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=16 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 78:25 — *Man did eat angels'' food: he sent them meat to the full.* The Psalm and Wisdom of Solomon 16:20 use the same phrase — ''angels'' food'' — for the manna that filled every taste.'
  FROM cross_reference_threads t, cross_references x, _session253_wis16_lookup sv, _session253_wis16_lookup tv
 WHERE t.slug='wisdom-16-angels-food-bread-from-heaven'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=16 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=78 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 6:32 — *Then Jesus said unto them, Verily, verily, I say unto you, Moses gave you not that bread from heaven; but my Father giveth you the true bread from heaven.* The manna ''tempered itself to every man''s liking'' (Wisdom of Solomon 16:21) was the shadow; Yahusha is the true bread from heaven.'
  FROM cross_reference_threads t, cross_references x, _session253_wis16_lookup sv, _session253_wis16_lookup tv
 WHERE t.slug='wisdom-16-angels-food-bread-from-heaven'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=16 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=6 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'John 6:33 — *For the bread of God is he which cometh down from heaven, and giveth life unto the world.* The sweetness of the heavenly sustenance in Wisdom of Solomon 16:21 finds its substance in the Bread that gives life to the world.'
  FROM cross_reference_threads t, cross_references x, _session253_wis16_lookup sv, _session253_wis16_lookup tv
 WHERE t.slug='wisdom-16-angels-food-bread-from-heaven'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=16 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=6 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-16-man-lives-by-the-word
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 8:3 — *And he humbled thee, and suffered thee to hunger, and fed thee with manna, which thou knewest not, neither did thy fathers know; that he might make thee know that man doth not live by bread only, but by every word that proceedeth out of the mouth of the LORD doth man live.* Wisdom of Solomon 16:26 distils this Torah lesson: not fruits but His word nourisheth and preserveth.'
  FROM cross_reference_threads t, cross_references x, _session253_wis16_lookup sv, _session253_wis16_lookup tv
 WHERE t.slug='wisdom-16-man-lives-by-the-word'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=16 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=8 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 4:4 — *But he answered and said, It is written, Man shall not live by bread alone, but by every word that proceedeth out of the mouth of God.* Yahusha wields the truth Wisdom of Solomon 16:26 confesses — the word, not the growing of fruits, sustains the children of Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session253_wis16_lookup sv, _session253_wis16_lookup tv
 WHERE t.slug='wisdom-16-man-lives-by-the-word'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=16 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-16-quails-and-the-stinging-serpents
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 11:31 — *And there went forth a wind from the LORD, and brought quails from the sea, and let them fall by the camp, as it were a day''s journey on this side, and as it were a day''s journey on the other side, round about the camp, and as it were two cubits high upon the face of the earth.* These are the ''quails to stir up their appetite'' of Wisdom of Solomon 16:2.'
  FROM cross_reference_threads t, cross_references x, _session253_wis16_lookup sv, _session253_wis16_lookup tv
 WHERE t.slug='wisdom-16-quails-and-the-stinging-serpents'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=16 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=11 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 21:6 — *And the LORD sent fiery serpents among the people, and they bit the people; and much people of Israel died.* These are the ''venomous dragons'' Wisdom of Solomon 16:10 says could not overcome Yahuah''s sons, for His mercy healed them.'
  FROM cross_reference_threads t, cross_references x, _session253_wis16_lookup sv, _session253_wis16_lookup tv
 WHERE t.slug='wisdom-16-quails-and-the-stinging-serpents'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=16 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=21 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_thewisdomofsolomon_17.sql (session253 the-wisdom-of-solomon 17) -----
-- Source anchor: apocrypha/the-wisdom-of-solomon ch17. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: wis17 (view _session253_wis17_lookup). Sort band base 58400, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_wis17_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: wisdom-17-darkness-felt
  ('apocrypha', 'the-wisdom-of-solomon', 17, 2, 'canon', 'exodus', 10, 21, 'free', E'Exodus 10:21 — *And Yahuah (LORD) said unto Moses, Stretch out thine hand toward heaven, that there may be darkness over the land of Egypt, even darkness which may be felt.* The plague Wisdom 17:2 expounds: a darkness so dense it imprisons, the bonds of a long night.'),
  ('apocrypha', 'the-wisdom-of-solomon', 17, 5, 'canon', 'exodus', 10, 22, 'free', E'Exodus 10:22 — *And Moses stretched forth his hand toward heaven; and there was a thick darkness in all the land of Egypt three days* — the thick night against which no fire nor star could give light (Wisdom 17:5).'),
  ('apocrypha', 'the-wisdom-of-solomon', 17, 2, 'canon', 'psalms', 105, 28, 'free', E'Psalm 105:28 — *He sent darkness, and made it dark; and they rebelled not against his word.* The Psalm names Yahuah''s own hand behind the night that fettered Egypt in Wisdom 17:2.'),
  -- thread: wisdom-17-light-in-dwellings
  ('apocrypha', 'the-wisdom-of-solomon', 17, 20, 'canon', 'exodus', 10, 23, 'free', E'Exodus 10:23 — *They saw not one another, neither rose any from his place for three days: but all the children of Yashar''el (Israel) had light in their dwellings.* The very separation Wisdom 17:20 frames — the whole world shined for the righteous while night held the oppressor.'),
  ('apocrypha', 'the-wisdom-of-solomon', 17, 20, 'canon', 'isaiah', 60, 1, 'free', E'Isaiah 60:1 — *Arise, shine; for thy light is come, and the glory of Yahuah (LORD) is risen upon thee.* The clear light over the holy nation (Wisdom 17:20) is the prophetic light risen upon redeemed Yashar''el.'),
  ('apocrypha', 'the-wisdom-of-solomon', 17, 21, 'canon', 'isaiah', 60, 2, 'free', E'Isaiah 60:2 — *For, behold, the darkness shall cover the earth, and gross darkness the people: but Yahuah (LORD) shall arise upon thee, and his glory shall be seen upon thee.* The heavy night that received the wicked (Wisdom 17:21) is the gross darkness from which the elect alone are spared.'),
  -- thread: wisdom-17-chain-of-darkness
  ('apocrypha', 'the-wisdom-of-solomon', 17, 17, 'canon', 'jude', 1, 6, 'free', E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude''s everlasting chains under darkness are Wisdom 17:17''s one chain of darkness that bound every man of Egypt.'),
  ('apocrypha', 'the-wisdom-of-solomon', 17, 16, 'enoch', '1-enoch', 10, 4, 'extras', E'1 Enoch 10:4 — *And again Yahuah (God) said to Raphael: ’Bind Azâzêl hand and foot, and cast him into the darkness: and make an opening in the desert, which is in Dûdâêl, and cast him therein.* The bound watcher of Enoch is the prison without iron bars (Wisdom 17:16) that Jude 6 inherits.'),
  ('apocrypha', 'the-wisdom-of-solomon', 17, 17, 'enoch', '1-enoch', 10, 5, 'extras', E'1 Enoch 10:5 — *And place upon him rough and jagged rocks, and cover him with darkness, and let him abide there for ever, and cover his face that he may not see light.* Azâzêl covered in darkness till the judgment matches the one chain of darkness from which the prisoners of Wisdom 17:17 could not escape.'),
  -- thread: wisdom-17-loved-darkness
  ('apocrypha', 'the-wisdom-of-solomon', 17, 11, 'canon', 'john', 3, 19, 'free', E'John 3:19 — *And this is the condemnation, that light is come into the world, and men loved darkness rather than light, because their deeds were evil.* The wickedness condemned by her own witness (Wisdom 17:11) is the love of darkness that is its own judgment.'),
  ('apocrypha', 'the-wisdom-of-solomon', 17, 11, 'canon', 'john', 3, 20, 'free', E'John 3:20 — *For every one that doeth evil hateth the light, neither cometh to the light, lest his deeds should be reproved.* The conscience pressed and forecasting grievous things (Wisdom 17:11) flees the light lest its deeds be reproved.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_wis17_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_wis17_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-17-darkness-felt',
       E'The darkness which may be felt',
       E'Wisdom unfolds the ninth plague as a parable of the wicked heart: *For when unrighteous men thought to oppress the holy nation; they being shut up in their houses, the prisoners of darkness, and fettered with the bonds of a long night, lay there exiled from the eternal providence.* (the Wisdom of Solomon 17:2) — and again, *No power of the fire might give them light: neither could the bright flames of the stars endure to lighten that horrible night.* (the Wisdom of Solomon 17:5). This is the very plague of Exodus: *And Yahuah (LORD) said unto Moses, Stretch out thine hand toward heaven, that there may be darkness over the land of Egypt, even darkness which may be felt.* (Exodus 10:21) — a dark so thick it was tangible, *And Moses stretched forth his hand toward heaven; and there was a thick darkness in all the land of Egypt three days* (Exodus 10:22). The Psalmist names the same hand at work: *He sent darkness, and made it dark; and they rebelled not against his word.* (Psalm 105:28). It Ain''t New — the deuterocanon is reading Torah, and the judgment is a real, felt thing.',
       sv.verse_id, ev.verse_id, 'extras', 58400
  FROM _session253_wis17_lookup sv, _session253_wis17_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=17 AND sv.verse_number=2
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=17 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-17-light-in-dwellings',
       E'But the holy nation had light',
       E'Over against the imprisoned Egyptians, Wisdom sets the shining world of the righteous: *For the whole world shined with clear light, and none were hindered in their labour:* (the Wisdom of Solomon 17:20). Torah draws the same line of separation: *They saw not one another, neither rose any from his place for three days: but all the children of Yashar''el (Israel) had light in their dwellings.* (Exodus 10:23). The prophet lifts this election into the age to come — darkness for the nations, but light arising upon the chosen: *For, behold, the darkness shall cover the earth, and gross darkness the people: but Yahuah (LORD) shall arise upon thee, and his glory shall be seen upon thee.* (Isaiah 60:2), and *Arise, shine; for thy light is come, and the glory of Yahuah (LORD) is risen upon thee.* (Isaiah 60:1). The separating mercy in judgment that kept Yashar''el in light is the same that will arise upon her at the end.',
       sv.verse_id, ev.verse_id, 'extras', 58403
  FROM _session253_wis17_lookup sv, _session253_wis17_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=17 AND sv.verse_number=20
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=17 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-17-chain-of-darkness',
       E'Bound with one chain of darkness',
       E'Wisdom''s most haunting image: every Egyptian, whatever his calling, dragged into a shared bondage — *For whether he were husbandman, or shepherd, or a labourer in the field, he was overtaken, and endured that necessity, which could not be avoided: for they were all bound with one chain of darkness.* (the Wisdom of Solomon 17:17), shut up *in a prison without iron bars* (the Wisdom of Solomon 17:16). The apostle Jude takes up the very phrase for the fallen watchers: *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* (Jude 1:6). Jude''s source stands now restored and live — the binding of Azâzêl: *And again Yahuah (God) said to Raphael: ’Bind Azâzêl hand and foot, and cast him into the darkness: and make an opening in the desert, which is in Dûdâêl, and cast him therein.* (1 Enoch 10:4), *and cover him with darkness, and let him abide there for ever, and cover his face that he may not see light.* (1 Enoch 10:5). One chain of darkness binds the wicked of Egypt, the rebel angels, and the unrighteous still — It Ain''t New.',
       sv.verse_id, ev.verse_id, 'extras', 58406
  FROM _session253_wis17_lookup sv, _session253_wis17_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=17 AND sv.verse_number=16
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=17 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-17-loved-darkness',
       E'Wickedness condemned by her own witness',
       E'Wisdom turns the outward plague inward — the darkness is the conscience of the wicked: *For wickedness, condemned by her own witness, is very timorous, and being pressed with conscience, always forecasteth grievous things.* (the Wisdom of Solomon 17:11), and the heavy night is *an image of that darkness which should afterward receive them* (the Wisdom of Solomon 17:21). The Master names the same self-judgment of those who flee the light: *And this is the condemnation, that light is come into the world, and men loved darkness rather than light, because their deeds were evil.* (John 3:19), *For every one that doeth evil hateth the light, neither cometh to the light, lest his deeds should be reproved.* (John 3:20). Conscience condemns before the throne does; the darkness men love becomes the darkness that receives them.',
       sv.verse_id, ev.verse_id, 'extras', 58409
  FROM _session253_wis17_lookup sv, _session253_wis17_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=17 AND sv.verse_number=11
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=17 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: wisdom-17-darkness-felt
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 10:21 — *And Yahuah (LORD) said unto Moses, Stretch out thine hand toward heaven, that there may be darkness over the land of Egypt, even darkness which may be felt.* The plague Wisdom 17:2 expounds: a darkness so dense it imprisons, the bonds of a long night.'
  FROM cross_reference_threads t, cross_references x, _session253_wis17_lookup sv, _session253_wis17_lookup tv
 WHERE t.slug='wisdom-17-darkness-felt'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=17 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=10 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 10:22 — *And Moses stretched forth his hand toward heaven; and there was a thick darkness in all the land of Egypt three days* — the thick night against which no fire nor star could give light (Wisdom 17:5).'
  FROM cross_reference_threads t, cross_references x, _session253_wis17_lookup sv, _session253_wis17_lookup tv
 WHERE t.slug='wisdom-17-darkness-felt'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=17 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=10 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 105:28 — *He sent darkness, and made it dark; and they rebelled not against his word.* The Psalm names Yahuah''s own hand behind the night that fettered Egypt in Wisdom 17:2.'
  FROM cross_reference_threads t, cross_references x, _session253_wis17_lookup sv, _session253_wis17_lookup tv
 WHERE t.slug='wisdom-17-darkness-felt'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=17 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=105 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-17-light-in-dwellings
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 10:23 — *They saw not one another, neither rose any from his place for three days: but all the children of Yashar''el (Israel) had light in their dwellings.* The very separation Wisdom 17:20 frames — the whole world shined for the righteous while night held the oppressor.'
  FROM cross_reference_threads t, cross_references x, _session253_wis17_lookup sv, _session253_wis17_lookup tv
 WHERE t.slug='wisdom-17-light-in-dwellings'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=17 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=10 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 60:1 — *Arise, shine; for thy light is come, and the glory of Yahuah (LORD) is risen upon thee.* The clear light over the holy nation (Wisdom 17:20) is the prophetic light risen upon redeemed Yashar''el.'
  FROM cross_reference_threads t, cross_references x, _session253_wis17_lookup sv, _session253_wis17_lookup tv
 WHERE t.slug='wisdom-17-light-in-dwellings'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=17 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=60 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 60:2 — *For, behold, the darkness shall cover the earth, and gross darkness the people: but Yahuah (LORD) shall arise upon thee, and his glory shall be seen upon thee.* The heavy night that received the wicked (Wisdom 17:21) is the gross darkness from which the elect alone are spared.'
  FROM cross_reference_threads t, cross_references x, _session253_wis17_lookup sv, _session253_wis17_lookup tv
 WHERE t.slug='wisdom-17-light-in-dwellings'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=17 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=60 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-17-chain-of-darkness
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude''s everlasting chains under darkness are Wisdom 17:17''s one chain of darkness that bound every man of Egypt.'
  FROM cross_reference_threads t, cross_references x, _session253_wis17_lookup sv, _session253_wis17_lookup tv
 WHERE t.slug='wisdom-17-chain-of-darkness'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=17 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 10:4 — *And again Yahuah (God) said to Raphael: ’Bind Azâzêl hand and foot, and cast him into the darkness: and make an opening in the desert, which is in Dûdâêl, and cast him therein.* The bound watcher of Enoch is the prison without iron bars (Wisdom 17:16) that Jude 6 inherits.'
  FROM cross_reference_threads t, cross_references x, _session253_wis17_lookup sv, _session253_wis17_lookup tv
 WHERE t.slug='wisdom-17-chain-of-darkness'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=17 AND sv.verse_number=16
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 10:5 — *And place upon him rough and jagged rocks, and cover him with darkness, and let him abide there for ever, and cover his face that he may not see light.* Azâzêl covered in darkness till the judgment matches the one chain of darkness from which the prisoners of Wisdom 17:17 could not escape.'
  FROM cross_reference_threads t, cross_references x, _session253_wis17_lookup sv, _session253_wis17_lookup tv
 WHERE t.slug='wisdom-17-chain-of-darkness'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=17 AND sv.verse_number=17
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-17-loved-darkness
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 3:19 — *And this is the condemnation, that light is come into the world, and men loved darkness rather than light, because their deeds were evil.* The wickedness condemned by her own witness (Wisdom 17:11) is the love of darkness that is its own judgment.'
  FROM cross_reference_threads t, cross_references x, _session253_wis17_lookup sv, _session253_wis17_lookup tv
 WHERE t.slug='wisdom-17-loved-darkness'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=17 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=3 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 3:20 — *For every one that doeth evil hateth the light, neither cometh to the light, lest his deeds should be reproved.* The conscience pressed and forecasting grievous things (Wisdom 17:11) flees the light lest its deeds be reproved.'
  FROM cross_reference_threads t, cross_references x, _session253_wis17_lookup sv, _session253_wis17_lookup tv
 WHERE t.slug='wisdom-17-loved-darkness'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=17 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=3 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_thewisdomofsolomon_18.sql (session253 the-wisdom-of-solomon 18) -----
-- Source anchor: apocrypha/the-wisdom-of-solomon ch18. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: wis18 (view _session253_wis18_lookup). Sort band base 58425, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_wis18_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: wisdom-18-burning-pillar
  ('apocrypha', 'the-wisdom-of-solomon', 18, 3, 'canon', 'exodus', 13, 21, 'free', E'Exodus 13:21 — *And Yahuah (LORD) went before them by day in a pillar of a cloud, to lead them the way; and by night in a pillar of fire, to give them light; to go by day and night:* The very pillar Wisdom 18:3 names as the burning guide of the unknown journey.'),
  ('apocrypha', 'the-wisdom-of-solomon', 18, 3, 'canon', 'exodus', 13, 22, 'free', E'Exodus 13:22 — *He took not away the pillar of the cloud by day, nor the pillar of fire by night, from before the people.* The unfailing presence that, in Wisdom 18:3, entertains the saints honourably as an harmless sun.'),
  ('apocrypha', 'the-wisdom-of-solomon', 18, 3, 'canon', 'exodus', 14, 20, 'free', E'Exodus 14:20 — *And it came between the camp of the Egyptians and the camp of Yashar''el (Israel); and it was a cloud and darkness to them, but it gave light by night to these: so that the one came not near the other all the night.* The one fire is light to Israel and darkness to Egypt — Wisdom 18:3-4''s two-edged mercy-in-judgment.'),
  ('apocrypha', 'the-wisdom-of-solomon', 18, 4, 'canon', 'exodus', 12, 42, 'free', E'Exodus 12:42 — *It is a night to be much observed unto Yahuah (LORD) for bringing them out from the land of Egypt: this is that night of Yahuah (LORD) to be observed of all the children of Yashar''el (Israel) in their generations.* The night by which the uncorrupt light of the law (Wisdom 18:4) was given through Israel to the world.'),
  -- thread: wisdom-18-passover-firstborn
  ('apocrypha', 'the-wisdom-of-solomon', 18, 13, 'canon', 'exodus', 12, 29, 'free', E'Exodus 12:29 — *And it came to pass, that at midnight Yahuah (LORD) smote all the firstborn in the land of Egypt, from the firstborn of Pharaoh that sat on his throne unto the firstborn of the captive that was in the dungeon; and all the firstborn of cattle.* The destruction of the firstborn that, in Wisdom 18:13, made Egypt confess Israel to be the sons of Yahuah.'),
  ('apocrypha', 'the-wisdom-of-solomon', 18, 12, 'canon', 'exodus', 12, 30, 'free', E'Exodus 12:30 — *And Pharaoh rose up in the night, he, and all his servants, and all the Egyptians; and there was a great cry in Egypt; for there was not a house where there was not one dead.* Wisdom 18:11-12''s innumerable dead and lamentable cry, with none left to bury — master and king and common person alike.'),
  ('apocrypha', 'the-wisdom-of-solomon', 18, 6, 'canon', 'exodus', 12, 13, 'free', E'Exodus 12:13 — *And the blood shall be to you for a token upon the houses where ye are: and when I see the blood, I will pass over you, and the plague shall not be upon you to destroy you, when I smite the land of Egypt.* The blood-token behind the oaths the fathers were certified by (Wisdom 18:6) — the lamb that turns the destroyer aside.'),
  ('apocrypha', 'the-wisdom-of-solomon', 18, 9, 'canon', 'exodus', 12, 14, 'free', E'Exodus 12:14 — *And this day shall be unto you for a memorial; and ye shall keep it a feast to Yahuah (LORD) throughout your generations; ye shall keep it a feast by an ordinance for ever.* The holy law the righteous children consented to in Wisdom 18:9 — the Passover kept by ordinance forever, Torah standing.'),
  -- thread: wisdom-18-word-warrior
  ('apocrypha', 'the-wisdom-of-solomon', 18, 15, 'canon', 'john', 1, 14, 'free', E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The Almighty Word that leaped from the throne in Wisdom 18:15 is the Logos made flesh — heaven touched, earth stood upon.'),
  ('apocrypha', 'the-wisdom-of-solomon', 18, 15, 'canon', 'revelation', 19, 11, 'free', E'Revelation 19:11 — *And I saw heaven opened, and behold a white horse; and he that sat upon him was called Faithful and True, and in righteousness he doth judge and make war.* The fierce man of war leaping from heaven (Wisdom 18:15) rides out of opened heaven to judge and make war.'),
  ('apocrypha', 'the-wisdom-of-solomon', 18, 15, 'canon', 'revelation', 19, 13, 'free', E'Revelation 19:13 — *And he was clothed with a vesture dipped in blood: and his name is called The Word of Elohim (God).* The very name Wisdom 18:15 gives the warrior — the Almighty Word — borne by the rider into the land of destruction.'),
  ('apocrypha', 'the-wisdom-of-solomon', 18, 16, 'canon', 'revelation', 19, 15, 'free', E'Revelation 19:15 — *And out of his mouth goeth a sharp sword, that with it he should smite the nations: and he shall rule them with a rod of iron: and he treadeth the winepress of the fierceness and wrath of El Shaddai (Almighty God).* The unfeigned commandment as a sharp sword filling all things with death (Wisdom 18:16) — the Word''s blade that smites the nations.'),
  ('apocrypha', 'the-wisdom-of-solomon', 18, 16, 'canon', 'hebrews', 4, 12, 'free', E'Hebrews 4:12 — *For the word of Elohim (God) is quick, and powerful, and sharper than any twoedged sword, piercing even to the dividing asunder of soul and spirit, and of the joints and marrow, and is a discerner of the thoughts and intents of the heart.* The Word-as-sharp-sword of Wisdom 18:16, now turned inward to discern the heart.'),
  -- thread: wisdom-18-aaron-incense-atonement
  ('apocrypha', 'the-wisdom-of-solomon', 18, 21, 'canon', 'numbers', 16, 46, 'free', E'Numbers 16:46 — *And Moses said unto Aaron, Take a censer, and put fire therein from off the altar, and put on incense, and go quickly unto the congregation, and make an atonement for them: for there is wrath gone out from Yahuah (LORD); the plague is begun.* The propitiation of incense Wisdom 18:21 names — the priest''s shield of his proper ministry against the wrath.'),
  ('apocrypha', 'the-wisdom-of-solomon', 18, 23, 'canon', 'numbers', 16, 48, 'free', E'Numbers 16:48 — *And he stood between the dead and the living; and the plague was stayed.* The very posture of Wisdom 18:23 — Aaron standing between, staying the wrath, parting the way to the living.'),
  ('apocrypha', 'the-wisdom-of-solomon', 18, 22, 'canon', 'exodus', 12, 13, 'free', E'Exodus 12:13 — *And the blood shall be to you for a token upon the houses where ye are: and when I see the blood, I will pass over you, and the plague shall not be upon you to destroy you, when I smite the land of Egypt.* The oaths and covenants made with the fathers, by which the blameless man subdues the destroyer (Wisdom 18:22) — the same blood-token that turns the plague aside.'),
  ('apocrypha', 'the-wisdom-of-solomon', 18, 21, 'canon', 'hebrews', 4, 12, 'free', E'Hebrews 4:12 — *For the word of Elohim (God) is quick, and powerful, and sharper than any twoedged sword, piercing even to the dividing asunder of soul and spirit, and of the joints and marrow, and is a discerner of the thoughts and intents of the heart.* The blameless man subdues the destroyer with a word (Wisdom 18:22) — intercession in the power of the living Word.'),
  -- thread: wisdom-18-priestly-garment-world
  ('apocrypha', 'the-wisdom-of-solomon', 18, 24, 'canon', 'exodus', 28, 17, 'free', E'Exodus 28:17 — *And thou shalt set in it settings of stones, even four rows of stones: the first row shall be a sardius, a topaz, and a carbuncle: this shall be the first row.* The four rows of stones of Wisdom 18:24 — the high priest''s breastplate, the glory of the fathers graven.'),
  ('apocrypha', 'the-wisdom-of-solomon', 18, 24, 'canon', 'exodus', 28, 29, 'free', E'Exodus 28:29 — *And Aaron shall bear the names of the children of Yashar''el (Israel) in the breastplate of judgment upon his heart, when he goeth in unto the holy place, for a memorial before Yahuah (LORD) continually.* The glory of the fathers graven on the garment (Wisdom 18:24) — all twelve tribes carried before the throne for a memorial.'),
  ('apocrypha', 'the-wisdom-of-solomon', 18, 24, 'canon', 'exodus', 28, 36, 'free', E'Exodus 28:36 — *And thou shalt make a plate of pure gold, and grave upon it, like the engravings of a signet, HOLINESS TO THE Yahuah (LORD).* Your Majesty upon the diadem of his head (Wisdom 18:24) — the Name on the golden plate that the destroyer dares not pass.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_wis18_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_wis18_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-18-burning-pillar',
       E'The burning pillar of fire — a guide for the unknown journey',
       E'Wisdom turns to the night of the Exodus and the column of fire that led the saints out: *Instead of which you gavest them a burning pillar of fire, both to be a guide of the unknown journey, and an harmless sun to entertain them honourably.* (Wisdom of Solomon 18:3) The same fire that delivers Israel blinds Egypt, *who had kept your sons shut up, by whom the uncorrupt light of the law was to be given to the world* (Wisdom of Solomon 18:4) — the light is Torah. It ain''t new: this is the Exodus pillar itself, *And Yahuah (LORD) went before them by day in a pillar of a cloud, to lead them the way; and by night in a pillar of fire, to give them light; to go by day and night* (Exodus 13:21), the abiding presence that *He took not away the pillar of the cloud by day, nor the pillar of fire by night, from before the people* (Exodus 13:22). At the sea the one fire is two-edged — darkness to the enemy, light to the redeemed: *it was a cloud and darkness to them, but it gave light by night to these* (Exodus 14:20). Wisdom''s ''harmless sun'' is mercy-in-judgment: the same glory guides Israel and confounds the oppressor.',
       sv.verse_id, ev.verse_id, 'extras', 58425
  FROM _session253_wis18_lookup sv, _session253_wis18_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=18 AND sv.verse_number=3
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=18 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-18-passover-firstborn',
       E'The Passover night — the firstborn smitten, the fathers certified by oath',
       E'Wisdom rehearses the night of the tenth plague and the covenant oath that steadied Israel''s faith: *Of that night were our fathers certified afore, that assuredly knowing to what oaths they had given credence, they might afterwards be of good cheer.* (Wisdom of Solomon 18:6) The destroyer passes through, and the smiting of the firstborn at last forces Egypt''s confession: *upon the destruction of the firstborn, they acknowledged this people to be the sons of Yahuah (God)* (Wisdom of Solomon 18:13). It ain''t new — this is Passover midnight: *And it came to pass, that at midnight Yahuah (LORD) smote all the firstborn in the land of Egypt, from the firstborn of Pharaoh that sat on his throne unto the firstborn of the captive that was in the dungeon; and all the firstborn of cattle* (Exodus 12:29), so that *there was a great cry in Egypt; for there was not a house where there was not one dead* (Exodus 12:30). The deliverance hung on the blood-token of the lamb: *when I see the blood, I will pass over you, and the plague shall not be upon you to destroy you* (Exodus 12:13). One night, two destinies — salvation for the righteous, destruction for the enemies (Wisdom 18:7).',
       sv.verse_id, ev.verse_id, 'extras', 58428
  FROM _session253_wis18_lookup sv, _session253_wis18_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=18 AND sv.verse_number=5
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=18 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-18-word-warrior',
       E'The Almighty Word leaping from heaven — the warrior with the sharp sword',
       E'Here is Wisdom''s most arresting figure: at the dead-still midnight the very Word of Yahuah springs from the throne as an armed warrior. *Your Almighty word leaped down from heaven out of your royal throne, as a fierce man of war into the midst of a land of destruction,* (Wisdom of Solomon 18:15) *And brought your unfeigned commandment as a sharp sword, and standing up filled all things with death; and it touched the heaven, but it stood upon the earth.* (Wisdom of Solomon 18:16) The personified Word that delivers and judges is the Logos: *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth* (John 1:14) — the Word that touches heaven yet stands on earth. The warrior who rides out of opened heaven to make war bears the same title and the same blade: *And he was clothed with a vesture dipped in blood: and his name is called The Word of Elohim (God)* (Revelation 19:13), *and out of his mouth goeth a sharp sword, that with it he should smite the nations* (Revelation 19:15), *he that sat upon him was called Faithful and True, and in righteousness he doth judge and make war* (Revelation 19:11). And the sword is His own self-disclosure: *For the word of Elohim (God) is quick, and powerful, and sharper than any twoedged sword* (Hebrews 4:12). It ain''t new — the Word that came down on Passover night is the Word that returns in glory.',
       sv.verse_id, ev.verse_id, 'extras', 58431
  FROM _session253_wis18_lookup sv, _session253_wis18_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=18 AND sv.verse_number=14
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=18 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-18-aaron-incense-atonement',
       E'The blameless man with the incense — standing between the dead and the living',
       E'Even Israel tastes the wrath in the wilderness, and a priest''s atonement halts the plague: *For then the blameless man made haste, and stood forth to defend them; and bringing the shield of his proper ministry, even prayer, and the propitiation of incense, set himself against the wrath, and so brought the calamity to an end, declaring that he was your servant.* (Wisdom of Solomon 18:21) He conquers not by arms but by covenant: *he overcame the destroyer, not with strength of body, nor force of arms, but with a word subdued him that punished, alleging the oaths and covenants made with the fathers* (Wisdom of Solomon 18:22), and *standing between, he stayed the wrath, and parted the way to the living* (Wisdom of Solomon 18:23). It ain''t new — this is Aaron in the plague of Korah: *And Moses said unto Aaron, Take a censer, and put fire therein from off the altar, and put on incense, and go quickly unto the congregation, and make an atonement for them: for there is wrath gone out from Yahuah (LORD); the plague is begun* (Numbers 16:46). The priest runs into the breach: *And he stood between the dead and the living; and the plague was stayed* (Numbers 16:48). The intercessor who pleads the covenant and stays the wrath is the figure of the great High Priest — mercy in the midst of judgment, the seed kept.',
       sv.verse_id, ev.verse_id, 'extras', 58434
  FROM _session253_wis18_lookup sv, _session253_wis18_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=18 AND sv.verse_number=21
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=18 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-18-priestly-garment-world',
       E'The long garment — the whole world, the glory of the fathers, the diadem of Majesty',
       E'Wisdom unveils the priest''s robe as a cosmos and a covenant memorial — the reason the destroyer gives place: *For in the long garment was the whole world, and in the four rows of the stones was the glory of the fathers graven, and your Majesty upon the diadem of his head.* (Wisdom of Solomon 18:24) *To these the destroyer gave place, and was afraid of them: for it was enough that they only tasted of the wrath.* (Wisdom of Solomon 18:25) It ain''t new — the four rows of stones are the breastplate of the high priest, each engraved with a tribe of Israel: *And thou shalt set in it settings of stones, even four rows of stones* (Exodus 28:17), borne *for a memorial before Yahuah (LORD) continually* (Exodus 28:29), with *HOLINESS TO THE Yahuah (LORD)* upon the golden plate of the diadem (Exodus 28:36). The whole house of Israel — the glory of the fathers — is carried on the priest''s heart into the presence; the Name on his brow stays the wrath. The mediator who bears all twelve tribes before the throne is the type of the one who gathers and keeps the seed.',
       sv.verse_id, ev.verse_id, 'extras', 58437
  FROM _session253_wis18_lookup sv, _session253_wis18_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=18 AND sv.verse_number=24
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=18 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: wisdom-18-burning-pillar
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 13:21 — *And Yahuah (LORD) went before them by day in a pillar of a cloud, to lead them the way; and by night in a pillar of fire, to give them light; to go by day and night:* The very pillar Wisdom 18:3 names as the burning guide of the unknown journey.'
  FROM cross_reference_threads t, cross_references x, _session253_wis18_lookup sv, _session253_wis18_lookup tv
 WHERE t.slug='wisdom-18-burning-pillar'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=18 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=13 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 13:22 — *He took not away the pillar of the cloud by day, nor the pillar of fire by night, from before the people.* The unfailing presence that, in Wisdom 18:3, entertains the saints honourably as an harmless sun.'
  FROM cross_reference_threads t, cross_references x, _session253_wis18_lookup sv, _session253_wis18_lookup tv
 WHERE t.slug='wisdom-18-burning-pillar'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=18 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=13 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 14:20 — *And it came between the camp of the Egyptians and the camp of Yashar''el (Israel); and it was a cloud and darkness to them, but it gave light by night to these: so that the one came not near the other all the night.* The one fire is light to Israel and darkness to Egypt — Wisdom 18:3-4''s two-edged mercy-in-judgment.'
  FROM cross_reference_threads t, cross_references x, _session253_wis18_lookup sv, _session253_wis18_lookup tv
 WHERE t.slug='wisdom-18-burning-pillar'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=18 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=14 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Exodus 12:42 — *It is a night to be much observed unto Yahuah (LORD) for bringing them out from the land of Egypt: this is that night of Yahuah (LORD) to be observed of all the children of Yashar''el (Israel) in their generations.* The night by which the uncorrupt light of the law (Wisdom 18:4) was given through Israel to the world.'
  FROM cross_reference_threads t, cross_references x, _session253_wis18_lookup sv, _session253_wis18_lookup tv
 WHERE t.slug='wisdom-18-burning-pillar'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=18 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=42
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-18-passover-firstborn
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 12:29 — *And it came to pass, that at midnight Yahuah (LORD) smote all the firstborn in the land of Egypt, from the firstborn of Pharaoh that sat on his throne unto the firstborn of the captive that was in the dungeon; and all the firstborn of cattle.* The destruction of the firstborn that, in Wisdom 18:13, made Egypt confess Israel to be the sons of Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session253_wis18_lookup sv, _session253_wis18_lookup tv
 WHERE t.slug='wisdom-18-passover-firstborn'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=18 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 12:30 — *And Pharaoh rose up in the night, he, and all his servants, and all the Egyptians; and there was a great cry in Egypt; for there was not a house where there was not one dead.* Wisdom 18:11-12''s innumerable dead and lamentable cry, with none left to bury — master and king and common person alike.'
  FROM cross_reference_threads t, cross_references x, _session253_wis18_lookup sv, _session253_wis18_lookup tv
 WHERE t.slug='wisdom-18-passover-firstborn'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=18 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 12:13 — *And the blood shall be to you for a token upon the houses where ye are: and when I see the blood, I will pass over you, and the plague shall not be upon you to destroy you, when I smite the land of Egypt.* The blood-token behind the oaths the fathers were certified by (Wisdom 18:6) — the lamb that turns the destroyer aside.'
  FROM cross_reference_threads t, cross_references x, _session253_wis18_lookup sv, _session253_wis18_lookup tv
 WHERE t.slug='wisdom-18-passover-firstborn'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=18 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Exodus 12:14 — *And this day shall be unto you for a memorial; and ye shall keep it a feast to Yahuah (LORD) throughout your generations; ye shall keep it a feast by an ordinance for ever.* The holy law the righteous children consented to in Wisdom 18:9 — the Passover kept by ordinance forever, Torah standing.'
  FROM cross_reference_threads t, cross_references x, _session253_wis18_lookup sv, _session253_wis18_lookup tv
 WHERE t.slug='wisdom-18-passover-firstborn'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=18 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-18-word-warrior
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The Almighty Word that leaped from the throne in Wisdom 18:15 is the Logos made flesh — heaven touched, earth stood upon.'
  FROM cross_reference_threads t, cross_references x, _session253_wis18_lookup sv, _session253_wis18_lookup tv
 WHERE t.slug='wisdom-18-word-warrior'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=18 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 19:11 — *And I saw heaven opened, and behold a white horse; and he that sat upon him was called Faithful and True, and in righteousness he doth judge and make war.* The fierce man of war leaping from heaven (Wisdom 18:15) rides out of opened heaven to judge and make war.'
  FROM cross_reference_threads t, cross_references x, _session253_wis18_lookup sv, _session253_wis18_lookup tv
 WHERE t.slug='wisdom-18-word-warrior'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=18 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=19 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 19:13 — *And he was clothed with a vesture dipped in blood: and his name is called The Word of Elohim (God).* The very name Wisdom 18:15 gives the warrior — the Almighty Word — borne by the rider into the land of destruction.'
  FROM cross_reference_threads t, cross_references x, _session253_wis18_lookup sv, _session253_wis18_lookup tv
 WHERE t.slug='wisdom-18-word-warrior'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=18 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=19 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 19:15 — *And out of his mouth goeth a sharp sword, that with it he should smite the nations: and he shall rule them with a rod of iron: and he treadeth the winepress of the fierceness and wrath of El Shaddai (Almighty God).* The unfeigned commandment as a sharp sword filling all things with death (Wisdom 18:16) — the Word''s blade that smites the nations.'
  FROM cross_reference_threads t, cross_references x, _session253_wis18_lookup sv, _session253_wis18_lookup tv
 WHERE t.slug='wisdom-18-word-warrior'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=18 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=19 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Hebrews 4:12 — *For the word of Elohim (God) is quick, and powerful, and sharper than any twoedged sword, piercing even to the dividing asunder of soul and spirit, and of the joints and marrow, and is a discerner of the thoughts and intents of the heart.* The Word-as-sharp-sword of Wisdom 18:16, now turned inward to discern the heart.'
  FROM cross_reference_threads t, cross_references x, _session253_wis18_lookup sv, _session253_wis18_lookup tv
 WHERE t.slug='wisdom-18-word-warrior'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=18 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=4 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-18-aaron-incense-atonement
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 16:46 — *And Moses said unto Aaron, Take a censer, and put fire therein from off the altar, and put on incense, and go quickly unto the congregation, and make an atonement for them: for there is wrath gone out from Yahuah (LORD); the plague is begun.* The propitiation of incense Wisdom 18:21 names — the priest''s shield of his proper ministry against the wrath.'
  FROM cross_reference_threads t, cross_references x, _session253_wis18_lookup sv, _session253_wis18_lookup tv
 WHERE t.slug='wisdom-18-aaron-incense-atonement'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=18 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=16 AND tv.verse_number=46
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 16:48 — *And he stood between the dead and the living; and the plague was stayed.* The very posture of Wisdom 18:23 — Aaron standing between, staying the wrath, parting the way to the living.'
  FROM cross_reference_threads t, cross_references x, _session253_wis18_lookup sv, _session253_wis18_lookup tv
 WHERE t.slug='wisdom-18-aaron-incense-atonement'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=18 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=16 AND tv.verse_number=48
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 12:13 — *And the blood shall be to you for a token upon the houses where ye are: and when I see the blood, I will pass over you, and the plague shall not be upon you to destroy you, when I smite the land of Egypt.* The oaths and covenants made with the fathers, by which the blameless man subdues the destroyer (Wisdom 18:22) — the same blood-token that turns the plague aside.'
  FROM cross_reference_threads t, cross_references x, _session253_wis18_lookup sv, _session253_wis18_lookup tv
 WHERE t.slug='wisdom-18-aaron-incense-atonement'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=18 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Hebrews 4:12 — *For the word of Elohim (God) is quick, and powerful, and sharper than any twoedged sword, piercing even to the dividing asunder of soul and spirit, and of the joints and marrow, and is a discerner of the thoughts and intents of the heart.* The blameless man subdues the destroyer with a word (Wisdom 18:22) — intercession in the power of the living Word.'
  FROM cross_reference_threads t, cross_references x, _session253_wis18_lookup sv, _session253_wis18_lookup tv
 WHERE t.slug='wisdom-18-aaron-incense-atonement'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=18 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=4 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-18-priestly-garment-world
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 28:17 — *And thou shalt set in it settings of stones, even four rows of stones: the first row shall be a sardius, a topaz, and a carbuncle: this shall be the first row.* The four rows of stones of Wisdom 18:24 — the high priest''s breastplate, the glory of the fathers graven.'
  FROM cross_reference_threads t, cross_references x, _session253_wis18_lookup sv, _session253_wis18_lookup tv
 WHERE t.slug='wisdom-18-priestly-garment-world'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=18 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=28 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 28:29 — *And Aaron shall bear the names of the children of Yashar''el (Israel) in the breastplate of judgment upon his heart, when he goeth in unto the holy place, for a memorial before Yahuah (LORD) continually.* The glory of the fathers graven on the garment (Wisdom 18:24) — all twelve tribes carried before the throne for a memorial.'
  FROM cross_reference_threads t, cross_references x, _session253_wis18_lookup sv, _session253_wis18_lookup tv
 WHERE t.slug='wisdom-18-priestly-garment-world'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=18 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=28 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 28:36 — *And thou shalt make a plate of pure gold, and grave upon it, like the engravings of a signet, HOLINESS TO THE Yahuah (LORD).* Your Majesty upon the diadem of his head (Wisdom 18:24) — the Name on the golden plate that the destroyer dares not pass.'
  FROM cross_reference_threads t, cross_references x, _session253_wis18_lookup sv, _session253_wis18_lookup tv
 WHERE t.slug='wisdom-18-priestly-garment-world'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=18 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=28 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_thewisdomofsolomon_19.sql (session253 the-wisdom-of-solomon 19) -----
-- Source anchor: apocrypha/the-wisdom-of-solomon ch19. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: wis19 (view _session253_wis19_lookup). Sort band base 58450, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_wis19_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: wisdom-19-red-sea-way-and-grave
  ('apocrypha', 'the-wisdom-of-solomon', 19, 7, 'canon', 'exodus', 14, 21, 'free', E'Exodus 14:21 — *And Moses stretched out his hand over the sea; and the LORD caused the sea to go back by a strong east wind all that night, and made the sea dry land, and the waters were divided.* The dry land and the way through the Red sea Wisdom 19:7 names is the very dividing of the waters in the Torah.'),
  ('apocrypha', 'the-wisdom-of-solomon', 19, 8, 'canon', 'exodus', 14, 22, 'free', E'Exodus 14:22 — *And the children of Israel went into the midst of the sea upon the dry ground: and the waters were a wall unto them on their right hand, and on their left.* Wisdom 19:8''s people who ''went'' through, defended by Yahuah''s hand, are Israel walled in by the waters.'),
  ('apocrypha', 'the-wisdom-of-solomon', 19, 3, 'canon', 'exodus', 14, 28, 'free', E'Exodus 14:28 — *And the waters returned, and covered the chariots, and the horsemen, and all the host of Pharaoh that came into the sea after them; there remained not so much as one of them.* The pursuers of Wisdom 19:2-3, drawn by their destiny, find in the same sea the ''strange death'' (19:5) — a grave where Israel found a road.'),
  -- thread: wisdom-19-song-of-the-redeemed
  ('apocrypha', 'the-wisdom-of-solomon', 19, 9, 'canon', 'exodus', 15, 1, 'free', E'Exodus 15:1 — *Then sang Moses and the children of Israel this song unto the LORD, and spake, saying, I will sing unto the LORD, for he hath triumphed gloriously: the horse and his rider hath he thrown into the sea.* The leaping, horse-like praise of Wisdom 19:9 is the Song of the Sea — Israel''s first worship after the crossing.'),
  ('apocrypha', 'the-wisdom-of-solomon', 19, 22, 'canon', 'exodus', 15, 13, 'free', E'Exodus 15:13 — *Thou in thy mercy hast led forth the people which thou hast redeemed: thou hast guided them in thy strength unto thy holy habitation.* The closing magnifying of His people in Wisdom 19:22 echoes the song''s confession that mercy led the redeemed to the holy habitation.'),
  ('apocrypha', 'the-wisdom-of-solomon', 19, 22, 'canon', 'deuteronomy', 7, 6, 'free', E'Deuteronomy 7:6 — *For thou art an holy people unto the LORD thy God: the LORD thy God hath chosen thee to be a special people unto himself, above all people that are upon the face of the earth.* Wisdom''s final word that Yahuah magnified and glorified His people rests on the Torah''s doctrine of election.'),
  -- thread: wisdom-19-creature-fashioned-anew
  ('apocrypha', 'the-wisdom-of-solomon', 19, 6, 'canon', 'isaiah', 43, 19, 'free', E'Isaiah 43:19 — *Behold, I will do a new thing; now it shall spring forth; shall ye not know it? I will even make a way in the wilderness, and rivers in the desert.* The creature ''fashioned again anew'' in Wisdom 19:6 is Isaiah''s ''new thing'' — a way made where there was none, for His people.'),
  ('apocrypha', 'the-wisdom-of-solomon', 19, 7, 'canon', 'isaiah', 43, 16, 'free', E'Isaiah 43:16 — *Thus saith the LORD, which maketh a way in the sea, and a path in the mighty waters.* Wisdom 19:7''s ''way without impediment'' out of the Red sea is exactly the LORD who makes a path in the mighty waters.'),
  ('apocrypha', 'the-wisdom-of-solomon', 19, 6, 'canon', 'romans', 8, 19, 'free', E'Romans 8:19 — *For the earnest expectation of the creature waiteth for the manifestation of the sons of God.* The ''whole creature'' re-fashioned to keep His children unhurt (Wisdom 19:6) is the very creature Paul says waits for the revealing of the sons of God.'),
  ('apocrypha', 'the-wisdom-of-solomon', 19, 18, 'canon', 'revelation', 21, 1, 'free', E'Revelation 21:1 — *And I saw a new heaven and a new earth: for the first heaven and the first earth were passed away; and there was no more sea.* The elements re-harmonized in Wisdom 19:18 anticipate the final re-creation John beholds, where the sea itself is gone.'),
  -- thread: wisdom-19-elements-changed-fire-in-water
  ('apocrypha', 'the-wisdom-of-solomon', 19, 20, 'canon', 'exodus', 9, 24, 'free', E'Exodus 9:24 — *So there was hail, and fire mingled with the hail, very grievous, such as there was none like it in all the land of Egypt since it became a nation.* Wisdom 19:20''s fire having power in the water is the Torah''s hail mingled with fire — the elements set against their own nature.'),
  ('apocrypha', 'the-wisdom-of-solomon', 19, 7, 'canon', 'exodus', 13, 21, 'free', E'Exodus 13:21 — *And the LORD went before them by day in a pillar of a cloud, to lead them the way; and by night in a pillar of fire, to give them light; to go by day and night.* The cloud shadowing the camp in Wisdom 19:7 is the pillar that was cloud by day and fire by night — element bent to guard His people.'),
  -- thread: wisdom-19-sodom-and-the-inhospitable
  ('apocrypha', 'the-wisdom-of-solomon', 19, 17, 'canon', 'genesis', 19, 11, 'free', E'Genesis 19:11 — *And they smote the men that were at the door of the house with blindness, both small and great: so that they wearied themselves to find the door.* Wisdom 19:17''s blindness at the doors of the righteous man, every one seeking his own door, is the smiting of the Sodomites at Lot''s house.'),
  ('apocrypha', 'the-wisdom-of-solomon', 19, 14, 'canon', 'matthew', 10, 15, 'free', E'Matthew 10:15 — *Verily I say unto you, It shall be more tolerable for the land of Sodom and Gomorrah in the day of judgment, than for that city.* Wisdom 19:14 makes Egypt''s mistreatment of the stranger worse than Sodom''s; Yahusha likewise weighs the inhospitable city below Sodom in judgment.'),
  ('apocrypha', 'the-wisdom-of-solomon', 19, 14, 'apocrypha', 'ecclesiasticus', 16, 8, 'extras', E'Ecclesiasticus 16:8 — *Neither spared he the place where Lot sojourned, but abhorred them for their pride.* Yeshua ben Sira, like Wisdom 19:14, recalls Sodom''s pride and inhospitality as the pattern of judgment on those who despise the stranger.'),
  -- thread: wisdom-19-quails-and-the-plagues
  ('apocrypha', 'the-wisdom-of-solomon', 19, 10, 'canon', 'exodus', 8, 3, 'free', E'Exodus 8:3 — *And the river shall bring forth frogs abundantly, which shall go up and come into thine house, and into thy bedchamber, and upon thy bed.* Wisdom 19:10''s river casting up frogs instead of fishes is the second plague of the Torah.'),
  ('apocrypha', 'the-wisdom-of-solomon', 19, 12, 'canon', 'numbers', 11, 31, 'free', E'Numbers 11:31 — *And there went forth a wind from the LORD, and brought quails from the sea, and let them fall by the camp.* The quails ''from the sea for their contentment'' in Wisdom 19:12 are the wilderness quail-provision of Numbers 11.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_wis19_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_wis19_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-19-red-sea-way-and-grave',
       E'The sea: a way for Yashar''el, a grave for Egypt',
       E'Wisdom rehearses the climactic deliverance: *As namely, a cloud shadowing the camp; and where water stood before, dry land appeared; and out of the Red sea a way without impediment; and out of the violent stream a green field* (Wisdom of Solomon 19:7), and the ungodly, *having given them leave to depart... they would repent and pursue them* (Wisdom of Solomon 19:2). The Torah account stands behind every line: *And Moses stretched out his hand over the sea; and the LORD caused the sea to go back by a strong east wind all that night, and made the sea dry land, and the waters were divided* (Exodus 14:21), and the same waters that walled up for Israel closed over Pharaoh''s host — *and the waters returned, and covered the chariots, and the horsemen, and all the host of Pharaoh that came into the sea after them; there remained not so much as one of them* (Exodus 14:28). One element, two destinies — escape for the elect, the grave for the oppressor; mercy and judgment are the same act of the same hand. It ain''t new: the apocryphal hymn is only retelling the Exodus.',
       sv.verse_id, ev.verse_id, 'extras', 58450
  FROM _session253_wis19_lookup sv, _session253_wis19_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=19 AND sv.verse_number=2
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=19 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-19-song-of-the-redeemed',
       E'Leaping like lambs, praising the Deliverer',
       E'On the far shore the redeemed break into praise: *For they went at large like horses, and leaped like lambs, praising you, O Yahuah (God), who hadst delivered them* (Wisdom of Solomon 19:9), and the book seals its whole argument with a doxology — *For in all things, O Yahuah (God), you did magnify your people, and glorify them, neither did you lightly regard them: but did assist them in every time and place* (Wisdom of Solomon 19:22). This is the Song of the Sea continued: *Then sang Moses and the children of Israel this song unto the LORD, and spake, saying, I will sing unto the LORD, for he hath triumphed gloriously: the horse and his rider hath he thrown into the sea* (Exodus 15:1), the song that ends in covenant rest — *Thou in thy mercy hast led forth the people which thou hast redeemed: thou hast guided them in thy strength unto thy holy habitation* (Exodus 15:13). The lamb-imagery is no accident: deliverance through the sea is birthed by the Passover lamb, and the redeemed leap for the One who magnifies His people. Election sung, not earned.',
       sv.verse_id, ev.verse_id, 'extras', 58453
  FROM _session253_wis19_lookup sv, _session253_wis19_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=19 AND sv.verse_number=9
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=19 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-19-creature-fashioned-anew',
       E'The whole creature fashioned again anew',
       E'Wisdom gives the cosmic key to the plagues and the crossing: *For the whole creature in his proper kind was fashioned again anew, serving the peculiar commandments that were given to them, that your children might be kept without hurt* (Wisdom of Solomon 19:6) — creation itself re-tuned, *the elements were changed in themselves by a kind of harmony, like as in a psaltery notes change the name of the tune, and yet are always sounds* (Wisdom of Solomon 19:18). This is the same renewal the prophets and apostles announce. Isaiah binds the new thing to the very sea-road of Exodus: *Thus saith the LORD, which maketh a way in the sea, and a path in the mighty waters* (Isaiah 43:16) — *Behold, I will do a new thing; now it shall spring forth; shall ye not know it? I will even make a way in the wilderness, and rivers in the desert* (Isaiah 43:19). Paul hears the whole creation groaning toward that day — *For the earnest expectation of the creature waiteth for the manifestation of the sons of God* (Romans 8:19) — and John sees its consummation: *And I saw a new heaven and a new earth: for the first heaven and the first earth were passed away; and there was no more sea* (Revelation 21:1). The creature fashioned anew for the elect is the first-fruits of the new creation. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 58456
  FROM _session253_wis19_lookup sv, _session253_wis19_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=19 AND sv.verse_number=6
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=19 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-19-elements-changed-fire-in-water',
       E'Fire in the water: the elements forget their nature',
       E'Wisdom marvels at the plagues'' reversal of nature for Israel''s sake: *The fire had power in the water, forgetting his own virtue: and the water forgat his own quenching nature* (Wisdom of Solomon 19:20) — *For earthly things were turned into watery, and the things, that before swam in the water, now went upon the ground* (Wisdom of Solomon 19:19). The hail-and-fire plague is the source: *So there was hail, and fire mingled with the hail, very grievous, such as there was none like it in all the land of Egypt since it became a nation* (Exodus 9:24). And the protecting cloud of Wisdom 19:7 stood as fire by night — *And the LORD went before them by day in a pillar of a cloud, to lead them the way; and by night in a pillar of fire, to give them light; to go by day and night* (Exodus 13:21). The same fire that consumes Egypt lights Israel''s road; the elements obey their Maker''s command, not their own ''virtue.'' Creation is His servant, re-tuned to keep the covenant seed.',
       sv.verse_id, ev.verse_id, 'extras', 58459
  FROM _session253_wis19_lookup sv, _session253_wis19_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=19 AND sv.verse_number=18
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=19 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-19-sodom-and-the-inhospitable',
       E'Egypt''s sin worse than Sodom''s: smiting the stranger',
       E'Wisdom indicts Egypt by comparison to Sodom: *Therefore even with blindness were these stricken, as those were at the doors of the righteous man: when, being compassed about with horrible great darkness, every one sought the passage of his own doors* (Wisdom of Solomon 19:17) — for *the Sodomites did not receive those, whom they knew not when they came: but these brought friends into bondage, that had well deserved of them* (Wisdom of Solomon 19:14). The blindness at the door is straight from the Lot account: *And they smote the men that were at the door of the house with blindness, both small and great: so that they wearied themselves to find the door* (Genesis 19:11). The two judgments rhyme — strangers despised, light withdrawn — and the Scriptures hold both up as warnings. Yahusha Himself ranks the inhospitable city beneath Sodom: *Verily I say unto you, It shall be more tolerable for the land of Sodom and Gomorrah in the day of judgment, than for that city* (Matthew 10:15). Hospitality to the stranger is covenant weight; its refusal invites the doom of Sodom and Egypt alike.',
       sv.verse_id, ev.verse_id, 'extras', 58462
  FROM _session253_wis19_lookup sv, _session253_wis19_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=19 AND sv.verse_number=13
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=19 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-19-quails-and-the-plagues',
       E'Frogs, flies, and quails: the strange land remembered',
       E'Wisdom recalls the plagues poured on Egypt and the food given to Israel: *how the ground brought forth flies instead of cattle, and how the river cast up a multitude of frogs instead of fishes* (Wisdom of Solomon 19:10), and then *For quails came up to them from the sea for their contentment* (Wisdom of Solomon 19:12). The frogs from the river are Exodus 8: *And the river shall bring forth frogs abundantly, which shall go up and come into thine house, and into thy bedchamber, and upon thy bed* (Exodus 8:3). The quails are the wilderness provision of Numbers 11: *And there went forth a wind from the LORD, and brought quails from the sea, and let them fall by the camp* (Numbers 11:31). The same creation that plagues Egypt feeds Israel — judgment and mercy from one hand, the elements serving ''the peculiar commandments that were given to them'' (19:6). The Maker disposes His creatures for and against, by covenant.',
       sv.verse_id, ev.verse_id, 'extras', 58465
  FROM _session253_wis19_lookup sv, _session253_wis19_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=19 AND sv.verse_number=10
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=19 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: wisdom-19-red-sea-way-and-grave
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 14:21 — *And Moses stretched out his hand over the sea; and the LORD caused the sea to go back by a strong east wind all that night, and made the sea dry land, and the waters were divided.* The dry land and the way through the Red sea Wisdom 19:7 names is the very dividing of the waters in the Torah.'
  FROM cross_reference_threads t, cross_references x, _session253_wis19_lookup sv, _session253_wis19_lookup tv
 WHERE t.slug='wisdom-19-red-sea-way-and-grave'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=19 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=14 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 14:22 — *And the children of Israel went into the midst of the sea upon the dry ground: and the waters were a wall unto them on their right hand, and on their left.* Wisdom 19:8''s people who ''went'' through, defended by Yahuah''s hand, are Israel walled in by the waters.'
  FROM cross_reference_threads t, cross_references x, _session253_wis19_lookup sv, _session253_wis19_lookup tv
 WHERE t.slug='wisdom-19-red-sea-way-and-grave'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=19 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=14 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 14:28 — *And the waters returned, and covered the chariots, and the horsemen, and all the host of Pharaoh that came into the sea after them; there remained not so much as one of them.* The pursuers of Wisdom 19:2-3, drawn by their destiny, find in the same sea the ''strange death'' (19:5) — a grave where Israel found a road.'
  FROM cross_reference_threads t, cross_references x, _session253_wis19_lookup sv, _session253_wis19_lookup tv
 WHERE t.slug='wisdom-19-red-sea-way-and-grave'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=19 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=14 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-19-song-of-the-redeemed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 15:1 — *Then sang Moses and the children of Israel this song unto the LORD, and spake, saying, I will sing unto the LORD, for he hath triumphed gloriously: the horse and his rider hath he thrown into the sea.* The leaping, horse-like praise of Wisdom 19:9 is the Song of the Sea — Israel''s first worship after the crossing.'
  FROM cross_reference_threads t, cross_references x, _session253_wis19_lookup sv, _session253_wis19_lookup tv
 WHERE t.slug='wisdom-19-song-of-the-redeemed'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=19 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=15 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 15:13 — *Thou in thy mercy hast led forth the people which thou hast redeemed: thou hast guided them in thy strength unto thy holy habitation.* The closing magnifying of His people in Wisdom 19:22 echoes the song''s confession that mercy led the redeemed to the holy habitation.'
  FROM cross_reference_threads t, cross_references x, _session253_wis19_lookup sv, _session253_wis19_lookup tv
 WHERE t.slug='wisdom-19-song-of-the-redeemed'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=19 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=15 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 7:6 — *For thou art an holy people unto the LORD thy God: the LORD thy God hath chosen thee to be a special people unto himself, above all people that are upon the face of the earth.* Wisdom''s final word that Yahuah magnified and glorified His people rests on the Torah''s doctrine of election.'
  FROM cross_reference_threads t, cross_references x, _session253_wis19_lookup sv, _session253_wis19_lookup tv
 WHERE t.slug='wisdom-19-song-of-the-redeemed'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=19 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-19-creature-fashioned-anew
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 43:19 — *Behold, I will do a new thing; now it shall spring forth; shall ye not know it? I will even make a way in the wilderness, and rivers in the desert.* The creature ''fashioned again anew'' in Wisdom 19:6 is Isaiah''s ''new thing'' — a way made where there was none, for His people.'
  FROM cross_reference_threads t, cross_references x, _session253_wis19_lookup sv, _session253_wis19_lookup tv
 WHERE t.slug='wisdom-19-creature-fashioned-anew'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=19 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=43 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 43:16 — *Thus saith the LORD, which maketh a way in the sea, and a path in the mighty waters.* Wisdom 19:7''s ''way without impediment'' out of the Red sea is exactly the LORD who makes a path in the mighty waters.'
  FROM cross_reference_threads t, cross_references x, _session253_wis19_lookup sv, _session253_wis19_lookup tv
 WHERE t.slug='wisdom-19-creature-fashioned-anew'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=19 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=43 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 8:19 — *For the earnest expectation of the creature waiteth for the manifestation of the sons of God.* The ''whole creature'' re-fashioned to keep His children unhurt (Wisdom 19:6) is the very creature Paul says waits for the revealing of the sons of God.'
  FROM cross_reference_threads t, cross_references x, _session253_wis19_lookup sv, _session253_wis19_lookup tv
 WHERE t.slug='wisdom-19-creature-fashioned-anew'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=19 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=8 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 21:1 — *And I saw a new heaven and a new earth: for the first heaven and the first earth were passed away; and there was no more sea.* The elements re-harmonized in Wisdom 19:18 anticipate the final re-creation John beholds, where the sea itself is gone.'
  FROM cross_reference_threads t, cross_references x, _session253_wis19_lookup sv, _session253_wis19_lookup tv
 WHERE t.slug='wisdom-19-creature-fashioned-anew'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=19 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-19-elements-changed-fire-in-water
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 9:24 — *So there was hail, and fire mingled with the hail, very grievous, such as there was none like it in all the land of Egypt since it became a nation.* Wisdom 19:20''s fire having power in the water is the Torah''s hail mingled with fire — the elements set against their own nature.'
  FROM cross_reference_threads t, cross_references x, _session253_wis19_lookup sv, _session253_wis19_lookup tv
 WHERE t.slug='wisdom-19-elements-changed-fire-in-water'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=19 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=9 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 13:21 — *And the LORD went before them by day in a pillar of a cloud, to lead them the way; and by night in a pillar of fire, to give them light; to go by day and night.* The cloud shadowing the camp in Wisdom 19:7 is the pillar that was cloud by day and fire by night — element bent to guard His people.'
  FROM cross_reference_threads t, cross_references x, _session253_wis19_lookup sv, _session253_wis19_lookup tv
 WHERE t.slug='wisdom-19-elements-changed-fire-in-water'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=19 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=13 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-19-sodom-and-the-inhospitable
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 19:11 — *And they smote the men that were at the door of the house with blindness, both small and great: so that they wearied themselves to find the door.* Wisdom 19:17''s blindness at the doors of the righteous man, every one seeking his own door, is the smiting of the Sodomites at Lot''s house.'
  FROM cross_reference_threads t, cross_references x, _session253_wis19_lookup sv, _session253_wis19_lookup tv
 WHERE t.slug='wisdom-19-sodom-and-the-inhospitable'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=19 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=19 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 10:15 — *Verily I say unto you, It shall be more tolerable for the land of Sodom and Gomorrah in the day of judgment, than for that city.* Wisdom 19:14 makes Egypt''s mistreatment of the stranger worse than Sodom''s; Yahusha likewise weighs the inhospitable city below Sodom in judgment.'
  FROM cross_reference_threads t, cross_references x, _session253_wis19_lookup sv, _session253_wis19_lookup tv
 WHERE t.slug='wisdom-19-sodom-and-the-inhospitable'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=19 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=10 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ecclesiasticus 16:8 — *Neither spared he the place where Lot sojourned, but abhorred them for their pride.* Yeshua ben Sira, like Wisdom 19:14, recalls Sodom''s pride and inhospitality as the pattern of judgment on those who despise the stranger.'
  FROM cross_reference_threads t, cross_references x, _session253_wis19_lookup sv, _session253_wis19_lookup tv
 WHERE t.slug='wisdom-19-sodom-and-the-inhospitable'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=19 AND sv.verse_number=14
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=16 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-19-quails-and-the-plagues
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 8:3 — *And the river shall bring forth frogs abundantly, which shall go up and come into thine house, and into thy bedchamber, and upon thy bed.* Wisdom 19:10''s river casting up frogs instead of fishes is the second plague of the Torah.'
  FROM cross_reference_threads t, cross_references x, _session253_wis19_lookup sv, _session253_wis19_lookup tv
 WHERE t.slug='wisdom-19-quails-and-the-plagues'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=19 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=8 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 11:31 — *And there went forth a wind from the LORD, and brought quails from the sea, and let them fall by the camp.* The quails ''from the sea for their contentment'' in Wisdom 19:12 are the wilderness quail-provision of Numbers 11.'
  FROM cross_reference_threads t, cross_references x, _session253_wis19_lookup sv, _session253_wis19_lookup tv
 WHERE t.slug='wisdom-19-quails-and-the-plagues'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=19 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=11 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session253 — Wisdom of Solomon cross-references complete.'
