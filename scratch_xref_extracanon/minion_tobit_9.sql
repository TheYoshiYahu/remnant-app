-- ----- fragment: minion_tobit_09.sql (session253 tobit 9) -----
-- Source anchor: apocrypha/tobit ch9. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: tob9 (view _session253_tob9_lookup). Sort band base 59800, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_tob9_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: tobit-9-the-errand-entrusted
  ('apocrypha', 'tobit', 9, 2, 'canon', 'genesis', 24, 33, 'free', E'Genesis 24:33 — *And there was set meat before him to eat: but he said, I will not eat, until I have told mine errand. And he said, Speak on.* Abraham''s servant, like Raphael sent for Gabael''s money, holds his commission above his own comfort until the errand is discharged.'),
  ('apocrypha', 'tobit', 9, 4, 'canon', 'genesis', 24, 56, 'free', E'Genesis 24:56 — *And he said unto them, Hinder me not, seeing Yahuah (LORD) hath prospered my way; send me away that I may go to my master.* As Tobias frets that his father counteth the days, the faithful servant likewise refuses delay, pressing home the instant the charge is complete.'),
  ('apocrypha', 'tobit', 9, 2, 'canon', 'matthew', 24, 45, 'free', E'Matthew 24:45 — *Who then is a faithful and wise servant, whom his lord hath made ruler over his household, to give them meat in due season?* Raphael, entrusted with the camels and the money for the wedding, is the very image of the trusted servant set over his lord''s affairs.'),
  ('apocrypha', 'tobit', 9, 5, 'canon', 'matthew', 24, 46, 'free', E'Matthew 24:46 — *Blessed is that servant, whom his lord when he cometh shall find so doing.* Raphael is found doing exactly his charge — lodging with Gabael and receiving the sealed bags — the blessed faithfulness the Master praises.'),
  ('apocrypha', 'tobit', 9, 5, 'apocrypha', 'tobit', 12, 14, 'extras', E'Tobit 12:14 — *And now Yahuah (God) has sent me to heal you and Sara your daughter in law.* The errand-runner of chapter 9 is unveiled three chapters on as the very angel Yahuah sent, carrying the household''s good far beyond a sack of silver.'),
  -- thread: tobit-9-the-angel-sent-and-prospered
  ('apocrypha', 'tobit', 9, 5, 'canon', 'genesis', 24, 40, 'free', E'Genesis 24:40 — *And he said unto me, Yahuah (LORD), before whom I walk, will send his angel with thee, and prosper thy way; and thou shalt take a wife for my son of my kindred, and of my father''s house:* The sealed bags pass freely to Raphael because the same promised angel goes with him to prosper the errand.'),
  ('apocrypha', 'tobit', 9, 2, 'canon', 'psalms', 91, 11, 'free', E'Psalm 91:11 — *For he shall give his angels charge over thee, to keep thee in all thy ways.* Tobias''s long journey to Rages is kept safe by the very angel-charge the Psalm promises the trusting traveller.'),
  ('apocrypha', 'tobit', 9, 5, 'canon', 'luke', 1, 19, 'free', E'Luke 1:19 — *And the angel answering said unto him, I am Gabriel, that stand in the presence of Elohim (God); and am sent to speak unto thee, and to shew thee these glad tidings.* The companion who goes out and returns for Tobias is, like Gabriel, an angel sent forth from before the throne.'),
  ('apocrypha', 'tobit', 9, 2, 'apocrypha', 'tobit', 12, 15, 'extras', E'Tobit 12:15 — *I am Raphael, one of the seven holy angels, which present the prayers of the saints, and which go in and out before the glory of the Holy One.* The Azarias dispatched to Gabael is later revealed as Raphael himself, one who goes in and out before Yahuah''s glory.'),
  -- thread: tobit-9-the-wedding-and-the-blessed-bride
  ('apocrypha', 'tobit', 9, 3, 'canon', 'genesis', 24, 55, 'free', E'Genesis 24:55 — *And her brother and her mother said, Let the damsel abide with us a few days, at the least ten; after that she shall go.* As Raguel swears Tobias shall not yet depart, so Rebekah''s kin would keep the bride a season before sending her on her way.'),
  ('apocrypha', 'tobit', 9, 6, 'canon', 'genesis', 24, 60, 'free', E'Genesis 24:60 — *And they blessed Rebekah, and said unto her, Thou art our sister, be thou the mother of thousands of millions, and let thy seed possess the gate of those which hate them.* Tobias blessing his wife at the wedding echoes the kindred''s covenant-blessing over Rebekah, the seed of the house carried forward.'),
  ('apocrypha', 'tobit', 9, 6, 'canon', 'genesis', 24, 67, 'free', E'Genesis 24:67 — *And Isaac brought her into his mother Sarah''s tent, and took Rebekah, and she became his wife; and he loved her: and Isaac was comforted after his mother''s death.* The morning union and blessing of Tobias and his wife answers the same pattern — the appointed bride received in love, the covenant household made whole.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_tob9_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_tob9_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-9-the-errand-entrusted',
       E'The Errand Entrusted — the faithful messenger sent to bring the treasure home',
       E'Tobias sends his angel-companion on the long road to recover the family pledge: *Then Tobias called Raphael, and said to him,* (Tobit 9:1) *Brother Azarias, take with you a servant, and two camels, and go to Rages of Media to Gabael, and bring me the money, and bring him to the wedding.* (Tobit 9:2). It ain''t new — this is the old pattern of the trusted servant sent out under oath to fetch what belongs to the house. Abraham''s eldest servant rises for the same errand and will not so much as eat until it is done: *And there was set meat before him to eat: but he said, I will not eat, until I have told mine errand. And he said, Speak on.* (Genesis 24:33), and when his work is finished he presses to return: *And he said unto them, Hinder me not, seeing Yahuah (LORD) hath prospered my way; send me away that I may go to my master.* (Genesis 24:56). The Master Himself names the servant who keeps such a charge: *Who then is a faithful and wise servant, whom his lord hath made ruler over his household, to give them meat in due season?* (Matthew 24:45) — *Blessed is that servant, whom his lord when he cometh shall find so doing.* (Matthew 24:46). And the companion on the road is no mere man: he is the one *Yahuah (God) has sent... to heal you and Sara your daughter in law* (Tobit 12:14), the messenger who carries the household''s good before the throne.',
       sv.verse_id, ev.verse_id, 'extras', 59800
  FROM _session253_tob9_lookup sv, _session253_tob9_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=9 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=9 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-9-the-angel-sent-and-prospered',
       E'The Angel Sent Before — the way made prosperous by an unseen escort',
       E'Raphael goes out and the sealed treasure is freely given into his hand: *So Raphael went out, and lodged with Gabael, and gave him the handwriting: who brought forth bags which were sealed up, and gave them to him.* (Tobit 9:5). The road is smooth because the traveller is no ordinary servant — he is an angel walking as a man. Abraham knew this provision: *And he said unto me, Yahuah (LORD), before whom I walk, will send his angel with thee, and prosper thy way...* (Genesis 24:40), and the Psalm sings the same guardianship: *For he shall give his angels charge over thee, to keep thee in all thy ways.* (Psalm 91:11). When such a messenger at last names himself, the word is always the word of one *sent*: in the Gospel, *And the angel answering said unto him, I am Gabriel, that stand in the presence of Elohim (God); and am sent to speak unto thee, and to shew thee these glad tidings.* (Luke 1:19) — even as Raphael will declare, *I am Raphael, one of the seven holy angels, which present the prayers of the saints, and which go in and out before the glory of the Holy One.* (Tobit 12:15).',
       sv.verse_id, ev.verse_id, 'extras', 59803
  FROM _session253_tob9_lookup sv, _session253_tob9_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=9 AND sv.verse_number=2
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=9 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-9-the-wedding-and-the-blessed-bride',
       E'The Wedding Prolonged — the bride blessed and the feast not cut short',
       E'The errand finished, the messenger brings the kinsman to the marriage and the bridegroom blesses his wife: *And early in the morning they went forth both together, and came to the wedding: and Tobias blessed his wife.* (Tobit 9:6) — for Raguel had pressed the feast: *For Raguel has sworn that I shall not depart.* (Tobit 9:3). It ain''t new — the kindred of Rebekah likewise held the bride a while and then sent her with a blessing: *And her brother and her mother said, Let the damsel abide with us a few days, at the least ten; after that she shall go.* (Genesis 24:55), and they sent her out under the covenant-word of fruitfulness: *And they blessed Rebekah, and said unto her, Thou art our sister, be thou the mother of thousands of millions, and let thy seed possess the gate of those which hate them.* (Genesis 24:60). The same covenant kindness — the seed kept, the house joined, the bride blessed — runs from the well of Nahor to the wedding of Raguel.',
       sv.verse_id, ev.verse_id, 'extras', 59806
  FROM _session253_tob9_lookup sv, _session253_tob9_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=9 AND sv.verse_number=3
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=9 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: tobit-9-the-errand-entrusted
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 24:33 — *And there was set meat before him to eat: but he said, I will not eat, until I have told mine errand. And he said, Speak on.* Abraham''s servant, like Raphael sent for Gabael''s money, holds his commission above his own comfort until the errand is discharged.'
  FROM cross_reference_threads t, cross_references x, _session253_tob9_lookup sv, _session253_tob9_lookup tv
 WHERE t.slug='tobit-9-the-errand-entrusted'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=9 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=24 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 24:56 — *And he said unto them, Hinder me not, seeing Yahuah (LORD) hath prospered my way; send me away that I may go to my master.* As Tobias frets that his father counteth the days, the faithful servant likewise refuses delay, pressing home the instant the charge is complete.'
  FROM cross_reference_threads t, cross_references x, _session253_tob9_lookup sv, _session253_tob9_lookup tv
 WHERE t.slug='tobit-9-the-errand-entrusted'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=9 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=24 AND tv.verse_number=56
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 24:45 — *Who then is a faithful and wise servant, whom his lord hath made ruler over his household, to give them meat in due season?* Raphael, entrusted with the camels and the money for the wedding, is the very image of the trusted servant set over his lord''s affairs.'
  FROM cross_reference_threads t, cross_references x, _session253_tob9_lookup sv, _session253_tob9_lookup tv
 WHERE t.slug='tobit-9-the-errand-entrusted'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=9 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=45
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 24:46 — *Blessed is that servant, whom his lord when he cometh shall find so doing.* Raphael is found doing exactly his charge — lodging with Gabael and receiving the sealed bags — the blessed faithfulness the Master praises.'
  FROM cross_reference_threads t, cross_references x, _session253_tob9_lookup sv, _session253_tob9_lookup tv
 WHERE t.slug='tobit-9-the-errand-entrusted'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=9 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=46
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Tobit 12:14 — *And now Yahuah (God) has sent me to heal you and Sara your daughter in law.* The errand-runner of chapter 9 is unveiled three chapters on as the very angel Yahuah sent, carrying the household''s good far beyond a sack of silver.'
  FROM cross_reference_threads t, cross_references x, _session253_tob9_lookup sv, _session253_tob9_lookup tv
 WHERE t.slug='tobit-9-the-errand-entrusted'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=9 AND sv.verse_number=5
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=12 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-9-the-angel-sent-and-prospered
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 24:40 — *And he said unto me, Yahuah (LORD), before whom I walk, will send his angel with thee, and prosper thy way; and thou shalt take a wife for my son of my kindred, and of my father''s house:* The sealed bags pass freely to Raphael because the same promised angel goes with him to prosper the errand.'
  FROM cross_reference_threads t, cross_references x, _session253_tob9_lookup sv, _session253_tob9_lookup tv
 WHERE t.slug='tobit-9-the-angel-sent-and-prospered'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=9 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=24 AND tv.verse_number=40
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 91:11 — *For he shall give his angels charge over thee, to keep thee in all thy ways.* Tobias''s long journey to Rages is kept safe by the very angel-charge the Psalm promises the trusting traveller.'
  FROM cross_reference_threads t, cross_references x, _session253_tob9_lookup sv, _session253_tob9_lookup tv
 WHERE t.slug='tobit-9-the-angel-sent-and-prospered'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=9 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=91 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Luke 1:19 — *And the angel answering said unto him, I am Gabriel, that stand in the presence of Elohim (God); and am sent to speak unto thee, and to shew thee these glad tidings.* The companion who goes out and returns for Tobias is, like Gabriel, an angel sent forth from before the throne.'
  FROM cross_reference_threads t, cross_references x, _session253_tob9_lookup sv, _session253_tob9_lookup tv
 WHERE t.slug='tobit-9-the-angel-sent-and-prospered'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=9 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Tobit 12:15 — *I am Raphael, one of the seven holy angels, which present the prayers of the saints, and which go in and out before the glory of the Holy One.* The Azarias dispatched to Gabael is later revealed as Raphael himself, one who goes in and out before Yahuah''s glory.'
  FROM cross_reference_threads t, cross_references x, _session253_tob9_lookup sv, _session253_tob9_lookup tv
 WHERE t.slug='tobit-9-the-angel-sent-and-prospered'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=9 AND sv.verse_number=2
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=12 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-9-the-wedding-and-the-blessed-bride
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 24:55 — *And her brother and her mother said, Let the damsel abide with us a few days, at the least ten; after that she shall go.* As Raguel swears Tobias shall not yet depart, so Rebekah''s kin would keep the bride a season before sending her on her way.'
  FROM cross_reference_threads t, cross_references x, _session253_tob9_lookup sv, _session253_tob9_lookup tv
 WHERE t.slug='tobit-9-the-wedding-and-the-blessed-bride'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=9 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=24 AND tv.verse_number=55
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 24:60 — *And they blessed Rebekah, and said unto her, Thou art our sister, be thou the mother of thousands of millions, and let thy seed possess the gate of those which hate them.* Tobias blessing his wife at the wedding echoes the kindred''s covenant-blessing over Rebekah, the seed of the house carried forward.'
  FROM cross_reference_threads t, cross_references x, _session253_tob9_lookup sv, _session253_tob9_lookup tv
 WHERE t.slug='tobit-9-the-wedding-and-the-blessed-bride'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=9 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=24 AND tv.verse_number=60
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 24:67 — *And Isaac brought her into his mother Sarah''s tent, and took Rebekah, and she became his wife; and he loved her: and Isaac was comforted after his mother''s death.* The morning union and blessing of Tobias and his wife answers the same pattern — the appointed bride received in love, the covenant household made whole.'
  FROM cross_reference_threads t, cross_references x, _session253_tob9_lookup sv, _session253_tob9_lookup tv
 WHERE t.slug='tobit-9-the-wedding-and-the-blessed-bride'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=9 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=24 AND tv.verse_number=67
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

