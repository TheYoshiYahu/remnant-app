-- ----- fragment: minion_ecclesiasticus_28.sql (session253 ecclesiasticus 28) -----
-- Source anchor: apocrypha/ecclesiasticus ch28. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: sir28 (view _session253_sir28_lookup). Sort band base 58975, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_sir28_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ecclesiasticus-28-forgive-thy-neighbour
  ('apocrypha', 'ecclesiasticus', 28, 2, 'canon', 'matthew', 6, 14, 'free', E'Matthew 6:14 — *For if ye forgive men their trespasses, your heavenly Father will also forgive you:* Yahusha makes the very bargain of Sirach 28:2 — forgive the neighbour''s hurt and your own sins are forgiven.'),
  ('apocrypha', 'ecclesiasticus', 28, 3, 'canon', 'matthew', 18, 35, 'free', E'Matthew 18:35 — *So likewise shall my heavenly Father do also unto you, if ye from your hearts forgive not every one his brother their trespasses.* The unforgiving servant is condemned by exactly Sira''s logic in 28:3 — bearing hatred while seeking pardon.'),
  ('apocrypha', 'ecclesiasticus', 28, 2, 'canon', 'mark', 11, 25, 'free', E'Mark 11:25 — *And when ye stand praying, forgive, if ye have ought against any: that your Father also which is in heaven may forgive you your trespasses.* Forgiveness at the moment of prayer is precisely Sirach 28:2''s *when you prayest*.'),
  ('apocrypha', 'ecclesiasticus', 28, 1, 'canon', 'leviticus', 19, 18, 'free', E'Leviticus 19:18 — *Thou shalt not avenge, nor bear any grudge against the children of thy people, but thou shalt love thy neighbour as thyself: I am Yahuah (LORD).* The Torah''s ban on vengeance and grudge is the root Sirach 28:1 grows from.'),
  ('apocrypha', 'ecclesiasticus', 28, 4, 'canon', 'matthew', 18, 21, 'free', E'Matthew 18:21 — *Then came Peter to him, and said, Yahuah (Lord), how oft shall my brother sin against me, and I forgive him? till seven times?* Peter''s question opens the very mercy-toward-an-equal that Sirach 28:4 demands of him *which is like himself*.'),
  -- thread: ecclesiasticus-28-vengeance-is-the-Most-High
  ('apocrypha', 'ecclesiasticus', 28, 1, 'canon', 'romans', 12, 19, 'free', E'Romans 12:19 — *Dearly beloved, avenge not yourselves, but rather give place unto wrath: for it is written, Vengeance is mine; I will repay, saith Yahuah (Lord).* Paul cites the same principle as Sirach 28:1 — the avenger usurps a vengeance that is Yahuah''s alone.'),
  ('apocrypha', 'ecclesiasticus', 28, 3, 'canon', 'romans', 12, 17, 'free', E'Romans 12:17 — *Recompense to no man evil for evil. Provide things honest in the sight of all men.* Refusing to repay evil answers Sira''s rebuke in 28:3 of the man who bears hatred yet seeks pardon.'),
  ('apocrypha', 'ecclesiasticus', 28, 1, 'apocrypha', 'ecclesiasticus', 27, 28, 'extras', E'Ecclesiasticus 27:28 — *Mockery and reproach are from the proud; but vengeance, as a lion, shall lie in wait for them.* Sira''s own previous chapter sets the lion of vengeance that 28:1 and 28:23 will loose on the unforgiving.'),
  -- thread: ecclesiasticus-28-remember-the-covenant
  ('apocrypha', 'ecclesiasticus', 28, 6, 'canon', 'psalms', 90, 12, 'free', E'Psalm 90:12 — *So teach us to number our days, that we may apply our hearts unto wisdom.* Numbering one''s days is exactly Sirach 28:6''s call to *remember your end* so that enmity ceases.'),
  ('apocrypha', 'ecclesiasticus', 28, 7, 'canon', 'colossians', 3, 13, 'free', E'Colossians 3:13 — *Forbearing one another, and forgiving one another, if any man have a quarrel against any: even as Messiah (Christ) forgave you, so also do ye.* Bearing no malice and forgiving the quarrel is the Torah-rooted command Sira gives in 28:7.'),
  ('apocrypha', 'ecclesiasticus', 28, 7, 'canon', 'ephesians', 4, 32, 'free', E'Ephesians 4:32 — *And be ye kind one to another, tenderhearted, forgiving one another, even as Elohim (God) for Messiah''s (Christ’s) sake hath forgiven you.* Kindness in place of malice fulfils Sirach 28:7''s *bear no malice to your neighbour*.'),
  -- thread: ecclesiasticus-28-kindle-not-strife
  ('apocrypha', 'ecclesiasticus', 28, 8, 'canon', 'proverbs', 15, 1, 'free', E'Proverbs 15:1 — *A soft answer turneth away wrath: but grievous words stir up anger.* The soft answer is the opposite of Sirach 28:8''s *furious man* who kindles strife.'),
  ('apocrypha', 'ecclesiasticus', 28, 9, 'canon', 'proverbs', 26, 20, 'free', E'Proverbs 26:20 — *Where no wood is, there the fire goeth out: so where there is no talebearer, the strife ceaseth.* Solomon''s talebearer is Sira''s sinful man of 28:9 who *disquieteth friends*.'),
  ('apocrypha', 'ecclesiasticus', 28, 11, 'canon', 'proverbs', 12, 17, 'free', E'Proverbs 12:17 — *He that speaketh truth sheweth forth righteousness: but a false witness deceit.* The false witness feeds the hasty contention that Sirach 28:11 says *kindleth a fire*.'),
  -- thread: ecclesiasticus-28-the-backbiting-tongue
  ('apocrypha', 'ecclesiasticus', 28, 12, 'canon', 'james', 3, 6, 'free', E'James 3:6 — *And the tongue is a fire, a world of iniquity: so is the tongue among our members, that it defileth the whole body, and setteth on fire the course of nature; and it is set on fire of hell.* James''s tongue-as-fire is Sira''s spark of 28:12 that, blown, *shall burn*.'),
  ('apocrypha', 'ecclesiasticus', 28, 14, 'canon', 'james', 3, 8, 'free', E'James 3:8 — *But the tongue can no man tame; it is an unruly evil, full of deadly poison.* The untameable poison answers Sirach 28:14''s backbiting tongue that *pulled down* cities and houses.'),
  ('apocrypha', 'ecclesiasticus', 28, 18, 'canon', 'proverbs', 18, 21, 'free', E'Proverbs 18:21 — *Death and life are in the power of the tongue: and they that love it shall eat the fruit thereof.* Solomon weighs the very deadliness Sirach 28:18 names — more fallen by the tongue than the sword.'),
  ('apocrypha', 'ecclesiasticus', 28, 17, 'canon', 'proverbs', 12, 18, 'free', E'Proverbs 12:18 — *There is that speaketh like the piercings of a sword: but the tongue of the wise is health.* The sword-piercing speech is Sira''s stroke of the tongue in 28:17 that *breaks the bones*.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_sir28_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_sir28_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-28-forgive-thy-neighbour',
       E'Forgive thy neighbour — the gospel of forgiveness already here',
       E'Ben Sira preaches the gospel of forgiveness two centuries before the Sermon on the Mount: *He that revengeth shall find vengeance from Yahuah (God), and he will surely keep his sins in remembrance.* (Ecclesiasticus 28:1); *Forgive your neighbour the hurt that he has done to you, so shall your sins also be forgiven when you prayest.* (Ecclesiasticus 28:2); and the unanswerable question, *One man bears hatred against another, and does he seek pardon from Yahuah (God)?* (Ecclesiasticus 28:3) — *He sheweth no mercy to a man, which is like himself: and does he ask forgiveness of his own sins?* (Ecclesiasticus 28:4); *If he that is but flesh nourish hatred, who will intreat for pardon of his sins?* (Ecclesiasticus 28:5). Yahusha says the same: *For if ye forgive men their trespasses, your heavenly Father will also forgive you:* (Matthew 6:14), and tells the parable of the unforgiving servant — *So likewise shall my heavenly Father do also unto you, if ye from your hearts forgive not every one his brother their trespasses.* (Matthew 18:35); *And when ye stand praying, forgive, if ye have ought against any: that your Father also which is in heaven may forgive you your trespasses.* (Mark 11:25). The Torah already forbade the grudge: *Thou shalt not avenge, nor bear any grudge against the children of thy people, but thou shalt love thy neighbour as thyself: I am Yahuah (LORD).* (Leviticus 19:18). It ain''t new — Sira simply unfolds the commandment.',
       sv.verse_id, ev.verse_id, 'extras', 58975
  FROM _session253_sir28_lookup sv, _session253_sir28_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=28 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=28 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-28-vengeance-is-the-Most-High',
       E'Vengeance belongs to Yahuah, not the offended man',
       E'Because *He that revengeth shall find vengeance from Yahuah (God), and he will surely keep his sins in remembrance.* (Ecclesiasticus 28:1), the avenger only indicts himself. Paul says it word for word: *Dearly beloved, avenge not yourselves, but rather give place unto wrath: for it is written, Vengeance is mine; I will repay, saith Yahuah (Lord).* (Romans 12:19). The same chapter binds the believer to peace — *Recompense to no man evil for evil. Provide things honest in the sight of all men.* (Romans 12:17). In Sira''s own book the next-door warning stands: *Mockery and reproach are from the proud; but vengeance, as a lion, shall lie in wait for them.* (Ecclesiasticus 27:28) — the same lion that in 28:23 devours those who forsake Yahuah. Forgiveness is not weakness; it is leaving judgment to the only One who keeps the books.',
       sv.verse_id, ev.verse_id, 'extras', 58978
  FROM _session253_sir28_lookup sv, _session253_sir28_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=28 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=28 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-28-remember-the-covenant',
       E'Remember thy end, the commandments, the covenant',
       E'Sira grounds forgiveness in death and Torah: *Remember your end, and let enmity cease; remember corruption and death, and abide in the commandments.* (Ecclesiasticus 28:6); *Remember the commandments, and bear no malice to your neighbour: remember the covenant of the Highest, and wink at ignorance.* (Ecclesiasticus 28:7). To remember thy end is the heart of wisdom — *So teach us to number our days, that we may apply our hearts unto wisdom.* (Psalm 90:12). To bear no malice but cover offence is the new commandment that is old — *Forbearing one another, and forgiving one another, if any man have a quarrel against any: even as Messiah (Christ) forgave you, so also do ye.* (Colossians 3:13); *And be ye kind one to another, tenderhearted, forgiving one another, even as Elohim (God) for Messiah''s (Christ’s) sake hath forgiven you.* (Ephesians 4:32). The covenant of the Highest stands; malice has no place in it.',
       sv.verse_id, ev.verse_id, 'extras', 58981
  FROM _session253_sir28_lookup sv, _session253_sir28_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=28 AND sv.verse_number=6
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=28 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-28-kindle-not-strife',
       E'Abstain from strife — the furious man kindles fire',
       E'Sira turns to the cause of broken peace: *Abstain from strife, and you shall diminish your sins: for a furious man will kindle strife,* (Ecclesiasticus 28:8); *A sinful man disquieteth friends, and makes debate among them that be at peace.* (Ecclesiasticus 28:9); *An hasty contention kindleth a fire: and an hasty fighting sheddeth blood.* (Ecclesiasticus 28:11). Proverbs says the soft answer and the talebearer either quench or feed the blaze: *A soft answer turneth away wrath: but grievous words stir up anger.* (Proverbs 15:1); *Where no wood is, there the fire goeth out: so where there is no talebearer, the strife ceaseth.* (Proverbs 26:20). And the whisperer who ''disquieteth friends'' falls under Yahuah''s hatred — *He that speaketh truth sheweth forth righteousness: but a false witness deceit.* (Proverbs 12:17). The wisdom of Sira and the wisdom of Solomon are one voice.',
       sv.verse_id, ev.verse_id, 'extras', 58984
  FROM _session253_sir28_lookup sv, _session253_sir28_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=28 AND sv.verse_number=8
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=28 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-28-the-backbiting-tongue',
       E'The tongue a fire — sharper than the sword',
       E'Sira''s great oracle on the tongue: *If you blow the spark, it shall burn: if you spit upon it, it shall be quenched: and both these come out of your mouth.* (Ecclesiasticus 28:12); *A backbiting tongue has disquieted many, and driven them from nation to nation: strong cities has it pulled down, and overthrown the houses of great men.* (Ecclesiasticus 28:14); *The stroke of the whip makes marks in the flesh: but the stroke of the tongue breaks the bones.* (Ecclesiasticus 28:17); *Many have fallen by the edge of the sword: but not so many as have fallen by the tongue.* (Ecclesiasticus 28:18). James preaches the identical fire: *And the tongue is a fire, a world of iniquity: so is the tongue among our members, that it defileth the whole body, and setteth on fire the course of nature; and it is set on fire of hell.* (James 3:6); *But the tongue can no man tame; it is an unruly evil, full of deadly poison.* (James 3:8). Proverbs weighs it for life and death — *Death and life are in the power of the tongue: and they that love it shall eat the fruit thereof.* (Proverbs 18:21); *There is that speaketh like the piercings of a sword: but the tongue of the wise is health.* (Proverbs 12:18). It ain''t new: James drank from this well.',
       sv.verse_id, ev.verse_id, 'extras', 58987
  FROM _session253_sir28_lookup sv, _session253_sir28_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=28 AND sv.verse_number=12
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=28 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ecclesiasticus-28-forgive-thy-neighbour
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 6:14 — *For if ye forgive men their trespasses, your heavenly Father will also forgive you:* Yahusha makes the very bargain of Sirach 28:2 — forgive the neighbour''s hurt and your own sins are forgiven.'
  FROM cross_reference_threads t, cross_references x, _session253_sir28_lookup sv, _session253_sir28_lookup tv
 WHERE t.slug='ecclesiasticus-28-forgive-thy-neighbour'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=28 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=6 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 18:35 — *So likewise shall my heavenly Father do also unto you, if ye from your hearts forgive not every one his brother their trespasses.* The unforgiving servant is condemned by exactly Sira''s logic in 28:3 — bearing hatred while seeking pardon.'
  FROM cross_reference_threads t, cross_references x, _session253_sir28_lookup sv, _session253_sir28_lookup tv
 WHERE t.slug='ecclesiasticus-28-forgive-thy-neighbour'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=28 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=18 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Mark 11:25 — *And when ye stand praying, forgive, if ye have ought against any: that your Father also which is in heaven may forgive you your trespasses.* Forgiveness at the moment of prayer is precisely Sirach 28:2''s *when you prayest*.'
  FROM cross_reference_threads t, cross_references x, _session253_sir28_lookup sv, _session253_sir28_lookup tv
 WHERE t.slug='ecclesiasticus-28-forgive-thy-neighbour'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=28 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=11 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Leviticus 19:18 — *Thou shalt not avenge, nor bear any grudge against the children of thy people, but thou shalt love thy neighbour as thyself: I am Yahuah (LORD).* The Torah''s ban on vengeance and grudge is the root Sirach 28:1 grows from.'
  FROM cross_reference_threads t, cross_references x, _session253_sir28_lookup sv, _session253_sir28_lookup tv
 WHERE t.slug='ecclesiasticus-28-forgive-thy-neighbour'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=28 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Matthew 18:21 — *Then came Peter to him, and said, Yahuah (Lord), how oft shall my brother sin against me, and I forgive him? till seven times?* Peter''s question opens the very mercy-toward-an-equal that Sirach 28:4 demands of him *which is like himself*.'
  FROM cross_reference_threads t, cross_references x, _session253_sir28_lookup sv, _session253_sir28_lookup tv
 WHERE t.slug='ecclesiasticus-28-forgive-thy-neighbour'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=28 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=18 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-28-vengeance-is-the-Most-High
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Romans 12:19 — *Dearly beloved, avenge not yourselves, but rather give place unto wrath: for it is written, Vengeance is mine; I will repay, saith Yahuah (Lord).* Paul cites the same principle as Sirach 28:1 — the avenger usurps a vengeance that is Yahuah''s alone.'
  FROM cross_reference_threads t, cross_references x, _session253_sir28_lookup sv, _session253_sir28_lookup tv
 WHERE t.slug='ecclesiasticus-28-vengeance-is-the-Most-High'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=28 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=12 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 12:17 — *Recompense to no man evil for evil. Provide things honest in the sight of all men.* Refusing to repay evil answers Sira''s rebuke in 28:3 of the man who bears hatred yet seeks pardon.'
  FROM cross_reference_threads t, cross_references x, _session253_sir28_lookup sv, _session253_sir28_lookup tv
 WHERE t.slug='ecclesiasticus-28-vengeance-is-the-Most-High'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=28 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=12 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ecclesiasticus 27:28 — *Mockery and reproach are from the proud; but vengeance, as a lion, shall lie in wait for them.* Sira''s own previous chapter sets the lion of vengeance that 28:1 and 28:23 will loose on the unforgiving.'
  FROM cross_reference_threads t, cross_references x, _session253_sir28_lookup sv, _session253_sir28_lookup tv
 WHERE t.slug='ecclesiasticus-28-vengeance-is-the-Most-High'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=28 AND sv.verse_number=1
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=27 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-28-remember-the-covenant
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 90:12 — *So teach us to number our days, that we may apply our hearts unto wisdom.* Numbering one''s days is exactly Sirach 28:6''s call to *remember your end* so that enmity ceases.'
  FROM cross_reference_threads t, cross_references x, _session253_sir28_lookup sv, _session253_sir28_lookup tv
 WHERE t.slug='ecclesiasticus-28-remember-the-covenant'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=28 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=90 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Colossians 3:13 — *Forbearing one another, and forgiving one another, if any man have a quarrel against any: even as Messiah (Christ) forgave you, so also do ye.* Bearing no malice and forgiving the quarrel is the Torah-rooted command Sira gives in 28:7.'
  FROM cross_reference_threads t, cross_references x, _session253_sir28_lookup sv, _session253_sir28_lookup tv
 WHERE t.slug='ecclesiasticus-28-remember-the-covenant'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=28 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=3 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ephesians 4:32 — *And be ye kind one to another, tenderhearted, forgiving one another, even as Elohim (God) for Messiah''s (Christ’s) sake hath forgiven you.* Kindness in place of malice fulfils Sirach 28:7''s *bear no malice to your neighbour*.'
  FROM cross_reference_threads t, cross_references x, _session253_sir28_lookup sv, _session253_sir28_lookup tv
 WHERE t.slug='ecclesiasticus-28-remember-the-covenant'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=28 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=4 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-28-kindle-not-strife
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 15:1 — *A soft answer turneth away wrath: but grievous words stir up anger.* The soft answer is the opposite of Sirach 28:8''s *furious man* who kindles strife.'
  FROM cross_reference_threads t, cross_references x, _session253_sir28_lookup sv, _session253_sir28_lookup tv
 WHERE t.slug='ecclesiasticus-28-kindle-not-strife'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=28 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=15 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 26:20 — *Where no wood is, there the fire goeth out: so where there is no talebearer, the strife ceaseth.* Solomon''s talebearer is Sira''s sinful man of 28:9 who *disquieteth friends*.'
  FROM cross_reference_threads t, cross_references x, _session253_sir28_lookup sv, _session253_sir28_lookup tv
 WHERE t.slug='ecclesiasticus-28-kindle-not-strife'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=28 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=26 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 12:17 — *He that speaketh truth sheweth forth righteousness: but a false witness deceit.* The false witness feeds the hasty contention that Sirach 28:11 says *kindleth a fire*.'
  FROM cross_reference_threads t, cross_references x, _session253_sir28_lookup sv, _session253_sir28_lookup tv
 WHERE t.slug='ecclesiasticus-28-kindle-not-strife'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=28 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=12 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-28-the-backbiting-tongue
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'James 3:6 — *And the tongue is a fire, a world of iniquity: so is the tongue among our members, that it defileth the whole body, and setteth on fire the course of nature; and it is set on fire of hell.* James''s tongue-as-fire is Sira''s spark of 28:12 that, blown, *shall burn*.'
  FROM cross_reference_threads t, cross_references x, _session253_sir28_lookup sv, _session253_sir28_lookup tv
 WHERE t.slug='ecclesiasticus-28-the-backbiting-tongue'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=28 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=3 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'James 3:8 — *But the tongue can no man tame; it is an unruly evil, full of deadly poison.* The untameable poison answers Sirach 28:14''s backbiting tongue that *pulled down* cities and houses.'
  FROM cross_reference_threads t, cross_references x, _session253_sir28_lookup sv, _session253_sir28_lookup tv
 WHERE t.slug='ecclesiasticus-28-the-backbiting-tongue'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=28 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 18:21 — *Death and life are in the power of the tongue: and they that love it shall eat the fruit thereof.* Solomon weighs the very deadliness Sirach 28:18 names — more fallen by the tongue than the sword.'
  FROM cross_reference_threads t, cross_references x, _session253_sir28_lookup sv, _session253_sir28_lookup tv
 WHERE t.slug='ecclesiasticus-28-the-backbiting-tongue'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=28 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=18 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Proverbs 12:18 — *There is that speaketh like the piercings of a sword: but the tongue of the wise is health.* The sword-piercing speech is Sira''s stroke of the tongue in 28:17 that *breaks the bones*.'
  FROM cross_reference_threads t, cross_references x, _session253_sir28_lookup sv, _session253_sir28_lookup tv
 WHERE t.slug='ecclesiasticus-28-the-backbiting-tongue'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=28 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=12 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

