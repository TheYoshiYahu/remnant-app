-- ----- fragment: minion_thewisdomofsolomon_04.sql (session253 the-wisdom-of-solomon 4) -----
-- Source anchor: apocrypha/the-wisdom-of-solomon ch4. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: wis04 (view _session253_wis04_lookup). Sort band base 58075, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_wis04_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: wisdom-of-solomon-4-righteous-taken-into-rest
  ('apocrypha', 'the-wisdom-of-solomon', 4, 7, 'canon', 'isaiah', 57, 1, 'free', E'Isaiah 57:1 — *The righteous perisheth, and no man layeth it to heart: and merciful men are taken away, none considering that the righteous is taken away from the evil to come.* The prophet''s reason for the early death of the just — taken from the evil to come — is exactly the rest Wisdom of Solomon 4:7 promises the one prevented with death.'),
  ('apocrypha', 'the-wisdom-of-solomon', 4, 7, 'canon', 'isaiah', 57, 2, 'free', E'Isaiah 57:2 — *He shall enter into peace: they shall rest in their beds, each one walking in his uprightness.* The rest into which the early-taken righteous enters in Isaiah is the same rest Wisdom of Solomon 4:7 names for him.'),
  ('apocrypha', 'the-wisdom-of-solomon', 4, 7, 'canon', 'psalms', 37, 37, 'free', E'Psalm 37:37 — *Mark the perfect man, and behold the upright: for the end of that man is peace.* The Psalmist''s verdict that the perfect man''s end is peace underwrites Wisdom of Solomon 4:7''s claim that the righteous, though dead, is in rest.'),
  -- thread: wisdom-of-solomon-4-pleased-god-and-translated-enoch
  ('apocrypha', 'the-wisdom-of-solomon', 4, 10, 'canon', 'genesis', 5, 24, 'free', E'Genesis 5:24 — *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him.* The man who pleased Yahuah and was translated in Wisdom of Solomon 4:10 is Enoch, whom Genesis says walked with Elohim and was taken.'),
  ('apocrypha', 'the-wisdom-of-solomon', 4, 10, 'canon', 'hebrews', 11, 5, 'free', E'Hebrews 11:5 — *By faith Enoch was translated that he should not see death; and was not found, because Elohim (God) had translated him: for before his translation he had this testimony, that he pleased Elohim (God).* Hebrews uses Wisdom of Solomon 4:10''s very word — pleased — and verb — translated — of Enoch''s taking.'),
  ('apocrypha', 'the-wisdom-of-solomon', 4, 11, 'apocrypha', 'ecclesiasticus', 44, 16, 'extras', E'Ecclesiasticus 44:16 — *Enoch pleased Yahuah (God), and was translated, being an example of repentance to all generations.* Sirach''s catalogue of the fathers describes the same pleasing-and-translation that Wisdom of Solomon 4:11 calls being speedily taken away.'),
  ('apocrypha', 'the-wisdom-of-solomon', 4, 11, 'jubilees', 'jubilees', 4, 23, 'extras', E'The Book of Jubilees 4:23 — *And he was taken from amongst the children of men, and we conducted him into the Garden of Eden in majesty and honour, and behold there he writes down the condemnation and judgment of the world, and all the wickedness of the children of men.* Jubilees narrates the very taking-away from among men that Wisdom of Solomon 4:11 says spared Enoch from wickedness.'),
  -- thread: wisdom-of-solomon-4-memorial-of-virtue-immortal
  ('apocrypha', 'the-wisdom-of-solomon', 4, 1, 'canon', 'proverbs', 10, 7, 'free', E'Proverbs 10:7 — *The memory of the just is blessed: but the name of the wicked shall rot.* The Proverb''s blessed memory of the just is precisely the immortal memorial of virtue that Wisdom of Solomon 4:1 prizes above children.'),
  -- thread: wisdom-of-solomon-4-ungodly-brood-rooted-out
  ('apocrypha', 'the-wisdom-of-solomon', 4, 4, 'canon', 'psalms', 1, 4, 'free', E'Psalm 1:4 — *The ungodly are not so: but are like the chaff which the wind driveth away.* The wind that drives away the chaff in the Psalm is the same wind that roots out the ungodly''s branches in Wisdom of Solomon 4:4.'),
  ('apocrypha', 'the-wisdom-of-solomon', 4, 3, 'canon', 'psalms', 1, 3, 'free', E'Psalm 1:3 — *And he shall be like a tree planted by the rivers of water, that bringeth forth his fruit in his season; his leaf also shall not wither; and whatsoever he doeth shall prosper.* The deep-rooted, fruitful tree of the Psalm is the foil to the bastard slips that take no deep rooting in Wisdom of Solomon 4:3.'),
  ('apocrypha', 'the-wisdom-of-solomon', 4, 5, 'canon', 'matthew', 13, 40, 'free', E'Matthew 13:40 — *As therefore the tares are gathered and burned in the fire; so shall it be in the end of this world.* The Messiah''s harvest of the tares brings to its end the imperfect, unprofitable branches that Wisdom of Solomon 4:5 says are broken off and meet for nothing.'),
  -- thread: wisdom-of-solomon-4-righteous-dead-condemns-ungodly
  ('apocrypha', 'the-wisdom-of-solomon', 4, 18, 'canon', 'psalms', 2, 4, 'free', E'Psalm 2:4 — *He that sitteth in the heavens shall laugh: Yahuah (Lord) shall have them in derision.* The enthroned Yahuah''s derisive laughter in the Psalm is the very laugh-to-scorn that Wisdom of Solomon 4:18 turns on the ungodly who despised the righteous.'),
  ('apocrypha', 'the-wisdom-of-solomon', 4, 16, 'apocrypha', 'the-wisdom-of-solomon', 5, 3, 'extras', E'The Wisdom of Solomon 5:3 — *And they repenting and groaning for anguish of spirit shall say within themselves, This was he, whom we had sometimes in derision, and a proverb of reproach.* The next chapter voices the too-late confession of the ungodly whom the righteous dead condemns in Wisdom of Solomon 4:16.'),
  ('apocrypha', 'the-wisdom-of-solomon', 4, 16, 'apocrypha', 'the-wisdom-of-solomon', 5, 4, 'extras', E'The Wisdom of Solomon 5:4 — *We fools accounted his life madness, and his end to be without honour.* The ungodly''s confession that they misjudged the righteous man''s end completes the condemnation Wisdom of Solomon 4:16 says the righteous dead pronounces over them.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_wis04_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_wis04_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-of-solomon-4-righteous-taken-into-rest',
       E'Though prevented with death, yet in rest',
       E'The Wisdom of Solomon turns the world''s reckoning upside down: *But though the righteous be prevented with death, yet shall he be in rest* (Wisdom of Solomon 4:7). The just one cut off early is not robbed but spared — he enters peace. This is the very word of the prophet, who marvels that no one perceives the mercy in the early grave: *The righteous perisheth, and no man layeth it to heart: and merciful men are taken away, none considering that the righteous is taken away from the evil to come* (Isaiah 57:1), and what follows is rest, not ruin — *He shall enter into peace: they shall rest in their beds, each one walking in his uprightness* (Isaiah 57:2). The Psalmist seals the same end: *Mark the perfect man, and behold the upright: for the end of that man is peace* (Psalm 37:37). It ain''t new — the deuterocanon carries the Tanakh''s own comfort: the righteous gathered early is gathered into Yahuah''s rest, away from the evil to come.',
       sv.verse_id, ev.verse_id, 'extras', 58075
  FROM _session253_wis04_lookup sv, _session253_wis04_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=4 AND sv.verse_number=7
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=4 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-of-solomon-4-pleased-god-and-translated-enoch',
       E'He pleased Yahuah and was translated — Enoch',
       E'*He pleased Yahuah (God), and was beloved of him: so that living among sinners he was translated. Yea speedily was he taken away, lest that wickedness should alter his understanding, or deceit beguile his soul* (Wisdom of Solomon 4:10-11). The portrait is unmistakable: this is Enoch, the man who pleased Elohim and was taken. Genesis tells it bare: *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him* (Genesis 5:24). The Letter to the Hebrews names the same testimony in the same words Wisdom of Solomon uses — *pleased* — *By faith Enoch was translated that he should not see death; and was not found, because Elohim (God) had translated him: for before his translation he had this testimony, that he pleased Elohim (God)* (Hebrews 11:5). The restored editions hold the same witness: Sirach remembers that *Enoch pleased Yahuah (God), and was translated, being an example of repentance to all generations* (Ecclesiasticus 44:16), and Jubilees records the taking — *And he was taken from amongst the children of men, and we conducted him into the Garden of Eden in majesty and honour* (The Book of Jubilees 4:23). It ain''t new: the translation of Enoch is the deuterocanon''s plain reading of why a righteous man is taken early.',
       sv.verse_id, ev.verse_id, 'extras', 58078
  FROM _session253_wis04_lookup sv, _session253_wis04_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=4 AND sv.verse_number=10
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=4 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-of-solomon-4-memorial-of-virtue-immortal',
       E'The memorial of virtue is immortal',
       E'Against the world''s measure of legacy by offspring, the Wisdom of Solomon sets virtue: *Better it is to have no children, and to have virtue: for the memorial thereof is immortal: because it is known with Yahuah (God), and with men* (Wisdom of Solomon 4:1). And the memorial endures in triumph — *When it is present, men take example at it; and when it is gone, they desire it: it wears a crown, and triumpheth for ever, having gotten the victory, striving for undefiled rewards* (Wisdom of Solomon 4:2). The Proverb says the same in a breath: *The memory of the just is blessed: but the name of the wicked shall rot* (Proverbs 10:7). It ain''t new — Solomon''s own Proverb already declared that it is the just man''s remembrance, not his progeny, that abides; the deuterocanon only unfolds it.',
       sv.verse_id, ev.verse_id, 'extras', 58081
  FROM _session253_wis04_lookup sv, _session253_wis04_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=4 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=4 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-of-solomon-4-ungodly-brood-rooted-out',
       E'The bastard slips rooted out by the wind',
       E'The Wisdom of Solomon denies the ungodly the endurance the world assumes their many children buy them: *But the multiplying brood of the ungodly shall not thrive, nor take deep rooting from bastard slips, nor lay any fast foundation* (Wisdom of Solomon 4:3), *For though they flourish in branches for a time; yet standing not last, they shall be shaken with the wind, and through the force of winds they shall be rooted out* (Wisdom of Solomon 4:4). This is the Psalter''s first contrast: the righteous is the rooted tree, but *The ungodly are not so: but are like the chaff which the wind driveth away* (Psalm 1:4) — over against the just man who *shall be like a tree planted by the rivers of water, that bringeth forth his fruit in his season; his leaf also shall not wither* (Psalm 1:3). And the harvest''s end is the Messiah''s parable of the tares: *As therefore the tares are gathered and burned in the fire; so shall it be in the end of this world* (Matthew 13:40). It ain''t new — the wind that uproots the ungodly slips is the chaff-scattering wind of Psalm 1 and the fire of the great gathering.',
       sv.verse_id, ev.verse_id, 'extras', 58084
  FROM _session253_wis04_lookup sv, _session253_wis04_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=4 AND sv.verse_number=3
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=4 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-of-solomon-4-righteous-dead-condemns-ungodly',
       E'The righteous dead condemns the ungodly',
       E'The chapter ends at the judgment scene: *Thus the righteous that is dead shall condemn the ungodly which are living; and youth that is soon perfected the many years and old age of the unrighteous* (Wisdom of Solomon 4:16). The ungodly who once despised him now see him vindicated and are themselves derided: *They shall see him, and despise him; but Yahuah (God) shall laugh them to scorn: and they shall hereafter be a vile carcase, and a reproach among the dead for evermore* (Wisdom of Solomon 4:18). That scorning laugh is the Psalmist''s enthroned Yahuah: *He that sitteth in the heavens shall laugh: Yahuah (Lord) shall have them in derision* (Psalm 2:4). And the next chapter delivers the too-late confession the ungodly will groan — the Wisdom of Solomon''s own continuation, the kings and the mighty seeing the vindicated righteous too late: *And they repenting and groaning for anguish of spirit shall say within themselves, This was he, whom we had sometimes in derision, and a proverb of reproach* (The Wisdom of Solomon 5:3), *We fools accounted his life madness, and his end to be without honour* (The Wisdom of Solomon 5:4). It ain''t new — this is the same too-late awakening the live apparatus binds to the kings before the Son of Adam (1 Enoch 62-63 / Revelation 6:15-17).',
       sv.verse_id, ev.verse_id, 'extras', 58087
  FROM _session253_wis04_lookup sv, _session253_wis04_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=4 AND sv.verse_number=16
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=4 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: wisdom-of-solomon-4-righteous-taken-into-rest
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 57:1 — *The righteous perisheth, and no man layeth it to heart: and merciful men are taken away, none considering that the righteous is taken away from the evil to come.* The prophet''s reason for the early death of the just — taken from the evil to come — is exactly the rest Wisdom of Solomon 4:7 promises the one prevented with death.'
  FROM cross_reference_threads t, cross_references x, _session253_wis04_lookup sv, _session253_wis04_lookup tv
 WHERE t.slug='wisdom-of-solomon-4-righteous-taken-into-rest'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=4 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=57 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 57:2 — *He shall enter into peace: they shall rest in their beds, each one walking in his uprightness.* The rest into which the early-taken righteous enters in Isaiah is the same rest Wisdom of Solomon 4:7 names for him.'
  FROM cross_reference_threads t, cross_references x, _session253_wis04_lookup sv, _session253_wis04_lookup tv
 WHERE t.slug='wisdom-of-solomon-4-righteous-taken-into-rest'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=4 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=57 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 37:37 — *Mark the perfect man, and behold the upright: for the end of that man is peace.* The Psalmist''s verdict that the perfect man''s end is peace underwrites Wisdom of Solomon 4:7''s claim that the righteous, though dead, is in rest.'
  FROM cross_reference_threads t, cross_references x, _session253_wis04_lookup sv, _session253_wis04_lookup tv
 WHERE t.slug='wisdom-of-solomon-4-righteous-taken-into-rest'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=4 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=37 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-of-solomon-4-pleased-god-and-translated-enoch
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 5:24 — *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him.* The man who pleased Yahuah and was translated in Wisdom of Solomon 4:10 is Enoch, whom Genesis says walked with Elohim and was taken.'
  FROM cross_reference_threads t, cross_references x, _session253_wis04_lookup sv, _session253_wis04_lookup tv
 WHERE t.slug='wisdom-of-solomon-4-pleased-god-and-translated-enoch'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=4 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 11:5 — *By faith Enoch was translated that he should not see death; and was not found, because Elohim (God) had translated him: for before his translation he had this testimony, that he pleased Elohim (God).* Hebrews uses Wisdom of Solomon 4:10''s very word — pleased — and verb — translated — of Enoch''s taking.'
  FROM cross_reference_threads t, cross_references x, _session253_wis04_lookup sv, _session253_wis04_lookup tv
 WHERE t.slug='wisdom-of-solomon-4-pleased-god-and-translated-enoch'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=4 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ecclesiasticus 44:16 — *Enoch pleased Yahuah (God), and was translated, being an example of repentance to all generations.* Sirach''s catalogue of the fathers describes the same pleasing-and-translation that Wisdom of Solomon 4:11 calls being speedily taken away.'
  FROM cross_reference_threads t, cross_references x, _session253_wis04_lookup sv, _session253_wis04_lookup tv
 WHERE t.slug='wisdom-of-solomon-4-pleased-god-and-translated-enoch'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=4 AND sv.verse_number=11
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=44 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'The Book of Jubilees 4:23 — *And he was taken from amongst the children of men, and we conducted him into the Garden of Eden in majesty and honour, and behold there he writes down the condemnation and judgment of the world, and all the wickedness of the children of men.* Jubilees narrates the very taking-away from among men that Wisdom of Solomon 4:11 says spared Enoch from wickedness.'
  FROM cross_reference_threads t, cross_references x, _session253_wis04_lookup sv, _session253_wis04_lookup tv
 WHERE t.slug='wisdom-of-solomon-4-pleased-god-and-translated-enoch'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=4 AND sv.verse_number=11
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-of-solomon-4-memorial-of-virtue-immortal
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 10:7 — *The memory of the just is blessed: but the name of the wicked shall rot.* The Proverb''s blessed memory of the just is precisely the immortal memorial of virtue that Wisdom of Solomon 4:1 prizes above children.'
  FROM cross_reference_threads t, cross_references x, _session253_wis04_lookup sv, _session253_wis04_lookup tv
 WHERE t.slug='wisdom-of-solomon-4-memorial-of-virtue-immortal'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=4 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=10 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-of-solomon-4-ungodly-brood-rooted-out
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 1:4 — *The ungodly are not so: but are like the chaff which the wind driveth away.* The wind that drives away the chaff in the Psalm is the same wind that roots out the ungodly''s branches in Wisdom of Solomon 4:4.'
  FROM cross_reference_threads t, cross_references x, _session253_wis04_lookup sv, _session253_wis04_lookup tv
 WHERE t.slug='wisdom-of-solomon-4-ungodly-brood-rooted-out'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=4 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=1 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 1:3 — *And he shall be like a tree planted by the rivers of water, that bringeth forth his fruit in his season; his leaf also shall not wither; and whatsoever he doeth shall prosper.* The deep-rooted, fruitful tree of the Psalm is the foil to the bastard slips that take no deep rooting in Wisdom of Solomon 4:3.'
  FROM cross_reference_threads t, cross_references x, _session253_wis04_lookup sv, _session253_wis04_lookup tv
 WHERE t.slug='wisdom-of-solomon-4-ungodly-brood-rooted-out'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=4 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 13:40 — *As therefore the tares are gathered and burned in the fire; so shall it be in the end of this world.* The Messiah''s harvest of the tares brings to its end the imperfect, unprofitable branches that Wisdom of Solomon 4:5 says are broken off and meet for nothing.'
  FROM cross_reference_threads t, cross_references x, _session253_wis04_lookup sv, _session253_wis04_lookup tv
 WHERE t.slug='wisdom-of-solomon-4-ungodly-brood-rooted-out'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=4 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=13 AND tv.verse_number=40
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-of-solomon-4-righteous-dead-condemns-ungodly
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 2:4 — *He that sitteth in the heavens shall laugh: Yahuah (Lord) shall have them in derision.* The enthroned Yahuah''s derisive laughter in the Psalm is the very laugh-to-scorn that Wisdom of Solomon 4:18 turns on the ungodly who despised the righteous.'
  FROM cross_reference_threads t, cross_references x, _session253_wis04_lookup sv, _session253_wis04_lookup tv
 WHERE t.slug='wisdom-of-solomon-4-righteous-dead-condemns-ungodly'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=4 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'The Wisdom of Solomon 5:3 — *And they repenting and groaning for anguish of spirit shall say within themselves, This was he, whom we had sometimes in derision, and a proverb of reproach.* The next chapter voices the too-late confession of the ungodly whom the righteous dead condemns in Wisdom of Solomon 4:16.'
  FROM cross_reference_threads t, cross_references x, _session253_wis04_lookup sv, _session253_wis04_lookup tv
 WHERE t.slug='wisdom-of-solomon-4-righteous-dead-condemns-ungodly'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=4 AND sv.verse_number=16
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=5 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'The Wisdom of Solomon 5:4 — *We fools accounted his life madness, and his end to be without honour.* The ungodly''s confession that they misjudged the righteous man''s end completes the condemnation Wisdom of Solomon 4:16 says the righteous dead pronounces over them.'
  FROM cross_reference_threads t, cross_references x, _session253_wis04_lookup sv, _session253_wis04_lookup tv
 WHERE t.slug='wisdom-of-solomon-4-righteous-dead-condemns-ungodly'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=4 AND sv.verse_number=16
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=5 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

