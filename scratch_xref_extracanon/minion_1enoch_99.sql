-- ----- fragment: minion_1enoch_99.sql (session250 1-enoch 99) -----
-- Source anchor: enoch/1-enoch ch99. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en99 (view _session250_en99_lookup). Sort band base 52450, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en99_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-99-pervert-the-eternal-law
  ('enoch', '1-enoch', 99, 2, 'canon', 'isaiah', 5, 24, 'free', E'Isaiah 5:24 — *Therefore as the fire devoureth the stubble, and the flame consumeth the chaff, so their root shall be as rottenness, and their blossom shall go up as dust: because they have cast away the law of Yahuah Tseva''ot (LORD of hosts), and despised the word of the Holy One of Yashar''el (Israel).* The same eternal law Enoch''s woe defends is the law Isaiah''s woe says they have cast away.'),
  ('enoch', '1-enoch', 99, 2, 'canon', 'deuteronomy', 27, 18, 'free', E'Deuteronomy 27:18 — *Cursed be he that maketh the blind to wander out of the way. And all the people shall say, Amen.* Enoch''s woe on those who pervert uprightness and lead others into sin is the amen-bound Sinai curse on whoever misleads the blind.'),
  ('enoch', '1-enoch', 99, 2, 'canon', 'proverbs', 22, 28, 'free', E'Proverbs 22:28 — *Remove not the ancient landmark, which thy fathers have set.* To transgress the eternal law is to move the boundary the fathers laid; the righteous keep the inheritance, they do not transform it.'),
  -- thread: 1-enoch-99-idols-not-according-to-knowledge
  ('enoch', '1-enoch', 99, 7, 'canon', 'jeremiah', 10, 14, 'free', E'Jeremiah 10:14 — *Every man is brutish in his knowledge: every founder is confounded by the graven image: for his molten image is falsehood, and there is no breath in them.* Enoch''s idols "not according to knowledge" are Jeremiah''s breathless, false molten images that confound their makers.'),
  ('enoch', '1-enoch', 99, 9, 'canon', 'jeremiah', 10, 15, 'free', E'Jeremiah 10:15 — *They are vanity, and the work of errors: in the time of their visitation they shall perish.* As Enoch says the idol-worshippers "in an instant shall they perish," Jeremiah says the idols themselves shall perish in the time of visitation.'),
  ('enoch', '1-enoch', 99, 7, 'canon', 'habakkuk', 2, 19, 'free', E'Habakkuk 2:19 — *Woe unto him that saith to the wood, Awake; to the dumb stone, Arise, it shall teach! Behold, it is laid over with gold and silver, and there is no breath at all in the midst of it.* Habakkuk''s woe on the breathless gold-and-silver idol matches Enoch''s woe on those who worship stone and grave images of gold and silver and wood.'),
  ('enoch', '1-enoch', 99, 9, 'canon', 'revelation', 14, 11, 'free', E'Revelation 14:11 — *And the smoke of their torment ascendeth up for ever and ever: and they have no rest day nor night, who worship the beast and his image, and whosoever receiveth the mark of his name.* The end-judgement on idol-worship under the beast carries Enoch''s woe forward — the idolaters "shall get no manner of help" and find no rest.'),
  -- thread: 1-enoch-99-blessed-who-walk-the-paths
  ('enoch', '1-enoch', 99, 10, 'canon', 'deuteronomy', 30, 19, 'free', E'Deuteronomy 30:19 — *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live:* Enoch''s blessing on those who walk the paths of the Most High and "become not godless with the godless" is the Deuteronomic choosing of life over death.'),
  ('enoch', '1-enoch', 99, 10, 'canon', 'psalms', 1, 1, 'free', E'Psalm 1:1 — *Blessed is the man that walketh not in the counsel of the ungodly, nor standeth in the way of sinners, nor sitteth in the seat of the scornful.* The Psalter''s two-ways blessing uses Enoch''s own contrast: blessed are they who do not become godless with the godless.'),
  ('enoch', '1-enoch', 99, 10, 'canon', 'psalms', 1, 6, 'free', E'Psalm 1:6 — *For Yahuah (LORD) knoweth the way of the righteous: but the way of the ungodly shall perish.* Enoch''s "they shall be saved" against the godless who "in an instant shall perish" is the same divided end of the two ways.'),
  -- thread: 1-enoch-99-woe-oppressors-false-measures
  ('enoch', '1-enoch', 99, 12, 'canon', 'amos', 8, 5, 'free', E'Amos 8:5 — *Saying, When will the new moon be gone, that we may sell corn? and the sabbath, that we may set forth wheat, making the ephah small, and the shekel great, and falsifying the balances by deceit?* Enoch''s "deceitful and false measures" are Amos''s small ephah and great shekel — the falsified balance against the poor.'),
  ('enoch', '1-enoch', 99, 13, 'canon', 'james', 5, 4, 'free', E'James 5:4 — *Behold, the hire of the labourers who have reaped down your fields, which is of you kept back by fraud, crieth: and the cries of them which have reaped are entered into the ears of Yahuah (Lord) of sabaoth.* Enoch''s woe on houses built through "the grievous toil of others" is James''s woe on the rich who withheld the laborer''s hire.'),
  ('enoch', '1-enoch', 99, 15, 'canon', 'james', 5, 6, 'free', E'James 5:6 — *Ye have condemned and killed the just; and he doth not resist you.* As Enoch''s woe falls on those who "slay their neighbours until the day of the great judgement," James names the rich who have condemned and killed the just.'),
  ('enoch', '1-enoch', 99, 15, 'apocrypha', 'ecclesiasticus', 34, 22, 'extras', E'Ecclesiasticus 34:22 — *He that takes away his neighbour''s living slayeth him; and he that defraudeth the labourer of his hire is a bloodshedder.* Ben Sira makes Enoch''s own equation: building on others'' toil and slaying neighbours are the same crime of bloodshed.'),
  -- thread: 1-enoch-99-prayers-memorial-before-the-most-high
  ('enoch', '1-enoch', 99, 3, 'canon', 'revelation', 8, 3, 'free', E'Revelation 8:3 — *And another angel came and stood at the altar, having a golden censer; and there was given unto him much incense, that he should offer it with the prayers of all saints upon the golden altar which was before the throne.* Enoch''s prayers raised "as a memorial... before the angels" are John''s saints'' prayers offered by the angel before the throne.'),
  ('enoch', '1-enoch', 99, 3, 'canon', 'revelation', 8, 4, 'free', E'Revelation 8:4 — *And the smoke of the incense, which came with the prayers of the saints, ascended up before Elohim (God) out of the angel''s hand.* The prayers ascending before Elohim are Enoch''s testimony placed "for a memorial before the Most High."'),
  ('enoch', '1-enoch', 99, 3, 'apocrypha', 'the-wisdom-of-solomon', 3, 7, 'extras', E'Wisdom of Solomon 3:7 — *And in the time of their visitation they shall shine, and run to and fro like sparks among the stubble.* The day Enoch''s righteous prepare for is the day of visitation when the righteous dead are vindicated and shine.'),
  ('enoch', '1-enoch', 99, 3, 'apocrypha', 'the-wisdom-of-solomon', 3, 10, 'extras', E'Wisdom of Solomon 3:10 — *But the ungodly shall be punished according to their own imaginations, which have neglected the righteous, and forsaken Yahuah (God).* As Enoch stores the sin of the sinners for a memorial of judgement, Wisdom says the ungodly are punished for neglecting the righteous and forsaking Yahuah.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en99_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en99_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-99-pervert-the-eternal-law',
       E'Woe to those who transgress the eternal law',
       E'Enoch''s woe falls on the lawbreaker: *Woe to them who pervert the words of uprightness, And transgress the eternal law, And transform themselves into what they were not [into sinners]: They shall be trodden under foot upon the earth.* (1 Enoch 99:2) — the law here is *eternal*, the way of life, and the judgement is for trampling it, never the law itself being a curse. Isaiah names the same crime against the same Torah: *because they have cast away the law of Yahuah Tseva''ot (LORD of hosts), and despised the word of the Holy One of Yashar''el (Israel)* (Isaiah 5:24). Enoch''s curse on those who lead others astray echoes Sinai''s own amen-bound curse: *Cursed be he that maketh the blind to wander out of the way. And all the people shall say, Amen.* (Deuteronomy 27:18) Set against this is the everlasting plant-line''s inheritance, marked by the boundary the fathers laid down: *Remove not the ancient landmark, which thy fathers have set.* (Proverbs 22:28) The eternal law stands; those who transform it perish.',
       sv.verse_id, ev.verse_id, 'extras', 52450
  FROM _session250_en99_lookup sv, _session250_en99_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=99 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=99 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-99-idols-not-according-to-knowledge',
       E'They worship a stone, and in an instant shall perish',
       E'The woe turns to idolatry: *And they who worship stones, and grave images of gold and silver and wood [and stone] and clay, And those who worship impure spirits and demons, And all kinds of idols not according to knowledge, shall get no manner of help from them.* (1 Enoch 99:7) — the idols are dumb, dead, breathless, exactly as Jeremiah names them: *Every man is brutish in his knowledge: every founder is confounded by the graven image: for his molten image is falsehood, and there is no breath in them.* (Jeremiah 10:14) — *They are vanity, and the work of errors: in the time of their visitation they shall perish.* (Jeremiah 10:15) Habakkuk''s own woe mocks the same trust in a breathless thing overlaid with gold and silver: *Woe unto him that saith to the wood, Awake; to the dumb stone, Arise, it shall teach! Behold, it is laid over with gold and silver, and there is no breath at all in the midst of it.* (Habakkuk 2:19) And the last book carries the woe to its end, where idol-worship under the beast brings unceasing torment with no rest: *And the smoke of their torment ascendeth up for ever and ever: and they have no rest day nor night, who worship the beast and his image, and whosoever receiveth the mark of his name.* (Revelation 14:11) The stone gives no help; *in an instant shall they perish.*',
       sv.verse_id, ev.verse_id, 'extras', 52453
  FROM _session250_en99_lookup sv, _session250_en99_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=99 AND sv.verse_number=7
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=99 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-99-blessed-who-walk-the-paths',
       E'Blessed are they who walk in the path of His righteousness',
       E'Against the woes Enoch sets the blessing — the two ways laid side by side: *But in those days blessed are all they who accept the words of wisdom, and understand them, And observe the paths of the Most High, and walk in the path of His righteousness, And become not godless with the godless; For they shall be saved.* (1 Enoch 99:10) This is the Deuteronomic choice itself, life set against death: *See, I have set before thee this day life and good, and death and evil* (Deuteronomy 30:15) — *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live* (Deuteronomy 30:19). The Psalter opens on the same two ways with the very word Enoch uses: *Blessed is the man that walketh not in the counsel of the ungodly, nor standeth in the way of sinners, nor sitteth in the seat of the scornful* (Psalm 1:1) — *For Yahuah (LORD) knoweth the way of the righteous: but the way of the ungodly shall perish* (Psalm 1:6). To walk the path of His righteousness is the way of life; Torah is never the curse, only the road of the saved.',
       sv.verse_id, ev.verse_id, 'extras', 52456
  FROM _session250_en99_lookup sv, _session250_en99_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=99 AND sv.verse_number=10
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=99 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-99-woe-oppressors-false-measures',
       E'Woe to the false measure and the house built on others'' toil',
       E'The woes fall on the systems of injustice — false weights, houses built on stolen labor, the bloodshed of neighbours: *Woe to you who make deceitful and false measures, And (to them) who cause bitterness on the earth; For they shall thereby be utterly consumed.* (1 Enoch 99:12) — *Woe to you who build your houses through the grievous toil of others, And all their building materials are the bricks and stones of sin; I tell you ye shall have no peace.* (1 Enoch 99:13) Amos names the same falsified balance and the swallowing of the needy: *making the ephah small, and the shekel great, and falsifying the balances by deceit* (Amos 8:5) — *That we may buy the poor for silver, and the needy for a pair of shoes* (Amos 8:6). James lays the whole woe on the rich whose wealth was built by defrauding the laborer: *Behold, the hire of the labourers who have reaped down your fields, which is of you kept back by fraud, crieth: and the cries of them which have reaped are entered into the ears of Yahuah (Lord) of sabaoth* (James 5:4) — *Ye have condemned and killed the just; and he doth not resist you* (James 5:6). And Ben Sira makes the equation Enoch makes, defrauding the laborer is bloodshed: *He that takes away his neighbour''s living slayeth him; and he that defraudeth the labourer of his hire is a bloodshedder* (Ecclesiasticus 34:22). The judgement dismantles the unjust system; the righteous keep the measure.',
       sv.verse_id, ev.verse_id, 'extras', 52459
  FROM _session250_en99_lookup sv, _session250_en99_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=99 AND sv.verse_number=12
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=99 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-99-prayers-memorial-before-the-most-high',
       E'The prayers of the righteous as a memorial before the Most High',
       E'Before the judgement Enoch charges the righteous to lift up their prayers as a witness: *In those days make ready, ye righteous, to raise your prayers as a memorial, And place them as a testimony before the angels, That they may place the sin of the sinners for a memorial before the Most High.* (1 Enoch 99:3) John sees that very scene at the altar, the saints'' prayers carried up by an angel: *And another angel came and stood at the altar, having a golden censer; and there was given unto him much incense, that he should offer it with the prayers of all saints upon the golden altar which was before the throne* (Revelation 8:3) — *And the smoke of the incense, which came with the prayers of the saints, ascended up before Elohim (God) out of the angel''s hand* (Revelation 8:4). And the day Enoch points to is the day the righteous dead are vindicated and shine, while the godless are repaid — the resurrection parallel that runs through the Epistle: *And in the time of their visitation they shall shine, and run to and fro like sparks among the stubble* (Wisdom of Solomon 3:7) — *But the ungodly shall be punished according to their own imaginations, which have neglected the righteous, and forsaken Yahuah (God)* (Wisdom of Solomon 3:10). Election runs through the memorial: the names of the righteous stand before the Most High, the sin of the sinners stored for the day of judgement.',
       sv.verse_id, ev.verse_id, 'extras', 52462
  FROM _session250_en99_lookup sv, _session250_en99_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=99 AND sv.verse_number=3
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=99 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-99-pervert-the-eternal-law
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 5:24 — *Therefore as the fire devoureth the stubble, and the flame consumeth the chaff, so their root shall be as rottenness, and their blossom shall go up as dust: because they have cast away the law of Yahuah Tseva''ot (LORD of hosts), and despised the word of the Holy One of Yashar''el (Israel).* The same eternal law Enoch''s woe defends is the law Isaiah''s woe says they have cast away.'
  FROM cross_reference_threads t, cross_references x, _session250_en99_lookup sv, _session250_en99_lookup tv
 WHERE t.slug='1-enoch-99-pervert-the-eternal-law'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=99 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=5 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 27:18 — *Cursed be he that maketh the blind to wander out of the way. And all the people shall say, Amen.* Enoch''s woe on those who pervert uprightness and lead others into sin is the amen-bound Sinai curse on whoever misleads the blind.'
  FROM cross_reference_threads t, cross_references x, _session250_en99_lookup sv, _session250_en99_lookup tv
 WHERE t.slug='1-enoch-99-pervert-the-eternal-law'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=99 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=27 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 22:28 — *Remove not the ancient landmark, which thy fathers have set.* To transgress the eternal law is to move the boundary the fathers laid; the righteous keep the inheritance, they do not transform it.'
  FROM cross_reference_threads t, cross_references x, _session250_en99_lookup sv, _session250_en99_lookup tv
 WHERE t.slug='1-enoch-99-pervert-the-eternal-law'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=99 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=22 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-99-idols-not-according-to-knowledge
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 10:14 — *Every man is brutish in his knowledge: every founder is confounded by the graven image: for his molten image is falsehood, and there is no breath in them.* Enoch''s idols "not according to knowledge" are Jeremiah''s breathless, false molten images that confound their makers.'
  FROM cross_reference_threads t, cross_references x, _session250_en99_lookup sv, _session250_en99_lookup tv
 WHERE t.slug='1-enoch-99-idols-not-according-to-knowledge'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=99 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=10 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 10:15 — *They are vanity, and the work of errors: in the time of their visitation they shall perish.* As Enoch says the idol-worshippers "in an instant shall they perish," Jeremiah says the idols themselves shall perish in the time of visitation.'
  FROM cross_reference_threads t, cross_references x, _session250_en99_lookup sv, _session250_en99_lookup tv
 WHERE t.slug='1-enoch-99-idols-not-according-to-knowledge'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=99 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=10 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Habakkuk 2:19 — *Woe unto him that saith to the wood, Awake; to the dumb stone, Arise, it shall teach! Behold, it is laid over with gold and silver, and there is no breath at all in the midst of it.* Habakkuk''s woe on the breathless gold-and-silver idol matches Enoch''s woe on those who worship stone and grave images of gold and silver and wood.'
  FROM cross_reference_threads t, cross_references x, _session250_en99_lookup sv, _session250_en99_lookup tv
 WHERE t.slug='1-enoch-99-idols-not-according-to-knowledge'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=99 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='habakkuk' AND tv.chapter_number=2 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 14:11 — *And the smoke of their torment ascendeth up for ever and ever: and they have no rest day nor night, who worship the beast and his image, and whosoever receiveth the mark of his name.* The end-judgement on idol-worship under the beast carries Enoch''s woe forward — the idolaters "shall get no manner of help" and find no rest.'
  FROM cross_reference_threads t, cross_references x, _session250_en99_lookup sv, _session250_en99_lookup tv
 WHERE t.slug='1-enoch-99-idols-not-according-to-knowledge'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=99 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=14 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-99-blessed-who-walk-the-paths
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 30:19 — *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live:* Enoch''s blessing on those who walk the paths of the Most High and "become not godless with the godless" is the Deuteronomic choosing of life over death.'
  FROM cross_reference_threads t, cross_references x, _session250_en99_lookup sv, _session250_en99_lookup tv
 WHERE t.slug='1-enoch-99-blessed-who-walk-the-paths'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=99 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 1:1 — *Blessed is the man that walketh not in the counsel of the ungodly, nor standeth in the way of sinners, nor sitteth in the seat of the scornful.* The Psalter''s two-ways blessing uses Enoch''s own contrast: blessed are they who do not become godless with the godless.'
  FROM cross_reference_threads t, cross_references x, _session250_en99_lookup sv, _session250_en99_lookup tv
 WHERE t.slug='1-enoch-99-blessed-who-walk-the-paths'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=99 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 1:6 — *For Yahuah (LORD) knoweth the way of the righteous: but the way of the ungodly shall perish.* Enoch''s "they shall be saved" against the godless who "in an instant shall perish" is the same divided end of the two ways.'
  FROM cross_reference_threads t, cross_references x, _session250_en99_lookup sv, _session250_en99_lookup tv
 WHERE t.slug='1-enoch-99-blessed-who-walk-the-paths'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=99 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-99-woe-oppressors-false-measures
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Amos 8:5 — *Saying, When will the new moon be gone, that we may sell corn? and the sabbath, that we may set forth wheat, making the ephah small, and the shekel great, and falsifying the balances by deceit?* Enoch''s "deceitful and false measures" are Amos''s small ephah and great shekel — the falsified balance against the poor.'
  FROM cross_reference_threads t, cross_references x, _session250_en99_lookup sv, _session250_en99_lookup tv
 WHERE t.slug='1-enoch-99-woe-oppressors-false-measures'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=99 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=8 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'James 5:4 — *Behold, the hire of the labourers who have reaped down your fields, which is of you kept back by fraud, crieth: and the cries of them which have reaped are entered into the ears of Yahuah (Lord) of sabaoth.* Enoch''s woe on houses built through "the grievous toil of others" is James''s woe on the rich who withheld the laborer''s hire.'
  FROM cross_reference_threads t, cross_references x, _session250_en99_lookup sv, _session250_en99_lookup tv
 WHERE t.slug='1-enoch-99-woe-oppressors-false-measures'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=99 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=5 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'James 5:6 — *Ye have condemned and killed the just; and he doth not resist you.* As Enoch''s woe falls on those who "slay their neighbours until the day of the great judgement," James names the rich who have condemned and killed the just.'
  FROM cross_reference_threads t, cross_references x, _session250_en99_lookup sv, _session250_en99_lookup tv
 WHERE t.slug='1-enoch-99-woe-oppressors-false-measures'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=99 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=5 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ecclesiasticus 34:22 — *He that takes away his neighbour''s living slayeth him; and he that defraudeth the labourer of his hire is a bloodshedder.* Ben Sira makes Enoch''s own equation: building on others'' toil and slaying neighbours are the same crime of bloodshed.'
  FROM cross_reference_threads t, cross_references x, _session250_en99_lookup sv, _session250_en99_lookup tv
 WHERE t.slug='1-enoch-99-woe-oppressors-false-measures'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=99 AND sv.verse_number=15
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=34 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-99-prayers-memorial-before-the-most-high
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 8:3 — *And another angel came and stood at the altar, having a golden censer; and there was given unto him much incense, that he should offer it with the prayers of all saints upon the golden altar which was before the throne.* Enoch''s prayers raised "as a memorial... before the angels" are John''s saints'' prayers offered by the angel before the throne.'
  FROM cross_reference_threads t, cross_references x, _session250_en99_lookup sv, _session250_en99_lookup tv
 WHERE t.slug='1-enoch-99-prayers-memorial-before-the-most-high'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=99 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=8 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 8:4 — *And the smoke of the incense, which came with the prayers of the saints, ascended up before Elohim (God) out of the angel''s hand.* The prayers ascending before Elohim are Enoch''s testimony placed "for a memorial before the Most High."'
  FROM cross_reference_threads t, cross_references x, _session250_en99_lookup sv, _session250_en99_lookup tv
 WHERE t.slug='1-enoch-99-prayers-memorial-before-the-most-high'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=99 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=8 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Wisdom of Solomon 3:7 — *And in the time of their visitation they shall shine, and run to and fro like sparks among the stubble.* The day Enoch''s righteous prepare for is the day of visitation when the righteous dead are vindicated and shine.'
  FROM cross_reference_threads t, cross_references x, _session250_en99_lookup sv, _session250_en99_lookup tv
 WHERE t.slug='1-enoch-99-prayers-memorial-before-the-most-high'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=99 AND sv.verse_number=3
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=3 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Wisdom of Solomon 3:10 — *But the ungodly shall be punished according to their own imaginations, which have neglected the righteous, and forsaken Yahuah (God).* As Enoch stores the sin of the sinners for a memorial of judgement, Wisdom says the ungodly are punished for neglecting the righteous and forsaking Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session250_en99_lookup sv, _session250_en99_lookup tv
 WHERE t.slug='1-enoch-99-prayers-memorial-before-the-most-high'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=99 AND sv.verse_number=3
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=3 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

