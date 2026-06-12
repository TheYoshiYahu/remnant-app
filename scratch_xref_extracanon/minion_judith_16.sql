-- ----- fragment: minion_judith_16.sql (session253 judith 16) -----
-- Source anchor: apocrypha/judith ch16. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: jdt16 (view _session253_jdt16_lookup). Sort band base 60375, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_jdt16_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: judith-16-breaketh-the-battles
  ('apocrypha', 'judith', 16, 1, 'canon', 'exodus', 15, 1, 'free', E'Exodus 15:1 — *Then sang Moses and the children of Yashar''el (Israel) this song unto Yahuah (LORD), and spake, saying, I will sing unto Yahuah (LORD), for he hath triumphed gloriously: the horse and his rider hath he thrown into the sea.* Judith''s whole nation sings after her exactly as Israel sang after Moses at the Red Sea — the same redeemed-people chorus.'),
  ('apocrypha', 'judith', 16, 3, 'canon', 'exodus', 15, 3, 'free', E'Exodus 15:3 — *Yahuah (LORD) is a man of war: Yahuah (LORD) is his name.* The One who ''breaks the battles'' in Judith 16:3 is the very Man of War who threw Pharaoh''s host into the sea.'),
  ('apocrypha', 'judith', 16, 1, 'canon', 'judges', 5, 1, 'free', E'Judges 5:1 — *Then sang Deborah and Barak the son of Abinoam on that day, saying,* Judith 16''s woman-led thanksgiving stands in the line of Deborah''s song after another tyrant''s army was undone.'),
  ('apocrypha', 'judith', 16, 3, 'canon', 'psalms', 46, 9, 'free', E'Psalm 46:9 — *He maketh wars to cease unto the end of the earth; he breaketh the bow, and cutteth the spear in sunder; he burneth the chariot in the fire.* The Psalm names the same Battle-Breaker Judith praises for delivering her out of the hand of the persecutor.'),
  -- thread: judith-16-assur-out-of-the-north
  ('apocrypha', 'judith', 16, 4, 'canon', 'isaiah', 10, 5, 'free', E'Isaiah 10:5 — *O Assyrian, the rod of mine anger, and the staff in their hand is mine indignation.* Assur in Judith 16:4 is the same proud northern instrument that boasts as if it were not a mere rod in Yahuah''s hand.'),
  ('apocrypha', 'judith', 16, 5, 'canon', 'psalms', 137, 9, 'free', E'Psalm 137:9 — *Happy shall he be, that taketh and dasheth thy little ones against the stones.* Holofernes'' brag to dash the sucking children (Judith 16:5) is exactly the cruelty the Psalm pronounces back upon Babylon herself.'),
  -- thread: judith-16-hand-of-a-woman
  ('apocrypha', 'judith', 16, 6, 'canon', '1-corinthians', 1, 27, 'free', E'1 Corinthians 1:27 — *But Elohim (God) hath chosen the foolish things of the world to confound the wise; and Elohim (God) hath chosen the weak things of the world to confound the things which are mighty;* Yahuah disappointing a vast army by the hand of one widow (Judith 16:6) is the very weak-confound-the-mighty principle Paul preaches.'),
  ('apocrypha', 'judith', 16, 7, 'canon', '1-samuel', 2, 4, 'free', E'1 Samuel 2:4 — *The bows of the mighty men are broken, and they that stumbled are girded with strength.* Hannah''s song already declared what Judith 16:7 enacts — the mighty one falls not by young warriors but by Yahuah''s reversal.'),
  ('apocrypha', 'judith', 16, 6, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The tyrant felled ''by the hand of a woman'' (Judith 16:6) is an echo of Eden''s first promise that the head of the proud enemy is bruised through the woman.'),
  -- thread: judith-16-fauchion-through-the-neck
  ('apocrypha', 'judith', 16, 9, 'canon', 'judges', 5, 24, 'free', E'Judges 5:24 — *Blessed above women shall Jael the wife of Heber the Kenite be, blessed shall she be above women in the tent.* Jael smiting Sisera in the tent is the nearest kin to Judith 16:9, where the fauchion passes through the enemy''s neck by a woman''s hand.'),
  ('apocrypha', 'judith', 16, 11, 'canon', 'luke', 1, 52, 'free', E'Luke 1:52 — *He hath put down the mighty from their seats, and exalted them of low degree.* Judith''s afflicted shouting for joy while the boasters are overthrown (Judith 16:11) is the very reversal Mary sings in the Magnificat.'),
  ('apocrypha', 'judith', 16, 11, 'canon', 'luke', 1, 48, 'free', E'Luke 1:48 — *For he hath regarded the low estate of his handmaiden: for, behold, from henceforth all generations shall call me blessed.* The low and weak of Israel lifted up in Judith 16:11 foreshadow the low-estate handmaiden Yahuah regards in the Magnificat.'),
  -- thread: judith-16-let-all-creatures-serve
  ('apocrypha', 'judith', 16, 13, 'canon', 'psalms', 96, 1, 'free', E'Psalm 96:1 — *O sing unto Yahuah (LORD) a new song: sing unto Yahuah (LORD), all the earth.* Judith''s resolve to ''sing to Yahuah a new song'' (Judith 16:13) is the Psalter''s own summons to the whole earth to sing it.'),
  ('apocrypha', 'judith', 16, 14, 'canon', 'psalms', 148, 5, 'free', E'Psalm 148:5 — *Let them praise the name of Yahuah (LORD): for he commanded, and they were created.* Judith 16:14 (''you spakest, and they were made'') confesses the same creation-by-the-word for which Psalm 148 calls all creatures to praise.'),
  ('apocrypha', 'judith', 16, 17, 'canon', 'isaiah', 66, 24, 'free', E'Isaiah 66:24 — *And they shall go forth, and look upon the carcases of the men that have transgressed against me: for their worm shall not die, neither shall their fire be quenched; and they shall be an abhorring unto all flesh.* Judith''s ''fire and worms in their flesh'' for the nations that rise up (Judith 16:17) speaks Isaiah''s undying worm and unquenchable fire upon the transgressors.'),
  -- thread: judith-16-up-to-keep-the-feast
  ('apocrypha', 'judith', 16, 18, 'canon', 'deuteronomy', 16, 16, 'free', E'Deuteronomy 16:16 — *Three times in a year shall all thy males appear before Yahuah Elohayka (the LORD thy God) in the place which he shall choose; in the feast of unleavened bread, and in the feast of weeks, and in the feast of tabernacles: and they shall not appear before Yahuah (LORD) empty:* The people going up to worship at Jerusalem in Judith 16:18 keeps the very pilgrimage-feast Torah commands at the chosen place.'),
  ('apocrypha', 'judith', 16, 20, 'canon', 'deuteronomy', 16, 15, 'free', E'Deuteronomy 16:15 — *Seven days shalt thou keep a solemn feast unto Yahuah Elohayka (the LORD thy God) in the place which Yahuah (LORD) shall choose: because Yahuah Elohayka (the LORD thy God) shall bless thee in all thine increase, and in all the works of thine hands, therefore thou shalt surely rejoice.* The people''s joyful feasting before the sanctuary in Judith 16:20 is the appointed solemn feast of rejoicing Torah set at the chosen place.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_jdt16_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_jdt16_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-16-breaketh-the-battles',
       E'Yahuah breaketh the battles — the song of the delivered',
       E'Judith lifts the same victory-song her mothers and fathers sang at the sea and at Kishon: *And Judith said, Begin to my Elohim (God) with timbrels, sing to my Elohim (God) with cymbals: tune to him a new psalm: exalt him, and call upon his name. For Yahuah (God) breaks the battles: for among the camps in the midst of the people he has delivered me out of the hands of them that persecuted me.* (Judith 16:2-3) It ain''t new — it is Moses'' own song restored to a daughter''s mouth: *Then sang Moses and the children of Yashar''el (Israel) this song unto Yahuah (LORD)... I will sing unto Yahuah (LORD), for he hath triumphed gloriously: the horse and his rider hath he thrown into the sea.* (Exodus 15:1) The Warrior who breaks the battle is named there: *Yahuah (LORD) is a man of war: Yahuah (LORD) is his name.* (Exodus 15:3) And it is Deborah''s song again, woman-led: *Then sang Deborah and Barak the son of Abinoam on that day, saying* (Judges 5:1). The deliverance is His, not the army''s: *He maketh wars to cease unto the end of the earth; he breaketh the bow, and cutteth the spear in sunder; he burneth the chariot in the fire.* (Psalm 46:9)',
       sv.verse_id, ev.verse_id, 'extras', 60375
  FROM _session253_jdt16_lookup sv, _session253_jdt16_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=16 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=16 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-16-assur-out-of-the-north',
       E'Assur out of the north — the kingdom-of-man tyrant',
       E'The boast of Holofernes is the boast of every empire that demands the earth bow to it: *Assur came out of the mountains from the north, he came with ten thousands of his army, the multitude of which stopped the torrents, and their horsemen have covered the hills. He bragged that he would burn up my borders, and kill my young men with the sword, and dash the sucking children against the ground, and make my infants as a prey, and my virgins as a spoil.* (Judith 16:4-5) This is the same northern menace the prophets indict — the rod that lifts itself against the One who wields it: *O Assyrian, the rod of mine anger, and the staff in their hand is mine indignation.* (Isaiah 10:5) Babylon makes the identical brag against the little ones, and the same vengeance answers: *Happy shall he be, that taketh and dasheth thy little ones against the stones.* (Psalm 137:9) The system that exalts itself is dismantled — the proud overthrown.',
       sv.verse_id, ev.verse_id, 'extras', 60378
  FROM _session253_jdt16_lookup sv, _session253_jdt16_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=16 AND sv.verse_number=4
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=16 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-16-hand-of-a-woman',
       E'By the hand of a woman — the weak confound the mighty',
       E'The decisive line of the whole book: *But the Almighty Yahuah (God) has disappointed them by the hand of a woman. For the mighty one did not fall by the young men, neither did the sons of the Titans smite him, nor high giants set upon him: but Judith the daughter of Merari weakened him with the beauty of her countenance.* (Judith 16:6-7) This is heaven''s settled pattern — not many mighty, but the weak chosen to shame the strong: *But Elohim (God) hath chosen the foolish things of the world to confound the wise; and Elohim (God) hath chosen the weak things of the world to confound the things which are mighty;* (1 Corinthians 1:27) Hannah sang it before her: *The bows of the mighty men are broken, and they that stumbled are girded with strength.* (1 Samuel 2:4) And the head taken by a woman''s hand reaches back to the first promise — the woman''s seed that bruises the head of the enemy: *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* (Genesis 3:15) Honestly read: Judith is no Messiah, but her hand-of-a-woman victory echoes the Edenic word that the proud serpent-head falls.',
       sv.verse_id, ev.verse_id, 'extras', 60381
  FROM _session253_jdt16_lookup sv, _session253_jdt16_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=16 AND sv.verse_number=6
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=16 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-16-fauchion-through-the-neck',
       E'The fauchion through his neck — Jael and the Magnificat',
       E'The beauty that disarmed the giant and the blade that took his head: *Her sandals ravished his eyes, her beauty took his mind prisoner, and the fauchion passed through his neck.* (Judith 16:9) The afflicted are lifted while the boasters are cast down: *Then my afflicted shouted for joy, and my weak ones cried aloud; but they were astonished: these lifted up their voices, but they were overthrown.* (Judith 16:11) Jael is Judith''s elder sister in the song of the women — the captain undone in the tent by a woman''s hand: *Blessed above women shall Jael the wife of Heber the Kenite be, blessed shall she be above women in the tent.* (Judges 5:24) And the down-casting of the mighty is the very music Miryam (Mary) takes up, the Magnificat''s own ancestor: *He hath put down the mighty from their seats, and exalted them of low degree.* (Luke 1:52) The proud are scattered, the low estate regarded: *For he hath regarded the low estate of his handmaiden: for, behold, from henceforth all generations shall call me blessed.* (Luke 1:48)',
       sv.verse_id, ev.verse_id, 'extras', 60384
  FROM _session253_jdt16_lookup sv, _session253_jdt16_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=16 AND sv.verse_number=9
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=16 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-16-let-all-creatures-serve',
       E'Let all creatures serve thee — He spake, and they were made',
       E'The song turns to a new psalm of the whole creation''s obedience to its Maker: *I will sing to Yahuah (God) a new song: O Yahuah (God), you are great and glorious, wonderful in strength, and invincible. Let all creatures serve you: for you spakest, and they were made, you did send forth your spirit, and it created them, and there is none that can resist your voice.* (Judith 16:13-14) It ain''t new — it is the new song of the Psalter: *O sing unto Yahuah (LORD) a new song: sing unto Yahuah (LORD), all the earth.* (Psalm 96:1) And the creation-by-the-word the Psalm of praise declares: *Let them praise the name of Yahuah (LORD): for he commanded, and they were created.* (Psalm 148:5) Yet the same song carries the dread end of those who transgress — fire and the worm that dieth not: *Woe to the nations that rise up against my kindred! Yahuah (God) Almighty will take vengeance of them in the day of judgment, in putting fire and worms in their flesh; and they shall feel them, and weep for ever.* (Judith 16:17) — which Isaiah seals as the abhorring of all flesh: *And they shall go forth, and look upon the carcases of the men that have transgressed against me: for their worm shall not die, neither shall their fire be quenched; and they shall be an abhorring unto all flesh.* (Isaiah 66:24)',
       sv.verse_id, ev.verse_id, 'extras', 60387
  FROM _session253_jdt16_lookup sv, _session253_jdt16_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=16 AND sv.verse_number=13
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=16 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-16-up-to-keep-the-feast',
       E'Up to Jerusalem to keep the feast — the appointed times',
       E'Victory ends not in conquest but in worship — the people go up to the sanctuary: *Now as soon as they entered into Jerusalem, they worshipped Yahuah (God); and as soon as the people were purified, they offered their burnt offerings, and their free offerings, and their gifts.* (Judith 16:18) *So the people continued feasting in Jerusalem before the sanctuary for the space of three months and Judith remained with them.* (Judith 16:20) This is Torah''s appointed rhythm — all Israel gathering at the chosen place to keep the feast: *Three times in a year shall all thy males appear before Yahuah Elohayka (the LORD thy God) in the place which he shall choose; in the feast of unleavened bread, and in the feast of weeks, and in the feast of tabernacles: and they shall not appear before Yahuah (LORD) empty:* (Deuteronomy 16:16) — and none come empty, as Judith herself dedicates the spoil and the canopy as a gift to Yahuah (Judith 16:19), keeping the solemn feast at the place He chose: *Seven days shalt thou keep a solemn feast unto Yahuah Elohayka (the LORD thy God) in the place which Yahuah (LORD) shall choose... therefore thou shalt surely rejoice.* (Deuteronomy 16:15)',
       sv.verse_id, ev.verse_id, 'extras', 60390
  FROM _session253_jdt16_lookup sv, _session253_jdt16_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=16 AND sv.verse_number=18
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=16 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: judith-16-breaketh-the-battles
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 15:1 — *Then sang Moses and the children of Yashar''el (Israel) this song unto Yahuah (LORD), and spake, saying, I will sing unto Yahuah (LORD), for he hath triumphed gloriously: the horse and his rider hath he thrown into the sea.* Judith''s whole nation sings after her exactly as Israel sang after Moses at the Red Sea — the same redeemed-people chorus.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt16_lookup sv, _session253_jdt16_lookup tv
 WHERE t.slug='judith-16-breaketh-the-battles'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=16 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=15 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 15:3 — *Yahuah (LORD) is a man of war: Yahuah (LORD) is his name.* The One who ''breaks the battles'' in Judith 16:3 is the very Man of War who threw Pharaoh''s host into the sea.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt16_lookup sv, _session253_jdt16_lookup tv
 WHERE t.slug='judith-16-breaketh-the-battles'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=16 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=15 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Judges 5:1 — *Then sang Deborah and Barak the son of Abinoam on that day, saying,* Judith 16''s woman-led thanksgiving stands in the line of Deborah''s song after another tyrant''s army was undone.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt16_lookup sv, _session253_jdt16_lookup tv
 WHERE t.slug='judith-16-breaketh-the-battles'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=16 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=5 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 46:9 — *He maketh wars to cease unto the end of the earth; he breaketh the bow, and cutteth the spear in sunder; he burneth the chariot in the fire.* The Psalm names the same Battle-Breaker Judith praises for delivering her out of the hand of the persecutor.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt16_lookup sv, _session253_jdt16_lookup tv
 WHERE t.slug='judith-16-breaketh-the-battles'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=16 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=46 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-16-assur-out-of-the-north
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 10:5 — *O Assyrian, the rod of mine anger, and the staff in their hand is mine indignation.* Assur in Judith 16:4 is the same proud northern instrument that boasts as if it were not a mere rod in Yahuah''s hand.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt16_lookup sv, _session253_jdt16_lookup tv
 WHERE t.slug='judith-16-assur-out-of-the-north'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=16 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=10 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 137:9 — *Happy shall he be, that taketh and dasheth thy little ones against the stones.* Holofernes'' brag to dash the sucking children (Judith 16:5) is exactly the cruelty the Psalm pronounces back upon Babylon herself.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt16_lookup sv, _session253_jdt16_lookup tv
 WHERE t.slug='judith-16-assur-out-of-the-north'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=16 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=137 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-16-hand-of-a-woman
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Corinthians 1:27 — *But Elohim (God) hath chosen the foolish things of the world to confound the wise; and Elohim (God) hath chosen the weak things of the world to confound the things which are mighty;* Yahuah disappointing a vast army by the hand of one widow (Judith 16:6) is the very weak-confound-the-mighty principle Paul preaches.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt16_lookup sv, _session253_jdt16_lookup tv
 WHERE t.slug='judith-16-hand-of-a-woman'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=16 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=1 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Samuel 2:4 — *The bows of the mighty men are broken, and they that stumbled are girded with strength.* Hannah''s song already declared what Judith 16:7 enacts — the mighty one falls not by young warriors but by Yahuah''s reversal.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt16_lookup sv, _session253_jdt16_lookup tv
 WHERE t.slug='judith-16-hand-of-a-woman'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=16 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The tyrant felled ''by the hand of a woman'' (Judith 16:6) is an echo of Eden''s first promise that the head of the proud enemy is bruised through the woman.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt16_lookup sv, _session253_jdt16_lookup tv
 WHERE t.slug='judith-16-hand-of-a-woman'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=16 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-16-fauchion-through-the-neck
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Judges 5:24 — *Blessed above women shall Jael the wife of Heber the Kenite be, blessed shall she be above women in the tent.* Jael smiting Sisera in the tent is the nearest kin to Judith 16:9, where the fauchion passes through the enemy''s neck by a woman''s hand.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt16_lookup sv, _session253_jdt16_lookup tv
 WHERE t.slug='judith-16-fauchion-through-the-neck'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=16 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=5 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Luke 1:52 — *He hath put down the mighty from their seats, and exalted them of low degree.* Judith''s afflicted shouting for joy while the boasters are overthrown (Judith 16:11) is the very reversal Mary sings in the Magnificat.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt16_lookup sv, _session253_jdt16_lookup tv
 WHERE t.slug='judith-16-fauchion-through-the-neck'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=16 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=52
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Luke 1:48 — *For he hath regarded the low estate of his handmaiden: for, behold, from henceforth all generations shall call me blessed.* The low and weak of Israel lifted up in Judith 16:11 foreshadow the low-estate handmaiden Yahuah regards in the Magnificat.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt16_lookup sv, _session253_jdt16_lookup tv
 WHERE t.slug='judith-16-fauchion-through-the-neck'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=16 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=48
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-16-let-all-creatures-serve
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 96:1 — *O sing unto Yahuah (LORD) a new song: sing unto Yahuah (LORD), all the earth.* Judith''s resolve to ''sing to Yahuah a new song'' (Judith 16:13) is the Psalter''s own summons to the whole earth to sing it.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt16_lookup sv, _session253_jdt16_lookup tv
 WHERE t.slug='judith-16-let-all-creatures-serve'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=16 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=96 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 148:5 — *Let them praise the name of Yahuah (LORD): for he commanded, and they were created.* Judith 16:14 (''you spakest, and they were made'') confesses the same creation-by-the-word for which Psalm 148 calls all creatures to praise.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt16_lookup sv, _session253_jdt16_lookup tv
 WHERE t.slug='judith-16-let-all-creatures-serve'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=16 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=148 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 66:24 — *And they shall go forth, and look upon the carcases of the men that have transgressed against me: for their worm shall not die, neither shall their fire be quenched; and they shall be an abhorring unto all flesh.* Judith''s ''fire and worms in their flesh'' for the nations that rise up (Judith 16:17) speaks Isaiah''s undying worm and unquenchable fire upon the transgressors.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt16_lookup sv, _session253_jdt16_lookup tv
 WHERE t.slug='judith-16-let-all-creatures-serve'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=16 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=66 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-16-up-to-keep-the-feast
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 16:16 — *Three times in a year shall all thy males appear before Yahuah Elohayka (the LORD thy God) in the place which he shall choose; in the feast of unleavened bread, and in the feast of weeks, and in the feast of tabernacles: and they shall not appear before Yahuah (LORD) empty:* The people going up to worship at Jerusalem in Judith 16:18 keeps the very pilgrimage-feast Torah commands at the chosen place.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt16_lookup sv, _session253_jdt16_lookup tv
 WHERE t.slug='judith-16-up-to-keep-the-feast'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=16 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=16 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 16:15 — *Seven days shalt thou keep a solemn feast unto Yahuah Elohayka (the LORD thy God) in the place which Yahuah (LORD) shall choose: because Yahuah Elohayka (the LORD thy God) shall bless thee in all thine increase, and in all the works of thine hands, therefore thou shalt surely rejoice.* The people''s joyful feasting before the sanctuary in Judith 16:20 is the appointed solemn feast of rejoicing Torah set at the chosen place.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt16_lookup sv, _session253_jdt16_lookup tv
 WHERE t.slug='judith-16-up-to-keep-the-feast'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=16 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=16 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

