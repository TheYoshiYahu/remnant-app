-- ----- fragment: minion_ecclesiasticus_22.sql (session253 ecclesiasticus 22) -----
-- Source anchor: apocrypha/ecclesiasticus ch22. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: sir22 (view _session253_sir22_lookup). Sort band base 58825, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_sir22_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ecclesiasticus-22-the-fool
  ('apocrypha', 'ecclesiasticus', 22, 11, 'canon', 'proverbs', 26, 1, 'free', E'Proverbs 26:1 — *As snow in summer, and as rain in harvest, so honour is not seemly for a fool.* Solomon and Ben Sira agree that the fool is past honour, his life worse than death (Sirach 22:11).'),
  ('apocrypha', 'ecclesiasticus', 22, 13, 'canon', 'proverbs', 26, 11, 'free', E'Proverbs 26:11 — *As a dog returneth to his vomit, so a fool returneth to his folly.* The fool is incorrigible, so Sirach 22:13 counsels: talk not much with him and depart from him.'),
  ('apocrypha', 'ecclesiasticus', 22, 13, 'canon', 'proverbs', 26, 12, 'free', E'Proverbs 26:12 — *Seest thou a man wise in his own conceit? there is more hope of a fool than of him.* The same wisdom that bids Sirach 22:13 beware of the fool measures the deeper folly of self-conceit.'),
  ('apocrypha', 'ecclesiasticus', 22, 15, 'canon', 'proverbs', 27, 3, 'free', E'Proverbs 27:3 — *A stone is heavy, and the sand weighty; but a fool''s wrath is heavier than them both.* The same scales of stone and sand weigh the unbearable fool of Sirach 22:15.'),
  -- thread: ecclesiasticus-22-the-slothful
  ('apocrypha', 'ecclesiasticus', 22, 1, 'canon', 'proverbs', 6, 6, 'free', E'Proverbs 6:6 — *Go to the ant, thou sluggard; consider her ways, and be wise.* The slothful man hissed out as a filthy stone (Sirach 22:1) is sent to the ant to learn diligence.'),
  ('apocrypha', 'ecclesiasticus', 22, 2, 'canon', 'proverbs', 6, 11, 'free', E'Proverbs 6:11 — *So shall thy poverty come as one that travelleth, and thy want as an armed man.* The dunghill-filth of the sluggard in Sirach 22:2 ends in this ambush of want.'),
  ('apocrypha', 'ecclesiasticus', 22, 1, 'canon', 'proverbs', 26, 14, 'free', E'Proverbs 26:14 — *As the door turneth upon his hinges, so doth the slothful upon his bed.* The same disgraced sluggard of Sirach 22:1 turns idly on his bed in Solomon''s proverb.'),
  -- thread: ecclesiasticus-22-the-wounded-friend
  ('apocrypha', 'ecclesiasticus', 22, 20, 'canon', 'proverbs', 27, 6, 'free', E'Proverbs 27:6 — *Faithful are the wounds of a friend; but the kisses of an enemy are deceitful.* Where Sirach 22:20 warns that upbraiding breaks friendship, Solomon distinguishes the faithful wound from the treacherous kiss.'),
  ('apocrypha', 'ecclesiasticus', 22, 22, 'canon', 'proverbs', 18, 19, 'free', E'Proverbs 18:19 — *A brother offended is harder to be won than a strong city: and their contentions are like the bars of a castle.* The treacherous wound past which every friend departs (Sirach 22:22) is Solomon''s offended brother, harder to win than a walled city.'),
  ('apocrypha', 'ecclesiasticus', 22, 21, 'canon', 'matthew', 5, 24, 'free', E'Matthew 5:24 — *Leave there thy gift before the altar, and go thy way; first be reconciled to thy brother, and then come and offer thy gift.* The returning to favour Ben Sira urges in Sirach 22:21 the Master sets before the very altar.'),
  ('apocrypha', 'ecclesiasticus', 22, 20, 'apocrypha', 'ecclesiasticus', 6, 14, 'extras', E'Ecclesiasticus 6:14 — *A faithfull friend is a strong defence: and he that has found such an one has found a treasure.* Ben Sira had already named the treasure that the upbraiding of Sirach 22:20 puts at risk.'),
  -- thread: ecclesiasticus-22-watch-the-mouth
  ('apocrypha', 'ecclesiasticus', 22, 27, 'canon', 'psalms', 141, 3, 'free', E'Psalm 141:3 — *Set a watch, O Yahuah (LORD), before my mouth; keep the door of my lips.* Ben Sira''s prayer in Sirach 22:27 is David''s same plea for a guard set over the mouth.'),
  ('apocrypha', 'ecclesiasticus', 22, 27, 'canon', 'james', 3, 5, 'free', E'James 3:5 — *Even so the tongue is a little member, and boasteth great things. Behold, how great a matter a little fire kindleth!* The tongue Ben Sira fears will destroy him (Sirach 22:27) is James''s little member that kindles a great fire.'),
  ('apocrypha', 'ecclesiasticus', 22, 27, 'canon', 'james', 3, 8, 'free', E'James 3:8 — *But the tongue can no man tame; it is an unruly evil, full of deadly poison.* Because no man can tame the tongue, Sirach 22:27 prays for a watch and a seal of wisdom from above.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_sir22_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_sir22_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-22-the-fool',
       E'The fool that wanteth understanding',
       E'Ben Sira draws the fool to the life: *Weep for the dead, for he has lost the light: and weep for the fool, for he wanteth understanding: make little weeping for the dead, for he is at rest: but the life of the fool is worse than death* (Ecclesiasticus 22:11), and *Sand, and salt, and a mass of iron, is easier to bear, than a man without understanding* (Ecclesiasticus 22:15). It ain''t new — this is the whole gallery of Proverbs 26, where honour fits the fool as poorly as snow in summer: *As snow in summer, and as rain in harvest, so honour is not seemly for a fool* (Proverbs 26:1), and the fool cannot be cured of his folly, *As a dog returneth to his vomit, so a fool returneth to his folly* (Proverbs 26:11). Solomon''s counsel to give the fool a wide berth — *there is more hope of a fool than of him* (Proverbs 26:12) — is Ben Sira''s same wisdom: *Talk not much with a fool* (Ecclesiasticus 22:13). The two books speak with one tongue.',
       sv.verse_id, ev.verse_id, 'extras', 58825
  FROM _session253_sir22_lookup sv, _session253_sir22_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=22 AND sv.verse_number=11
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=22 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-22-the-slothful',
       E'The slothful man and the filthy stone',
       E'The chapter opens on the sluggard: *A slothful man is compared to a filthy stone, and every one will hiss him out to his disgrace* (Ecclesiasticus 22:1), and *A slothful man is compared to the filth of a dunghill: every man that takes it up will shake his hand* (Ecclesiasticus 22:2). It ain''t new — Solomon sends the sluggard to the ant: *Go to the ant, thou sluggard; consider her ways, and be wise* (Proverbs 6:6), warning that *Yet a little sleep, a little slumber, a little folding of the hands to sleep* (Proverbs 6:10) ends in ruin: *So shall thy poverty come as one that travelleth, and thy want as an armed man* (Proverbs 6:11). In Proverbs 26 the same sluggard rolls upon his bed and is disgraced — *As the door turneth upon his hinges, so doth the slothful upon his bed* (Proverbs 26:14). The filthy stone of Sirach 22 is the door-hinge sluggard of the canon.',
       sv.verse_id, ev.verse_id, 'extras', 58828
  FROM _session253_sir22_lookup sv, _session253_sir22_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=22 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=22 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-22-the-wounded-friend',
       E'A friend wounded, yet a returning to favour',
       E'Ben Sira measures the breaking and the mending of friendship: *Whoso casteth a stone at the birds frayeth them away: and he that upbraideth his friend breaks friendship* (Ecclesiasticus 22:20); yet *Though you drewest a sword at your friend, yet despair not: for there may be a returning to favour* (Ecclesiasticus 22:21) — *except for upbraiding, or pride, or disclosing of secrets, or a treacherous wound: for for these things every friend will depart* (Ecclesiasticus 22:22). It ain''t new — Solomon honours the open wound of a true friend, *Faithful are the wounds of a friend; but the kisses of an enemy are deceitful* (Proverbs 27:6), and grieves the harder breach: *A brother offended is harder to be won than a strong city* (Proverbs 18:19). The Master folds the same counsel into the altar itself: *first be reconciled to thy brother, and then come and offer thy gift* (Matthew 5:24). And Ben Sira had already weighed the treasure being risked — *A faithfull friend is a strong defence: and he that has found such an one has found a treasure* (Ecclesiasticus 6:14). The returning to favour is the heart of Torah-wisdom, fulfilled at the altar.',
       sv.verse_id, ev.verse_id, 'extras', 58831
  FROM _session253_sir22_lookup sv, _session253_sir22_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=22 AND sv.verse_number=20
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=22 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-22-watch-the-mouth',
       E'A watch before my mouth, a seal upon my lips',
       E'The chapter closes with a prayer that crowns the whole tongue-discourse of Sirach 19-23: *Who shall set a watch before my mouth, and a seal of wisdom upon my lips, that I fall not suddenly by them, and that my tongue destroy me not?* (Ecclesiasticus 22:27). It ain''t new — this is David''s own evening cry: *Set a watch, O Yahuah (LORD), before my mouth; keep the door of my lips* (Psalm 141:3). And it is the doctrine James unfolds, that the tongue is the untameable fire — *Even so the tongue is a little member, and boasteth great things. Behold, how great a matter a little fire kindleth!* (James 3:5) — *But the tongue can no man tame; it is an unruly evil, full of deadly poison* (James 3:8). Ben Sira knows what David and James know: only a watch from Yahuah seals the lips that no man can tame. Torah stands, and the bridled tongue is its fruit.',
       sv.verse_id, ev.verse_id, 'extras', 58834
  FROM _session253_sir22_lookup sv, _session253_sir22_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=22 AND sv.verse_number=27
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=22 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ecclesiasticus-22-the-fool
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 26:1 — *As snow in summer, and as rain in harvest, so honour is not seemly for a fool.* Solomon and Ben Sira agree that the fool is past honour, his life worse than death (Sirach 22:11).'
  FROM cross_reference_threads t, cross_references x, _session253_sir22_lookup sv, _session253_sir22_lookup tv
 WHERE t.slug='ecclesiasticus-22-the-fool'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=22 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=26 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 26:11 — *As a dog returneth to his vomit, so a fool returneth to his folly.* The fool is incorrigible, so Sirach 22:13 counsels: talk not much with him and depart from him.'
  FROM cross_reference_threads t, cross_references x, _session253_sir22_lookup sv, _session253_sir22_lookup tv
 WHERE t.slug='ecclesiasticus-22-the-fool'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=22 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=26 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 26:12 — *Seest thou a man wise in his own conceit? there is more hope of a fool than of him.* The same wisdom that bids Sirach 22:13 beware of the fool measures the deeper folly of self-conceit.'
  FROM cross_reference_threads t, cross_references x, _session253_sir22_lookup sv, _session253_sir22_lookup tv
 WHERE t.slug='ecclesiasticus-22-the-fool'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=22 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=26 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Proverbs 27:3 — *A stone is heavy, and the sand weighty; but a fool''s wrath is heavier than them both.* The same scales of stone and sand weigh the unbearable fool of Sirach 22:15.'
  FROM cross_reference_threads t, cross_references x, _session253_sir22_lookup sv, _session253_sir22_lookup tv
 WHERE t.slug='ecclesiasticus-22-the-fool'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=22 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=27 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-22-the-slothful
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 6:6 — *Go to the ant, thou sluggard; consider her ways, and be wise.* The slothful man hissed out as a filthy stone (Sirach 22:1) is sent to the ant to learn diligence.'
  FROM cross_reference_threads t, cross_references x, _session253_sir22_lookup sv, _session253_sir22_lookup tv
 WHERE t.slug='ecclesiasticus-22-the-slothful'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=22 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=6 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 6:11 — *So shall thy poverty come as one that travelleth, and thy want as an armed man.* The dunghill-filth of the sluggard in Sirach 22:2 ends in this ambush of want.'
  FROM cross_reference_threads t, cross_references x, _session253_sir22_lookup sv, _session253_sir22_lookup tv
 WHERE t.slug='ecclesiasticus-22-the-slothful'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=22 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=6 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 26:14 — *As the door turneth upon his hinges, so doth the slothful upon his bed.* The same disgraced sluggard of Sirach 22:1 turns idly on his bed in Solomon''s proverb.'
  FROM cross_reference_threads t, cross_references x, _session253_sir22_lookup sv, _session253_sir22_lookup tv
 WHERE t.slug='ecclesiasticus-22-the-slothful'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=22 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=26 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-22-the-wounded-friend
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 27:6 — *Faithful are the wounds of a friend; but the kisses of an enemy are deceitful.* Where Sirach 22:20 warns that upbraiding breaks friendship, Solomon distinguishes the faithful wound from the treacherous kiss.'
  FROM cross_reference_threads t, cross_references x, _session253_sir22_lookup sv, _session253_sir22_lookup tv
 WHERE t.slug='ecclesiasticus-22-the-wounded-friend'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=22 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=27 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 18:19 — *A brother offended is harder to be won than a strong city: and their contentions are like the bars of a castle.* The treacherous wound past which every friend departs (Sirach 22:22) is Solomon''s offended brother, harder to win than a walled city.'
  FROM cross_reference_threads t, cross_references x, _session253_sir22_lookup sv, _session253_sir22_lookup tv
 WHERE t.slug='ecclesiasticus-22-the-wounded-friend'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=22 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=18 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 5:24 — *Leave there thy gift before the altar, and go thy way; first be reconciled to thy brother, and then come and offer thy gift.* The returning to favour Ben Sira urges in Sirach 22:21 the Master sets before the very altar.'
  FROM cross_reference_threads t, cross_references x, _session253_sir22_lookup sv, _session253_sir22_lookup tv
 WHERE t.slug='ecclesiasticus-22-the-wounded-friend'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=22 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ecclesiasticus 6:14 — *A faithfull friend is a strong defence: and he that has found such an one has found a treasure.* Ben Sira had already named the treasure that the upbraiding of Sirach 22:20 puts at risk.'
  FROM cross_reference_threads t, cross_references x, _session253_sir22_lookup sv, _session253_sir22_lookup tv
 WHERE t.slug='ecclesiasticus-22-the-wounded-friend'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=22 AND sv.verse_number=20
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=6 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-22-watch-the-mouth
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 141:3 — *Set a watch, O Yahuah (LORD), before my mouth; keep the door of my lips.* Ben Sira''s prayer in Sirach 22:27 is David''s same plea for a guard set over the mouth.'
  FROM cross_reference_threads t, cross_references x, _session253_sir22_lookup sv, _session253_sir22_lookup tv
 WHERE t.slug='ecclesiasticus-22-watch-the-mouth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=22 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=141 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'James 3:5 — *Even so the tongue is a little member, and boasteth great things. Behold, how great a matter a little fire kindleth!* The tongue Ben Sira fears will destroy him (Sirach 22:27) is James''s little member that kindles a great fire.'
  FROM cross_reference_threads t, cross_references x, _session253_sir22_lookup sv, _session253_sir22_lookup tv
 WHERE t.slug='ecclesiasticus-22-watch-the-mouth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=22 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=3 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'James 3:8 — *But the tongue can no man tame; it is an unruly evil, full of deadly poison.* Because no man can tame the tongue, Sirach 22:27 prays for a watch and a seal of wisdom from above.'
  FROM cross_reference_threads t, cross_references x, _session253_sir22_lookup sv, _session253_sir22_lookup tv
 WHERE t.slug='ecclesiasticus-22-watch-the-mouth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=22 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

