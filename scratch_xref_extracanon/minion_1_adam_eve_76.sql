-- ----- fragment: minion_1adameve_76.sql (session253 1-adam-eve 76) -----
-- Source anchor: adam-eve-conflict/1-adam-eve ch76. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1ae76 (view _session253_1ae76_lookup). Sort band base 65875, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1ae76_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-adam-eve-76-two-seed-offerings
  ('adam-eve-conflict', '1-adam-eve', 76, 1, 'canon', 'genesis', 4, 5, 'free', E'Genesis 4:5 — *But unto Cain and to his offering he had not respect. And Cain was very wroth, and his countenance fell.* Cain''s rejected offering in Genesis is the same hard heart that in 1 Adam and Eve 76:1-2 stays behind and will not go up to offer.'),
  ('adam-eve-conflict', '1-adam-eve', 76, 3, 'canon', 'genesis', 4, 4, 'free', E'Genesis 4:4 — *And Abel, he also brought of the firstlings of his flock and of the fat thereof. And Yahuah (LORD) had respect unto Abel and to his offering:* Abel''s love of the offering in 1 Adam and Eve 76:3 is the heart behind the accepted firstlings of Genesis.'),
  ('adam-eve-conflict', '1-adam-eve', 76, 3, 'canon', 'hebrews', 11, 4, 'free', E'Hebrews 11:4 — *By faith Abel offered unto Elohim (God) a more excellent sacrifice than Cain, by which he obtained witness that he was righteous, Elohim (God) testifying of his gifts: and by it he being dead yet speaketh.* Abel''s meek, fasting, praying devotion in 1 Adam and Eve 76:3 is the faith Hebrews crowns as righteous.'),
  ('adam-eve-conflict', '1-adam-eve', 76, 1, 'canon', '1-john', 3, 12, 'free', E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous.* John reads the two seed-lines exactly as 1 Adam and Eve 76:1 frames them — the hard-hearted son of the wicked one over against the righteous brother.'),
  -- thread: 1-adam-eve-76-cave-gold-incense-myrrh
  ('adam-eve-conflict', '1-adam-eve', 76, 4, 'canon', 'matthew', 2, 11, 'free', E'Matthew 2:11 — *And when they were come into the house, they saw the young child with Mary his mother, and fell down, and worshipped him: and when they had opened their treasures, they presented unto him gifts; gold, and frankincense, and myrrh.* The golden rods, incense, and myrrh of the Cave of Treasures in 1 Adam and Eve 76:4 are the very gifts the magi carry to the Messiah.'),
  -- thread: 1-adam-eve-76-satan-as-a-man-vs-abel
  ('adam-eve-conflict', '1-adam-eve', 76, 7, 'canon', '2-corinthians', 11, 14, 'free', E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* The figure of a man Satan wears in 1 Adam and Eve 76:7 is the same transformation Paul warns of.'),
  ('adam-eve-conflict', '1-adam-eve', 76, 7, 'canon', '1-peter', 5, 8, 'free', E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour:* Satan''s threat to kill Abel and make him perish in 1 Adam and Eve 76:7 is the devouring adversary Peter says still prowls.'),
  ('adam-eve-conflict', '1-adam-eve', 76, 8, 'canon', 'romans', 16, 20, 'free', E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* Abel driving Satan away by prayer in 1 Adam and Eve 76:8 is the early sign of the promise that Yahuah crushes the adversary under His people''s feet.'),
  -- thread: 1-adam-eve-76-satan-incites-cain-murder
  ('adam-eve-conflict', '1-adam-eve', 76, 11, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Satan''s whisper to kill Abel in 1 Adam and Eve 76:11 is the serpent''s enmity striking at the woman''s seed from the very first generation.'),
  ('adam-eve-conflict', '1-adam-eve', 76, 12, 'canon', 'john', 8, 44, 'free', E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* The devil remaining in Cain''s heart to kill his brother in 1 Adam and Eve 76:12 is the murderer and liar from the beginning Yahusha exposes.'),
  ('adam-eve-conflict', '1-adam-eve', 76, 10, 'canon', '1-john', 3, 12, 'free', E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous.* Satan''s lie planted in Cain by night in 1 Adam and Eve 76:10 is why John says Cain was of the wicked one.'),
  ('adam-eve-conflict', '1-adam-eve', 76, 12, 'jasher', 'jasher', 1, 16, 'extras', E'Jasher 1:16 — *And to Cain and his offering Yahuah (the Lord) did not turn, and he did not incline to it, for he had brought from the inferior fruit of the ground before Yahuah (the Lord), and Cain was jealous against his brother Abel on account of this, and he sought a pretext to slay him.* Jasher names the jealousy and sought pretext that 1 Adam and Eve 76:12 says Satan kept alive in Cain''s heart.'),
  ('adam-eve-conflict', '1-adam-eve', 76, 11, 'jubilees', 'jubilees', 4, 2, 'extras', E'Jubilees 4:2 — *And in the first (year) of the third jubilee, Cain slew Abel because Elohim (God) accepted the sacrifice of Abel, and did not accept the offering of Cain.* Jubilees gives the outcome of the murder Satan urges in 1 Adam and Eve 76:11 — Abel slain over the accepted offering.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1ae76_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1ae76_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-76-two-seed-offerings',
       E'The two children: hard-hearted Cain, the offering-loving Abel',
       E'From the first generation outside Eden the seed splits into two lines. *And the children began to grow stronger and taller; but Cain was hard-hearted, and ruled over his younger brother* (1 Adam and Eve 76:1), while *as to Abel, he had a meek heart, and was obedient to his father and mother. He frequently moved them to make an offering, because he loved it. He prayed and fasted a lot* (1 Adam and Eve 76:3). Genesis tells the same divide at the altar — *And Abel, he also brought of the firstlings of his flock and of the fat thereof. And Yahuah (LORD) had respect unto Abel and to his offering* (Genesis 4:4), but *unto Cain and to his offering he had not respect* (Genesis 4:5). The writer to the Hebrews names the difference faith, not blood: *By faith Abel offered unto Elohim (God) a more excellent sacrifice than Cain, by which he obtained witness that he was righteous* (Hebrews 11:4). And John reaches back to this very chapter to mark the two seed-lines — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous* (1 John 3:12). It ain''t new: the war over the offering is the war over the seed.',
       sv.verse_id, ev.verse_id, 'extras', 65875
  FROM _session253_1ae76_lookup sv, _session253_1ae76_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=76 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=76 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-76-cave-gold-incense-myrrh',
       E'The Cave of Treasures: gold, incense, and myrrh kept against the Saviour',
       E'Abel comes into the cave and sees the treasure laid up for the coming One. *As he was coming into the Cave of Treasures, and saw the golden rods, the incense and the myrrh, he asked his parents, Adam and Eve, to tell him about them and asked, "Where did you get these from?"* (1 Adam and Eve 76:4), and his father *told him of the works of Elohim (God), and of the garden* (1 Adam and Eve 76:6). Ages later the same three gifts are carried to the manger by the wise men — *and when they had opened their treasures, they presented unto him gifts; gold, and frankincense, and myrrh* (Matthew 2:11). The gold, the incense, and the myrrh of the cave are the gold, frankincense, and myrrh of Bethlehem: the treasure Adam guarded was always for the One who would come and save. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 65878
  FROM _session253_1ae76_lookup sv, _session253_1ae76_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=76 AND sv.verse_number=4
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=76 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-76-satan-as-a-man-vs-abel',
       E'Satan transformed: the night-figure that threatens Abel, the angel that comforts',
       E'Satan comes to the praying Abel disguised, exactly as he comes throughout this book. *While he was praying, Satan appeared to him under the figure of a man, who said to him, "You have frequently moved your father into making offerings, fasting and praying, therefore I will kill you, and make you perish from this world"* (1 Adam and Eve 76:7). Paul names the disguise: *Satan himself is transformed into an angel of light* (2 Corinthians 11:14); Peter names his hunger: *your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour* (1 Peter 5:8). But Abel *prayed to Elohim (God), and drove away Satan from him* (1 Adam and Eve 76:8), and the true angel answers the false figure: *Be not afraid of the figure which appeared to you in the night... For, look, Yahuah (Lord) had accepted your prayer* (1 Adam and Eve 76:8). The deceiver from the beginning meets the prayer that resists him. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 65881
  FROM _session253_1ae76_lookup sv, _session253_1ae76_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=76 AND sv.verse_number=7
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=76 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-76-satan-incites-cain-murder',
       E'The lie in Cain''s heart: the serpent strikes at the seed through the first murder',
       E'Now the deceiver works the other brother. *Satan came to him by night, showed himself and said to him, "Since Adam and Eve love your brother Abel so much more than they love you..."* (1 Adam and Eve 76:10), and presses him: *Now before they do that, I am telling you that you should kill your brother* (1 Adam and Eve 76:11), so that *the devil remained behind in Cain''s heart, and frequently aspired to kill his brother* (1 Adam and Eve 76:12). This is the enmity Yahuah declared at the gate of Eden — *I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel* (Genesis 3:15); the serpent strikes first at the seed through the first murder. Yahusha names the murderer behind Cain''s hand: *He was a murderer from the beginning, and abode not in the truth, because there is no truth in him* (John 8:44). The restored histories tell the same scene — *Cain was jealous against his brother Abel on account of this, and he sought a pretext to slay him* (Jasher 1:16), and *Cain slew Abel because Elohim (God) accepted the sacrifice of Abel, and did not accept the offering of Cain* (Jubilees 4:2). It ain''t new: the seed-war is as old as the first two brothers.',
       sv.verse_id, ev.verse_id, 'extras', 65884
  FROM _session253_1ae76_lookup sv, _session253_1ae76_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=76 AND sv.verse_number=10
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=76 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-adam-eve-76-two-seed-offerings
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:5 — *But unto Cain and to his offering he had not respect. And Cain was very wroth, and his countenance fell.* Cain''s rejected offering in Genesis is the same hard heart that in 1 Adam and Eve 76:1-2 stays behind and will not go up to offer.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae76_lookup sv, _session253_1ae76_lookup tv
 WHERE t.slug='1-adam-eve-76-two-seed-offerings'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=76 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 4:4 — *And Abel, he also brought of the firstlings of his flock and of the fat thereof. And Yahuah (LORD) had respect unto Abel and to his offering:* Abel''s love of the offering in 1 Adam and Eve 76:3 is the heart behind the accepted firstlings of Genesis.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae76_lookup sv, _session253_1ae76_lookup tv
 WHERE t.slug='1-adam-eve-76-two-seed-offerings'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=76 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 11:4 — *By faith Abel offered unto Elohim (God) a more excellent sacrifice than Cain, by which he obtained witness that he was righteous, Elohim (God) testifying of his gifts: and by it he being dead yet speaketh.* Abel''s meek, fasting, praying devotion in 1 Adam and Eve 76:3 is the faith Hebrews crowns as righteous.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae76_lookup sv, _session253_1ae76_lookup tv
 WHERE t.slug='1-adam-eve-76-two-seed-offerings'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=76 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous.* John reads the two seed-lines exactly as 1 Adam and Eve 76:1 frames them — the hard-hearted son of the wicked one over against the righteous brother.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae76_lookup sv, _session253_1ae76_lookup tv
 WHERE t.slug='1-adam-eve-76-two-seed-offerings'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=76 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-76-cave-gold-incense-myrrh
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 2:11 — *And when they were come into the house, they saw the young child with Mary his mother, and fell down, and worshipped him: and when they had opened their treasures, they presented unto him gifts; gold, and frankincense, and myrrh.* The golden rods, incense, and myrrh of the Cave of Treasures in 1 Adam and Eve 76:4 are the very gifts the magi carry to the Messiah.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae76_lookup sv, _session253_1ae76_lookup tv
 WHERE t.slug='1-adam-eve-76-cave-gold-incense-myrrh'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=76 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=2 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-76-satan-as-a-man-vs-abel
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* The figure of a man Satan wears in 1 Adam and Eve 76:7 is the same transformation Paul warns of.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae76_lookup sv, _session253_1ae76_lookup tv
 WHERE t.slug='1-adam-eve-76-satan-as-a-man-vs-abel'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=76 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=11 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour:* Satan''s threat to kill Abel and make him perish in 1 Adam and Eve 76:7 is the devouring adversary Peter says still prowls.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae76_lookup sv, _session253_1ae76_lookup tv
 WHERE t.slug='1-adam-eve-76-satan-as-a-man-vs-abel'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=76 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* Abel driving Satan away by prayer in 1 Adam and Eve 76:8 is the early sign of the promise that Yahuah crushes the adversary under His people''s feet.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae76_lookup sv, _session253_1ae76_lookup tv
 WHERE t.slug='1-adam-eve-76-satan-as-a-man-vs-abel'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=76 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=16 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-76-satan-incites-cain-murder
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Satan''s whisper to kill Abel in 1 Adam and Eve 76:11 is the serpent''s enmity striking at the woman''s seed from the very first generation.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae76_lookup sv, _session253_1ae76_lookup tv
 WHERE t.slug='1-adam-eve-76-satan-incites-cain-murder'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=76 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* The devil remaining in Cain''s heart to kill his brother in 1 Adam and Eve 76:12 is the murderer and liar from the beginning Yahusha exposes.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae76_lookup sv, _session253_1ae76_lookup tv
 WHERE t.slug='1-adam-eve-76-satan-incites-cain-murder'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=76 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous.* Satan''s lie planted in Cain by night in 1 Adam and Eve 76:10 is why John says Cain was of the wicked one.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae76_lookup sv, _session253_1ae76_lookup tv
 WHERE t.slug='1-adam-eve-76-satan-incites-cain-murder'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=76 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jasher 1:16 — *And to Cain and his offering Yahuah (the Lord) did not turn, and he did not incline to it, for he had brought from the inferior fruit of the ground before Yahuah (the Lord), and Cain was jealous against his brother Abel on account of this, and he sought a pretext to slay him.* Jasher names the jealousy and sought pretext that 1 Adam and Eve 76:12 says Satan kept alive in Cain''s heart.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae76_lookup sv, _session253_1ae76_lookup tv
 WHERE t.slug='1-adam-eve-76-satan-incites-cain-murder'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=76 AND sv.verse_number=12
   AND tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=1 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 4:2 — *And in the first (year) of the third jubilee, Cain slew Abel because Elohim (God) accepted the sacrifice of Abel, and did not accept the offering of Cain.* Jubilees gives the outcome of the murder Satan urges in 1 Adam and Eve 76:11 — Abel slain over the accepted offering.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae76_lookup sv, _session253_1ae76_lookup tv
 WHERE t.slug='1-adam-eve-76-satan-incites-cain-murder'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=76 AND sv.verse_number=11
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

