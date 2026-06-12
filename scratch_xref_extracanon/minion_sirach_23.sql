-- ----- fragment: minion_ecclesiasticus_23.sql (session253 ecclesiasticus 23) -----
-- Source anchor: apocrypha/ecclesiasticus ch23. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: sir23 (view _session253_sir23_lookup). Sort band base 58850, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_sir23_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: sirach-23-set-a-watch-before-my-mouth
  ('apocrypha', 'ecclesiasticus', 23, 2, 'apocrypha', 'ecclesiasticus', 22, 27, 'extras', E'Ecclesiasticus 22:27 — *Who shall set a watch before my mouth, and a seal of wisdom upon my lips, that I fall not suddenly by them, and that my tongue destroy me not?* The chapter before voices the very prayer Sirach 23:2 opens with — a seal upon the lips.'),
  ('apocrypha', 'ecclesiasticus', 23, 2, 'canon', 'psalms', 139, 4, 'free', E'Psalm 139:4 — *For there is not a word in my tongue, but, lo, O Yahuah (LORD), thou knowest it altogether.* David''s psalm answers the plea of Sirach 23:2: the One who would discipline the heart already knows the word before it is uttered.'),
  ('apocrypha', 'ecclesiasticus', 23, 1, 'canon', 'james', 1, 26, 'free', E'James 1:26 — *If any man among you seem to be religious, and bridleth not his tongue, but deceiveth his own heart, this man''s religion is vain.* James echoes Sirach 23:1''s prayer not to be left to one''s own counsels — the unbridled tongue undoes all religion.'),
  -- thread: sirach-23-accustom-not-thy-mouth-to-swearing
  ('apocrypha', 'ecclesiasticus', 23, 9, 'canon', 'exodus', 20, 7, 'free', E'Exodus 20:7 — *Thou shalt not take the name of Yahuah Elohayka (the LORD thy God) in vain; for Yahuah (LORD) will not hold him guiltless that taketh his name in vain.* Sinai''s third word stands behind Sirach 23:9''s charge not to accustom the mouth to naming the Holy One.'),
  ('apocrypha', 'ecclesiasticus', 23, 9, 'canon', 'leviticus', 19, 12, 'free', E'Leviticus 19:12 — *And ye shall not swear by my name falsely, neither shalt thou profane the name of thy Elohim (God): I am Yahuah (LORD).* The holiness code names the false oath as a profaning of the Name — exactly the swearing Sirach 23:9 forbids.'),
  ('apocrypha', 'ecclesiasticus', 23, 9, 'canon', 'matthew', 5, 34, 'free', E'Matthew 5:34 — *But I say unto you, Swear not at all; neither by heaven; for it is Elohim''s (God''s) throne.* On the mount Yahusha presses Sirach 23:9 to its root: not careless swearing tempered, but the oath forsworn altogether.'),
  ('apocrypha', 'ecclesiasticus', 23, 9, 'canon', 'matthew', 5, 37, 'free', E'Matthew 5:37 — *But let your communication be, Yea, yea; Nay, nay: for whatsoever is more than these cometh of evil.* The plain speech that needs no oath is the mouth Sirach 23:9 sought to discipline.'),
  ('apocrypha', 'ecclesiasticus', 23, 11, 'canon', 'james', 5, 12, 'free', E'James 5:12 — *But above all things, my brethren, swear not, neither by heaven, neither by the earth, neither by any other oath: but let your yea be yea; and your nay, nay; lest ye fall into condemnation.* James warns of the condemnation that Sirach 23:11 calls the plague that never departs the swearer''s house.'),
  -- thread: sirach-23-discipline-of-the-mouth
  ('apocrypha', 'ecclesiasticus', 23, 7, 'canon', 'proverbs', 13, 3, 'free', E'Proverbs 13:3 — *He that keepeth his mouth keepeth his life: but he that openeth wide his lips shall have destruction.* Proverbs says in a line what Sirach 23:7 names the discipline of the mouth — to keep it is to keep one''s life.'),
  ('apocrypha', 'ecclesiasticus', 23, 7, 'canon', 'proverbs', 18, 21, 'free', E'Proverbs 18:21 — *Death and life are in the power of the tongue: and they that love it shall eat the fruit thereof.* The stakes of Sirach 23:7''s discipline: the tongue holds death and life.'),
  ('apocrypha', 'ecclesiasticus', 23, 15, 'apocrypha', 'ecclesiasticus', 28, 17, 'extras', E'Ecclesiasticus 28:17 — *The stroke of the whip makes marks in the flesh: but the stroke of the tongue breaks the bones.* Ben Sira''s own later word measures the ruin of the opprobrious mouth of Sirach 23:15 — the tongue wounds deeper than the whip.'),
  ('apocrypha', 'ecclesiasticus', 23, 7, 'canon', 'james', 3, 2, 'free', E'James 3:2 — *For in many things we offend all. If any man offend not in word, the same is a perfect man, and able also to bridle the whole body.* James makes Sirach 23:7''s kept mouth the measure of the perfect man.'),
  ('apocrypha', 'ecclesiasticus', 23, 8, 'canon', 'matthew', 12, 36, 'free', E'Matthew 12:36 — *But I say unto you, That every idle word that men shall speak, they shall give account thereof in the day of judgment.* The sinner taken in his own speech of Sirach 23:8 stands before the reckoning Yahusha names for every idle word.'),
  -- thread: sirach-23-who-seeth-me-all-seeing-eyes
  ('apocrypha', 'ecclesiasticus', 23, 19, 'canon', 'proverbs', 5, 21, 'free', E'Proverbs 5:21 — *For the ways of man are before the eyes of Yahuah (LORD), and he pondereth all his goings.* Solomon sets the all-seeing eye in his own chapter against the strange woman — the very ground of Sirach 23:19.'),
  ('apocrypha', 'ecclesiasticus', 23, 19, 'canon', 'proverbs', 15, 3, 'free', E'Proverbs 15:3 — *The eyes of Yahuah (LORD) are in every place, beholding the evil and the good.* No wall hides from the eye that Sirach 23:19 calls brighter than the sun.'),
  ('apocrypha', 'ecclesiasticus', 23, 18, 'canon', 'psalms', 139, 7, 'free', E'Psalm 139:7 — *Whither shall I go from thy spirit? or whither shall I flee from thy presence?* David knows there is no darkness to compass oneself about, against the adulterer''s boast of Sirach 23:18.'),
  ('apocrypha', 'ecclesiasticus', 23, 18, 'canon', 'matthew', 5, 28, 'free', E'Matthew 5:28 — *But I say unto you, That whosoever looketh on a woman to lust after her hath committed adultery with her already in his heart.* Yahusha sees the secret thought of Sirach 23:18 itself as the act — the heart is never hidden.'),
  ('apocrypha', 'ecclesiasticus', 23, 18, 'canon', 'job', 31, 1, 'free', E'Job 31:1 — *I made a covenant with mine eyes; why then should I think upon a maid?* Job is the man who refuses the adulterer''s reasoning of Sirach 23:18 — guarding the eye before the heart ever thinks.'),
  -- thread: sirach-23-fear-of-yahuah-the-commandments
  ('apocrypha', 'ecclesiasticus', 23, 23, 'canon', 'job', 34, 21, 'free', E'Job 34:21 — *For his eyes are upon the ways of man, and he seeth all his goings.* The same beholding eye brings the secret adulteress of Sirach 23:23, who disobeyed the law of the Most High, into the congregation for inquisition.'),
  ('apocrypha', 'ecclesiasticus', 23, 25, 'canon', 'proverbs', 12, 3, 'free', E'Proverbs 12:3 — *A man shall not be established by wickedness: but the root of the righteous shall not be moved.* Solomon names the very contrast of Sirach 23:25: the wicked take no root, but the righteous cannot be moved.'),
  ('apocrypha', 'ecclesiasticus', 23, 28, 'canon', 'deuteronomy', 30, 20, 'free', E'Deuteronomy 30:20 — *That thou mayest love Yahuah Elohayka (the LORD thy God), and that thou mayest obey his voice, and that thou mayest cleave unto him: for he is thy life, and the length of thy days: that thou mayest dwell in the land which Yahuah (LORD) sware unto thy fathers, to Abraham, to Isaac, and to Jacob, to give them.* Moses names the obedient cleaving as life and length of days — the same long life Sirach 23:28 promises the one received of Yahuah.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_sir23_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_sir23_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-23-set-a-watch-before-my-mouth',
       E'Set scourges over my thoughts: the prayer to govern the heart',
       E'Ben Sira opens with a prayer for the governance of the inner man — that the discipline of wisdom would stand guard over both heart and tongue: *Who will set scourges over my thoughts, and the discipline of wisdom over my heart? that they spare me not for my ignorances, and it pass not by my sins* (Ecclesiasticus 23:2). It is the same cry he raised a chapter earlier: *Who shall set a watch before my mouth, and a seal of wisdom upon my lips, that I fall not suddenly by them, and that my tongue destroy me not?* (Ecclesiasticus 22:27) — the live deuterocanon answering itself. David prayed it in the Psalter: *For there is not a word in my tongue, but, lo, O Yahuah (LORD), thou knowest it altogether* (Psalm 139:4) — the all-knowing One who searches the thought before it is spoken. And James names the man who never learned this watch: *If any man among you seem to be religious, and bridleth not his tongue, but deceiveth his own heart, this man''s religion is vain* (James 1:26). It ain''t new — the bridled tongue is the wisdom of the whole covenant.',
       sv.verse_id, ev.verse_id, 'extras', 58850
  FROM _session253_sir23_lookup sv, _session253_sir23_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=23 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=23 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-23-accustom-not-thy-mouth-to-swearing',
       E'Swear not at all: the naming of the Holy One',
       E'Ben Sira warns against the careless oath and the careless use of the divine Name: *Accustom not your mouth to swearing; neither use thyself to the naming of the Holy One* (Ecclesiasticus 23:9), for *A man that useth much swearing shall be filled with iniquity, and the plague shall never depart from his house* (Ecclesiasticus 23:11). This is Sinai''s third word: *Thou shalt not take the name of Yahuah Elohayka (the LORD thy God) in vain; for Yahuah (LORD) will not hold him guiltless that taketh his name in vain* (Exodus 20:7), and the holiness code: *And ye shall not swear by my name falsely, neither shalt thou profane the name of thy Elohim (God): I am Yahuah (LORD)* (Leviticus 19:12). On the mountain Yahusha gathers it all into one word: *But I say unto you, Swear not at all; neither by heaven; for it is Elohim''s (God''s) throne* (Matthew 5:34), and *But let your communication be, Yea, yea; Nay, nay: for whatsoever is more than these cometh of evil* (Matthew 5:37). James, the Sermon''s truest heir, says it again: *But above all things, my brethren, swear not, neither by heaven, neither by the earth, neither by any other oath: but let your yea be yea; and your nay, nay; lest ye fall into condemnation* (James 5:12). The Sermon on the Mount did not invent the guarded oath — it carried the Torah and the wisdom of ben Sira forward whole.',
       sv.verse_id, ev.verse_id, 'extras', 58853
  FROM _session253_sir23_lookup sv, _session253_sir23_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=23 AND sv.verse_number=9
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=23 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-23-discipline-of-the-mouth',
       E'The discipline of the mouth: death and life in the tongue',
       E'*Hear, O you children, the discipline of the mouth: he that keepeth it shall never be taken in his lips* (Ecclesiasticus 23:7) — and its opposite, *The man that is accustomed to opprobrious words will never be reformed all the days of his life* (Ecclesiasticus 23:15). This is the running theme of Proverbs: *He that keepeth his mouth keepeth his life: but he that openeth wide his lips shall have destruction* (Proverbs 13:3), and *Death and life are in the power of the tongue: and they that love it shall eat the fruit thereof* (Proverbs 18:21). Ben Sira will return to it with a hammer in his own next breath — *The stroke of the whip makes marks in the flesh: but the stroke of the tongue breaks the bones* (Ecclesiasticus 28:17) — and James makes the bridled tongue the measure of the whole man: *For in many things we offend all. If any man offend not in word, the same is a perfect man, and able also to bridle the whole body* (James 3:2). Yahusha sets the standard at judgment: *every idle word that men shall speak, they shall give account thereof in the day of judgment* (Matthew 12:36). The wisdom of the guarded mouth runs unbroken from Proverbs through ben Sira to the Sermon.',
       sv.verse_id, ev.verse_id, 'extras', 58856
  FROM _session253_sir23_lookup sv, _session253_sir23_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=23 AND sv.verse_number=7
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=23 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-23-who-seeth-me-all-seeing-eyes',
       E'Who seeth me? The eyes of Yahuah brighter than the sun',
       E'The adulterer hides in the dark and reasons in his heart: *Who seeth me? I am compassed about with darkness, the walls cover me, and no body seeth me; what need I to fear? the Most High will not remember my sins* (Ecclesiasticus 23:18). Ben Sira answers him with the all-seeing eye: *Such a man only fears the eyes of men, and knoweth not that the eyes of Yahuah (God) are ten thousand times brighter than the sun, beholding all the ways of men, and considering the most secret parts* (Ecclesiasticus 23:19). Solomon said it plainly: *For the ways of man are before the eyes of Yahuah (LORD), and he pondereth all his goings* (Proverbs 5:21) — set, as in Sirach, in the very chapter against the strange woman — and *The eyes of Yahuah (LORD) are in every place, beholding the evil and the good* (Proverbs 15:3). David found no darkness to hide in: *Whither shall I go from thy spirit? or whither shall I flee from thy presence?* (Psalm 139:7). And on the mount Yahusha drives the all-seeing eye inward, to the heart that thinks itself unseen: *whosoever looketh on a woman to lust after her hath committed adultery with her already in his heart* (Matthew 5:28). The walls never covered anyone — the secret place was never secret.',
       sv.verse_id, ev.verse_id, 'extras', 58859
  FROM _session253_sir23_lookup sv, _session253_sir23_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=23 AND sv.verse_number=18
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=23 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-23-fear-of-yahuah-the-commandments',
       E'Nothing better than the fear of Yahuah, nothing sweeter than His commandments',
       E'Ben Sira closes the chapter not on judgment but on the covenant''s sweetest end: *And they that remain shall know that there is nothing better than the fear of Yahuah (God), and that there is nothing sweeter than to take heed to the commandments of Yahuah (God)* (Ecclesiasticus 23:27), and *It is great glory to follow Yahuah (God), and to be received of him is long life* (Ecclesiasticus 23:28). The adulteress had despised exactly this: *first, she has disobeyed the law of the Most High* (Ecclesiasticus 23:23), and so *Her children shall not take root, and her branches shall bring forth no fruit* (Ecclesiasticus 23:25). The covenant''s whole verdict turns on the law kept or spurned. The Psalmist sings the kept commandment as sweetness — and ben Sira ends the tongue-and-heart chapter the same place Torah ends every matter: the fear of Yahuah and His commandments are the long life of the one received. Torah stands; it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 58862
  FROM _session253_sir23_lookup sv, _session253_sir23_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=23 AND sv.verse_number=23
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=23 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: sirach-23-set-a-watch-before-my-mouth
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ecclesiasticus 22:27 — *Who shall set a watch before my mouth, and a seal of wisdom upon my lips, that I fall not suddenly by them, and that my tongue destroy me not?* The chapter before voices the very prayer Sirach 23:2 opens with — a seal upon the lips.'
  FROM cross_reference_threads t, cross_references x, _session253_sir23_lookup sv, _session253_sir23_lookup tv
 WHERE t.slug='sirach-23-set-a-watch-before-my-mouth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=23 AND sv.verse_number=2
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=22 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 139:4 — *For there is not a word in my tongue, but, lo, O Yahuah (LORD), thou knowest it altogether.* David''s psalm answers the plea of Sirach 23:2: the One who would discipline the heart already knows the word before it is uttered.'
  FROM cross_reference_threads t, cross_references x, _session253_sir23_lookup sv, _session253_sir23_lookup tv
 WHERE t.slug='sirach-23-set-a-watch-before-my-mouth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=23 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=139 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'James 1:26 — *If any man among you seem to be religious, and bridleth not his tongue, but deceiveth his own heart, this man''s religion is vain.* James echoes Sirach 23:1''s prayer not to be left to one''s own counsels — the unbridled tongue undoes all religion.'
  FROM cross_reference_threads t, cross_references x, _session253_sir23_lookup sv, _session253_sir23_lookup tv
 WHERE t.slug='sirach-23-set-a-watch-before-my-mouth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=23 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-23-accustom-not-thy-mouth-to-swearing
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 20:7 — *Thou shalt not take the name of Yahuah Elohayka (the LORD thy God) in vain; for Yahuah (LORD) will not hold him guiltless that taketh his name in vain.* Sinai''s third word stands behind Sirach 23:9''s charge not to accustom the mouth to naming the Holy One.'
  FROM cross_reference_threads t, cross_references x, _session253_sir23_lookup sv, _session253_sir23_lookup tv
 WHERE t.slug='sirach-23-accustom-not-thy-mouth-to-swearing'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=23 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 19:12 — *And ye shall not swear by my name falsely, neither shalt thou profane the name of thy Elohim (God): I am Yahuah (LORD).* The holiness code names the false oath as a profaning of the Name — exactly the swearing Sirach 23:9 forbids.'
  FROM cross_reference_threads t, cross_references x, _session253_sir23_lookup sv, _session253_sir23_lookup tv
 WHERE t.slug='sirach-23-accustom-not-thy-mouth-to-swearing'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=23 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 5:34 — *But I say unto you, Swear not at all; neither by heaven; for it is Elohim''s (God''s) throne.* On the mount Yahusha presses Sirach 23:9 to its root: not careless swearing tempered, but the oath forsworn altogether.'
  FROM cross_reference_threads t, cross_references x, _session253_sir23_lookup sv, _session253_sir23_lookup tv
 WHERE t.slug='sirach-23-accustom-not-thy-mouth-to-swearing'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=23 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 5:37 — *But let your communication be, Yea, yea; Nay, nay: for whatsoever is more than these cometh of evil.* The plain speech that needs no oath is the mouth Sirach 23:9 sought to discipline.'
  FROM cross_reference_threads t, cross_references x, _session253_sir23_lookup sv, _session253_sir23_lookup tv
 WHERE t.slug='sirach-23-accustom-not-thy-mouth-to-swearing'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=23 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'James 5:12 — *But above all things, my brethren, swear not, neither by heaven, neither by the earth, neither by any other oath: but let your yea be yea; and your nay, nay; lest ye fall into condemnation.* James warns of the condemnation that Sirach 23:11 calls the plague that never departs the swearer''s house.'
  FROM cross_reference_threads t, cross_references x, _session253_sir23_lookup sv, _session253_sir23_lookup tv
 WHERE t.slug='sirach-23-accustom-not-thy-mouth-to-swearing'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=23 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=5 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-23-discipline-of-the-mouth
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 13:3 — *He that keepeth his mouth keepeth his life: but he that openeth wide his lips shall have destruction.* Proverbs says in a line what Sirach 23:7 names the discipline of the mouth — to keep it is to keep one''s life.'
  FROM cross_reference_threads t, cross_references x, _session253_sir23_lookup sv, _session253_sir23_lookup tv
 WHERE t.slug='sirach-23-discipline-of-the-mouth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=23 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=13 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 18:21 — *Death and life are in the power of the tongue: and they that love it shall eat the fruit thereof.* The stakes of Sirach 23:7''s discipline: the tongue holds death and life.'
  FROM cross_reference_threads t, cross_references x, _session253_sir23_lookup sv, _session253_sir23_lookup tv
 WHERE t.slug='sirach-23-discipline-of-the-mouth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=23 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=18 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ecclesiasticus 28:17 — *The stroke of the whip makes marks in the flesh: but the stroke of the tongue breaks the bones.* Ben Sira''s own later word measures the ruin of the opprobrious mouth of Sirach 23:15 — the tongue wounds deeper than the whip.'
  FROM cross_reference_threads t, cross_references x, _session253_sir23_lookup sv, _session253_sir23_lookup tv
 WHERE t.slug='sirach-23-discipline-of-the-mouth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=23 AND sv.verse_number=15
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=28 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'James 3:2 — *For in many things we offend all. If any man offend not in word, the same is a perfect man, and able also to bridle the whole body.* James makes Sirach 23:7''s kept mouth the measure of the perfect man.'
  FROM cross_reference_threads t, cross_references x, _session253_sir23_lookup sv, _session253_sir23_lookup tv
 WHERE t.slug='sirach-23-discipline-of-the-mouth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=23 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=3 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Matthew 12:36 — *But I say unto you, That every idle word that men shall speak, they shall give account thereof in the day of judgment.* The sinner taken in his own speech of Sirach 23:8 stands before the reckoning Yahusha names for every idle word.'
  FROM cross_reference_threads t, cross_references x, _session253_sir23_lookup sv, _session253_sir23_lookup tv
 WHERE t.slug='sirach-23-discipline-of-the-mouth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=23 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=12 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-23-who-seeth-me-all-seeing-eyes
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 5:21 — *For the ways of man are before the eyes of Yahuah (LORD), and he pondereth all his goings.* Solomon sets the all-seeing eye in his own chapter against the strange woman — the very ground of Sirach 23:19.'
  FROM cross_reference_threads t, cross_references x, _session253_sir23_lookup sv, _session253_sir23_lookup tv
 WHERE t.slug='sirach-23-who-seeth-me-all-seeing-eyes'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=23 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=5 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 15:3 — *The eyes of Yahuah (LORD) are in every place, beholding the evil and the good.* No wall hides from the eye that Sirach 23:19 calls brighter than the sun.'
  FROM cross_reference_threads t, cross_references x, _session253_sir23_lookup sv, _session253_sir23_lookup tv
 WHERE t.slug='sirach-23-who-seeth-me-all-seeing-eyes'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=23 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=15 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 139:7 — *Whither shall I go from thy spirit? or whither shall I flee from thy presence?* David knows there is no darkness to compass oneself about, against the adulterer''s boast of Sirach 23:18.'
  FROM cross_reference_threads t, cross_references x, _session253_sir23_lookup sv, _session253_sir23_lookup tv
 WHERE t.slug='sirach-23-who-seeth-me-all-seeing-eyes'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=23 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=139 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 5:28 — *But I say unto you, That whosoever looketh on a woman to lust after her hath committed adultery with her already in his heart.* Yahusha sees the secret thought of Sirach 23:18 itself as the act — the heart is never hidden.'
  FROM cross_reference_threads t, cross_references x, _session253_sir23_lookup sv, _session253_sir23_lookup tv
 WHERE t.slug='sirach-23-who-seeth-me-all-seeing-eyes'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=23 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Job 31:1 — *I made a covenant with mine eyes; why then should I think upon a maid?* Job is the man who refuses the adulterer''s reasoning of Sirach 23:18 — guarding the eye before the heart ever thinks.'
  FROM cross_reference_threads t, cross_references x, _session253_sir23_lookup sv, _session253_sir23_lookup tv
 WHERE t.slug='sirach-23-who-seeth-me-all-seeing-eyes'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=23 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=31 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-23-fear-of-yahuah-the-commandments
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Job 34:21 — *For his eyes are upon the ways of man, and he seeth all his goings.* The same beholding eye brings the secret adulteress of Sirach 23:23, who disobeyed the law of the Most High, into the congregation for inquisition.'
  FROM cross_reference_threads t, cross_references x, _session253_sir23_lookup sv, _session253_sir23_lookup tv
 WHERE t.slug='sirach-23-fear-of-yahuah-the-commandments'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=23 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=34 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 12:3 — *A man shall not be established by wickedness: but the root of the righteous shall not be moved.* Solomon names the very contrast of Sirach 23:25: the wicked take no root, but the righteous cannot be moved.'
  FROM cross_reference_threads t, cross_references x, _session253_sir23_lookup sv, _session253_sir23_lookup tv
 WHERE t.slug='sirach-23-fear-of-yahuah-the-commandments'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=23 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=12 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 30:20 — *That thou mayest love Yahuah Elohayka (the LORD thy God), and that thou mayest obey his voice, and that thou mayest cleave unto him: for he is thy life, and the length of thy days: that thou mayest dwell in the land which Yahuah (LORD) sware unto thy fathers, to Abraham, to Isaac, and to Jacob, to give them.* Moses names the obedient cleaving as life and length of days — the same long life Sirach 23:28 promises the one received of Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session253_sir23_lookup sv, _session253_sir23_lookup tv
 WHERE t.slug='sirach-23-fear-of-yahuah-the-commandments'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=23 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

