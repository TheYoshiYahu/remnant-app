-- ----- fragment: minion_ecclesiasticus_10.sql (session253 ecclesiasticus 10) -----
-- Source anchor: apocrypha/ecclesiasticus ch10. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: sir10 (view _session253_sir10_lookup). Sort band base 58525, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_sir10_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ecclesiasticus-10-pride-beginning-of-sin
  ('apocrypha', 'ecclesiasticus', 10, 13, 'canon', 'proverbs', 16, 18, 'free', E'Proverbs 16:18 — *Pride goeth before destruction, and an haughty spirit before a fall.* The wisdom-axiom Ben Sira distills: pride is the head that drags down everything after it, as in Sirach 10:13.'),
  ('apocrypha', 'ecclesiasticus', 10, 13, 'canon', 'proverbs', 11, 2, 'free', E'Proverbs 11:2 — *When pride cometh, then cometh shame: but with the lowly is wisdom.* Pride breeds the abomination Sirach 10:13 warns of, while lowliness is wisdom''s home.'),
  ('apocrypha', 'ecclesiasticus', 10, 12, 'canon', 'proverbs', 8, 13, 'free', E'Proverbs 8:13 — *The fear of Yahuah (LORD) is to hate evil: pride, and arrogancy, and the evil way, and the froward mouth, do I hate.* The heart turned from its Maker (Sirach 10:12) is exactly the pride Yahuah names as hateful.'),
  ('apocrypha', 'ecclesiasticus', 10, 12, 'canon', 'deuteronomy', 8, 14, 'free', E'Deuteronomy 8:14 — *Then thine heart be lifted up, and thou forget Yahuah Elohayka (the LORD thy God), which brought thee forth out of the land of Egypt, from the house of bondage;* the lifted-up heart forgetting its Maker is the very departure Sirach 10:12 calls the beginning of pride.'),
  -- thread: ecclesiasticus-10-thrones-cast-down-meek-exalted
  ('apocrypha', 'ecclesiasticus', 10, 14, 'canon', 'isaiah', 14, 14, 'free', E'Isaiah 14:14 — *I will ascend above the heights of the clouds; I will be like the El Elyon (most High).* The self-exalting throne Isaiah taunts is precisely the proud throne Yahuah casts down in Sirach 10:14.'),
  ('apocrypha', 'ecclesiasticus', 10, 14, 'canon', 'daniel', 4, 37, 'free', E'Daniel 4:37 — *Now I Nebuchadnezzar praise and extol and honour the King of heaven, all whose works are truth, and his ways judgment: and those that walk in pride he is able to abase.* The abased king''s confession is Sirach 10:14 enacted in history.'),
  ('apocrypha', 'ecclesiasticus', 10, 14, 'canon', 'luke', 1, 52, 'free', E'Luke 1:52 — *He hath put down the mighty from their seats, and exalted them of low degree.* Mariam''s song is the very reversal of Sirach 10:14 — proud thrones down, the meek up.'),
  ('apocrypha', 'ecclesiasticus', 10, 18, 'canon', 'luke', 14, 11, 'free', E'Luke 14:11 — *For whosoever exalteth himself shall be abased; and he that humbleth himself shall be exalted.* Pride was not made for the born-of-woman (Sirach 10:18); the Master makes its undoing a law of the kingdom.'),
  -- thread: ecclesiasticus-10-elohim-resists-the-proud
  ('apocrypha', 'ecclesiasticus', 10, 7, 'canon', 'james', 4, 6, 'free', E'James 4:6 — *But he giveth more grace. Wherefore he saith, Elohim (God) resisteth the proud, but giveth grace unto the humble.* James, Sirach''s closest NT sibling, turns 10:7''s pride-is-hateful into the gospel of grace for the lowly.'),
  ('apocrypha', 'ecclesiasticus', 10, 7, 'canon', '1-peter', 5, 5, 'free', E'1 Peter 5:5 — *Likewise, ye younger, submit yourselves unto the elder. Yea, all of you be subject one to another, and be clothed with humility: for Elohim (God) resisteth the proud, and giveth grace to the humble.* The same proverb the apostles knew: the pride Sirach 10:7 calls hateful is what heaven sets itself against.'),
  ('apocrypha', 'ecclesiasticus', 10, 7, 'canon', 'matthew', 23, 12, 'free', E'Matthew 23:12 — *And whosoever shall exalt himself shall be abased; and he that shall humble himself shall be exalted.* The Master''s verdict on the proud matches Sirach 10:7 — pride is hateful, and it ends abased.'),
  -- thread: ecclesiasticus-10-earth-and-ashes-covetous
  ('apocrypha', 'ecclesiasticus', 10, 9, 'canon', 'genesis', 18, 27, 'free', E'Genesis 18:27 — *And Abraham answered and said, Behold now, I have taken upon me to speak unto Yahuah (Lord), which am but dust and ashes:* Abraham owns the very lowliness Sirach 10:9 asks the proud to remember — why is earth and ashes proud?'),
  ('apocrypha', 'ecclesiasticus', 10, 11, 'canon', 'genesis', 3, 19, 'free', E'Genesis 3:19 — *In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return.* The Eden sentence is why the dead man inherits worms in Sirach 10:11 — ashes have no ground for pride.'),
  ('apocrypha', 'ecclesiasticus', 10, 9, 'canon', '1-timothy', 6, 7, 'free', E'1 Timothy 6:7 — *For we brought nothing into this world, and it is certain we can carry nothing out.* The covetous man Sirach 10:9 sells his soul for what he cannot keep — Paul names the same emptiness.'),
  ('apocrypha', 'ecclesiasticus', 10, 9, 'canon', 'luke', 12, 20, 'free', E'Luke 12:20 — *But Elohim (God) said unto him, Thou fool, this night thy soul shall be required of thee: then whose shall those things be, which thou hast provided?* The rich fool is Sirach 10:9''s covetous man — he sets his soul to sale and loses it overnight.'),
  ('apocrypha', 'ecclesiasticus', 10, 9, 'apocrypha', 'the-wisdom-of-solomon', 5, 8, 'extras', E'Wisdom of Solomon 5:8 — *What has pride profited us? or what good has riches with our vaunting brought us?* The ungodly''s too-late confession answers Sirach 10:9''s question — pride and riches profit the earth-and-ashes man nothing.'),
  -- thread: ecclesiasticus-10-fear-of-yahuah-the-glory
  ('apocrypha', 'ecclesiasticus', 10, 22, 'canon', 'proverbs', 1, 7, 'free', E'Proverbs 1:7 — *The fear of Yahuah (LORD) is the beginning of knowledge: but fools despise wisdom and instruction.* The glory Sirach 10:22 grants rich and poor alike is the reverence Proverbs makes the head of all knowledge.'),
  ('apocrypha', 'ecclesiasticus', 10, 24, 'canon', 'proverbs', 9, 10, 'free', E'Proverbs 9:10 — *The fear of Yahuah (LORD) is the beginning of wisdom: and the knowledge of the holy is understanding.* None is greater than the man who fears Yahuah (Sirach 10:24) because that fear is wisdom''s very beginning.'),
  ('apocrypha', 'ecclesiasticus', 10, 22, 'canon', 'proverbs', 22, 2, 'free', E'Proverbs 22:2 — *The rich and poor meet together: Yahuah (LORD) is the maker of them all.* Rich, noble, or poor (Sirach 10:22) share one glory because they share one Maker.'),
  ('apocrypha', 'ecclesiasticus', 10, 22, 'apocrypha', 'ecclesiasticus', 1, 14, 'extras', E'Ecclesiasticus 1:14 — *To fear Yahuah (God) is the beginning of wisdom: and it was created with the faithful in the womb.* Ben Sira''s own opening thesis grounds 10:22 — the fear of Yahuah is the glory of every estate.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_sir10_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_sir10_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-10-pride-beginning-of-sin',
       E'Pride is the beginning of sin',
       E'Ben Sira names the root and traces its fruit: *The beginning of pride is when one departs from Yahuah (God), and his heart is turned away from his Maker* (Ecclesiasticus 10:12), *For pride is the beginning of sin, and he that has it shall pour out abomination: and therefore Yahuah (God) brought upon them strange calamities, and overthrew them utterly* (Ecclesiasticus 10:13). It ain''t new — Proverbs sets the same axiom: *Pride goeth before destruction, and an haughty spirit before a fall* (Proverbs 16:18); *When pride cometh, then cometh shame: but with the lowly is wisdom* (Proverbs 11:2); and Yahuah Himself declares *pride, and arrogancy, and the evil way, and the froward mouth, do I hate* (Proverbs 8:13). Pride is not a private flaw but a departure from the Maker — the first turning-away — and so the head of every other sin.',
       sv.verse_id, ev.verse_id, 'extras', 58525
  FROM _session253_sir10_lookup sv, _session253_sir10_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=10 AND sv.verse_number=12
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=10 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-10-thrones-cast-down-meek-exalted',
       E'He casts down proud thrones, lifts the meek',
       E'The same hand that hates pride overturns it in history: *Yahuah (God) has cast down the thrones of proud princes, and set up the meek in their stead* (Ecclesiasticus 10:14); *Pride was not made for men, nor furious anger for them that are born of a woman* (Ecclesiasticus 10:18). Isaiah''s taunt over the fallen king is the archetype — *For thou hast said in thine heart, I will ascend into heaven, I will exalt my throne above the stars of Elohim (God)* ... *I will be like the El Elyon (most High)* ... *Yet thou shalt be brought down to hell, to the sides of the pit* (Isaiah 14:13-15). Nebuchadnezzar lives the parable: *Is not this great Babylon, that I have built ... for the honour of my majesty?* (Daniel 4:30) is answered by the abasing voice, until the humbled king confesses *those that walk in pride he is able to abase* (Daniel 4:37). Hannah and Mariam sing the reversal — *He hath put down the mighty from their seats, and exalted them of low degree* (Luke 1:52) — and the Master seals it: *whosoever exalteth himself shall be abased; and he that humbleth himself shall be exalted* (Luke 14:11).',
       sv.verse_id, ev.verse_id, 'extras', 58528
  FROM _session253_sir10_lookup sv, _session253_sir10_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=10 AND sv.verse_number=14
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=10 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-10-elohim-resists-the-proud',
       E'Elohim resists the proud, gives grace to the humble',
       E'Pride stands hateful before heaven and man alike: *Pride is hateful before Yahuah (God) and man: and by both does one commit iniquity* (Ecclesiasticus 10:7). The whole counsel of the Tanakh and the apostles answers in one voice. James lifts the wisdom-teaching straight into the assembly — *Elohim (God) resisteth the proud, but giveth grace unto the humble* (James 4:6) — and Kepha (Peter) repeats it word for word: *be clothed with humility: for Elohim (God) resisteth the proud, and giveth grace to the humble* (1 Peter 5:5). Yeshua ben Sira''s near sibling James is the closest NT echo of this whole chapter; the humble heart is the one heaven will not war against.',
       sv.verse_id, ev.verse_id, 'extras', 58531
  FROM _session253_sir10_lookup sv, _session253_sir10_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=10 AND sv.verse_number=7
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=10 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-10-earth-and-ashes-covetous',
       E'Why is earth and ashes proud?',
       E'Ben Sira shames the swelling heart with the dust it came from: *Why is earth and ashes proud? There is not a more wicked thing than a covetous man: for such an one sets his own soul to sale; because while he lives he casteth away his bowels* (Ecclesiasticus 10:9), for *when a man is dead, he shall inherit creeping things, beasts, and worms* (Ecclesiasticus 10:11). Abraham knew the posture — *I have taken upon me to speak unto Yahuah (Lord), which am but dust and ashes* (Genesis 18:27) — under the sentence of Eden: *dust thou art, and unto dust shalt thou return* (Genesis 3:19). And the covetousness Sirach couples with pride the apostle exposes: *we brought nothing into this world, and it is certain we can carry nothing out* (1 Timothy 6:7) — the rich fool of Luke 12:20 learns it the hard way. Earth and ashes have nothing to be proud of, and grasping for more only sells the soul.',
       sv.verse_id, ev.verse_id, 'extras', 58534
  FROM _session253_sir10_lookup sv, _session253_sir10_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=10 AND sv.verse_number=9
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=10 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-10-fear-of-yahuah-the-glory',
       E'The fear of Yahuah is the true glory',
       E'Against pride Ben Sira sets the one honour that holds: *The fear of Yahuah (God) goes before the obtaining of authority: but roughness and pride is the losing thereof* (Ecclesiasticus 10:21); *Whether he be rich, noble, or poor, their glory is the fear of Yahuah (God)* (Ecclesiasticus 10:22); *Great men, and judges, and potentates, shall be honoured; yet is there none of them greater than he that fears Yahuah (God)* (Ecclesiasticus 10:24). This is the spine of all wisdom literature — *The fear of Yahuah (LORD) is the beginning of knowledge* (Proverbs 1:7); *The fear of Yahuah (LORD) is the beginning of wisdom* (Proverbs 9:10). Ben Sira himself opens the book the same way (Ecclesiasticus 1:14). And the rich and poor whom Sirach levels under one glory meet as one before their Maker: *The rich and poor meet together: Yahuah (LORD) is the maker of them all* (Proverbs 22:2). It ain''t new — reverence, not rank, is a man''s true greatness.',
       sv.verse_id, ev.verse_id, 'extras', 58537
  FROM _session253_sir10_lookup sv, _session253_sir10_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=10 AND sv.verse_number=21
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=10 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ecclesiasticus-10-pride-beginning-of-sin
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 16:18 — *Pride goeth before destruction, and an haughty spirit before a fall.* The wisdom-axiom Ben Sira distills: pride is the head that drags down everything after it, as in Sirach 10:13.'
  FROM cross_reference_threads t, cross_references x, _session253_sir10_lookup sv, _session253_sir10_lookup tv
 WHERE t.slug='ecclesiasticus-10-pride-beginning-of-sin'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=10 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=16 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 11:2 — *When pride cometh, then cometh shame: but with the lowly is wisdom.* Pride breeds the abomination Sirach 10:13 warns of, while lowliness is wisdom''s home.'
  FROM cross_reference_threads t, cross_references x, _session253_sir10_lookup sv, _session253_sir10_lookup tv
 WHERE t.slug='ecclesiasticus-10-pride-beginning-of-sin'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=10 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=11 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 8:13 — *The fear of Yahuah (LORD) is to hate evil: pride, and arrogancy, and the evil way, and the froward mouth, do I hate.* The heart turned from its Maker (Sirach 10:12) is exactly the pride Yahuah names as hateful.'
  FROM cross_reference_threads t, cross_references x, _session253_sir10_lookup sv, _session253_sir10_lookup tv
 WHERE t.slug='ecclesiasticus-10-pride-beginning-of-sin'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=10 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=8 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Deuteronomy 8:14 — *Then thine heart be lifted up, and thou forget Yahuah Elohayka (the LORD thy God), which brought thee forth out of the land of Egypt, from the house of bondage;* the lifted-up heart forgetting its Maker is the very departure Sirach 10:12 calls the beginning of pride.'
  FROM cross_reference_threads t, cross_references x, _session253_sir10_lookup sv, _session253_sir10_lookup tv
 WHERE t.slug='ecclesiasticus-10-pride-beginning-of-sin'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=10 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=8 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-10-thrones-cast-down-meek-exalted
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 14:14 — *I will ascend above the heights of the clouds; I will be like the El Elyon (most High).* The self-exalting throne Isaiah taunts is precisely the proud throne Yahuah casts down in Sirach 10:14.'
  FROM cross_reference_threads t, cross_references x, _session253_sir10_lookup sv, _session253_sir10_lookup tv
 WHERE t.slug='ecclesiasticus-10-thrones-cast-down-meek-exalted'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=10 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=14 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 4:37 — *Now I Nebuchadnezzar praise and extol and honour the King of heaven, all whose works are truth, and his ways judgment: and those that walk in pride he is able to abase.* The abased king''s confession is Sirach 10:14 enacted in history.'
  FROM cross_reference_threads t, cross_references x, _session253_sir10_lookup sv, _session253_sir10_lookup tv
 WHERE t.slug='ecclesiasticus-10-thrones-cast-down-meek-exalted'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=10 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=4 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Luke 1:52 — *He hath put down the mighty from their seats, and exalted them of low degree.* Mariam''s song is the very reversal of Sirach 10:14 — proud thrones down, the meek up.'
  FROM cross_reference_threads t, cross_references x, _session253_sir10_lookup sv, _session253_sir10_lookup tv
 WHERE t.slug='ecclesiasticus-10-thrones-cast-down-meek-exalted'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=10 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=52
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Luke 14:11 — *For whosoever exalteth himself shall be abased; and he that humbleth himself shall be exalted.* Pride was not made for the born-of-woman (Sirach 10:18); the Master makes its undoing a law of the kingdom.'
  FROM cross_reference_threads t, cross_references x, _session253_sir10_lookup sv, _session253_sir10_lookup tv
 WHERE t.slug='ecclesiasticus-10-thrones-cast-down-meek-exalted'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=10 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=14 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-10-elohim-resists-the-proud
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'James 4:6 — *But he giveth more grace. Wherefore he saith, Elohim (God) resisteth the proud, but giveth grace unto the humble.* James, Sirach''s closest NT sibling, turns 10:7''s pride-is-hateful into the gospel of grace for the lowly.'
  FROM cross_reference_threads t, cross_references x, _session253_sir10_lookup sv, _session253_sir10_lookup tv
 WHERE t.slug='ecclesiasticus-10-elohim-resists-the-proud'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=10 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=4 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Peter 5:5 — *Likewise, ye younger, submit yourselves unto the elder. Yea, all of you be subject one to another, and be clothed with humility: for Elohim (God) resisteth the proud, and giveth grace to the humble.* The same proverb the apostles knew: the pride Sirach 10:7 calls hateful is what heaven sets itself against.'
  FROM cross_reference_threads t, cross_references x, _session253_sir10_lookup sv, _session253_sir10_lookup tv
 WHERE t.slug='ecclesiasticus-10-elohim-resists-the-proud'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=10 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=5 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 23:12 — *And whosoever shall exalt himself shall be abased; and he that shall humble himself shall be exalted.* The Master''s verdict on the proud matches Sirach 10:7 — pride is hateful, and it ends abased.'
  FROM cross_reference_threads t, cross_references x, _session253_sir10_lookup sv, _session253_sir10_lookup tv
 WHERE t.slug='ecclesiasticus-10-elohim-resists-the-proud'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=10 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=23 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-10-earth-and-ashes-covetous
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 18:27 — *And Abraham answered and said, Behold now, I have taken upon me to speak unto Yahuah (Lord), which am but dust and ashes:* Abraham owns the very lowliness Sirach 10:9 asks the proud to remember — why is earth and ashes proud?'
  FROM cross_reference_threads t, cross_references x, _session253_sir10_lookup sv, _session253_sir10_lookup tv
 WHERE t.slug='ecclesiasticus-10-earth-and-ashes-covetous'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=10 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=18 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:19 — *In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return.* The Eden sentence is why the dead man inherits worms in Sirach 10:11 — ashes have no ground for pride.'
  FROM cross_reference_threads t, cross_references x, _session253_sir10_lookup sv, _session253_sir10_lookup tv
 WHERE t.slug='ecclesiasticus-10-earth-and-ashes-covetous'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=10 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Timothy 6:7 — *For we brought nothing into this world, and it is certain we can carry nothing out.* The covetous man Sirach 10:9 sells his soul for what he cannot keep — Paul names the same emptiness.'
  FROM cross_reference_threads t, cross_references x, _session253_sir10_lookup sv, _session253_sir10_lookup tv
 WHERE t.slug='ecclesiasticus-10-earth-and-ashes-covetous'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=10 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='1-timothy' AND tv.chapter_number=6 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Luke 12:20 — *But Elohim (God) said unto him, Thou fool, this night thy soul shall be required of thee: then whose shall those things be, which thou hast provided?* The rich fool is Sirach 10:9''s covetous man — he sets his soul to sale and loses it overnight.'
  FROM cross_reference_threads t, cross_references x, _session253_sir10_lookup sv, _session253_sir10_lookup tv
 WHERE t.slug='ecclesiasticus-10-earth-and-ashes-covetous'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=10 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=12 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Wisdom of Solomon 5:8 — *What has pride profited us? or what good has riches with our vaunting brought us?* The ungodly''s too-late confession answers Sirach 10:9''s question — pride and riches profit the earth-and-ashes man nothing.'
  FROM cross_reference_threads t, cross_references x, _session253_sir10_lookup sv, _session253_sir10_lookup tv
 WHERE t.slug='ecclesiasticus-10-earth-and-ashes-covetous'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=10 AND sv.verse_number=9
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-10-fear-of-yahuah-the-glory
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 1:7 — *The fear of Yahuah (LORD) is the beginning of knowledge: but fools despise wisdom and instruction.* The glory Sirach 10:22 grants rich and poor alike is the reverence Proverbs makes the head of all knowledge.'
  FROM cross_reference_threads t, cross_references x, _session253_sir10_lookup sv, _session253_sir10_lookup tv
 WHERE t.slug='ecclesiasticus-10-fear-of-yahuah-the-glory'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=10 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=1 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 9:10 — *The fear of Yahuah (LORD) is the beginning of wisdom: and the knowledge of the holy is understanding.* None is greater than the man who fears Yahuah (Sirach 10:24) because that fear is wisdom''s very beginning.'
  FROM cross_reference_threads t, cross_references x, _session253_sir10_lookup sv, _session253_sir10_lookup tv
 WHERE t.slug='ecclesiasticus-10-fear-of-yahuah-the-glory'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=10 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=9 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 22:2 — *The rich and poor meet together: Yahuah (LORD) is the maker of them all.* Rich, noble, or poor (Sirach 10:22) share one glory because they share one Maker.'
  FROM cross_reference_threads t, cross_references x, _session253_sir10_lookup sv, _session253_sir10_lookup tv
 WHERE t.slug='ecclesiasticus-10-fear-of-yahuah-the-glory'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=10 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=22 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ecclesiasticus 1:14 — *To fear Yahuah (God) is the beginning of wisdom: and it was created with the faithful in the womb.* Ben Sira''s own opening thesis grounds 10:22 — the fear of Yahuah is the glory of every estate.'
  FROM cross_reference_threads t, cross_references x, _session253_sir10_lookup sv, _session253_sir10_lookup tv
 WHERE t.slug='ecclesiasticus-10-fear-of-yahuah-the-glory'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=10 AND sv.verse_number=22
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

