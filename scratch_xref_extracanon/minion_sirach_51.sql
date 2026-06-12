-- ----- fragment: minion_ecclesiasticus_51.sql (session253 ecclesiasticus 51) -----
-- Source anchor: apocrypha/ecclesiasticus ch51. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: sir51 (view _session253_sir51_lookup). Sort band base 59550, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_sir51_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: sirach-51-delivered-from-death
  ('apocrypha', 'ecclesiasticus', 51, 6, 'canon', 'psalms', 18, 5, 'free', E'Psalm 18:5 — *The sorrows of hell compassed me about: the snares of death prevented me.* The snare of the slandering tongue that drew Ben Sira''s soul near to death is David''s same snare of death encompassing him.'),
  ('apocrypha', 'ecclesiasticus', 51, 6, 'canon', 'psalms', 18, 6, 'free', E'Psalm 18:6 — *In my distress I called upon Yahuah (LORD), and cried unto my Elohim (God): he heard my voice out of his temple, and my cry came before him, even into his ears.* As Ben Sira''s life drew near to the hell beneath, the righteous one''s cry rises to Yahuah''s temple and is heard.'),
  ('apocrypha', 'ecclesiasticus', 51, 6, 'canon', 'psalms', 116, 3, 'free', E'Psalm 116:3 — *The sorrows of death compassed me, and the pains of hell gat hold upon me: I found trouble and sorrow.* The very nearness to death that Ben Sira describes is sung word-for-thought in the deliverance psalm.'),
  ('apocrypha', 'ecclesiasticus', 51, 2, 'canon', 'psalms', 34, 6, 'free', E'Psalm 34:6 — *This poor man cried, and Yahuah (LORD) heard him, and saved him out of all his troubles.* Ben Sira''s defender and helper who preserved his body is the same Yahuah who hears the poor man''s cry and saves him from every trouble.'),
  -- thread: sirach-51-thou-savest-them-that-wait
  ('apocrypha', 'ecclesiasticus', 51, 8, 'canon', 'psalms', 34, 19, 'free', E'Psalm 34:19 — *Many are the afflictions of the righteous: but Yahuah (LORD) delivereth him out of them all.* Ben Sira''s recollection that Yahuah delivers such as wait for him out of the hands of the enemies is this psalm''s plain promise to the righteous.'),
  ('apocrypha', 'ecclesiasticus', 51, 9, 'canon', 'psalms', 34, 17, 'free', E'Psalm 34:17 — *The righteous cry, and Yahuah (LORD) heareth, and delivereth them out of all their troubles.* Ben Sira lifting his supplications from the earth and praying for deliverance from death is exactly the cry that Yahuah hears.'),
  ('apocrypha', 'ecclesiasticus', 51, 11, 'canon', 'psalms', 116, 17, 'free', E'Psalm 116:17 — *I will offer to thee the sacrifice of thanksgiving, and will call upon the name of Yahuah (LORD).* The thanksgiving and singing of praise that answers the heard prayer is David''s same sacrifice of thanksgiving for deliverance.'),
  ('apocrypha', 'ecclesiasticus', 51, 11, 'canon', 'psalms', 116, 7, 'free', E'Psalm 116:7 — *Return unto thy rest, O my soul; for Yahuah (LORD) hath dealt bountifully with thee.* As Ben Sira''s heard prayer turns to continual praise, the rescued soul of the psalm is called back to its rest in Yahuah''s bounty.'),
  -- thread: sirach-51-i-sought-wisdom-from-my-youth
  ('apocrypha', 'ecclesiasticus', 51, 15, 'canon', 'proverbs', 8, 17, 'free', E'Proverbs 8:17 — *I love them that love me; and those that seek me early shall find me.* Ben Sira seeking wisdom from his youth up, from the flower till the grape was ripe, is the early seeker whom Wisdom promises to be found by.'),
  ('apocrypha', 'ecclesiasticus', 51, 14, 'canon', 'proverbs', 2, 4, 'free', E'Proverbs 2:4 — *If thou seekest her as silver, and searchest for her as for hid treasures.* Praying for wisdom before the temple and seeking her out even to the end is the searching for hid treasure that Solomon commands.'),
  ('apocrypha', 'ecclesiasticus', 51, 17, 'canon', 'proverbs', 2, 6, 'free', E'Proverbs 2:6 — *For Yahuah (LORD) giveth wisdom: out of his mouth cometh knowledge and understanding.* Ben Sira ascribing glory to him that gives him wisdom names Yahuah as the giver, just as Solomon does.'),
  ('apocrypha', 'ecclesiasticus', 51, 13, 'apocrypha', 'the-wisdom-of-solomon', 7, 7, 'extras', E'Wisdom of Solomon 7:7 — *Wherefore I prayed, and understanding was given me: I called upon Yahuah (God), and the spirit of wisdom came to me.* Ben Sira desiring wisdom openly in prayer from his youth is the same temple-prayer his apocryphal brother prays — the deuterocanon''s own self-witness.'),
  ('apocrypha', 'ecclesiasticus', 51, 13, 'canon', 'james', 1, 5, 'free', E'James 1:5 — *If any of you lack wisdom, let him ask of Elohim (God), that giveth to all men liberally, and upbraideth not; and it shall be given him.* Ben Sira''s lifelong asking for wisdom in prayer is exactly the asking James promises Elohim answers liberally.'),
  -- thread: sirach-51-buy-her-without-money
  ('apocrypha', 'ecclesiasticus', 51, 23, 'canon', 'proverbs', 8, 1, 'free', E'Proverbs 8:1 — *Doth not wisdom cry? and understanding put forth her voice?* Ben Sira opening his mouth to call the unlearned to the house of learning is Wisdom herself crying out for hearers.'),
  ('apocrypha', 'ecclesiasticus', 51, 23, 'canon', 'proverbs', 8, 4, 'free', E'Proverbs 8:4 — *Unto you, O men, I call; and my voice is to the sons of man.* The teacher''s summons to draw near and dwell in learning is Wisdom''s universal call to the sons of man.'),
  ('apocrypha', 'ecclesiasticus', 51, 25, 'canon', 'isaiah', 55, 1, 'free', E'Isaiah 55:1 — *Ho, every one that thirsteth, come ye to the waters, and he that hath no money; come ye, buy, and eat; yea, come, buy wine and milk without money and without price.* Ben Sira''s cry to the thirsty soul to buy wisdom without money is Isaiah''s free invitation almost word for word.'),
  ('apocrypha', 'ecclesiasticus', 51, 24, 'canon', 'isaiah', 55, 3, 'free', E'Isaiah 55:3 — *Incline your ear, and come unto me: hear, and your soul shall live; and I will make an everlasting covenant with you, even the sure mercies of David.* To the thirsty souls Ben Sira chides, Isaiah promises that coming and hearing makes the soul live in everlasting covenant.'),
  -- thread: sirach-51-take-the-yoke-find-rest
  ('apocrypha', 'ecclesiasticus', 51, 26, 'canon', 'matthew', 11, 28, 'free', E'Matthew 11:28 — *Come unto me, all ye that labour and are heavy laden, and I will give you rest.* Ben Sira''s *put your neck under the yoke* and *much rest* is the very invitation the Messiah takes up, calling the labouring to come to Him for rest.'),
  ('apocrypha', 'ecclesiasticus', 51, 26, 'canon', 'matthew', 11, 29, 'free', E'Matthew 11:29 — *Take my yoke upon you, and learn of me; for I am meek and lowly in heart: and ye shall find rest unto your souls.* Where Ben Sira says put your neck under the yoke and receive instruction, Yahusha makes the wisdom-yoke His own and gives rest unto the soul.'),
  ('apocrypha', 'ecclesiasticus', 51, 27, 'canon', 'matthew', 11, 30, 'free', E'Matthew 11:30 — *For my yoke is easy, and my burden is light.* Ben Sira''s testimony that the yoke of wisdom brings but little labour and much rest is fulfilled in the Messiah''s easy yoke and light burden.'),
  ('apocrypha', 'ecclesiasticus', 51, 26, 'canon', 'proverbs', 8, 5, 'free', E'Proverbs 8:5 — *O ye simple, understand wisdom: and, ye fools, be ye of an understanding heart.* Ben Sira bidding the unlearned receive instruction under the yoke is Wisdom''s same appeal to the simple to gain an understanding heart.'),
  -- thread: sirach-51-reward-of-the-labourer
  ('apocrypha', 'ecclesiasticus', 51, 30, 'canon', 'matthew', 5, 6, 'free', E'Matthew 5:6 — *Blessed are they which do hunger and thirst after righteousness: for they shall be filled.* The thirsty soul Ben Sira sends to labour for wisdom is the hungering, thirsting one the Messiah promises shall be filled.'),
  ('apocrypha', 'ecclesiasticus', 51, 30, 'canon', 'matthew', 5, 12, 'free', E'Matthew 5:12 — *Rejoice, and be exceeding glad: for great is your reward in heaven: for so persecuted they the prophets which were before you.* Ben Sira''s promise that in his time Yahuah will give the worker his reward is the Sermon''s great reward in heaven for the faithful.'),
  ('apocrypha', 'ecclesiasticus', 51, 29, 'canon', 'proverbs', 8, 35, 'free', E'Proverbs 8:35 — *For whoso findeth me findeth life, and shall obtain favour of Yahuah (LORD).* Ben Sira''s call to rejoice in Yahuah''s mercy and await the reward rests on the truth that whoso finds wisdom finds life and Yahuah''s favour.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_sir51_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_sir51_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-51-delivered-from-death',
       E'Delivered from the snare and the slandering tongue',
       E'Ben Sira opens his closing prayer with thanksgiving: *I will thank you, O Yahuah (God) and King, and praise you, O Yahuah (God) my Saviour: I do give praise to your name* (Sirach 51:1), *For you are my defender and helper, and has preserved my body from destruction, and from the snare of the slanderous tongue, and from the lips that forge lies, and has been my helper against my adversaries* (Sirach 51:2). His soul drew near unto death — *By an accusation to the king from an unrighteous tongue my soul drew near even to death, my life was near to the hell beneath* (Sirach 51:6) — and Yahuah heard him. It ain''t new: this is the song of the delivered righteous. David sang the same — *The sorrows of death compassed me, and the floods of ungodly men made me afraid. The sorrows of hell compassed me about: the snares of death prevented me* (Psalm 18:4-5), *In my distress I called upon Yahuah (LORD), and cried unto my Elohim (God): he heard my voice out of his temple, and my cry came before him, even into his ears* (Psalm 18:6). And again — *The sorrows of death compassed me, and the pains of hell gat hold upon me: I found trouble and sorrow* (Psalm 116:3), *For thou hast delivered my soul from death, mine eyes from tears, and my feet from falling* (Psalm 116:8). The poor man''s cry is always heard: *This poor man cried, and Yahuah (LORD) heard him, and saved him out of all his troubles* (Psalm 34:6).',
       sv.verse_id, ev.verse_id, 'extras', 59550
  FROM _session253_sir51_lookup sv, _session253_sir51_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=51 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=51 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-51-thou-savest-them-that-wait',
       E'Thou deliverest such as wait for thee',
       E'In his extremity Ben Sira remembers Yahuah''s acts of old: *Then thought I upon your mercy, O Yahuah (God), and upon your acts of old, how you deliverest such as wait for you, and savest them out of the hands of the enemies* (Sirach 51:8), *Then lifted I up my supplications from the earth, and prayed for deliverance from death* (Sirach 51:9), and his prayer was heard — *I will praise your name continually, and will sing praises with thanksgiving; and so my prayer was heard* (Sirach 51:11). It ain''t new: Yahuah is nigh to the broken and answers the afflicted. *Many are the afflictions of the righteous: but Yahuah (LORD) delivereth him out of them all* (Psalm 34:19); *The righteous cry, and Yahuah (LORD) heareth, and delivereth them out of all their troubles* (Psalm 34:17). David turned his rescued soul back to rest as Ben Sira turns his to praise: *Return unto thy rest, O my soul; for Yahuah (LORD) hath dealt bountifully with thee* (Psalm 116:7), *I will offer to thee the sacrifice of thanksgiving, and will call upon the name of Yahuah (LORD)* (Psalm 116:17).',
       sv.verse_id, ev.verse_id, 'extras', 59553
  FROM _session253_sir51_lookup sv, _session253_sir51_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=51 AND sv.verse_number=8
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=51 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-51-i-sought-wisdom-from-my-youth',
       E'From my youth I sought her out',
       E'Ben Sira turns from deliverance to the pursuit that filled his life: *When I was yet young, or ever I went abroad, I desired wisdom openly in my prayer* (Sirach 51:13), *I prayed for her before the temple, and will seek her out even to the end* (Sirach 51:14), *Even from the flower till the grape was ripe has my heart delighted in her: my foot went the right way, from my youth up sought I after her* (Sirach 51:15). It ain''t new: Wisdom herself swears she is found by the early seeker — *I love them that love me; and those that seek me early shall find me* (Proverbs 8:17). The seeking is the same labour Solomon laid out: *If thou seekest her as silver, and searchest for her as for hid treasures; Then shalt thou understand the fear of Yahuah (LORD), and find the knowledge of Elohim (God)* (Proverbs 2:4-5), *For Yahuah (LORD) giveth wisdom: out of his mouth cometh knowledge and understanding* (Proverbs 2:6). And his apocryphal brother prayed the very same prayer in the temple: *Wherefore I prayed, and understanding was given me: I called upon Yahuah (God), and the spirit of wisdom came to me* (Wisdom of Solomon 7:7). James seals it: ask, and it is given — *If any of you lack wisdom, let him ask of Elohim (God), that giveth to all men liberally, and upbraideth not; and it shall be given him* (James 1:5).',
       sv.verse_id, ev.verse_id, 'extras', 59556
  FROM _session253_sir51_lookup sv, _session253_sir51_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=51 AND sv.verse_number=13
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=51 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-51-buy-her-without-money',
       E'Draw near, buy her without money',
       E'Now the wisdom-teacher turns to the unlearned and opens his mouth to call: *Draw near to me, you unlearned, and dwell in the house of learning* (Sirach 51:23), *Wherefore are you slow, and what say you to these things, seeing your souls are very thirsty?* (Sirach 51:24), *I opened my mouth, and said, Buy her for yourselves without money* (Sirach 51:25). It ain''t new: this is Wisdom crying in the gates and the prophet''s free invitation. *Doth not wisdom cry? and understanding put forth her voice?* (Proverbs 8:1); *Unto you, O men, I call; and my voice is to the sons of man* (Proverbs 8:4). And Isaiah calls the thirsty to buy without price: *Ho, every one that thirsteth, come ye to the waters, and he that hath no money; come ye, buy, and eat; yea, come, buy wine and milk without money and without price* (Isaiah 55:1), *Incline your ear, and come unto me: hear, and your soul shall live; and I will make an everlasting covenant with you, even the sure mercies of David* (Isaiah 55:3). The thirsty soul that buys wisdom without money is the soul Isaiah summons to the waters — the wisdom-call and the Logos-call are one voice.',
       sv.verse_id, ev.verse_id, 'extras', 59559
  FROM _session253_sir51_lookup sv, _session253_sir51_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=51 AND sv.verse_number=23
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=51 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-51-take-the-yoke-find-rest',
       E'Put your neck under the yoke and find rest',
       E'Here is the crown of the whole book — the wisdom-teacher''s invitation that the Messiah Himself will take up on His own lips: *Put your neck under the yoke, and let your soul receive instruction: she is hard at hand to find* (Sirach 51:26), *Behold with your eyes, how that I have but little labour, and have gotten to me much rest* (Sirach 51:27). It ain''t new: the yoke and the rest are already here, centuries before the Sermon. When the Messiah opens His mouth He answers Wisdom''s call as her fulfilment — *Come unto me, all ye that labour and are heavy laden, and I will give you rest* (Matthew 11:28), *Take my yoke upon you, and learn of me; for I am meek and lowly in heart: and ye shall find rest unto your souls* (Matthew 11:29), *For my yoke is easy, and my burden is light* (Matthew 11:30). Where Ben Sira says *put your neck under the yoke... I have but little labour, and have gotten to me much rest*, Yahusha says *take my yoke upon you... ye shall find rest unto your souls* — the wisdom that called in Sirach is the Wisdom of Elohim made flesh, the Logos calling the heavy-laden home. And the call to draw near and learn is Solomon''s same plea: *O ye simple, understand wisdom: and, ye fools, be ye of an understanding heart* (Proverbs 8:5).',
       sv.verse_id, ev.verse_id, 'extras', 59562
  FROM _session253_sir51_lookup sv, _session253_sir51_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=51 AND sv.verse_number=26
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=51 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-51-reward-of-the-labourer',
       E'In his time he will give you your reward',
       E'Ben Sira closes the book with the labourer''s reward: *Let your soul rejoice in his mercy, and be not ashamed of his praise* (Sirach 51:29), *Work your work betimes, and in his time he will give you your reward* (Sirach 51:30). It ain''t new: the one who hungers and thirsts after this wisdom-righteousness shall be filled. *Blessed are they which do hunger and thirst after righteousness: for they shall be filled* (Matthew 5:6) — the thirsty souls of verse 24 are the ones the Messiah promises to satisfy. And the reward of the faithful labourer is the heavenly reward of the Sermon: *Rejoice, and be exceeding glad: for great is your reward in heaven: for so persecuted they the prophets which were before you* (Matthew 5:12). Whoso finds this wisdom finds life — *For whoso findeth me findeth life, and shall obtain favour of Yahuah (LORD)* (Proverbs 8:35) — the workman who labours betimes is worthy of his reward in Yahuah''s own time.',
       sv.verse_id, ev.verse_id, 'extras', 59565
  FROM _session253_sir51_lookup sv, _session253_sir51_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=51 AND sv.verse_number=28
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=51 AND ev.verse_number=30
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: sirach-51-delivered-from-death
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 18:5 — *The sorrows of hell compassed me about: the snares of death prevented me.* The snare of the slandering tongue that drew Ben Sira''s soul near to death is David''s same snare of death encompassing him.'
  FROM cross_reference_threads t, cross_references x, _session253_sir51_lookup sv, _session253_sir51_lookup tv
 WHERE t.slug='sirach-51-delivered-from-death'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=51 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=18 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 18:6 — *In my distress I called upon Yahuah (LORD), and cried unto my Elohim (God): he heard my voice out of his temple, and my cry came before him, even into his ears.* As Ben Sira''s life drew near to the hell beneath, the righteous one''s cry rises to Yahuah''s temple and is heard.'
  FROM cross_reference_threads t, cross_references x, _session253_sir51_lookup sv, _session253_sir51_lookup tv
 WHERE t.slug='sirach-51-delivered-from-death'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=51 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=18 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 116:3 — *The sorrows of death compassed me, and the pains of hell gat hold upon me: I found trouble and sorrow.* The very nearness to death that Ben Sira describes is sung word-for-thought in the deliverance psalm.'
  FROM cross_reference_threads t, cross_references x, _session253_sir51_lookup sv, _session253_sir51_lookup tv
 WHERE t.slug='sirach-51-delivered-from-death'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=51 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=116 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 34:6 — *This poor man cried, and Yahuah (LORD) heard him, and saved him out of all his troubles.* Ben Sira''s defender and helper who preserved his body is the same Yahuah who hears the poor man''s cry and saves him from every trouble.'
  FROM cross_reference_threads t, cross_references x, _session253_sir51_lookup sv, _session253_sir51_lookup tv
 WHERE t.slug='sirach-51-delivered-from-death'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=51 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=34 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-51-thou-savest-them-that-wait
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 34:19 — *Many are the afflictions of the righteous: but Yahuah (LORD) delivereth him out of them all.* Ben Sira''s recollection that Yahuah delivers such as wait for him out of the hands of the enemies is this psalm''s plain promise to the righteous.'
  FROM cross_reference_threads t, cross_references x, _session253_sir51_lookup sv, _session253_sir51_lookup tv
 WHERE t.slug='sirach-51-thou-savest-them-that-wait'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=51 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=34 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 34:17 — *The righteous cry, and Yahuah (LORD) heareth, and delivereth them out of all their troubles.* Ben Sira lifting his supplications from the earth and praying for deliverance from death is exactly the cry that Yahuah hears.'
  FROM cross_reference_threads t, cross_references x, _session253_sir51_lookup sv, _session253_sir51_lookup tv
 WHERE t.slug='sirach-51-thou-savest-them-that-wait'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=51 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=34 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 116:17 — *I will offer to thee the sacrifice of thanksgiving, and will call upon the name of Yahuah (LORD).* The thanksgiving and singing of praise that answers the heard prayer is David''s same sacrifice of thanksgiving for deliverance.'
  FROM cross_reference_threads t, cross_references x, _session253_sir51_lookup sv, _session253_sir51_lookup tv
 WHERE t.slug='sirach-51-thou-savest-them-that-wait'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=51 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=116 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 116:7 — *Return unto thy rest, O my soul; for Yahuah (LORD) hath dealt bountifully with thee.* As Ben Sira''s heard prayer turns to continual praise, the rescued soul of the psalm is called back to its rest in Yahuah''s bounty.'
  FROM cross_reference_threads t, cross_references x, _session253_sir51_lookup sv, _session253_sir51_lookup tv
 WHERE t.slug='sirach-51-thou-savest-them-that-wait'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=51 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=116 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-51-i-sought-wisdom-from-my-youth
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 8:17 — *I love them that love me; and those that seek me early shall find me.* Ben Sira seeking wisdom from his youth up, from the flower till the grape was ripe, is the early seeker whom Wisdom promises to be found by.'
  FROM cross_reference_threads t, cross_references x, _session253_sir51_lookup sv, _session253_sir51_lookup tv
 WHERE t.slug='sirach-51-i-sought-wisdom-from-my-youth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=51 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=8 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 2:4 — *If thou seekest her as silver, and searchest for her as for hid treasures.* Praying for wisdom before the temple and seeking her out even to the end is the searching for hid treasure that Solomon commands.'
  FROM cross_reference_threads t, cross_references x, _session253_sir51_lookup sv, _session253_sir51_lookup tv
 WHERE t.slug='sirach-51-i-sought-wisdom-from-my-youth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=51 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 2:6 — *For Yahuah (LORD) giveth wisdom: out of his mouth cometh knowledge and understanding.* Ben Sira ascribing glory to him that gives him wisdom names Yahuah as the giver, just as Solomon does.'
  FROM cross_reference_threads t, cross_references x, _session253_sir51_lookup sv, _session253_sir51_lookup tv
 WHERE t.slug='sirach-51-i-sought-wisdom-from-my-youth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=51 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=2 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Wisdom of Solomon 7:7 — *Wherefore I prayed, and understanding was given me: I called upon Yahuah (God), and the spirit of wisdom came to me.* Ben Sira desiring wisdom openly in prayer from his youth is the same temple-prayer his apocryphal brother prays — the deuterocanon''s own self-witness.'
  FROM cross_reference_threads t, cross_references x, _session253_sir51_lookup sv, _session253_sir51_lookup tv
 WHERE t.slug='sirach-51-i-sought-wisdom-from-my-youth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=51 AND sv.verse_number=13
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=7 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'James 1:5 — *If any of you lack wisdom, let him ask of Elohim (God), that giveth to all men liberally, and upbraideth not; and it shall be given him.* Ben Sira''s lifelong asking for wisdom in prayer is exactly the asking James promises Elohim answers liberally.'
  FROM cross_reference_threads t, cross_references x, _session253_sir51_lookup sv, _session253_sir51_lookup tv
 WHERE t.slug='sirach-51-i-sought-wisdom-from-my-youth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=51 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-51-buy-her-without-money
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 8:1 — *Doth not wisdom cry? and understanding put forth her voice?* Ben Sira opening his mouth to call the unlearned to the house of learning is Wisdom herself crying out for hearers.'
  FROM cross_reference_threads t, cross_references x, _session253_sir51_lookup sv, _session253_sir51_lookup tv
 WHERE t.slug='sirach-51-buy-her-without-money'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=51 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=8 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 8:4 — *Unto you, O men, I call; and my voice is to the sons of man.* The teacher''s summons to draw near and dwell in learning is Wisdom''s universal call to the sons of man.'
  FROM cross_reference_threads t, cross_references x, _session253_sir51_lookup sv, _session253_sir51_lookup tv
 WHERE t.slug='sirach-51-buy-her-without-money'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=51 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=8 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 55:1 — *Ho, every one that thirsteth, come ye to the waters, and he that hath no money; come ye, buy, and eat; yea, come, buy wine and milk without money and without price.* Ben Sira''s cry to the thirsty soul to buy wisdom without money is Isaiah''s free invitation almost word for word.'
  FROM cross_reference_threads t, cross_references x, _session253_sir51_lookup sv, _session253_sir51_lookup tv
 WHERE t.slug='sirach-51-buy-her-without-money'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=51 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=55 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 55:3 — *Incline your ear, and come unto me: hear, and your soul shall live; and I will make an everlasting covenant with you, even the sure mercies of David.* To the thirsty souls Ben Sira chides, Isaiah promises that coming and hearing makes the soul live in everlasting covenant.'
  FROM cross_reference_threads t, cross_references x, _session253_sir51_lookup sv, _session253_sir51_lookup tv
 WHERE t.slug='sirach-51-buy-her-without-money'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=51 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=55 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-51-take-the-yoke-find-rest
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 11:28 — *Come unto me, all ye that labour and are heavy laden, and I will give you rest.* Ben Sira''s *put your neck under the yoke* and *much rest* is the very invitation the Messiah takes up, calling the labouring to come to Him for rest.'
  FROM cross_reference_threads t, cross_references x, _session253_sir51_lookup sv, _session253_sir51_lookup tv
 WHERE t.slug='sirach-51-take-the-yoke-find-rest'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=51 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=11 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 11:29 — *Take my yoke upon you, and learn of me; for I am meek and lowly in heart: and ye shall find rest unto your souls.* Where Ben Sira says put your neck under the yoke and receive instruction, Yahusha makes the wisdom-yoke His own and gives rest unto the soul.'
  FROM cross_reference_threads t, cross_references x, _session253_sir51_lookup sv, _session253_sir51_lookup tv
 WHERE t.slug='sirach-51-take-the-yoke-find-rest'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=51 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=11 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 11:30 — *For my yoke is easy, and my burden is light.* Ben Sira''s testimony that the yoke of wisdom brings but little labour and much rest is fulfilled in the Messiah''s easy yoke and light burden.'
  FROM cross_reference_threads t, cross_references x, _session253_sir51_lookup sv, _session253_sir51_lookup tv
 WHERE t.slug='sirach-51-take-the-yoke-find-rest'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=51 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=11 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Proverbs 8:5 — *O ye simple, understand wisdom: and, ye fools, be ye of an understanding heart.* Ben Sira bidding the unlearned receive instruction under the yoke is Wisdom''s same appeal to the simple to gain an understanding heart.'
  FROM cross_reference_threads t, cross_references x, _session253_sir51_lookup sv, _session253_sir51_lookup tv
 WHERE t.slug='sirach-51-take-the-yoke-find-rest'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=51 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=8 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-51-reward-of-the-labourer
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 5:6 — *Blessed are they which do hunger and thirst after righteousness: for they shall be filled.* The thirsty soul Ben Sira sends to labour for wisdom is the hungering, thirsting one the Messiah promises shall be filled.'
  FROM cross_reference_threads t, cross_references x, _session253_sir51_lookup sv, _session253_sir51_lookup tv
 WHERE t.slug='sirach-51-reward-of-the-labourer'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=51 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 5:12 — *Rejoice, and be exceeding glad: for great is your reward in heaven: for so persecuted they the prophets which were before you.* Ben Sira''s promise that in his time Yahuah will give the worker his reward is the Sermon''s great reward in heaven for the faithful.'
  FROM cross_reference_threads t, cross_references x, _session253_sir51_lookup sv, _session253_sir51_lookup tv
 WHERE t.slug='sirach-51-reward-of-the-labourer'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=51 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 8:35 — *For whoso findeth me findeth life, and shall obtain favour of Yahuah (LORD).* Ben Sira''s call to rejoice in Yahuah''s mercy and await the reward rests on the truth that whoso finds wisdom finds life and Yahuah''s favour.'
  FROM cross_reference_threads t, cross_references x, _session253_sir51_lookup sv, _session253_sir51_lookup tv
 WHERE t.slug='sirach-51-reward-of-the-labourer'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=51 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=8 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

