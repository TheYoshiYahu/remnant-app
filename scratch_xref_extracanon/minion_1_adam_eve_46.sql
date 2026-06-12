-- ----- fragment: minion_1adameve_46.sql (session253 1-adam-eve 46) -----
-- Source anchor: adam-eve-conflict/1-adam-eve ch46. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1ae46 (view _session253_1ae46_lookup). Sort band base 65125, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1ae46_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-adam-eve-46-fire-assault-angel-stays-it
  ('adam-eve-conflict', '1-adam-eve', 46, 1, 'canon', '1-peter', 5, 8, 'free', E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour:* Satan blowing the coal-fire to a whirlwind over Adam and Eve is that same prowling adversary seeking to devour the seed of the woman.'),
  ('adam-eve-conflict', '1-adam-eve', 46, 3, 'canon', 'psalms', 34, 7, 'free', E'Psalm 34:7 — *The angel of Yahuah (LORD) encampeth round about them that fear him, and delivereth them.* The angel Elohim sends to stay the burning fire is this encamping deliverer who guards them that fear Yahuah.'),
  ('adam-eve-conflict', '1-adam-eve', 46, 1, 'canon', 'hebrews', 12, 29, 'free', E'Hebrews 12:29 — *For our Elohim (God) is a consuming fire.* Satan counterfeits with a fire that scorches but cannot consume, while the true consuming fire is Yahuah Himself, who here delivers rather than destroys.'),
  -- thread: 1-adam-eve-46-see-satans-love-many-times-delivered
  ('adam-eve-conflict', '1-adam-eve', 46, 4, 'canon', '2-corinthians', 11, 14, 'free', E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* Yahuah strips off the disguise — the one who "pretended to give you the Godhead" is the angel of light whose love is a mask for murder.'),
  ('adam-eve-conflict', '1-adam-eve', 46, 4, 'canon', 'john', 8, 44, 'free', E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* The one who "seeks to destroy you from off the earth" is the murderer and liar from the beginning.'),
  ('adam-eve-conflict', '1-adam-eve', 46, 5, 'canon', 'psalms', 34, 19, 'free', E'Psalm 34:19 — *Many are the afflictions of the righteous: but Yahuah (LORD) delivereth him out of them all.* Yahuah''s word "how many times have I delivered you out of his hand" is the very mercy this Psalm proclaims over the afflicted righteous.'),
  ('adam-eve-conflict', '1-adam-eve', 46, 5, 'canon', '1-corinthians', 10, 13, 'free', E'1 Corinthians 10:13 — *There hath no temptation taken you but such as is common to man: but Elohim (God) is faithful, who will not suffer you to be tempted above that ye are able; but will with the temptation also make a way to escape, that ye may be able to bear it.* The repeated deliverance out of Satan''s hand is this faithful Elohim making a way to escape every assault.'),
  -- thread: 1-adam-eve-46-ye-shall-be-as-gods-the-lie-exposed
  ('adam-eve-conflict', '1-adam-eve', 46, 6, 'canon', 'genesis', 3, 5, 'free', E'Genesis 3:5 — *For Elohim (God) doth know that in the day ye eat thereof, then your eyes shall be opened, and ye shall be as gods, knowing good and evil.* Yahuah quotes the serpent''s own promise back to Eve and shows that the fire, not the Godhead, was its fulfilment.'),
  ('adam-eve-conflict', '1-adam-eve', 46, 6, 'canon', '2-corinthians', 11, 3, 'free', E'2 Corinthians 11:3 — *But I fear, lest by any means, as the serpent beguiled Eve through his subtilty, so your minds should be corrupted from the simplicity that is in Messiah (Christ).* The promise of becoming "like gods" is the same subtilty by which the serpent beguiled Eve.'),
  ('adam-eve-conflict', '1-adam-eve', 46, 7, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Satan''s bitterness against Eve "and your descendants that will come after you" is the seed-war Yahuah Himself decreed in the garden.'),
  ('adam-eve-conflict', '1-adam-eve', 46, 7, 'canon', 'romans', 16, 20, 'free', E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* The descendants Satan rages against are the seed in whom the head-crushing promise is finally fulfilled.'),
  -- thread: 1-adam-eve-46-garments-burned-naked-again
  ('adam-eve-conflict', '1-adam-eve', 46, 8, 'canon', 'genesis', 3, 21, 'free', E'Genesis 3:21 — *Unto Adam also and to his wife did Yahuah Elohim (the LORD God) make coats of skins, and clothed them.* The garments burned off by Satan''s fire are the very coats of skins Yahuah Himself made and clothed them with.'),
  ('adam-eve-conflict', '1-adam-eve', 46, 8, 'canon', 'genesis', 2, 17, 'free', E'Genesis 2:17 — *But of the tree of the knowledge of good and evil, thou shalt not eat of it: for in the day that thou eatest thereof thou shalt surely die.* The shame of being "again naked" recalls the death and exposure that the broken commandment first brought upon them.'),
  ('adam-eve-conflict', '1-adam-eve', 46, 8, 'canon', 'genesis', 3, 24, 'free', E'Genesis 3:24 — *So he drove out the man; and he placed at the east of the garden of Eden Cherubims, and a flaming sword which turned every way, to keep the way of the tree of life.* The fire that strips their covering on the way to the cave echoes the flaming sword that barred the way back to Eden.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1ae46_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1ae46_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-46-fire-assault-angel-stays-it',
       E'Satan''s fire on the way, and the angel that stayed it',
       E'Come and see how the serpent strikes at the seed with fire, and how Yahuah''s mercy keeps it. *Then Adam and Eve began again to come into the cave. And when they came to the way between the fire, Satan blew into the fire like a whirlwind, and caused the burning coal-fire to cover Adam and Eve; so that their bodies were singed; and the coal-fire scorched them* (1-adam-eve 46:1). They cry, *O Yahuah (Lord), save us! Leave us not to be consumed and plagued by this burning fire* (1-adam-eve 46:2), and *Elohim (God) sent His angel that stayed the burning fire* (1-adam-eve 46:3). It ain''t new: the adversary is *your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour* (1 Peter 5:8), yet *the angel of Yahuah (LORD) encampeth round about them that fear him, and delivereth them* (Psalm 34:7). The same Elohim who appears to Adam in fire is the One of whom it is written *our Elohim (God) is a consuming fire* (Hebrews 12:29) — the fire that scorches the flesh cannot consume the seed He has sworn to keep.',
       sv.verse_id, ev.verse_id, 'extras', 65125
  FROM _session253_1ae46_lookup sv, _session253_1ae46_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=46 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=46 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-46-see-satans-love-many-times-delivered',
       E'See Satan''s love — and how many times I delivered you',
       E'Come and see the deceiver unmasked, and the Deliverer remembered. *And Elohim (God) said to Adam, "See Satan''s love for you, who pretended to give you the Godhead and greatness; and, behold, he burns you with fire, and seeks to destroy you from off the earth"* (1-adam-eve 46:4), *"I created you, and how many times have I delivered you out of his hand?"* (1-adam-eve 46:5). It ain''t new: *Satan himself is transformed into an angel of light* (2 Corinthians 11:14), the murderer who *was a murderer from the beginning, and abode not in the truth* (John 8:44). But over against his pretended love stands the covenant faithfulness that *will not suffer you to be tempted above that ye are able; but will with the temptation also make a way to escape* (1 Corinthians 10:13), for *many are the afflictions of the righteous: but Yahuah (LORD) delivereth him out of them all* (Psalm 34:19).',
       sv.verse_id, ev.verse_id, 'extras', 65128
  FROM _session253_1ae46_lookup sv, _session253_1ae46_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=46 AND sv.verse_number=4
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=46 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-46-ye-shall-be-as-gods-the-lie-exposed',
       E'Ye shall be as gods — the garden lie burned bare',
       E'Come and see the old lie quoted back and judged. *Elohim (God) said again to Eve, "What is that he promised you in the garden, saying, ''As soon as you eat from the tree, your eyes will be opened, and you shall become like gods, knowing good and evil.'' But look! He has burnt your bodies with fire"* (1-adam-eve 46:6); *"as to the Godhead he cannot give it to you... No, he was bitter against you and your descendants, that will come after you"* (1-adam-eve 46:7). It ain''t new — this is the serpent''s first sentence verbatim: *For Elohim (God) doth know that in the day ye eat thereof, then your eyes shall be opened, and ye shall be as gods, knowing good and evil* (Genesis 3:5), the subtilty by which *the serpent beguiled Eve through his subtilty* (2 Corinthians 11:3). And the bitterness against "your descendants that will come after you" is the very enmity Yahuah decreed: *I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel* (Genesis 3:15).',
       sv.verse_id, ev.verse_id, 'extras', 65131
  FROM _session253_1ae46_lookup sv, _session253_1ae46_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=46 AND sv.verse_number=6
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=46 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-46-garments-burned-naked-again',
       E'The Word withdrawn, the garments burned, naked again',
       E'Come and see the coats of skins burned off and the shame of Eden returning. *And Elohim (God) withdrew His Word from them. At this time, the garments that Yahuah (Lord) had given them in Genesis 3:21 were burned off so that Adam and Eve were again naked* (1-adam-eve 46:8). It ain''t new: those coats were Yahuah''s own first covering — *Unto Adam also and to his wife did Yahuah Elohim (the LORD God) make coats of skins, and clothed them* (Genesis 3:21), given the very day they learned the wage of the lie, *in the day that thou eatest thereof thou shalt surely die* (Genesis 2:17). Satan''s fire strips the covering Yahuah gave, leaving them as naked as the day the flaming sword shut the gate (Genesis 3:24) — yet the Word that withdrew is the same Word who had promised to come and save.',
       sv.verse_id, ev.verse_id, 'extras', 65134
  FROM _session253_1ae46_lookup sv, _session253_1ae46_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=46 AND sv.verse_number=8
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=46 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-adam-eve-46-fire-assault-angel-stays-it
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour:* Satan blowing the coal-fire to a whirlwind over Adam and Eve is that same prowling adversary seeking to devour the seed of the woman.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae46_lookup sv, _session253_1ae46_lookup tv
 WHERE t.slug='1-adam-eve-46-fire-assault-angel-stays-it'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=46 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 34:7 — *The angel of Yahuah (LORD) encampeth round about them that fear him, and delivereth them.* The angel Elohim sends to stay the burning fire is this encamping deliverer who guards them that fear Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae46_lookup sv, _session253_1ae46_lookup tv
 WHERE t.slug='1-adam-eve-46-fire-assault-angel-stays-it'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=46 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=34 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 12:29 — *For our Elohim (God) is a consuming fire.* Satan counterfeits with a fire that scorches but cannot consume, while the true consuming fire is Yahuah Himself, who here delivers rather than destroys.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae46_lookup sv, _session253_1ae46_lookup tv
 WHERE t.slug='1-adam-eve-46-fire-assault-angel-stays-it'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=46 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-46-see-satans-love-many-times-delivered
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* Yahuah strips off the disguise — the one who "pretended to give you the Godhead" is the angel of light whose love is a mask for murder.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae46_lookup sv, _session253_1ae46_lookup tv
 WHERE t.slug='1-adam-eve-46-see-satans-love-many-times-delivered'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=46 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=11 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* The one who "seeks to destroy you from off the earth" is the murderer and liar from the beginning.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae46_lookup sv, _session253_1ae46_lookup tv
 WHERE t.slug='1-adam-eve-46-see-satans-love-many-times-delivered'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=46 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 34:19 — *Many are the afflictions of the righteous: but Yahuah (LORD) delivereth him out of them all.* Yahuah''s word "how many times have I delivered you out of his hand" is the very mercy this Psalm proclaims over the afflicted righteous.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae46_lookup sv, _session253_1ae46_lookup tv
 WHERE t.slug='1-adam-eve-46-see-satans-love-many-times-delivered'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=46 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=34 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Corinthians 10:13 — *There hath no temptation taken you but such as is common to man: but Elohim (God) is faithful, who will not suffer you to be tempted above that ye are able; but will with the temptation also make a way to escape, that ye may be able to bear it.* The repeated deliverance out of Satan''s hand is this faithful Elohim making a way to escape every assault.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae46_lookup sv, _session253_1ae46_lookup tv
 WHERE t.slug='1-adam-eve-46-see-satans-love-many-times-delivered'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=46 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=10 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-46-ye-shall-be-as-gods-the-lie-exposed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:5 — *For Elohim (God) doth know that in the day ye eat thereof, then your eyes shall be opened, and ye shall be as gods, knowing good and evil.* Yahuah quotes the serpent''s own promise back to Eve and shows that the fire, not the Godhead, was its fulfilment.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae46_lookup sv, _session253_1ae46_lookup tv
 WHERE t.slug='1-adam-eve-46-ye-shall-be-as-gods-the-lie-exposed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=46 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Corinthians 11:3 — *But I fear, lest by any means, as the serpent beguiled Eve through his subtilty, so your minds should be corrupted from the simplicity that is in Messiah (Christ).* The promise of becoming "like gods" is the same subtilty by which the serpent beguiled Eve.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae46_lookup sv, _session253_1ae46_lookup tv
 WHERE t.slug='1-adam-eve-46-ye-shall-be-as-gods-the-lie-exposed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=46 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=11 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Satan''s bitterness against Eve "and your descendants that will come after you" is the seed-war Yahuah Himself decreed in the garden.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae46_lookup sv, _session253_1ae46_lookup tv
 WHERE t.slug='1-adam-eve-46-ye-shall-be-as-gods-the-lie-exposed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=46 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* The descendants Satan rages against are the seed in whom the head-crushing promise is finally fulfilled.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae46_lookup sv, _session253_1ae46_lookup tv
 WHERE t.slug='1-adam-eve-46-ye-shall-be-as-gods-the-lie-exposed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=46 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=16 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-46-garments-burned-naked-again
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:21 — *Unto Adam also and to his wife did Yahuah Elohim (the LORD God) make coats of skins, and clothed them.* The garments burned off by Satan''s fire are the very coats of skins Yahuah Himself made and clothed them with.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae46_lookup sv, _session253_1ae46_lookup tv
 WHERE t.slug='1-adam-eve-46-garments-burned-naked-again'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=46 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 2:17 — *But of the tree of the knowledge of good and evil, thou shalt not eat of it: for in the day that thou eatest thereof thou shalt surely die.* The shame of being "again naked" recalls the death and exposure that the broken commandment first brought upon them.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae46_lookup sv, _session253_1ae46_lookup tv
 WHERE t.slug='1-adam-eve-46-garments-burned-naked-again'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=46 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 3:24 — *So he drove out the man; and he placed at the east of the garden of Eden Cherubims, and a flaming sword which turned every way, to keep the way of the tree of life.* The fire that strips their covering on the way to the cave echoes the flaming sword that barred the way back to Eden.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae46_lookup sv, _session253_1ae46_lookup tv
 WHERE t.slug='1-adam-eve-46-garments-burned-naked-again'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=46 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

