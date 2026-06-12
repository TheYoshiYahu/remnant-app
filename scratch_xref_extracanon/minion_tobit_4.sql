-- ----- fragment: minion_tobit_04.sql (session253 tobit 4) -----
-- Source anchor: apocrypha/tobit ch4. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: tob4 (view _session253_tob4_lookup). Sort band base 59675, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_tob4_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: tobit-4-alms-deliver-from-death
  ('apocrypha', 'tobit', 4, 10, 'canon', 'proverbs', 10, 2, 'free', E'Proverbs 10:2 — *Treasures of wickedness profit nothing: but righteousness delivereth from death.* The very axiom Tobit hands his son — righteousness (alms) outlasts riches and pulls the giver back from death.'),
  ('apocrypha', 'tobit', 4, 10, 'canon', 'proverbs', 11, 4, 'free', E'Proverbs 11:4 — *Riches profit not in the day of wrath: but righteousness delivereth from death.* Proverbs repeats Tobit''s deliverance-from-death word for word, naming the day of necessity Tobit calls ''the day of necessity.'''),
  ('apocrypha', 'tobit', 4, 7, 'canon', 'daniel', 4, 27, 'free', E'Daniel 4:27 — *Wherefore, O king, let my counsel be acceptable unto thee, and break off thy sins by righteousness, and thine iniquities by shewing mercy to the poor; if it may be a lengthening of thy tranquillity.* Daniel in exile, like Tobit in exile, urges mercy to the poor as the very thing that wards off death''s sentence.'),
  ('apocrypha', 'tobit', 4, 9, 'canon', 'luke', 12, 33, 'free', E'Luke 12:33 — *Sell that ye have, and give alms; provide yourselves bags which wax not old, a treasure in the heavens that faileth not, where no thief approacheth, neither moth corrupteth.* Yahusha lays up in heaven the same ''good treasure against the day of necessity'' Tobit tells Tobias alms secures.'),
  -- thread: tobit-4-give-alms-of-thy-substance
  ('apocrypha', 'tobit', 4, 7, 'canon', 'luke', 11, 41, 'free', E'Luke 11:41 — *But rather give alms of such things as ye have; and, behold, all things are clean unto you.* Yahusha makes almsgiving the inward cleansing — exactly Tobit''s ''give of thy substance'' that keeps Yahuah''s face turned toward the giver.'),
  ('apocrypha', 'tobit', 4, 16, 'canon', 'luke', 12, 34, 'free', E'Luke 12:34 — *For where your treasure is, there will your heart be also.* Tobit''s unenvious eye toward the poor is the heart already lodged where its treasure is laid up — in mercy, not in hoarding.'),
  ('apocrypha', 'tobit', 4, 16, 'canon', 'leviticus', 19, 10, 'free', E'Leviticus 19:10 — *And thou shalt not glean thy vineyard, neither shalt thou gather every grape of thy vineyard; thou shalt leave them for the poor and stranger: I am Yahuah Elohaychem (the LORD your God).* The Torah law of the gleaning corners is the root of Tobit''s ''give of thy bread to the hungry'' — bread and garments owed to the poor.'),
  -- thread: tobit-4-honour-thy-mother
  ('apocrypha', 'tobit', 4, 3, 'canon', 'exodus', 20, 12, 'free', E'Exodus 20:12 — *Honour thy father and thy mother: that thy days may be long upon the land which Yahuah Elohayka (the LORD thy God) giveth thee.* The Fifth Word itself; Tobit charges Tobias to honour his mother ''all the days of thy life,'' the very commandment with promise.'),
  ('apocrypha', 'tobit', 4, 3, 'canon', 'leviticus', 19, 3, 'free', E'Leviticus 19:3 — *Ye shall fear every man his mother, and his father, and keep my sabbaths: I am Yahuah Elohaychem (the LORD your God).* The holiness code that names the mother first matches Tobit''s stress on honouring the mother who bore him through danger.'),
  -- thread: tobit-4-golden-rule-negative
  ('apocrypha', 'tobit', 4, 15, 'canon', 'matthew', 7, 12, 'free', E'Matthew 7:12 — *Therefore all things whatsoever ye would that men should do to you, do ye even so to them: for this is the law and the prophets.* Yahusha''s Golden Rule is Tobit''s ''do that to no man which thou hatest'' turned positive and named the sum of the law and the prophets.'),
  ('apocrypha', 'tobit', 4, 15, 'canon', 'leviticus', 19, 18, 'free', E'Leviticus 19:18 — *Thou shalt not avenge, nor bear any grudge against the children of thy people, but thou shalt love thy neighbour as thyself: I am Yahuah (LORD).* Love-thy-neighbour is the Torah seed of which Tobit''s negative Golden Rule and the Sermon''s positive one are both the flower.'),
  -- thread: tobit-4-labourers-wage
  ('apocrypha', 'tobit', 4, 14, 'canon', 'leviticus', 19, 13, 'free', E'Leviticus 19:13 — *Thou shalt not defraud thy neighbour, neither rob him: the wages of him that is hired shall not abide with thee all night until the morning.* The Torah command not to hold a hired man''s wages overnight is precisely Tobit''s ''give him it out of hand.'''),
  ('apocrypha', 'tobit', 4, 14, 'canon', 'deuteronomy', 24, 15, 'free', E'Deuteronomy 24:15 — *At his day thou shalt give him his hire, neither shall the sun go down upon it; for he is poor, and setteth his heart upon it: lest he cry against thee unto Yahuah (LORD), and it be sin unto thee.* Deuteronomy makes the same-day wage a matter of the poor man''s cry — the law behind Tobit''s urgency.'),
  ('apocrypha', 'tobit', 4, 14, 'canon', 'james', 5, 4, 'free', E'James 5:4 — *Behold, the hire of the labourers who have reaped down your fields, which is of you kept back by fraud, crieth: and the cries of them which have reaped are entered into the ears of Yahuah (Lord) of sabaoth.* James hears the very wage-cry Tobit forestalls — kept-back hire reaching the ears of the Lord of hosts.'),
  -- thread: tobit-4-be-mindful-of-yahuah
  ('apocrypha', 'tobit', 4, 5, 'canon', 'proverbs', 10, 17, 'free', E'Proverbs 10:17 — *He is in the way of life that keepeth instruction: but he that refuseth reproof erreth.* Tobit''s ''do uprightly all thy life long'' is the way of life Proverbs marks out for the one who keeps instruction.'),
  ('apocrypha', 'tobit', 4, 19, 'canon', 'proverbs', 11, 3, 'free', E'Proverbs 11:3 — *The integrity of the upright shall guide them: but the perverseness of transgressors shall destroy them.* The directed ways Tobit prays for his son are the very guidance Proverbs grants the upright in heart.'),
  ('apocrypha', 'tobit', 4, 19, 'canon', 'deuteronomy', 24, 18, 'free', E'Deuteronomy 24:18 — *But thou shalt remember that thou wast a bondman in Egypt, and Yahuah Elohayka (the LORD thy God) redeemed thee thence: therefore I command thee to do this thing.* The ''remember and do my commandments'' refrain that closes Tobit''s charge echoes Moses'' own ground for mercy: remember redemption, therefore keep the command.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_tob4_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_tob4_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-4-alms-deliver-from-death',
       E'Almsgiving delivers from death',
       E'Tobit''s deathbed wisdom turns on a hinge the whole library shares: *Because that alms do deliver from death, and suffers not to come into darkness.* (Tobit 4:10) — give *of your substance*, *if you have abundance give alms accordingly: if you have but a little, be not afraid to give according to that little* (Tobit 4:8), *for you layest up a good treasure for thyself against the day of necessity* (Tobit 4:9). It is no new saying. The Proverbs already twice cut the same channel — *Treasures of wickedness profit nothing: but righteousness delivereth from death.* (Proverbs 10:2) and *Riches profit not in the day of wrath: but righteousness delivereth from death.* (Proverbs 11:4). Daniel pressed it on a king''s conscience — *Wherefore, O king, let my counsel be acceptable unto thee, and break off thy sins by righteousness, and thine iniquities by shewing mercy to the poor; if it may be a lengthening of thy tranquillity.* (Daniel 4:27). And Yahusha lays up the very treasure Tobit names: *Sell that ye have, and give alms; provide yourselves bags which wax not old, a treasure in the heavens that faileth not, where no thief approacheth, neither moth corrupteth.* (Luke 12:33). One covenant ethic, exile to Sermon.',
       sv.verse_id, ev.verse_id, 'extras', 59675
  FROM _session253_tob4_lookup sv, _session253_tob4_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=4 AND sv.verse_number=8
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=4 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-4-give-alms-of-thy-substance',
       E'Alms of such things as ye have',
       E'Tobit measures the gift by the heart, not the purse: *Give alms of your substance; and when you give alms, let not your eye be envious, neither turn your face from any poor, and the face of Yahuah (God) shall not be turned away from you.* (Tobit 4:7) — *Give of your bread to the hungry, and of your garments to them that are naked; and according to your abundance give alms: and let not your eye be envious, when you give alms.* (Tobit 4:16). Yahusha makes the cleansing turn on exactly this — *But rather give alms of such things as ye have; and, behold, all things are clean unto you.* (Luke 11:41) — and binds the heart to the treasure: *For where your treasure is, there will your heart be also.* (Luke 12:34). The ''unenvious eye'' Tobit commands is the Sermon''s ''single eye'' that fills the body with light.',
       sv.verse_id, ev.verse_id, 'extras', 59678
  FROM _session253_tob4_lookup sv, _session253_tob4_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=4 AND sv.verse_number=7
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=4 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-4-honour-thy-mother',
       E'Honour her all the days of thy life',
       E'Before alms, the first commandment with promise: *And when he had called him, he said, My son, when I am dead, bury me; and despise not your mother, but honour her all the days of your life, and do that which shall please her, and grieve her not.* (Tobit 4:3) — *Remember, my son, that she saw many dangers for you, when you were in her womb: and when she is dead, bury her by me in one grave.* (Tobit 4:4). This is the fifth word of Sinai spoken at a deathbed: *Honour thy father and thy mother: that thy days may be long upon the land which Yahuah Elohayka (the LORD thy God) giveth thee.* (Exodus 20:12) — and Leviticus sets fearing the mother first: *Ye shall fear every man his mother, and his father, and keep my sabbaths: I am Yahuah Elohaychem (the LORD your God).* (Leviticus 19:3). Torah honoured in exile, never as curse.',
       sv.verse_id, ev.verse_id, 'extras', 59681
  FROM _session253_tob4_lookup sv, _session253_tob4_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=4 AND sv.verse_number=3
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=4 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-4-golden-rule-negative',
       E'Do that to no man which thou hatest',
       E'The Golden Rule in its negative form stands in Tobit''s mouth before ever it stands in the Sermon: *Do that to no man which you hatest: drink not wine to make you drunken: neither let drunkenness go with you in your journey.* (Tobit 4:15). Yahusha turns the same rule to its positive face and seals it as the whole Torah: *Therefore all things whatsoever ye would that men should do to you, do ye even so to them: for this is the law and the prophets.* (Matthew 7:12). Its root is the holiness code itself — *Thou shalt not avenge, nor bear any grudge against the children of thy people, but thou shalt love thy neighbour as thyself: I am Yahuah (LORD).* (Leviticus 19:18). It ain''t new: the Sermon''s own root runs back through Tobit to Sinai.',
       sv.verse_id, ev.verse_id, 'extras', 59684
  FROM _session253_tob4_lookup sv, _session253_tob4_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=4 AND sv.verse_number=15
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=4 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-4-labourers-wage',
       E'Let not the wages tarry with thee',
       E'Tobit will not let a withheld wage sleep overnight: *Let not the wages of any man, which has wrought for you, tarry with you, but give him it out of hand: for if you serve Yahuah (God), he will also repay you...* (Tobit 4:14). This is Torah law twice over — *Thou shalt not defraud thy neighbour, neither rob him: the wages of him that is hired shall not abide with thee all night until the morning.* (Leviticus 19:13) — and *At his day thou shalt give him his hire, neither shall the sun go down upon it; for he is poor, and setteth his heart upon it: lest he cry against thee unto Yahuah (LORD), and it be sin unto thee.* (Deuteronomy 24:15). James hears the same cry against the last days'' rich: *Behold, the hire of the labourers who have reaped down your fields, which is of you kept back by fraud, crieth: and the cries of them which have reaped are entered into the ears of Yahuah (Lord) of sabaoth.* (James 5:4).',
       sv.verse_id, ev.verse_id, 'extras', 59687
  FROM _session253_tob4_lookup sv, _session253_tob4_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=4 AND sv.verse_number=14
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=4 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-4-be-mindful-of-yahuah',
       E'Be mindful of Yahuah all thy days',
       E'Beneath every charge runs the one root: *My son, be mindful of Yahuah (God), our Elohim (God) all your days, and let not your will be set to sin, or to transgress his commandments: do uprightly all your life long, and follow not the ways of unrighteousness.* (Tobit 4:5) — *Bless Yahuah (God), your Elohim (God) alway, and desire of him that your ways may be directed... now therefore, my son, remember my commandments, neither let them be put out of your mind.* (Tobit 4:19). This is the way of life Proverbs sets against the way of death — *He is in the way of life that keepeth instruction: but he that refuseth reproof erreth.* (Proverbs 10:17) — and the integrity that guides the upright — *The integrity of the upright shall guide them: but the perverseness of transgressors shall destroy them.* (Proverbs 11:3). To keep Torah in exile is to walk uprightly, not under a curse.',
       sv.verse_id, ev.verse_id, 'extras', 59690
  FROM _session253_tob4_lookup sv, _session253_tob4_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=4 AND sv.verse_number=5
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=4 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: tobit-4-alms-deliver-from-death
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 10:2 — *Treasures of wickedness profit nothing: but righteousness delivereth from death.* The very axiom Tobit hands his son — righteousness (alms) outlasts riches and pulls the giver back from death.'
  FROM cross_reference_threads t, cross_references x, _session253_tob4_lookup sv, _session253_tob4_lookup tv
 WHERE t.slug='tobit-4-alms-deliver-from-death'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=4 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=10 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 11:4 — *Riches profit not in the day of wrath: but righteousness delivereth from death.* Proverbs repeats Tobit''s deliverance-from-death word for word, naming the day of necessity Tobit calls ''the day of necessity.'''
  FROM cross_reference_threads t, cross_references x, _session253_tob4_lookup sv, _session253_tob4_lookup tv
 WHERE t.slug='tobit-4-alms-deliver-from-death'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=4 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=11 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 4:27 — *Wherefore, O king, let my counsel be acceptable unto thee, and break off thy sins by righteousness, and thine iniquities by shewing mercy to the poor; if it may be a lengthening of thy tranquillity.* Daniel in exile, like Tobit in exile, urges mercy to the poor as the very thing that wards off death''s sentence.'
  FROM cross_reference_threads t, cross_references x, _session253_tob4_lookup sv, _session253_tob4_lookup tv
 WHERE t.slug='tobit-4-alms-deliver-from-death'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=4 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=4 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Luke 12:33 — *Sell that ye have, and give alms; provide yourselves bags which wax not old, a treasure in the heavens that faileth not, where no thief approacheth, neither moth corrupteth.* Yahusha lays up in heaven the same ''good treasure against the day of necessity'' Tobit tells Tobias alms secures.'
  FROM cross_reference_threads t, cross_references x, _session253_tob4_lookup sv, _session253_tob4_lookup tv
 WHERE t.slug='tobit-4-alms-deliver-from-death'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=4 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=12 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-4-give-alms-of-thy-substance
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Luke 11:41 — *But rather give alms of such things as ye have; and, behold, all things are clean unto you.* Yahusha makes almsgiving the inward cleansing — exactly Tobit''s ''give of thy substance'' that keeps Yahuah''s face turned toward the giver.'
  FROM cross_reference_threads t, cross_references x, _session253_tob4_lookup sv, _session253_tob4_lookup tv
 WHERE t.slug='tobit-4-give-alms-of-thy-substance'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=4 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=11 AND tv.verse_number=41
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Luke 12:34 — *For where your treasure is, there will your heart be also.* Tobit''s unenvious eye toward the poor is the heart already lodged where its treasure is laid up — in mercy, not in hoarding.'
  FROM cross_reference_threads t, cross_references x, _session253_tob4_lookup sv, _session253_tob4_lookup tv
 WHERE t.slug='tobit-4-give-alms-of-thy-substance'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=4 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=12 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 19:10 — *And thou shalt not glean thy vineyard, neither shalt thou gather every grape of thy vineyard; thou shalt leave them for the poor and stranger: I am Yahuah Elohaychem (the LORD your God).* The Torah law of the gleaning corners is the root of Tobit''s ''give of thy bread to the hungry'' — bread and garments owed to the poor.'
  FROM cross_reference_threads t, cross_references x, _session253_tob4_lookup sv, _session253_tob4_lookup tv
 WHERE t.slug='tobit-4-give-alms-of-thy-substance'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=4 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-4-honour-thy-mother
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 20:12 — *Honour thy father and thy mother: that thy days may be long upon the land which Yahuah Elohayka (the LORD thy God) giveth thee.* The Fifth Word itself; Tobit charges Tobias to honour his mother ''all the days of thy life,'' the very commandment with promise.'
  FROM cross_reference_threads t, cross_references x, _session253_tob4_lookup sv, _session253_tob4_lookup tv
 WHERE t.slug='tobit-4-honour-thy-mother'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=4 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 19:3 — *Ye shall fear every man his mother, and his father, and keep my sabbaths: I am Yahuah Elohaychem (the LORD your God).* The holiness code that names the mother first matches Tobit''s stress on honouring the mother who bore him through danger.'
  FROM cross_reference_threads t, cross_references x, _session253_tob4_lookup sv, _session253_tob4_lookup tv
 WHERE t.slug='tobit-4-honour-thy-mother'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=4 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-4-golden-rule-negative
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 7:12 — *Therefore all things whatsoever ye would that men should do to you, do ye even so to them: for this is the law and the prophets.* Yahusha''s Golden Rule is Tobit''s ''do that to no man which thou hatest'' turned positive and named the sum of the law and the prophets.'
  FROM cross_reference_threads t, cross_references x, _session253_tob4_lookup sv, _session253_tob4_lookup tv
 WHERE t.slug='tobit-4-golden-rule-negative'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=4 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 19:18 — *Thou shalt not avenge, nor bear any grudge against the children of thy people, but thou shalt love thy neighbour as thyself: I am Yahuah (LORD).* Love-thy-neighbour is the Torah seed of which Tobit''s negative Golden Rule and the Sermon''s positive one are both the flower.'
  FROM cross_reference_threads t, cross_references x, _session253_tob4_lookup sv, _session253_tob4_lookup tv
 WHERE t.slug='tobit-4-golden-rule-negative'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=4 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-4-labourers-wage
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 19:13 — *Thou shalt not defraud thy neighbour, neither rob him: the wages of him that is hired shall not abide with thee all night until the morning.* The Torah command not to hold a hired man''s wages overnight is precisely Tobit''s ''give him it out of hand.'''
  FROM cross_reference_threads t, cross_references x, _session253_tob4_lookup sv, _session253_tob4_lookup tv
 WHERE t.slug='tobit-4-labourers-wage'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=4 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 24:15 — *At his day thou shalt give him his hire, neither shall the sun go down upon it; for he is poor, and setteth his heart upon it: lest he cry against thee unto Yahuah (LORD), and it be sin unto thee.* Deuteronomy makes the same-day wage a matter of the poor man''s cry — the law behind Tobit''s urgency.'
  FROM cross_reference_threads t, cross_references x, _session253_tob4_lookup sv, _session253_tob4_lookup tv
 WHERE t.slug='tobit-4-labourers-wage'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=4 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=24 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'James 5:4 — *Behold, the hire of the labourers who have reaped down your fields, which is of you kept back by fraud, crieth: and the cries of them which have reaped are entered into the ears of Yahuah (Lord) of sabaoth.* James hears the very wage-cry Tobit forestalls — kept-back hire reaching the ears of the Lord of hosts.'
  FROM cross_reference_threads t, cross_references x, _session253_tob4_lookup sv, _session253_tob4_lookup tv
 WHERE t.slug='tobit-4-labourers-wage'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=4 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=5 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-4-be-mindful-of-yahuah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 10:17 — *He is in the way of life that keepeth instruction: but he that refuseth reproof erreth.* Tobit''s ''do uprightly all thy life long'' is the way of life Proverbs marks out for the one who keeps instruction.'
  FROM cross_reference_threads t, cross_references x, _session253_tob4_lookup sv, _session253_tob4_lookup tv
 WHERE t.slug='tobit-4-be-mindful-of-yahuah'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=4 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=10 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 11:3 — *The integrity of the upright shall guide them: but the perverseness of transgressors shall destroy them.* The directed ways Tobit prays for his son are the very guidance Proverbs grants the upright in heart.'
  FROM cross_reference_threads t, cross_references x, _session253_tob4_lookup sv, _session253_tob4_lookup tv
 WHERE t.slug='tobit-4-be-mindful-of-yahuah'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=4 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=11 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 24:18 — *But thou shalt remember that thou wast a bondman in Egypt, and Yahuah Elohayka (the LORD thy God) redeemed thee thence: therefore I command thee to do this thing.* The ''remember and do my commandments'' refrain that closes Tobit''s charge echoes Moses'' own ground for mercy: remember redemption, therefore keep the command.'
  FROM cross_reference_threads t, cross_references x, _session253_tob4_lookup sv, _session253_tob4_lookup tv
 WHERE t.slug='tobit-4-be-mindful-of-yahuah'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=4 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=24 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

