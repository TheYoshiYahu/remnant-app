-- ----- fragment: minion_ecclesiasticus_26.sql (session253 ecclesiasticus 26) -----
-- Source anchor: apocrypha/ecclesiasticus ch26. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: sir26 (view _session253_sir26_lookup). Sort band base 58925, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_sir26_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ecclesiasticus-26-good-wife-from-yahuah
  ('apocrypha', 'ecclesiasticus', 26, 3, 'canon', 'proverbs', 18, 22, 'free', E'Proverbs 18:22 — *Whoso findeth a wife findeth a good thing, and obtaineth favour of Yahuah (LORD).* The good wife is favour obtained of Yahuah, exactly Ben Sira''s ''portion of them that fear Yahuah'' in Sirach 26:3.'),
  ('apocrypha', 'ecclesiasticus', 26, 3, 'canon', 'proverbs', 19, 14, 'free', E'Proverbs 19:14 — *House and riches are the inheritance of fathers: and a prudent wife is from Yahuah (LORD).* The prudent wife given from Yahuah is the same gift Sirach 26:3 calls a good portion bestowed.'),
  ('apocrypha', 'ecclesiasticus', 26, 14, 'canon', 'james', 1, 17, 'free', E'James 1:17 — *Every good gift and every perfect gift is from above, and cometh down from the Father of lights, with whom is no variableness, neither shadow of turning.* James names the down-from-above grammar of every gift, of which Sirach 26:14''s silent loving woman ''a gift of Yahuah'' is one.'),
  -- thread: ecclesiasticus-26-virtuous-wife-her-price
  ('apocrypha', 'ecclesiasticus', 26, 16, 'canon', 'proverbs', 31, 10, 'free', E'Proverbs 31:10 — *Who can find a virtuous woman? for her price is far above rubies.* The virtuous woman beyond price is the good wife whose beauty in ordering her house shines like the sun in Sirach 26:16.'),
  ('apocrypha', 'ecclesiasticus', 26, 23, 'canon', 'proverbs', 31, 30, 'free', E'Proverbs 31:30 — *Favour is deceitful, and beauty is vain: but a woman that feareth Yahuah (LORD), she shall be praised.* The fear of Yahuah, not beauty, marks the godly woman ''given to him that fears Yahuah'' in Sirach 26:23.'),
  ('apocrypha', 'ecclesiasticus', 26, 16, 'canon', 'proverbs', 31, 11, 'free', E'Proverbs 31:11 — *The heart of her husband doth safely trust in her, so that he shall have no need of spoil.* The husband''s safe trust answers Sirach 26:16''s good wife who lights and orders his whole house.'),
  ('apocrypha', 'ecclesiasticus', 26, 26, 'canon', 'proverbs', 12, 4, 'free', E'Proverbs 12:4 — *A virtuous woman is a crown to her husband: but she that maketh ashamed is as rottenness in his bones.* The crown-versus-rottenness contrast matches Sirach 26:26''s wife judged wise for honouring versus ungodly for dishonouring her husband.'),
  -- thread: ecclesiasticus-26-eye-of-lust-flower-of-age
  ('apocrypha', 'ecclesiasticus', 26, 19, 'canon', 'matthew', 5, 28, 'free', E'Matthew 5:28 — *But I say unto you, That whosoever looketh on a woman to lust after her hath committed adultery with her already in his heart.* The Sermon traces lust to the eye and heart, the very inward purity Sirach 26:19 guards as ''the flower of your age.'''),
  ('apocrypha', 'ecclesiasticus', 26, 9, 'apocrypha', 'ecclesiasticus', 9, 8, 'extras', E'Ecclesiasticus 9:8 — *Turn away your eye from a beautiful woman, and look not upon another''s beauty; for many have been deceived by the beauty of a woman; for herewith love is kindled as a fire.* Ben Sira''s own earlier counsel on the deceiving eye undergirds Sirach 26:9''s reading of whoredom in haughty looks and eyelids.'),
  ('apocrypha', 'ecclesiasticus', 26, 9, 'canon', 'proverbs', 11, 22, 'free', E'Proverbs 11:22 — *As a jewel of gold in a swine''s snout, so is a fair woman which is without discretion.* The fair-but-indiscreet woman of Proverbs is the haughty-eyed one Sirach 26:9 warns marks whoredom.'),
  ('apocrypha', 'ecclesiasticus', 26, 19, 'canon', 'proverbs', 5, 18, 'free', E'Proverbs 5:18 — *Let thy fountain be blessed: and rejoice with the wife of thy youth.* The blessed fountain kept to the wife of youth answers Sirach 26:19''s charge to keep the flower of one''s age sound and not give one''s strength to strangers.'),
  -- thread: ecclesiasticus-26-scourge-of-the-tongue
  ('apocrypha', 'ecclesiasticus', 26, 6, 'canon', 'james', 3, 8, 'free', E'James 3:8 — *But the tongue can no man tame; it is an unruly evil, full of deadly poison.* James names the untameable poisonous tongue that is Sirach 26:6''s ''scourge of the tongue which communicateth with all.'''),
  ('apocrypha', 'ecclesiasticus', 26, 27, 'canon', 'proverbs', 21, 9, 'free', E'Proverbs 21:9 — *It is better to dwell in a corner of the housetop, than with a brawling woman in a wide house.* The brawling woman one flees to the rooftop is the loud-crying scold of Sirach 26:27.'),
  ('apocrypha', 'ecclesiasticus', 26, 6, 'canon', 'proverbs', 27, 15, 'free', E'Proverbs 27:15 — *A continual dropping in a very rainy day and a contentious woman are alike.* The ceaseless dropping of the contentious woman is the unrelenting ''grief of heart'' Sirach 26:6 sets beside the scourge of the tongue.'),
  -- thread: ecclesiasticus-26-beginning-of-sin-merchant
  ('apocrypha', 'ecclesiasticus', 26, 22, 'apocrypha', 'ecclesiasticus', 25, 24, 'extras', E'Ecclesiasticus 25:24 — *Of the woman came the beginning of sin, and through her we all die.* Ben Sira''s own Eve-allusion grounds Sirach 26:22''s harlot-versus-wife weighing of the woman''s power for death or for life.'),
  ('apocrypha', 'ecclesiasticus', 26, 22, 'canon', 'genesis', 3, 6, 'free', E'Genesis 3:6 — *And when the woman saw that the tree was good for food, and that it was pleasant to the eyes, and a tree to be desired to make one wise, she took of the fruit thereof, and did eat, and gave also unto her husband with her; and he did eat.* Eden is the ''beginning of sin'' Sirach reads behind the woman who is a tower of death or life to her husband in Sirach 26:22.'),
  ('apocrypha', 'ecclesiasticus', 26, 22, 'canon', '1-timothy', 2, 14, 'free', E'1 Timothy 2:14 — *And Adam was not deceived, but the woman being deceived was in the transgression.* Paul''s Eden allusion echoes the same beginning-of-sin reading that shadows Sirach 26:22.'),
  ('apocrypha', 'ecclesiasticus', 26, 29, 'canon', 'proverbs', 11, 21, 'free', E'Proverbs 11:21 — *Though hand join in hand, the wicked shall not be unpunished: but the seed of the righteous shall be delivered.* The wicked merchant of Sirach 26:29 ''shall not be freed from sin,'' yet the righteous seed is delivered.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_sir26_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_sir26_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-26-good-wife-from-yahuah',
       E'A good wife is a good portion — given to him that feareth Yahuah',
       E'Ben Sira opens with the gift: *Blessed is the man that has a virtuous wife, for the number of his days shall be double.* (Ecclesiasticus 26:1) — and names her source, *A good wife is a good portion, which shall be given in the portion of them that fear Yahuah (God).* (Ecclesiasticus 26:3) She is not earned but bestowed: *A silent and loving woman is a gift of Yahuah (God); and there is nothing so much worth as a mind well instructed.* (Ecclesiasticus 26:14) It ain''t new — the Proverbs already say it. *Whoso findeth a wife findeth a good thing, and obtaineth favour of Yahuah (LORD).* (Proverbs 18:22) And lest the man boast as if he chose well, *House and riches are the inheritance of fathers: and a prudent wife is from Yahuah (LORD).* (Proverbs 19:14) The same down-from-above grammar James later carries: *Every good gift and every perfect gift is from above, and cometh down from the Father of lights, with whom is no variableness, neither shadow of turning.* (James 1:17) The wife who feareth Yahuah is herself a portion given out of the portion of them that fear Him.',
       sv.verse_id, ev.verse_id, 'extras', 58925
  FROM _session253_sir26_lookup sv, _session253_sir26_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=26 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=26 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-26-virtuous-wife-her-price',
       E'Her price above rubies — the beauty of a good wife ordering her house',
       E'Ben Sira paints her in temple-light: *As the sun when it ariseth in the high heaven; so is the beauty of a good wife in the ordering of her house.* (Ecclesiasticus 26:16) *As the clear light is upon the holy candlestick; so is the beauty of the face in ripe age.* (Ecclesiasticus 26:17) And he weighs her: *A wicked woman is given as a portion to a wicked man: but a godly woman is given to him that fears Yahuah (God).* (Ecclesiasticus 26:23) This is Proverbs 31 set to music — *Who can find a virtuous woman? for her price is far above rubies.* (Proverbs 31:10) Her worth is not her face but her fear of Yahuah: *Favour is deceitful, and beauty is vain: but a woman that feareth Yahuah (LORD), she shall be praised.* (Proverbs 31:30) Her husband rests in her, *The heart of her husband doth safely trust in her, so that he shall have no need of spoil.* (Proverbs 31:11) She is his crown, *A virtuous woman is a crown to her husband: but she that maketh ashamed is as rottenness in his bones.* (Proverbs 12:4) It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 58928
  FROM _session253_sir26_lookup sv, _session253_sir26_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=26 AND sv.verse_number=16
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=26 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-26-eye-of-lust-flower-of-age',
       E'Against the eye of lust — keep the flower of thy age sound',
       E'Ben Sira warns of the wandering eye and the wandering body: *The whoredom of a woman may be known in her haughty looks and eyelids.* (Ecclesiasticus 26:9) *She will open her mouth, as a thirsty traveller when he has found a fountain, and drink of every water near her: by every hedge will she sit down, and open her quiver against every arrow.* (Ecclesiasticus 26:12) Against this he charges the son to keep his own vessel pure: *My son, keep the flower of your age sound; and give not your strength to strangers.* (Ecclesiasticus 26:19) The Master on the mountain reaches the same root the sage did — adultery is in the eye before the deed: *But I say unto you, That whosoever looketh on a woman to lust after her hath committed adultery with her already in his heart.* (Matthew 5:28) Sirach itself had already said *Turn away your eye from a beautiful woman, and look not upon another''s beauty; for many have been deceived by the beauty of a woman; for herewith love is kindled as a fire.* (Ecclesiasticus 9:8) And beauty without discretion is the swine''s jewel, *As a jewel of gold in a swine''s snout, so is a fair woman which is without discretion.* (Proverbs 11:22) Keep the fountain to its own well: *Let thy fountain be blessed: and rejoice with the wife of thy youth.* (Proverbs 5:18)',
       sv.verse_id, ev.verse_id, 'extras', 58931
  FROM _session253_sir26_lookup sv, _session253_sir26_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=26 AND sv.verse_number=9
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=26 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-26-scourge-of-the-tongue',
       E'A scourge of the tongue — the brawling and the loud-crying woman',
       E'Among the griefs of the heart Ben Sira numbers the tongue: *But a grief of heart and sorrow is a woman that is jealous over another woman, and a scourge of the tongue which communicateth with all.* (Ecclesiasticus 26:6) *A drunken woman and a gadder abroad causeth great anger, and she will not cover her own shame.* (Ecclesiasticus 26:8) *A loud crying woman and a scold shall be sought out to drive away the enemies.* (Ecclesiasticus 26:27) The ''scourge of the tongue'' is the very member James calls untameable: *But the tongue can no man tame; it is an unruly evil, full of deadly poison.* (James 3:8) Proverbs would sooner take the rooftop or the wilderness: *It is better to dwell in a corner of the housetop, than with a brawling woman in a wide house.* (Proverbs 21:9) For her contention never lets up, *A continual dropping in a very rainy day and a contentious woman are alike.* (Proverbs 27:15) The wisdom of the tongue is one across the whole library.',
       sv.verse_id, ev.verse_id, 'extras', 58934
  FROM _session253_sir26_lookup sv, _session253_sir26_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=26 AND sv.verse_number=6
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=26 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-26-beginning-of-sin-merchant',
       E'Of the woman came the beginning of sin — and the merchant''s snare',
       E'Beneath the chapter''s warnings runs Ben Sira''s grave judgment, set a chapter earlier: *Of the woman came the beginning of sin, and through her we all die.* (Ecclesiasticus 25:24) That sentence reads Eden — *And when the woman saw that the tree was good for food, and that it was pleasant to the eyes, and a tree to be desired to make one wise, she took of the fruit thereof, and did eat, and gave also unto her husband with her; and he did eat.* (Genesis 3:6) Paul carries the same allusion: *And Adam was not deceived, but the woman being deceived was in the transgression.* (1 Timothy 2:14) Yet the same trade in sin is not the woman''s alone — the chapter closes on the merchant: *A merchant shall hardly keep himself from doing wrong; and an huckster shall not be freed from sin.* (Ecclesiasticus 26:29) None who deals in deceit goes unpunished, *Though hand join in hand, the wicked shall not be unpunished: but the seed of the righteous shall be delivered.* (Proverbs 11:21) Sin entered, and the seed is still kept.',
       sv.verse_id, ev.verse_id, 'extras', 58937
  FROM _session253_sir26_lookup sv, _session253_sir26_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=26 AND sv.verse_number=22
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=26 AND ev.verse_number=29
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ecclesiasticus-26-good-wife-from-yahuah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 18:22 — *Whoso findeth a wife findeth a good thing, and obtaineth favour of Yahuah (LORD).* The good wife is favour obtained of Yahuah, exactly Ben Sira''s ''portion of them that fear Yahuah'' in Sirach 26:3.'
  FROM cross_reference_threads t, cross_references x, _session253_sir26_lookup sv, _session253_sir26_lookup tv
 WHERE t.slug='ecclesiasticus-26-good-wife-from-yahuah'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=26 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=18 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 19:14 — *House and riches are the inheritance of fathers: and a prudent wife is from Yahuah (LORD).* The prudent wife given from Yahuah is the same gift Sirach 26:3 calls a good portion bestowed.'
  FROM cross_reference_threads t, cross_references x, _session253_sir26_lookup sv, _session253_sir26_lookup tv
 WHERE t.slug='ecclesiasticus-26-good-wife-from-yahuah'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=26 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=19 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'James 1:17 — *Every good gift and every perfect gift is from above, and cometh down from the Father of lights, with whom is no variableness, neither shadow of turning.* James names the down-from-above grammar of every gift, of which Sirach 26:14''s silent loving woman ''a gift of Yahuah'' is one.'
  FROM cross_reference_threads t, cross_references x, _session253_sir26_lookup sv, _session253_sir26_lookup tv
 WHERE t.slug='ecclesiasticus-26-good-wife-from-yahuah'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=26 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-26-virtuous-wife-her-price
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 31:10 — *Who can find a virtuous woman? for her price is far above rubies.* The virtuous woman beyond price is the good wife whose beauty in ordering her house shines like the sun in Sirach 26:16.'
  FROM cross_reference_threads t, cross_references x, _session253_sir26_lookup sv, _session253_sir26_lookup tv
 WHERE t.slug='ecclesiasticus-26-virtuous-wife-her-price'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=26 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=31 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 31:30 — *Favour is deceitful, and beauty is vain: but a woman that feareth Yahuah (LORD), she shall be praised.* The fear of Yahuah, not beauty, marks the godly woman ''given to him that fears Yahuah'' in Sirach 26:23.'
  FROM cross_reference_threads t, cross_references x, _session253_sir26_lookup sv, _session253_sir26_lookup tv
 WHERE t.slug='ecclesiasticus-26-virtuous-wife-her-price'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=26 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=31 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 31:11 — *The heart of her husband doth safely trust in her, so that he shall have no need of spoil.* The husband''s safe trust answers Sirach 26:16''s good wife who lights and orders his whole house.'
  FROM cross_reference_threads t, cross_references x, _session253_sir26_lookup sv, _session253_sir26_lookup tv
 WHERE t.slug='ecclesiasticus-26-virtuous-wife-her-price'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=26 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=31 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Proverbs 12:4 — *A virtuous woman is a crown to her husband: but she that maketh ashamed is as rottenness in his bones.* The crown-versus-rottenness contrast matches Sirach 26:26''s wife judged wise for honouring versus ungodly for dishonouring her husband.'
  FROM cross_reference_threads t, cross_references x, _session253_sir26_lookup sv, _session253_sir26_lookup tv
 WHERE t.slug='ecclesiasticus-26-virtuous-wife-her-price'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=26 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=12 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-26-eye-of-lust-flower-of-age
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 5:28 — *But I say unto you, That whosoever looketh on a woman to lust after her hath committed adultery with her already in his heart.* The Sermon traces lust to the eye and heart, the very inward purity Sirach 26:19 guards as ''the flower of your age.'''
  FROM cross_reference_threads t, cross_references x, _session253_sir26_lookup sv, _session253_sir26_lookup tv
 WHERE t.slug='ecclesiasticus-26-eye-of-lust-flower-of-age'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=26 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ecclesiasticus 9:8 — *Turn away your eye from a beautiful woman, and look not upon another''s beauty; for many have been deceived by the beauty of a woman; for herewith love is kindled as a fire.* Ben Sira''s own earlier counsel on the deceiving eye undergirds Sirach 26:9''s reading of whoredom in haughty looks and eyelids.'
  FROM cross_reference_threads t, cross_references x, _session253_sir26_lookup sv, _session253_sir26_lookup tv
 WHERE t.slug='ecclesiasticus-26-eye-of-lust-flower-of-age'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=26 AND sv.verse_number=9
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=9 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 11:22 — *As a jewel of gold in a swine''s snout, so is a fair woman which is without discretion.* The fair-but-indiscreet woman of Proverbs is the haughty-eyed one Sirach 26:9 warns marks whoredom.'
  FROM cross_reference_threads t, cross_references x, _session253_sir26_lookup sv, _session253_sir26_lookup tv
 WHERE t.slug='ecclesiasticus-26-eye-of-lust-flower-of-age'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=26 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=11 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Proverbs 5:18 — *Let thy fountain be blessed: and rejoice with the wife of thy youth.* The blessed fountain kept to the wife of youth answers Sirach 26:19''s charge to keep the flower of one''s age sound and not give one''s strength to strangers.'
  FROM cross_reference_threads t, cross_references x, _session253_sir26_lookup sv, _session253_sir26_lookup tv
 WHERE t.slug='ecclesiasticus-26-eye-of-lust-flower-of-age'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=26 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=5 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-26-scourge-of-the-tongue
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'James 3:8 — *But the tongue can no man tame; it is an unruly evil, full of deadly poison.* James names the untameable poisonous tongue that is Sirach 26:6''s ''scourge of the tongue which communicateth with all.'''
  FROM cross_reference_threads t, cross_references x, _session253_sir26_lookup sv, _session253_sir26_lookup tv
 WHERE t.slug='ecclesiasticus-26-scourge-of-the-tongue'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=26 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 21:9 — *It is better to dwell in a corner of the housetop, than with a brawling woman in a wide house.* The brawling woman one flees to the rooftop is the loud-crying scold of Sirach 26:27.'
  FROM cross_reference_threads t, cross_references x, _session253_sir26_lookup sv, _session253_sir26_lookup tv
 WHERE t.slug='ecclesiasticus-26-scourge-of-the-tongue'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=26 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=21 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 27:15 — *A continual dropping in a very rainy day and a contentious woman are alike.* The ceaseless dropping of the contentious woman is the unrelenting ''grief of heart'' Sirach 26:6 sets beside the scourge of the tongue.'
  FROM cross_reference_threads t, cross_references x, _session253_sir26_lookup sv, _session253_sir26_lookup tv
 WHERE t.slug='ecclesiasticus-26-scourge-of-the-tongue'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=26 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=27 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-26-beginning-of-sin-merchant
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ecclesiasticus 25:24 — *Of the woman came the beginning of sin, and through her we all die.* Ben Sira''s own Eve-allusion grounds Sirach 26:22''s harlot-versus-wife weighing of the woman''s power for death or for life.'
  FROM cross_reference_threads t, cross_references x, _session253_sir26_lookup sv, _session253_sir26_lookup tv
 WHERE t.slug='ecclesiasticus-26-beginning-of-sin-merchant'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=26 AND sv.verse_number=22
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=25 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:6 — *And when the woman saw that the tree was good for food, and that it was pleasant to the eyes, and a tree to be desired to make one wise, she took of the fruit thereof, and did eat, and gave also unto her husband with her; and he did eat.* Eden is the ''beginning of sin'' Sirach reads behind the woman who is a tower of death or life to her husband in Sirach 26:22.'
  FROM cross_reference_threads t, cross_references x, _session253_sir26_lookup sv, _session253_sir26_lookup tv
 WHERE t.slug='ecclesiasticus-26-beginning-of-sin-merchant'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=26 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Timothy 2:14 — *And Adam was not deceived, but the woman being deceived was in the transgression.* Paul''s Eden allusion echoes the same beginning-of-sin reading that shadows Sirach 26:22.'
  FROM cross_reference_threads t, cross_references x, _session253_sir26_lookup sv, _session253_sir26_lookup tv
 WHERE t.slug='ecclesiasticus-26-beginning-of-sin-merchant'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=26 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='1-timothy' AND tv.chapter_number=2 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Proverbs 11:21 — *Though hand join in hand, the wicked shall not be unpunished: but the seed of the righteous shall be delivered.* The wicked merchant of Sirach 26:29 ''shall not be freed from sin,'' yet the righteous seed is delivered.'
  FROM cross_reference_threads t, cross_references x, _session253_sir26_lookup sv, _session253_sir26_lookup tv
 WHERE t.slug='ecclesiasticus-26-beginning-of-sin-merchant'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=26 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=11 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

