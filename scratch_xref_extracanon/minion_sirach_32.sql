-- ----- fragment: minion_ecclesiasticus_32.sql (session253 ecclesiasticus 32) -----
-- Source anchor: apocrypha/ecclesiasticus ch32. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: sir32 (view _session253_sir32_lookup). Sort band base 59075, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_sir32_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ecclesiasticus-32-word-in-season
  ('apocrypha', 'ecclesiasticus', 32, 3, 'canon', 'proverbs', 15, 23, 'free', E'Proverbs 15:23 — *A man hath joy by the answer of his mouth: and a word spoken in due season, how good is it!* The elder''s seasoned speech in Sirach 32:3 is Proverbs'' word in due season.'),
  ('apocrypha', 'ecclesiasticus', 32, 8, 'canon', 'proverbs', 18, 13, 'free', E'Proverbs 18:13 — *He that answereth a matter before he heareth it, it is folly and shame unto him.* The short, knowing speech that holds its tongue in Sirach 32:8 is the wisdom against the hasty answer.'),
  ('apocrypha', 'ecclesiasticus', 32, 4, 'canon', 'ecclesiastes', 3, 7, 'free', E'Ecclesiastes 3:7 — *A time to rend, and a time to sew; a time to keep silence, and a time to speak.* Sirach 32:4''s ''shew not forth wisdom out of time'' is the Preacher''s time to keep silence.'),
  -- thread: ecclesiasticus-32-multitude-of-counsel
  ('apocrypha', 'ecclesiasticus', 32, 19, 'canon', 'proverbs', 11, 14, 'free', E'Proverbs 11:14 — *Where no counsel is, the people fall: but in the multitude of counsellors there is safety.* ''Do nothing without advice'' in Sirach 32:19 is the proverb of safety in the multitude of counsellors.'),
  ('apocrypha', 'ecclesiasticus', 32, 18, 'canon', 'james', 4, 13, 'free', E'James 4:13 — *Go to now, ye that say, To day or to morrow we will go into such a city, and continue there a year, and buy and sell, and get gain.* The proud man who acts without counsel in Sirach 32:18 is James''s presumptuous planner.'),
  ('apocrypha', 'ecclesiasticus', 32, 18, 'canon', 'james', 4, 14, 'free', E'James 4:14 — *Whereas ye know not what shall be on the morrow. For what is your life? It is even a vapour, that appeareth for a little time, and then vanisheth away.* The self-confident man of Sirach 32:18 forgets that his morrow is not his own.'),
  -- thread: ecclesiasticus-32-fear-of-yahuah-discipline
  ('apocrypha', 'ecclesiasticus', 32, 14, 'canon', 'proverbs', 1, 7, 'free', E'Proverbs 1:7 — *The fear of Yahuah (LORD) is the beginning of knowledge: but fools despise wisdom and instruction.* The fearing soul that receives discipline in Sirach 32:14 is the proverb''s beginning of knowledge.'),
  ('apocrypha', 'ecclesiasticus', 32, 14, 'canon', 'psalms', 119, 2, 'free', E'Psalm 119:2 — *Blessed are they that keep his testimonies, and that seek him with the whole heart.* ''They that seek him early shall find favour'' in Sirach 32:14 is the blessing of those who seek him with the whole heart.'),
  ('apocrypha', 'ecclesiasticus', 32, 16, 'apocrypha', 'ecclesiasticus', 1, 14, 'extras', E'Ecclesiasticus 1:14 — *To fear Yahuah (God) is the beginning of wisdom: and it was created with the faithful in the womb.* Ben Sira''s own opening makes the fear of Yahuah that finds judgment in Sirach 32:16 the beginning of wisdom.'),
  ('apocrypha', 'ecclesiasticus', 32, 16, 'apocrypha', 'ecclesiasticus', 19, 20, 'extras', E'Ecclesiasticus 19:20 — *The fear of Yahuah (God) is all wisdom; and in all wisdom is the performance of the law, and the knowledge of his omnipotency.* Sirach binds the fear of 32:16 directly to the performance of the law.'),
  -- thread: ecclesiasticus-32-keeping-the-commandments
  ('apocrypha', 'ecclesiasticus', 32, 23, 'canon', 'deuteronomy', 30, 11, 'free', E'Deuteronomy 30:11 — *For this commandment which I command thee this day, it is not hidden from thee, neither is it far off.* ''The keeping of the commandments'' in Sirach 32:23 is Moses'' commandment that is not hidden nor far off.'),
  ('apocrypha', 'ecclesiasticus', 32, 23, 'canon', 'deuteronomy', 30, 14, 'free', E'Deuteronomy 30:14 — *But the word is very nigh unto thee, in thy mouth, and in thy heart, that thou mayest do it.* Sirach 32:23''s trust shown in good work is Moses'' word very nigh, that thou mayest do it.'),
  ('apocrypha', 'ecclesiasticus', 32, 24, 'canon', 'romans', 2, 13, 'free', E'Romans 2:13 — *For not the hearers of the law are just before Elohim (God), but the doers of the law shall be justified.* He that takes heed to the commandment in Sirach 32:24 is Paul''s doer of the law who shall be justified.'),
  ('apocrypha', 'ecclesiasticus', 32, 24, 'canon', 'james', 1, 22, 'free', E'James 1:22 — *But be ye doers of the word, and not hearers only, deceiving your own selves.* Taking heed to the commandment in Sirach 32:24 is James''s call to be a doer, not a hearer only.'),
  ('apocrypha', 'ecclesiasticus', 32, 23, 'canon', 'james', 1, 25, 'free', E'James 1:25 — *But whoso looketh into the perfect law of liberty, and continueth therein, he being not a forgetful hearer, but a doer of the work, this man shall be blessed in his deed.* ''This is the keeping of the commandments'' in Sirach 32:23 is the doer of the work, blessed in his deed.'),
  -- thread: ecclesiasticus-32-humble-host
  ('apocrypha', 'ecclesiasticus', 32, 1, 'canon', 'proverbs', 18, 12, 'free', E'Proverbs 18:12 — *Before destruction the heart of man is haughty, and before honour is humility.* The master of the feast who lifts not himself up in Sirach 32:1 walks the proverb''s road where humility goes before honour.'),
  ('apocrypha', 'ecclesiasticus', 32, 10, 'canon', 'proverbs', 15, 23, 'free', E'Proverbs 15:23 — *A man hath joy by the answer of his mouth: and a word spoken in due season, how good is it!* The favour that goes before the shamefaced man in Sirach 32:10 is the joy of the well-timed, well-ordered word.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_sir32_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_sir32_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-32-word-in-season',
       E'A word spoken in due season',
       E'Ben Sira sets the rule of the feast and the table of speech: *Speak, you that are the elder, for it becometh you, but with sound judgment; and hinder not musick* (Ecclesiasticus 32:3), and to the young, *Let your speech be short, comprehending much in few words; be as one that knoweth and yet holdeth his tongue* (Ecclesiasticus 32:8). It ain''t new — this is Proverbs'' wisdom of timely speech: *A man hath joy by the answer of his mouth: and a word spoken in due season, how good is it!* (Proverbs 15:23), and its rebuke of the hasty tongue, *He that answereth a matter before he heareth it, it is folly and shame unto him* (Proverbs 18:13). The Preacher set every word in its hour — *A time to rend, and a time to sew; a time to keep silence, and a time to speak* (Ecclesiastes 3:7) — and James drew the same wisdom to its end, *be swift to hear, slow to speak.* The seasoned word, not the abundant one.',
       sv.verse_id, ev.verse_id, 'extras', 59075
  FROM _session253_sir32_lookup sv, _session253_sir32_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=32 AND sv.verse_number=3
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=32 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-32-multitude-of-counsel',
       E'Do nothing without advice',
       E'*Do nothing without advice; and when you have once done, repent not* (Ecclesiasticus 32:19), for *A man of counsel will be considerate; but a strange and proud man is not daunted with fear, even when of himself he has done without counsel* (Ecclesiasticus 32:18). This is the plain proverb of safety in counsel: *Where no counsel is, the people fall: but in the multitude of counsellors there is safety* (Proverbs 11:14). And the presumption Ben Sira warns of — the man who plans without seeking — is the very boast James rebukes: *Go to now, ye that say, To day or to morrow we will go into such a city, and continue there a year, and buy and sell, and get gain* (James 4:13), *Whereas ye know not what shall be on the morrow. For what is your life? It is even a vapour* (James 4:14). The wise take counsel; the proud go without.',
       sv.verse_id, ev.verse_id, 'extras', 59078
  FROM _session253_sir32_lookup sv, _session253_sir32_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=32 AND sv.verse_number=18
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=32 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-32-fear-of-yahuah-discipline',
       E'Whoso fears Yahuah will receive his discipline',
       E'The chapter turns from the table to the heart: *Whoso fears Yahuah (God) will receive his discipline; and they that seek him early shall find favour* (Ecclesiasticus 32:14), and *They that fear Yahuah (God) shall find judgment, and shall kindle justice as a light* (Ecclesiasticus 32:16). It ain''t new — this is the root proverb, *The fear of Yahuah (LORD) is the beginning of knowledge: but fools despise wisdom and instruction* (Proverbs 1:7), and the seeking that Psalm 119 calls blessed: *Blessed are they that keep his testimonies, and that seek him with the whole heart* (Psalm 119:2). Ben Sira''s own book opens on the same fear — *To fear Yahuah (God) is the beginning of wisdom: and it was created with the faithful in the womb* (Ecclesiasticus 1:14) — and binds it to the law itself: *The fear of Yahuah (God) is all wisdom; and in all wisdom is the performance of the law* (Ecclesiasticus 19:20). The fear of Yahuah is the doing of the law.',
       sv.verse_id, ev.verse_id, 'extras', 59081
  FROM _session253_sir32_lookup sv, _session253_sir32_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=32 AND sv.verse_number=14
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=32 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-32-keeping-the-commandments',
       E'This is the keeping of the commandments',
       E'The chapter ends on the doer of the law: *In every good work trust your own soul; for this is the keeping of the commandments* (Ecclesiasticus 32:23), and *He that believes in Yahuah (God) takes heed to the commandment; and he that trusts in him shall fare never the worse* (Ecclesiasticus 32:24). This is no new gospel — it is Moses'' word that the commandment is not far off: *For this commandment which I command thee this day, it is not hidden from thee, neither is it far off* (Deuteronomy 30:11), *But the word is very nigh unto thee, in thy mouth, and in thy heart, that thou mayest do it* (Deuteronomy 30:14). Paul preached the very same — not the hearer but *the doers of the law shall be justified.* (Romans 2:13) — and so did James: *But be ye doers of the word, and not hearers only, deceiving your own selves* (James 1:22), *But whoso looketh into the perfect law of liberty, and continueth therein, he being not a forgetful hearer, but a doer of the work, this man shall be blessed in his deed* (James 1:25). Ben Sira''s own counsel agrees: *If you desire wisdom, keep the commandments* (Ecclesiasticus 1:26). The Torah stands; the blessing is on the doer.',
       sv.verse_id, ev.verse_id, 'extras', 59084
  FROM _session253_sir32_lookup sv, _session253_sir32_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=32 AND sv.verse_number=23
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=32 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-32-humble-host',
       E'Lift not thyself up, but be among them',
       E'Ben Sira''s first word to the master of the feast is humility: *If you be made the master of a feast, lift not thyself up, but be among them as one of the rest; take diligent care for them, and so sit down* (Ecclesiasticus 32:1), and *If you be among great men, make not thyself equal with them; and when ancient men are in place, use not many words* (Ecclesiasticus 32:9). It ain''t new — this is the proverb of the lowered seat, *before honour is humility*, the same wisdom the Messiah taught at the table, ''sit not down in the highest room... go and sit down in the lowest room.'' Ben Sira even gives its likeness in the natural order: *Before the thunder goes lightning; and before a shamefaced man shall go favour* (Ecclesiasticus 32:10) — favour goes before the modest as light before thunder. The exalted self is abased; the lowly host receives the crown of his well ordering.',
       sv.verse_id, ev.verse_id, 'extras', 59087
  FROM _session253_sir32_lookup sv, _session253_sir32_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=32 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=32 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ecclesiasticus-32-word-in-season
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 15:23 — *A man hath joy by the answer of his mouth: and a word spoken in due season, how good is it!* The elder''s seasoned speech in Sirach 32:3 is Proverbs'' word in due season.'
  FROM cross_reference_threads t, cross_references x, _session253_sir32_lookup sv, _session253_sir32_lookup tv
 WHERE t.slug='ecclesiasticus-32-word-in-season'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=32 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=15 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 18:13 — *He that answereth a matter before he heareth it, it is folly and shame unto him.* The short, knowing speech that holds its tongue in Sirach 32:8 is the wisdom against the hasty answer.'
  FROM cross_reference_threads t, cross_references x, _session253_sir32_lookup sv, _session253_sir32_lookup tv
 WHERE t.slug='ecclesiasticus-32-word-in-season'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=32 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=18 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ecclesiastes 3:7 — *A time to rend, and a time to sew; a time to keep silence, and a time to speak.* Sirach 32:4''s ''shew not forth wisdom out of time'' is the Preacher''s time to keep silence.'
  FROM cross_reference_threads t, cross_references x, _session253_sir32_lookup sv, _session253_sir32_lookup tv
 WHERE t.slug='ecclesiasticus-32-word-in-season'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=32 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=3 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-32-multitude-of-counsel
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 11:14 — *Where no counsel is, the people fall: but in the multitude of counsellors there is safety.* ''Do nothing without advice'' in Sirach 32:19 is the proverb of safety in the multitude of counsellors.'
  FROM cross_reference_threads t, cross_references x, _session253_sir32_lookup sv, _session253_sir32_lookup tv
 WHERE t.slug='ecclesiasticus-32-multitude-of-counsel'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=32 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=11 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'James 4:13 — *Go to now, ye that say, To day or to morrow we will go into such a city, and continue there a year, and buy and sell, and get gain.* The proud man who acts without counsel in Sirach 32:18 is James''s presumptuous planner.'
  FROM cross_reference_threads t, cross_references x, _session253_sir32_lookup sv, _session253_sir32_lookup tv
 WHERE t.slug='ecclesiasticus-32-multitude-of-counsel'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=32 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=4 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'James 4:14 — *Whereas ye know not what shall be on the morrow. For what is your life? It is even a vapour, that appeareth for a little time, and then vanisheth away.* The self-confident man of Sirach 32:18 forgets that his morrow is not his own.'
  FROM cross_reference_threads t, cross_references x, _session253_sir32_lookup sv, _session253_sir32_lookup tv
 WHERE t.slug='ecclesiasticus-32-multitude-of-counsel'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=32 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=4 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-32-fear-of-yahuah-discipline
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 1:7 — *The fear of Yahuah (LORD) is the beginning of knowledge: but fools despise wisdom and instruction.* The fearing soul that receives discipline in Sirach 32:14 is the proverb''s beginning of knowledge.'
  FROM cross_reference_threads t, cross_references x, _session253_sir32_lookup sv, _session253_sir32_lookup tv
 WHERE t.slug='ecclesiasticus-32-fear-of-yahuah-discipline'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=32 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=1 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 119:2 — *Blessed are they that keep his testimonies, and that seek him with the whole heart.* ''They that seek him early shall find favour'' in Sirach 32:14 is the blessing of those who seek him with the whole heart.'
  FROM cross_reference_threads t, cross_references x, _session253_sir32_lookup sv, _session253_sir32_lookup tv
 WHERE t.slug='ecclesiasticus-32-fear-of-yahuah-discipline'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=32 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=119 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ecclesiasticus 1:14 — *To fear Yahuah (God) is the beginning of wisdom: and it was created with the faithful in the womb.* Ben Sira''s own opening makes the fear of Yahuah that finds judgment in Sirach 32:16 the beginning of wisdom.'
  FROM cross_reference_threads t, cross_references x, _session253_sir32_lookup sv, _session253_sir32_lookup tv
 WHERE t.slug='ecclesiasticus-32-fear-of-yahuah-discipline'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=32 AND sv.verse_number=16
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ecclesiasticus 19:20 — *The fear of Yahuah (God) is all wisdom; and in all wisdom is the performance of the law, and the knowledge of his omnipotency.* Sirach binds the fear of 32:16 directly to the performance of the law.'
  FROM cross_reference_threads t, cross_references x, _session253_sir32_lookup sv, _session253_sir32_lookup tv
 WHERE t.slug='ecclesiasticus-32-fear-of-yahuah-discipline'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=32 AND sv.verse_number=16
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=19 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-32-keeping-the-commandments
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 30:11 — *For this commandment which I command thee this day, it is not hidden from thee, neither is it far off.* ''The keeping of the commandments'' in Sirach 32:23 is Moses'' commandment that is not hidden nor far off.'
  FROM cross_reference_threads t, cross_references x, _session253_sir32_lookup sv, _session253_sir32_lookup tv
 WHERE t.slug='ecclesiasticus-32-keeping-the-commandments'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=32 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 30:14 — *But the word is very nigh unto thee, in thy mouth, and in thy heart, that thou mayest do it.* Sirach 32:23''s trust shown in good work is Moses'' word very nigh, that thou mayest do it.'
  FROM cross_reference_threads t, cross_references x, _session253_sir32_lookup sv, _session253_sir32_lookup tv
 WHERE t.slug='ecclesiasticus-32-keeping-the-commandments'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=32 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 2:13 — *For not the hearers of the law are just before Elohim (God), but the doers of the law shall be justified.* He that takes heed to the commandment in Sirach 32:24 is Paul''s doer of the law who shall be justified.'
  FROM cross_reference_threads t, cross_references x, _session253_sir32_lookup sv, _session253_sir32_lookup tv
 WHERE t.slug='ecclesiasticus-32-keeping-the-commandments'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=32 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=2 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'James 1:22 — *But be ye doers of the word, and not hearers only, deceiving your own selves.* Taking heed to the commandment in Sirach 32:24 is James''s call to be a doer, not a hearer only.'
  FROM cross_reference_threads t, cross_references x, _session253_sir32_lookup sv, _session253_sir32_lookup tv
 WHERE t.slug='ecclesiasticus-32-keeping-the-commandments'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=32 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'James 1:25 — *But whoso looketh into the perfect law of liberty, and continueth therein, he being not a forgetful hearer, but a doer of the work, this man shall be blessed in his deed.* ''This is the keeping of the commandments'' in Sirach 32:23 is the doer of the work, blessed in his deed.'
  FROM cross_reference_threads t, cross_references x, _session253_sir32_lookup sv, _session253_sir32_lookup tv
 WHERE t.slug='ecclesiasticus-32-keeping-the-commandments'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=32 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-32-humble-host
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 18:12 — *Before destruction the heart of man is haughty, and before honour is humility.* The master of the feast who lifts not himself up in Sirach 32:1 walks the proverb''s road where humility goes before honour.'
  FROM cross_reference_threads t, cross_references x, _session253_sir32_lookup sv, _session253_sir32_lookup tv
 WHERE t.slug='ecclesiasticus-32-humble-host'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=32 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=18 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 15:23 — *A man hath joy by the answer of his mouth: and a word spoken in due season, how good is it!* The favour that goes before the shamefaced man in Sirach 32:10 is the joy of the well-timed, well-ordered word.'
  FROM cross_reference_threads t, cross_references x, _session253_sir32_lookup sv, _session253_sir32_lookup tv
 WHERE t.slug='ecclesiasticus-32-humble-host'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=32 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=15 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

