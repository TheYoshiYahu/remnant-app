-- ----- fragment: minion_judith_10.sql (session253 judith 10) -----
-- Source anchor: apocrypha/judith ch10. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: jdt10 (view _session253_jdt10_lookup). Sort band base 60225, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_jdt10_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: judith-10-arrayed-for-the-king
  ('apocrypha', 'judith', 10, 3, 'canon', 'esther', 5, 1, 'free', E'Esther 5:1 — *Now it came to pass on the third day, that Esther put on her royal apparel, and stood in the inner court of the king’s house, over against the king’s house: and the king sat upon his royal throne in the royal house, over against the gate of the house.* As Esther put off mourning and put on royal apparel to stand at peril in the tyrant''s court, so Judith puts off her widow''s sackcloth and arrays herself in gladness to go down into Holofernes'' camp.'),
  ('apocrypha', 'judith', 10, 4, 'canon', 'esther', 5, 2, 'free', E'Esther 5:2 — *And it was so, when the king saw Esther the queen standing in the court, that she obtained favour in his sight: and the king held out to Esther the golden sceptre that was in his hand. So Esther drew near, and touched the top of the sceptre.* The favour Esther obtained in the king''s sight is the very favour Judith decks herself to win, that the eyes of the proud might be turned toward Yahuah''s sent vessel.'),
  -- thread: judith-10-beauty-and-the-fear-of-yahuah
  ('apocrypha', 'judith', 10, 7, 'canon', 'proverbs', 31, 30, 'free', E'Proverbs 31:30 — *Favour is deceitful, and beauty is vain: but a woman that feareth Yahuah (LORD), she shall be praised.* The men of the city wonder greatly at Judith''s beauty, but the praise that holds is for the woman beneath the array who feareth Yahuah and goes at His bidding.'),
  ('apocrypha', 'judith', 10, 8, 'canon', 'proverbs', 31, 25, 'free', E'Proverbs 31:25 — *Strength and honour are her clothing; and she shall rejoice in time to come.* Beneath the garments of gladness Judith goes out clothed in strength and honour, that her enterprise may end to the glory of Israel and the exaltation of Jerusalem.'),
  -- thread: judith-10-into-the-enemys-tent
  ('apocrypha', 'judith', 10, 23, 'canon', 'psalms', 23, 5, 'free', E'Psalm 23:5 — *Thou preparest a table before me in the presence of mine enemies: thou anointest my head with oil; my cup runneth over.* As Judith is brought into Holofernes'' tent and set in safety before him, Yahuah spreads His servant''s table in the very presence of the enemies who mean her death.'),
  ('apocrypha', 'judith', 10, 22, 'canon', 'judges', 4, 18, 'free', E'Judges 4:18 — *And Jael went out to meet Sisera, and said unto him, Turn in, my lord, turn in to me; fear not. And when he had turned in unto her into the tent, she covered him with a mantle.* As Jael drew the enemy captain into her tent to his undoing, Holofernes comes out and draws Judith in — the proud commander welcoming the very hand that will fell him.'),
  -- thread: judith-10-the-proud-cast-down
  ('apocrypha', 'judith', 10, 19, 'canon', 'luke', 1, 51, 'free', E'Luke 1:51 — *He hath shewed strength with his arm; he hath scattered the proud in the imagination of their hearts.* The Assyrians marvel at the people that have such women among them, never seeing that this is Yahuah scattering the proud by the lowly, as Mary later sings.'),
  ('apocrypha', 'judith', 10, 19, 'canon', 'luke', 1, 52, 'free', E'Luke 1:52 — *He hath put down the mighty from their seats, and exalted them of low degree.* The mighty Holofernes, who thinks no man of Israel should be left alive, is the very one Yahuah will put down from his seat by the hand of a low-estate widow.'),
  ('apocrypha', 'judith', 10, 19, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The woman set in the enemy''s tent to crush the head of the proud captain is one more echo of the first promise — the serpent''s head bruised by the woman and her seed.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_jdt10_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_jdt10_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-10-arrayed-for-the-king',
       E'Arrayed in gladness — the woman goes in at peril',
       E'Judith strips the sackcloth of her widowhood and arrays herself to walk straight into the camp of the tyrant: *And pulled off the sackcloth which she had on, and put off the garments of her widowhood, and washed her body all over with water, and anointed herself with precious ointment, and braided the hair of her head, and put on a tire upon it, and put on her garments of gladness, with which she was clad during the life of Manasses her husband.* (Judith 10:3) She is the deliverer who, of her own will, goes down into the enemy''s reach to undo him. So Esther before her put off mourning and put on the royal apparel to stand in the king''s court where the unbidden are slain: *Now it came to pass on the third day, that Esther put on her royal apparel, and stood in the inner court of the king''s house, over against the king''s house: and the king sat upon his royal throne in the royal house, over against the gate of the house.* (Esther 5:1) And the favour the queen obtained is the favour Judith goes seeking — the LORD turning the heart of the proud toward His sent vessel: *And it was so, when the king saw Esther the queen standing in the court, that she obtained favour in his sight: and the king held out to Esther the golden sceptre that was in his hand. So Esther drew near, and touched the top of the sceptre.* (Esther 5:2) It ain''t new — the weak woman set against the kingdom-of-man is Yahuah''s chosen instrument, going in willingly where the strong cannot.',
       sv.verse_id, ev.verse_id, 'extras', 60225
  FROM _session253_jdt10_lookup sv, _session253_jdt10_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=10 AND sv.verse_number=2
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=10 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-10-beauty-and-the-fear-of-yahuah',
       E'Her beauty and the favour of Yahuah',
       E'The elders behold her transformed and send her forth with a blessing that names where the victory really lies: *Yahuah (God), Yahuah (God) of our fathers give you favour, and accomplish your enterprizes to the glory of the children of Yashar''el (Israel), and to the exaltation of Jerusalem. Then they worshipped Yahuah (God).* (Judith 10:8) Her beauty is the bait; the deliverance is Yahuah''s. So Proverbs weighs beauty against the fear of the LORD and finds the fear the lasting thing: *Favour is deceitful, and beauty is vain: but a woman that feareth Yahuah (LORD), she shall be praised.* (Proverbs 31:30) Judith''s worth is not the tire upon her head but the woman beneath it who feareth Yahuah — clothed, like the virtuous woman, with strength: *Strength and honour are her clothing; and she shall rejoice in time to come.* (Proverbs 31:25) The camp marvels at her face; heaven marks her fear.',
       sv.verse_id, ev.verse_id, 'extras', 60228
  FROM _session253_jdt10_lookup sv, _session253_jdt10_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=10 AND sv.verse_number=7
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=10 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-10-into-the-enemys-tent',
       E'Brought to the tent — a table among enemies',
       E'The deliverer is led, escorted by an hundred men, straight to the canopied bed of the tyrant: *Then they chose out of them an hundred men to accompany her and her maid; and they brought her to the tent of Holofernes.* (Judith 10:17) She comes before him spread in purple and gold and is set, unharmed, in the very heart of the enemy''s power: *Now Holofernes rested upon his bed under a canopy, which was woven with purple, and gold, and emeralds, and precious stones.* (Judith 10:21) This is the shepherd''s table laid out in the open camp — Yahuah seating His servant in safety in the presence of those who mean her death: *Thou preparest a table before me in the presence of mine enemies: thou anointest my head with oil; my cup runneth over.* (Psalm 23:5) And it is Jael''s tent over again, where the captain of the proud army is welcomed in only to fall by a woman''s hand: *And Jael went out to meet Sisera, and said unto him, Turn in, my lord, turn in to me; fear not. And when he had turned in unto her into the tent, she covered him with a mantle.* (Judges 4:18) The instrument of Yahuah walks in among the proud, and the tent that should be her grave becomes the seat of their undoing.',
       sv.verse_id, ev.verse_id, 'extras', 60231
  FROM _session253_jdt10_lookup sv, _session253_jdt10_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=10 AND sv.verse_number=17
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=10 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-10-the-proud-cast-down',
       E'Who would despise this people — the proud confounded by the weak',
       E'The Assyrian camp gapes at her and at the people that bred her, and even the enemy confesses Israel''s strange greatness: *And they wondered at her beauty, and admired the children of Yashar''el (Israel) because of her, and every one said to his neighbour, Who would despise this people, that have among them such women? surely it is not good that one man of them be left who being let go might deceive the whole earth.* (Judith 10:19) The tyrant Holofernes, like Nebuchadnezzar who sent him, demands the whole earth bow — the kingdom-of-man pattern that Yahuah dismantles not by armies but by the despised. So Mary sings the rule of the King who topples the proud and lifts the lowly: *He hath shewed strength with his arm; he hath scattered the proud in the imagination of their hearts.* (Luke 1:51) The mighty are unseated and the low estate is exalted: *He hath put down the mighty from their seats, and exalted them of low degree.* (Luke 1:52) And the oldest promise is the same — the bruising of the serpent''s head comes through the woman and her seed: *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* (Genesis 3:15) The camp marvels at the woman in their midst, not knowing she is the LORD''s appointed bruise upon the head of the proud.',
       sv.verse_id, ev.verse_id, 'extras', 60234
  FROM _session253_jdt10_lookup sv, _session253_jdt10_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=10 AND sv.verse_number=18
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=10 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: judith-10-arrayed-for-the-king
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Esther 5:1 — *Now it came to pass on the third day, that Esther put on her royal apparel, and stood in the inner court of the king’s house, over against the king’s house: and the king sat upon his royal throne in the royal house, over against the gate of the house.* As Esther put off mourning and put on royal apparel to stand at peril in the tyrant''s court, so Judith puts off her widow''s sackcloth and arrays herself in gladness to go down into Holofernes'' camp.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt10_lookup sv, _session253_jdt10_lookup tv
 WHERE t.slug='judith-10-arrayed-for-the-king'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=10 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='esther' AND tv.chapter_number=5 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Esther 5:2 — *And it was so, when the king saw Esther the queen standing in the court, that she obtained favour in his sight: and the king held out to Esther the golden sceptre that was in his hand. So Esther drew near, and touched the top of the sceptre.* The favour Esther obtained in the king''s sight is the very favour Judith decks herself to win, that the eyes of the proud might be turned toward Yahuah''s sent vessel.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt10_lookup sv, _session253_jdt10_lookup tv
 WHERE t.slug='judith-10-arrayed-for-the-king'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=10 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='esther' AND tv.chapter_number=5 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-10-beauty-and-the-fear-of-yahuah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 31:30 — *Favour is deceitful, and beauty is vain: but a woman that feareth Yahuah (LORD), she shall be praised.* The men of the city wonder greatly at Judith''s beauty, but the praise that holds is for the woman beneath the array who feareth Yahuah and goes at His bidding.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt10_lookup sv, _session253_jdt10_lookup tv
 WHERE t.slug='judith-10-beauty-and-the-fear-of-yahuah'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=10 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=31 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 31:25 — *Strength and honour are her clothing; and she shall rejoice in time to come.* Beneath the garments of gladness Judith goes out clothed in strength and honour, that her enterprise may end to the glory of Israel and the exaltation of Jerusalem.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt10_lookup sv, _session253_jdt10_lookup tv
 WHERE t.slug='judith-10-beauty-and-the-fear-of-yahuah'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=10 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=31 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-10-into-the-enemys-tent
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 23:5 — *Thou preparest a table before me in the presence of mine enemies: thou anointest my head with oil; my cup runneth over.* As Judith is brought into Holofernes'' tent and set in safety before him, Yahuah spreads His servant''s table in the very presence of the enemies who mean her death.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt10_lookup sv, _session253_jdt10_lookup tv
 WHERE t.slug='judith-10-into-the-enemys-tent'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=10 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=23 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Judges 4:18 — *And Jael went out to meet Sisera, and said unto him, Turn in, my lord, turn in to me; fear not. And when he had turned in unto her into the tent, she covered him with a mantle.* As Jael drew the enemy captain into her tent to his undoing, Holofernes comes out and draws Judith in — the proud commander welcoming the very hand that will fell him.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt10_lookup sv, _session253_jdt10_lookup tv
 WHERE t.slug='judith-10-into-the-enemys-tent'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=10 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=4 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-10-the-proud-cast-down
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Luke 1:51 — *He hath shewed strength with his arm; he hath scattered the proud in the imagination of their hearts.* The Assyrians marvel at the people that have such women among them, never seeing that this is Yahuah scattering the proud by the lowly, as Mary later sings.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt10_lookup sv, _session253_jdt10_lookup tv
 WHERE t.slug='judith-10-the-proud-cast-down'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=10 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=51
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Luke 1:52 — *He hath put down the mighty from their seats, and exalted them of low degree.* The mighty Holofernes, who thinks no man of Israel should be left alive, is the very one Yahuah will put down from his seat by the hand of a low-estate widow.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt10_lookup sv, _session253_jdt10_lookup tv
 WHERE t.slug='judith-10-the-proud-cast-down'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=10 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=52
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The woman set in the enemy''s tent to crush the head of the proud captain is one more echo of the first promise — the serpent''s head bruised by the woman and her seed.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt10_lookup sv, _session253_jdt10_lookup tv
 WHERE t.slug='judith-10-the-proud-cast-down'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=10 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

