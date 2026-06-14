-- ----- fragment: minion_ignatiusromans_01.sql (session253 ignatius-romans 1) -----
-- Source anchor: lightfoot-apostolic-fathers/ignatius-romans ch1. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: igrom1 (view _session253_igrom1_lookup). Sort band base 70500, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_igrom1_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ignatius-romans-1-wheat-pure-bread
  ('lightfoot-apostolic-fathers', 'ignatius-romans', 1, 4, 'canon', 'john', 12, 24, 'free', E'John 12:24 — *Verily, verily, I say unto you, Except a corn of wheat fall into the ground and die, it abideth alone: but if it die, it bringeth forth much fruit.* Ignatius''s wheat ground to pure bread is the Master''s own grain that must die to bear fruit.'),
  ('lightfoot-apostolic-fathers', 'ignatius-romans', 1, 4, 'canon', '1-corinthians', 15, 35, 'free', E'1 Corinthians 15:35 — *But some man will say, How are the dead raised up? and with what body do they come?* The ground grain looks to the resurrection body, so the teeth of the beasts are not the end but the sowing.'),
  ('lightfoot-apostolic-fathers', 'ignatius-romans', 1, 4, 'canon', 'romans', 12, 1, 'free', E'Romans 12:1 — *I beseech you therefore, brethren, by the mercies of Elohim (God), that ye present your bodies a living sacrifice, holy, acceptable unto Elohim (God), which is your reasonable service.* Ignatius asks to be found a sacrifice, the very living offering Sha''ul commands.'),
  ('lightfoot-apostolic-fathers', 'ignatius-romans', 1, 4, 'canon', '2-timothy', 4, 6, 'free', E'2 Timothy 4:6 — *For I am now ready to be offered, and the time of my departure is at hand.* The poured-out libation of v2 and the sacrifice of v4 echo Sha''ul facing his own death as an offering.'),
  -- thread: ignatius-romans-1-to-die-is-gain
  ('lightfoot-apostolic-fathers', 'ignatius-romans', 1, 6, 'canon', 'philippians', 1, 21, 'free', E'Philippians 1:21 — *For to me to live is Messiah (Christ), and to die is gain.* Ignatius''s preference for death over reigning over the earth is Sha''ul''s gain-in-dying word for word in spirit.'),
  ('lightfoot-apostolic-fathers', 'ignatius-romans', 1, 6, 'canon', 'philippians', 1, 23, 'free', E'Philippians 1:23 — *For I am in a strait betwixt two, having a desire to depart, and to be with Messiah (Christ); which is far better.* Him I seek, Him I desire — Ignatius''s longing to depart and be with the Master mirrors Sha''ul''s.'),
  ('lightfoot-apostolic-fathers', 'ignatius-romans', 1, 5, 'canon', 'philippians', 3, 8, 'free', E'Philippians 3:8 — *Yea doubtless, and I count all things but loss for the excellency of the knowledge of HaMashiach Yahusha (Christ Jesus) my Lord: for whom I have suffered the loss of all things, and do count them but dung, that I may win Messiah (Christ).* To attain unto Messiah Ignatius counts the visible and invisible nothing, as Sha''ul counts all loss.'),
  ('lightfoot-apostolic-fathers', 'ignatius-romans', 1, 6, 'canon', 'galatians', 2, 20, 'free', E'Galatians 2:20 — *I am crucified with Messiah (Christ): nevertheless I live; yet not I, but Messiah (Christ) liveth in me: and the life which I now live in the flesh I live by the faith of the Son of Elohim (God), who loved me, and gave himself for me.* Ignatius desires Him who died and rose for us, the same crucified-yet-living life Sha''ul confesses.'),
  -- thread: ignatius-romans-1-living-water-come-to-the-father
  ('lightfoot-apostolic-fathers', 'ignatius-romans', 1, 7, 'canon', 'john', 4, 14, 'free', E'John 4:14 — *But whosoever drinketh of the water that I shall give him shall never thirst; but the water that I shall give him shall be in him a well of water springing up into everlasting life.* The living water speaking within Ignatius is the springing well the Master gives.'),
  ('lightfoot-apostolic-fathers', 'ignatius-romans', 1, 7, 'canon', 'john', 7, 37, 'free', E'John 7:37 — *In the last day, that great day of the feast, Yahusha (Jesus) stood and cried, saying, If any man thirst, let him come unto me, and drink.* Ignatius''s inward water that says Come answers the Master''s feast-day cry to come and drink.'),
  ('lightfoot-apostolic-fathers', 'ignatius-romans', 1, 7, 'canon', 'john', 7, 38, 'free', E'John 7:38 — *He that believeth on me, as the scripture hath said, out of his belly shall flow rivers of living water.* The water living and speaking in Ignatius is the river the Master promised would flow from the believer.'),
  ('lightfoot-apostolic-fathers', 'ignatius-romans', 1, 7, 'canon', 'revelation', 22, 17, 'free', E'Revelation 22:17 — *And the Spirit and the bride say, Come. And let him that heareth say, Come. And let him that is athirst come. And whosoever will, let him take the water of life freely.* The voice within Ignatius saying Come to the Father is the Spirit and the Bride''s closing call.'),
  -- thread: ignatius-romans-1-flesh-seed-of-david
  ('lightfoot-apostolic-fathers', 'ignatius-romans', 1, 7, 'canon', 'romans', 1, 3, 'free', E'Romans 1:3 — *Concerning his Son Yahusha HaMashiach (Jesus Christ) our Lord, which was made of the seed of David according to the flesh.* Ignatius''s flesh of Messiah who was of the seed of David is Sha''ul''s opening gospel verbatim in substance.'),
  ('lightfoot-apostolic-fathers', 'ignatius-romans', 1, 7, 'canon', '2-timothy', 2, 8, 'free', E'2 Timothy 2:8 — *Remember that Yahusha HaMashiach (Jesus Christ) of the seed of David was raised from the dead according to my gospel.* The seed-of-David flesh Ignatius confesses is the same risen Messiah Sha''ul bids Timothy remember.'),
  ('lightfoot-apostolic-fathers', 'ignatius-romans', 1, 7, 'canon', 'john', 6, 51, 'free', E'John 6:51 — *I am the living bread which came down from heaven: if any man eat of this bread, he shall live for ever: and the bread that I will give is my flesh, which I will give for the life of the world.* The bread of Elohim that is the flesh of Messiah is the Master''s own living bread.'),
  ('lightfoot-apostolic-fathers', 'ignatius-romans', 1, 7, 'canon', 'john', 6, 55, 'free', E'John 6:55 — *For my flesh is meat indeed, and my blood is drink indeed.* Ignatius desires the flesh for bread and the blood for a draught, the very meat and drink the Master named.'),
  -- thread: ignatius-romans-1-rise-free-suffer-reign
  ('lightfoot-apostolic-fathers', 'ignatius-romans', 1, 4, 'canon', 'romans', 6, 5, 'free', E'Romans 6:5 — *For if we have been planted together in the likeness of his death, we shall be also in the likeness of his resurrection.* Ignatius''s promise to rise free in Him is the planting-into-death-and-resurrection Sha''ul lays out.'),
  ('lightfoot-apostolic-fathers', 'ignatius-romans', 1, 4, 'canon', 'romans', 6, 4, 'free', E'Romans 6:4 — *Therefore we are buried with him by baptism into death: that like as Messiah (Christ) was raised up from the dead by the glory of the Father, even so we also should walk in newness of life.* The freed-man who shall rise in Him walks the buried-and-raised path Sha''ul describes.'),
  ('lightfoot-apostolic-fathers', 'ignatius-romans', 1, 4, 'canon', '2-timothy', 2, 11, 'free', E'2 Timothy 2:11 — *It is a faithful saying: For if we be dead with him, we shall also live with him.* Ignatius the slave who will rise free leans on the faithful saying that dying with Him is living with Him.'),
  ('lightfoot-apostolic-fathers', 'ignatius-romans', 1, 4, 'canon', '2-timothy', 2, 12, 'free', E'2 Timothy 2:12 — *If we suffer, we shall also reign with him: if we deny him, he also will deny us.* If I shall suffer, then am I a freed-man — Ignatius''s suffering-unto-freedom is the suffering-unto-reigning Sha''ul names.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_igrom1_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_igrom1_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ignatius-romans-1-wheat-pure-bread',
       E'The wheat of Elohim, ground into pure bread',
       E'Ignatius longs for the arena: *I am Elohim''s (God''s) wheat, and I am ground by the teeth of wild beasts that I may be found pure bread [of Messiah (Christ)]... that through these instruments I may be found a sacrifice to Elohim (God)* (Ignatius to the Romans 1:4). It ain''t new — he is reaching for the Master''s own grain-of-wheat parable: *Verily, verily, I say unto you, Except a corn of wheat fall into the ground and die, it abideth alone: but if it die, it bringeth forth much fruit* (John 12:24), and Sha''ul''s seed-of-resurrection answer, *But some man will say, How are the dead raised up? and with what body do they come?* (1 Corinthians 15:35). The martyr''s body becomes the bread because it is first a living sacrifice — *that ye present your bodies a living sacrifice, holy, acceptable unto Elohim (God), which is your reasonable service* (Romans 12:1) — and a poured-out offering: *For I am now ready to be offered, and the time of my departure is at hand* (2 Timothy 4:6).',
       sv.verse_id, ev.verse_id, 'extras', 70500
  FROM _session253_igrom1_lookup sv, _session253_igrom1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-romans' AND sv.chapter_number=1 AND sv.verse_number=4
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='ignatius-romans' AND ev.chapter_number=1 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ignatius-romans-1-to-die-is-gain',
       E'To attain the Messiah, and to die is gain',
       E'Ignatius will not be robbed of his death: *It is good for me to die for Yahusha HaMashiach (Jesus Christ) rather than to reign over the farthest bounds of the earth. Him I seek, who died on our behalf; Him I desire, who rose again* (Ignatius to the Romans 1:6); *Only be it mine to attain unto Yahusha HaMashiach (Jesus Christ)* (1:5). This is Sha''ul to the letter: *For to me to live is Messiah (Christ), and to die is gain* (Philippians 1:21); *having a desire to depart, and to be with Messiah (Christ); which is far better* (Philippians 1:23); *I count all things but loss... that I may win Messiah (Christ)* (Philippians 3:8). The life he now lives is already a crucified one: *I am crucified with Messiah (Christ): nevertheless I live; yet not I, but Messiah (Christ) liveth in me* (Galatians 2:20). It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 70503
  FROM _session253_igrom1_lookup sv, _session253_igrom1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-romans' AND sv.chapter_number=1 AND sv.verse_number=5
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='ignatius-romans' AND ev.chapter_number=1 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ignatius-romans-1-living-water-come-to-the-father',
       E'Living water saying, Come to the Father',
       E'Ignatius''s earthly longings are crucified, and another spring rises: *My lust hath been crucified, and there is no fire of material longing in me, but only water living and speaking in me, saying within me, Come to the Father* (Ignatius to the Romans 1:7). This is the well the Master promised the woman at Sychar — *the water that I shall give him shall be in him a well of water springing up into everlasting life* (John 4:14) — and the rivers He cried out at the feast: *If any man thirst, let him come unto me, and drink* (John 7:37); *out of his belly shall flow rivers of living water* (John 7:38). And the Bride''s last invitation closes the canon with the same word Ignatius hears within: *And let him that is athirst come. And whosoever will, let him take the water of life freely* (Revelation 22:17). It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 70506
  FROM _session253_igrom1_lookup sv, _session253_igrom1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-romans' AND sv.chapter_number=1 AND sv.verse_number=7
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='ignatius-romans' AND ev.chapter_number=1 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ignatius-romans-1-flesh-seed-of-david',
       E'The flesh of Messiah, of the seed of David',
       E'Against every spirit that would empty the incarnation, Ignatius confesses a real body and real blood: *I desire the bread of Elohim (God), which is the flesh of Messiah (Christ) who was of the seed of David; and for a draught I desire His blood, which is love incorruptible* (Ignatius to the Romans 1:7). This is the apostolic gospel, not a new one — *Concerning his Son Yahusha HaMashiach (Jesus Christ) our Lord, which was made of the seed of David according to the flesh* (Romans 1:3); *Remember that Yahusha HaMashiach (Jesus Christ) of the seed of David was raised from the dead according to my gospel* (2 Timothy 2:8). The flesh he hungers for is the living bread: *the bread that I will give is my flesh, which I will give for the life of the world* (John 6:51); *For my flesh is meat indeed, and my blood is drink indeed* (John 6:55). The Messiah truly born of David''s seed, truly in the flesh — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 70509
  FROM _session253_igrom1_lookup sv, _session253_igrom1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-romans' AND sv.chapter_number=1 AND sv.verse_number=7
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='ignatius-romans' AND ev.chapter_number=1 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ignatius-romans-1-rise-free-suffer-reign',
       E'If I suffer, I shall rise free in Him',
       E'Ignatius binds suffering to resurrection: *Yet if I shall suffer, then am I a freed-man of Yahusha HaMashiach (Jesus Christ), and I shall rise free in Him* (Ignatius to the Romans 1:4); *Suffer me to receive the pure light. When I am come thither, then shall I be a man* (1:6). This is the buried-and-raised pattern of immersion — *Therefore we are buried with him by baptism into death... even so we also should walk in newness of life* (Romans 6:4); *if we have been planted together in the likeness of his death, we shall be also in the likeness of his resurrection* (Romans 6:5) — and the faithful saying Ignatius lives out: *For if we be dead with him, we shall also live with him: If we suffer, we shall also reign with him* (2 Timothy 2:11-12). The slave becomes a freed-man, the dying becomes reigning — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 70512
  FROM _session253_igrom1_lookup sv, _session253_igrom1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-romans' AND sv.chapter_number=1 AND sv.verse_number=4
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='ignatius-romans' AND ev.chapter_number=1 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ignatius-romans-1-wheat-pure-bread
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 12:24 — *Verily, verily, I say unto you, Except a corn of wheat fall into the ground and die, it abideth alone: but if it die, it bringeth forth much fruit.* Ignatius''s wheat ground to pure bread is the Master''s own grain that must die to bear fruit.'
  FROM cross_reference_threads t, cross_references x, _session253_igrom1_lookup sv, _session253_igrom1_lookup tv
 WHERE t.slug='ignatius-romans-1-wheat-pure-bread'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-romans' AND sv.chapter_number=1 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=12 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Corinthians 15:35 — *But some man will say, How are the dead raised up? and with what body do they come?* The ground grain looks to the resurrection body, so the teeth of the beasts are not the end but the sowing.'
  FROM cross_reference_threads t, cross_references x, _session253_igrom1_lookup sv, _session253_igrom1_lookup tv
 WHERE t.slug='ignatius-romans-1-wheat-pure-bread'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-romans' AND sv.chapter_number=1 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 12:1 — *I beseech you therefore, brethren, by the mercies of Elohim (God), that ye present your bodies a living sacrifice, holy, acceptable unto Elohim (God), which is your reasonable service.* Ignatius asks to be found a sacrifice, the very living offering Sha''ul commands.'
  FROM cross_reference_threads t, cross_references x, _session253_igrom1_lookup sv, _session253_igrom1_lookup tv
 WHERE t.slug='ignatius-romans-1-wheat-pure-bread'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-romans' AND sv.chapter_number=1 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=12 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Timothy 4:6 — *For I am now ready to be offered, and the time of my departure is at hand.* The poured-out libation of v2 and the sacrifice of v4 echo Sha''ul facing his own death as an offering.'
  FROM cross_reference_threads t, cross_references x, _session253_igrom1_lookup sv, _session253_igrom1_lookup tv
 WHERE t.slug='ignatius-romans-1-wheat-pure-bread'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-romans' AND sv.chapter_number=1 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='2-timothy' AND tv.chapter_number=4 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ignatius-romans-1-to-die-is-gain
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Philippians 1:21 — *For to me to live is Messiah (Christ), and to die is gain.* Ignatius''s preference for death over reigning over the earth is Sha''ul''s gain-in-dying word for word in spirit.'
  FROM cross_reference_threads t, cross_references x, _session253_igrom1_lookup sv, _session253_igrom1_lookup tv
 WHERE t.slug='ignatius-romans-1-to-die-is-gain'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-romans' AND sv.chapter_number=1 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=1 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Philippians 1:23 — *For I am in a strait betwixt two, having a desire to depart, and to be with Messiah (Christ); which is far better.* Him I seek, Him I desire — Ignatius''s longing to depart and be with the Master mirrors Sha''ul''s.'
  FROM cross_reference_threads t, cross_references x, _session253_igrom1_lookup sv, _session253_igrom1_lookup tv
 WHERE t.slug='ignatius-romans-1-to-die-is-gain'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-romans' AND sv.chapter_number=1 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=1 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Philippians 3:8 — *Yea doubtless, and I count all things but loss for the excellency of the knowledge of HaMashiach Yahusha (Christ Jesus) my Lord: for whom I have suffered the loss of all things, and do count them but dung, that I may win Messiah (Christ).* To attain unto Messiah Ignatius counts the visible and invisible nothing, as Sha''ul counts all loss.'
  FROM cross_reference_threads t, cross_references x, _session253_igrom1_lookup sv, _session253_igrom1_lookup tv
 WHERE t.slug='ignatius-romans-1-to-die-is-gain'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-romans' AND sv.chapter_number=1 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Galatians 2:20 — *I am crucified with Messiah (Christ): nevertheless I live; yet not I, but Messiah (Christ) liveth in me: and the life which I now live in the flesh I live by the faith of the Son of Elohim (God), who loved me, and gave himself for me.* Ignatius desires Him who died and rose for us, the same crucified-yet-living life Sha''ul confesses.'
  FROM cross_reference_threads t, cross_references x, _session253_igrom1_lookup sv, _session253_igrom1_lookup tv
 WHERE t.slug='ignatius-romans-1-to-die-is-gain'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-romans' AND sv.chapter_number=1 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=2 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ignatius-romans-1-living-water-come-to-the-father
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 4:14 — *But whosoever drinketh of the water that I shall give him shall never thirst; but the water that I shall give him shall be in him a well of water springing up into everlasting life.* The living water speaking within Ignatius is the springing well the Master gives.'
  FROM cross_reference_threads t, cross_references x, _session253_igrom1_lookup sv, _session253_igrom1_lookup tv
 WHERE t.slug='ignatius-romans-1-living-water-come-to-the-father'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-romans' AND sv.chapter_number=1 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=4 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 7:37 — *In the last day, that great day of the feast, Yahusha (Jesus) stood and cried, saying, If any man thirst, let him come unto me, and drink.* Ignatius''s inward water that says Come answers the Master''s feast-day cry to come and drink.'
  FROM cross_reference_threads t, cross_references x, _session253_igrom1_lookup sv, _session253_igrom1_lookup tv
 WHERE t.slug='ignatius-romans-1-living-water-come-to-the-father'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-romans' AND sv.chapter_number=1 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=7 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 7:38 — *He that believeth on me, as the scripture hath said, out of his belly shall flow rivers of living water.* The water living and speaking in Ignatius is the river the Master promised would flow from the believer.'
  FROM cross_reference_threads t, cross_references x, _session253_igrom1_lookup sv, _session253_igrom1_lookup tv
 WHERE t.slug='ignatius-romans-1-living-water-come-to-the-father'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-romans' AND sv.chapter_number=1 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=7 AND tv.verse_number=38
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 22:17 — *And the Spirit and the bride say, Come. And let him that heareth say, Come. And let him that is athirst come. And whosoever will, let him take the water of life freely.* The voice within Ignatius saying Come to the Father is the Spirit and the Bride''s closing call.'
  FROM cross_reference_threads t, cross_references x, _session253_igrom1_lookup sv, _session253_igrom1_lookup tv
 WHERE t.slug='ignatius-romans-1-living-water-come-to-the-father'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-romans' AND sv.chapter_number=1 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ignatius-romans-1-flesh-seed-of-david
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Romans 1:3 — *Concerning his Son Yahusha HaMashiach (Jesus Christ) our Lord, which was made of the seed of David according to the flesh.* Ignatius''s flesh of Messiah who was of the seed of David is Sha''ul''s opening gospel verbatim in substance.'
  FROM cross_reference_threads t, cross_references x, _session253_igrom1_lookup sv, _session253_igrom1_lookup tv
 WHERE t.slug='ignatius-romans-1-flesh-seed-of-david'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-romans' AND sv.chapter_number=1 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Timothy 2:8 — *Remember that Yahusha HaMashiach (Jesus Christ) of the seed of David was raised from the dead according to my gospel.* The seed-of-David flesh Ignatius confesses is the same risen Messiah Sha''ul bids Timothy remember.'
  FROM cross_reference_threads t, cross_references x, _session253_igrom1_lookup sv, _session253_igrom1_lookup tv
 WHERE t.slug='ignatius-romans-1-flesh-seed-of-david'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-romans' AND sv.chapter_number=1 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='2-timothy' AND tv.chapter_number=2 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 6:51 — *I am the living bread which came down from heaven: if any man eat of this bread, he shall live for ever: and the bread that I will give is my flesh, which I will give for the life of the world.* The bread of Elohim that is the flesh of Messiah is the Master''s own living bread.'
  FROM cross_reference_threads t, cross_references x, _session253_igrom1_lookup sv, _session253_igrom1_lookup tv
 WHERE t.slug='ignatius-romans-1-flesh-seed-of-david'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-romans' AND sv.chapter_number=1 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=6 AND tv.verse_number=51
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'John 6:55 — *For my flesh is meat indeed, and my blood is drink indeed.* Ignatius desires the flesh for bread and the blood for a draught, the very meat and drink the Master named.'
  FROM cross_reference_threads t, cross_references x, _session253_igrom1_lookup sv, _session253_igrom1_lookup tv
 WHERE t.slug='ignatius-romans-1-flesh-seed-of-david'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-romans' AND sv.chapter_number=1 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=6 AND tv.verse_number=55
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ignatius-romans-1-rise-free-suffer-reign
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Romans 6:5 — *For if we have been planted together in the likeness of his death, we shall be also in the likeness of his resurrection.* Ignatius''s promise to rise free in Him is the planting-into-death-and-resurrection Sha''ul lays out.'
  FROM cross_reference_threads t, cross_references x, _session253_igrom1_lookup sv, _session253_igrom1_lookup tv
 WHERE t.slug='ignatius-romans-1-rise-free-suffer-reign'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-romans' AND sv.chapter_number=1 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=6 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 6:4 — *Therefore we are buried with him by baptism into death: that like as Messiah (Christ) was raised up from the dead by the glory of the Father, even so we also should walk in newness of life.* The freed-man who shall rise in Him walks the buried-and-raised path Sha''ul describes.'
  FROM cross_reference_threads t, cross_references x, _session253_igrom1_lookup sv, _session253_igrom1_lookup tv
 WHERE t.slug='ignatius-romans-1-rise-free-suffer-reign'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-romans' AND sv.chapter_number=1 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=6 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Timothy 2:11 — *It is a faithful saying: For if we be dead with him, we shall also live with him.* Ignatius the slave who will rise free leans on the faithful saying that dying with Him is living with Him.'
  FROM cross_reference_threads t, cross_references x, _session253_igrom1_lookup sv, _session253_igrom1_lookup tv
 WHERE t.slug='ignatius-romans-1-rise-free-suffer-reign'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-romans' AND sv.chapter_number=1 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='2-timothy' AND tv.chapter_number=2 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Timothy 2:12 — *If we suffer, we shall also reign with him: if we deny him, he also will deny us.* If I shall suffer, then am I a freed-man — Ignatius''s suffering-unto-freedom is the suffering-unto-reigning Sha''ul names.'
  FROM cross_reference_threads t, cross_references x, _session253_igrom1_lookup sv, _session253_igrom1_lookup tv
 WHERE t.slug='ignatius-romans-1-rise-free-suffer-reign'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-romans' AND sv.chapter_number=1 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='2-timothy' AND tv.chapter_number=2 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

