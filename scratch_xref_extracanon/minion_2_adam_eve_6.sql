-- ----- fragment: minion_2adameve_06.sql (session253 2-adam-eve 6) -----
-- Source anchor: adam-eve-conflict/2-adam-eve ch6. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2ae6 (view _session253_2ae6_lookup). Sort band base 66125, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2ae6_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-adam-eve-6-satan-angel-of-light
  ('adam-eve-conflict', '2-adam-eve', 6, 7, 'canon', '2-corinthians', 11, 14, 'free', E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* Satan dresses his offer of "our world" of "beautiful things" in light, exactly as he comes to Seth in 2 Adam & Eve 6:7.'),
  ('adam-eve-conflict', '2-adam-eve', 6, 2, 'canon', 'john', 8, 44, 'free', E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* The "praise" Satan promises in 2 Adam & Eve 6:2 is a lie spoken of his own, for there is no truth in him.'),
  ('adam-eve-conflict', '2-adam-eve', 6, 7, 'canon', 'genesis', 3, 4, 'free', E'Genesis 3:4 — *And the serpent said unto the woman, Ye shall not surely die:* the very lie that downplayed the danger in Eden is replayed to Seth as harmless one-night mirth in 2 Adam & Eve 6:7.'),
  ('adam-eve-conflict', '2-adam-eve', 6, 15, 'canon', 'revelation', 12, 9, 'free', E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* The angel-form that befell Seth in 2 Adam & Eve 6:15 is that old serpent who deceiveth the whole world.'),
  -- thread: 2-adam-eve-6-seed-kept-not-as-cain
  ('adam-eve-conflict', '2-adam-eve', 6, 5, 'canon', '1-john', 3, 12, 'free', E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother’s righteous.* Seth''s dread of perishing "like my brother Cain" in 2 Adam & Eve 6:5 names the very seed of the wicked one this verse warns against.'),
  ('adam-eve-conflict', '2-adam-eve', 6, 5, 'canon', 'genesis', 4, 8, 'free', E'Genesis 4:8 — *And Cain talked with Abel his brother: and it came to pass, when they were in the field, that Cain rose up against Abel his brother, and slew him.* This is the killing Seth remembers when he refuses to follow Satan "lest I perish like my brother Cain" in 2 Adam & Eve 6:5.'),
  ('adam-eve-conflict', '2-adam-eve', 6, 9, 'canon', 'genesis', 5, 3, 'free', E'Genesis 5:3 — *And Adam lived an hundred and thirty years, and begat a son in his own likeness, after his image; and called his name Seth:* the appointed seed who clings so to Adam and Eve in 2 Adam & Eve 6:9 is the one set in the place of slain Abel to carry the covenant.'),
  ('adam-eve-conflict', '2-adam-eve', 6, 8, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Satan''s bid to lure away the obedient seed in 2 Adam & Eve 6:8 is one more blow in the enmity decreed here against the seed of the woman.'),
  -- thread: 2-adam-eve-6-altar-the-word-curses-satan
  ('adam-eve-conflict', '2-adam-eve', 6, 12, 'canon', 'john', 1, 1, 'free', E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The "Word" Elohim sends to curse Satan in 2 Adam & Eve 6:12 is this same eternal Word who was with Elohim from the beginning.'),
  ('adam-eve-conflict', '2-adam-eve', 6, 11, 'canon', 'psalms', 50, 15, 'free', E'Psalm 50:15 — *And call upon me in the day of trouble: I will deliver thee, and thou shalt glorify me.* Seth spreading his hands at the altar and seeking deliverance in 2 Adam & Eve 6:11 is exactly this calling-upon in the day of trouble, and Yahuah answers.'),
  ('adam-eve-conflict', '2-adam-eve', 6, 12, 'canon', 'james', 4, 7, 'free', E'James 4:7 — *Submit yourselves therefore to Elohim (God). Resist the devil, and he will flee from you.* When the Word curses Satan and he flees in 2 Adam & Eve 6:12, the everlasting pattern is shown: the adversary cannot stand before submission to Elohim.'),
  ('adam-eve-conflict', '2-adam-eve', 6, 13, 'canon', 'ephesians', 6, 11, 'free', E'Ephesians 6:11 — *Put on the whole armour of Elohim (God), that ye may be able to stand against the wiles of the devil.* Seth''s confidence that at the altar Satan shall be unable to hurt him in 2 Adam & Eve 6:13 is the same standing against the wiles of the devil that Yahuah''s armour secures.'),
  -- thread: 2-adam-eve-6-adam-unmasks-cave-of-treasures
  ('adam-eve-conflict', '2-adam-eve', 6, 16, 'canon', 'revelation', 12, 9, 'free', E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* The "angel" Adam unmasks as Satan in 2 Adam & Eve 6:16 is this same old serpent who deceiveth the whole world.'),
  ('adam-eve-conflict', '2-adam-eve', 6, 17, 'canon', 'psalms', 91, 11, 'free', E'Psalm 91:11 — *For he shall give his angels charge over thee, to keep thee in all thy ways.* Adam and Eve never parting from Seth thereafter in 2 Adam & Eve 6:17 mirrors the charge to keep the seed in all his ways against the deceiver.'),
  ('adam-eve-conflict', '2-adam-eve', 6, 16, 'canon', 'matthew', 2, 11, 'free', E'Matthew 2:11 — *And when they were come into the house, they saw the young child with Mary his mother, and fell down, and worshipped him: and when they had opened their treasures, they presented unto him gifts; gold, and frankincense, and myrrh.* The treasures rejoiced over in the Cave in 2 Adam & Eve 6:16 are the very gold, frankincense, and myrrh kept by Adam''s line against the coming of the Saviour.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2ae6_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2ae6_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-6-satan-angel-of-light',
       E'Satan transformed — the deceiver works on Seth',
       E'Satan comes to the holy seed of Seth wearing borrowed beauty, painting "another world" more fair than this: *And Satan said "Yes; behold thou hast heard me; but I will yet praise them and their ways, in thy hearing."* (2 Adam & Eve 6:2), and *"come with me to-day, to our world; where thou shalt see beautiful things and enjoy thyself there"* (2 Adam & Eve 6:7). It ain''t new — this is the serpent''s first lie wearing fresh paint. *And no marvel; for Satan himself is transformed into an angel of light.* (2 Corinthians 11:14). Adam himself names the disguise: the account *befell him from Satan, under the form of an angel* (2 Adam & Eve 6:15). The father of it has not changed his trade — *When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* (John 8:44) — the same dragon *which deceiveth the whole world* (Revelation 12:9).',
       sv.verse_id, ev.verse_id, 'extras', 66125
  FROM _session253_2ae6_lookup sv, _session253_2ae6_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=6 AND sv.verse_number=2
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=6 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-6-seed-kept-not-as-cain',
       E'The seed kept — Seth fears to walk as Cain',
       E'The holy line will not stir without the covenant: *"I am afraid of doing any thing without my father''s and mother''s leave, lest I perish like my brother Cain, and like my father Adam, who transgressed the commandment of Elohim"* (2 Adam & Eve 6:5), and *"if I hide from them one day, they will die, and Elohim will hold me guilty of sinning against them"* (2 Adam & Eve 6:8). Here are the two seed-lines drawn in a child''s fear: Seth, *begat... in his own likeness, after his image; and called his name Seth* (Genesis 5:3), set against *Cain, who was of that wicked one, and slew his brother* (1 John 3:12) — *when they were in the field, that Cain rose up against Abel his brother, and slew him* (Genesis 4:8). Election precedes confession; the seed of the woman is kept while the seed of the serpent strikes — *And I will put enmity between thee and the woman, and between thy seed and her seed* (Genesis 3:15).',
       sv.verse_id, ev.verse_id, 'extras', 66128
  FROM _session253_2ae6_lookup sv, _session253_2ae6_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=6 AND sv.verse_number=5
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=6 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-6-altar-the-word-curses-satan',
       E'The altar and the Word — Satan flees, cursed',
       E'Hard-pressed, Seth runs to the only ground that is safe: *he... went up to the altar, and spread his hands unto Elohim, and sought deliverance from Him* (2 Adam & Eve 6:11), trusting *"The altar is the place of offering, and Elohim is there; a divine fire shall consume it; so shall Satan be unable to hurt me"* (2 Adam & Eve 6:13). And the deliverer is the Word: *Then Elohim sent His Word, and cursed Satan, who fled from Him* (2 Adam & Eve 6:12). This is the Logos who answers prayer and routs the enemy — *In the beginning was the Word, and the Word was with Elohim, and the Word was Elohim* (John 1:1). Yahuah''s own promise is fulfilled in the cry from the altar — *And call upon me in the day of trouble: I will deliver thee* (Psalm 50:15) — and the rule still holds: *Resist the devil, and he will flee from you.* (James 4:7).',
       sv.verse_id, ev.verse_id, 'extras', 66131
  FROM _session253_2ae6_lookup sv, _session253_2ae6_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=6 AND sv.verse_number=11
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=6 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-6-adam-unmasks-cave-of-treasures',
       E'Adam unmasks the angel — joy in the Cave of Treasures',
       E'The father discerns the spirit his child could not: *Adam heard his account... and warned him against that angel, telling him it was Satan who thus appeared to him. Then Adam took Seth, and they went to the Cave of Treasures, and rejoiced therein* (2 Adam & Eve 6:16). The deceiver who *appeared to him* is unmasked as *that old serpent, called the Devil, and Satan, which deceiveth the whole world* (Revelation 12:9). The watchful father guards the seed as the angels are charged to guard — *For he shall give his angels charge over thee, to keep thee in all thy ways.* (Psalm 91:11) — and the Cave of Treasures, where the holy line keeps gold and incense and myrrh against the Saviour''s coming, looks forward to the day they *presented unto him gifts; gold, and frankincense, and myrrh* (Matthew 2:11).',
       sv.verse_id, ev.verse_id, 'extras', 66134
  FROM _session253_2ae6_lookup sv, _session253_2ae6_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=6 AND sv.verse_number=15
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=6 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-adam-eve-6-satan-angel-of-light
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* Satan dresses his offer of "our world" of "beautiful things" in light, exactly as he comes to Seth in 2 Adam & Eve 6:7.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae6_lookup sv, _session253_2ae6_lookup tv
 WHERE t.slug='2-adam-eve-6-satan-angel-of-light'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=6 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=11 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* The "praise" Satan promises in 2 Adam & Eve 6:2 is a lie spoken of his own, for there is no truth in him.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae6_lookup sv, _session253_2ae6_lookup tv
 WHERE t.slug='2-adam-eve-6-satan-angel-of-light'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=6 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 3:4 — *And the serpent said unto the woman, Ye shall not surely die:* the very lie that downplayed the danger in Eden is replayed to Seth as harmless one-night mirth in 2 Adam & Eve 6:7.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae6_lookup sv, _session253_2ae6_lookup tv
 WHERE t.slug='2-adam-eve-6-satan-angel-of-light'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=6 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* The angel-form that befell Seth in 2 Adam & Eve 6:15 is that old serpent who deceiveth the whole world.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae6_lookup sv, _session253_2ae6_lookup tv
 WHERE t.slug='2-adam-eve-6-satan-angel-of-light'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=6 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=12 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-6-seed-kept-not-as-cain
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother’s righteous.* Seth''s dread of perishing "like my brother Cain" in 2 Adam & Eve 6:5 names the very seed of the wicked one this verse warns against.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae6_lookup sv, _session253_2ae6_lookup tv
 WHERE t.slug='2-adam-eve-6-seed-kept-not-as-cain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=6 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 4:8 — *And Cain talked with Abel his brother: and it came to pass, when they were in the field, that Cain rose up against Abel his brother, and slew him.* This is the killing Seth remembers when he refuses to follow Satan "lest I perish like my brother Cain" in 2 Adam & Eve 6:5.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae6_lookup sv, _session253_2ae6_lookup tv
 WHERE t.slug='2-adam-eve-6-seed-kept-not-as-cain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=6 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 5:3 — *And Adam lived an hundred and thirty years, and begat a son in his own likeness, after his image; and called his name Seth:* the appointed seed who clings so to Adam and Eve in 2 Adam & Eve 6:9 is the one set in the place of slain Abel to carry the covenant.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae6_lookup sv, _session253_2ae6_lookup tv
 WHERE t.slug='2-adam-eve-6-seed-kept-not-as-cain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=6 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Satan''s bid to lure away the obedient seed in 2 Adam & Eve 6:8 is one more blow in the enmity decreed here against the seed of the woman.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae6_lookup sv, _session253_2ae6_lookup tv
 WHERE t.slug='2-adam-eve-6-seed-kept-not-as-cain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=6 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-6-altar-the-word-curses-satan
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The "Word" Elohim sends to curse Satan in 2 Adam & Eve 6:12 is this same eternal Word who was with Elohim from the beginning.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae6_lookup sv, _session253_2ae6_lookup tv
 WHERE t.slug='2-adam-eve-6-altar-the-word-curses-satan'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=6 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 50:15 — *And call upon me in the day of trouble: I will deliver thee, and thou shalt glorify me.* Seth spreading his hands at the altar and seeking deliverance in 2 Adam & Eve 6:11 is exactly this calling-upon in the day of trouble, and Yahuah answers.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae6_lookup sv, _session253_2ae6_lookup tv
 WHERE t.slug='2-adam-eve-6-altar-the-word-curses-satan'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=6 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=50 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'James 4:7 — *Submit yourselves therefore to Elohim (God). Resist the devil, and he will flee from you.* When the Word curses Satan and he flees in 2 Adam & Eve 6:12, the everlasting pattern is shown: the adversary cannot stand before submission to Elohim.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae6_lookup sv, _session253_2ae6_lookup tv
 WHERE t.slug='2-adam-eve-6-altar-the-word-curses-satan'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=6 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=4 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ephesians 6:11 — *Put on the whole armour of Elohim (God), that ye may be able to stand against the wiles of the devil.* Seth''s confidence that at the altar Satan shall be unable to hurt him in 2 Adam & Eve 6:13 is the same standing against the wiles of the devil that Yahuah''s armour secures.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae6_lookup sv, _session253_2ae6_lookup tv
 WHERE t.slug='2-adam-eve-6-altar-the-word-curses-satan'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=6 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=6 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-6-adam-unmasks-cave-of-treasures
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* The "angel" Adam unmasks as Satan in 2 Adam & Eve 6:16 is this same old serpent who deceiveth the whole world.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae6_lookup sv, _session253_2ae6_lookup tv
 WHERE t.slug='2-adam-eve-6-adam-unmasks-cave-of-treasures'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=6 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=12 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 91:11 — *For he shall give his angels charge over thee, to keep thee in all thy ways.* Adam and Eve never parting from Seth thereafter in 2 Adam & Eve 6:17 mirrors the charge to keep the seed in all his ways against the deceiver.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae6_lookup sv, _session253_2ae6_lookup tv
 WHERE t.slug='2-adam-eve-6-adam-unmasks-cave-of-treasures'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=6 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=91 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 2:11 — *And when they were come into the house, they saw the young child with Mary his mother, and fell down, and worshipped him: and when they had opened their treasures, they presented unto him gifts; gold, and frankincense, and myrrh.* The treasures rejoiced over in the Cave in 2 Adam & Eve 6:16 are the very gold, frankincense, and myrrh kept by Adam''s line against the coming of the Saviour.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae6_lookup sv, _session253_2ae6_lookup tv
 WHERE t.slug='2-adam-eve-6-adam-unmasks-cave-of-treasures'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=6 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=2 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

