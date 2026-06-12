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

