-- ----- fragment: minion_ecclesiasticus_42.sql (session253 ecclesiasticus 42) -----
-- Source anchor: apocrypha/ecclesiasticus ch42. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: sir42 (view _session253_sir42_lookup). Sort band base 59325, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_sir42_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: sirach-42-not-ashamed-of-the-law
  ('apocrypha', 'ecclesiasticus', 42, 2, 'canon', 'romans', 1, 16, 'free', E'Romans 1:16 — *For I am not ashamed of the gospel of Messiah (Christ): for it is the power of Elohim (God) unto salvation to every one that believeth; to the Yahudi (Jew) first, and also to the Greek.* Paul''s unashamed boast echoes Sirach 42:2''s call to feel no shame for the law of the Most High and his covenant.'),
  ('apocrypha', 'ecclesiasticus', 42, 2, 'canon', 'mark', 8, 38, 'free', E'Mark 8:38 — *Whosoever therefore shall be ashamed of me and of my words in this adulterous and sinful generation; of him also shall the Son of Adam be ashamed, when he cometh in the glory of his Father with the holy angels.* Messiah turns the shame the other way, confirming Sirach 42:2 that to be ashamed of the covenant is itself the sin.'),
  ('apocrypha', 'ecclesiasticus', 42, 2, 'canon', 'psalms', 19, 8, 'free', E'Psalms 19:8 — *The statutes of Yahuah (LORD) are right, rejoicing the heart: the commandment of Yahuah (LORD) is pure, enlightening the eyes.* The law that rejoices the heart is precisely the law of the Most High that Sirach 42:2 says is no cause for shame.'),
  -- thread: sirach-42-works-full-of-glory
  ('apocrypha', 'ecclesiasticus', 42, 16, 'canon', 'psalms', 19, 1, 'free', E'Psalms 19:1 — *The heavens declare the glory of Elohim (God); and the firmament sheweth his handywork.* David''s declaring heavens match Sirach 42:16''s sun whose work is full of the glory of Yahuah.'),
  ('apocrypha', 'ecclesiasticus', 42, 16, 'canon', 'psalms', 19, 6, 'free', E'Psalms 19:6 — *His going forth is from the end of the heaven, and his circuit unto the ends of it: and there is nothing hid from the heat thereof.* The sun that looketh upon all things in Sirach 42:16 runs the very circuit David traces, missing nothing under heaven.'),
  -- thread: sirach-42-he-knoweth-all
  ('apocrypha', 'ecclesiasticus', 42, 18, 'canon', 'psalms', 139, 2, 'free', E'Psalms 139:2 — *Thou knowest my downsitting and mine uprising, thou understandest my thought afar off.* David''s searched-out thought is the same heart that Sirach 42:18 says Yahuah seeks out and fully knows.'),
  ('apocrypha', 'ecclesiasticus', 42, 20, 'canon', 'hebrews', 4, 13, 'free', E'Hebrews 4:13 — *Neither is there any creature that is not manifest in his sight: but all things are naked and opened unto the eyes of him with whom we have to do.* This naked-and-opened sight is exactly Sirach 42:20''s truth that no thought escapes him and no word is hidden.'),
  -- thread: sirach-42-nothing-added-nor-diminished
  ('apocrypha', 'ecclesiasticus', 42, 21, 'canon', 'deuteronomy', 4, 2, 'free', E'Deuteronomy 4:2 — *Ye shall not add unto the word which I command you, neither shall ye diminish ought from it, that ye may keep the commandments of Yahuah Elohaychem (the LORD your God) which I command you.* Moses'' add-nothing, diminish-nothing law is the same seal Sirach 42:21 sets on the works that admit nothing added nor diminished.'),
  ('apocrypha', 'ecclesiasticus', 42, 21, 'canon', 'ecclesiastes', 3, 14, 'free', E'Ecclesiastes 3:14 — *I know that, whatsoever Elohim (God) doeth, it shall be for ever: nothing can be put to it, nor any thing taken from it: and Elohim (God) doeth it, that men should fear before him.* Qoheleth''s everlasting, untouchable work is Sirach 42:21''s exact claim that nothing can be added to nor diminished from what Yahuah makes.'),
  -- thread: sirach-42-works-of-his-wisdom
  ('apocrypha', 'ecclesiasticus', 42, 21, 'apocrypha', 'ecclesiasticus', 24, 9, 'extras', E'Ecclesiasticus 24:9 — *He created me from the beginning before the world, and I shall never fail.* Ben Sira''s own Wisdom hymn names the pre-created Wisdom whose excellent works Sirach 42:21 says Yahuah has garnished.'),
  ('apocrypha', 'ecclesiasticus', 42, 21, 'apocrypha', 'the-wisdom-of-solomon', 7, 27, 'extras', E'Wisdom of Solomon 7:27 — *And being but one, she can do all things: and remaining in herself, she makes all things new: and in all ages entering into holy souls, she makes them friends of Yahuah (God), and prophets.* Solomon''s all-working Wisdom is the same wisdom whose works Sirach 42:21 calls excellent and garnished.'),
  ('apocrypha', 'ecclesiasticus', 42, 15, 'canon', 'proverbs', 8, 22, 'free', E'Proverbs 8:22 — *Yahuah (LORD) possessed me in the beginning of his way, before his works of old.* The Wisdom standing beside the Maker before his works of old is the very Wisdom whose works Sirach 42:15 sets out to remember and declare.'),
  -- thread: sirach-42-all-things-double
  ('apocrypha', 'ecclesiasticus', 42, 24, 'apocrypha', 'the-wisdom-of-solomon', 7, 22, 'extras', E'Wisdom of Solomon 7:22 — *For wisdom, which is the worker of all things, taught me: for in her is an understanding spirit holy, one only, manifold, subtil, lively, clear, undefiled, plain, not subject to hurt, loving the thing that is good quick, which cannot be letted, ready to do good,* Solomon''s Wisdom, worker of all things, is the ordering hand behind Sirach 42:24''s paired creation in which nothing is made imperfect.'),
  ('apocrypha', 'ecclesiasticus', 42, 25, 'canon', 'psalms', 139, 14, 'free', E'Psalms 139:14 — *I will praise thee; for I am fearfully and wonderfully made: marvellous are thy works; and that my soul knoweth right well.* David''s wonder at the perfection of his own making answers Sirach 42:25''s question of who can be filled with beholding so marvellous a glory.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_sir42_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_sir42_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-42-not-ashamed-of-the-law',
       E'Be not ashamed of the law and the covenant',
       E'Ben Sira draws the line of holy shame: *Of these things be not you ashamed, and accept no person to sin thereby:* (Ecclesiasticus 42:1) — *Of the law of the Most High, and his covenant; and of judgment to justify the ungodly;* (Ecclesiasticus 42:2). The Torah and the covenant are never a thing to blush at; the only shame is to break them. It ain''t new: Paul carries the same boast — *For I am not ashamed of the gospel of Messiah (Christ): for it is the power of Elohim (God) unto salvation to every one that believeth; to the Yahudi (Jew) first, and also to the Greek.* (Romans 1:16). Messiah turns the shame the other way — *Whosoever therefore shall be ashamed of me and of my words in this adulterous and sinful generation; of him also shall the Son of Adam be ashamed, when he cometh in the glory of his Father with the holy angels.* (Mark 8:38) — and the psalmist names why there is nothing to be ashamed of: *The statutes of Yahuah (LORD) are right, rejoicing the heart: the commandment of Yahuah (LORD) is pure, enlightening the eyes.* (Psalms 19:8). The law stands; it is never the curse but the joy of the covenant.',
       sv.verse_id, ev.verse_id, 'extras', 59325
  FROM _session253_sir42_lookup sv, _session253_sir42_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=42 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=42 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-42-works-full-of-glory',
       E'The sun looks on all things, full of the glory of Yahuah',
       E'Ben Sira opens the great creation hymn: *I will now remember the works of Yahuah (God), and declare the things that I have seen: In the words of Yahuah (God) are his works.* (Ecclesiasticus 42:15) — *The sun that gives light looketh upon all things, and the work thereof is full of the glory of Yahuah (God).* (Ecclesiasticus 42:16). The sun is no idol but a witness, brimming with the Maker''s glory. It ain''t new: David sang the same firmament-song — *The heavens declare the glory of Elohim (God); and the firmament sheweth his handywork.* (Psalms 19:1) — and traced the sun''s circuit that hides nothing — *His going forth is from the end of the heaven, and his circuit unto the ends of it: and there is nothing hid from the heat thereof.* (Psalms 19:6). Creation speaks the word of its Maker.',
       sv.verse_id, ev.verse_id, 'extras', 59328
  FROM _session253_sir42_lookup sv, _session253_sir42_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=42 AND sv.verse_number=15
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=42 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-42-he-knoweth-all',
       E'He seeks out the deep and the heart; no thought escapes him',
       E'Ben Sira measures the divine omniscience: *He seeks out the deep, and the heart, and considereth their crafty devices: for Yahuah (God) knoweth all that may be known, and he beholds the signs of the world.* (Ecclesiasticus 42:18) — *No thought escapeth him, neither any word is hidden from him.* (Ecclesiasticus 42:20). The deep places and the secret heart lie open before him. It ain''t new: David already knew this searching gaze — *Thou knowest my downsitting and mine uprising, thou understandest my thought afar off.* (Psalms 139:2) — and Hebrews seals it for the day of reckoning — *Neither is there any creature that is not manifest in his sight: but all things are naked and opened unto the eyes of him with whom we have to do.* (Hebrews 4:13). The heart is never hidden from its Maker.',
       sv.verse_id, ev.verse_id, 'extras', 59331
  FROM _session253_sir42_lookup sv, _session253_sir42_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=42 AND sv.verse_number=18
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=42 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-42-nothing-added-nor-diminished',
       E'Nothing may be added, neither can he be diminished',
       E'Ben Sira closes on the perfection and permanence of the works of Yahuah: *He has garnished the excellent works of his wisdom, and he is from everlasting to everlasting: to him may nothing be added, neither can he be diminished, and he has no need of any counsellor.* (Ecclesiasticus 42:21). What the Most High makes is finished, unimprovable, eternal. It ain''t new: Moses set the same seal on the Torah — *Ye shall not add unto the word which I command you, neither shall ye diminish ought from it, that ye may keep the commandments of Yahuah Elohaychem (the LORD your God) which I command you.* (Deuteronomy 4:2) — and Qoheleth on the works of Elohim — *I know that, whatsoever Elohim (God) doeth, it shall be for ever: nothing can be put to it, nor any thing taken from it: and Elohim (God) doeth it, that men should fear before him.* (Ecclesiastes 3:14). The word and the work alike are complete; neither admits addition nor subtraction.',
       sv.verse_id, ev.verse_id, 'extras', 59334
  FROM _session253_sir42_lookup sv, _session253_sir42_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=42 AND sv.verse_number=21
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=42 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-42-works-of-his-wisdom',
       E'The excellent works of his wisdom',
       E'Ben Sira frames the whole creation hymn as the labour of Wisdom: he remembers *the works of Yahuah (God)* (Ecclesiasticus 42:15) and confesses *He has garnished the excellent works of his wisdom* (Ecclesiasticus 42:21). The same Formed Wisdom that ordered creation runs through the deuterocanon''s own witness. It ain''t new even within the library: Ben Sira himself sang her elsewhere — *He created me from the beginning before the world, and I shall never fail.* (Ecclesiasticus 24:9) — and Solomon named her the craftsman of all — *And being but one, she can do all things: and remaining in herself, she makes all things new: and in all ages entering into holy souls, she makes them friends of Yahuah (God), and prophets.* (Wisdom of Solomon 7:27). Proverbs already set her beside the Maker at the founding of the world — *Yahuah (LORD) possessed me in the beginning of his way, before his works of old.* (Proverbs 8:22). The works of his wisdom are no afterthought; Wisdom was there from the beginning.',
       sv.verse_id, ev.verse_id, 'extras', 59337
  FROM _session253_sir42_lookup sv, _session253_sir42_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=42 AND sv.verse_number=15
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=42 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-42-all-things-double',
       E'All things double; nothing imperfect',
       E'Ben Sira reads the design of creation as paired and perfect: *All these things live and remain for ever for all uses, and they are all obedient.* (Ecclesiasticus 42:23) — *All things are double one against another: and he has made nothing imperfect.* (Ecclesiasticus 42:24) — and ends in worship: *One thing establishes the good or another: and who shall be filled with beholding his glory?* (Ecclesiasticus 42:25). The Maker''s order is complete, paired, and obedient. It ain''t new: Solomon already confessed the obedient harmony of the elements ordered by Wisdom — *For wisdom, which is the worker of all things, taught me: for in her is an understanding spirit holy, one only, manifold, subtil, lively, clear, undefiled, plain, not subject to hurt, loving the thing that is good quick, which cannot be letted, ready to do good,* (Wisdom of Solomon 7:22) — and David, beholding the wonder of his own framing, cried the same unfinished praise — *I will praise thee; for I am fearfully and wonderfully made: marvellous are thy works; and that my soul knoweth right well.* (Psalms 139:14). None can be filled with beholding a glory so perfectly wrought.',
       sv.verse_id, ev.verse_id, 'extras', 59340
  FROM _session253_sir42_lookup sv, _session253_sir42_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=42 AND sv.verse_number=23
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=42 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: sirach-42-not-ashamed-of-the-law
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Romans 1:16 — *For I am not ashamed of the gospel of Messiah (Christ): for it is the power of Elohim (God) unto salvation to every one that believeth; to the Yahudi (Jew) first, and also to the Greek.* Paul''s unashamed boast echoes Sirach 42:2''s call to feel no shame for the law of the Most High and his covenant.'
  FROM cross_reference_threads t, cross_references x, _session253_sir42_lookup sv, _session253_sir42_lookup tv
 WHERE t.slug='sirach-42-not-ashamed-of-the-law'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=42 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=1 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Mark 8:38 — *Whosoever therefore shall be ashamed of me and of my words in this adulterous and sinful generation; of him also shall the Son of Adam be ashamed, when he cometh in the glory of his Father with the holy angels.* Messiah turns the shame the other way, confirming Sirach 42:2 that to be ashamed of the covenant is itself the sin.'
  FROM cross_reference_threads t, cross_references x, _session253_sir42_lookup sv, _session253_sir42_lookup tv
 WHERE t.slug='sirach-42-not-ashamed-of-the-law'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=42 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=8 AND tv.verse_number=38
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalms 19:8 — *The statutes of Yahuah (LORD) are right, rejoicing the heart: the commandment of Yahuah (LORD) is pure, enlightening the eyes.* The law that rejoices the heart is precisely the law of the Most High that Sirach 42:2 says is no cause for shame.'
  FROM cross_reference_threads t, cross_references x, _session253_sir42_lookup sv, _session253_sir42_lookup tv
 WHERE t.slug='sirach-42-not-ashamed-of-the-law'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=42 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-42-works-full-of-glory
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalms 19:1 — *The heavens declare the glory of Elohim (God); and the firmament sheweth his handywork.* David''s declaring heavens match Sirach 42:16''s sun whose work is full of the glory of Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session253_sir42_lookup sv, _session253_sir42_lookup tv
 WHERE t.slug='sirach-42-works-full-of-glory'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=42 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalms 19:6 — *His going forth is from the end of the heaven, and his circuit unto the ends of it: and there is nothing hid from the heat thereof.* The sun that looketh upon all things in Sirach 42:16 runs the very circuit David traces, missing nothing under heaven.'
  FROM cross_reference_threads t, cross_references x, _session253_sir42_lookup sv, _session253_sir42_lookup tv
 WHERE t.slug='sirach-42-works-full-of-glory'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=42 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-42-he-knoweth-all
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalms 139:2 — *Thou knowest my downsitting and mine uprising, thou understandest my thought afar off.* David''s searched-out thought is the same heart that Sirach 42:18 says Yahuah seeks out and fully knows.'
  FROM cross_reference_threads t, cross_references x, _session253_sir42_lookup sv, _session253_sir42_lookup tv
 WHERE t.slug='sirach-42-he-knoweth-all'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=42 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=139 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 4:13 — *Neither is there any creature that is not manifest in his sight: but all things are naked and opened unto the eyes of him with whom we have to do.* This naked-and-opened sight is exactly Sirach 42:20''s truth that no thought escapes him and no word is hidden.'
  FROM cross_reference_threads t, cross_references x, _session253_sir42_lookup sv, _session253_sir42_lookup tv
 WHERE t.slug='sirach-42-he-knoweth-all'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=42 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=4 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-42-nothing-added-nor-diminished
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 4:2 — *Ye shall not add unto the word which I command you, neither shall ye diminish ought from it, that ye may keep the commandments of Yahuah Elohaychem (the LORD your God) which I command you.* Moses'' add-nothing, diminish-nothing law is the same seal Sirach 42:21 sets on the works that admit nothing added nor diminished.'
  FROM cross_reference_threads t, cross_references x, _session253_sir42_lookup sv, _session253_sir42_lookup tv
 WHERE t.slug='sirach-42-nothing-added-nor-diminished'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=42 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=4 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ecclesiastes 3:14 — *I know that, whatsoever Elohim (God) doeth, it shall be for ever: nothing can be put to it, nor any thing taken from it: and Elohim (God) doeth it, that men should fear before him.* Qoheleth''s everlasting, untouchable work is Sirach 42:21''s exact claim that nothing can be added to nor diminished from what Yahuah makes.'
  FROM cross_reference_threads t, cross_references x, _session253_sir42_lookup sv, _session253_sir42_lookup tv
 WHERE t.slug='sirach-42-nothing-added-nor-diminished'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=42 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=3 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-42-works-of-his-wisdom
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ecclesiasticus 24:9 — *He created me from the beginning before the world, and I shall never fail.* Ben Sira''s own Wisdom hymn names the pre-created Wisdom whose excellent works Sirach 42:21 says Yahuah has garnished.'
  FROM cross_reference_threads t, cross_references x, _session253_sir42_lookup sv, _session253_sir42_lookup tv
 WHERE t.slug='sirach-42-works-of-his-wisdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=42 AND sv.verse_number=21
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=24 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Wisdom of Solomon 7:27 — *And being but one, she can do all things: and remaining in herself, she makes all things new: and in all ages entering into holy souls, she makes them friends of Yahuah (God), and prophets.* Solomon''s all-working Wisdom is the same wisdom whose works Sirach 42:21 calls excellent and garnished.'
  FROM cross_reference_threads t, cross_references x, _session253_sir42_lookup sv, _session253_sir42_lookup tv
 WHERE t.slug='sirach-42-works-of-his-wisdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=42 AND sv.verse_number=21
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=7 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 8:22 — *Yahuah (LORD) possessed me in the beginning of his way, before his works of old.* The Wisdom standing beside the Maker before his works of old is the very Wisdom whose works Sirach 42:15 sets out to remember and declare.'
  FROM cross_reference_threads t, cross_references x, _session253_sir42_lookup sv, _session253_sir42_lookup tv
 WHERE t.slug='sirach-42-works-of-his-wisdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=42 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=8 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-42-all-things-double
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Wisdom of Solomon 7:22 — *For wisdom, which is the worker of all things, taught me: for in her is an understanding spirit holy, one only, manifold, subtil, lively, clear, undefiled, plain, not subject to hurt, loving the thing that is good quick, which cannot be letted, ready to do good,* Solomon''s Wisdom, worker of all things, is the ordering hand behind Sirach 42:24''s paired creation in which nothing is made imperfect.'
  FROM cross_reference_threads t, cross_references x, _session253_sir42_lookup sv, _session253_sir42_lookup tv
 WHERE t.slug='sirach-42-all-things-double'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=42 AND sv.verse_number=24
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=7 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalms 139:14 — *I will praise thee; for I am fearfully and wonderfully made: marvellous are thy works; and that my soul knoweth right well.* David''s wonder at the perfection of his own making answers Sirach 42:25''s question of who can be filled with beholding so marvellous a glory.'
  FROM cross_reference_threads t, cross_references x, _session253_sir42_lookup sv, _session253_sir42_lookup tv
 WHERE t.slug='sirach-42-all-things-double'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=42 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=139 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

