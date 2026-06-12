-- ----- fragment: minion_2corinthians_04.sql (S229 2 Corinthians 4) -----
-- =====================================================================
-- S229 minion — 2 CORINTHIANS 4 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 2 CORINTHIANS 4 (18 verses).
-- Tag: 2c04 (temp view _s229_2c04_lookup).
-- Sort band: floor 7075, step 3 (7075, 7078, 7081 used; under 7100).
-- Source is ALWAYS the canon 2 Corinthians verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (the same divided, afflicted assembly of called-out ones — Israel and the grafted-in
-- seed gathered at Corinth — to whom Paul ministers the new covenant of Jeremiah 31 and Ezekiel 36,
-- the SAME Torah written now on the heart). Chapter 4 carries the ministry of light: the same Elohim
-- (God) who spoke the first light out of darkness at creation has shined in the heart with the
-- knowledge of his glory in the face of Yahusha HaMashiach (Jesus Christ). The treasure is in earthen
-- vessels — the apostles afflicted on every side yet not destroyed, always bearing about the dying of
-- Yahusha (Jesus) so his life is made manifest. Paul speaks the believing speech of Psalm 116:10
-- ('I believed, therefore have I spoken'), and rests on the resurrection hope: he which raised up the
-- Lord Yahusha shall raise up us also. The Christology is the Formed: Messiah is *the image of Elohim
-- (God)* (4:4), and the knowledge of the glory of Elohim (God) is seen *in the face of Yahusha
-- HaMashiach (Jesus Christ)* (4:6) — the Formed Son who bears the divine glory, not a co-equal-persons
-- grammar and not a mere man. No platonic hope: the unseen-and-eternal of 4:18 is the resurrection
-- weight of glory, not a disembodied escape (the bodily hope is spelled out in ch5). The outward man
-- perishes; the inward man is renewed day by day toward that resurrection.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-2   the ministry received; renouncing the hidden things of dishonesty
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted (pastoral)
--   v.3-5   the gospel hid; the god of this world hath blinded the minds; Messiah the image of Elohim
--           Tanakh: none warranted (the image/glory weight carried in the v.6 light thread)
--           Extras: none warranted   NT: none warranted
--   v.6     God who commanded the light to shine out of darkness hath shined in our hearts
--           Tanakh: Genesis 1:3 (Let there be light: and there was light), Isaiah 9:2 (the people that
--                   walked in darkness have seen a great light)
--           Extras: none warranted   NT: Matthew 5:16 (let your light so shine before men)
--   v.7-9   this treasure in earthen vessels; troubled, perplexed, persecuted, cast down — not destroyed
--           Tanakh: none warranted (carried in the dying-of-the-Lord thread at v.10-11)
--           Extras: none warranted   NT: none warranted (carried at v.10-11)
--   v.10-12 always bearing about the dying of the Lord Yahusha, that his life be made manifest
--           Tanakh: Psalm 44:22 (for thy sake are we killed all the day long; sheep for the slaughter)
--           Extras: none warranted   NT: Romans 8:36 (for thy sake we are killed all the day long)
--   v.13    I believed, and therefore have I spoken [explicit citation of Psalm 116:10]
--           Tanakh: Psalm 116:10 (I believed, therefore have I spoken: I was greatly afflicted)
--           Extras: none warranted   NT: none warranted (the Tanakh citation is the load-bearing root)
--   v.14    he which raised up the Lord Yahusha shall raise up us also by Yahusha
--           Tanakh: none warranted (the resurrection root carried in the dying-of-the-Lord thread)
--           Extras: none warranted   NT: Romans 8:11 (shall also quicken your mortal bodies),
--                   1 Corinthians 6:14 (Elohim hath raised up the Lord, and will also raise up us)
--   v.15-18 the inward man renewed; the light affliction a weight of glory; the unseen eternal
--           Tanakh: none warranted   Extras: none warranted (Wisdom 9:15 on the perishable body
--                   belongs to ch5''s house-not-made-with-hands, not here)   NT: none warranted
--
-- THREADS (slug -> target libraries):
--   7075 2-corinthians-4-the-light-to-shine-out-of-darkness-hath-shined-in-our-hearts-genesis-1  (Tanakh + NT)
--   7078 2-corinthians-4-i-believed-and-therefore-have-i-spoken-the-same-spirit-of-faith-psalm-116  (Tanakh)
--   7081 2-corinthians-4-bearing-about-the-dying-of-the-lord-yahusha-that-his-life-be-manifest-psalm-44  (Tanakh + NT)
-- =====================================================================

