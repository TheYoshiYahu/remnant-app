-- ----- fragment: minion_1esdras_03.sql (session253 1-esdras 3) -----
-- Source anchor: apocrypha/1-esdras ch3. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1esd3 (view _session253_1esd3_lookup). Sort band base 62550, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1esd3_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-esdras-3-wine-is-the-strongest
  ('apocrypha', '1-esdras', 3, 10, 'canon', 'proverbs', 20, 1, 'free', E'Proverbs 20:1 — *Wine is a mocker, strong drink is raging: and whosoever is deceived thereby is not wise.* Where the guardsman crowns wine the strongest in 1 Esdras 3:10, the proverb names it a mocker that proves a man unwise.'),
  ('apocrypha', '1-esdras', 3, 18, 'canon', 'isaiah', 28, 7, 'free', E'Isaiah 28:7 — *But they also have erred through wine, and through strong drink are out of the way; the priest and the prophet have erred through strong drink, they are swallowed up of wine, they are out of the way through strong drink; they err in vision, they stumble in judgment.* The guardsman''s boast that wine *causeth all men to err* (1 Esdras 3:18) is Isaiah''s indictment, where even priest and prophet are made to err.'),
  ('apocrypha', '1-esdras', 3, 18, 'canon', 'hosea', 4, 11, 'free', E'Hosea 4:11 — *Whoredom and wine and new wine take away the heart.* What the guardsman calls strength in 1 Esdras 3:18, Hosea calls a robbery of the very heart it overcomes.'),
  ('apocrypha', '1-esdras', 3, 22, 'canon', 'ephesians', 5, 18, 'free', E'Ephesians 5:18 — *And be not drunk with wine, wherein is excess; but be filled with the Spirit.* Against the wine that makes men forget their love and *draw out swords* (1 Esdras 3:22), Paul sets the Spirit as the true filling and strength.'),
  -- thread: 1-esdras-3-the-king-is-strongest
  ('apocrypha', '1-esdras', 3, 11, 'canon', 'proverbs', 21, 1, 'free', E'Proverbs 21:1 — *The king''s heart is in the hand of Yahuah (LORD), as the rivers of water: he turneth it whithersoever he will.* The second guardsman''s verdict that *The king is strongest* (1 Esdras 3:11) meets the truth that the king''s own heart is turned by a higher Hand.'),
  ('apocrypha', '1-esdras', 3, 11, 'canon', 'ecclesiastes', 8, 4, 'free', E'Ecclesiastes 8:4 — *Where the word of a king is, there is power: and who may say unto him, What doest thou?* Qoheleth grants the guardsman his point — the king''s word is power — even as 1 Esdras 3:11 names the king strongest.'),
  ('apocrypha', '1-esdras', 3, 11, 'canon', 'daniel', 2, 21, 'free', E'Daniel 2:21 — *And he changeth the times and the seasons: he removeth kings, and setteth up kings: he giveth wisdom unto the wise, and knowledge to them that know understanding.* The king is strongest only as far as Elohim permits, for He removes and sets up kings — answering 1 Esdras 3:11.'),
  ('apocrypha', '1-esdras', 3, 11, 'canon', 'proverbs', 31, 5, 'free', E'Proverbs 31:5 — *Lest they drink, and forget the law, and pervert the judgment of any of the afflicted.* Even the strongest king stands under Torah, warned not to drink lest he forget the law — binding the king-thread back to the wine-thread of 1 Esdras 3:11.'),
  -- thread: 1-esdras-3-truth-bears-the-victory
  ('apocrypha', '1-esdras', 3, 15, 'canon', 'proverbs', 8, 15, 'free', E'Proverbs 8:15 — *By me kings reign, and princes decree justice.* As Darius takes the *royal seat of judgment* in 1 Esdras 3:15, it is Wisdom by whom kings reign and rightly judge.'),
  ('apocrypha', '1-esdras', 3, 12, 'canon', 'john', 18, 37, 'free', E'John 18:37 — *Pilate therefore said unto him, Art thou a king then? Yahusha (Jesus) answered, Thou sayest that I am a king. To this end was I born, and for this cause came I into the world, that I should bear witness unto the truth. Every one that is of the truth heareth my voice.* The guardsman''s claim that *Truth bears away the victory* (1 Esdras 3:12) is fulfilled in the King who is born to bear witness to the truth before an earthly judgment seat.'),
  ('apocrypha', '1-esdras', 3, 12, 'canon', 'john', 14, 6, 'free', E'John 14:6 — *Yahusha (Jesus) saith unto him, I am the way, the truth, and the life: no man cometh unto the Father, but by me.* The Truth that bears the victory in 1 Esdras 3:12 is named at last not as a maxim but as a Person.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1esd3_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1esd3_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-esdras-3-wine-is-the-strongest',
       E'Wine is the strongest — the first guardsman',
       E'The three young men of Darius''s guard stake their contest, and the first writes for wine: *The first wrote, Wine is the strongest.* (1 Esdras 3:10) He unfolds it — *O you men, how exceeding strong is wine! it causeth all men to err that drink it* (1 Esdras 3:18) — *And when they are in their cups, they forget their love both to friends and brothers, and a little after draw out swords* (1 Esdras 3:22). It ain''t new: the wise men of Yashar''el had already weighed the cup and found it a deceiver, not a ruler. *Wine is a mocker, strong drink is raging: and whosoever is deceived thereby is not wise* (Proverbs 20:1); *But they also have erred through wine, and through strong drink are out of the way; the priest and the prophet have erred through strong drink, they are swallowed up of wine, they are out of the way through strong drink; they err in vision, they stumble in judgment* (Isaiah 28:7); *Whoredom and wine and new wine take away the heart* (Hosea 4:11). What the guardsman praises as strength, the Scripture exposes as a thief of the heart — and the apostle answers it: *And be not drunk with wine, wherein is excess; but be filled with the Spirit* (Ephesians 5:18).',
       sv.verse_id, ev.verse_id, 'extras', 62550
  FROM _session253_1esd3_lookup sv, _session253_1esd3_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=3 AND sv.verse_number=10
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-esdras' AND ev.chapter_number=3 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-esdras-3-the-king-is-strongest',
       E'The king is strongest — and the King''s heart in Yahuah''s hand',
       E'The second guardsman writes for the throne: *The second wrote, The king is strongest.* (1 Esdras 3:11) The crown does seem the strongest thing on earth — *Where the word of a king is, there is power: and who may say unto him, What doest thou?* (Ecclesiastes 8:4). But the Tanakh sets a hand above the king''s hand: *The king''s heart is in the hand of Yahuah (LORD), as the rivers of water: he turneth it whithersoever he will* (Proverbs 21:1); *By me kings reign, and princes decree justice* (Proverbs 8:15); *And he changeth the times and the seasons: he removeth kings, and setteth up kings: he giveth wisdom unto the wise, and knowledge to them that know understanding* (Daniel 2:21). And even a king is bound under Torah, not above it: *It is not for kings, O Lemuel, it is not for kings to drink wine; nor for princes strong drink: Lest they drink, and forget the law, and pervert the judgment of any of the afflicted* (Proverbs 31:4-5). The king is strong — but the King''s strength is loaned from a stronger Hand.',
       sv.verse_id, ev.verse_id, 'extras', 62553
  FROM _session253_1esd3_lookup sv, _session253_1esd3_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=3 AND sv.verse_number=11
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-esdras' AND ev.chapter_number=3 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-esdras-3-truth-bears-the-victory',
       E'But above all things, Truth bears away the victory',
       E'The third guardsman''s sentence reaches past wine and king alike: *The third wrote, Women are strongest: but above all things Truth bears away the victory.* (1 Esdras 3:12) The contest will be decided not in the king''s bedchamber but at his seat of judgment — *And sat him down in the royal seat of judgment; and the writings were read before them* (1 Esdras 3:15). It ain''t new: Wisdom, not might, seats and judges kings — *By me kings reign, and princes decree justice* (Proverbs 8:15). And the wager that Truth bears the final victory finds its fullness where the true King stands judged before an earthly throne and answers for the truth itself: *Pilate therefore said unto him, Art thou a king then? Yahusha (Jesus) answered, Thou sayest that I am a king. To this end was I born, and for this cause came I into the world, that I should bear witness unto the truth. Every one that is of the truth heareth my voice* (John 18:37); *Yahusha (Jesus) saith unto him, I am the way, the truth, and the life: no man cometh unto the Father, but by me* (John 14:6). The guardsman''s contest for the truth opens here; its victory is a Person.',
       sv.verse_id, ev.verse_id, 'extras', 62556
  FROM _session253_1esd3_lookup sv, _session253_1esd3_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=3 AND sv.verse_number=12
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-esdras' AND ev.chapter_number=3 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-esdras-3-wine-is-the-strongest
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 20:1 — *Wine is a mocker, strong drink is raging: and whosoever is deceived thereby is not wise.* Where the guardsman crowns wine the strongest in 1 Esdras 3:10, the proverb names it a mocker that proves a man unwise.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd3_lookup sv, _session253_1esd3_lookup tv
 WHERE t.slug='1-esdras-3-wine-is-the-strongest'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=3 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=20 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 28:7 — *But they also have erred through wine, and through strong drink are out of the way; the priest and the prophet have erred through strong drink, they are swallowed up of wine, they are out of the way through strong drink; they err in vision, they stumble in judgment.* The guardsman''s boast that wine *causeth all men to err* (1 Esdras 3:18) is Isaiah''s indictment, where even priest and prophet are made to err.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd3_lookup sv, _session253_1esd3_lookup tv
 WHERE t.slug='1-esdras-3-wine-is-the-strongest'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=3 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=28 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hosea 4:11 — *Whoredom and wine and new wine take away the heart.* What the guardsman calls strength in 1 Esdras 3:18, Hosea calls a robbery of the very heart it overcomes.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd3_lookup sv, _session253_1esd3_lookup tv
 WHERE t.slug='1-esdras-3-wine-is-the-strongest'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=3 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=4 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ephesians 5:18 — *And be not drunk with wine, wherein is excess; but be filled with the Spirit.* Against the wine that makes men forget their love and *draw out swords* (1 Esdras 3:22), Paul sets the Spirit as the true filling and strength.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd3_lookup sv, _session253_1esd3_lookup tv
 WHERE t.slug='1-esdras-3-wine-is-the-strongest'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=3 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=5 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-esdras-3-the-king-is-strongest
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 21:1 — *The king''s heart is in the hand of Yahuah (LORD), as the rivers of water: he turneth it whithersoever he will.* The second guardsman''s verdict that *The king is strongest* (1 Esdras 3:11) meets the truth that the king''s own heart is turned by a higher Hand.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd3_lookup sv, _session253_1esd3_lookup tv
 WHERE t.slug='1-esdras-3-the-king-is-strongest'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=3 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=21 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ecclesiastes 8:4 — *Where the word of a king is, there is power: and who may say unto him, What doest thou?* Qoheleth grants the guardsman his point — the king''s word is power — even as 1 Esdras 3:11 names the king strongest.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd3_lookup sv, _session253_1esd3_lookup tv
 WHERE t.slug='1-esdras-3-the-king-is-strongest'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=3 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=8 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 2:21 — *And he changeth the times and the seasons: he removeth kings, and setteth up kings: he giveth wisdom unto the wise, and knowledge to them that know understanding.* The king is strongest only as far as Elohim permits, for He removes and sets up kings — answering 1 Esdras 3:11.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd3_lookup sv, _session253_1esd3_lookup tv
 WHERE t.slug='1-esdras-3-the-king-is-strongest'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=3 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=2 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Proverbs 31:5 — *Lest they drink, and forget the law, and pervert the judgment of any of the afflicted.* Even the strongest king stands under Torah, warned not to drink lest he forget the law — binding the king-thread back to the wine-thread of 1 Esdras 3:11.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd3_lookup sv, _session253_1esd3_lookup tv
 WHERE t.slug='1-esdras-3-the-king-is-strongest'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=3 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=31 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-esdras-3-truth-bears-the-victory
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 8:15 — *By me kings reign, and princes decree justice.* As Darius takes the *royal seat of judgment* in 1 Esdras 3:15, it is Wisdom by whom kings reign and rightly judge.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd3_lookup sv, _session253_1esd3_lookup tv
 WHERE t.slug='1-esdras-3-truth-bears-the-victory'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=3 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=8 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 18:37 — *Pilate therefore said unto him, Art thou a king then? Yahusha (Jesus) answered, Thou sayest that I am a king. To this end was I born, and for this cause came I into the world, that I should bear witness unto the truth. Every one that is of the truth heareth my voice.* The guardsman''s claim that *Truth bears away the victory* (1 Esdras 3:12) is fulfilled in the King who is born to bear witness to the truth before an earthly judgment seat.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd3_lookup sv, _session253_1esd3_lookup tv
 WHERE t.slug='1-esdras-3-truth-bears-the-victory'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=3 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=18 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 14:6 — *Yahusha (Jesus) saith unto him, I am the way, the truth, and the life: no man cometh unto the Father, but by me.* The Truth that bears the victory in 1 Esdras 3:12 is named at last not as a maxim but as a Person.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd3_lookup sv, _session253_1esd3_lookup tv
 WHERE t.slug='1-esdras-3-truth-bears-the-victory'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=3 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=14 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

