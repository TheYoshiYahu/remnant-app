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


COMMIT;
\echo 'session253 — Wisdom of Solomon cross-references complete.'
