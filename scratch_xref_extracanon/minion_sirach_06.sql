-- ----- fragment: minion_ecclesiasticus_06.sql (session253 ecclesiasticus 6) -----
-- Source anchor: apocrypha/ecclesiasticus ch6. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: sir06 (view _session253_sir06_lookup). Sort band base 58425, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_sir06_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ecclesiasticus-6-double-tongue
  ('apocrypha', 'ecclesiasticus', 6, 1, 'canon', 'psalms', 12, 2, 'free', E'Psalm 12:2 — *They speak vanity every one with his neighbour: with flattering lips and with a double heart do they speak.* The double heart of David''s psalm is Ben Sira''s "double tongue" that turns a friend into an enemy in Sirach 6:1.'),
  ('apocrypha', 'ecclesiasticus', 6, 1, 'canon', 'james', 3, 8, 'free', E'James 3:8 — *But the tongue can no man tame; it is an unruly evil, full of deadly poison.* The Messiah''s brother frames the untamed tongue exactly as Ben Sira does in Sirach 6:1 — the instrument that breeds shame and reproach.'),
  ('apocrypha', 'ecclesiasticus', 6, 1, 'canon', 'james', 3, 10, 'free', E'James 3:10 — *Out of the same mouth proceedeth blessing and cursing. My brethren, these things ought not so to be.* James names the very double-mouthedness of the "double tongue" of Sirach 6:1 — blessing and cursing cannot share one tongue.'),
  ('apocrypha', 'ecclesiasticus', 6, 5, 'canon', 'matthew', 12, 35, 'free', E'Matthew 12:35 — *A good man out of the good treasure of the heart bringeth forth good things: and an evil man out of the evil treasure bringeth forth evil things.* The Messiah roots the "sweet language" of Sirach 6:5 where Ben Sira does — in the treasure of the heart that the tongue spends.'),
  -- thread: ecclesiasticus-6-prove-a-friend
  ('apocrypha', 'ecclesiasticus', 6, 6, 'canon', 'proverbs', 18, 24, 'free', E'Proverbs 18:24 — *A man that hath friends must shew himself friendly: and there is a friend that sticketh closer than a brother.* The proverb''s "friend that sticketh closer than a brother" is the rare one-of-a-thousand counsellor Ben Sira tells you to seek in Sirach 6:6.'),
  ('apocrypha', 'ecclesiasticus', 6, 7, 'canon', 'proverbs', 27, 6, 'free', E'Proverbs 27:6 — *Faithful are the wounds of a friend; but the kisses of an enemy are deceitful.* Proverbs gives the test Ben Sira commands in Sirach 6:7 — prove a friend by whether his honest wounds outlast a flatterer''s kisses.'),
  ('apocrypha', 'ecclesiasticus', 6, 8, 'canon', 'proverbs', 13, 20, 'free', E'Proverbs 13:20 — *He that walketh with wise men shall be wise: but a companion of fools shall be destroyed.* The fair-weather "friend for his own occasion" of Sirach 6:8 is the companion of fools who is destroyed in the day of trouble.'),
  -- thread: ecclesiasticus-6-faithful-friend
  ('apocrypha', 'ecclesiasticus', 6, 14, 'canon', 'proverbs', 17, 17, 'free', E'Proverbs 17:17 — *A friend loveth at all times, and a brother is born for adversity.* Solomon''s friend who loves at all times is Ben Sira''s "strong defence" and "treasure" — the faithful friend of Sirach 6:14.'),
  ('apocrypha', 'ecclesiasticus', 6, 16, 'canon', 'john', 15, 13, 'free', E'John 15:13 — *Greater love hath no man than this, that a man lay down his life for his friends.* The Messiah''s laid-down life is the medicine-of-life friendship of Sirach 6:16 carried to its fullest measure.'),
  ('apocrypha', 'ecclesiasticus', 6, 16, 'canon', 'john', 15, 15, 'free', E'John 15:15 — *Henceforth I call you not servants; for the servant knoweth not what his lord doeth: but I have called you friends; for all things that I have heard of my Father I have made known unto you.* He who fears the Father names His own as friends — the faithful friend that those who fear Yahuah shall find in Sirach 6:16.'),
  ('apocrypha', 'ecclesiasticus', 6, 17, 'canon', 'proverbs', 9, 10, 'free', E'Proverbs 9:10 — *The fear of Yahuah (LORD) is the beginning of wisdom: and the knowledge of the holy is understanding.* Ben Sira anchors right friendship in the fear of Yahuah in Sirach 6:17 — the same fear Proverbs calls the beginning of wisdom.'),
  -- thread: ecclesiasticus-6-plow-and-seek-wisdom
  ('apocrypha', 'ecclesiasticus', 6, 19, 'canon', 'proverbs', 8, 17, 'free', E'Proverbs 8:17 — *I love them that love me; and those that seek me early shall find me.* Wisdom herself answers the plower and sower of Sirach 6:19 — those who seek her early eat of her fruits soon.'),
  ('apocrypha', 'ecclesiasticus', 6, 27, 'canon', 'proverbs', 2, 4, 'free', E'Proverbs 2:4 — *If thou seekest her as silver, and searchest for her as for hid treasures;* Solomon''s command to search for wisdom as for hid treasure is Ben Sira''s "Search, and seek" and "let her not go" of Sirach 6:27.'),
  ('apocrypha', 'ecclesiasticus', 6, 19, 'apocrypha', 'the-wisdom-of-solomon', 6, 14, 'extras', E'Wisdom of Solomon 6:14 — *Whoso seeks her early shall have no great travail: for he shall find her sitting at his doors.* The sibling wisdom book echoes Sirach 6:19 verse for verse — the early seeker toils little and finds her near at hand.'),
  ('apocrypha', 'ecclesiasticus', 6, 18, 'canon', 'james', 1, 5, 'free', E'James 1:5 — *If any of you lack wisdom, let him ask of Elohim (God), that giveth to all men liberally, and upbraideth not; and it shall be given him.* James makes the youthful gathering of instruction in Sirach 6:18 a matter of asking the Giver who upbraids not.'),
  -- thread: ecclesiasticus-6-yoke-of-wisdom
  ('apocrypha', 'ecclesiasticus', 6, 25, 'canon', 'matthew', 11, 29, 'free', E'Matthew 11:29 — *Take my yoke upon you, and learn of me; for I am meek and lowly in heart: and ye shall find rest unto your souls.* The bowed shoulder bearing Wisdom''s bonds in Sirach 6:25 is the Messiah''s yoke that gives rest to the soul.'),
  ('apocrypha', 'ecclesiasticus', 6, 25, 'canon', 'matthew', 11, 30, 'free', E'Matthew 11:30 — *For my yoke is easy, and my burden is light.* Ben Sira''s promise that Wisdom''s bonds need not grieve you in Sirach 6:25 is the Messiah''s easy yoke and light burden.'),
  ('apocrypha', 'ecclesiasticus', 6, 29, 'apocrypha', 'the-wisdom-of-solomon', 7, 14, 'extras', E'Wisdom of Solomon 7:14 — *For she is a treasure to men that never fails: which they that use become the friends of Yahuah (God), being commended for the gifts that come from learning.* The sibling book turns Wisdom''s chains into the same treasure and robe of glory as Sirach 6:29 — and back to the friendship theme of the chapter.'),
  -- thread: ecclesiasticus-6-elders-and-commandments
  ('apocrypha', 'ecclesiasticus', 6, 37, 'canon', 'psalms', 1, 2, 'free', E'Psalm 1:2 — *But his delight is in the law of Yahuah (LORD); and in his law doth he meditate day and night.* Ben Sira''s command to meditate continually in His commandments in Sirach 6:37 is the delight and day-and-night meditation of the blessed man.'),
  ('apocrypha', 'ecclesiasticus', 6, 37, 'canon', 'deuteronomy', 6, 6, 'free', E'Deuteronomy 6:6 — *And these words, which I command thee this day, shall be in thine heart:* The Shema''s charge to carry Yahuah''s words in the heart is the established heart Ben Sira promises in Sirach 6:37.'),
  ('apocrypha', 'ecclesiasticus', 6, 37, 'canon', 'proverbs', 1, 7, 'free', E'Proverbs 1:7 — *The fear of Yahuah (LORD) is the beginning of knowledge: but fools despise wisdom and instruction.* The mind fixed on Yahuah''s ordinances in Sirach 6:37 receives wisdom because the fear of Yahuah is where all knowledge begins.'),
  ('apocrypha', 'ecclesiasticus', 6, 34, 'canon', 'psalms', 1, 3, 'free', E'Psalm 1:3 — *And he shall be like a tree planted by the rivers of water, that bringeth forth his fruit in his season; his leaf also shall not wither; and whatsoever he doeth shall prosper.* He who cleaves to the wise elders of Sirach 6:34 becomes the fruitful, unwithering tree — the opposite of the dry tree of Sirach 6:3.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_sir06_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_sir06_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-6-double-tongue',
       E'The double tongue and the sweet word',
       E'Ben Sira opens the chapter weighing the power of the tongue to make either an enemy or a friend: *Instead of a friend become not an enemy; for thereby you shall inherit an ill name, shame, and reproach: even so shall a sinner that has a double tongue.* (Ecclesiasticus 6:1), where instead *Sweet language will multiply friends: and a fairspeaking tongue will increase kind greetings.* (Ecclesiasticus 6:5). This is the same wisdom David sang against — *They speak vanity every one with his neighbour: with flattering lips and with a double heart do they speak.* (Psalm 12:2) — and the same the half-brother of the Messiah would carry into the assembly: *But the tongue can no man tame; it is an unruly evil, full of deadly poison.* (James 3:8), and *Out of the same mouth proceedeth blessing and cursing. My brethren, these things ought not so to be.* (James 3:10). It ain''t new — the Messiah Himself measured a man by the treasure of his words: *A good man out of the good treasure of the heart bringeth forth good things: and an evil man out of the evil treasure bringeth forth evil things.* (Matthew 12:35).',
       sv.verse_id, ev.verse_id, 'extras', 58425
  FROM _session253_sir06_lookup sv, _session253_sir06_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=6 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=6 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-6-prove-a-friend',
       E'Prove a friend before you trust',
       E'Ben Sira counsels patience before trust: *Be in peace with many: nevertheless have but one counsellor of a thousand.* (Ecclesiasticus 6:6), and *If you would get a friend, prove him first and be not hasty to credit him.* (Ecclesiasticus 6:7), for *some man is a friend for his own occasion, and will not abide in the day of your trouble.* (Ecclesiasticus 6:8). This is Proverbs'' own warning that crowds are not company — *A man that hath friends must shew himself friendly: and there is a friend that sticketh closer than a brother.* (Proverbs 18:24) — and that the wounds of a true friend are to be preferred to a false one''s flattery: *Faithful are the wounds of a friend; but the kisses of an enemy are deceitful.* (Proverbs 27:6). The wise are known by their walking partners: *He that walketh with wise men shall be wise: but a companion of fools shall be destroyed.* (Proverbs 13:20) — the iron that proves and sharpens.',
       sv.verse_id, ev.verse_id, 'extras', 58428
  FROM _session253_sir06_lookup sv, _session253_sir06_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=6 AND sv.verse_number=6
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=6 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-6-faithful-friend',
       E'A faithful friend is the medicine of life',
       E'The chapter''s crown: *A faithfull friend is a strong defence: and he that has found such an one has found a treasure.* (Ecclesiasticus 6:14), *Nothing does countervail a faithful friend, and his excellency is invaluable.* (Ecclesiasticus 6:15), and *A faithful friend is the medicine of life; and they that fear Yahuah (God) shall find him.* (Ecclesiasticus 6:16). This is Solomon''s friend that does not turn with the seasons — *A friend loveth at all times, and a brother is born for adversity.* (Proverbs 17:17) — and it is the very love the Messiah named the greatest, the love that lays itself down: *Greater love hath no man than this, that a man lay down his life for his friends.* (John 15:13). He who is the faithful Friend then names His own: *Henceforth I call you not servants; for the servant knoweth not what his lord doeth: but I have called you friends; for all things that I have heard of my Father I have made known unto you.* (John 15:15). It ain''t new — and notice Ben Sira binds the true friend to the fear of Yahuah, the beginning of all wisdom: *The fear of Yahuah (LORD) is the beginning of wisdom: and the knowledge of the holy is understanding.* (Proverbs 9:10).',
       sv.verse_id, ev.verse_id, 'extras', 58431
  FROM _session253_sir06_lookup sv, _session253_sir06_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=6 AND sv.verse_number=14
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=6 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-6-plow-and-seek-wisdom',
       E'Come to her as one that ploweth and sows',
       E'Ben Sira turns from friendship to Wisdom herself, the labour that bears fruit: *Come to her as one that ploweth and sows, and wait for her good fruits: for you shall not toil much in labouring about her, but you shall eat of her fruits right soon.* (Ecclesiasticus 6:19), and *Search, and seek, and she shall be made known to you: and when you have got hold of her, let her not go.* (Ecclesiasticus 6:27). This is Solomon''s command to dig for her as for buried treasure — *If thou seekest her as silver, and searchest for her as for hid treasures;* (Proverbs 2:4) — with the promise that she answers the early seeker: *I love them that love me; and those that seek me early shall find me.* (Proverbs 8:17). The deuterocanon''s own Wisdom of Solomon sings the same — that she meets the seeker at his door: *Whoso seeks her early shall have no great travail: for he shall find her sitting at his doors.* (Wisdom of Solomon 6:14) — and the Messiah''s brother makes the asking simple: *If any of you lack wisdom, let him ask of Elohim (God), that giveth to all men liberally, and upbraideth not; and it shall be given him.* (James 1:5).',
       sv.verse_id, ev.verse_id, 'extras', 58434
  FROM _session253_sir06_lookup sv, _session253_sir06_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=6 AND sv.verse_number=18
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=6 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-6-yoke-of-wisdom',
       E'Her fetters a robe of glory',
       E'Ben Sira''s great paradox: the bonds of Wisdom become a crown. *And put your feet into her fetters, and your neck into her chain.* (Ecclesiasticus 6:24), *Bow down your shoulder, and bear her, and be not grieved with her bonds.* (Ecclesiasticus 6:25), until *Then shall her fetters be a strong defence for you, and her chains a robe of glory.* (Ecclesiasticus 6:29). This is the Messiah''s own yoke that does not crush but rests — *Take my yoke upon you, and learn of me; for I am meek and lowly in heart: and ye shall find rest unto your souls.* (Matthew 11:29), *For my yoke is easy, and my burden is light.* (Matthew 11:30) — the bonds that turn out light. And the deuterocanon''s Wisdom of Solomon binds wisdom to friendship with Yahuah and treasure that never fails: *For she is a treasure to men that never fails: which they that use become the friends of Yahuah (God), being commended for the gifts that come from learning.* (Wisdom of Solomon 7:14). It ain''t new — submit the neck, and the chain becomes a robe.',
       sv.verse_id, ev.verse_id, 'extras', 58437
  FROM _session253_sir06_lookup sv, _session253_sir06_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=6 AND sv.verse_number=24
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=6 AND ev.verse_number=31
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-6-elders-and-commandments',
       E'Stand with the elders, meditate on His commandments',
       E'The chapter closes in the school of the wise and the law of Yahuah: *Stand in the multitude of the elders; and cleave to him that is wise.* (Ecclesiasticus 6:34), and the capstone, *Let your mind be upon the ordinances of Yahuah (God) and meditate continually in his commandments: he shall establish yours heart, and give you wisdom at your owns desire.* (Ecclesiasticus 6:37). This is the first Psalm''s blessed man — *But his delight is in the law of Yahuah (LORD); and in his law doth he meditate day and night.* (Psalm 1:2) — who becomes *like a tree planted by the rivers of water, that bringeth forth his fruit in his season; his leaf also shall not wither; and whatsoever he doeth shall prosper.* (Psalm 1:3), the very opposite of the dry tree of Sirach 6:3. It is the Shema''s charge to keep the words in the heart — *And these words, which I command thee this day, shall be in thine heart:* (Deuteronomy 6:6) — for Torah stands, and the fear of Yahuah is the beginning of knowledge: *The fear of Yahuah (LORD) is the beginning of knowledge: but fools despise wisdom and instruction.* (Proverbs 1:7).',
       sv.verse_id, ev.verse_id, 'extras', 58440
  FROM _session253_sir06_lookup sv, _session253_sir06_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=6 AND sv.verse_number=34
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=6 AND ev.verse_number=37
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ecclesiasticus-6-double-tongue
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 12:2 — *They speak vanity every one with his neighbour: with flattering lips and with a double heart do they speak.* The double heart of David''s psalm is Ben Sira''s "double tongue" that turns a friend into an enemy in Sirach 6:1.'
  FROM cross_reference_threads t, cross_references x, _session253_sir06_lookup sv, _session253_sir06_lookup tv
 WHERE t.slug='ecclesiasticus-6-double-tongue'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=6 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'James 3:8 — *But the tongue can no man tame; it is an unruly evil, full of deadly poison.* The Messiah''s brother frames the untamed tongue exactly as Ben Sira does in Sirach 6:1 — the instrument that breeds shame and reproach.'
  FROM cross_reference_threads t, cross_references x, _session253_sir06_lookup sv, _session253_sir06_lookup tv
 WHERE t.slug='ecclesiasticus-6-double-tongue'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=6 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'James 3:10 — *Out of the same mouth proceedeth blessing and cursing. My brethren, these things ought not so to be.* James names the very double-mouthedness of the "double tongue" of Sirach 6:1 — blessing and cursing cannot share one tongue.'
  FROM cross_reference_threads t, cross_references x, _session253_sir06_lookup sv, _session253_sir06_lookup tv
 WHERE t.slug='ecclesiasticus-6-double-tongue'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=6 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=3 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 12:35 — *A good man out of the good treasure of the heart bringeth forth good things: and an evil man out of the evil treasure bringeth forth evil things.* The Messiah roots the "sweet language" of Sirach 6:5 where Ben Sira does — in the treasure of the heart that the tongue spends.'
  FROM cross_reference_threads t, cross_references x, _session253_sir06_lookup sv, _session253_sir06_lookup tv
 WHERE t.slug='ecclesiasticus-6-double-tongue'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=6 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=12 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-6-prove-a-friend
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 18:24 — *A man that hath friends must shew himself friendly: and there is a friend that sticketh closer than a brother.* The proverb''s "friend that sticketh closer than a brother" is the rare one-of-a-thousand counsellor Ben Sira tells you to seek in Sirach 6:6.'
  FROM cross_reference_threads t, cross_references x, _session253_sir06_lookup sv, _session253_sir06_lookup tv
 WHERE t.slug='ecclesiasticus-6-prove-a-friend'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=6 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=18 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 27:6 — *Faithful are the wounds of a friend; but the kisses of an enemy are deceitful.* Proverbs gives the test Ben Sira commands in Sirach 6:7 — prove a friend by whether his honest wounds outlast a flatterer''s kisses.'
  FROM cross_reference_threads t, cross_references x, _session253_sir06_lookup sv, _session253_sir06_lookup tv
 WHERE t.slug='ecclesiasticus-6-prove-a-friend'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=6 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=27 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 13:20 — *He that walketh with wise men shall be wise: but a companion of fools shall be destroyed.* The fair-weather "friend for his own occasion" of Sirach 6:8 is the companion of fools who is destroyed in the day of trouble.'
  FROM cross_reference_threads t, cross_references x, _session253_sir06_lookup sv, _session253_sir06_lookup tv
 WHERE t.slug='ecclesiasticus-6-prove-a-friend'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=6 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=13 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-6-faithful-friend
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 17:17 — *A friend loveth at all times, and a brother is born for adversity.* Solomon''s friend who loves at all times is Ben Sira''s "strong defence" and "treasure" — the faithful friend of Sirach 6:14.'
  FROM cross_reference_threads t, cross_references x, _session253_sir06_lookup sv, _session253_sir06_lookup tv
 WHERE t.slug='ecclesiasticus-6-faithful-friend'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=6 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=17 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 15:13 — *Greater love hath no man than this, that a man lay down his life for his friends.* The Messiah''s laid-down life is the medicine-of-life friendship of Sirach 6:16 carried to its fullest measure.'
  FROM cross_reference_threads t, cross_references x, _session253_sir06_lookup sv, _session253_sir06_lookup tv
 WHERE t.slug='ecclesiasticus-6-faithful-friend'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=6 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=15 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 15:15 — *Henceforth I call you not servants; for the servant knoweth not what his lord doeth: but I have called you friends; for all things that I have heard of my Father I have made known unto you.* He who fears the Father names His own as friends — the faithful friend that those who fear Yahuah shall find in Sirach 6:16.'
  FROM cross_reference_threads t, cross_references x, _session253_sir06_lookup sv, _session253_sir06_lookup tv
 WHERE t.slug='ecclesiasticus-6-faithful-friend'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=6 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=15 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Proverbs 9:10 — *The fear of Yahuah (LORD) is the beginning of wisdom: and the knowledge of the holy is understanding.* Ben Sira anchors right friendship in the fear of Yahuah in Sirach 6:17 — the same fear Proverbs calls the beginning of wisdom.'
  FROM cross_reference_threads t, cross_references x, _session253_sir06_lookup sv, _session253_sir06_lookup tv
 WHERE t.slug='ecclesiasticus-6-faithful-friend'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=6 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=9 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-6-plow-and-seek-wisdom
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 8:17 — *I love them that love me; and those that seek me early shall find me.* Wisdom herself answers the plower and sower of Sirach 6:19 — those who seek her early eat of her fruits soon.'
  FROM cross_reference_threads t, cross_references x, _session253_sir06_lookup sv, _session253_sir06_lookup tv
 WHERE t.slug='ecclesiasticus-6-plow-and-seek-wisdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=6 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=8 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 2:4 — *If thou seekest her as silver, and searchest for her as for hid treasures;* Solomon''s command to search for wisdom as for hid treasure is Ben Sira''s "Search, and seek" and "let her not go" of Sirach 6:27.'
  FROM cross_reference_threads t, cross_references x, _session253_sir06_lookup sv, _session253_sir06_lookup tv
 WHERE t.slug='ecclesiasticus-6-plow-and-seek-wisdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=6 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Wisdom of Solomon 6:14 — *Whoso seeks her early shall have no great travail: for he shall find her sitting at his doors.* The sibling wisdom book echoes Sirach 6:19 verse for verse — the early seeker toils little and finds her near at hand.'
  FROM cross_reference_threads t, cross_references x, _session253_sir06_lookup sv, _session253_sir06_lookup tv
 WHERE t.slug='ecclesiasticus-6-plow-and-seek-wisdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=6 AND sv.verse_number=19
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=6 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'James 1:5 — *If any of you lack wisdom, let him ask of Elohim (God), that giveth to all men liberally, and upbraideth not; and it shall be given him.* James makes the youthful gathering of instruction in Sirach 6:18 a matter of asking the Giver who upbraids not.'
  FROM cross_reference_threads t, cross_references x, _session253_sir06_lookup sv, _session253_sir06_lookup tv
 WHERE t.slug='ecclesiasticus-6-plow-and-seek-wisdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=6 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-6-yoke-of-wisdom
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 11:29 — *Take my yoke upon you, and learn of me; for I am meek and lowly in heart: and ye shall find rest unto your souls.* The bowed shoulder bearing Wisdom''s bonds in Sirach 6:25 is the Messiah''s yoke that gives rest to the soul.'
  FROM cross_reference_threads t, cross_references x, _session253_sir06_lookup sv, _session253_sir06_lookup tv
 WHERE t.slug='ecclesiasticus-6-yoke-of-wisdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=6 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=11 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 11:30 — *For my yoke is easy, and my burden is light.* Ben Sira''s promise that Wisdom''s bonds need not grieve you in Sirach 6:25 is the Messiah''s easy yoke and light burden.'
  FROM cross_reference_threads t, cross_references x, _session253_sir06_lookup sv, _session253_sir06_lookup tv
 WHERE t.slug='ecclesiasticus-6-yoke-of-wisdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=6 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=11 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Wisdom of Solomon 7:14 — *For she is a treasure to men that never fails: which they that use become the friends of Yahuah (God), being commended for the gifts that come from learning.* The sibling book turns Wisdom''s chains into the same treasure and robe of glory as Sirach 6:29 — and back to the friendship theme of the chapter.'
  FROM cross_reference_threads t, cross_references x, _session253_sir06_lookup sv, _session253_sir06_lookup tv
 WHERE t.slug='ecclesiasticus-6-yoke-of-wisdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=6 AND sv.verse_number=29
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=7 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-6-elders-and-commandments
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 1:2 — *But his delight is in the law of Yahuah (LORD); and in his law doth he meditate day and night.* Ben Sira''s command to meditate continually in His commandments in Sirach 6:37 is the delight and day-and-night meditation of the blessed man.'
  FROM cross_reference_threads t, cross_references x, _session253_sir06_lookup sv, _session253_sir06_lookup tv
 WHERE t.slug='ecclesiasticus-6-elders-and-commandments'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=6 AND sv.verse_number=37
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=1 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 6:6 — *And these words, which I command thee this day, shall be in thine heart:* The Shema''s charge to carry Yahuah''s words in the heart is the established heart Ben Sira promises in Sirach 6:37.'
  FROM cross_reference_threads t, cross_references x, _session253_sir06_lookup sv, _session253_sir06_lookup tv
 WHERE t.slug='ecclesiasticus-6-elders-and-commandments'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=6 AND sv.verse_number=37
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 1:7 — *The fear of Yahuah (LORD) is the beginning of knowledge: but fools despise wisdom and instruction.* The mind fixed on Yahuah''s ordinances in Sirach 6:37 receives wisdom because the fear of Yahuah is where all knowledge begins.'
  FROM cross_reference_threads t, cross_references x, _session253_sir06_lookup sv, _session253_sir06_lookup tv
 WHERE t.slug='ecclesiasticus-6-elders-and-commandments'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=6 AND sv.verse_number=37
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=1 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 1:3 — *And he shall be like a tree planted by the rivers of water, that bringeth forth his fruit in his season; his leaf also shall not wither; and whatsoever he doeth shall prosper.* He who cleaves to the wise elders of Sirach 6:34 becomes the fruitful, unwithering tree — the opposite of the dry tree of Sirach 6:3.'
  FROM cross_reference_threads t, cross_references x, _session253_sir06_lookup sv, _session253_sir06_lookup tv
 WHERE t.slug='ecclesiasticus-6-elders-and-commandments'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=6 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

