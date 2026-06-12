-- ----- fragment: minion_1adameve_52.sql (session253 1-adam-eve 52) -----
-- Source anchor: adam-eve-conflict/1-adam-eve ch52. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1ae52 (view _session253_1ae52_lookup). Sort band base 65275, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1ae52_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-adam-eve-52-skins-token-of-death
  ('adam-eve-conflict', '1-adam-eve', 52, 2, 'canon', 'genesis', 3, 21, 'free', E'Genesis 3:21 — *Unto Adam also and to his wife did Yahuah Elohim (the LORD God) make coats of skins, and clothed them.* The very skins Adam mourns as a token of death are the coats Yahuah made for them in 1 Adam and Eve 52:2.'),
  ('adam-eve-conflict', '1-adam-eve', 52, 2, 'canon', 'genesis', 2, 17, 'free', E'Genesis 2:17 — *But of the tree of the knowledge of good and evil, thou shalt not eat of it: for in the day that thou eatest thereof thou shalt surely die.* The death Adam now wears on his body in 1 Adam and Eve 52:2 is the sentence first spoken at the tree.'),
  ('adam-eve-conflict', '1-adam-eve', 52, 2, 'canon', 'romans', 5, 12, 'free', E'Romans 5:12 — *Wherefore, as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned:* Sha''ul names the death Adam reads in the skin of beasts in 1 Adam and Eve 52:2.'),
  ('adam-eve-conflict', '1-adam-eve', 52, 2, 'canon', '1-corinthians', 15, 22, 'free', E'1 Corinthians 15:22 — *For as in Adam all die, even so in Messiah (Christ) shall all be made alive.* The Adam who first wears the token of death in 1 Adam and Eve 52:2 is the Adam in whom the promised resurrection will answer it.'),
  -- thread: 1-adam-eve-52-angel-clothes-them
  ('adam-eve-conflict', '1-adam-eve', 52, 5, 'canon', 'psalms', 91, 11, 'free', E'Psalm 91:11 — *For he shall give his angels charge over thee, to keep thee in all thy ways.* The angel sent to clothe Adam and Eve in 1 Adam and Eve 52:5 is the charge Yahuah lays on His angels to keep His own.'),
  ('adam-eve-conflict', '1-adam-eve', 52, 5, 'canon', 'hebrews', 1, 14, 'free', E'Hebrews 1:14 — *Are they not all ministering spirits, sent forth to minister for them who shall be heirs of salvation?* The angel that ministers garments to Adam and Eve in 1 Adam and Eve 52:5 is the ministering spirit sent to the heirs of salvation.'),
  ('adam-eve-conflict', '1-adam-eve', 52, 8, 'canon', 'genesis', 3, 21, 'free', E'Genesis 3:21 — *Unto Adam also and to his wife did Yahuah Elohim (the LORD God) make coats of skins, and clothed them.* The garments the angel finishes in 1 Adam and Eve 52:8 are the coats Yahuah made and clothed them with in Eden.'),
  -- thread: 1-adam-eve-52-nakedness-covered
  ('adam-eve-conflict', '1-adam-eve', 52, 9, 'canon', 'genesis', 3, 7, 'free', E'Genesis 3:7 — *And the eyes of them both were opened, and they knew that they were naked; and they sewed fig leaves together, and made themselves aprons.* The nakedness covered at last in 1 Adam and Eve 52:9 is the shame their own fig-leaf aprons could not hide in Eden.'),
  ('adam-eve-conflict', '1-adam-eve', 52, 9, 'canon', 'genesis', 2, 25, 'free', E'Genesis 2:25 — *And they were both naked, the man and his wife, and were not ashamed.* The covering in 1 Adam and Eve 52:9 is mercy restoring what was lost when shame entered their once-unashamed nakedness.'),
  -- thread: 1-adam-eve-52-prayer-mercy-thanks
  ('adam-eve-conflict', '1-adam-eve', 52, 11, 'canon', 'genesis', 4, 26, 'free', E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* Adam''s night of seeking mercy and calling on the Name in 1 Adam and Eve 52:11 is the same way of prayer kept down the holy line of Seth.'),
  ('adam-eve-conflict', '1-adam-eve', 52, 11, 'canon', 'hebrews', 4, 16, 'free', E'Hebrews 4:16 — *Let us therefore come boldly unto the throne of grace, that we may obtain mercy, and find grace to help in time of need.* Adam''s bold seeking of mercy and forgiveness in 1 Adam and Eve 52:11 is the throne of grace the redeemed are bidden to come to.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1ae52_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1ae52_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-52-skins-token-of-death',
       E'The Skin of Beasts — a Token of Death on Our Bodies',
       E'Adam takes up the skins Yahuah gave them and reads death in them: *"O Eve, this is the skin of beasts with which we shall be covered, but when we put it on, behold, we shall be wearing a token of death on our bodies. Just as the owners of these skins have died and have wasted away, so also shall we die and pass away."* (1 Adam and Eve 52:2). It ain''t new — this is the coats of skins of Eden read aright: *Unto Adam also and to his wife did Yahuah Elohim (the LORD God) make coats of skins, and clothed them.* (Genesis 3:21). The skin is a token of death because death had already entered by the eating: *for in the day that thou eatest thereof thou shalt surely die.* (Genesis 2:17). Sha''ul names the wound the skin covers — *Wherefore, as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned:* (Romans 5:12) — and the same Adam who wears death first will be the Adam in whom the resurrection answers it: *For as in Adam all die, even so in Messiah (Christ) shall all be made alive.* (1 Corinthians 15:22).',
       sv.verse_id, ev.verse_id, 'extras', 65275
  FROM _session253_1ae52_lookup sv, _session253_1ae52_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=52 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=52 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-52-angel-clothes-them',
       E'Elohim Sends His Angel to Clothe Them',
       E'They have no skill to make garments, so mercy stoops to teach them: *"Then Elohim (God) sent to them His angel to show them how to work it out."* (1 Adam and Eve 52:5), and the angel sews the skins with palm-thorns hidden *"as it were, sewn with one thread"* until *"they became garments for Adam and Eve, and He clothed them therewith"* (1 Adam and Eve 52:8). The ministering angel is no novelty — Yahuah charges His angels with the keeping of His own: *For he shall give his angels charge over thee, to keep thee in all thy ways.* (Psalm 91:11). They are the household servants of the covenant: *Are they not all ministering spirits, sent forth to minister for them who shall be heirs of salvation?* (Hebrews 1:14). And the clothing itself is Eden re-read — *Unto Adam also and to his wife did Yahuah Elohim (the LORD God) make coats of skins, and clothed them.* (Genesis 3:21) — Yahuah Himself the One who clothes, the angel only His hand.',
       sv.verse_id, ev.verse_id, 'extras', 65278
  FROM _session253_1ae52_lookup sv, _session253_1ae52_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=52 AND sv.verse_number=5
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=52 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-52-nakedness-covered',
       E'Their Nakedness Covered From Each Other''s Eyes',
       E'When the garments are on, the shame of Eden is answered: *"From that time the nakedness of their bodies was covered from the sight of each other''s eyes."* (1 Adam and Eve 52:9). This is the undoing of the moment in the garden when the eating opened their eyes — *And the eyes of them both were opened, and they knew that they were naked; and they sewed fig leaves together, and made themselves aprons.* (Genesis 3:7) — and the loss of that first innocence — *And they were both naked, the man and his wife, and were not ashamed.* (Genesis 2:25). The poor fig-leaf aprons of their own hands could not cover them; only the garment Yahuah''s hand provides can.',
       sv.verse_id, ev.verse_id, 'extras', 65281
  FROM _session253_1ae52_lookup sv, _session253_1ae52_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=52 AND sv.verse_number=9
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=52 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-52-prayer-mercy-thanks',
       E'They Sought Mercy and Gave Thanks the Whole Night',
       E'Clothed, they turn the whole night into worship: *"Then when Adam''s and Eve''s bodies were covered, they stood and prayed, and sought mercy of Yahuah (Lord), and forgiveness, and gave Him thanks for that He had had mercy on them, and had covered their nakedness. And they ceased not from prayer the whole of that night."* (1 Adam and Eve 52:11). It ain''t new — this is the way kept before Sinai, the very calling on the Name that begins in the seed of Seth: *then began men to call upon the name of Yahuah (LORD).* (Genesis 4:26). And the bold approach for mercy that Adam makes here is the same throne the redeemed are bidden to come to: *Let us therefore come boldly unto the throne of grace, that we may obtain mercy, and find grace to help in time of need.* (Hebrews 4:16).',
       sv.verse_id, ev.verse_id, 'extras', 65284
  FROM _session253_1ae52_lookup sv, _session253_1ae52_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=52 AND sv.verse_number=11
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=52 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-adam-eve-52-skins-token-of-death
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:21 — *Unto Adam also and to his wife did Yahuah Elohim (the LORD God) make coats of skins, and clothed them.* The very skins Adam mourns as a token of death are the coats Yahuah made for them in 1 Adam and Eve 52:2.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae52_lookup sv, _session253_1ae52_lookup tv
 WHERE t.slug='1-adam-eve-52-skins-token-of-death'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=52 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 2:17 — *But of the tree of the knowledge of good and evil, thou shalt not eat of it: for in the day that thou eatest thereof thou shalt surely die.* The death Adam now wears on his body in 1 Adam and Eve 52:2 is the sentence first spoken at the tree.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae52_lookup sv, _session253_1ae52_lookup tv
 WHERE t.slug='1-adam-eve-52-skins-token-of-death'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=52 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 5:12 — *Wherefore, as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned:* Sha''ul names the death Adam reads in the skin of beasts in 1 Adam and Eve 52:2.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae52_lookup sv, _session253_1ae52_lookup tv
 WHERE t.slug='1-adam-eve-52-skins-token-of-death'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=52 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=5 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Corinthians 15:22 — *For as in Adam all die, even so in Messiah (Christ) shall all be made alive.* The Adam who first wears the token of death in 1 Adam and Eve 52:2 is the Adam in whom the promised resurrection will answer it.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae52_lookup sv, _session253_1ae52_lookup tv
 WHERE t.slug='1-adam-eve-52-skins-token-of-death'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=52 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-52-angel-clothes-them
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 91:11 — *For he shall give his angels charge over thee, to keep thee in all thy ways.* The angel sent to clothe Adam and Eve in 1 Adam and Eve 52:5 is the charge Yahuah lays on His angels to keep His own.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae52_lookup sv, _session253_1ae52_lookup tv
 WHERE t.slug='1-adam-eve-52-angel-clothes-them'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=52 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=91 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 1:14 — *Are they not all ministering spirits, sent forth to minister for them who shall be heirs of salvation?* The angel that ministers garments to Adam and Eve in 1 Adam and Eve 52:5 is the ministering spirit sent to the heirs of salvation.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae52_lookup sv, _session253_1ae52_lookup tv
 WHERE t.slug='1-adam-eve-52-angel-clothes-them'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=52 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 3:21 — *Unto Adam also and to his wife did Yahuah Elohim (the LORD God) make coats of skins, and clothed them.* The garments the angel finishes in 1 Adam and Eve 52:8 are the coats Yahuah made and clothed them with in Eden.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae52_lookup sv, _session253_1ae52_lookup tv
 WHERE t.slug='1-adam-eve-52-angel-clothes-them'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=52 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-52-nakedness-covered
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:7 — *And the eyes of them both were opened, and they knew that they were naked; and they sewed fig leaves together, and made themselves aprons.* The nakedness covered at last in 1 Adam and Eve 52:9 is the shame their own fig-leaf aprons could not hide in Eden.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae52_lookup sv, _session253_1ae52_lookup tv
 WHERE t.slug='1-adam-eve-52-nakedness-covered'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=52 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 2:25 — *And they were both naked, the man and his wife, and were not ashamed.* The covering in 1 Adam and Eve 52:9 is mercy restoring what was lost when shame entered their once-unashamed nakedness.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae52_lookup sv, _session253_1ae52_lookup tv
 WHERE t.slug='1-adam-eve-52-nakedness-covered'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=52 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-52-prayer-mercy-thanks
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* Adam''s night of seeking mercy and calling on the Name in 1 Adam and Eve 52:11 is the same way of prayer kept down the holy line of Seth.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae52_lookup sv, _session253_1ae52_lookup tv
 WHERE t.slug='1-adam-eve-52-prayer-mercy-thanks'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=52 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 4:16 — *Let us therefore come boldly unto the throne of grace, that we may obtain mercy, and find grace to help in time of need.* Adam''s bold seeking of mercy and forgiveness in 1 Adam and Eve 52:11 is the throne of grace the redeemed are bidden to come to.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae52_lookup sv, _session253_1ae52_lookup tv
 WHERE t.slug='1-adam-eve-52-prayer-mercy-thanks'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=52 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=4 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

