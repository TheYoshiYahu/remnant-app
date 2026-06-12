-- ----- fragment: minion_ecclesiasticus_25.sql (session253 ecclesiasticus 25) -----
-- Source anchor: apocrypha/ecclesiasticus ch25. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: sir25 (view _session253_sir25_lookup). Sort band base 58900, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_sir25_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ecclesiasticus-25-fear-of-yahuah-glory
  ('apocrypha', 'ecclesiasticus', 25, 6, 'canon', 'proverbs', 1, 7, 'free', E'Proverbs 1:7 — *The fear of Yahuah (LORD) is the beginning of knowledge: but fools despise wisdom and instruction.* The reverence Ben Sira calls the glory of old men is what Proverbs names the very beginning of knowledge.'),
  ('apocrypha', 'ecclesiasticus', 25, 10, 'canon', 'proverbs', 9, 10, 'free', E'Proverbs 9:10 — *The fear of Yahuah (LORD) is the beginning of wisdom: and the knowledge of the holy is understanding.* Ben Sira sets none above the one who fears Yahuah because that fear is wisdom''s own beginning.'),
  ('apocrypha', 'ecclesiasticus', 25, 12, 'canon', 'job', 28, 28, 'free', E'Job 28:28 — *And unto man he said, Behold, the fear of Yahuah (Lord), that is wisdom; and to depart from evil is understanding.* The Almighty''s own definition matches Ben Sira''s: the fear of Yahuah is the beginning of his love and of cleaving to him.'),
  ('apocrypha', 'ecclesiasticus', 25, 6, 'apocrypha', 'ecclesiasticus', 1, 14, 'extras', E'Ecclesiasticus 1:14 — *To fear Yahuah (God) is the beginning of wisdom: and it was created with the faithful in the womb.* Ben Sira''s own prologue founds the whole book on the fear chapter 25 names the glory of the aged.'),
  -- thread: ecclesiasticus-25-comely-wisdom-of-old-men
  ('apocrypha', 'ecclesiasticus', 25, 4, 'canon', 'leviticus', 19, 32, 'free', E'Leviticus 19:32 — *Thou shalt rise up before the hoary head, and honour the face of the old man, and fear thy Elohim (God): I am Yahuah (LORD).* The Torah commands the very honour for gray hairs that Ben Sira calls comely.'),
  ('apocrypha', 'ecclesiasticus', 25, 4, 'canon', 'proverbs', 16, 31, 'free', E'Proverbs 16:31 — *The hoary head is a crown of glory, if it be found in the way of righteousness.* Proverbs crowns the gray head Ben Sira deems comely for counsel.'),
  ('apocrypha', 'ecclesiasticus', 25, 5, 'canon', 'proverbs', 20, 29, 'free', E'Proverbs 20:29 — *The glory of young men is their strength: and the beauty of old men is the gray head.* The beauty of old men is their gray head — the wisdom Ben Sira calls comely in men of honour.'),
  ('apocrypha', 'ecclesiasticus', 25, 5, 'canon', 'job', 12, 12, 'free', E'Job 12:12 — *With the ancient is wisdom; and in length of days understanding.* Job binds wisdom to age as Ben Sira binds it to old men and counsel.'),
  -- thread: ecclesiasticus-25-of-the-woman-came-the-beginning-of-sin
  ('apocrypha', 'ecclesiasticus', 25, 24, 'canon', 'genesis', 3, 6, 'free', E'Genesis 3:6 — *And when the woman saw that the tree was good for food, and that it was pleasant to the eyes, and a tree to be desired to make one wise, she took of the fruit thereof, and did eat, and gave also unto her husband with her; and he did eat.* The eating in the garden is the beginning of sin Ben Sira traces to the woman.'),
  ('apocrypha', 'ecclesiasticus', 25, 24, 'canon', 'genesis', 3, 16, 'free', E'Genesis 3:16 — *Unto the woman he said, I will greatly multiply thy sorrow and thy conception; in sorrow thou shalt bring forth children; and thy desire shall be to thy husband, and he shall rule over thee.* The sentence on Eve is the sorrow and death Ben Sira says came through her.'),
  ('apocrypha', 'ecclesiasticus', 25, 24, 'canon', '1-timothy', 2, 14, 'free', E'1 Timothy 2:14 — *And Adam was not deceived, but the woman being deceived was in the transgression.* Paul, like Ben Sira, marks the woman as the door of the first transgression.'),
  ('apocrypha', 'ecclesiasticus', 25, 24, 'canon', 'romans', 5, 12, 'free', E'Romans 5:12 — *Wherefore, as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned:* Ben Sira''s ''through her we all die'' is the universal death Paul traces from the fall to every man.'),
  -- thread: ecclesiasticus-25-better-dwell-than-with-a-wicked-woman
  ('apocrypha', 'ecclesiasticus', 25, 16, 'canon', 'proverbs', 21, 9, 'free', E'Proverbs 21:9 — *It is better to dwell in a corner of the housetop, than with a brawling woman in a wide house.* Proverbs'' ''better the housetop'' is Ben Sira''s ''rather the lion and dragon'' — the same flight from a wicked woman''s house.'),
  ('apocrypha', 'ecclesiasticus', 25, 20, 'canon', 'proverbs', 21, 19, 'free', E'Proverbs 21:19 — *It is better to dwell in the wilderness, than with a contentious and an angry woman.* The wife full of words who wearies the quiet man is the contentious woman Proverbs would flee to the wilderness to escape.'),
  -- thread: ecclesiasticus-25-virtuous-wife-the-crown
  ('apocrypha', 'ecclesiasticus', 25, 8, 'canon', 'proverbs', 12, 4, 'free', E'Proverbs 12:4 — *A virtuous woman is a crown to her husband: but she that maketh ashamed is as rottenness in his bones.* The wife of understanding who makes a man blessed is the crowning virtuous woman of Proverbs.'),
  ('apocrypha', 'ecclesiasticus', 25, 8, 'canon', 'proverbs', 31, 10, 'free', E'Proverbs 31:10 — *Who can find a virtuous woman? for her price is far above rubies.* The dwelling with a wife of understanding Ben Sira calls blessed is the rare treasure Proverbs prices above rubies.'),
  ('apocrypha', 'ecclesiasticus', 25, 8, 'canon', 'proverbs', 31, 30, 'free', E'Proverbs 31:30 — *Favour is deceitful, and beauty is vain: but a woman that feareth Yahuah (LORD), she shall be praised.* Ben Sira''s wife of understanding, like Proverbs'' praised woman, is measured by the fear of Yahuah, not by beauty.'),
  ('apocrypha', 'ecclesiasticus', 25, 8, 'apocrypha', 'ecclesiasticus', 26, 1, 'extras', E'Ecclesiasticus 26:1 — *Blessed is the man that has a virtuous wife, for the number of his days shall be double.* Ben Sira''s own next chapter carries the blessing of the wife of understanding straight into the praise of the virtuous wife.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_sir25_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_sir25_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-25-fear-of-yahuah-glory',
       E'The fear of Yahuah is their glory',
       E'Ben Sira crowns the experience of the aged not with years but with reverence: *Much experience is the crown of old men, and the fear of Yahuah (God) is their glory.* (Ecclesiasticus 25:6) He presses higher: *O how great is he that finds wisdom! yet is there none above him that fears Yahuah (God).* (Ecclesiasticus 25:10), and *The fear of Yahuah (God) is the beginning of his love: and faith is the beginning of cleaving to him.* (Ecclesiasticus 25:12) This is not new doctrine but the very spine of the wisdom Tanakh: *The fear of Yahuah (LORD) is the beginning of knowledge: but fools despise wisdom and instruction.* (Proverbs 1:7) and *The fear of Yahuah (LORD) is the beginning of wisdom: and the knowledge of the holy is understanding.* (Proverbs 9:10) Job hears the same from the Almighty: *And unto man he said, Behold, the fear of Yahuah (Lord), that is wisdom; and to depart from evil is understanding.* (Job 28:28) Ben Sira''s own opening hymn already sang it — *To fear Yahuah (God) is the beginning of wisdom: and it was created with the faithful in the womb.* (Ecclesiasticus 1:14) — so chapter 25 only echoes the book''s foundation. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 58900
  FROM _session253_sir25_lookup sv, _session253_sir25_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=25 AND sv.verse_number=6
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=25 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-25-comely-wisdom-of-old-men',
       E'The wisdom of old men, the crown of gray hairs',
       E'Ben Sira honours the aged: *O how comely a thing is judgment for gray hairs, and for ancient men to know counsel!* (Ecclesiasticus 25:4) and *O how comely is the wisdom of old men, and understanding and counsel to men of honour.* (Ecclesiasticus 25:5) The Torah commands this very reverence: *Thou shalt rise up before the hoary head, and honour the face of the old man, and fear thy Elohim (God): I am Yahuah (LORD).* (Leviticus 19:32) Proverbs makes the gray head a crown: *The hoary head is a crown of glory, if it be found in the way of righteousness.* (Proverbs 16:31) and *The glory of young men is their strength: and the beauty of old men is the gray head.* (Proverbs 20:29) Job long before tied age to wisdom: *With the ancient is wisdom; and in length of days understanding.* (Job 12:12) Ben Sira gathers the Tanakh''s whole esteem for the elder into a single comely line. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 58903
  FROM _session253_sir25_lookup sv, _session253_sir25_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=25 AND sv.verse_number=4
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=25 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-25-of-the-woman-came-the-beginning-of-sin',
       E'Of the woman came the beginning of sin',
       E'Ben Sira reaches back to Eden: *Of the woman came the beginning of sin, and through her we all die.* (Ecclesiasticus 25:24) This is the garden remembered — *And when the woman saw that the tree was good for food, and that it was pleasant to the eyes, and a tree to be desired to make one wise, she took of the fruit thereof, and did eat, and gave also unto her husband with her; and he did eat.* (Genesis 3:6), the sentence that followed — *Unto the woman he said, I will greatly multiply thy sorrow and thy conception; in sorrow thou shalt bring forth children; and thy desire shall be to thy husband, and he shall rule over thee.* (Genesis 3:16) Paul echoes the same memory of the deception: *And Adam was not deceived, but the woman being deceived was in the transgression.* (1 Timothy 2:14) Yet Paul also reads the fall through the one man Adam, that death might pass to all: *Wherefore, as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned:* (Romans 5:12) Ben Sira''s ''through her we all die'' is the very mystery the apostle unfolds. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 58906
  FROM _session253_sir25_lookup sv, _session253_sir25_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=25 AND sv.verse_number=24
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=25 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-25-better-dwell-than-with-a-wicked-woman',
       E'Better a lion than a wicked woman',
       E'Ben Sira weighs the misery of a quarrelsome house: *I had rather dwell with a lion and a dragon, than to keep house with a wicked woman.* (Ecclesiasticus 25:16) and *As the climbing up a sandy way is to the feet of the aged, so is a wife full of words to a quiet man.* (Ecclesiasticus 25:20) Proverbs had already cast the very same comparison twice over: *It is better to dwell in a corner of the housetop, than with a brawling woman in a wide house.* (Proverbs 21:9) and *It is better to dwell in the wilderness, than with a contentious and an angry woman.* (Proverbs 21:19) Ben Sira simply trades the rooftop and the wilderness for the lion and the dragon — the same wisdom-proverb, the same weary husband. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 58909
  FROM _session253_sir25_lookup sv, _session253_sir25_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=25 AND sv.verse_number=16
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=25 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-25-virtuous-wife-the-crown',
       E'The good wife — a crown to her husband',
       E'Against the wicked woman, Ben Sira blesses the good one: *Well is him that dwells with a wife of understanding, and that has not slipped with his tongue, and that has not served a man more unworthy than himself:* (Ecclesiasticus 25:8) The Tanakh''s wisdom literature crowns her: *A virtuous woman is a crown to her husband: but she that maketh ashamed is as rottenness in his bones.* (Proverbs 12:4) The great acrostic asks and answers: *Who can find a virtuous woman? for her price is far above rubies.* (Proverbs 31:10) and roots her worth not in beauty but in reverence: *Favour is deceitful, and beauty is vain: but a woman that feareth Yahuah (LORD), she shall be praised.* (Proverbs 31:30) Ben Sira''s own next chapter continues the blessing — *Blessed is the man that has a virtuous wife, for the number of his days shall be double.* (Ecclesiasticus 26:1) — binding wisdom on women across both chapters. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 58912
  FROM _session253_sir25_lookup sv, _session253_sir25_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=25 AND sv.verse_number=8
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=25 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ecclesiasticus-25-fear-of-yahuah-glory
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 1:7 — *The fear of Yahuah (LORD) is the beginning of knowledge: but fools despise wisdom and instruction.* The reverence Ben Sira calls the glory of old men is what Proverbs names the very beginning of knowledge.'
  FROM cross_reference_threads t, cross_references x, _session253_sir25_lookup sv, _session253_sir25_lookup tv
 WHERE t.slug='ecclesiasticus-25-fear-of-yahuah-glory'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=25 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=1 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 9:10 — *The fear of Yahuah (LORD) is the beginning of wisdom: and the knowledge of the holy is understanding.* Ben Sira sets none above the one who fears Yahuah because that fear is wisdom''s own beginning.'
  FROM cross_reference_threads t, cross_references x, _session253_sir25_lookup sv, _session253_sir25_lookup tv
 WHERE t.slug='ecclesiasticus-25-fear-of-yahuah-glory'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=25 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=9 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Job 28:28 — *And unto man he said, Behold, the fear of Yahuah (Lord), that is wisdom; and to depart from evil is understanding.* The Almighty''s own definition matches Ben Sira''s: the fear of Yahuah is the beginning of his love and of cleaving to him.'
  FROM cross_reference_threads t, cross_references x, _session253_sir25_lookup sv, _session253_sir25_lookup tv
 WHERE t.slug='ecclesiasticus-25-fear-of-yahuah-glory'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=25 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=28 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ecclesiasticus 1:14 — *To fear Yahuah (God) is the beginning of wisdom: and it was created with the faithful in the womb.* Ben Sira''s own prologue founds the whole book on the fear chapter 25 names the glory of the aged.'
  FROM cross_reference_threads t, cross_references x, _session253_sir25_lookup sv, _session253_sir25_lookup tv
 WHERE t.slug='ecclesiasticus-25-fear-of-yahuah-glory'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=25 AND sv.verse_number=6
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-25-comely-wisdom-of-old-men
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 19:32 — *Thou shalt rise up before the hoary head, and honour the face of the old man, and fear thy Elohim (God): I am Yahuah (LORD).* The Torah commands the very honour for gray hairs that Ben Sira calls comely.'
  FROM cross_reference_threads t, cross_references x, _session253_sir25_lookup sv, _session253_sir25_lookup tv
 WHERE t.slug='ecclesiasticus-25-comely-wisdom-of-old-men'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=25 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 16:31 — *The hoary head is a crown of glory, if it be found in the way of righteousness.* Proverbs crowns the gray head Ben Sira deems comely for counsel.'
  FROM cross_reference_threads t, cross_references x, _session253_sir25_lookup sv, _session253_sir25_lookup tv
 WHERE t.slug='ecclesiasticus-25-comely-wisdom-of-old-men'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=25 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=16 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 20:29 — *The glory of young men is their strength: and the beauty of old men is the gray head.* The beauty of old men is their gray head — the wisdom Ben Sira calls comely in men of honour.'
  FROM cross_reference_threads t, cross_references x, _session253_sir25_lookup sv, _session253_sir25_lookup tv
 WHERE t.slug='ecclesiasticus-25-comely-wisdom-of-old-men'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=25 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=20 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Job 12:12 — *With the ancient is wisdom; and in length of days understanding.* Job binds wisdom to age as Ben Sira binds it to old men and counsel.'
  FROM cross_reference_threads t, cross_references x, _session253_sir25_lookup sv, _session253_sir25_lookup tv
 WHERE t.slug='ecclesiasticus-25-comely-wisdom-of-old-men'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=25 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=12 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-25-of-the-woman-came-the-beginning-of-sin
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:6 — *And when the woman saw that the tree was good for food, and that it was pleasant to the eyes, and a tree to be desired to make one wise, she took of the fruit thereof, and did eat, and gave also unto her husband with her; and he did eat.* The eating in the garden is the beginning of sin Ben Sira traces to the woman.'
  FROM cross_reference_threads t, cross_references x, _session253_sir25_lookup sv, _session253_sir25_lookup tv
 WHERE t.slug='ecclesiasticus-25-of-the-woman-came-the-beginning-of-sin'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=25 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:16 — *Unto the woman he said, I will greatly multiply thy sorrow and thy conception; in sorrow thou shalt bring forth children; and thy desire shall be to thy husband, and he shall rule over thee.* The sentence on Eve is the sorrow and death Ben Sira says came through her.'
  FROM cross_reference_threads t, cross_references x, _session253_sir25_lookup sv, _session253_sir25_lookup tv
 WHERE t.slug='ecclesiasticus-25-of-the-woman-came-the-beginning-of-sin'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=25 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Timothy 2:14 — *And Adam was not deceived, but the woman being deceived was in the transgression.* Paul, like Ben Sira, marks the woman as the door of the first transgression.'
  FROM cross_reference_threads t, cross_references x, _session253_sir25_lookup sv, _session253_sir25_lookup tv
 WHERE t.slug='ecclesiasticus-25-of-the-woman-came-the-beginning-of-sin'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=25 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='1-timothy' AND tv.chapter_number=2 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 5:12 — *Wherefore, as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned:* Ben Sira''s ''through her we all die'' is the universal death Paul traces from the fall to every man.'
  FROM cross_reference_threads t, cross_references x, _session253_sir25_lookup sv, _session253_sir25_lookup tv
 WHERE t.slug='ecclesiasticus-25-of-the-woman-came-the-beginning-of-sin'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=25 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=5 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-25-better-dwell-than-with-a-wicked-woman
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 21:9 — *It is better to dwell in a corner of the housetop, than with a brawling woman in a wide house.* Proverbs'' ''better the housetop'' is Ben Sira''s ''rather the lion and dragon'' — the same flight from a wicked woman''s house.'
  FROM cross_reference_threads t, cross_references x, _session253_sir25_lookup sv, _session253_sir25_lookup tv
 WHERE t.slug='ecclesiasticus-25-better-dwell-than-with-a-wicked-woman'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=25 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=21 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 21:19 — *It is better to dwell in the wilderness, than with a contentious and an angry woman.* The wife full of words who wearies the quiet man is the contentious woman Proverbs would flee to the wilderness to escape.'
  FROM cross_reference_threads t, cross_references x, _session253_sir25_lookup sv, _session253_sir25_lookup tv
 WHERE t.slug='ecclesiasticus-25-better-dwell-than-with-a-wicked-woman'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=25 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=21 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-25-virtuous-wife-the-crown
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 12:4 — *A virtuous woman is a crown to her husband: but she that maketh ashamed is as rottenness in his bones.* The wife of understanding who makes a man blessed is the crowning virtuous woman of Proverbs.'
  FROM cross_reference_threads t, cross_references x, _session253_sir25_lookup sv, _session253_sir25_lookup tv
 WHERE t.slug='ecclesiasticus-25-virtuous-wife-the-crown'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=25 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=12 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 31:10 — *Who can find a virtuous woman? for her price is far above rubies.* The dwelling with a wife of understanding Ben Sira calls blessed is the rare treasure Proverbs prices above rubies.'
  FROM cross_reference_threads t, cross_references x, _session253_sir25_lookup sv, _session253_sir25_lookup tv
 WHERE t.slug='ecclesiasticus-25-virtuous-wife-the-crown'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=25 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=31 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 31:30 — *Favour is deceitful, and beauty is vain: but a woman that feareth Yahuah (LORD), she shall be praised.* Ben Sira''s wife of understanding, like Proverbs'' praised woman, is measured by the fear of Yahuah, not by beauty.'
  FROM cross_reference_threads t, cross_references x, _session253_sir25_lookup sv, _session253_sir25_lookup tv
 WHERE t.slug='ecclesiasticus-25-virtuous-wife-the-crown'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=25 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=31 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ecclesiasticus 26:1 — *Blessed is the man that has a virtuous wife, for the number of his days shall be double.* Ben Sira''s own next chapter carries the blessing of the wife of understanding straight into the praise of the virtuous wife.'
  FROM cross_reference_threads t, cross_references x, _session253_sir25_lookup sv, _session253_sir25_lookup tv
 WHERE t.slug='ecclesiasticus-25-virtuous-wife-the-crown'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=25 AND sv.verse_number=8
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=26 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

