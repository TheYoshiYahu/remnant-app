-- ----- fragment: minion_1adameve_58.sql (session253 1-adam-eve 58) -----
-- Source anchor: adam-eve-conflict/1-adam-eve ch58. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1ae58 (view _session253_1ae58_lookup). Sort band base 65425, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1ae58_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-adam-eve-58-angel-drives-satan
  ('adam-eve-conflict', '1-adam-eve', 58, 1, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Satan''s drive to make Adam and Eve deny Elohim (1 Adam and Eve 58:1) is the serpent striking at the seed, the war Yahuah declared from the garden.'),
  ('adam-eve-conflict', '1-adam-eve', 58, 1, 'canon', 'romans', 16, 20, 'free', E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* The deliverance Adam begs (1 Adam and Eve 58:1) is the same crushing of the adversary promised to the seed of the woman to the end.'),
  ('adam-eve-conflict', '1-adam-eve', 58, 1, 'canon', '1-peter', 5, 8, 'free', E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour:* The Satan who would force them to deny Elohim (1 Adam and Eve 58:1) is this same prowling adversary seeking to devour the holy line.'),
  ('adam-eve-conflict', '1-adam-eve', 58, 2, 'canon', 'james', 4, 7, 'free', E'James 4:7 — *Submit yourselves therefore to Elohim (God). Resist the devil, and he will flee from you.* The angel driving Satan away at their prayer (1 Adam and Eve 58:2) shows the flight that follows when the humble submit to Yahuah.'),
  ('adam-eve-conflict', '1-adam-eve', 58, 2, 'canon', 'hebrews', 1, 14, 'free', E'Hebrews 1:14 — *Are they not all ministering spirits, sent forth to minister for them who shall be heirs of salvation?* The angel Yahuah sends at once to guard Adam and Eve (1 Adam and Eve 58:2) is one of these ministering spirits sent to the heirs.'),
  -- thread: 1-adam-eve-58-cave-fast-forgiveness
  ('adam-eve-conflict', '1-adam-eve', 58, 4, 'canon', 'psalms', 34, 18, 'free', E'Psalm 34:18 — *Yahuah (LORD) is nigh unto them that are of a broken heart; and saveth such as be of a contrite spirit.* Adam''s faith that even if they die fasting He will save them (1 Adam and Eve 58:4) rests on this nearness of Yahuah to the contrite.'),
  ('adam-eve-conflict', '1-adam-eve', 58, 5, 'canon', 'psalms', 34, 17, 'free', E'Psalm 34:17 — *The righteous cry, and Yahuah (LORD) heareth, and delivereth them out of all their troubles.* As Adam and Eve join together in entreating Elohim (1 Adam and Eve 58:5), this is the deliverance promised to the righteous who cry out.'),
  ('adam-eve-conflict', '1-adam-eve', 58, 4, 'canon', 'matthew', 6, 12, 'free', E'Matthew 6:12 — *And forgive us our debts, as we forgive our debtors.* The plea Adam frames to ask Elohim to forgive the sins they have committed (1 Adam and Eve 58:4) is the same petition for pardon the Master sets at the heart of prayer.'),
  ('adam-eve-conflict', '1-adam-eve', 58, 4, 'canon', 'luke', 18, 1, 'free', E'Luke 18:1 — *And he spake a parable unto them to this end, that men ought always to pray, and not to faint;* Adam''s vow not to leave the cave by night or day until the fortieth (1 Adam and Eve 58:4) embodies this unceasing prayer that does not faint.'),
  -- thread: 1-adam-eve-58-prayer-flame-of-fire
  ('adam-eve-conflict', '1-adam-eve', 58, 6, 'canon', 'psalms', 141, 2, 'free', E'Psalm 141:2 — *Let my prayer be set forth before thee as incense; and the lifting up of my hands as the evening sacrifice.* The prayers that go up like a flame of fire from the cave (1 Adam and Eve 58:6) are the lifting up of hands as the evening offering before Yahuah.'),
  ('adam-eve-conflict', '1-adam-eve', 58, 6, 'canon', 'revelation', 8, 3, 'free', E'Revelation 8:3 — *And another angel came and stood at the altar, having a golden censer; and there was given unto him much incense, that he should offer it with the prayers of all saints upon the golden altar which was before the throne.* The flaming prayer rising from Adam''s cave (1 Adam and Eve 58:6) is gathered to this golden altar with the prayers of all the saints.'),
  ('adam-eve-conflict', '1-adam-eve', 58, 6, 'canon', 'revelation', 8, 4, 'free', E'Revelation 8:4 — *And the smoke of the incense, which came with the prayers of the saints, ascended up before Elohim (God) out of the angel’s hand.* As the prayers of Adam and Eve ascend like fire (1 Adam and Eve 58:6), so the smoke of the saints'' prayers ascends before Elohim at the throne.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1ae58_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1ae58_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-58-angel-drives-satan',
       E'The angel drives Satan away — resist, and he will flee',
       E'Adam and Eve spread out their hands and beg deliverance: *Then Adam and Eve spread their hands before Elohim (God), praying and begging Him to drive Satan away from them so that he can''t harm them or force them to deny Elohim (God)* (1 Adam and Eve 58:1), and the answer comes at sunset: *Then Elohim (God) sent to them at once, His angel, who drove away Satan from them. This happened about sunset, on the fifty-third day after they had come out of the garden* (1 Adam and Eve 58:2). It ain''t new — this is the seed-war of the first day outside Eden, the serpent striking and the LORD putting *enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head* (Genesis 3:15), and the promise of Eden is the promise of the gospel: *And the Elohim (God) of peace shall bruise Satan under your feet shortly* (Romans 16:20). The adversary who comes to make them *deny Elohim* is the lion of whom Kepha warns — *your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour* (1 Peter 5:8) — and the standing word over him is, *Resist the devil, and he will flee from you* (James 4:7), the very flight Yahuah''s angel works here. And Adam is not left alone in the dark: the heavens are full of those *ministering spirits, sent forth to minister for them who shall be heirs of salvation* (Hebrews 1:14).',
       sv.verse_id, ev.verse_id, 'extras', 65425
  FROM _session253_1ae58_lookup sv, _session253_1ae58_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=58 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=58 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-58-cave-fast-forgiveness',
       E'Into the cave to seek forgiveness — though we die in here, He will save us',
       E'Driven into the cave of treasures, they fall on their faces: *Then Adam and Eve went into the cave, and stood up and turned their faces to the ground, to pray to Elohim (God)* (1 Adam and Eve 58:3), and Adam sets a fast unto the edge of death — *Come, let us get up, and ask Elohim (God) to forgive us the sins we have committed; and we will not come out until the end of the day next to the fortieth. And if we die in here, He will save us* (1 Adam and Eve 58:4), and *Then Adam and Eve got up, and joined together in entreating Elohim (God)* (1 Adam and Eve 58:5). This is Torah''s way kept before Sinai: the broken and contrite spirit Yahuah will not despise, for *Yahuah (LORD) is nigh unto them that are of a broken heart; and saveth such as be of a contrite spirit* (Psalm 34:18), and *The righteous cry, and Yahuah (LORD) heareth, and delivereth them out of all their troubles* (Psalm 34:17). The prayer Adam teaches Eve — *forgive us the sins we have committed* — is the cry the Master would put in His own people''s mouths: *And forgive us our debts, as we forgive our debtors* (Matthew 6:12). And the resolve not to come out by night or day is the importunity the Messiah commends, *that men ought always to pray, and not to faint* (Luke 18:1).',
       sv.verse_id, ev.verse_id, 'extras', 65428
  FROM _session253_1ae58_lookup sv, _session253_1ae58_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=58 AND sv.verse_number=3
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=58 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-58-prayer-flame-of-fire',
       E'Their prayers went up like a flame of fire',
       E'The chapter ends in a single, burning image: *They continued praying like this in the cave; neither did they come out of it, by night or by day, until their prayers went up out of their mouths, like a flame of fire* (1 Adam and Eve 58:6). From the first day outside the garden the prayers of the holy seed rise as the evening offering, *Let my prayer be set forth before thee as incense; and the lifting up of my hands as the evening sacrifice* (Psalm 141:2) — the very hands Adam and Eve had spread before Elohim. And what John sees at the throne is this same ascending fire of supplication kept before Yahuah: *And another angel came and stood at the altar, having a golden censer; and there was given unto him much incense, that he should offer it with the prayers of all saints upon the golden altar which was before the throne* (Revelation 8:3), so that *the smoke of the incense, which came with the prayers of the saints, ascended up before Elohim (God) out of the angel''s hand* (Revelation 8:4). Adam''s prayer flaming up out of the cave is the first of all the saints'' prayers gathered to that golden altar.',
       sv.verse_id, ev.verse_id, 'extras', 65431
  FROM _session253_1ae58_lookup sv, _session253_1ae58_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=58 AND sv.verse_number=6
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=58 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-adam-eve-58-angel-drives-satan
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Satan''s drive to make Adam and Eve deny Elohim (1 Adam and Eve 58:1) is the serpent striking at the seed, the war Yahuah declared from the garden.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae58_lookup sv, _session253_1ae58_lookup tv
 WHERE t.slug='1-adam-eve-58-angel-drives-satan'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=58 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* The deliverance Adam begs (1 Adam and Eve 58:1) is the same crushing of the adversary promised to the seed of the woman to the end.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae58_lookup sv, _session253_1ae58_lookup tv
 WHERE t.slug='1-adam-eve-58-angel-drives-satan'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=58 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=16 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour:* The Satan who would force them to deny Elohim (1 Adam and Eve 58:1) is this same prowling adversary seeking to devour the holy line.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae58_lookup sv, _session253_1ae58_lookup tv
 WHERE t.slug='1-adam-eve-58-angel-drives-satan'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=58 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'James 4:7 — *Submit yourselves therefore to Elohim (God). Resist the devil, and he will flee from you.* The angel driving Satan away at their prayer (1 Adam and Eve 58:2) shows the flight that follows when the humble submit to Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae58_lookup sv, _session253_1ae58_lookup tv
 WHERE t.slug='1-adam-eve-58-angel-drives-satan'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=58 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=4 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Hebrews 1:14 — *Are they not all ministering spirits, sent forth to minister for them who shall be heirs of salvation?* The angel Yahuah sends at once to guard Adam and Eve (1 Adam and Eve 58:2) is one of these ministering spirits sent to the heirs.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae58_lookup sv, _session253_1ae58_lookup tv
 WHERE t.slug='1-adam-eve-58-angel-drives-satan'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=58 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-58-cave-fast-forgiveness
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 34:18 — *Yahuah (LORD) is nigh unto them that are of a broken heart; and saveth such as be of a contrite spirit.* Adam''s faith that even if they die fasting He will save them (1 Adam and Eve 58:4) rests on this nearness of Yahuah to the contrite.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae58_lookup sv, _session253_1ae58_lookup tv
 WHERE t.slug='1-adam-eve-58-cave-fast-forgiveness'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=58 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=34 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 34:17 — *The righteous cry, and Yahuah (LORD) heareth, and delivereth them out of all their troubles.* As Adam and Eve join together in entreating Elohim (1 Adam and Eve 58:5), this is the deliverance promised to the righteous who cry out.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae58_lookup sv, _session253_1ae58_lookup tv
 WHERE t.slug='1-adam-eve-58-cave-fast-forgiveness'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=58 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=34 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 6:12 — *And forgive us our debts, as we forgive our debtors.* The plea Adam frames to ask Elohim to forgive the sins they have committed (1 Adam and Eve 58:4) is the same petition for pardon the Master sets at the heart of prayer.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae58_lookup sv, _session253_1ae58_lookup tv
 WHERE t.slug='1-adam-eve-58-cave-fast-forgiveness'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=58 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=6 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Luke 18:1 — *And he spake a parable unto them to this end, that men ought always to pray, and not to faint;* Adam''s vow not to leave the cave by night or day until the fortieth (1 Adam and Eve 58:4) embodies this unceasing prayer that does not faint.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae58_lookup sv, _session253_1ae58_lookup tv
 WHERE t.slug='1-adam-eve-58-cave-fast-forgiveness'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=58 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=18 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-58-prayer-flame-of-fire
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 141:2 — *Let my prayer be set forth before thee as incense; and the lifting up of my hands as the evening sacrifice.* The prayers that go up like a flame of fire from the cave (1 Adam and Eve 58:6) are the lifting up of hands as the evening offering before Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae58_lookup sv, _session253_1ae58_lookup tv
 WHERE t.slug='1-adam-eve-58-prayer-flame-of-fire'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=58 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=141 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 8:3 — *And another angel came and stood at the altar, having a golden censer; and there was given unto him much incense, that he should offer it with the prayers of all saints upon the golden altar which was before the throne.* The flaming prayer rising from Adam''s cave (1 Adam and Eve 58:6) is gathered to this golden altar with the prayers of all the saints.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae58_lookup sv, _session253_1ae58_lookup tv
 WHERE t.slug='1-adam-eve-58-prayer-flame-of-fire'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=58 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=8 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 8:4 — *And the smoke of the incense, which came with the prayers of the saints, ascended up before Elohim (God) out of the angel’s hand.* As the prayers of Adam and Eve ascend like fire (1 Adam and Eve 58:6), so the smoke of the saints'' prayers ascends before Elohim at the throne.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae58_lookup sv, _session253_1ae58_lookup tv
 WHERE t.slug='1-adam-eve-58-prayer-flame-of-fire'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=58 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=8 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

