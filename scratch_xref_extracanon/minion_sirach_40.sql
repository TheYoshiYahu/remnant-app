-- ----- fragment: minion_ecclesiasticus_40.sql (session253 ecclesiasticus 40) -----
-- Source anchor: apocrypha/ecclesiasticus ch40. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: sir40 (view _session253_sir40_lookup). Sort band base 59275, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_sir40_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ecclesiasticus-40-yoke-of-adam
  ('apocrypha', 'ecclesiasticus', 40, 1, 'canon', 'genesis', 3, 17, 'free', E'Genesis 3:17 — *And unto Adam he said, Because thou hast hearkened unto the voice of thy wife, and hast eaten of the tree, of which I commanded thee, saying, Thou shalt not eat of it: cursed is the ground for thy sake; in sorrow shalt thou eat of it all the days of thy life;* The heavy yoke of Sirach 40:1 is the Edenic curse laid on the ground and on Adam''s labour.'),
  ('apocrypha', 'ecclesiasticus', 40, 1, 'canon', 'genesis', 3, 19, 'free', E'Genesis 3:19 — *In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return.* The womb-to-return arc of Sirach 40:1 traces exactly Adam''s sentence to go back to the dust he came from.'),
  ('apocrypha', 'ecclesiasticus', 40, 1, 'canon', 'job', 14, 1, 'free', E'Job 14:1 — *Man that is born of a woman is of few days, and full of trouble.* Job states the same travail-from-the-womb that Sirach 40:1 lays on every son of Adam.'),
  ('apocrypha', 'ecclesiasticus', 40, 1, 'canon', 'job', 1, 21, 'free', E'Job 1:21 — *And said, Naked came I out of my mother’s womb, and naked shall I return thither: Yahuah (LORD) gave, and Yahuah (LORD) hath taken away; blessed be the name of Yahuah (LORD).* Job''s going-out and returning to the mother of all is the very frame of Sirach 40:1.'),
  -- thread: ecclesiasticus-40-days-of-trouble-vanity
  ('apocrypha', 'ecclesiasticus', 40, 5, 'canon', 'ecclesiastes', 2, 22, 'free', E'Ecclesiastes 2:22 — *For what hath man of all his labour, and of the vexation of his heart, wherein he hath laboured under the sun?* Qoheleth''s question over labour and the vexed heart is the same travail Sirach 40:5 reads onto man''s nights.'),
  ('apocrypha', 'ecclesiasticus', 40, 6, 'canon', 'ecclesiastes', 2, 23, 'free', E'Ecclesiastes 2:23 — *For all his days are sorrows, and his travail grief; yea, his heart taketh not rest in the night. This is also vanity.* The heart that takes no rest in the night is exactly the troubled night-sleep of Sirach 40:6.'),
  ('apocrypha', 'ecclesiasticus', 40, 5, 'canon', 'psalms', 90, 10, 'free', E'Psalm 90:10 — *The days of our years are threescore years and ten; and if by reason of strength they be fourscore years, yet is their strength labour and sorrow; for it is soon cut off, and we fly away.* Moses'' tally of years as labour and sorrow matches the lifelong unquietness of Sirach 40:5.'),
  ('apocrypha', 'ecclesiasticus', 40, 2, 'canon', 'matthew', 6, 34, 'free', E'Matthew 6:34 — *Take therefore no thought for the morrow: for the morrow shall take thought for the things of itself. Sufficient unto the day is the evil thereof.* The Messiah answers the dread of things to come that troubles the thoughts in Sirach 40:2.'),
  -- thread: ecclesiasticus-40-flood-earth-returns-truth-endures
  ('apocrypha', 'ecclesiasticus', 40, 10, 'canon', 'genesis', 6, 13, 'free', E'Genesis 6:13 — *And Elohim (God) said unto Noah, The end of all flesh is come before me; for the earth is filled with violence through them; and, behold, I will destroy them with the earth.* The flood Sirach 40:10 says came for the wicked is the very judgment on filled-with-violence flesh.'),
  ('apocrypha', 'ecclesiasticus', 40, 10, 'canon', 'genesis', 6, 17, 'free', E'Genesis 6:17 — *And, behold, I, even I, do bring a flood of waters upon the earth, to destroy all flesh, wherein is the breath of life, from under heaven; and every thing that is in the earth shall die.* Yahuah''s own decree of the flood underwrites Sirach 40:10''s ''for their sakes came the flood.'''),
  ('apocrypha', 'ecclesiasticus', 40, 11, 'canon', 'romans', 8, 20, 'free', E'Romans 8:20 — *For the creature was made subject to vanity, not willingly, but by reason of him who hath subjected the same in hope,* The earth and waters returning to their source in Sirach 40:11 are the creation subjected to vanity yet held in hope.'),
  ('apocrypha', 'ecclesiasticus', 40, 11, 'canon', 'romans', 8, 22, 'free', E'Romans 8:22 — *For we know that the whole creation groaneth and travaileth in pain together until now.* Paul''s groaning creation matches the dissolving made-order of Sirach 40:11, all things turning back to earth and sea.'),
  ('apocrypha', 'ecclesiasticus', 40, 12, 'canon', 'proverbs', 10, 28, 'free', E'Proverbs 10:28 — *The hope of the righteous shall be gladness: but the expectation of the wicked shall perish.* Against the blotting-out of injustice in Sirach 40:12, the righteous hope endures while the wicked''s expectation perishes.'),
  -- thread: ecclesiasticus-40-alms-deliver-mercy-endures
  ('apocrypha', 'ecclesiasticus', 40, 24, 'apocrypha', 'tobit', 4, 10, 'extras', E'Tobit 4:10 — *Because that alms do deliver from death, and suffers not to come into darkness.* Tobit''s charge to Tobias is the same verdict as Sirach 40:24 — alms deliver above brothers and help.'),
  ('apocrypha', 'ecclesiasticus', 40, 24, 'apocrypha', 'tobit', 12, 9, 'extras', E'Tobit 12:9 — *For alms does deliver from death, and shall purge away all sin. Those that exercise alms and righteousness shall be filled with life:* The angel Raphael''s word ties straight to Sirach 40:24 — alms deliver more than kin or rescue.'),
  ('apocrypha', 'ecclesiasticus', 40, 17, 'canon', 'proverbs', 11, 4, 'free', E'Proverbs 11:4 — *Riches profit not in the day of wrath: but righteousness delivereth from death.* The mercy that endureth for ever in Sirach 40:17 is the righteousness that, unlike riches, delivers.'),
  ('apocrypha', 'ecclesiasticus', 40, 24, 'canon', 'luke', 12, 33, 'free', E'Luke 12:33 — *Sell that ye have, and give alms; provide yourselves bags which wax not old, a treasure in the heavens that faileth not, where no thief approacheth, neither moth corrupteth.* The Messiah makes alms the imperishable treasure, exactly Sirach 40:24''s verdict that alms deliver above all.'),
  -- thread: ecclesiasticus-40-fear-of-yahuah-surpasses-all
  ('apocrypha', 'ecclesiasticus', 40, 26, 'canon', 'proverbs', 1, 7, 'free', E'Proverbs 1:7 — *The fear of Yahuah (LORD) is the beginning of knowledge: but fools despise wisdom and instruction.* The fear of Yahuah that Sirach 40:26 sets above riches and strength is the very beginning of knowledge.'),
  ('apocrypha', 'ecclesiasticus', 40, 27, 'canon', 'psalms', 111, 10, 'free', E'Psalm 111:10 — *The fear of Yahuah (LORD) is the beginning of wisdom: a good understanding have all they that do his commandments: his praise endureth for ever.* The fruitful garden of Sirach 40:27 belongs to those who fear Yahuah and do his commandments — Torah stands.'),
  ('apocrypha', 'ecclesiasticus', 40, 26, 'apocrypha', 'ecclesiasticus', 1, 14, 'extras', E'Ecclesiasticus 1:14 — *To fear Yahuah (God) is the beginning of wisdom: and it was created with the faithful in the womb.* Ben Sira''s own opening declares what Sirach 40:26 climbs to — the fear of Yahuah surpassing every other good.'),
  ('apocrypha', 'ecclesiasticus', 40, 19, 'canon', 'proverbs', 18, 22, 'free', E'Proverbs 18:22 — *Whoso findeth a wife findeth a good thing, and obtaineth favour of Yahuah (LORD).* The blameless wife counted above children and city in Sirach 40:19 is the good thing and favour Proverbs names.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_sir40_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_sir40_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-40-yoke-of-adam',
       E'The heavy yoke upon the sons of Adam',
       E'Ben Sira opens the human lot with the weight that lies on every child of Adam: *Great travail is created for every man, and an heavy yoke is upon the sons of Adam, from the day that they go out of their mother’s womb, till the day that they return to the mother of all things* (Ecclesiasticus 40:1). It ain''t new — this is the Edenic sentence read out over the whole race. Yahuah said to the man, *cursed is the ground for thy sake; in sorrow shalt thou eat of it all the days of thy life* (Genesis 3:17), and *In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return* (Genesis 3:19) — the womb-to-dust arc Ben Sira traces. Job names the same brief, burdened span: *Man that is born of a woman is of few days, and full of trouble* (Job 14:1), and confesses the going-out-and-returning that Sirach echoes — *Naked came I out of my mother’s womb, and naked shall I return thither: Yahuah (LORD) gave, and Yahuah (LORD) hath taken away; blessed be the name of Yahuah (LORD)* (Job 1:21).',
       sv.verse_id, ev.verse_id, 'extras', 59275
  FROM _session253_sir40_lookup sv, _session253_sir40_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=40 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=40 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-40-days-of-trouble-vanity',
       E'Anxious days, broken sleep, and vexation under the sun',
       E'The yoke is not only labour but the inner unrest — dread of the day of death, fearful dreams, sleep that brings no rest: *A little or nothing is his rest, and afterward he is in his sleep, as in a day of keeping watch, troubled in the vision of his heart, as if he were escaped out of a battle* (Ecclesiasticus 40:6). Qoheleth had already pressed the question, *For what hath man of all his labour, and of the vexation of his heart, wherein he hath laboured under the sun?* (Ecclesiastes 2:22), and answered it: *For all his days are sorrows, and his travail grief; yea, his heart taketh not rest in the night. This is also vanity* (Ecclesiastes 2:23) — the very sleepless heart of Sirach 40:5-6. Moses sang the span over: *The days of our years are threescore years and ten; and if by reason of strength they be fourscore years, yet is their strength labour and sorrow; for it is soon cut off, and we fly away* (Psalm 90:10). And the Messiah lifts the anxious imagination of things to come (40:2) with the counsel, *Take therefore no thought for the morrow: for the morrow shall take thought for the things of itself. Sufficient unto the day is the evil thereof* (Matthew 6:34).',
       sv.verse_id, ev.verse_id, 'extras', 59278
  FROM _session253_sir40_lookup sv, _session253_sir40_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=40 AND sv.verse_number=5
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=40 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-40-flood-earth-returns-truth-endures',
       E'The flood for the wicked; the earth returns, but true dealing endures',
       E'Ben Sira turns to judgment and permanence: the calamities *are created for the wicked, and for their sakes came the flood* (Ecclesiasticus 40:10). The flood came for the violence of all flesh — *And Elohim (God) said unto Noah, The end of all flesh is come before me; for the earth is filled with violence through them; and, behold, I will destroy them with the earth* (Genesis 6:13); *And, behold, I, even I, do bring a flood of waters upon the earth, to destroy all flesh* (Genesis 6:17). Then the great reversal: *All things that are of the earth shall turn to the earth again: and that which is of the waters does return into the sea* (Ecclesiasticus 40:11) — the dust-to-dust, water-to-sea undoing of the made order, while *All bribery and injustice shall be blotted out: but true dealing shall endure for ever* (Ecclesiasticus 40:12). Paul reads the whole subjected creation the same way: *For the creature was made subject to vanity, not willingly, but by reason of him who hath subjected the same in hope* (Romans 8:20); *For we know that the whole creation groaneth and travaileth in pain together until now* (Romans 8:22) — vanity now, but a hope laid up, for *The hope of the righteous shall be gladness: but the expectation of the wicked shall perish* (Proverbs 10:28).',
       sv.verse_id, ev.verse_id, 'extras', 59281
  FROM _session253_sir40_lookup sv, _session253_sir40_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=40 AND sv.verse_number=10
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=40 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-40-alms-deliver-mercy-endures',
       E'Bountifulness a fruitful garden; alms deliver above all',
       E'Over against goods that dry up, Ben Sira sets the deeds that abide: *Bountifulness is as a most fruitful garden, and mercifulness endureth for ever* (Ecclesiasticus 40:17). And running through his catalogue of paired goods, one weighs above kin and rescue alike: *Brothers and help are against time of trouble: but alms shall deliver more than them both* (Ecclesiasticus 40:24). It ain''t new — and the apocrypha says it together with one voice. Tobit teaches his son the same: *Because that alms do deliver from death, and suffers not to come into darkness* (Tobit 4:10), and the angel Raphael confirms it — *For alms does deliver from death, and shall purge away all sin. Those that exercise alms and righteousness shall be filled with life:* (Tobit 12:9). The Tanakh roots it — *Riches profit not in the day of wrath: but righteousness delivereth from death* (Proverbs 11:4) — and the Messiah crowns it: *Sell that ye have, and give alms; provide yourselves bags which wax not old, a treasure in the heavens that faileth not, where no thief approacheth, neither moth corrupteth* (Luke 12:33).',
       sv.verse_id, ev.verse_id, 'extras', 59284
  FROM _session253_sir40_lookup sv, _session253_sir40_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=40 AND sv.verse_number=17
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=40 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-40-fear-of-yahuah-surpasses-all',
       E'The fear of Yahuah, a fruitful garden above all glory',
       E'Ben Sira''s chain of paired goods climbs to its summit and stops there: *Riches and strength lift up the heart: but the fear of Yahuah (God) is above them both: there is no want in the fear of Yahuah (God), and it needeth not to seek help* (Ecclesiasticus 40:26); *The fear of Yahuah (God) is a fruitful garden, and covereth him above all glory* (Ecclesiasticus 40:27). This is the spine of all wisdom literature — *The fear of Yahuah (LORD) is the beginning of knowledge: but fools despise wisdom and instruction* (Proverbs 1:7); *The fear of Yahuah (LORD) is the beginning of wisdom: a good understanding have all they that do his commandments: his praise endureth for ever* (Psalm 111:10), where the fear of Yahuah keeps company with doing his commandments — Torah stands. Ben Sira said it himself at the head of his book: *To fear Yahuah (God) is the beginning of wisdom: and it was created with the faithful in the womb* (Ecclesiasticus 1:14). And among the surpassing goods he names the blameless wife (40:19,23), of whom the Tanakh agrees — *Whoso findeth a wife findeth a good thing, and obtaineth favour of Yahuah (LORD)* (Proverbs 18:22).',
       sv.verse_id, ev.verse_id, 'extras', 59287
  FROM _session253_sir40_lookup sv, _session253_sir40_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=40 AND sv.verse_number=26
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=40 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ecclesiasticus-40-yoke-of-adam
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:17 — *And unto Adam he said, Because thou hast hearkened unto the voice of thy wife, and hast eaten of the tree, of which I commanded thee, saying, Thou shalt not eat of it: cursed is the ground for thy sake; in sorrow shalt thou eat of it all the days of thy life;* The heavy yoke of Sirach 40:1 is the Edenic curse laid on the ground and on Adam''s labour.'
  FROM cross_reference_threads t, cross_references x, _session253_sir40_lookup sv, _session253_sir40_lookup tv
 WHERE t.slug='ecclesiasticus-40-yoke-of-adam'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=40 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:19 — *In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return.* The womb-to-return arc of Sirach 40:1 traces exactly Adam''s sentence to go back to the dust he came from.'
  FROM cross_reference_threads t, cross_references x, _session253_sir40_lookup sv, _session253_sir40_lookup tv
 WHERE t.slug='ecclesiasticus-40-yoke-of-adam'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=40 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Job 14:1 — *Man that is born of a woman is of few days, and full of trouble.* Job states the same travail-from-the-womb that Sirach 40:1 lays on every son of Adam.'
  FROM cross_reference_threads t, cross_references x, _session253_sir40_lookup sv, _session253_sir40_lookup tv
 WHERE t.slug='ecclesiasticus-40-yoke-of-adam'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=40 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=14 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Job 1:21 — *And said, Naked came I out of my mother’s womb, and naked shall I return thither: Yahuah (LORD) gave, and Yahuah (LORD) hath taken away; blessed be the name of Yahuah (LORD).* Job''s going-out and returning to the mother of all is the very frame of Sirach 40:1.'
  FROM cross_reference_threads t, cross_references x, _session253_sir40_lookup sv, _session253_sir40_lookup tv
 WHERE t.slug='ecclesiasticus-40-yoke-of-adam'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=40 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=1 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-40-days-of-trouble-vanity
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ecclesiastes 2:22 — *For what hath man of all his labour, and of the vexation of his heart, wherein he hath laboured under the sun?* Qoheleth''s question over labour and the vexed heart is the same travail Sirach 40:5 reads onto man''s nights.'
  FROM cross_reference_threads t, cross_references x, _session253_sir40_lookup sv, _session253_sir40_lookup tv
 WHERE t.slug='ecclesiasticus-40-days-of-trouble-vanity'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=40 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=2 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ecclesiastes 2:23 — *For all his days are sorrows, and his travail grief; yea, his heart taketh not rest in the night. This is also vanity.* The heart that takes no rest in the night is exactly the troubled night-sleep of Sirach 40:6.'
  FROM cross_reference_threads t, cross_references x, _session253_sir40_lookup sv, _session253_sir40_lookup tv
 WHERE t.slug='ecclesiasticus-40-days-of-trouble-vanity'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=40 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=2 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 90:10 — *The days of our years are threescore years and ten; and if by reason of strength they be fourscore years, yet is their strength labour and sorrow; for it is soon cut off, and we fly away.* Moses'' tally of years as labour and sorrow matches the lifelong unquietness of Sirach 40:5.'
  FROM cross_reference_threads t, cross_references x, _session253_sir40_lookup sv, _session253_sir40_lookup tv
 WHERE t.slug='ecclesiasticus-40-days-of-trouble-vanity'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=40 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=90 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 6:34 — *Take therefore no thought for the morrow: for the morrow shall take thought for the things of itself. Sufficient unto the day is the evil thereof.* The Messiah answers the dread of things to come that troubles the thoughts in Sirach 40:2.'
  FROM cross_reference_threads t, cross_references x, _session253_sir40_lookup sv, _session253_sir40_lookup tv
 WHERE t.slug='ecclesiasticus-40-days-of-trouble-vanity'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=40 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=6 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-40-flood-earth-returns-truth-endures
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:13 — *And Elohim (God) said unto Noah, The end of all flesh is come before me; for the earth is filled with violence through them; and, behold, I will destroy them with the earth.* The flood Sirach 40:10 says came for the wicked is the very judgment on filled-with-violence flesh.'
  FROM cross_reference_threads t, cross_references x, _session253_sir40_lookup sv, _session253_sir40_lookup tv
 WHERE t.slug='ecclesiasticus-40-flood-earth-returns-truth-endures'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=40 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 6:17 — *And, behold, I, even I, do bring a flood of waters upon the earth, to destroy all flesh, wherein is the breath of life, from under heaven; and every thing that is in the earth shall die.* Yahuah''s own decree of the flood underwrites Sirach 40:10''s ''for their sakes came the flood.'''
  FROM cross_reference_threads t, cross_references x, _session253_sir40_lookup sv, _session253_sir40_lookup tv
 WHERE t.slug='ecclesiasticus-40-flood-earth-returns-truth-endures'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=40 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 8:20 — *For the creature was made subject to vanity, not willingly, but by reason of him who hath subjected the same in hope,* The earth and waters returning to their source in Sirach 40:11 are the creation subjected to vanity yet held in hope.'
  FROM cross_reference_threads t, cross_references x, _session253_sir40_lookup sv, _session253_sir40_lookup tv
 WHERE t.slug='ecclesiasticus-40-flood-earth-returns-truth-endures'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=40 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=8 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 8:22 — *For we know that the whole creation groaneth and travaileth in pain together until now.* Paul''s groaning creation matches the dissolving made-order of Sirach 40:11, all things turning back to earth and sea.'
  FROM cross_reference_threads t, cross_references x, _session253_sir40_lookup sv, _session253_sir40_lookup tv
 WHERE t.slug='ecclesiasticus-40-flood-earth-returns-truth-endures'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=40 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=8 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Proverbs 10:28 — *The hope of the righteous shall be gladness: but the expectation of the wicked shall perish.* Against the blotting-out of injustice in Sirach 40:12, the righteous hope endures while the wicked''s expectation perishes.'
  FROM cross_reference_threads t, cross_references x, _session253_sir40_lookup sv, _session253_sir40_lookup tv
 WHERE t.slug='ecclesiasticus-40-flood-earth-returns-truth-endures'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=40 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=10 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-40-alms-deliver-mercy-endures
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Tobit 4:10 — *Because that alms do deliver from death, and suffers not to come into darkness.* Tobit''s charge to Tobias is the same verdict as Sirach 40:24 — alms deliver above brothers and help.'
  FROM cross_reference_threads t, cross_references x, _session253_sir40_lookup sv, _session253_sir40_lookup tv
 WHERE t.slug='ecclesiasticus-40-alms-deliver-mercy-endures'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=40 AND sv.verse_number=24
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=4 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Tobit 12:9 — *For alms does deliver from death, and shall purge away all sin. Those that exercise alms and righteousness shall be filled with life:* The angel Raphael''s word ties straight to Sirach 40:24 — alms deliver more than kin or rescue.'
  FROM cross_reference_threads t, cross_references x, _session253_sir40_lookup sv, _session253_sir40_lookup tv
 WHERE t.slug='ecclesiasticus-40-alms-deliver-mercy-endures'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=40 AND sv.verse_number=24
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=12 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 11:4 — *Riches profit not in the day of wrath: but righteousness delivereth from death.* The mercy that endureth for ever in Sirach 40:17 is the righteousness that, unlike riches, delivers.'
  FROM cross_reference_threads t, cross_references x, _session253_sir40_lookup sv, _session253_sir40_lookup tv
 WHERE t.slug='ecclesiasticus-40-alms-deliver-mercy-endures'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=40 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=11 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Luke 12:33 — *Sell that ye have, and give alms; provide yourselves bags which wax not old, a treasure in the heavens that faileth not, where no thief approacheth, neither moth corrupteth.* The Messiah makes alms the imperishable treasure, exactly Sirach 40:24''s verdict that alms deliver above all.'
  FROM cross_reference_threads t, cross_references x, _session253_sir40_lookup sv, _session253_sir40_lookup tv
 WHERE t.slug='ecclesiasticus-40-alms-deliver-mercy-endures'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=40 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=12 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-40-fear-of-yahuah-surpasses-all
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 1:7 — *The fear of Yahuah (LORD) is the beginning of knowledge: but fools despise wisdom and instruction.* The fear of Yahuah that Sirach 40:26 sets above riches and strength is the very beginning of knowledge.'
  FROM cross_reference_threads t, cross_references x, _session253_sir40_lookup sv, _session253_sir40_lookup tv
 WHERE t.slug='ecclesiasticus-40-fear-of-yahuah-surpasses-all'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=40 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=1 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 111:10 — *The fear of Yahuah (LORD) is the beginning of wisdom: a good understanding have all they that do his commandments: his praise endureth for ever.* The fruitful garden of Sirach 40:27 belongs to those who fear Yahuah and do his commandments — Torah stands.'
  FROM cross_reference_threads t, cross_references x, _session253_sir40_lookup sv, _session253_sir40_lookup tv
 WHERE t.slug='ecclesiasticus-40-fear-of-yahuah-surpasses-all'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=40 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=111 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ecclesiasticus 1:14 — *To fear Yahuah (God) is the beginning of wisdom: and it was created with the faithful in the womb.* Ben Sira''s own opening declares what Sirach 40:26 climbs to — the fear of Yahuah surpassing every other good.'
  FROM cross_reference_threads t, cross_references x, _session253_sir40_lookup sv, _session253_sir40_lookup tv
 WHERE t.slug='ecclesiasticus-40-fear-of-yahuah-surpasses-all'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=40 AND sv.verse_number=26
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Proverbs 18:22 — *Whoso findeth a wife findeth a good thing, and obtaineth favour of Yahuah (LORD).* The blameless wife counted above children and city in Sirach 40:19 is the good thing and favour Proverbs names.'
  FROM cross_reference_threads t, cross_references x, _session253_sir40_lookup sv, _session253_sir40_lookup tv
 WHERE t.slug='ecclesiasticus-40-fear-of-yahuah-surpasses-all'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=40 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=18 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

