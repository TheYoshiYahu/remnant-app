-- ----- fragment: minion_2adameve_17.sql (session253 2-adam-eve 17) -----
-- Source anchor: adam-eve-conflict/2-adam-eve ch17. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2ae17 (view _session253_2ae17_lookup). Sort band base 66400, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2ae17_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-adam-eve-17-angel-of-light
  ('adam-eve-conflict', '2-adam-eve', 17, 4, 'canon', '2-corinthians', 11, 14, 'free', E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* The thirty beautiful men full of light at the cave''s mouth are exactly this transformation, the seed-war''s oldest disguise worn against Jared.'),
  ('adam-eve-conflict', '2-adam-eve', 17, 9, 'canon', 'john', 8, 44, 'free', E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* The elder''s claim to be Adam comforting his children is the father of lies speaking of his own against the holy line.'),
  ('adam-eve-conflict', '2-adam-eve', 17, 6, 'canon', '1-peter', 5, 8, 'free', E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour.* The beauty that made Jared wonder is the devouring lion''s lure, and Jared who arose ''like a lion over his people'' is hunted by the false lion.'),
  ('adam-eve-conflict', '2-adam-eve', 17, 6, 'canon', 'revelation', 12, 8, 'free', E'Revelation 12:8 — *And prevailed not; neither was their place found any more in heaven.* The ''great beauty'' Satan wears is stolen light from the heaven he was cast out of, the same dragon who counterfeits the patriarchs at the cave.'),
  -- thread: 2-adam-eve-17-false-fathers
  ('adam-eve-conflict', '2-adam-eve', 17, 9, 'canon', 'genesis', 3, 4, 'free', E'Genesis 3:4 — *And the serpent said unto the woman, Ye shall not surely die.* The same deceiver who first contradicted Yahuah''s word now raises the ''dead'' fathers as living glory to contradict death itself and ensnare Jared.'),
  ('adam-eve-conflict', '2-adam-eve', 17, 13, 'canon', 'genesis', 3, 5, 'free', E'Genesis 3:5 — *For Elohim (God) doth know that in the day ye eat thereof, then your eyes shall be opened, and ye shall be as gods, knowing good and evil.* The false elder''s tale of the beautiful land north of the garden is the same promise of a better estate the serpent dangled before Eve.'),
  ('adam-eve-conflict', '2-adam-eve', 17, 9, 'canon', '1-john', 3, 8, 'free', E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* The devil who counterfeits Adam and Abel here is the one the promised Son is manifested to destroy.'),
  -- thread: 2-adam-eve-17-down-to-cain
  ('adam-eve-conflict', '2-adam-eve', 17, 18, 'canon', 'genesis', 6, 2, 'free', E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* Satan''s command to ''go down to them'' is the mingling of the two seed-lines that Genesis names as the prelude to the flood Mahalaleel foretold.'),
  ('adam-eve-conflict', '2-adam-eve', 17, 7, 'canon', '1-john', 3, 12, 'free', E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous.* Jared''s own reckoning that the children of Cain are no kindred of his marks the covenant separation John names — the line of the wicked one kept distinct from the righteous seed.'),
  ('adam-eve-conflict', '2-adam-eve', 17, 18, 'enoch', '1-enoch', 6, 2, 'extras', E'1 Enoch 6:2 — *And the angels, the children of the heaven, saw and lusted after them, and said to one another: ''Come, let us choose us wives from among the children of men and beget us children.''* The descent to the daughters below is the same primeval crossing the Watchers made — the seed-war told twice in the same first history.'),
  ('adam-eve-conflict', '2-adam-eve', 17, 4, 'canon', 'jude', 1, 6, 'free', E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* The thirty hosts of Satan luring Jared down are of that order of angels who left their estate, reserved for the judgment.'),
  -- thread: 2-adam-eve-17-the-infamy
  ('adam-eve-conflict', '2-adam-eve', 17, 38, 'canon', 'genesis', 6, 2, 'free', E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* The daughters of Cain brought to the fountain are the very daughters of men whose fairness Genesis says drew the holy line down into corruption.'),
  ('adam-eve-conflict', '2-adam-eve', 17, 41, 'canon', 'jude', 1, 7, 'free', E'Jude 1:7 — *Even as Sodom and Gomorrha, and the cities about them in like manner, giving themselves over to fornication, and going after strange flesh, are set forth for an example, suffering the vengeance of eternal fire.* The ''infamy'' the elder works before Jared is the going after strange flesh that Jude sets forth as the example of judgment.'),
  ('adam-eve-conflict', '2-adam-eve', 17, 42, 'canon', '1-corinthians', 6, 9, 'free', E'1 Corinthians 6:9 — *Know ye not that the unrighteous shall not inherit the kingdom of Elohim (God)? Be not deceived: neither fornicators, nor idolaters, nor adulterers, nor effeminate, nor abusers of themselves with mankind,* Jared''s refusal — ''my fathers never did the like'' — keeps the very purity Paul says the deceived forfeit the kingdom by losing.'),
  -- thread: 2-adam-eve-17-prayer-routs-devils
  ('adam-eve-conflict', '2-adam-eve', 17, 44, 'canon', 'james', 4, 7, 'free', E'James 4:7 — *Submit yourselves therefore to Elohim (God). Resist the devil, and he will flee from you.* That the elder and his companions could not abide in a place of prayer but fled is the very promise James gives — the resisted devil flees.'),
  ('adam-eve-conflict', '2-adam-eve', 17, 43, 'canon', 'matthew', 4, 10, 'free', E'Matthew 4:10 — *Then saith Yahusha (Jesus) unto him, Get thee hence, Satan: for it is written, Thou shalt worship Yahuah Elohayka (the Lord thy God), and him only shalt thou serve.* The Messiah dismisses the same tempter on a mountain by the word, as Jared''s fervent prayer dismisses him from the cave-mountain.'),
  ('adam-eve-conflict', '2-adam-eve', 17, 47, 'canon', 'romans', 16, 20, 'free', E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* The angel sent to draw Jared out of the midst of Cain is Yahuah''s mercy bruising Satan and keeping the seed, the standing edge of Genesis 3:15.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2ae17_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2ae17_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-17-angel-of-light',
       E'Handsome men full of light — Satan transformed',
       E'Satan does not come against Jared as a monster but as glory: *Satan then appeared to him with thirty men of his hosts, in the form of handsome men; Satan himself being the elder and tallest among them, with a fine beard* (2 Adam and Eve 17:4), and at the cave''s mouth Jared *found them looking like fine men, full of light, and of great beauty* (2 Adam and Eve 17:6). It ain''t new — this is the oldest disguise: *And no marvel; for Satan himself is transformed into an angel of light* (2 Corinthians 11:14). The light is borrowed and the speech is a lie, for *He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it* (John 8:44). The adversary still prowls the same way: *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour* (1 Peter 5:8) — and he was cast down from the very light he counterfeits: *And prevailed not; neither was their place found any more in heaven* (Revelation 12:8).',
       sv.verse_id, ev.verse_id, 'extras', 66400
  FROM _session253_2ae17_lookup sv, _session253_2ae17_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=17 AND sv.verse_number=4
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=17 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-17-false-fathers',
       E'I am Adam — the counterfeit of the holy seed',
       E'The lie is precise and genealogical: *I am Adam whom Elohim (God) made first; and this is Abel my son, who was killed by his brother Cain... Then this is my son Seth, whom I asked of Yahuah (Lord), who gave him to me, to comfort me instead of Abel* (2 Adam and Eve 17:9-10), and the false elder names the whole line down to *Mahalaleel... thy father* (2 Adam and Eve 17:11). Satan counterfeits the very seed Yahuah is keeping. This is the garden lie wearing new robes — there the serpent said *Ye shall not surely die* (Genesis 3:4) and *ye shall be as gods, knowing good and evil* (Genesis 3:5); here he raises the dead fathers as bait. But the Son comes precisely to undo this: *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil* (1 John 3:8).',
       sv.verse_id, ev.verse_id, 'extras', 66403
  FROM _session253_2ae17_lookup sv, _session253_2ae17_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=17 AND sv.verse_number=9
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=17 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-17-down-to-cain',
       E'Go down to them — the two seed-lines',
       E'The whole aim of the deception is to break the separation of the holy line of Seth on the mountain from the line of Cain in the valley: *Now, therefore, 0 my son, hearken to my counsel, and go down to them, thou and thy children* (2 Adam and Eve 17:18). The Watchers'' generation runs the same channel — *And the angels, the children of the heaven, saw and lusted after them, and said to one another: ''Come, let us choose us wives from among the children of men and beget us children''* (1 Enoch 6:2) — angels *which kept not their first estate, but left their own habitation* (Jude 1:6). It is the mingling that Genesis records: *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose* (Genesis 6:2). And it is the very line Jared is warned of, *Not as Cain, who was of that wicked one, and slew his brother* (1 John 3:12) — election precedes confession, the covenant seed kept apart.',
       sv.verse_id, ev.verse_id, 'extras', 66406
  FROM _session253_2ae17_lookup sv, _session253_2ae17_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=17 AND sv.verse_number=18
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=17 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-17-the-infamy',
       E'Working infamy by the fountain — the corruption refused',
       E'At the fountain by the houses of Cain the trap springs: *every one of Cain''s sons brought his wife, and another brought his daughter, and so, many women came to them* (2 Adam and Eve 17:38), and the elder *spread his hands and took one of the women, and five of his companions did the same before Jared, that he should do as they did* (2 Adam and Eve 17:41). But Jared *when he saw them working infamy he wept, and said in his mind, - My fathers never did the like* (2 Adam and Eve 17:42). This is the same going *after strange flesh* (Jude 1:7) that the fair daughters of men provoked: *That the sons of Elohim (God) saw the daughters of men that they were fair* (Genesis 6:2). Jared keeps what Paul charges the redeemed to keep: *Know ye not that the unrighteous shall not inherit the kingdom of Elohim (God)? Be not deceived: neither fornicators, nor idolaters, nor adulterers...* (1 Corinthians 6:9).',
       sv.verse_id, ev.verse_id, 'extras', 66409
  FROM _session253_2ae17_lookup sv, _session253_2ae17_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=17 AND sv.verse_number=38
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=17 AND ev.verse_number=42
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-17-prayer-routs-devils',
       E'He prayed, and the devils fled — mercy keeps the seed',
       E'Jared has no power of his own; he has prayer: *He then spread his hands and prayed with a fervent heart, and with much weeping, and entreated Elohim (God) to deliver him from their hands* (2 Adam and Eve 17:43), and at once *No sooner did Jared begin to pray than the elder fled with his companions; for they could not abide in a place of prayer* (2 Adam and Eve 17:44). This is the law of the seed-war: *Submit yourselves therefore to Elohim (God). Resist the devil, and he will flee from you* (James 4:7). The Messiah Himself routed the same elder on a mountain with the word — *Then saith Yahusha (Jesus) unto him, Get thee hence, Satan: for it is written, Thou shalt worship Yahuah Elohayka (the Lord thy God), and him only shalt thou serve* (Matthew 4:10). And the mercy that sends the angel to draw Jared out of the midst of Cain is the standing promise that the seed is kept: *And the Elohim (God) of peace shall bruise Satan under your feet shortly* (Romans 16:20).',
       sv.verse_id, ev.verse_id, 'extras', 66412
  FROM _session253_2ae17_lookup sv, _session253_2ae17_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=17 AND sv.verse_number=43
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=17 AND ev.verse_number=48
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-adam-eve-17-angel-of-light
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* The thirty beautiful men full of light at the cave''s mouth are exactly this transformation, the seed-war''s oldest disguise worn against Jared.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae17_lookup sv, _session253_2ae17_lookup tv
 WHERE t.slug='2-adam-eve-17-angel-of-light'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=17 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=11 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* The elder''s claim to be Adam comforting his children is the father of lies speaking of his own against the holy line.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae17_lookup sv, _session253_2ae17_lookup tv
 WHERE t.slug='2-adam-eve-17-angel-of-light'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=17 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour.* The beauty that made Jared wonder is the devouring lion''s lure, and Jared who arose ''like a lion over his people'' is hunted by the false lion.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae17_lookup sv, _session253_2ae17_lookup tv
 WHERE t.slug='2-adam-eve-17-angel-of-light'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=17 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 12:8 — *And prevailed not; neither was their place found any more in heaven.* The ''great beauty'' Satan wears is stolen light from the heaven he was cast out of, the same dragon who counterfeits the patriarchs at the cave.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae17_lookup sv, _session253_2ae17_lookup tv
 WHERE t.slug='2-adam-eve-17-angel-of-light'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=17 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=12 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-17-false-fathers
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:4 — *And the serpent said unto the woman, Ye shall not surely die.* The same deceiver who first contradicted Yahuah''s word now raises the ''dead'' fathers as living glory to contradict death itself and ensnare Jared.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae17_lookup sv, _session253_2ae17_lookup tv
 WHERE t.slug='2-adam-eve-17-false-fathers'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=17 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:5 — *For Elohim (God) doth know that in the day ye eat thereof, then your eyes shall be opened, and ye shall be as gods, knowing good and evil.* The false elder''s tale of the beautiful land north of the garden is the same promise of a better estate the serpent dangled before Eve.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae17_lookup sv, _session253_2ae17_lookup tv
 WHERE t.slug='2-adam-eve-17-false-fathers'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=17 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* The devil who counterfeits Adam and Abel here is the one the promised Son is manifested to destroy.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae17_lookup sv, _session253_2ae17_lookup tv
 WHERE t.slug='2-adam-eve-17-false-fathers'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=17 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-17-down-to-cain
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* Satan''s command to ''go down to them'' is the mingling of the two seed-lines that Genesis names as the prelude to the flood Mahalaleel foretold.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae17_lookup sv, _session253_2ae17_lookup tv
 WHERE t.slug='2-adam-eve-17-down-to-cain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=17 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous.* Jared''s own reckoning that the children of Cain are no kindred of his marks the covenant separation John names — the line of the wicked one kept distinct from the righteous seed.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae17_lookup sv, _session253_2ae17_lookup tv
 WHERE t.slug='2-adam-eve-17-down-to-cain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=17 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 6:2 — *And the angels, the children of the heaven, saw and lusted after them, and said to one another: ''Come, let us choose us wives from among the children of men and beget us children.''* The descent to the daughters below is the same primeval crossing the Watchers made — the seed-war told twice in the same first history.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae17_lookup sv, _session253_2ae17_lookup tv
 WHERE t.slug='2-adam-eve-17-down-to-cain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=17 AND sv.verse_number=18
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* The thirty hosts of Satan luring Jared down are of that order of angels who left their estate, reserved for the judgment.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae17_lookup sv, _session253_2ae17_lookup tv
 WHERE t.slug='2-adam-eve-17-down-to-cain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=17 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-17-the-infamy
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* The daughters of Cain brought to the fountain are the very daughters of men whose fairness Genesis says drew the holy line down into corruption.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae17_lookup sv, _session253_2ae17_lookup tv
 WHERE t.slug='2-adam-eve-17-the-infamy'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=17 AND sv.verse_number=38
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jude 1:7 — *Even as Sodom and Gomorrha, and the cities about them in like manner, giving themselves over to fornication, and going after strange flesh, are set forth for an example, suffering the vengeance of eternal fire.* The ''infamy'' the elder works before Jared is the going after strange flesh that Jude sets forth as the example of judgment.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae17_lookup sv, _session253_2ae17_lookup tv
 WHERE t.slug='2-adam-eve-17-the-infamy'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=17 AND sv.verse_number=41
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Corinthians 6:9 — *Know ye not that the unrighteous shall not inherit the kingdom of Elohim (God)? Be not deceived: neither fornicators, nor idolaters, nor adulterers, nor effeminate, nor abusers of themselves with mankind,* Jared''s refusal — ''my fathers never did the like'' — keeps the very purity Paul says the deceived forfeit the kingdom by losing.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae17_lookup sv, _session253_2ae17_lookup tv
 WHERE t.slug='2-adam-eve-17-the-infamy'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=17 AND sv.verse_number=42
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=6 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-17-prayer-routs-devils
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'James 4:7 — *Submit yourselves therefore to Elohim (God). Resist the devil, and he will flee from you.* That the elder and his companions could not abide in a place of prayer but fled is the very promise James gives — the resisted devil flees.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae17_lookup sv, _session253_2ae17_lookup tv
 WHERE t.slug='2-adam-eve-17-prayer-routs-devils'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=17 AND sv.verse_number=44
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=4 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 4:10 — *Then saith Yahusha (Jesus) unto him, Get thee hence, Satan: for it is written, Thou shalt worship Yahuah Elohayka (the Lord thy God), and him only shalt thou serve.* The Messiah dismisses the same tempter on a mountain by the word, as Jared''s fervent prayer dismisses him from the cave-mountain.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae17_lookup sv, _session253_2ae17_lookup tv
 WHERE t.slug='2-adam-eve-17-prayer-routs-devils'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=17 AND sv.verse_number=43
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=4 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* The angel sent to draw Jared out of the midst of Cain is Yahuah''s mercy bruising Satan and keeping the seed, the standing edge of Genesis 3:15.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae17_lookup sv, _session253_2ae17_lookup tv
 WHERE t.slug='2-adam-eve-17-prayer-routs-devils'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=17 AND sv.verse_number=47
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=16 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

