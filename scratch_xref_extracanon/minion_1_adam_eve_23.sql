-- ----- fragment: minion_1adameve_23.sql (session253 1-adam-eve 23) -----
-- Source anchor: adam-eve-conflict/1-adam-eve ch23. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1ae23 (view _session253_1ae23_lookup). Sort band base 64550, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1ae23_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-adam-eve-23-mercy-take-on-yourself
  ('adam-eve-conflict', '1-adam-eve', 23, 1, 'canon', 'psalms', 51, 17, 'free', E'Psalm 51:17 — *The sacrifices of Elohim (God) are a broken spirit: a broken and a contrite heart, O Elohim (God), thou wilt not despise.* Adam''s broken cry in 1 Adam and Eve 23:1 is the very sacrifice Yahuah does not despise.'),
  ('adam-eve-conflict', '1-adam-eve', 23, 1, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The mercy Adam begs in 1 Adam and Eve 23:1 is the seed-promise that Yahuah Himself would bear and crush the serpent.'),
  ('adam-eve-conflict', '1-adam-eve', 23, 1, 'canon', '1-peter', 1, 19, 'free', E'1 Peter 1:19 — *But with the precious blood of Messiah (Christ), as of a lamb without blemish and without spot:* Adam''s plea that Elohim would take on Himself man''s debt (1 Adam and Eve 23:1) is answered in the foreordained Lamb''s blood.'),
  -- thread: 1-adam-eve-23-stone-altar-offering
  ('adam-eve-conflict', '1-adam-eve', 23, 4, 'jubilees', 'jubilees', 3, 27, 'extras', E'Jubilees 3:27 — *And on that day on which Adam went forth from the garden, he offered as a sweet savour an offering, frankincense, galbanum, and stacte, and spices in the morning with the rising of the sun from the day when he covered his shame.* The restored library twice records Adam raising an altar and offering on the very day he left Eden (1 Adam and Eve 23:4).'),
  ('adam-eve-conflict', '1-adam-eve', 23, 4, 'canon', 'genesis', 8, 20, 'free', E'Genesis 8:20 — *And Noah builded an altar unto Yahuah (LORD); and took of every clean beast, and of every clean fowl, and offered burnt offerings on the altar.* Adam''s altar of stones outside the garden (1 Adam and Eve 23:4) is the same way of offering Noah keeps after the flood.'),
  ('adam-eve-conflict', '1-adam-eve', 23, 5, 'canon', 'genesis', 8, 21, 'free', E'Genesis 8:21 — *And Yahuah (LORD) smelled a sweet savour; and Yahuah (LORD) said in his heart, I will not again curse the ground any more for man’s sake; for the imagination of man’s heart is evil from his youth; neither will I again smite any more every thing living, as I have done.* The offering Adam lays on the altar in 1 Adam and Eve 23:5 looks to the sweet savour that turns away the curse.'),
  ('adam-eve-conflict', '1-adam-eve', 23, 5, 'canon', 'hebrews', 11, 4, 'free', E'Hebrews 11:4 — *By faith Abel offered unto Elohim (God) a more excellent sacrifice than Cain, by which he obtained witness that he was righteous, Elohim (God) testifying of his gifts: and by it he being dead yet speaketh.* Adam''s offering in 1 Adam and Eve 23:5 begins the faith-offering of the kept seed-line continued in his son Abel.'),
  -- thread: 1-adam-eve-23-blood-and-praise
  ('adam-eve-conflict', '1-adam-eve', 23, 8, 'canon', 'leviticus', 17, 11, 'free', E'Leviticus 17:11 — *For the life of the flesh is in the blood: and I have given it to you upon the altar to make an atonement for your souls: for it is the blood that maketh an atonement for the soul.* Adam offering blood on the stones in 1 Adam and Eve 23:8 already reaches for the atonement Torah will name.'),
  ('adam-eve-conflict', '1-adam-eve', 23, 8, 'canon', 'hebrews', 9, 14, 'free', E'Hebrews 9:14 — *How much more shall the blood of Messiah (Christ), who through the eternal Spirit offered himself without spot to Elohim (God), purge your conscience from dead works to serve the living Elohim (God)?* The blood Adam pleads upon the altar (1 Adam and Eve 23:8) is answered in the spotless blood of Messiah.'),
  ('adam-eve-conflict', '1-adam-eve', 23, 6, 'canon', 'hebrews', 13, 15, 'free', E'Hebrews 13:15 — *By him therefore let us offer the sacrifice of praise to Elohim (God) continually, that is, the fruit of our lips giving thanks to his name.* Adam grieving the unceasing praise lost in the garden (1 Adam and Eve 23:6) longs for the very sacrifice of praise the covenant restores.'),
  ('adam-eve-conflict', '1-adam-eve', 23, 6, 'canon', 'psalms', 50, 14, 'free', E'Psalm 50:14 — *Offer unto Elohim (God) thanksgiving; and pay thy vows unto the El Elyon (most High):* The praise Adam mourns in 1 Adam and Eve 23:6 is the thanksgiving Yahuah seeks above slain beasts.'),
  -- thread: 1-adam-eve-23-our-father-prayer
  ('adam-eve-conflict', '1-adam-eve', 23, 9, 'canon', 'matthew', 6, 9, 'free', E'Matthew 6:9 — *After this manner therefore pray ye: Our Father which art in heaven, Hallowed be thy name.* Messiah''s pattern of prayer is the very opening Adam''s house kept generations before (1 Adam and Eve 23:9).'),
  ('adam-eve-conflict', '1-adam-eve', 23, 9, 'canon', 'matthew', 6, 13, 'free', E'Matthew 6:13 — *And lead us not into temptation, but deliver us from evil: For thine is the kingdom, and the power, and the glory, for ever. Amen.* The deliver-us-from-evil and the kingdom-doxology Adam prays in 1 Adam and Eve 23:9 stand word for word in the Saviour''s prayer.'),
  ('adam-eve-conflict', '1-adam-eve', 23, 9, 'canon', 'luke', 11, 2, 'free', E'Luke 11:2 — *And he said unto them, When ye pray, say, Our Father which art in heaven, Hallowed be thy name. Thy kingdom come. Thy will be done, as in heaven, so in earth.* Luke''s witness to the prayer matches the ancient form Adam used in 1 Adam and Eve 23:9.'),
  ('adam-eve-conflict', '1-adam-eve', 23, 9, 'canon', 'matthew', 6, 8, 'free', E'Matthew 6:8 — *Be not ye therefore like unto them: for your Father knoweth what things ye have need of, before ye ask him.* Adam''s confidence in pleading "be gracious unto us" (1 Adam and Eve 23:9) rests on the Father who knows the need before it is asked.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1ae23_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1ae23_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-23-mercy-take-on-yourself',
       E'Have mercy, so far as to take on Yourself what I will do',
       E'Outside the garden Adam cries the deepest cry of the seed-war: *"O Elohim (God), have mercy on me, so far as to take on yourself, that which I will do."* (1 Adam and Eve 23:1) — the first man begging that Yahuah Himself would bear the debt of man. It ain''t new: this is the broken-and-contrite plea the Psalmist names — *The sacrifices of Elohim (God) are a broken spirit: a broken and a contrite heart, O Elohim (God), thou wilt not despise.* (Psalm 51:17). And the One who came near in chapter after chapter as the Word now withdraws — *But Elohim (God) withdrew His Word from Adam and Eve.* (1 Adam and Eve 23:2) — yet the very thing Adam asked, that Yahuah should take on Himself man''s burden, is the gospel foreordained: *But with the precious blood of Messiah (Christ), as of a lamb without blemish and without spot:* (1 Peter 1:19). The seed of the woman would bruise the serpent''s head — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* (Genesis 3:15).',
       sv.verse_id, ev.verse_id, 'extras', 64550
  FROM _session253_1ae23_lookup sv, _session253_1ae23_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=23 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=23 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-23-stone-altar-offering',
       E'The altar of stones and the offering outside Eden',
       E'Strengthening one another, the first man and woman raise the first altar of the fallen world: *Then Adam and Eve took stones and placed them in the shape of an altar; and they took leaves from the trees outside the garden... But that which had dropped on the sand, they took together with the dust with which it was mingled and offered it on the altar as an offering to Elohim (God).* (1 Adam and Eve 23:4-5). It ain''t new — the same primeval witness stands in the restored library: *And on that day on which Adam went forth from the garden, he offered as a sweet savour an offering, frankincense, galbanum, and stacte, and spices in the morning with the rising of the sun from the day when he covered his shame.* (Jubilees 3:27). The altar of unhewn stones outside the garden runs straight to Noah after the flood — *And Noah builded an altar unto Yahuah (LORD); and took of every clean beast, and of every clean fowl, and offered burnt offerings on the altar.* (Genesis 8:20) — and the offering was accepted as a sweet savour: *And Yahuah (LORD) smelled a sweet savour...* (Genesis 8:21). The way was kept by faith from the first day out of Eden — *By faith Abel offered unto Elohim (God) a more excellent sacrifice than Cain... Elohim (God) testifying of his gifts...* (Hebrews 11:4).',
       sv.verse_id, ev.verse_id, 'extras', 64553
  FROM _session253_1ae23_lookup sv, _session253_1ae23_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=23 AND sv.verse_number=4
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=23 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-23-blood-and-praise',
       E'Look at our blood, and accept it like the praise we used to sing',
       E'Under the altar Adam and Eve cry for the mercy of Yahuah and offer their own blood in place of the praise they have lost: *Forgive us our trespass and our sin, and look at us with Thine eye of mercy. For when we were in the garden our praises and our hymns went up before you without ceasing.* (1 Adam and Eve 23:6) ... *Yet now look at our blood which is offered on these stones, and accept it at our hands, like the praise we used to sing to you at first, when in the garden.* (1 Adam and Eve 23:8). The blood upon the stones is the very principle Torah will name — *For the life of the flesh is in the blood: and I have given it to you upon the altar to make an atonement for your souls: for it is the blood that maketh an atonement for the soul.* (Leviticus 17:11) — and which Messiah fulfils once for all: *How much more shall the blood of Messiah (Christ), who through the eternal Spirit offered himself without spot to Elohim (God), purge your conscience from dead works to serve the living Elohim (God)?* (Hebrews 9:14). And the blood offered "like the praise" they once sang becomes the very sacrifice the Renewed Covenant keeps — *By him therefore let us offer the sacrifice of praise to Elohim (God) continually, that is, the fruit of our lips giving thanks to his name.* (Hebrews 13:15). So the Psalmist long after: *Offer unto Elohim (God) thanksgiving; and pay thy vows unto the El Elyon (most High):* (Psalm 50:14).',
       sv.verse_id, ev.verse_id, 'extras', 64556
  FROM _session253_1ae23_lookup sv, _session253_1ae23_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=23 AND sv.verse_number=6
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=23 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-23-our-father-prayer',
       E'Our Father, Who art in Heaven — the prayer before the Saviour came',
       E'Adam''s last request rises in words the Holy Men of old kept long before the manger: *Our Father, Who art in Heaven, be gracious unto us, O Yahuah (Lord) our Elohim (God), hallowed be Your Name... Let Your kingdom reign over us now and forever... And lead us not into temptation, but deliver us from the evil thing; for Thine is the kingdom and Thou shalt reign in glory forever and forevermore, AMEN.* (1 Adam and Eve 23:9). It ain''t new: when Messiah taught His own to pray He gave the same words the kept seed-line had carried — *After this manner therefore pray ye: Our Father which art in heaven, Hallowed be thy name.* (Matthew 6:9) ... *Thy kingdom come. Thy will be done in earth, as it is in heaven.* (Matthew 6:10) ... *And lead us not into temptation, but deliver us from evil: For thine is the kingdom, and the power, and the glory, for ever. Amen.* (Matthew 6:13). Luke records it likewise — *And he said unto them, When ye pray, say, Our Father which art in heaven, Hallowed be thy name. Thy kingdom come. Thy will be done, as in heaven, so in earth.* (Luke 11:2) — for the Father already knows: *for your Father knoweth what things ye have need of, before ye ask him.* (Matthew 6:8).',
       sv.verse_id, ev.verse_id, 'extras', 64559
  FROM _session253_1ae23_lookup sv, _session253_1ae23_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=23 AND sv.verse_number=9
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=23 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-adam-eve-23-mercy-take-on-yourself
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 51:17 — *The sacrifices of Elohim (God) are a broken spirit: a broken and a contrite heart, O Elohim (God), thou wilt not despise.* Adam''s broken cry in 1 Adam and Eve 23:1 is the very sacrifice Yahuah does not despise.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae23_lookup sv, _session253_1ae23_lookup tv
 WHERE t.slug='1-adam-eve-23-mercy-take-on-yourself'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=23 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=51 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The mercy Adam begs in 1 Adam and Eve 23:1 is the seed-promise that Yahuah Himself would bear and crush the serpent.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae23_lookup sv, _session253_1ae23_lookup tv
 WHERE t.slug='1-adam-eve-23-mercy-take-on-yourself'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=23 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Peter 1:19 — *But with the precious blood of Messiah (Christ), as of a lamb without blemish and without spot:* Adam''s plea that Elohim would take on Himself man''s debt (1 Adam and Eve 23:1) is answered in the foreordained Lamb''s blood.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae23_lookup sv, _session253_1ae23_lookup tv
 WHERE t.slug='1-adam-eve-23-mercy-take-on-yourself'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=23 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=1 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-23-stone-altar-offering
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jubilees 3:27 — *And on that day on which Adam went forth from the garden, he offered as a sweet savour an offering, frankincense, galbanum, and stacte, and spices in the morning with the rising of the sun from the day when he covered his shame.* The restored library twice records Adam raising an altar and offering on the very day he left Eden (1 Adam and Eve 23:4).'
  FROM cross_reference_threads t, cross_references x, _session253_1ae23_lookup sv, _session253_1ae23_lookup tv
 WHERE t.slug='1-adam-eve-23-stone-altar-offering'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=23 AND sv.verse_number=4
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=3 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 8:20 — *And Noah builded an altar unto Yahuah (LORD); and took of every clean beast, and of every clean fowl, and offered burnt offerings on the altar.* Adam''s altar of stones outside the garden (1 Adam and Eve 23:4) is the same way of offering Noah keeps after the flood.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae23_lookup sv, _session253_1ae23_lookup tv
 WHERE t.slug='1-adam-eve-23-stone-altar-offering'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=23 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=8 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 8:21 — *And Yahuah (LORD) smelled a sweet savour; and Yahuah (LORD) said in his heart, I will not again curse the ground any more for man’s sake; for the imagination of man’s heart is evil from his youth; neither will I again smite any more every thing living, as I have done.* The offering Adam lays on the altar in 1 Adam and Eve 23:5 looks to the sweet savour that turns away the curse.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae23_lookup sv, _session253_1ae23_lookup tv
 WHERE t.slug='1-adam-eve-23-stone-altar-offering'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=23 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=8 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Hebrews 11:4 — *By faith Abel offered unto Elohim (God) a more excellent sacrifice than Cain, by which he obtained witness that he was righteous, Elohim (God) testifying of his gifts: and by it he being dead yet speaketh.* Adam''s offering in 1 Adam and Eve 23:5 begins the faith-offering of the kept seed-line continued in his son Abel.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae23_lookup sv, _session253_1ae23_lookup tv
 WHERE t.slug='1-adam-eve-23-stone-altar-offering'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=23 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-23-blood-and-praise
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 17:11 — *For the life of the flesh is in the blood: and I have given it to you upon the altar to make an atonement for your souls: for it is the blood that maketh an atonement for the soul.* Adam offering blood on the stones in 1 Adam and Eve 23:8 already reaches for the atonement Torah will name.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae23_lookup sv, _session253_1ae23_lookup tv
 WHERE t.slug='1-adam-eve-23-blood-and-praise'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=23 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=17 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 9:14 — *How much more shall the blood of Messiah (Christ), who through the eternal Spirit offered himself without spot to Elohim (God), purge your conscience from dead works to serve the living Elohim (God)?* The blood Adam pleads upon the altar (1 Adam and Eve 23:8) is answered in the spotless blood of Messiah.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae23_lookup sv, _session253_1ae23_lookup tv
 WHERE t.slug='1-adam-eve-23-blood-and-praise'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=23 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=9 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 13:15 — *By him therefore let us offer the sacrifice of praise to Elohim (God) continually, that is, the fruit of our lips giving thanks to his name.* Adam grieving the unceasing praise lost in the garden (1 Adam and Eve 23:6) longs for the very sacrifice of praise the covenant restores.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae23_lookup sv, _session253_1ae23_lookup tv
 WHERE t.slug='1-adam-eve-23-blood-and-praise'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=23 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=13 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 50:14 — *Offer unto Elohim (God) thanksgiving; and pay thy vows unto the El Elyon (most High):* The praise Adam mourns in 1 Adam and Eve 23:6 is the thanksgiving Yahuah seeks above slain beasts.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae23_lookup sv, _session253_1ae23_lookup tv
 WHERE t.slug='1-adam-eve-23-blood-and-praise'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=23 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=50 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-23-our-father-prayer
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 6:9 — *After this manner therefore pray ye: Our Father which art in heaven, Hallowed be thy name.* Messiah''s pattern of prayer is the very opening Adam''s house kept generations before (1 Adam and Eve 23:9).'
  FROM cross_reference_threads t, cross_references x, _session253_1ae23_lookup sv, _session253_1ae23_lookup tv
 WHERE t.slug='1-adam-eve-23-our-father-prayer'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=23 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=6 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 6:13 — *And lead us not into temptation, but deliver us from evil: For thine is the kingdom, and the power, and the glory, for ever. Amen.* The deliver-us-from-evil and the kingdom-doxology Adam prays in 1 Adam and Eve 23:9 stand word for word in the Saviour''s prayer.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae23_lookup sv, _session253_1ae23_lookup tv
 WHERE t.slug='1-adam-eve-23-our-father-prayer'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=23 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=6 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Luke 11:2 — *And he said unto them, When ye pray, say, Our Father which art in heaven, Hallowed be thy name. Thy kingdom come. Thy will be done, as in heaven, so in earth.* Luke''s witness to the prayer matches the ancient form Adam used in 1 Adam and Eve 23:9.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae23_lookup sv, _session253_1ae23_lookup tv
 WHERE t.slug='1-adam-eve-23-our-father-prayer'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=23 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=11 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 6:8 — *Be not ye therefore like unto them: for your Father knoweth what things ye have need of, before ye ask him.* Adam''s confidence in pleading "be gracious unto us" (1 Adam and Eve 23:9) rests on the Father who knows the need before it is asked.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae23_lookup sv, _session253_1ae23_lookup tv
 WHERE t.slug='1-adam-eve-23-our-father-prayer'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=23 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=6 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

