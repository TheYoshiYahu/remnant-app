-- ----- fragment: minion_ecclesiasticus_16.sql (session253 ecclesiasticus 16) -----
-- Source anchor: apocrypha/ecclesiasticus ch16. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: sir16 (view _session253_sir16_lookup). Sort band base 58675, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_sir16_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: sirach-16-judgments-of-old
  ('apocrypha', 'ecclesiasticus', 16, 7, 'canon', 'genesis', 6, 4, 'free', E'Genesis 6:4 — *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown.* These are the old giants Sirach 16:7 says Yahuah was not pacified toward.'),
  ('apocrypha', 'ecclesiasticus', 16, 8, 'canon', 'genesis', 19, 24, 'free', E'Genesis 19:24 — *Then Yahuah (LORD) rained upon Sodom and upon Gomorrah brimstone and fire from Yahuah (LORD) out of heaven;* this is the place where Lot sojourned, abhorred for its pride in Sirach 16:8.'),
  ('apocrypha', 'ecclesiasticus', 16, 10, 'canon', 'numbers', 16, 32, 'free', E'Numbers 16:32 — *And the earth opened her mouth, and swallowed them up, and their houses, and all the men that appertained unto Korah, and all their goods.* The hard-hearted multitude of Sirach 16:10 that perished in the wilderness rebellion.'),
  ('apocrypha', 'ecclesiasticus', 16, 7, 'enoch', '1-enoch', 7, 2, 'extras', E'1 Enoch 7:2 — *And they became pregnant, and they bare great giants, whose height was three thousand ells:* the now-live Watchers account naming the very old giants whose foolish strength Sirach 16:7 invokes.'),
  ('apocrypha', 'ecclesiasticus', 16, 6, 'canon', 'deuteronomy', 32, 7, 'free', E'Deuteronomy 32:7 — *Remember the days of old, consider the years of many generations: ask thy father, and he will shew thee; thy elders, and they will tell thee.* The Mosaic charge to recall the old judgments that Sirach 16:6 puts to use against the ungodly congregation.'),
  -- thread: sirach-16-old-giants-watchers
  ('apocrypha', 'ecclesiasticus', 16, 7, 'canon', 'genesis', 6, 4, 'free', E'Genesis 6:4 — *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown.* The canonical root of Sirach 16:7''s old giants.'),
  ('apocrypha', 'ecclesiasticus', 16, 7, 'enoch', '1-enoch', 7, 2, 'extras', E'1 Enoch 7:2 — *And they became pregnant, and they bare great giants, whose height was three thousand ells:* the live Watchers narrative supplying the begetting of the giants Sirach 16:7 names.'),
  ('apocrypha', 'ecclesiasticus', 16, 7, 'enoch', '1-enoch', 10, 15, 'extras', E'1 Enoch 10:15 — *And destroy all the spirits of the reprobate and the children of the Watchers, because they have wronged mankind.* The decree of judgment behind Sirach 16:7''s giants who fell away unpacified.'),
  -- thread: sirach-16-none-can-hide
  ('apocrypha', 'ecclesiasticus', 16, 17, 'canon', 'psalms', 139, 7, 'free', E'Psalm 139:7 — *Whither shall I go from thy spirit? or whither shall I flee from thy presence?* David''s question is exactly the conceit Sirach 16:17 forbids — there is no hiding from Yahuah.'),
  ('apocrypha', 'ecclesiasticus', 16, 17, 'canon', 'psalms', 139, 11, 'free', E'Psalm 139:11 — *If I say, Surely the darkness shall cover me; even the night shall be light about me.* No darkness conceals the man who imagines himself forgotten in Sirach 16:17.'),
  ('apocrypha', 'ecclesiasticus', 16, 17, 'canon', 'romans', 1, 20, 'free', E'Romans 1:20 — *For the invisible things of him from the creation of the world are clearly seen, being understood by the things that are made, even his eternal power and Godhead; so that they are without excuse:* the creation that makes Sirach 16:17''s hiding impossible and leaves none excused.'),
  ('apocrypha', 'ecclesiasticus', 16, 17, 'apocrypha', 'the-wisdom-of-solomon', 12, 12, 'extras', E'Wisdom of Solomon 12:12 — *For who shall say, What have you done? or who shall withstand your judgment? or who shall accuse you for the nations that perish, whom you made? or who shall come to stand against you, to be revenged for the unrighteous men?* The live wisdom sibling pressing the same inescapable judgment Sirach 16:17 sets before the hidden soul.'),
  -- thread: sirach-16-pharaoh-hardened-power-known
  ('apocrypha', 'ecclesiasticus', 16, 15, 'canon', 'exodus', 9, 16, 'free', E'Exodus 9:16 — *And in very deed for this cause have I raised thee up, for to shew in thee my power; and that my name may be declared throughout all the earth.* The Torah purpose behind Sirach 16:15''s hardening of Pharaoh that his works be known.'),
  ('apocrypha', 'ecclesiasticus', 16, 15, 'canon', 'romans', 9, 17, 'free', E'Romans 9:17 — *For the scripture saith unto Pharaoh, Even for this same purpose have I raised thee up, that I might shew my power in thee, and that my name might be declared throughout all the earth.* Paul quoting the same purpose Sirach 16:15 reads in the hardening of Pharaoh.'),
  ('apocrypha', 'ecclesiasticus', 16, 15, 'canon', 'romans', 9, 18, 'free', E'Romans 9:18 — *Therefore hath he mercy on whom he will have mercy, and whom he will he hardeneth.* Paul''s conclusion matching Sirach 16:15''s claim that Yahuah hardened Pharaoh to make his power known.'),
  -- thread: sirach-16-every-man-according-to-his-works
  ('apocrypha', 'ecclesiasticus', 16, 14, 'canon', 'galatians', 6, 7, 'free', E'Galatians 6:7 — *Be not deceived; Elohim (God) is not mocked: for whatsoever a man soweth, that shall he also reap.* Paul''s sowing-and-reaping matches Sirach 16:14: every man finds according to his works.'),
  ('apocrypha', 'ecclesiasticus', 16, 12, 'canon', 'matthew', 16, 27, 'free', E'Matthew 16:27 — *For the Son of Adam shall come in the glory of his Father with his angels; and then he shall reward every man according to his works.* Yahusha names the same judgment-by-works that Sirach 16:12 ascribes to Yahuah.'),
  ('apocrypha', 'ecclesiasticus', 16, 14, 'canon', 'revelation', 22, 12, 'free', E'Revelation 22:12 — *And, behold, I come quickly; and my reward is with me, to give every man according as his work shall be.* The returning King rewards as Sirach 16:14 promises: every man according to his works.'),
  -- thread: sirach-16-pride-and-the-desolate-kindred
  ('apocrypha', 'ecclesiasticus', 16, 8, 'canon', 'proverbs', 16, 18, 'free', E'Proverbs 16:18 — *Pride goeth before destruction, and an haughty spirit before a fall.* Solomon''s law of pride is precisely why Sodom was abhorred for its pride in Sirach 16:8.'),
  ('apocrypha', 'ecclesiasticus', 16, 8, 'apocrypha', 'ecclesiasticus', 10, 13, 'extras', E'Ecclesiasticus 10:13 — *For pride is the beginning of sin, and he that has it shall pour out abomination: and therefore Yahuah (God) brought upon them strange calamities, and overthrew them utterly.* Ben Sira''s own diagnosis self-linking pride=the-beginning-of-sin to the proud abhorred in Sirach 16:8.'),
  ('apocrypha', 'ecclesiasticus', 16, 4, 'canon', 'deuteronomy', 32, 8, 'free', E'Deuteronomy 32:8 — *When the El Elyon (most High) divided to the nations their inheritance, when he separated the sons of Adam, he set the bounds of the people according to the number of the children of Yashar''el (Israel).* The ancient ordering of peoples whose proud breakers, like the wicked kindred of Sirach 16:4, become desolate.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_sir16_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_sir16_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-16-judgments-of-old',
       E'The judgments of old — giants, Sodom, the wilderness',
       E'Ben Sira rehearses the great judgments to warn the proud: *He was not pacified toward the old giants, who fell away in the strength of their foolishness. Neither spared he the place where Lot sojourned, but abhorred them for their pride. He pitied not the people of perdition, who were taken away in their sins: Nor the six hundred thousand footmen, who were gathered together in the hardness of their hearts.* (Ecclesiasticus 16:7-10). It ain''t new — every clause is a Torah memorial. The giants are the antediluvian *mighty men which were of old, men of renown* (Genesis 6:4); the place where Lot sojourned is where *Yahuah (LORD) rained upon Sodom and upon Gomorrah brimstone and fire* (Genesis 19:24); the hard-hearted footmen are the carcasses that *fell away* in the wilderness when *the earth opened her mouth, and swallowed them up, and their houses, and all the men that appertained unto Korah* (Numbers 16:32). The whole catalog is Moses'' own charge to *Remember the days of old, consider the years of many generations* (Deuteronomy 32:7) — the wisdom teacher simply reads the covenant history back as warning.',
       sv.verse_id, ev.verse_id, 'extras', 58675
  FROM _session253_sir16_lookup sv, _session253_sir16_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=16 AND sv.verse_number=6
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=16 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-16-old-giants-watchers',
       E'The old giants who fell away — the Watchers self-link',
       E'The hinge of the chapter''s first judgment is a single line: *He was not pacified toward the old giants, who fell away in the strength of their foolishness* (Ecclesiasticus 16:7). Ben Sira assumes the reader knows the whole story — and the restored library now holds it intact. The giants are Genesis'' *mighty men which were of old, men of renown* (Genesis 6:4), born when *they bare great giants, whose height was three thousand ells* (1 Enoch 7:2), and judged when Yahuah commanded *destroy all the spirits of the reprobate and the children of the Watchers, because they have wronged mankind* (1 Enoch 10:15). The wisdom book, Genesis, and the live Book of the Watchers are one witness: the giants fell away by their own foolish strength, and the Judge was not pacified.',
       sv.verse_id, ev.verse_id, 'extras', 58678
  FROM _session253_sir16_lookup sv, _session253_sir16_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=16 AND sv.verse_number=7
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=16 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-16-none-can-hide',
       E'Say not I will hide myself — the all-seeing Elohim',
       E'Against the soul that thinks itself lost in the crowd, Ben Sira answers: *Say not you, I will hide myself from Yahuah (God): shall any remember me from above? I shall not be remembered among so many people: for what is my soul among such an infinite number of creatures?* (Ecclesiasticus 16:17). It is David''s psalm in prose: *Whither shall I go from thy spirit? or whither shall I flee from thy presence?* (Psalm 139:7), and *If I say, Surely the darkness shall cover me; even the night shall be light about me* (Psalm 139:11). The works of creation themselves leave no man a hiding place, *for the invisible things of him from the creation of the world are clearly seen, being understood by the things that are made, even his eternal power and Godhead; so that they are without excuse* (Romans 1:20). Wisdom of Solomon, the live sibling book, presses the same plea: *who shall withstand your judgment?* (Wisdom of Solomon 12:12).',
       sv.verse_id, ev.verse_id, 'extras', 58681
  FROM _session253_sir16_lookup sv, _session253_sir16_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=16 AND sv.verse_number=17
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=16 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-16-pharaoh-hardened-power-known',
       E'Yahuah hardened Pharaoh, that his power be known',
       E'Among the works of judgment Ben Sira numbers the exodus: *Yahuah (God) hardened Pharaoh, that he should not know him, that his powerful works might be known to the world* (Ecclesiasticus 16:15). This is the Torah''s own stated purpose — *And in very deed for this cause have I raised thee up, for to shew in thee my power; and that my name may be declared throughout all the earth* (Exodus 9:16) — and Paul cites the very verse: *For the scripture saith unto Pharaoh, Even for this same purpose have I raised thee up, that I might shew my power in thee, and that my name might be declared throughout all the earth* (Romans 9:17), concluding *Therefore hath he mercy on whom he will have mercy, and whom he will he hardeneth* (Romans 9:18). The wisdom teacher, Moses, and the apostle agree: the hardening served the revealing of Yahuah''s power to the world.',
       sv.verse_id, ev.verse_id, 'extras', 58684
  FROM _session253_sir16_lookup sv, _session253_sir16_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=16 AND sv.verse_number=15
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=16 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-16-every-man-according-to-his-works',
       E'He judges a man according to his works',
       E'Ben Sira sets the just scale at the center of the chapter: *As his mercy is great, so is his correction also: he judges a man according to his works* (Ecclesiasticus 16:12), and *Make way for every work of mercy: for every man shall find according to his works* (Ecclesiasticus 16:14). It ain''t new — it is the Torah-ethic the apostles carry whole. *Be not deceived; Elohim (God) is not mocked: for whatsoever a man soweth, that shall he also reap* (Galatians 6:7); the Son of Adam *shall reward every man according to his works* (Matthew 16:27); and the returning King declares *my reward is with me, to give every man according as his work shall be* (Revelation 22:12). The wisdom of Sirach and the gospel speak one verdict.',
       sv.verse_id, ev.verse_id, 'extras', 58687
  FROM _session253_sir16_lookup sv, _session253_sir16_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=16 AND sv.verse_number=12
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=16 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-16-pride-and-the-desolate-kindred',
       E'Abhorred for their pride — the desolate kindred',
       E'The judgment-list turns on a single sin: the cities of the plain were *abhorred... for their pride* (Ecclesiasticus 16:8), even as the wicked household is the one whose *kindred... shall speedily become desolate* (Ecclesiasticus 16:4). Solomon''s proverb names the law of it: *Pride goeth before destruction, and an haughty spirit before a fall* (Proverbs 16:18). Sirach itself elsewhere teaches the same root — *For pride is the beginning of sin, and he that has it shall pour out abomination: and therefore Yahuah (God) brought upon them strange calamities, and overthrew them utterly* (Ecclesiasticus 10:13) — the self-link binding chapter 10''s diagnosis to chapter 16''s case-law. And the bounds of nations were set from of old, *when he separated the sons of Adam, he set the bounds of the people according to the number of the children of Yashar''el (Israel)* (Deuteronomy 32:8): the proud who break those bounds become desolate.',
       sv.verse_id, ev.verse_id, 'extras', 58690
  FROM _session253_sir16_lookup sv, _session253_sir16_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=16 AND sv.verse_number=8
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=16 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: sirach-16-judgments-of-old
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:4 — *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown.* These are the old giants Sirach 16:7 says Yahuah was not pacified toward.'
  FROM cross_reference_threads t, cross_references x, _session253_sir16_lookup sv, _session253_sir16_lookup tv
 WHERE t.slug='sirach-16-judgments-of-old'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=16 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 19:24 — *Then Yahuah (LORD) rained upon Sodom and upon Gomorrah brimstone and fire from Yahuah (LORD) out of heaven;* this is the place where Lot sojourned, abhorred for its pride in Sirach 16:8.'
  FROM cross_reference_threads t, cross_references x, _session253_sir16_lookup sv, _session253_sir16_lookup tv
 WHERE t.slug='sirach-16-judgments-of-old'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=16 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=19 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Numbers 16:32 — *And the earth opened her mouth, and swallowed them up, and their houses, and all the men that appertained unto Korah, and all their goods.* The hard-hearted multitude of Sirach 16:10 that perished in the wilderness rebellion.'
  FROM cross_reference_threads t, cross_references x, _session253_sir16_lookup sv, _session253_sir16_lookup tv
 WHERE t.slug='sirach-16-judgments-of-old'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=16 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=16 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 7:2 — *And they became pregnant, and they bare great giants, whose height was three thousand ells:* the now-live Watchers account naming the very old giants whose foolish strength Sirach 16:7 invokes.'
  FROM cross_reference_threads t, cross_references x, _session253_sir16_lookup sv, _session253_sir16_lookup tv
 WHERE t.slug='sirach-16-judgments-of-old'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=16 AND sv.verse_number=7
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=7 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Deuteronomy 32:7 — *Remember the days of old, consider the years of many generations: ask thy father, and he will shew thee; thy elders, and they will tell thee.* The Mosaic charge to recall the old judgments that Sirach 16:6 puts to use against the ungodly congregation.'
  FROM cross_reference_threads t, cross_references x, _session253_sir16_lookup sv, _session253_sir16_lookup tv
 WHERE t.slug='sirach-16-judgments-of-old'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=16 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-16-old-giants-watchers
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:4 — *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown.* The canonical root of Sirach 16:7''s old giants.'
  FROM cross_reference_threads t, cross_references x, _session253_sir16_lookup sv, _session253_sir16_lookup tv
 WHERE t.slug='sirach-16-old-giants-watchers'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=16 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 7:2 — *And they became pregnant, and they bare great giants, whose height was three thousand ells:* the live Watchers narrative supplying the begetting of the giants Sirach 16:7 names.'
  FROM cross_reference_threads t, cross_references x, _session253_sir16_lookup sv, _session253_sir16_lookup tv
 WHERE t.slug='sirach-16-old-giants-watchers'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=16 AND sv.verse_number=7
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=7 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 10:15 — *And destroy all the spirits of the reprobate and the children of the Watchers, because they have wronged mankind.* The decree of judgment behind Sirach 16:7''s giants who fell away unpacified.'
  FROM cross_reference_threads t, cross_references x, _session253_sir16_lookup sv, _session253_sir16_lookup tv
 WHERE t.slug='sirach-16-old-giants-watchers'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=16 AND sv.verse_number=7
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-16-none-can-hide
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 139:7 — *Whither shall I go from thy spirit? or whither shall I flee from thy presence?* David''s question is exactly the conceit Sirach 16:17 forbids — there is no hiding from Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session253_sir16_lookup sv, _session253_sir16_lookup tv
 WHERE t.slug='sirach-16-none-can-hide'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=16 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=139 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 139:11 — *If I say, Surely the darkness shall cover me; even the night shall be light about me.* No darkness conceals the man who imagines himself forgotten in Sirach 16:17.'
  FROM cross_reference_threads t, cross_references x, _session253_sir16_lookup sv, _session253_sir16_lookup tv
 WHERE t.slug='sirach-16-none-can-hide'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=16 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=139 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 1:20 — *For the invisible things of him from the creation of the world are clearly seen, being understood by the things that are made, even his eternal power and Godhead; so that they are without excuse:* the creation that makes Sirach 16:17''s hiding impossible and leaves none excused.'
  FROM cross_reference_threads t, cross_references x, _session253_sir16_lookup sv, _session253_sir16_lookup tv
 WHERE t.slug='sirach-16-none-can-hide'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=16 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=1 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Wisdom of Solomon 12:12 — *For who shall say, What have you done? or who shall withstand your judgment? or who shall accuse you for the nations that perish, whom you made? or who shall come to stand against you, to be revenged for the unrighteous men?* The live wisdom sibling pressing the same inescapable judgment Sirach 16:17 sets before the hidden soul.'
  FROM cross_reference_threads t, cross_references x, _session253_sir16_lookup sv, _session253_sir16_lookup tv
 WHERE t.slug='sirach-16-none-can-hide'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=16 AND sv.verse_number=17
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=12 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-16-pharaoh-hardened-power-known
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 9:16 — *And in very deed for this cause have I raised thee up, for to shew in thee my power; and that my name may be declared throughout all the earth.* The Torah purpose behind Sirach 16:15''s hardening of Pharaoh that his works be known.'
  FROM cross_reference_threads t, cross_references x, _session253_sir16_lookup sv, _session253_sir16_lookup tv
 WHERE t.slug='sirach-16-pharaoh-hardened-power-known'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=16 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=9 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 9:17 — *For the scripture saith unto Pharaoh, Even for this same purpose have I raised thee up, that I might shew my power in thee, and that my name might be declared throughout all the earth.* Paul quoting the same purpose Sirach 16:15 reads in the hardening of Pharaoh.'
  FROM cross_reference_threads t, cross_references x, _session253_sir16_lookup sv, _session253_sir16_lookup tv
 WHERE t.slug='sirach-16-pharaoh-hardened-power-known'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=16 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=9 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 9:18 — *Therefore hath he mercy on whom he will have mercy, and whom he will he hardeneth.* Paul''s conclusion matching Sirach 16:15''s claim that Yahuah hardened Pharaoh to make his power known.'
  FROM cross_reference_threads t, cross_references x, _session253_sir16_lookup sv, _session253_sir16_lookup tv
 WHERE t.slug='sirach-16-pharaoh-hardened-power-known'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=16 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=9 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-16-every-man-according-to-his-works
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Galatians 6:7 — *Be not deceived; Elohim (God) is not mocked: for whatsoever a man soweth, that shall he also reap.* Paul''s sowing-and-reaping matches Sirach 16:14: every man finds according to his works.'
  FROM cross_reference_threads t, cross_references x, _session253_sir16_lookup sv, _session253_sir16_lookup tv
 WHERE t.slug='sirach-16-every-man-according-to-his-works'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=16 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=6 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 16:27 — *For the Son of Adam shall come in the glory of his Father with his angels; and then he shall reward every man according to his works.* Yahusha names the same judgment-by-works that Sirach 16:12 ascribes to Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session253_sir16_lookup sv, _session253_sir16_lookup tv
 WHERE t.slug='sirach-16-every-man-according-to-his-works'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=16 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=16 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 22:12 — *And, behold, I come quickly; and my reward is with me, to give every man according as his work shall be.* The returning King rewards as Sirach 16:14 promises: every man according to his works.'
  FROM cross_reference_threads t, cross_references x, _session253_sir16_lookup sv, _session253_sir16_lookup tv
 WHERE t.slug='sirach-16-every-man-according-to-his-works'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=16 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-16-pride-and-the-desolate-kindred
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 16:18 — *Pride goeth before destruction, and an haughty spirit before a fall.* Solomon''s law of pride is precisely why Sodom was abhorred for its pride in Sirach 16:8.'
  FROM cross_reference_threads t, cross_references x, _session253_sir16_lookup sv, _session253_sir16_lookup tv
 WHERE t.slug='sirach-16-pride-and-the-desolate-kindred'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=16 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=16 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ecclesiasticus 10:13 — *For pride is the beginning of sin, and he that has it shall pour out abomination: and therefore Yahuah (God) brought upon them strange calamities, and overthrew them utterly.* Ben Sira''s own diagnosis self-linking pride=the-beginning-of-sin to the proud abhorred in Sirach 16:8.'
  FROM cross_reference_threads t, cross_references x, _session253_sir16_lookup sv, _session253_sir16_lookup tv
 WHERE t.slug='sirach-16-pride-and-the-desolate-kindred'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=16 AND sv.verse_number=8
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=10 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 32:8 — *When the El Elyon (most High) divided to the nations their inheritance, when he separated the sons of Adam, he set the bounds of the people according to the number of the children of Yashar''el (Israel).* The ancient ordering of peoples whose proud breakers, like the wicked kindred of Sirach 16:4, become desolate.'
  FROM cross_reference_threads t, cross_references x, _session253_sir16_lookup sv, _session253_sir16_lookup tv
 WHERE t.slug='sirach-16-pride-and-the-desolate-kindred'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=16 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

