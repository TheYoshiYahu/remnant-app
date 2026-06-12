-- ----- fragment: minion_1adameve_24.sql (session253 1-adam-eve 24) -----
-- Source anchor: adam-eve-conflict/1-adam-eve ch24. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1ae24 (view _session253_1ae24_lookup). Sort band base 64575, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1ae24_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-adam-eve-24-accepted-offering-sweet-savour
  ('adam-eve-conflict', '1-adam-eve', 24, 1, 'canon', 'genesis', 4, 4, 'free', E'Genesis 4:4 — *And Abel, he also brought of the firstlings of his flock and of the fat thereof. And Yahuah (LORD) had respect unto Abel and to his offering:* The respect Yahuah shows Abel''s blood-offering is the same wondering acceptance He shows Adam and Eve''s blood in 1-adam-eve 24:1, the way of approach kept from the first day outside Eden.'),
  ('adam-eve-conflict', '1-adam-eve', 24, 3, 'canon', 'genesis', 8, 21, 'free', E'Genesis 8:21 — *And Yahuah (LORD) smelled a sweet savour; and Yahuah (LORD) said in his heart, I will not again curse the ground any more for man''s sake; for the imagination of man''s heart is evil from his youth; neither will I again smite any more every thing living, as I have done.* Noah''s sweet savour at the post-flood altar is word-for-word the sweet savor Yahuah smells over Adam''s offering in 1-adam-eve 24:3, mercy meeting the lifted blood.'),
  ('adam-eve-conflict', '1-adam-eve', 24, 3, 'jubilees', 'jubilees', 6, 3, 'extras', E'Jubilees 6:3 — *And he placed the fat thereof on the altar, and he took an ox, and a goat, and a sheep and kids, and salt, and a turtle-dove, and the young of a dove, and placed a burnt sacrifice on the altar, and poured thereon an offering mingled with oil, and sprinkled wine and strewed frankincense over everything, and caused a goodly savour to arise, acceptable before Yahuah (God).* Jubilees'' goodly savour rising acceptable before Yahuah echoes the sweet savor of 1-adam-eve 24:3 — the same primeval altar-mercy carried across the restored library.'),
  ('adam-eve-conflict', '1-adam-eve', 24, 1, 'canon', 'leviticus', 17, 11, 'free', E'Leviticus 17:11 — *For the life of the flesh is in the blood: and I have given it to you upon the altar to make an atonement for your souls: for it is the blood that maketh an atonement for the soul.* The law Sinai will write was already the unspoken ground of Adam''s act in 1-adam-eve 24:1 — atonement by blood upon the altar, kept before ever it was commanded.'),
  -- thread: 1-adam-eve-24-word-promises-his-own-blood
  ('adam-eve-conflict', '1-adam-eve', 24, 4, 'canon', 'john', 1, 1, 'free', E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Word of Elohim who comes and speaks to Adam in 1-adam-eve 24:4 is this same eternal Word — the Logos addressing the man He had formed.'),
  ('adam-eve-conflict', '1-adam-eve', 24, 4, 'canon', 'john', 1, 14, 'free', E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The promise "I become flesh of your descendants" in 1-adam-eve 24:4 is the incarnation John records — the Word taking the flesh of Adam''s own line.'),
  ('adam-eve-conflict', '1-adam-eve', 24, 4, 'canon', 'galatians', 4, 4, 'free', E'Galatians 4:4 — *But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law,* The "days of the covenant" the Word counts to Adam in 1-adam-eve 24:4 close in this fulness of time, the Son made of a woman of Adam''s seed.'),
  ('adam-eve-conflict', '1-adam-eve', 24, 4, 'canon', '1-peter', 1, 20, 'free', E'1 Peter 1:20 — *Who verily was foreordained before the foundation of the world, but was manifest in these last times for you,* That the Word can promise His own blood to Adam in 1-adam-eve 24:4 shows the Lamb was foreordained before the foundation — manifest in the last days, but pledged at the first.'),
  -- thread: 1-adam-eve-24-altar-of-earth-blood-of-messiah
  ('adam-eve-conflict', '1-adam-eve', 24, 4, 'canon', 'genesis', 8, 20, 'free', E'Genesis 8:20 — *And Noah builded an altar unto Yahuah (LORD); and took of every clean beast, and of every clean fowl, and offered burnt offerings on the altar.* The "altar of the earth" the Word promises in 1-adam-eve 24:4 is the same earthen altar the fathers build, Noah''s after the flood standing in the line that began with Adam''s.'),
  ('adam-eve-conflict', '1-adam-eve', 24, 5, 'canon', 'hebrews', 9, 12, 'free', E'Hebrews 9:12 — *Neither by the blood of goats and calves, but by his own blood he entered in once into the holy place, having obtained eternal redemption for us.* The Word''s pledge "I will offer My blood" in 1-adam-eve 24:5 is fulfilled when Messiah enters by His own blood — the once-for-all forgiveness promised to Adam.'),
  ('adam-eve-conflict', '1-adam-eve', 24, 5, 'canon', 'hebrews', 9, 22, 'free', E'Hebrews 9:22 — *And almost all things are by the law purged with blood; and without shedding of blood is no remission.* That Adam could only sue for forgiveness through blood in 1-adam-eve 24:5 is the law Hebrews states — no remission without shed blood, the necessity that drives the whole apparatus to the cross.'),
  ('adam-eve-conflict', '1-adam-eve', 24, 5, 'canon', 'matthew', 26, 28, 'free', E'Matthew 26:28 — *For this is my blood of the new testament, which is shed for many for the remission of sins.* The blood the Word promises to make "forgiveness of sins" in 1-adam-eve 24:5 is the blood Messiah names at the table — shed for the remission Adam was first promised.'),
  -- thread: 1-adam-eve-24-covenant-days-return-to-garden
  ('adam-eve-conflict', '1-adam-eve', 24, 6, 'canon', 'galatians', 4, 5, 'free', E'Galatians 4:5 — *To redeem them that were under the law, that we might receive the adoption of sons.* The return "into the garden" promised when the days of the covenant are fulfilled (1-adam-eve 24:6) is this redemption and adoption — the bound exile of Adam undone in Messiah.'),
  ('adam-eve-conflict', '1-adam-eve', 24, 7, 'jubilees', 'jubilees', 6, 14, 'extras', E'Jubilees 6:14 — *And for this law there is no limit of days, for it is for ever. They shall observe it throughout their generations, so that they may continue supplicating on your behalf with blood before the altar; every day and at the time of morning and evening they shall seek forgiveness on your behalf perpetually before Yahuah (God) that they may keep it and not be rooted out.* The standing order "when sorrow comes over you, make Me an offering" in 1-adam-eve 24:7 is Jubilees'' perpetual blood-supplication before the altar — the same covenant of continual offering across the restored library.'),
  ('adam-eve-conflict', '1-adam-eve', 24, 6, 'canon', 'hebrews', 1, 3, 'free', E'Hebrews 1:3 — *Who being the brightness of his glory, and the express image of his person, and upholding all things by the word of his power, when he had by himself purged our sins, sat down on the right hand of the Majesty on high;* The Word who counts the days until He brings Adam back to the garden (1-adam-eve 24:6) is the Son who by Himself purges sins — the same Logos who comforts Adam now seated on high.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1ae24_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1ae24_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-24-accepted-offering-sweet-savour',
       E'The fire that falls and the savour Yahuah smells',
       E'Outside the garden Adam and Eve lift up their own blood as an offering, and mercy answers: *Then the merciful Elohim (God), good and lover of men, looked at Adam and Eve, and at their blood, which they had held up as an offering to Him; without an order from Him for so doing. But He wondered at them; and accepted their offerings* (1-adam-eve 24:1). *And Elohim (God) sent from His presence a bright fire, that consumed their offering* (1-adam-eve 24:2), and *He smelled the sweet savor of their offering, and showed them mercy* (1-adam-eve 24:3). It ain''t new — the very first altar outside Eden already keeps the way of approach by blood that the whole Torah will guard. So Abel''s firstlings find favour while Cain''s bloodless fruit does not: *And Abel, he also brought of the firstlings of his flock and of the fat thereof. And Yahuah (LORD) had respect unto Abel and to his offering* (Genesis 4:4). So Noah''s altar after the flood draws the same mercy: *And Yahuah (LORD) smelled a sweet savour; and Yahuah (LORD) said in his heart, I will not again curse the ground any more for man''s sake* (Genesis 8:21). Jubilees tells the same scene of the goodly savour rising acceptable before Yahuah (Jubilees 6:3). And the whole sacrificial order rests on the word given to Adam here in deed: *For the life of the flesh is in the blood: and I have given it to you upon the altar to make an atonement for your souls* (Leviticus 17:11).',
       sv.verse_id, ev.verse_id, 'extras', 64575
  FROM _session253_1ae24_lookup sv, _session253_1ae24_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=24 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=24 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-24-word-promises-his-own-blood',
       E'The Word who will shed His own blood',
       E'Then the Logos Himself comes to Adam and pledges the incarnation and the cross: *Then came the Word of Elohim (God) to Adam, and said to him, "O Adam, as you have shed your blood, so will I shed My own blood when I become flesh of your descendants; and as you died, O Adam, so also will I die"* (1-adam-eve 24:4). The Word who speaks is the Word who was always with Elohim: *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God)* (John 1:1) — and the promise to become flesh of Adam''s descendants is fulfilled when *the Word was made flesh, and dwelt among us* (John 1:14). It ain''t new: the gospel is preached to Adam on day one. Paul dates the very moment Adam is here promised: *But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law* (Galatians 4:4). And the Lamb''s death was no afterthought but foreordained from this beginning: *Who verily was foreordained before the foundation of the world, but was manifest in these last times for you* (1 Peter 1:20).',
       sv.verse_id, ev.verse_id, 'extras', 64578
  FROM _session253_1ae24_lookup sv, _session253_1ae24_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=24 AND sv.verse_number=4
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=24 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-24-altar-of-earth-blood-of-messiah',
       E'His blood on an altar of the earth',
       E'The Word matches Adam''s altar to His own: *And as you built an altar, so also will I make for you an altar of the earth; and as you offered your blood on it, so also will I offer My blood on an altar on the earth* (1-adam-eve 24:4), *and as you sued for forgiveness through that blood, so also will I make My blood forgiveness of sins, and erase transgressions in it* (1-adam-eve 24:5). The altar of earth is the very altar Yahuah names to the fathers — *And Noah builded an altar unto Yahuah (LORD)* (Genesis 8:20) — and the blood that makes forgiveness is the blood of Messiah: *Neither by the blood of goats and calves, but by his own blood he entered in once into the holy place, having obtained eternal redemption for us* (Hebrews 9:12). The rule Adam lived by stands behind the cross: *and without shedding of blood is no remission* (Hebrews 9:22). At the table the Messiah names this blood as the one Adam was promised: *For this is my blood of the new testament, which is shed for many for the remission of sins* (Matthew 26:28). It ain''t new — Calvary is the altar of earth pledged outside Eden.',
       sv.verse_id, ev.verse_id, 'extras', 64581
  FROM _session253_1ae24_lookup sv, _session253_1ae24_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=24 AND sv.verse_number=4
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=24 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-24-covenant-days-return-to-garden',
       E'The days of the covenant and the road back to the garden',
       E'The Word seals the promise with the long appointed reckoning and the offering kept against sorrow: *And now, behold, I have accepted your offering, O Adam, but the days of the covenant in which I have bound you are not fulfilled. When they are fulfilled, then will I bring you back into the garden* (1-adam-eve 24:6), *"Now, therefore, strengthen your heart; and when sorrow comes over you, make Me an offering, and I will be favorable to you"* (1-adam-eve 24:7). These "days of the covenant" run to the fulness Paul names: *To redeem them that were under the law, that we might receive the adoption of sons* (Galatians 4:5). The same blood-bound covenant of perpetual offering is given to Noah''s house in Jubilees, that they continue supplicating with blood before the altar morning and evening for ever (Jubilees 6:14). And the way back into the garden the Word promises Adam is the very last-days work He provides — *Who being the brightness of his glory... when he had by himself purged our sins, sat down on the right hand of the Majesty on high* (Hebrews 1:3). It ain''t new — the covenant that ends in Eden restored was bound on Adam the first day out.',
       sv.verse_id, ev.verse_id, 'extras', 64584
  FROM _session253_1ae24_lookup sv, _session253_1ae24_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=24 AND sv.verse_number=6
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=24 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-adam-eve-24-accepted-offering-sweet-savour
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:4 — *And Abel, he also brought of the firstlings of his flock and of the fat thereof. And Yahuah (LORD) had respect unto Abel and to his offering:* The respect Yahuah shows Abel''s blood-offering is the same wondering acceptance He shows Adam and Eve''s blood in 1-adam-eve 24:1, the way of approach kept from the first day outside Eden.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae24_lookup sv, _session253_1ae24_lookup tv
 WHERE t.slug='1-adam-eve-24-accepted-offering-sweet-savour'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=24 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 8:21 — *And Yahuah (LORD) smelled a sweet savour; and Yahuah (LORD) said in his heart, I will not again curse the ground any more for man''s sake; for the imagination of man''s heart is evil from his youth; neither will I again smite any more every thing living, as I have done.* Noah''s sweet savour at the post-flood altar is word-for-word the sweet savor Yahuah smells over Adam''s offering in 1-adam-eve 24:3, mercy meeting the lifted blood.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae24_lookup sv, _session253_1ae24_lookup tv
 WHERE t.slug='1-adam-eve-24-accepted-offering-sweet-savour'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=24 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=8 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 6:3 — *And he placed the fat thereof on the altar, and he took an ox, and a goat, and a sheep and kids, and salt, and a turtle-dove, and the young of a dove, and placed a burnt sacrifice on the altar, and poured thereon an offering mingled with oil, and sprinkled wine and strewed frankincense over everything, and caused a goodly savour to arise, acceptable before Yahuah (God).* Jubilees'' goodly savour rising acceptable before Yahuah echoes the sweet savor of 1-adam-eve 24:3 — the same primeval altar-mercy carried across the restored library.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae24_lookup sv, _session253_1ae24_lookup tv
 WHERE t.slug='1-adam-eve-24-accepted-offering-sweet-savour'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=24 AND sv.verse_number=3
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=6 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Leviticus 17:11 — *For the life of the flesh is in the blood: and I have given it to you upon the altar to make an atonement for your souls: for it is the blood that maketh an atonement for the soul.* The law Sinai will write was already the unspoken ground of Adam''s act in 1-adam-eve 24:1 — atonement by blood upon the altar, kept before ever it was commanded.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae24_lookup sv, _session253_1ae24_lookup tv
 WHERE t.slug='1-adam-eve-24-accepted-offering-sweet-savour'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=24 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=17 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-24-word-promises-his-own-blood
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Word of Elohim who comes and speaks to Adam in 1-adam-eve 24:4 is this same eternal Word — the Logos addressing the man He had formed.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae24_lookup sv, _session253_1ae24_lookup tv
 WHERE t.slug='1-adam-eve-24-word-promises-his-own-blood'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=24 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The promise "I become flesh of your descendants" in 1-adam-eve 24:4 is the incarnation John records — the Word taking the flesh of Adam''s own line.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae24_lookup sv, _session253_1ae24_lookup tv
 WHERE t.slug='1-adam-eve-24-word-promises-his-own-blood'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=24 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Galatians 4:4 — *But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law,* The "days of the covenant" the Word counts to Adam in 1-adam-eve 24:4 close in this fulness of time, the Son made of a woman of Adam''s seed.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae24_lookup sv, _session253_1ae24_lookup tv
 WHERE t.slug='1-adam-eve-24-word-promises-his-own-blood'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=24 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Peter 1:20 — *Who verily was foreordained before the foundation of the world, but was manifest in these last times for you,* That the Word can promise His own blood to Adam in 1-adam-eve 24:4 shows the Lamb was foreordained before the foundation — manifest in the last days, but pledged at the first.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae24_lookup sv, _session253_1ae24_lookup tv
 WHERE t.slug='1-adam-eve-24-word-promises-his-own-blood'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=24 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=1 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-24-altar-of-earth-blood-of-messiah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 8:20 — *And Noah builded an altar unto Yahuah (LORD); and took of every clean beast, and of every clean fowl, and offered burnt offerings on the altar.* The "altar of the earth" the Word promises in 1-adam-eve 24:4 is the same earthen altar the fathers build, Noah''s after the flood standing in the line that began with Adam''s.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae24_lookup sv, _session253_1ae24_lookup tv
 WHERE t.slug='1-adam-eve-24-altar-of-earth-blood-of-messiah'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=24 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=8 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 9:12 — *Neither by the blood of goats and calves, but by his own blood he entered in once into the holy place, having obtained eternal redemption for us.* The Word''s pledge "I will offer My blood" in 1-adam-eve 24:5 is fulfilled when Messiah enters by His own blood — the once-for-all forgiveness promised to Adam.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae24_lookup sv, _session253_1ae24_lookup tv
 WHERE t.slug='1-adam-eve-24-altar-of-earth-blood-of-messiah'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=24 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=9 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 9:22 — *And almost all things are by the law purged with blood; and without shedding of blood is no remission.* That Adam could only sue for forgiveness through blood in 1-adam-eve 24:5 is the law Hebrews states — no remission without shed blood, the necessity that drives the whole apparatus to the cross.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae24_lookup sv, _session253_1ae24_lookup tv
 WHERE t.slug='1-adam-eve-24-altar-of-earth-blood-of-messiah'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=24 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=9 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 26:28 — *For this is my blood of the new testament, which is shed for many for the remission of sins.* The blood the Word promises to make "forgiveness of sins" in 1-adam-eve 24:5 is the blood Messiah names at the table — shed for the remission Adam was first promised.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae24_lookup sv, _session253_1ae24_lookup tv
 WHERE t.slug='1-adam-eve-24-altar-of-earth-blood-of-messiah'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=24 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=26 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-24-covenant-days-return-to-garden
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Galatians 4:5 — *To redeem them that were under the law, that we might receive the adoption of sons.* The return "into the garden" promised when the days of the covenant are fulfilled (1-adam-eve 24:6) is this redemption and adoption — the bound exile of Adam undone in Messiah.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae24_lookup sv, _session253_1ae24_lookup tv
 WHERE t.slug='1-adam-eve-24-covenant-days-return-to-garden'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=24 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=4 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jubilees 6:14 — *And for this law there is no limit of days, for it is for ever. They shall observe it throughout their generations, so that they may continue supplicating on your behalf with blood before the altar; every day and at the time of morning and evening they shall seek forgiveness on your behalf perpetually before Yahuah (God) that they may keep it and not be rooted out.* The standing order "when sorrow comes over you, make Me an offering" in 1-adam-eve 24:7 is Jubilees'' perpetual blood-supplication before the altar — the same covenant of continual offering across the restored library.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae24_lookup sv, _session253_1ae24_lookup tv
 WHERE t.slug='1-adam-eve-24-covenant-days-return-to-garden'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=24 AND sv.verse_number=7
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=6 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 1:3 — *Who being the brightness of his glory, and the express image of his person, and upholding all things by the word of his power, when he had by himself purged our sins, sat down on the right hand of the Majesty on high;* The Word who counts the days until He brings Adam back to the garden (1-adam-eve 24:6) is the Son who by Himself purges sins — the same Logos who comforts Adam now seated on high.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae24_lookup sv, _session253_1ae24_lookup tv
 WHERE t.slug='1-adam-eve-24-covenant-days-return-to-garden'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=24 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

