-- ----- fragment: minion_thewisdomofsolomon_15.sql (session253 the-wisdom-of-solomon 15) -----
-- Source anchor: apocrypha/the-wisdom-of-solomon ch15. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: wis15 (view _session253_wis15_lookup). Sort band base 58350, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_wis15_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: wisdom-of-solomon-15-to-know-thee-is-immortality
  ('apocrypha', 'the-wisdom-of-solomon', 15, 3, 'canon', 'john', 17, 3, 'free', E'John 17:3 — *And this is life eternal, that they might know thee the only true Elohim (God), and Yahusha HaMashiach (Jesus Christ), whom thou hast sent.* Wisdom 15:3 names knowing the living Elohim ''the root of immortality''; Yahusha names that same knowing as life eternal itself.'),
  ('apocrypha', 'the-wisdom-of-solomon', 15, 2, 'canon', 'jeremiah', 18, 6, 'free', E'Jeremiah 18:6 — *O house of Yashar''el (Israel), cannot I do with you as this potter? saith Yahuah (LORD). Behold, as the clay is in the potter''s hand, so are ye in mine hand, O house of Yashar''el (Israel).* Wisdom 15:2''s ''if we sin, we are yours, knowing your power'' rests on the same potter-claim — Israel is clay held in the Maker''s own hand.'),
  -- thread: wisdom-of-solomon-15-potter-makes-a-god-of-clay
  ('apocrypha', 'the-wisdom-of-solomon', 15, 7, 'canon', 'romans', 9, 21, 'free', E'Romans 9:21 — *Hath not the potter power over the clay, of the same lump to make one vessel unto honour, and another unto dishonour?* Wisdom 15:7''s one clay shaped into clean and contrary vessels is exactly Paul''s lump made into honour and dishonour — the Potter''s sovereign right.'),
  ('apocrypha', 'the-wisdom-of-solomon', 15, 7, 'canon', 'isaiah', 45, 9, 'free', E'Isaiah 45:9 — *Woe unto him that striveth with his Maker! Let the potsherd strive with the potsherds of the earth. Shall the clay say to him that fashioneth it, What makest thou? or thy work, He hath no hands?* The clay declaring itself god in Wisdom 15:8 is the very woe Isaiah pronounces on the potsherd that contends with its Maker.'),
  ('apocrypha', 'the-wisdom-of-solomon', 15, 8, 'canon', 'genesis', 2, 7, 'free', E'Genesis 2:7 — *And Yahuah Elohim (the LORD God) formed man of the dust of the ground, and breathed into his nostrils the breath of life; and man became a living soul.* Wisdom 15:8''s man ''made of earth himself'' who ''returns to the same'' is the Adam of the dust — the creature presuming to fashion a creator.'),
  -- thread: wisdom-of-solomon-15-idol-no-breath-no-sight
  ('apocrypha', 'the-wisdom-of-solomon', 15, 15, 'canon', 'psalms', 115, 7, 'free', E'Psalm 115:7 — *They have hands, but they handle not: feet have they, but they walk not: neither speak they through their throat.* Wisdom 15:15''s idol with fingers that cannot handle and feet ''slow to go'' is the Psalmist''s catalogue of the silver-and-gold idol that cannot move.'),
  ('apocrypha', 'the-wisdom-of-solomon', 15, 16, 'canon', 'psalms', 115, 8, 'free', E'Psalm 115:8 — *They that make them are like unto them; so is every one that trusteth in them.* Wisdom 15:16''s ''no man can make a god like to himself'' is the obverse of the Psalm''s verdict — the maker sinks to the deadness of the thing he made.'),
  ('apocrypha', 'the-wisdom-of-solomon', 15, 5, 'canon', 'habakkuk', 2, 18, 'free', E'Habakkuk 2:18 — *What profiteth the graven image that the maker thereof hath graven it; the molten image, and a teacher of lies, that the maker of his work trusteth therein, to make dumb idols?* Wisdom 15:5''s ''dead image, that has no breath'' is Habakkuk''s dumb idol — a teacher of lies that profits nothing.'),
  -- thread: wisdom-of-solomon-15-romans-1-idolatry-headwaters
  ('apocrypha', 'the-wisdom-of-solomon', 15, 11, 'canon', 'romans', 1, 20, 'free', E'Romans 1:20 — *For the invisible things of him from the creation of the world are clearly seen, being understood by the things that are made, even his eternal power and Godhead; so that they are without excuse.* Wisdom 15:11''s idolater who ''knew not his Maker'' is the very man Paul leaves without excuse for not knowing the Creator the creation declares.'),
  ('apocrypha', 'the-wisdom-of-solomon', 15, 18, 'canon', 'romans', 1, 23, 'free', E'Romans 1:23 — *And changed the glory of the uncorruptible Elohim (God) into an image made like to corruptible man, and to birds, and fourfooted beasts, and creeping things.* Wisdom 15:18''s worship of ''those beasts also that are most hateful'' is Paul''s exchange of the Creator''s glory for the image of beasts.'),
  ('apocrypha', 'the-wisdom-of-solomon', 15, 17, 'canon', 'romans', 1, 25, 'free', E'Romans 1:25 — *Who changed the truth of Elohim (God) into a lie, and worshipped and served the creature more than the Creator, who is blessed for ever. Amen.* Wisdom 15:17''s mortal who ''is better than the things which he worshippeth'' yet worships them is Paul''s man serving the creature above the Creator.'),
  ('apocrypha', 'the-wisdom-of-solomon', 15, 13, 'apocrypha', 'the-wisdom-of-solomon', 14, 8, 'extras', E'Wisdom of Solomon 14:8 — *But that which is made with hands is cursed, as well it, as he that made it: he, because he made it; and it, because, being corruptible, it was called god.* Wisdom 15:13''s craftsman who ''knoweth himself to offend above all others'' is the same self-condemned maker the book has just cursed in chapter 14.'),
  -- thread: wisdom-of-solomon-15-his-heart-is-ashes
  ('apocrypha', 'the-wisdom-of-solomon', 15, 10, 'canon', 'isaiah', 44, 19, 'free', E'Isaiah 44:19 — *And none considereth in his heart, neither is there knowledge nor understanding to say, I have burned part of it in the fire... and shall I make the residue thereof an abomination? shall I fall down to the stock of a tree?* Wisdom 15:10''s idolater whose ''heart is ashes'' is Isaiah''s man feeding on ashes, unable to consider the folly of bowing to a block of wood.'),
  ('apocrypha', 'the-wisdom-of-solomon', 15, 15, 'canon', 'deuteronomy', 4, 28, 'free', E'Deuteronomy 4:28 — *And there ye shall serve gods, the work of men''s hands, wood and stone, which neither see, nor hear, nor eat, nor smell.* Wisdom 15:15''s idols that cannot see, breathe, or hear are Moses'' wood-and-stone gods that ''neither see, nor hear, nor eat, nor smell'' — the curse of forgetting the living Elohim.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_wis15_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_wis15_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-of-solomon-15-to-know-thee-is-immortality',
       E'To know thee is the root of immortality',
       E'The idolatry-polemic closes where Israel begins: *But you, O Yahuah (God), art gracious and true, longsuffering, and in mercy ordering all things* (Wisdom of Solomon 15:1). Over against the dead idol stands the living covenant Elohim — *For to know you is perfect righteousness: yes, to know your power is the root of immortality* (Wisdom of Solomon 15:3). This is no abstract monotheism; it is the eternal life Yahusha names: *And this is life eternal, that they might know thee the only true Elohim (God), and Yahusha HaMashiach (Jesus Christ), whom thou hast sent* (John 17:3). And the assurance that we are his even in our sin echoes the prophet''s potter-word — *O house of Yashar''el (Israel), cannot I do with you as this potter? saith Yahuah (LORD). Behold, as the clay is in the potter''s hand, so are ye in mine hand, O house of Yashar''el (Israel)* (Jeremiah 18:6). It ain''t new: to know the living Elohim is righteousness and life; the idol can give neither.',
       sv.verse_id, ev.verse_id, 'extras', 58350
  FROM _session253_wis15_lookup sv, _session253_wis15_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=15 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=15 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-of-solomon-15-potter-makes-a-god-of-clay',
       E'The potter who fashions a god of the same clay',
       E'The book''s sharpest mockery: the same craftsman who *of the same clay he makes both the vessels that serve for clean uses, and likewise also all such as serve to the contrary* turns and *makes a vain god of the same clay, even he which a little before was made of earth himself, and within a little while after returns to the same* (Wisdom of Solomon 15:7-8). Isaiah had already cried the woe — *Shall the clay say to him that fashioneth it, What makest thou?* (Isaiah 45:9) — and Jeremiah set Israel as clay in Yahuah''s hand. Paul gathers the whole figure into the gospel: *Hath not the potter power over the clay, of the same lump to make one vessel unto honour, and another unto dishonour?* (Romans 9:21). The folly is exposed by inversion — the clay-man crowns a clay-thing as Maker. It ain''t new: the Potter is Elohim; the pot is never god.',
       sv.verse_id, ev.verse_id, 'extras', 58353
  FROM _session253_wis15_lookup sv, _session253_wis15_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=15 AND sv.verse_number=7
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=15 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-of-solomon-15-idol-no-breath-no-sight',
       E'The idol has no breath, no sight, no step',
       E'The dead image is catalogued limb by limb: men *desire the form of a dead image, that has no breath* (Wisdom of Solomon 15:5), and the heathen gods *neither have the use of eyes to see, nor noses to draw breath, nor ears to hear, nor fingers of hands to handle; and as for their feet, they are slow to go* (Wisdom of Solomon 15:15). This is the Psalmist''s taunt almost word for word — *They have mouths, but they speak not: eyes have they, but they see not... feet have they, but they walk not* — and his verdict falls on the maker: *They that make them are like unto them; so is every one that trusteth in them* (Psalm 115:8). Habakkuk seals it: *What profiteth the graven image that the maker thereof hath graven it... to make dumb idols?* (Habakkuk 2:18). It ain''t new: a god that cannot breathe is no god, and its maker shares its deadness.',
       sv.verse_id, ev.verse_id, 'extras', 58356
  FROM _session253_wis15_lookup sv, _session253_wis15_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=15 AND sv.verse_number=5
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=15 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-of-solomon-15-romans-1-idolatry-headwaters',
       E'The idolatry that Romans 1 indicts',
       E'Wisdom 15 sits inside the very polemic Paul quarries for Romans 1. The idol-maker *knew not his Maker, and him that inspired into him an active soul, and breathed in a living spirit* (Wisdom of Solomon 15:11) — the creature who, though the Creator gave him breath, will not know him. Paul: *For the invisible things of him from the creation of the world are clearly seen, being understood by the things that are made... so that they are without excuse* (Romans 1:20). And where Wisdom 15:18 has them worshipping the beasts, *those beasts also that are most hateful*, Paul names the same descent — they *changed the glory of the uncorruptible Elohim (God) into an image made like to corruptible man, and to birds, and fourfooted beasts, and creeping things* (Romans 1:23). The self-link runs back through the same book: *that which is made with hands is cursed, as well it, as he that made it* (Wisdom of Solomon 14:8). It ain''t new: Romans 1 is reading Wisdom — the Creator known, refused, and exchanged for the creature.',
       sv.verse_id, ev.verse_id, 'extras', 58359
  FROM _session253_wis15_lookup sv, _session253_wis15_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=15 AND sv.verse_number=11
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=15 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-of-solomon-15-his-heart-is-ashes',
       E'His heart is ashes, his hope more vile than earth',
       E'The maker''s portrait ends in dust: *His heart is ashes, his hope is more vile than earth, and his life of less value than clay* (Wisdom of Solomon 15:10). Isaiah had drawn the same man feeding on ashes — *he hath shut their eyes, that they cannot see; and their hearts, that they cannot understand... shall I fall down to the stock of a tree?* (Isaiah 44:18-19). The covenant warned this would be Israel''s lot in exile if she forgot — *And there ye shall serve gods, the work of men''s hands, wood and stone, which neither see, nor hear, nor eat, nor smell* (Deuteronomy 4:28) — and the closing word of the chapter is that the idolaters *went without the praise of Yahuah (God) and his blessing* (Wisdom of Solomon 15:19). It ain''t new: the heart that cleaves to ashes inherits ashes; only the living Elohim gives blessing.',
       sv.verse_id, ev.verse_id, 'extras', 58362
  FROM _session253_wis15_lookup sv, _session253_wis15_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=15 AND sv.verse_number=10
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=15 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: wisdom-of-solomon-15-to-know-thee-is-immortality
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 17:3 — *And this is life eternal, that they might know thee the only true Elohim (God), and Yahusha HaMashiach (Jesus Christ), whom thou hast sent.* Wisdom 15:3 names knowing the living Elohim ''the root of immortality''; Yahusha names that same knowing as life eternal itself.'
  FROM cross_reference_threads t, cross_references x, _session253_wis15_lookup sv, _session253_wis15_lookup tv
 WHERE t.slug='wisdom-of-solomon-15-to-know-thee-is-immortality'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=15 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=17 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 18:6 — *O house of Yashar''el (Israel), cannot I do with you as this potter? saith Yahuah (LORD). Behold, as the clay is in the potter''s hand, so are ye in mine hand, O house of Yashar''el (Israel).* Wisdom 15:2''s ''if we sin, we are yours, knowing your power'' rests on the same potter-claim — Israel is clay held in the Maker''s own hand.'
  FROM cross_reference_threads t, cross_references x, _session253_wis15_lookup sv, _session253_wis15_lookup tv
 WHERE t.slug='wisdom-of-solomon-15-to-know-thee-is-immortality'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=15 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=18 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-of-solomon-15-potter-makes-a-god-of-clay
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Romans 9:21 — *Hath not the potter power over the clay, of the same lump to make one vessel unto honour, and another unto dishonour?* Wisdom 15:7''s one clay shaped into clean and contrary vessels is exactly Paul''s lump made into honour and dishonour — the Potter''s sovereign right.'
  FROM cross_reference_threads t, cross_references x, _session253_wis15_lookup sv, _session253_wis15_lookup tv
 WHERE t.slug='wisdom-of-solomon-15-potter-makes-a-god-of-clay'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=15 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=9 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 45:9 — *Woe unto him that striveth with his Maker! Let the potsherd strive with the potsherds of the earth. Shall the clay say to him that fashioneth it, What makest thou? or thy work, He hath no hands?* The clay declaring itself god in Wisdom 15:8 is the very woe Isaiah pronounces on the potsherd that contends with its Maker.'
  FROM cross_reference_threads t, cross_references x, _session253_wis15_lookup sv, _session253_wis15_lookup tv
 WHERE t.slug='wisdom-of-solomon-15-potter-makes-a-god-of-clay'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=15 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=45 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 2:7 — *And Yahuah Elohim (the LORD God) formed man of the dust of the ground, and breathed into his nostrils the breath of life; and man became a living soul.* Wisdom 15:8''s man ''made of earth himself'' who ''returns to the same'' is the Adam of the dust — the creature presuming to fashion a creator.'
  FROM cross_reference_threads t, cross_references x, _session253_wis15_lookup sv, _session253_wis15_lookup tv
 WHERE t.slug='wisdom-of-solomon-15-potter-makes-a-god-of-clay'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=15 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-of-solomon-15-idol-no-breath-no-sight
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 115:7 — *They have hands, but they handle not: feet have they, but they walk not: neither speak they through their throat.* Wisdom 15:15''s idol with fingers that cannot handle and feet ''slow to go'' is the Psalmist''s catalogue of the silver-and-gold idol that cannot move.'
  FROM cross_reference_threads t, cross_references x, _session253_wis15_lookup sv, _session253_wis15_lookup tv
 WHERE t.slug='wisdom-of-solomon-15-idol-no-breath-no-sight'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=15 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=115 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 115:8 — *They that make them are like unto them; so is every one that trusteth in them.* Wisdom 15:16''s ''no man can make a god like to himself'' is the obverse of the Psalm''s verdict — the maker sinks to the deadness of the thing he made.'
  FROM cross_reference_threads t, cross_references x, _session253_wis15_lookup sv, _session253_wis15_lookup tv
 WHERE t.slug='wisdom-of-solomon-15-idol-no-breath-no-sight'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=15 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=115 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Habakkuk 2:18 — *What profiteth the graven image that the maker thereof hath graven it; the molten image, and a teacher of lies, that the maker of his work trusteth therein, to make dumb idols?* Wisdom 15:5''s ''dead image, that has no breath'' is Habakkuk''s dumb idol — a teacher of lies that profits nothing.'
  FROM cross_reference_threads t, cross_references x, _session253_wis15_lookup sv, _session253_wis15_lookup tv
 WHERE t.slug='wisdom-of-solomon-15-idol-no-breath-no-sight'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=15 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='habakkuk' AND tv.chapter_number=2 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-of-solomon-15-romans-1-idolatry-headwaters
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Romans 1:20 — *For the invisible things of him from the creation of the world are clearly seen, being understood by the things that are made, even his eternal power and Godhead; so that they are without excuse.* Wisdom 15:11''s idolater who ''knew not his Maker'' is the very man Paul leaves without excuse for not knowing the Creator the creation declares.'
  FROM cross_reference_threads t, cross_references x, _session253_wis15_lookup sv, _session253_wis15_lookup tv
 WHERE t.slug='wisdom-of-solomon-15-romans-1-idolatry-headwaters'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=15 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=1 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 1:23 — *And changed the glory of the uncorruptible Elohim (God) into an image made like to corruptible man, and to birds, and fourfooted beasts, and creeping things.* Wisdom 15:18''s worship of ''those beasts also that are most hateful'' is Paul''s exchange of the Creator''s glory for the image of beasts.'
  FROM cross_reference_threads t, cross_references x, _session253_wis15_lookup sv, _session253_wis15_lookup tv
 WHERE t.slug='wisdom-of-solomon-15-romans-1-idolatry-headwaters'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=15 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=1 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 1:25 — *Who changed the truth of Elohim (God) into a lie, and worshipped and served the creature more than the Creator, who is blessed for ever. Amen.* Wisdom 15:17''s mortal who ''is better than the things which he worshippeth'' yet worships them is Paul''s man serving the creature above the Creator.'
  FROM cross_reference_threads t, cross_references x, _session253_wis15_lookup sv, _session253_wis15_lookup tv
 WHERE t.slug='wisdom-of-solomon-15-romans-1-idolatry-headwaters'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=15 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=1 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Wisdom of Solomon 14:8 — *But that which is made with hands is cursed, as well it, as he that made it: he, because he made it; and it, because, being corruptible, it was called god.* Wisdom 15:13''s craftsman who ''knoweth himself to offend above all others'' is the same self-condemned maker the book has just cursed in chapter 14.'
  FROM cross_reference_threads t, cross_references x, _session253_wis15_lookup sv, _session253_wis15_lookup tv
 WHERE t.slug='wisdom-of-solomon-15-romans-1-idolatry-headwaters'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=15 AND sv.verse_number=13
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=14 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-of-solomon-15-his-heart-is-ashes
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 44:19 — *And none considereth in his heart, neither is there knowledge nor understanding to say, I have burned part of it in the fire... and shall I make the residue thereof an abomination? shall I fall down to the stock of a tree?* Wisdom 15:10''s idolater whose ''heart is ashes'' is Isaiah''s man feeding on ashes, unable to consider the folly of bowing to a block of wood.'
  FROM cross_reference_threads t, cross_references x, _session253_wis15_lookup sv, _session253_wis15_lookup tv
 WHERE t.slug='wisdom-of-solomon-15-his-heart-is-ashes'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=15 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 4:28 — *And there ye shall serve gods, the work of men''s hands, wood and stone, which neither see, nor hear, nor eat, nor smell.* Wisdom 15:15''s idols that cannot see, breathe, or hear are Moses'' wood-and-stone gods that ''neither see, nor hear, nor eat, nor smell'' — the curse of forgetting the living Elohim.'
  FROM cross_reference_threads t, cross_references x, _session253_wis15_lookup sv, _session253_wis15_lookup tv
 WHERE t.slug='wisdom-of-solomon-15-his-heart-is-ashes'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=15 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=4 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

