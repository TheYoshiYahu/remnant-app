-- ----- fragment: minion_ecclesiasticus_07.sql (session253 ecclesiasticus 7) -----
-- Source anchor: apocrypha/ecclesiasticus ch7. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: sir07 (view _session253_sir07_lookup). Sort band base 58450, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_sir07_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ecclesiasticus-7-do-no-evil-flee-iniquity
  ('apocrypha', 'ecclesiasticus', 7, 1, 'canon', 'proverbs', 1, 7, 'free', E'Proverbs 1:7 — *The fear of Yahuah (LORD) is the beginning of knowledge: but fools despise wisdom and instruction* — the wisdom of which Sirach 7:1''s "do no evil" is the first lived obedience.'),
  ('apocrypha', 'ecclesiasticus', 7, 2, 'canon', 'james', 1, 27, 'free', E'James 1:27 — *Pure religion and undefiled before Elohim (God) and the Father is this, To visit the fatherless and widows in their affliction, and to keep himself unspotted from the world* — the same departing-from-iniquity that Sirach 7:2 urges, framed as undefiled religion.'),
  -- thread: ecclesiasticus-7-humble-thyself
  ('apocrypha', 'ecclesiasticus', 7, 17, 'canon', 'proverbs', 3, 34, 'free', E'Proverbs 3:34 — *Surely he scorneth the scorners: but he giveth grace unto the lowly* — the same exalting of the lowly that Sirach 7:17''s "humble thyself greatly" commands.'),
  ('apocrypha', 'ecclesiasticus', 7, 17, 'canon', 'james', 4, 6, 'free', E'James 4:6 — *But he giveth more grace. Wherefore he saith, Elohim (God) resisteth the proud, but giveth grace unto the humble* — James draws the very Proverb Sirach 7:17 dramatizes with "the vengeance of the ungodly."'),
  ('apocrypha', 'ecclesiasticus', 7, 17, 'canon', 'james', 4, 10, 'free', E'James 4:10 — *Humble yourselves in the sight of Yahuah (Lord), and he shall lift you up* — the command form of Sirach 7:17''s "Humble thyself greatly."'),
  ('apocrypha', 'ecclesiasticus', 7, 11, 'canon', 'james', 4, 10, 'free', E'James 4:10 — *Humble yourselves in the sight of Yahuah (Lord), and he shall lift you up* — the One who "humbleth and exalteth" of Sirach 7:11 is the same Yahuah who lifts up the humble.'),
  -- thread: ecclesiasticus-7-lie-not-bridle-the-tongue
  ('apocrypha', 'ecclesiasticus', 7, 13, 'canon', 'james', 1, 26, 'free', E'James 1:26 — *If any man among you seem to be religious, and bridleth not his tongue, but deceiveth his own heart, this man''s religion is vain* — the same bridling of lying speech Sirach 7:13 calls for, for "the custom thereof is not good."'),
  ('apocrypha', 'ecclesiasticus', 7, 14, 'canon', 'james', 1, 19, 'free', E'James 1:19 — *Wherefore, my beloved brethren, let every man be swift to hear, slow to speak, slow to wrath* — the slow-to-speak restraint Sirach 7:14 urges against "much babbling."'),
  -- thread: ecclesiasticus-7-honour-father-and-mother
  ('apocrypha', 'ecclesiasticus', 7, 27, 'canon', 'exodus', 20, 12, 'free', E'Exodus 20:12 — *Honour thy father and thy mother: that thy days may be long upon the land which Yahuah Elohayka (the LORD thy God) giveth thee* — the Decalogue word Sirach 7:27 expounds "with your whole heart."'),
  ('apocrypha', 'ecclesiasticus', 7, 27, 'canon', 'ephesians', 6, 2, 'free', E'Ephesians 6:2 — *Honour thy father and mother; (which is the first commandment with promise;)* — Paul names as covenant-promise the very honour Sirach 7:27 commands.'),
  ('apocrypha', 'ecclesiasticus', 7, 23, 'canon', 'proverbs', 22, 6, 'free', E'Proverbs 22:6 — *Train up a child in the way he should go: and when he is old, he will not depart from it* — the instructing of children Sirach 7:23 commands: "instruct them, and bow down their neck from their youth."'),
  -- thread: ecclesiasticus-7-fear-yahuah-honour-the-priest
  ('apocrypha', 'ecclesiasticus', 7, 29, 'canon', 'hebrews', 13, 7, 'free', E'Hebrews 13:7 — *Remember them which have the rule over you, who have spoken unto you the word of Elohim (God): whose faith follow, considering the end of their conversation* — the reverencing of Yahuah''s ministers that Sirach 7:29 commands.'),
  ('apocrypha', 'ecclesiasticus', 7, 31, 'canon', 'hebrews', 13, 17, 'free', E'Hebrews 13:17 — *Obey them that have the rule over you, and submit yourselves: for they watch for your souls, as they that must give account, that they may do it with joy, and not with grief: for that is unprofitable for you* — the honouring of the priest "as it is commanded you" that Sirach 7:31 details.'),
  ('apocrypha', 'ecclesiasticus', 7, 31, 'canon', 'proverbs', 3, 9, 'free', E'Proverbs 3:9 — *Honour Yahuah (LORD) with thy substance, and with the firstfruits of all thine increase* — the firstfruits-portion Sirach 7:31 names among the priest''s due.'),
  -- thread: ecclesiasticus-7-alms-the-poor-the-sick-the-mourner
  ('apocrypha', 'ecclesiasticus', 7, 32, 'canon', 'proverbs', 19, 17, 'free', E'Proverbs 19:17 — *He that hath pity upon the poor lendeth unto Yahuah (LORD); and that which he hath given will he pay him again* — the perfected blessing of the open hand Sirach 7:32 promises.'),
  ('apocrypha', 'ecclesiasticus', 7, 35, 'canon', 'matthew', 25, 36, 'free', E'Matthew 25:36 — *Naked, and ye clothed me: I was sick, and ye visited me: I was in prison, and ye came unto me* — the King names visiting the sick, the very work Sirach 7:35 commands: "Be not slow to visit the sick."'),
  ('apocrypha', 'ecclesiasticus', 7, 32, 'apocrypha', 'tobit', 4, 7, 'extras', E'Tobit 4:7 — *Give alms of your substance; and when you give alms, let not your eye be envious, neither turn your face from any poor, and the face of Yahuah (God) shall not be turned away from you* — Tobit''s almsgiving charge, the apocryphal sibling to Sirach 7:32''s hand stretched to the poor.'),
  -- thread: ecclesiasticus-7-remember-the-end
  ('apocrypha', 'ecclesiasticus', 7, 36, 'canon', 'deuteronomy', 32, 29, 'free', E'Deuteronomy 32:29 — *O that they were wise, that they understood this, that they would consider their latter end!* — the considered "end" of Sirach 7:36 is Moses'' very plea, the wisdom of the latter end.'),
  ('apocrypha', 'ecclesiasticus', 7, 36, 'canon', 'psalms', 90, 12, 'free', E'Psalm 90:12 — *So teach us to number our days, that we may apply our hearts unto wisdom* — numbering our days is to "remember the end" of Sirach 7:36, that we never do amiss.'),
  ('apocrypha', 'ecclesiasticus', 7, 36, 'canon', 'hebrews', 13, 7, 'free', E'Hebrews 13:7 — *Remember them which have the rule over you, who have spoken unto you the word of Elohim (God): whose faith follow, considering the end of their conversation* — Hebrews bids us follow the faithful "considering the end," the same remembrance Sirach 7:36 commands.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_sir07_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_sir07_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-7-do-no-evil-flee-iniquity',
       E'Do no evil — depart from the unjust',
       E'Ben Sira opens the chapter with the plainest wisdom of the two ways: *Do no evil, so shall no harm come to you* (Ecclesiasticus 7:1), *Depart from the unjust, and iniquity shall turn away from you* (Ecclesiasticus 7:2). It ain''t new — this is the Tanakh''s call to turn from evil and do good, the very posture of the righteous. *Depart from evil, and do good; seek peace, and pursue it* (Psalm 34:14), and the Proverb''s word that the fear of Yahuah is the hinge of it all: *The fear of Yahuah (LORD) is the beginning of knowledge: but fools despise wisdom and instruction* (Proverbs 1:7). James, Sirach''s closest NT sibling, carries the same fruit of a life turned from evil: *Pure religion and undefiled before Elohim (God) and the Father is this, To visit the fatherless and widows in their affliction, and to keep himself unspotted from the world* (James 1:27). The same covenant witness, library to library.',
       sv.verse_id, ev.verse_id, 'extras', 58450
  FROM _session253_sir07_lookup sv, _session253_sir07_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=7 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=7 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-7-humble-thyself',
       E'Humble thyself greatly',
       E'Against pride and self-justification Ben Sira sets humility: *justify not thyself before Yahuah (God); and boast not of your wisdom before the king* (Ecclesiasticus 7:5), and the chapter''s sharpest charge, *Humble thyself greatly: for the vengeance of the ungodly is fire and worms* (Ecclesiasticus 7:17). It ain''t new — the Proverb the apostles quote is here already: *Surely he scorneth the scorners: but he giveth grace unto the lowly* (Proverbs 3:34), echoed in *But he giveth more grace. Wherefore he saith, Elohim (God) resisteth the proud, but giveth grace unto the humble* (James 4:6), and made a command in *Humble yourselves in the sight of Yahuah (Lord), and he shall lift you up* (James 4:10). The fear of the ungodly''s end — *fire and worms* — is the same warning Yeshua would later draw on. Humility is the soil of wisdom in every library.',
       sv.verse_id, ev.verse_id, 'extras', 58453
  FROM _session253_sir07_lookup sv, _session253_sir07_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=7 AND sv.verse_number=5
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=7 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-7-lie-not-bridle-the-tongue',
       E'Devise not a lie — use not many words',
       E'Ben Sira turns to the tongue: *Devise not a lie against your brother; neither do the like to your friend* (Ecclesiasticus 7:12), *Use not to make any manner of lie: for the custom thereof is not good* (Ecclesiasticus 7:13), and *Use not many words in a multitude of elders, and make not much babbling when you prayest* (Ecclesiasticus 7:14). It ain''t new — this is the wisdom James presses on the swift tongue. *Wherefore, my beloved brethren, let every man be swift to hear, slow to speak, slow to wrath* (James 1:19), and the warning against an unbridled tongue: *If any man among you seem to be religious, and bridleth not his tongue, but deceiveth his own heart, this man''s religion is vain* (James 1:26). The Sermon on the Mount likewise warns against vain babbling in prayer (Matthew 6:7). Sirach and James draw from one well.',
       sv.verse_id, ev.verse_id, 'extras', 58456
  FROM _session253_sir07_lookup sv, _session253_sir07_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=7 AND sv.verse_number=12
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=7 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-7-honour-father-and-mother',
       E'Honour your father — forget not your mother',
       E'Ben Sira preaches the fifth word of the Decalogue in full: *Honour your father with your whole heart, and forget not the sorrows of your mother* (Ecclesiasticus 7:27), *Remember that you were begotten of them; and how can you recompense them the things that they have done for you?* (Ecclesiasticus 7:28). It ain''t new — this is Sinai itself: *Honour thy father and thy mother: that thy days may be long upon the land which Yahuah Elohayka (the LORD thy God) giveth thee* (Exodus 20:12), the one Paul calls *the first commandment with promise*: *Honour thy father and mother; (which is the first commandment with promise;)* (Ephesians 6:2). And the instruction of children that follows in the chapter is the Proverb itself: *Train up a child in the way he should go: and when he is old, he will not depart from it* (Proverbs 22:6). The Torah stands; ben Sira only unfolds it.',
       sv.verse_id, ev.verse_id, 'extras', 58459
  FROM _session253_sir07_lookup sv, _session253_sir07_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=7 AND sv.verse_number=23
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=7 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-7-fear-yahuah-honour-the-priest',
       E'Fear Yahuah — honour the priest, his portion',
       E'Ben Sira binds reverence for Yahuah to the Torah''s provision for His ministers: *Fear Yahuah (God) with all your soul, and reverence his priests* (Ecclesiasticus 7:29), and the detailed offering-law of the priesthood: *Fear Yahuah (God), and honor the priest; and give him his portion, as it is commanded you; the firstfruits, and the trespass offering, and the gift of the shoulders, and the sacrifice of sanctification, and the firstfruits of the holy things* (Ecclesiasticus 7:31). It ain''t new — this is Numbers and Deuteronomy''s priestly portion lived out. And the Letter to the Hebrews carries the same honour to those who lead: *Remember them which have the rule over you, who have spoken unto you the word of Elohim (God): whose faith follow, considering the end of their conversation* (Hebrews 13:7), *Obey them that have the rule over you, and submit yourselves: for they watch for your souls, as they that must give account* (Hebrews 13:17). The fear of Yahuah and the firstfruits stand together.',
       sv.verse_id, ev.verse_id, 'extras', 58462
  FROM _session253_sir07_lookup sv, _session253_sir07_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=7 AND sv.verse_number=29
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=7 AND ev.verse_number=31
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-7-alms-the-poor-the-sick-the-mourner',
       E'Stretch thine hand to the poor — visit the sick',
       E'The chapter''s mercy-cluster: *And stretch yours hand to the poor, that your blessing may be perfected* (Ecclesiasticus 7:32), *Fail not to be with them that weep, and mourn with them that mourn* (Ecclesiasticus 7:34), *Be not slow to visit the sick: for that shall make you to be beloved* (Ecclesiasticus 7:35). It ain''t new — this is the Proverb the NT folds into the gospel: *He that hath pity upon the poor lendeth unto Yahuah (LORD); and that which he hath given will he pay him again* (Proverbs 19:17), and it is precisely the works the King names at the judgment: *Naked, and ye clothed me: I was sick, and ye visited me: I was in prison, and ye came unto me* (Matthew 25:36). And the restored Tobit, ben Sira''s apocryphal sibling, sounds the same note: *Give alms of your substance; and when you give alms, let not your eye be envious, neither turn your face from any poor, and the face of Yahuah (God) shall not be turned away from you* (Tobit 4:7). Almsgiving perfects the blessing, library to library.',
       sv.verse_id, ev.verse_id, 'extras', 58465
  FROM _session253_sir07_lookup sv, _session253_sir07_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=7 AND sv.verse_number=32
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=7 AND ev.verse_number=35
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-7-remember-the-end',
       E'Whatsoever thou takest in hand — remember the end',
       E'Ben Sira seals the chapter with its golden maxim: *Whatsoever you take in hand, remember the end, and you shall never do amiss* (Ecclesiasticus 7:36). It ain''t new — it is the Song of Moses'' lament over the foolish who will not consider their last things: *O that they were wise, that they understood this, that they would consider their latter end!* (Deuteronomy 32:29), and the Psalmist''s prayer for a wisdom-bearing reckoning of our days: *So teach us to number our days, that we may apply our hearts unto wisdom* (Psalm 90:12). The Letter to the Hebrews bids us follow the faithful "considering the end of their conversation" — *Remember them which have the rule over you, who have spoken unto you the word of Elohim (God): whose faith follow, considering the end of their conversation* (Hebrews 13:7). Remember the end, and thou shalt never sin.',
       sv.verse_id, ev.verse_id, 'extras', 58468
  FROM _session253_sir07_lookup sv, _session253_sir07_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=7 AND sv.verse_number=36
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=7 AND ev.verse_number=36
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ecclesiasticus-7-do-no-evil-flee-iniquity
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 1:7 — *The fear of Yahuah (LORD) is the beginning of knowledge: but fools despise wisdom and instruction* — the wisdom of which Sirach 7:1''s "do no evil" is the first lived obedience.'
  FROM cross_reference_threads t, cross_references x, _session253_sir07_lookup sv, _session253_sir07_lookup tv
 WHERE t.slug='ecclesiasticus-7-do-no-evil-flee-iniquity'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=1 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'James 1:27 — *Pure religion and undefiled before Elohim (God) and the Father is this, To visit the fatherless and widows in their affliction, and to keep himself unspotted from the world* — the same departing-from-iniquity that Sirach 7:2 urges, framed as undefiled religion.'
  FROM cross_reference_threads t, cross_references x, _session253_sir07_lookup sv, _session253_sir07_lookup tv
 WHERE t.slug='ecclesiasticus-7-do-no-evil-flee-iniquity'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=7 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-7-humble-thyself
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 3:34 — *Surely he scorneth the scorners: but he giveth grace unto the lowly* — the same exalting of the lowly that Sirach 7:17''s "humble thyself greatly" commands.'
  FROM cross_reference_threads t, cross_references x, _session253_sir07_lookup sv, _session253_sir07_lookup tv
 WHERE t.slug='ecclesiasticus-7-humble-thyself'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=7 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=3 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'James 4:6 — *But he giveth more grace. Wherefore he saith, Elohim (God) resisteth the proud, but giveth grace unto the humble* — James draws the very Proverb Sirach 7:17 dramatizes with "the vengeance of the ungodly."'
  FROM cross_reference_threads t, cross_references x, _session253_sir07_lookup sv, _session253_sir07_lookup tv
 WHERE t.slug='ecclesiasticus-7-humble-thyself'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=7 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=4 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'James 4:10 — *Humble yourselves in the sight of Yahuah (Lord), and he shall lift you up* — the command form of Sirach 7:17''s "Humble thyself greatly."'
  FROM cross_reference_threads t, cross_references x, _session253_sir07_lookup sv, _session253_sir07_lookup tv
 WHERE t.slug='ecclesiasticus-7-humble-thyself'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=7 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=4 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'James 4:10 — *Humble yourselves in the sight of Yahuah (Lord), and he shall lift you up* — the One who "humbleth and exalteth" of Sirach 7:11 is the same Yahuah who lifts up the humble.'
  FROM cross_reference_threads t, cross_references x, _session253_sir07_lookup sv, _session253_sir07_lookup tv
 WHERE t.slug='ecclesiasticus-7-humble-thyself'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=7 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=4 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-7-lie-not-bridle-the-tongue
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'James 1:26 — *If any man among you seem to be religious, and bridleth not his tongue, but deceiveth his own heart, this man''s religion is vain* — the same bridling of lying speech Sirach 7:13 calls for, for "the custom thereof is not good."'
  FROM cross_reference_threads t, cross_references x, _session253_sir07_lookup sv, _session253_sir07_lookup tv
 WHERE t.slug='ecclesiasticus-7-lie-not-bridle-the-tongue'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=7 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'James 1:19 — *Wherefore, my beloved brethren, let every man be swift to hear, slow to speak, slow to wrath* — the slow-to-speak restraint Sirach 7:14 urges against "much babbling."'
  FROM cross_reference_threads t, cross_references x, _session253_sir07_lookup sv, _session253_sir07_lookup tv
 WHERE t.slug='ecclesiasticus-7-lie-not-bridle-the-tongue'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=7 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-7-honour-father-and-mother
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 20:12 — *Honour thy father and thy mother: that thy days may be long upon the land which Yahuah Elohayka (the LORD thy God) giveth thee* — the Decalogue word Sirach 7:27 expounds "with your whole heart."'
  FROM cross_reference_threads t, cross_references x, _session253_sir07_lookup sv, _session253_sir07_lookup tv
 WHERE t.slug='ecclesiasticus-7-honour-father-and-mother'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=7 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ephesians 6:2 — *Honour thy father and mother; (which is the first commandment with promise;)* — Paul names as covenant-promise the very honour Sirach 7:27 commands.'
  FROM cross_reference_threads t, cross_references x, _session253_sir07_lookup sv, _session253_sir07_lookup tv
 WHERE t.slug='ecclesiasticus-7-honour-father-and-mother'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=7 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 22:6 — *Train up a child in the way he should go: and when he is old, he will not depart from it* — the instructing of children Sirach 7:23 commands: "instruct them, and bow down their neck from their youth."'
  FROM cross_reference_threads t, cross_references x, _session253_sir07_lookup sv, _session253_sir07_lookup tv
 WHERE t.slug='ecclesiasticus-7-honour-father-and-mother'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=7 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=22 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-7-fear-yahuah-honour-the-priest
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hebrews 13:7 — *Remember them which have the rule over you, who have spoken unto you the word of Elohim (God): whose faith follow, considering the end of their conversation* — the reverencing of Yahuah''s ministers that Sirach 7:29 commands.'
  FROM cross_reference_threads t, cross_references x, _session253_sir07_lookup sv, _session253_sir07_lookup tv
 WHERE t.slug='ecclesiasticus-7-fear-yahuah-honour-the-priest'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=7 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=13 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 13:17 — *Obey them that have the rule over you, and submit yourselves: for they watch for your souls, as they that must give account, that they may do it with joy, and not with grief: for that is unprofitable for you* — the honouring of the priest "as it is commanded you" that Sirach 7:31 details.'
  FROM cross_reference_threads t, cross_references x, _session253_sir07_lookup sv, _session253_sir07_lookup tv
 WHERE t.slug='ecclesiasticus-7-fear-yahuah-honour-the-priest'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=7 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=13 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 3:9 — *Honour Yahuah (LORD) with thy substance, and with the firstfruits of all thine increase* — the firstfruits-portion Sirach 7:31 names among the priest''s due.'
  FROM cross_reference_threads t, cross_references x, _session253_sir07_lookup sv, _session253_sir07_lookup tv
 WHERE t.slug='ecclesiasticus-7-fear-yahuah-honour-the-priest'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=7 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=3 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-7-alms-the-poor-the-sick-the-mourner
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 19:17 — *He that hath pity upon the poor lendeth unto Yahuah (LORD); and that which he hath given will he pay him again* — the perfected blessing of the open hand Sirach 7:32 promises.'
  FROM cross_reference_threads t, cross_references x, _session253_sir07_lookup sv, _session253_sir07_lookup tv
 WHERE t.slug='ecclesiasticus-7-alms-the-poor-the-sick-the-mourner'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=7 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=19 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 25:36 — *Naked, and ye clothed me: I was sick, and ye visited me: I was in prison, and ye came unto me* — the King names visiting the sick, the very work Sirach 7:35 commands: "Be not slow to visit the sick."'
  FROM cross_reference_threads t, cross_references x, _session253_sir07_lookup sv, _session253_sir07_lookup tv
 WHERE t.slug='ecclesiasticus-7-alms-the-poor-the-sick-the-mourner'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=7 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=25 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Tobit 4:7 — *Give alms of your substance; and when you give alms, let not your eye be envious, neither turn your face from any poor, and the face of Yahuah (God) shall not be turned away from you* — Tobit''s almsgiving charge, the apocryphal sibling to Sirach 7:32''s hand stretched to the poor.'
  FROM cross_reference_threads t, cross_references x, _session253_sir07_lookup sv, _session253_sir07_lookup tv
 WHERE t.slug='ecclesiasticus-7-alms-the-poor-the-sick-the-mourner'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=7 AND sv.verse_number=32
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=4 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-7-remember-the-end
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 32:29 — *O that they were wise, that they understood this, that they would consider their latter end!* — the considered "end" of Sirach 7:36 is Moses'' very plea, the wisdom of the latter end.'
  FROM cross_reference_threads t, cross_references x, _session253_sir07_lookup sv, _session253_sir07_lookup tv
 WHERE t.slug='ecclesiasticus-7-remember-the-end'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=7 AND sv.verse_number=36
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 90:12 — *So teach us to number our days, that we may apply our hearts unto wisdom* — numbering our days is to "remember the end" of Sirach 7:36, that we never do amiss.'
  FROM cross_reference_threads t, cross_references x, _session253_sir07_lookup sv, _session253_sir07_lookup tv
 WHERE t.slug='ecclesiasticus-7-remember-the-end'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=7 AND sv.verse_number=36
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=90 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 13:7 — *Remember them which have the rule over you, who have spoken unto you the word of Elohim (God): whose faith follow, considering the end of their conversation* — Hebrews bids us follow the faithful "considering the end," the same remembrance Sirach 7:36 commands.'
  FROM cross_reference_threads t, cross_references x, _session253_sir07_lookup sv, _session253_sir07_lookup tv
 WHERE t.slug='ecclesiasticus-7-remember-the-end'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=7 AND sv.verse_number=36
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=13 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