CREATE TEMP VIEW _s229_2c04_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-corinthians-4-the-light-to-shine-out-of-darkness-hath-shined-in-our-hearts-genesis-1
  ('canon', '2-corinthians', 4, 6, 'canon', 'genesis', 1, 3, 'free', E'*And Elohim (God) said, Let there be light: and there was light.* (Genesis 1:3). The first word over the dark and formless deep was a word of light: *Let there be light.* Paul reaches all the way back to that creation morning to name what happens in the heart: *For Elohim (God), who commanded the light to shine out of darkness, hath shined in our hearts, to give the light of the knowledge of the glory of Elohim (God) in the face of Yahusha HaMashiach (Jesus Christ)* (2 Corinthians 4:6). The same Elohim (God) who *commanded the light to shine out of darkness* at the beginning shines again in the inward man — a new creation by the same creating word. The light that scattered the primal darkness is the light of *the knowledge of the glory of Elohim (God) in the face of Yahusha HaMashiach (Jesus Christ),* the Formed Son who is *the image of Elohim (God)* (2 Corinthians 4:4).'),
  ('canon', '2-corinthians', 4, 6, 'canon', 'isaiah', 9, 2, 'free', E'*The people that walked in darkness have seen a great light: they that dwell in the land of the shadow of death, upon them hath the light shined.* (Isaiah 9:2). Isaiah promised a people in darkness who would see a great light — *upon them hath the light shined.* That promised shining is what Paul declares accomplished in the heart: Elohim (God) *who commanded the light to shine out of darkness, hath shined in our hearts, to give the light of the knowledge of the glory of Elohim (God) in the face of Yahusha HaMashiach (Jesus Christ)* (2 Corinthians 4:6). The light that dawns on those who *dwell in the land of the shadow of death* is the knowledge of the glory of Elohim (God) shining in the face of the Formed Son; the very thing the god of this world labors to keep hidden, *lest the light of the glorious gospel of Messiah (Christ), who is the image of Elohim (God), should shine unto them* (2 Corinthians 4:4).'),
  ('canon', '2-corinthians', 4, 6, 'canon', 'matthew', 5, 16, 'free', E'*Let your light so shine before men, that they may see your good works, and glorify your Father which is in heaven.* (Matthew 5:16). Yahusha (Jesus) sends the gathered out as bearers of the light: *Let your light so shine before men.* That light is not their own — it is the light Elohim (God) *hath shined in our hearts, to give the light of the knowledge of the glory of Elohim (God) in the face of Yahusha HaMashiach (Jesus Christ)* (2 Corinthians 4:6). The creation-light kindled within is meant to shine back out before men, that they may *glorify your Father which is in heaven*; the treasure shines through the earthen vessel so the praise returns to the Father, the One.'),
  -- thread: 2-corinthians-4-i-believed-and-therefore-have-i-spoken-the-same-spirit-of-faith-psalm-116
  ('canon', '2-corinthians', 4, 13, 'canon', 'psalms', 116, 10, 'free', E'*I believed, therefore have I spoken: I was greatly afflicted:* (Psalm 116:10). Paul cites the psalmist word for word: *We having the same spirit of faith, according as it is written, I believed, and therefore have I spoken; we also believe, and therefore speak* (2 Corinthians 4:13). The psalmist''s confession joins believing to speaking in the very midst of affliction — *I believed, therefore have I spoken: I was greatly afflicted* — and Paul claims that same spirit of faith for the afflicted ministry he has just described, *troubled on every side... persecuted... cast down* yet not silenced. The one who believes the Elohim (God) that raiseth the dead cannot but speak; the believing speech of the Tanakh is the apostle''s own under the dying he bears about.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s229_2c04_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s229_2c04_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- second cross_references batch: the dying-of-the-Lord thread (separate VALUES for clarity)
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-corinthians-4-bearing-about-the-dying-of-the-lord-yahusha-that-his-life-be-manifest-psalm-44
  ('canon', '2-corinthians', 4, 11, 'canon', 'psalms', 44, 22, 'free', E'*Yea, for thy sake are we killed all the day long; we are counted as sheep for the slaughter.* (Psalm 44:22). The psalmist names the lot of the faithful under affliction: *for thy sake are we killed all the day long; we are counted as sheep for the slaughter.* Paul lives that very word in his ministry: *For we which live are alway delivered unto death for Yahusha''s (Jesus'') sake, that the life also of Yahusha (Jesus) might be made manifest in our mortal flesh* (2 Corinthians 4:11). The daily dying *for thy sake* of the psalm becomes the daily dying *for Yahusha''s (Jesus'') sake* of the apostle — *always bearing about in the body the dying of the Lord Yahusha (Lord Jesus)* (2 Corinthians 4:10) — that the life of Yahusha (Jesus) might be made manifest through the earthen vessel.'),
  ('canon', '2-corinthians', 4, 11, 'canon', 'romans', 8, 36, 'free', E'*As it is written, For thy sake we are killed all the day long; we are accounted as sheep for the slaughter.* (Romans 8:36). To the same assembly''s sister letter Paul quotes the same psalm of the slaughtered faithful — *for thy sake we are killed all the day long* — and there it stands inside the love from which nothing can separate. Here he says he lives it: *For we which live are alway delivered unto death for Yahusha''s (Jesus'') sake, that the life also of Yahusha (Jesus) might be made manifest in our mortal flesh* (2 Corinthians 4:11). The killing all the day long is no defeat but the very means by which the life of Yahusha (Jesus) is shown forth in mortal flesh.'),
  ('canon', '2-corinthians', 4, 14, 'canon', 'romans', 8, 11, 'free', E'*But if the Spirit of him that raised up Yahusha (Jesus) from the dead dwell in you, he that raised up Messiah (Christ) from the dead shall also quicken your mortal bodies by his Spirit that dwelleth in you.* (Romans 8:11). The dying borne about in the body rests on a resurrection certainty: *he that raised up Messiah (Christ) from the dead shall also quicken your mortal bodies.* Paul says the same to Corinth: *Knowing that he which raised up the Lord Yahusha (Lord Jesus) shall raise up us also by Yahusha (Jesus), and shall present us with you* (2 Corinthians 4:14). The One who raised the Lord will raise his people too — and quicken these same *mortal bodies,* not abandon them; the hope is bodily, the resurrection of the earthen vessel, not a flight from it.'),
  ('canon', '2-corinthians', 4, 14, 'canon', '1-corinthians', 6, 14, 'free', E'*And Elohim (God) hath both raised up Yahuah (Lord), and will also raise up us by his own power.* (1 Corinthians 6:14). In the first letter to this same congregation Paul stated the rule plainly: *Elohim (God) hath both raised up Yahuah (Lord), and will also raise up us by his own power.* He repeats it here as the ground of his courage under the daily dying: *Knowing that he which raised up the Lord Yahusha (Lord Jesus) shall raise up us also by Yahusha (Jesus), and shall present us with you* (2 Corinthians 4:14). The raising of the Lord guarantees the raising of his own; this is why the outward man may perish while the inward man is renewed day by day toward *a far more exceeding and eternal weight of glory* (2 Corinthians 4:16-17).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s229_2c04_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s229_2c04_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-corinthians-4-the-light-to-shine-out-of-darkness-hath-shined-in-our-hearts-genesis-1',
       E'The light to shine out of darkness hath shined in our hearts (Genesis 1, Isaiah 9)',
       E'Against the god of this world who *hath blinded the minds of them which believe not, lest the light of the glorious gospel of Messiah (Christ), who is the image of Elohim (God), should shine unto them* (2 Corinthians 4:4), Paul sets the creating word of light: *For Elohim (God), who commanded the light to shine out of darkness, hath shined in our hearts, to give the light of the knowledge of the glory of Elohim (God) in the face of Yahusha HaMashiach (Jesus Christ)* (2 Corinthians 4:6). The phrase reaches back to the first morning of creation. Over the dark and formless deep the first word was a word of light: *And Elohim (God) said, Let there be light: and there was light* (Genesis 1:3). The same Elohim (God) who *commanded the light to shine out of darkness* then shines again now — in the heart, a fresh creation by the same word. And it is the light Isaiah promised to a people sitting in darkness: *The people that walked in darkness have seen a great light: they that dwell in the land of the shadow of death, upon them hath the light shined* (Isaiah 9:2). What dawns is *the knowledge of the glory of Elohim (God) in the face of Yahusha HaMashiach (Jesus Christ)* — the glory of the Father shining in the Formed Son who is *the image of Elohim (God).* And this kindled light is meant to shine outward: Yahusha (Jesus) charged the gathered, *Let your light so shine before men, that they may see your good works, and glorify your Father which is in heaven* (Matthew 5:16). The creation-light scattered the first darkness; the gospel-light scatters the darkness the god of this world casts over blinded minds; the same light shines through the earthen vessel before men, that the praise return to the Father, the One.',
       sv.verse_id, ev.verse_id, 'free', 7075
  FROM _s229_2c04_lookup sv, _s229_2c04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=4 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='2-corinthians' AND ev.chapter_number=4 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-corinthians-4-i-believed-and-therefore-have-i-spoken-the-same-spirit-of-faith-psalm-116',
       E'I believed, and therefore have I spoken — the same spirit of faith (Psalm 116)',
       E'In the midst of his afflicted ministry — *troubled on every side, yet not distressed; we are perplexed, but not in despair; persecuted, but not forsaken; cast down, but not destroyed* (2 Corinthians 4:8-9) — Paul names what holds his tongue open: *We having the same spirit of faith, according as it is written, I believed, and therefore have I spoken; we also believe, and therefore speak* (2 Corinthians 4:13). The citation is the psalmist''s own confession, spoken from the depths of trouble: *I believed, therefore have I spoken: I was greatly afflicted* (Psalm 116:10). That psalm comes out of *the sorrows of death* and *the pains of hell,* and yet the sufferer believes and therefore speaks, vowing to *take the cup of salvation, and call upon the name of Yahuah (LORD).* Paul lays claim to *the same spirit of faith.* Believing and speaking are bound together: the one who believes the Elohim (God) that raiseth the dead cannot keep silent, even when *greatly afflicted.* The apostle who bears about the dying of the Lord speaks the believing speech of the Tanakh, *knowing that he which raised up the Lord Yahusha (Lord Jesus) shall raise up us also* (2 Corinthians 4:14) — for that hope is the very thing he believes and therefore speaks.',
       sv.verse_id, ev.verse_id, 'free', 7078
  FROM _s229_2c04_lookup sv, _s229_2c04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=4 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='2-corinthians' AND ev.chapter_number=4 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-corinthians-4-bearing-about-the-dying-of-the-lord-yahusha-that-his-life-be-manifest-psalm-44',
       E'Bearing about the dying of the Lord Yahusha, that his life be manifest (Psalm 44, Romans 8)',
       E'The treasure is *in earthen vessels, that the excellency of the power may be of Elohim (God), and not of us* (2 Corinthians 4:7), and the vessel is hard-pressed: *Always bearing about in the body the dying of the Lord Yahusha (Lord Jesus), that the life also of Yahusha (Jesus) might be made manifest in our body. For we which live are alway delivered unto death for Yahusha''s (Jesus'') sake, that the life also of Yahusha (Jesus) might be made manifest in our mortal flesh* (2 Corinthians 4:10-11). This is the lot the psalmist named long before: *Yea, for thy sake are we killed all the day long; we are counted as sheep for the slaughter* (Psalm 44:22) — the daily dying *for thy sake* that Paul also quotes to this congregation''s sister assembly, *For thy sake we are killed all the day long; we are accounted as sheep for the slaughter* (Romans 8:36), where it stands inside the love from which nothing can separate. The killing all the day long is no defeat: it is the very means by which *the life also of Yahusha (Jesus)* is made manifest in mortal flesh. And it rests on resurrection: *Knowing that he which raised up the Lord Yahusha (Lord Jesus) shall raise up us also by Yahusha (Jesus), and shall present us with you* (2 Corinthians 4:14). The same word Paul gave the first letter — *Elohim (God) hath both raised up Yahuah (Lord), and will also raise up us by his own power* (1 Corinthians 6:14) — and the same Spirit-given hope of Romans, *he that raised up Messiah (Christ) from the dead shall also quicken your mortal bodies by his Spirit that dwelleth in you* (Romans 8:11). The hope is bodily: the very mortal flesh that bears the dying will be quickened. So the outward man may perish while *the inward man is renewed day by day* (2 Corinthians 4:16) toward *a far more exceeding and eternal weight of glory* (2 Corinthians 4:17).',
       sv.verse_id, ev.verse_id, 'free', 7081
  FROM _s229_2c04_lookup sv, _s229_2c04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=4 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='2-corinthians' AND ev.chapter_number=4 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-corinthians-4-the-light-to-shine-out-of-darkness-hath-shined-in-our-hearts-genesis-1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:3 — *And Elohim (God) said, Let there be light: and there was light* the first creating word over the darkness; the same Elohim (God) *who commanded the light to shine out of darkness, hath shined in our hearts* (2 Corinthians 4:6).'
  FROM cross_reference_threads t, cross_references x, _s229_2c04_lookup sv, _s229_2c04_lookup tv
 WHERE t.slug='2-corinthians-4-the-light-to-shine-out-of-darkness-hath-shined-in-our-hearts-genesis-1'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=4 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 9:2 — *The people that walked in darkness have seen a great light... upon them hath the light shined* the promised dawning on those in the shadow of death; the light of *the knowledge of the glory of Elohim (God) in the face of Yahusha HaMashiach (Jesus Christ)* (2 Corinthians 4:6).'
  FROM cross_reference_threads t, cross_references x, _s229_2c04_lookup sv, _s229_2c04_lookup tv
 WHERE t.slug='2-corinthians-4-the-light-to-shine-out-of-darkness-hath-shined-in-our-hearts-genesis-1'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=4 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=9 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 5:16 — *Let your light so shine before men, that they may see your good works, and glorify your Father which is in heaven* the kindled light shining outward; the heart-light Elohim (God) *hath shined in our hearts* shines back before men to the Father''s glory (2 Corinthians 4:6).'
  FROM cross_reference_threads t, cross_references x, _s229_2c04_lookup sv, _s229_2c04_lookup tv
 WHERE t.slug='2-corinthians-4-the-light-to-shine-out-of-darkness-hath-shined-in-our-hearts-genesis-1'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=4 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-corinthians-4-i-believed-and-therefore-have-i-spoken-the-same-spirit-of-faith-psalm-116
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 116:10 — *I believed, therefore have I spoken: I was greatly afflicted* the believing speech out of the depths; Paul claims *the same spirit of faith, according as it is written, I believed, and therefore have I spoken* (2 Corinthians 4:13).'
  FROM cross_reference_threads t, cross_references x, _s229_2c04_lookup sv, _s229_2c04_lookup tv
 WHERE t.slug='2-corinthians-4-i-believed-and-therefore-have-i-spoken-the-same-spirit-of-faith-psalm-116'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=4 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=116 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-corinthians-4-bearing-about-the-dying-of-the-lord-yahusha-that-his-life-be-manifest-psalm-44
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 44:22 — *for thy sake are we killed all the day long; we are counted as sheep for the slaughter* the daily dying of the faithful; *we which live are alway delivered unto death for Yahusha''s (Jesus'') sake, that the life also of Yahusha (Jesus) might be made manifest* (2 Corinthians 4:11).'
  FROM cross_reference_threads t, cross_references x, _s229_2c04_lookup sv, _s229_2c04_lookup tv
 WHERE t.slug='2-corinthians-4-bearing-about-the-dying-of-the-lord-yahusha-that-his-life-be-manifest-psalm-44'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=4 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=44 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 8:36 — *For thy sake we are killed all the day long; we are accounted as sheep for the slaughter* the same Psalm 44 quoted to the sister assembly inside the love nothing can separate; the killing all day long the means *the life also of Yahusha (Jesus) might be made manifest in our mortal flesh* (2 Corinthians 4:11).'
  FROM cross_reference_threads t, cross_references x, _s229_2c04_lookup sv, _s229_2c04_lookup tv
 WHERE t.slug='2-corinthians-4-bearing-about-the-dying-of-the-lord-yahusha-that-his-life-be-manifest-psalm-44'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=4 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=8 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 8:11 — *he that raised up Messiah (Christ) from the dead shall also quicken your mortal bodies by his Spirit that dwelleth in you* the bodily resurrection hope; *he which raised up the Lord Yahusha (Lord Jesus) shall raise up us also by Yahusha (Jesus)* (2 Corinthians 4:14).'
  FROM cross_reference_threads t, cross_references x, _s229_2c04_lookup sv, _s229_2c04_lookup tv
 WHERE t.slug='2-corinthians-4-bearing-about-the-dying-of-the-lord-yahusha-that-his-life-be-manifest-psalm-44'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=4 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=8 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Corinthians 6:14 — *Elohim (God) hath both raised up Yahuah (Lord), and will also raise up us by his own power* the same rule from the first letter to this congregation; *he which raised up the Lord Yahusha (Lord Jesus) shall raise up us also* (2 Corinthians 4:14).'
  FROM cross_reference_threads t, cross_references x, _s229_2c04_lookup sv, _s229_2c04_lookup tv
 WHERE t.slug='2-corinthians-4-bearing-about-the-dying-of-the-lord-yahusha-that-his-life-be-manifest-psalm-44'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=4 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=6 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
