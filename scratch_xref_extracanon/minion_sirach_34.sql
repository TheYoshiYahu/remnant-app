-- ----- fragment: minion_ecclesiasticus_34.sql (session253 ecclesiasticus 34) -----
-- Source anchor: apocrypha/ecclesiasticus ch34. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: sir34 (view _session253_sir34_lookup). Sort band base 59125, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_sir34_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ecclesiasticus-34-vain-dreams-divination
  ('apocrypha', 'ecclesiasticus', 34, 5, 'canon', 'deuteronomy', 18, 10, 'free', E'Deuteronomy 18:10 — *There shall not be found among you any one that maketh his son or his daughter to pass through the fire, or that useth divination, or an observer of times, or an enchanter, or a witch,* the Torah''s flat ban on the soothsaying Sirach 34:5 calls vain.'),
  ('apocrypha', 'ecclesiasticus', 34, 5, 'canon', 'deuteronomy', 18, 12, 'free', E'Deuteronomy 18:12 — *For all that do these things are an abomination unto Yahuah (LORD): and because of these abominations Yahuah Elohayka (the LORD thy God) doth drive them out from before thee.* the divination Sirach 34:5 dismisses is what Yahuah names abomination.'),
  ('apocrypha', 'ecclesiasticus', 34, 6, 'canon', 'deuteronomy', 13, 3, 'free', E'Deuteronomy 13:3 — *Thou shalt not hearken unto the words of that prophet, or that dreamer of dreams: for Yahuah Elohaychem (the LORD your God) proveth you, to know whether ye love Yahuah Elohaychem (the LORD your God) with all your heart and with all your soul.* the dreamer is the proving Sirach 34:6 warns not to set the heart upon unless sent of the Most High.'),
  ('apocrypha', 'ecclesiasticus', 34, 7, 'canon', 'jeremiah', 23, 25, 'free', E'Jeremiah 23:25 — *I have heard what the prophets said, that prophesy lies in my name, saying, I have dreamed, I have dreamed.* the dreams that *have deceived many* (Sirach 34:7) are Jeremiah''s lying-prophet dreams.'),
  ('apocrypha', 'ecclesiasticus', 34, 7, 'canon', 'jeremiah', 23, 28, 'free', E'Jeremiah 23:28 — *The prophet that hath a dream, let him tell a dream; and he that hath my word, let him speak my word faithfully. What is the chaff to the wheat? saith Yahuah (LORD).* the chaff-and-wheat test sorts the failed dreams of Sirach 34:7 from the faithful word.'),
  -- thread: ecclesiasticus-34-law-perfect-fear-yahuah
  ('apocrypha', 'ecclesiasticus', 34, 13, 'canon', 'proverbs', 3, 5, 'free', E'Proverbs 3:5 — *Trust in Yahuah (LORD) with all thine heart; and lean not unto thine own understanding.* the hope that *saves them* in Sirach 34:13 is the trust that refuses to lean on self.'),
  ('apocrypha', 'ecclesiasticus', 34, 14, 'canon', 'psalms', 34, 7, 'free', E'Psalm 34:7 — *The angel of Yahuah (LORD) encampeth round about them that fear him, and delivereth them.* the fearer who *shall not fear nor be afraid* (Sirach 34:14) is the one the Psalmist''s angel encamps about.'),
  ('apocrypha', 'ecclesiasticus', 34, 15, 'canon', 'psalms', 34, 8, 'free', E'Psalm 34:8 — *O taste and see that Yahuah (LORD) is good: blessed is the man that trusteth in him.* the blessed soul that fears Yahuah in Sirach 34:15 is the man the Psalm calls blessed for trusting.'),
  -- thread: ecclesiasticus-34-rejected-sacrifice-injustice
  ('apocrypha', 'ecclesiasticus', 34, 18, 'canon', 'proverbs', 21, 27, 'free', E'Proverbs 21:27 — *The sacrifice of the wicked is abomination: how much more, when he bringeth it with a wicked mind?* the *ridiculous* offering of the wrongdoer in Sirach 34:18 is Proverbs'' abomination.'),
  ('apocrypha', 'ecclesiasticus', 34, 18, 'canon', 'proverbs', 15, 8, 'free', E'Proverbs 15:8 — *The sacrifice of the wicked is an abomination to Yahuah (LORD): but the prayer of the upright is his delight.* the unaccepted gift of unjust men in Sirach 34:18 is set against the upright prayer Yahuah delights in.'),
  ('apocrypha', 'ecclesiasticus', 34, 19, 'canon', 'isaiah', 1, 11, 'free', E'Isaiah 1:11 — *To what purpose is the multitude of your sacrifices unto me? saith Yahuah (LORD): I am full of the burnt offerings of rams, and the fat of fed beasts; and I delight not in the blood of bullocks, or of lambs, or of he goats.* the *multitude of sacrifices* that cannot pacify in Sirach 34:19 is Isaiah''s wearisome multitude.'),
  ('apocrypha', 'ecclesiasticus', 34, 19, 'canon', 'amos', 5, 21, 'free', E'Amos 5:21 — *I hate, I despise your feast days, and I will not smell in your solemn assemblies.* Yahuah''s displeasure with the offerings of the wicked in Sirach 34:19 is Amos'' hatred of feasts divorced from justice.'),
  ('apocrypha', 'ecclesiasticus', 34, 19, 'apocrypha', 'ecclesiasticus', 35, 12, 'extras', E'Ecclesiasticus 35:12 — *Do not think to corrupt with gifts; for such he will not receive: and trust not to unrighteous sacrifices; for Yahuah (God) is judge, and with him is no respect of persons.* Ben Sira''s own next chapter restates Sirach 34:19 — the unrighteous sacrifice Yahuah will not receive.'),
  -- thread: ecclesiasticus-34-living-of-the-poor-bloodshed
  ('apocrypha', 'ecclesiasticus', 34, 22, 'canon', 'james', 5, 4, 'free', E'James 5:4 — *Behold, the hire of the labourers who have reaped down your fields, which is of you kept back by fraud, crieth: and the cries of them which have reaped are entered into the ears of Yahuah (Lord) of sabaoth.* the labourer defrauded of his hire whom Sirach 34:22 calls a bloodshed-victim is James'' crying wage.'),
  ('apocrypha', 'ecclesiasticus', 34, 22, 'canon', 'deuteronomy', 24, 15, 'free', E'Deuteronomy 24:15 — *At his day thou shalt give him his hire, neither shall the sun go down upon it; for he is poor, and setteth his heart upon it: lest he cry against thee unto Yahuah (LORD), and it be sin unto thee.* the Torah''s same-day wage answers Sirach 34:22''s defrauded labourer.'),
  ('apocrypha', 'ecclesiasticus', 34, 21, 'canon', 'deuteronomy', 24, 14, 'free', E'Deuteronomy 24:14 — *Thou shalt not oppress an hired servant that is poor and needy, whether he be of thy brethren, or of thy strangers that are in thy land within thy gates:* the bread of the needy that is their life in Sirach 34:21 is what Torah forbids oppressing.'),
  ('apocrypha', 'ecclesiasticus', 34, 20, 'canon', 'proverbs', 28, 8, 'free', E'Proverbs 28:8 — *He that by usury and unjust gain increaseth his substance, he shall gather it for him that will pity the poor.* the offering from *the goods of the poor* in Sirach 34:20 is Proverbs'' unjust gain that only stores up for the merciful.'),
  -- thread: ecclesiasticus-34-prayer-hindered-by-blood
  ('apocrypha', 'ecclesiasticus', 34, 26, 'canon', 'proverbs', 28, 9, 'free', E'Proverbs 28:9 — *He that turneth away his ear from hearing the law, even his prayer shall be abomination.* the unheard prayer of the relapsing faster in Sirach 34:26 is the abomination-prayer of him who shuts his ear to the law.'),
  ('apocrypha', 'ecclesiasticus', 34, 24, 'canon', 'isaiah', 1, 15, 'free', E'Isaiah 1:15 — *And when ye spread forth your hands, I will hide mine eyes from you: yea, when ye make many prayers, I will not hear: your hands are full of blood.* the question of whose voice Yahuah will hear in Sirach 34:24 is answered by Isaiah''s hidden eyes over blood-stained hands.'),
  ('apocrypha', 'ecclesiasticus', 34, 26, 'canon', 'isaiah', 1, 16, 'free', E'Isaiah 1:16 — *Wash you, make you clean; put away the evil of your doings from before mine eyes; cease to do evil;* the futile washing of the man who touches the dead again in Sirach 34:25-26 is mended only by Isaiah''s true cleansing — ceasing to do evil.'),
  ('apocrypha', 'ecclesiasticus', 34, 24, 'canon', 'proverbs', 15, 8, 'free', E'Proverbs 15:8 — *The sacrifice of the wicked is an abomination to Yahuah (LORD): but the prayer of the upright is his delight.* against the unheard curser of Sirach 34:24 stands the upright prayer that is Yahuah''s delight.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_sir34_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_sir34_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-34-vain-dreams-divination',
       E'Vain dreams and forbidden divination',
       E'Ben Sira opens with a sober word on the imagination: *The hopes of a man void of understanding are vain and false: and dreams lift up fools* (Ecclesiasticus 34:1), and *Whoso regardeth dreams is like him that catches at a shadow, and followeth after the wind* (Ecclesiasticus 34:2). *Divinations, and soothsayings, and dreams, are vain* (Ecclesiasticus 34:5) — except as Yahuah Himself sends them: *If they be not sent from the Most High in your visitation, set not your heart upon them* (Ecclesiasticus 34:6). It ain''t new. The Torah forbids the diviner outright: *There shall not be found among you any one that maketh his son or his daughter to pass through the fire, or that useth divination, or an observer of times, or an enchanter, or a witch* (Deuteronomy 18:10), *For all that do these things are an abomination unto Yahuah* (Deuteronomy 18:12). And the dreamer who turns the heart away is to be refused, for *Yahuah Elohaychem (the LORD your God) proveth you, to know whether ye love Yahuah Elohaychem* (Deuteronomy 13:3). The lying prophets dream their own deceit: *I have heard what the prophets said, that prophesy lies in my name, saying, I have dreamed, I have dreamed* (Jeremiah 23:25) — yet *The prophet that hath a dream, let him tell a dream; and he that hath my word, let him speak my word faithfully* (Jeremiah 23:28). The chaff is not the wheat.',
       sv.verse_id, ev.verse_id, 'extras', 59125
  FROM _session253_sir34_lookup sv, _session253_sir34_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=34 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=34 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-34-law-perfect-fear-yahuah',
       E'The law perfect, the fear of Yahuah',
       E'Against the shadow-chasing of dreams, Ben Sira sets the steady ground: *The law shall be found perfect without lies: and wisdom is perfection to a faithful mouth* (Ecclesiasticus 34:8). Then he turns to the fear of Yahuah as the soul''s anchor — *The spirit of those that fear Yahuah (God) shall live; for their hope is in him that saves them* (Ecclesiasticus 34:13), and *Whoso fears Yahuah (God) shall not fear nor be afraid; for he is his hope* (Ecclesiasticus 34:14). It ain''t new. The Tanakh says the same: *Trust in Yahuah (LORD) with all thine heart; and lean not unto thine own understanding* (Proverbs 3:5) — the very leaning-on-self that vain dreams flatter. And the fear of Yahuah is hedged about with His care: *The angel of Yahuah (LORD) encampeth round about them that fear him, and delivereth them* (Psalm 34:7), *O taste and see that Yahuah (LORD) is good: blessed is the man that trusteth in him* (Psalm 34:8). The hope that *saves* in Sirach is the hope that delivers in the Psalter.',
       sv.verse_id, ev.verse_id, 'extras', 59128
  FROM _session253_sir34_lookup sv, _session253_sir34_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=34 AND sv.verse_number=8
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=34 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-34-rejected-sacrifice-injustice',
       E'The rejected sacrifice of injustice',
       E'Here is the chapter''s burning center: *He that sacrificeth of a thing wrongfully gotten, his offering is ridiculous; and the gifts of unjust men are not accepted* (Ecclesiasticus 34:18), and *The most High is not pleased with the offerings of the wicked; neither is he pacified for sin by the multitude of sacrifices* (Ecclesiasticus 34:19). It ain''t new — this is the prophets'' whole quarrel with hollow worship. *The sacrifice of the wicked is abomination: how much more, when he bringeth it with a wicked mind?* (Proverbs 21:27); *The sacrifice of the wicked is an abomination to Yahuah (LORD): but the prayer of the upright is his delight* (Proverbs 15:8). Isaiah hears Yahuah weary of the offerings: *To what purpose is the multitude of your sacrifices unto me? saith Yahuah (LORD): I am full of the burnt offerings of rams* (Isaiah 1:11). Amos thunders: *I hate, I despise your feast days, and I will not smell in your solemn assemblies* (Amos 5:21), *Though ye offer me burnt offerings and your meat offerings, I will not accept them* (Amos 5:22). And Sirach''s own next chapter seals it: *Do not think to corrupt with gifts; for such he will not receive: and trust not to unrighteous sacrifices; for Yahuah (God) is judge* (Ecclesiasticus 35:12).',
       sv.verse_id, ev.verse_id, 'extras', 59131
  FROM _session253_sir34_lookup sv, _session253_sir34_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=34 AND sv.verse_number=18
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=34 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-34-living-of-the-poor-bloodshed',
       E'To take a man''s living is to slay him',
       E'Ben Sira presses the injustice to its root — robbing the poor of bread is murder: *Whoso brings an offering of the goods of the poor doeth as one that killeth the son before his father''s eyes* (Ecclesiasticus 34:20); *The bread of the needy is their life: he that defraudeth him thereof is a man of blood* (Ecclesiasticus 34:21); *He that takes away his neighbour''s living slayeth him; and he that defraudeth the labourer of his hire is a bloodshedder* (Ecclesiasticus 34:22). It ain''t new. The Torah commands the wage be paid at sundown: *Thou shalt not oppress an hired servant that is poor and needy* (Deuteronomy 24:14), *At his day thou shalt give him his hire, neither shall the sun go down upon it; for he is poor* (Deuteronomy 24:15). And James, in pure Sirach idiom, makes the withheld wage cry out to heaven: *Behold, the hire of the labourers who have reaped down your fields, which is of you kept back by fraud, crieth: and the cries of them which have reaped are entered into the ears of Yahuah (Lord) of sabaoth* (James 5:4). The unjust gain only gathers wrath: *He that by usury and unjust gain increaseth his substance, he shall gather it for him that will pity the poor* (Proverbs 28:8).',
       sv.verse_id, ev.verse_id, 'extras', 59134
  FROM _session253_sir34_lookup sv, _session253_sir34_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=34 AND sv.verse_number=20
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=34 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-34-prayer-hindered-by-blood',
       E'Prayer hindered, fasting profitless',
       E'Ben Sira closes with the futility of worship that turns again to sin: *When one prayeth, and another curses, whose voice will Yahuah (God) hear?* (Ecclesiasticus 34:24); *He that washeth himself after the touching of a dead body, if he touch it again, what availeth his washing?* (Ecclesiasticus 34:25); *So is it with a man that fasteth for his sins, and goes again, and doeth the same: who will hear his prayer? or what does his humbling profit him?* (Ecclesiasticus 34:26). It ain''t new. The prayer of him who spurns the law is itself rejected: *He that turneth away his ear from hearing the law, even his prayer shall be abomination* (Proverbs 28:9). Isaiah saw the same hands lifted in vain: *And when ye spread forth your hands, I will hide mine eyes from you: yea, when ye make many prayers, I will not hear: your hands are full of blood* (Isaiah 1:15) — but the answer is repentance: *Wash you, make you clean; put away the evil of your doings* (Isaiah 1:16). For Yahuah hears the upright: *The sacrifice of the wicked is an abomination to Yahuah (LORD): but the prayer of the upright is his delight* (Proverbs 15:8).',
       sv.verse_id, ev.verse_id, 'extras', 59137
  FROM _session253_sir34_lookup sv, _session253_sir34_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=34 AND sv.verse_number=24
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=34 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ecclesiasticus-34-vain-dreams-divination
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 18:10 — *There shall not be found among you any one that maketh his son or his daughter to pass through the fire, or that useth divination, or an observer of times, or an enchanter, or a witch,* the Torah''s flat ban on the soothsaying Sirach 34:5 calls vain.'
  FROM cross_reference_threads t, cross_references x, _session253_sir34_lookup sv, _session253_sir34_lookup tv
 WHERE t.slug='ecclesiasticus-34-vain-dreams-divination'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=34 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=18 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 18:12 — *For all that do these things are an abomination unto Yahuah (LORD): and because of these abominations Yahuah Elohayka (the LORD thy God) doth drive them out from before thee.* the divination Sirach 34:5 dismisses is what Yahuah names abomination.'
  FROM cross_reference_threads t, cross_references x, _session253_sir34_lookup sv, _session253_sir34_lookup tv
 WHERE t.slug='ecclesiasticus-34-vain-dreams-divination'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=34 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=18 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 13:3 — *Thou shalt not hearken unto the words of that prophet, or that dreamer of dreams: for Yahuah Elohaychem (the LORD your God) proveth you, to know whether ye love Yahuah Elohaychem (the LORD your God) with all your heart and with all your soul.* the dreamer is the proving Sirach 34:6 warns not to set the heart upon unless sent of the Most High.'
  FROM cross_reference_threads t, cross_references x, _session253_sir34_lookup sv, _session253_sir34_lookup tv
 WHERE t.slug='ecclesiasticus-34-vain-dreams-divination'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=34 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=13 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jeremiah 23:25 — *I have heard what the prophets said, that prophesy lies in my name, saying, I have dreamed, I have dreamed.* the dreams that *have deceived many* (Sirach 34:7) are Jeremiah''s lying-prophet dreams.'
  FROM cross_reference_threads t, cross_references x, _session253_sir34_lookup sv, _session253_sir34_lookup tv
 WHERE t.slug='ecclesiasticus-34-vain-dreams-divination'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=34 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=23 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jeremiah 23:28 — *The prophet that hath a dream, let him tell a dream; and he that hath my word, let him speak my word faithfully. What is the chaff to the wheat? saith Yahuah (LORD).* the chaff-and-wheat test sorts the failed dreams of Sirach 34:7 from the faithful word.'
  FROM cross_reference_threads t, cross_references x, _session253_sir34_lookup sv, _session253_sir34_lookup tv
 WHERE t.slug='ecclesiasticus-34-vain-dreams-divination'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=34 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=23 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-34-law-perfect-fear-yahuah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 3:5 — *Trust in Yahuah (LORD) with all thine heart; and lean not unto thine own understanding.* the hope that *saves them* in Sirach 34:13 is the trust that refuses to lean on self.'
  FROM cross_reference_threads t, cross_references x, _session253_sir34_lookup sv, _session253_sir34_lookup tv
 WHERE t.slug='ecclesiasticus-34-law-perfect-fear-yahuah'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=34 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=3 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 34:7 — *The angel of Yahuah (LORD) encampeth round about them that fear him, and delivereth them.* the fearer who *shall not fear nor be afraid* (Sirach 34:14) is the one the Psalmist''s angel encamps about.'
  FROM cross_reference_threads t, cross_references x, _session253_sir34_lookup sv, _session253_sir34_lookup tv
 WHERE t.slug='ecclesiasticus-34-law-perfect-fear-yahuah'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=34 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=34 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 34:8 — *O taste and see that Yahuah (LORD) is good: blessed is the man that trusteth in him.* the blessed soul that fears Yahuah in Sirach 34:15 is the man the Psalm calls blessed for trusting.'
  FROM cross_reference_threads t, cross_references x, _session253_sir34_lookup sv, _session253_sir34_lookup tv
 WHERE t.slug='ecclesiasticus-34-law-perfect-fear-yahuah'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=34 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=34 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-34-rejected-sacrifice-injustice
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 21:27 — *The sacrifice of the wicked is abomination: how much more, when he bringeth it with a wicked mind?* the *ridiculous* offering of the wrongdoer in Sirach 34:18 is Proverbs'' abomination.'
  FROM cross_reference_threads t, cross_references x, _session253_sir34_lookup sv, _session253_sir34_lookup tv
 WHERE t.slug='ecclesiasticus-34-rejected-sacrifice-injustice'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=34 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=21 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 15:8 — *The sacrifice of the wicked is an abomination to Yahuah (LORD): but the prayer of the upright is his delight.* the unaccepted gift of unjust men in Sirach 34:18 is set against the upright prayer Yahuah delights in.'
  FROM cross_reference_threads t, cross_references x, _session253_sir34_lookup sv, _session253_sir34_lookup tv
 WHERE t.slug='ecclesiasticus-34-rejected-sacrifice-injustice'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=34 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=15 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 1:11 — *To what purpose is the multitude of your sacrifices unto me? saith Yahuah (LORD): I am full of the burnt offerings of rams, and the fat of fed beasts; and I delight not in the blood of bullocks, or of lambs, or of he goats.* the *multitude of sacrifices* that cannot pacify in Sirach 34:19 is Isaiah''s wearisome multitude.'
  FROM cross_reference_threads t, cross_references x, _session253_sir34_lookup sv, _session253_sir34_lookup tv
 WHERE t.slug='ecclesiasticus-34-rejected-sacrifice-injustice'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=34 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=1 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Amos 5:21 — *I hate, I despise your feast days, and I will not smell in your solemn assemblies.* Yahuah''s displeasure with the offerings of the wicked in Sirach 34:19 is Amos'' hatred of feasts divorced from justice.'
  FROM cross_reference_threads t, cross_references x, _session253_sir34_lookup sv, _session253_sir34_lookup tv
 WHERE t.slug='ecclesiasticus-34-rejected-sacrifice-injustice'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=34 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=5 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Ecclesiasticus 35:12 — *Do not think to corrupt with gifts; for such he will not receive: and trust not to unrighteous sacrifices; for Yahuah (God) is judge, and with him is no respect of persons.* Ben Sira''s own next chapter restates Sirach 34:19 — the unrighteous sacrifice Yahuah will not receive.'
  FROM cross_reference_threads t, cross_references x, _session253_sir34_lookup sv, _session253_sir34_lookup tv
 WHERE t.slug='ecclesiasticus-34-rejected-sacrifice-injustice'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=34 AND sv.verse_number=19
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=35 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-34-living-of-the-poor-bloodshed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'James 5:4 — *Behold, the hire of the labourers who have reaped down your fields, which is of you kept back by fraud, crieth: and the cries of them which have reaped are entered into the ears of Yahuah (Lord) of sabaoth.* the labourer defrauded of his hire whom Sirach 34:22 calls a bloodshed-victim is James'' crying wage.'
  FROM cross_reference_threads t, cross_references x, _session253_sir34_lookup sv, _session253_sir34_lookup tv
 WHERE t.slug='ecclesiasticus-34-living-of-the-poor-bloodshed'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=34 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=5 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 24:15 — *At his day thou shalt give him his hire, neither shall the sun go down upon it; for he is poor, and setteth his heart upon it: lest he cry against thee unto Yahuah (LORD), and it be sin unto thee.* the Torah''s same-day wage answers Sirach 34:22''s defrauded labourer.'
  FROM cross_reference_threads t, cross_references x, _session253_sir34_lookup sv, _session253_sir34_lookup tv
 WHERE t.slug='ecclesiasticus-34-living-of-the-poor-bloodshed'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=34 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=24 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 24:14 — *Thou shalt not oppress an hired servant that is poor and needy, whether he be of thy brethren, or of thy strangers that are in thy land within thy gates:* the bread of the needy that is their life in Sirach 34:21 is what Torah forbids oppressing.'
  FROM cross_reference_threads t, cross_references x, _session253_sir34_lookup sv, _session253_sir34_lookup tv
 WHERE t.slug='ecclesiasticus-34-living-of-the-poor-bloodshed'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=34 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=24 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Proverbs 28:8 — *He that by usury and unjust gain increaseth his substance, he shall gather it for him that will pity the poor.* the offering from *the goods of the poor* in Sirach 34:20 is Proverbs'' unjust gain that only stores up for the merciful.'
  FROM cross_reference_threads t, cross_references x, _session253_sir34_lookup sv, _session253_sir34_lookup tv
 WHERE t.slug='ecclesiasticus-34-living-of-the-poor-bloodshed'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=34 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=28 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-34-prayer-hindered-by-blood
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 28:9 — *He that turneth away his ear from hearing the law, even his prayer shall be abomination.* the unheard prayer of the relapsing faster in Sirach 34:26 is the abomination-prayer of him who shuts his ear to the law.'
  FROM cross_reference_threads t, cross_references x, _session253_sir34_lookup sv, _session253_sir34_lookup tv
 WHERE t.slug='ecclesiasticus-34-prayer-hindered-by-blood'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=34 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=28 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 1:15 — *And when ye spread forth your hands, I will hide mine eyes from you: yea, when ye make many prayers, I will not hear: your hands are full of blood.* the question of whose voice Yahuah will hear in Sirach 34:24 is answered by Isaiah''s hidden eyes over blood-stained hands.'
  FROM cross_reference_threads t, cross_references x, _session253_sir34_lookup sv, _session253_sir34_lookup tv
 WHERE t.slug='ecclesiasticus-34-prayer-hindered-by-blood'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=34 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=1 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 1:16 — *Wash you, make you clean; put away the evil of your doings from before mine eyes; cease to do evil;* the futile washing of the man who touches the dead again in Sirach 34:25-26 is mended only by Isaiah''s true cleansing — ceasing to do evil.'
  FROM cross_reference_threads t, cross_references x, _session253_sir34_lookup sv, _session253_sir34_lookup tv
 WHERE t.slug='ecclesiasticus-34-prayer-hindered-by-blood'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=34 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=1 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Proverbs 15:8 — *The sacrifice of the wicked is an abomination to Yahuah (LORD): but the prayer of the upright is his delight.* against the unheard curser of Sirach 34:24 stands the upright prayer that is Yahuah''s delight.'
  FROM cross_reference_threads t, cross_references x, _session253_sir34_lookup sv, _session253_sir34_lookup tv
 WHERE t.slug='ecclesiasticus-34-prayer-hindered-by-blood'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=34 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=15 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

