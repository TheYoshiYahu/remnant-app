-- ----- fragment: minion_ecclesiasticus_33.sql (session253 ecclesiasticus 33) -----
-- Source anchor: apocrypha/ecclesiasticus ch33. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: sir33 (view _session253_sir33_lookup). Sort band base 59100, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_sir33_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ecclesiasticus-33-the-faithful-law
  ('apocrypha', 'ecclesiasticus', 33, 3, 'canon', 'psalms', 19, 7, 'free', E'Psalm 19:7 — *The law of Yahuah (LORD) is perfect, converting the soul: the testimony of Yahuah (LORD) is sure, making wise the simple.* The same trust Sirach 33:3 places in the faithful law that stands sure as an oracle.'),
  ('apocrypha', 'ecclesiasticus', 33, 3, 'canon', 'romans', 7, 12, 'free', E'Romans 7:12 — *Wherefore the law is holy, and the commandment holy, and just, and good.* Paul confirms Sirach 33:2-3 that the wise man hates not the law, for the law is holy and faithful.'),
  ('apocrypha', 'ecclesiasticus', 33, 1, 'canon', 'proverbs', 1, 7, 'free', E'Proverbs 1:7 — *The fear of Yahuah (LORD) is the beginning of knowledge: but fools despise wisdom and instruction.* Sirach 33:1 likewise grounds deliverance in the fear of Yahuah, the root of all wisdom.'),
  ('apocrypha', 'ecclesiasticus', 33, 2, 'canon', 'psalms', 119, 165, 'free', E'Psalm 119:165 — *Great peace have they which love thy law: and nothing shall offend them.* The opposite of Sirach 33:2''s hypocrite who is as a ship in a storm — the law-lover rides unoffended.'),
  -- thread: ecclesiasticus-33-seasons-feasts-sabbath
  ('apocrypha', 'ecclesiasticus', 33, 8, 'canon', 'genesis', 1, 14, 'free', E'Genesis 1:14 — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years.* The very distinguishing of seasons and feasts Sirach 33:8 says Yahuah altered, fixed in the lights of creation.'),
  ('apocrypha', 'ecclesiasticus', 33, 9, 'canon', 'exodus', 20, 8, 'free', E'Exodus 20:8 — *Remember the sabbath day, to keep it holy.* The chief of the high days Sirach 33:9 says Yahuah hallowed above the ordinary days.'),
  -- thread: ecclesiasticus-33-the-potter
  ('apocrypha', 'ecclesiasticus', 33, 13, 'canon', 'jeremiah', 18, 6, 'free', E'Jeremiah 18:6 — *O house of Yashar''el (Israel), cannot I do with you as this potter? saith Yahuah (LORD). Behold, as the clay is in the potter’s hand, so are ye in mine hand, O house of Yashar''el (Israel).* The exact figure of Sirach 33:13 — clay in the potter''s hand, fashioned at his pleasure.'),
  ('apocrypha', 'ecclesiasticus', 33, 13, 'canon', 'romans', 9, 20, 'free', E'Romans 9:20 — *Nay but, O man, who art thou that repliest against Elohim (God)? Shall the thing formed say to him that formed it, Why hast thou made me thus?* Paul forbids the vessel to dispute the hand that fashions it, as Sirach 33:13 sets man in the potter''s hand.'),
  ('apocrypha', 'ecclesiasticus', 33, 12, 'canon', 'romans', 9, 21, 'free', E'Romans 9:21 — *Hath not the potter power over the clay, of the same lump to make one vessel unto honour, and another unto dishonour?* The same sovereign sorting of Sirach 33:12 — some blessed and exalted, some brought low.'),
  ('apocrypha', 'ecclesiasticus', 33, 13, 'canon', 'isaiah', 45, 9, 'free', E'Isaiah 45:9 — *Woe unto him that striveth with his Maker! Let the potsherd strive with the potsherds of the earth. Shall the clay say to him that fashioneth it, What makest thou? or thy work, He hath no hands?* The clay that submits in Sirach 33:13 is the clay that must not strive with its Maker.'),
  ('apocrypha', 'ecclesiasticus', 33, 10, 'canon', 'genesis', 2, 7, 'free', E'Genesis 2:7 — *And Yahuah Elohim (the LORD God) formed man of the dust of the ground, and breathed into his nostrils the breath of life; and man became a living soul.* The clay itself — Sirach 33:10 says all men are from the ground, and Adam was created of earth.'),
  ('apocrypha', 'ecclesiasticus', 33, 13, 'apocrypha', 'the-wisdom-of-solomon', 15, 7, 'extras', E'Wisdom of Solomon 15:7 — *For the potter, tempering soft earth, fashioneth every vessel with much labour for our service: yes, of the same clay he makes both the vessels that serve for clean uses, and likewise also all such as serve to the contrary: but what is the use of either sort, the potter himself is the judge.* Sirach''s companion wisdom-book carries the same potter, the same clay, the same sovereign Judge as Sirach 33:13.'),
  -- thread: ecclesiasticus-33-two-and-two
  ('apocrypha', 'ecclesiasticus', 33, 14, 'canon', 'deuteronomy', 30, 15, 'free', E'Deuteronomy 30:15 — *See, I have set before thee this day life and good, and death and evil.* Moses sets before Israel the very pair Sirach 33:14 names — good against evil, life against death.'),
  ('apocrypha', 'ecclesiasticus', 33, 15, 'apocrypha', 'ecclesiasticus', 42, 24, 'extras', E'Ecclesiasticus 42:24 — *All things are double one against another: and he has made nothing imperfect.* Ben Sira''s own later word echoes Sirach 33:15 — two and two, one against another, all by perfect design.'),
  -- thread: ecclesiasticus-33-rule-thy-household
  ('apocrypha', 'ecclesiasticus', 33, 19, 'canon', 'proverbs', 3, 5, 'free', E'Proverbs 3:5 — *Trust in Yahuah (LORD) with all thine heart; and lean not unto thine own understanding.* The wisdom behind Sirach 33:19''s counsel to keep one''s own governance and not surrender it to another.'),
  -- thread: ecclesiasticus-33-servant-as-a-brother
  ('apocrypha', 'ecclesiasticus', 33, 31, 'canon', 'proverbs', 29, 21, 'free', E'Proverbs 29:21 — *He that delicately bringeth up his servant from a child shall have him become his son at the length.* The servant who becomes a son — the very arc of Sirach 33:31''s servant entreated as a brother.'),
  ('apocrypha', 'ecclesiasticus', 33, 28, 'canon', 'proverbs', 13, 24, 'free', E'Proverbs 13:24 — *He that spareth his rod hateth his son: but he that loveth him chasteneth him betimes.* The disciplined correction Sirach 33:28 sets to the idle servant — work and chastening as love, not malice.'),
  ('apocrypha', 'ecclesiasticus', 33, 30, 'apocrypha', 'ecclesiasticus', 7, 21, 'extras', E'Ecclesiasticus 7:21 — *Let your soul love a good servant, and defraud him not of liberty.* Ben Sira''s own command tempers Sirach 33:30 — the bought servant, held as thyself, loved and not defrauded.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_sir33_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_sir33_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-33-the-faithful-law',
       E'The law is faithful — he that fears Yahuah',
       E'Ben Sira opens with the man whose trust is anchored in Torah: *There shall no evil happen to him that fears Yahuah (God); but in temptation even again he will deliver him* (Ecclesiasticus 33:1), and *A man of understanding trusts in the law; and the law is faithful to him, as an oracle* (Ecclesiasticus 33:3). The law is not a curse but an oracle, a perfect testimony — exactly as the Psalmist sang, *The law of Yahuah (LORD) is perfect, converting the soul: the testimony of Yahuah (LORD) is sure, making wise the simple* (Psalm 19:7), and Paul confessed, *Wherefore the law is holy, and the commandment holy, and just, and good* (Romans 7:12). It begins where all wisdom begins, in the fear of Yahuah — *The fear of Yahuah (LORD) is the beginning of knowledge: but fools despise wisdom and instruction* (Proverbs 1:7) — and it ends in unoffended peace: *Great peace have they which love thy law: and nothing shall offend them* (Psalm 119:165). It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 59100
  FROM _session253_sir33_lookup sv, _session253_sir33_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=33 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=33 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-33-seasons-feasts-sabbath',
       E'He altered seasons and feasts — the hallowed day',
       E'Why does one day differ from another when the sun lights them all alike? Ben Sira answers from creation: *By the knowledge of Yahuah (God) they were distinguished: and he altered seasons and feasts* (Ecclesiasticus 33:8); *Some of them has he made high days, and hallowed them, and some of them has he made ordinary days* (Ecclesiasticus 33:9). The set-apart times are no human invention — they were appointed when the lights were hung: *Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years* (Genesis 1:14). And the chief of the hallowed days, the sabbath, was sanctified by command: *Remember the sabbath day, to keep it holy* (Exodus 20:8). The appointed times stand because Yahuah set them apart.',
       sv.verse_id, ev.verse_id, 'extras', 59103
  FROM _session253_sir33_lookup sv, _session253_sir33_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=33 AND sv.verse_number=7
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=33 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-33-the-potter',
       E'As the clay in the potter''s hand — Yahuah''s sovereign hand',
       E'Here is the headline of the chapter — the Maker''s sovereign hand over every man: *As the clay is in the potter''s hand, to fashion it at his pleasure: so man is in the hand of him that made him, to render to them as liketh him best* (Ecclesiasticus 33:13). Men exalted and men brought low, the blessed and the cursed, are all the work of one hand — *Some of them has he blessed and exalted... but some of them has he cursed and brought low* (Ecclesiasticus 33:12) — for *all men are from the ground, and Adam was created of earth* (Ecclesiasticus 33:10). This is the prophets'' own figure. Yahuah said through Jeremiah, *as the clay is in the potter''s hand, so are ye in mine hand, O house of Yashar''el (Israel)* (Jeremiah 18:6); Isaiah warned, *Woe unto him that striveth with his Maker!... Shall the clay say to him that fashioneth it, What makest thou?* (Isaiah 45:9); and Paul gathered them all up — *who art thou that repliest against Elohim (God)? Shall the thing formed say to him that formed it, Why hast thou made me thus?* (Romans 9:20), *Hath not the potter power over the clay* (Romans 9:21). Man himself was formed from that clay: *Yahuah Elohim (the LORD God) formed man of the dust of the ground* (Genesis 2:7). Sirach''s own companion Wisdom presses the same image — *the potter himself is the judge* (Wisdom of Solomon 15:7). It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 59106
  FROM _session253_sir33_lookup sv, _session253_sir33_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=33 AND sv.verse_number=10
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=33 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-33-two-and-two',
       E'Good against evil, life against death — two and two',
       E'The potter''s ordering shows in pairs across all his works: *Good is set against evil, and life against death: so is the godly against the sinner, and the sinner against the godly* (Ecclesiasticus 33:14); *So look upon all the works of the Most High; and there are two and two, one against another* (Ecclesiasticus 33:15). This is Moses setting the covenant choice before the people: *See, I have set before thee this day life and good, and death and evil* (Deuteronomy 30:15) — the very pairing Sirach names. And Ben Sira returns to it himself later in his own book: *All things are double one against another: and he has made nothing imperfect* (Ecclesiasticus 42:24). Nothing in creation is a blunder; every opposite is held in the Maker''s balanced design.',
       sv.verse_id, ev.verse_id, 'extras', 59109
  FROM _session253_sir33_lookup sv, _session253_sir33_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=33 AND sv.verse_number=14
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=33 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-33-rule-thy-household',
       E'Keep the preeminence — rule thy own house',
       E'From the Maker''s hand over all men, Ben Sira turns to the ordering of the household. The wise man keeps the rule of his own house and does not abdicate it: *Give not your son and wife, your brother and friend, power over you while you livest, and give not your goods to another* (Ecclesiasticus 33:19); *In all your works keep to thyself the preeminence; leave not a stain in yours honour* (Ecclesiasticus 33:22); and only *At the time when you shall end your days, and finish your life, distribute your inheritance* (Ecclesiasticus 33:23). The same prudence runs through Proverbs — *Trust in Yahuah (LORD) with all thine heart; and lean not unto thine own understanding* (Proverbs 3:5) — the household kept in order under the fear of Yahuah, governance not surrendered before its time.',
       sv.verse_id, ev.verse_id, 'extras', 59112
  FROM _session253_sir33_lookup sv, _session253_sir33_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=33 AND sv.verse_number=19
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=33 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-33-servant-as-a-brother',
       E'Entreat thy servant as a brother',
       E'The chapter closes on the servant, and Ben Sira''s harder counsel about labour turns at the end to mercy: *If you have a servant, let him be to you as thyself, because you have bought him with a price* (Ecclesiasticus 33:30); *If you have a servant, entreat him as a brother: for you have need of him, as of your own soul* (Ecclesiasticus 33:31). The bought servant becomes a brother — the same arc Proverbs traces: *He that delicately bringeth up his servant from a child shall have him become his son at the length* (Proverbs 29:21). Discipline is real — *He that spareth his rod hateth his son: but he that loveth him chasteneth him betimes* (Proverbs 13:24) — yet never cruelty, for Ben Sira himself elsewhere commands, *Let your soul love a good servant, and defraud him not of liberty* (Ecclesiasticus 7:21). Bought with a price, held as a brother.',
       sv.verse_id, ev.verse_id, 'extras', 59115
  FROM _session253_sir33_lookup sv, _session253_sir33_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=33 AND sv.verse_number=30
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=33 AND ev.verse_number=31
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ecclesiasticus-33-the-faithful-law
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 19:7 — *The law of Yahuah (LORD) is perfect, converting the soul: the testimony of Yahuah (LORD) is sure, making wise the simple.* The same trust Sirach 33:3 places in the faithful law that stands sure as an oracle.'
  FROM cross_reference_threads t, cross_references x, _session253_sir33_lookup sv, _session253_sir33_lookup tv
 WHERE t.slug='ecclesiasticus-33-the-faithful-law'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=33 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 7:12 — *Wherefore the law is holy, and the commandment holy, and just, and good.* Paul confirms Sirach 33:2-3 that the wise man hates not the law, for the law is holy and faithful.'
  FROM cross_reference_threads t, cross_references x, _session253_sir33_lookup sv, _session253_sir33_lookup tv
 WHERE t.slug='ecclesiasticus-33-the-faithful-law'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=33 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=7 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 1:7 — *The fear of Yahuah (LORD) is the beginning of knowledge: but fools despise wisdom and instruction.* Sirach 33:1 likewise grounds deliverance in the fear of Yahuah, the root of all wisdom.'
  FROM cross_reference_threads t, cross_references x, _session253_sir33_lookup sv, _session253_sir33_lookup tv
 WHERE t.slug='ecclesiasticus-33-the-faithful-law'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=33 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=1 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 119:165 — *Great peace have they which love thy law: and nothing shall offend them.* The opposite of Sirach 33:2''s hypocrite who is as a ship in a storm — the law-lover rides unoffended.'
  FROM cross_reference_threads t, cross_references x, _session253_sir33_lookup sv, _session253_sir33_lookup tv
 WHERE t.slug='ecclesiasticus-33-the-faithful-law'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=33 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=119 AND tv.verse_number=165
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-33-seasons-feasts-sabbath
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:14 — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years.* The very distinguishing of seasons and feasts Sirach 33:8 says Yahuah altered, fixed in the lights of creation.'
  FROM cross_reference_threads t, cross_references x, _session253_sir33_lookup sv, _session253_sir33_lookup tv
 WHERE t.slug='ecclesiasticus-33-seasons-feasts-sabbath'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=33 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 20:8 — *Remember the sabbath day, to keep it holy.* The chief of the high days Sirach 33:9 says Yahuah hallowed above the ordinary days.'
  FROM cross_reference_threads t, cross_references x, _session253_sir33_lookup sv, _session253_sir33_lookup tv
 WHERE t.slug='ecclesiasticus-33-seasons-feasts-sabbath'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=33 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-33-the-potter
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 18:6 — *O house of Yashar''el (Israel), cannot I do with you as this potter? saith Yahuah (LORD). Behold, as the clay is in the potter’s hand, so are ye in mine hand, O house of Yashar''el (Israel).* The exact figure of Sirach 33:13 — clay in the potter''s hand, fashioned at his pleasure.'
  FROM cross_reference_threads t, cross_references x, _session253_sir33_lookup sv, _session253_sir33_lookup tv
 WHERE t.slug='ecclesiasticus-33-the-potter'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=33 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=18 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 9:20 — *Nay but, O man, who art thou that repliest against Elohim (God)? Shall the thing formed say to him that formed it, Why hast thou made me thus?* Paul forbids the vessel to dispute the hand that fashions it, as Sirach 33:13 sets man in the potter''s hand.'
  FROM cross_reference_threads t, cross_references x, _session253_sir33_lookup sv, _session253_sir33_lookup tv
 WHERE t.slug='ecclesiasticus-33-the-potter'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=33 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=9 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 9:21 — *Hath not the potter power over the clay, of the same lump to make one vessel unto honour, and another unto dishonour?* The same sovereign sorting of Sirach 33:12 — some blessed and exalted, some brought low.'
  FROM cross_reference_threads t, cross_references x, _session253_sir33_lookup sv, _session253_sir33_lookup tv
 WHERE t.slug='ecclesiasticus-33-the-potter'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=33 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=9 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 45:9 — *Woe unto him that striveth with his Maker! Let the potsherd strive with the potsherds of the earth. Shall the clay say to him that fashioneth it, What makest thou? or thy work, He hath no hands?* The clay that submits in Sirach 33:13 is the clay that must not strive with its Maker.'
  FROM cross_reference_threads t, cross_references x, _session253_sir33_lookup sv, _session253_sir33_lookup tv
 WHERE t.slug='ecclesiasticus-33-the-potter'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=33 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=45 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Genesis 2:7 — *And Yahuah Elohim (the LORD God) formed man of the dust of the ground, and breathed into his nostrils the breath of life; and man became a living soul.* The clay itself — Sirach 33:10 says all men are from the ground, and Adam was created of earth.'
  FROM cross_reference_threads t, cross_references x, _session253_sir33_lookup sv, _session253_sir33_lookup tv
 WHERE t.slug='ecclesiasticus-33-the-potter'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=33 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Wisdom of Solomon 15:7 — *For the potter, tempering soft earth, fashioneth every vessel with much labour for our service: yes, of the same clay he makes both the vessels that serve for clean uses, and likewise also all such as serve to the contrary: but what is the use of either sort, the potter himself is the judge.* Sirach''s companion wisdom-book carries the same potter, the same clay, the same sovereign Judge as Sirach 33:13.'
  FROM cross_reference_threads t, cross_references x, _session253_sir33_lookup sv, _session253_sir33_lookup tv
 WHERE t.slug='ecclesiasticus-33-the-potter'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=33 AND sv.verse_number=13
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=15 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-33-two-and-two
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 30:15 — *See, I have set before thee this day life and good, and death and evil.* Moses sets before Israel the very pair Sirach 33:14 names — good against evil, life against death.'
  FROM cross_reference_threads t, cross_references x, _session253_sir33_lookup sv, _session253_sir33_lookup tv
 WHERE t.slug='ecclesiasticus-33-two-and-two'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=33 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ecclesiasticus 42:24 — *All things are double one against another: and he has made nothing imperfect.* Ben Sira''s own later word echoes Sirach 33:15 — two and two, one against another, all by perfect design.'
  FROM cross_reference_threads t, cross_references x, _session253_sir33_lookup sv, _session253_sir33_lookup tv
 WHERE t.slug='ecclesiasticus-33-two-and-two'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=33 AND sv.verse_number=15
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=42 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-33-rule-thy-household
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 3:5 — *Trust in Yahuah (LORD) with all thine heart; and lean not unto thine own understanding.* The wisdom behind Sirach 33:19''s counsel to keep one''s own governance and not surrender it to another.'
  FROM cross_reference_threads t, cross_references x, _session253_sir33_lookup sv, _session253_sir33_lookup tv
 WHERE t.slug='ecclesiasticus-33-rule-thy-household'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=33 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=3 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-33-servant-as-a-brother
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 29:21 — *He that delicately bringeth up his servant from a child shall have him become his son at the length.* The servant who becomes a son — the very arc of Sirach 33:31''s servant entreated as a brother.'
  FROM cross_reference_threads t, cross_references x, _session253_sir33_lookup sv, _session253_sir33_lookup tv
 WHERE t.slug='ecclesiasticus-33-servant-as-a-brother'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=33 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=29 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 13:24 — *He that spareth his rod hateth his son: but he that loveth him chasteneth him betimes.* The disciplined correction Sirach 33:28 sets to the idle servant — work and chastening as love, not malice.'
  FROM cross_reference_threads t, cross_references x, _session253_sir33_lookup sv, _session253_sir33_lookup tv
 WHERE t.slug='ecclesiasticus-33-servant-as-a-brother'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=33 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=13 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ecclesiasticus 7:21 — *Let your soul love a good servant, and defraud him not of liberty.* Ben Sira''s own command tempers Sirach 33:30 — the bought servant, held as thyself, loved and not defrauded.'
  FROM cross_reference_threads t, cross_references x, _session253_sir33_lookup sv, _session253_sir33_lookup tv
 WHERE t.slug='ecclesiasticus-33-servant-as-a-brother'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=33 AND sv.verse_number=30
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=7 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

