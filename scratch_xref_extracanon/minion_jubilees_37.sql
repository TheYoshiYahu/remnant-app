-- ----- fragment: minion_jubilees_37.sql (session251 jubilees 37) -----
-- Source anchor: jubilees/jubilees ch37. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ju37 (view _session251_ju37_lookup). Sort band base 53900, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session251_ju37_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jubilees-37-birthright-sold
  ('jubilees', 'jubilees', 37, 3, 'canon', 'genesis', 25, 31, 'free', E'Genesis 25:31 — *And Jacob said, Sell me this day thy birthright.* The bargain Esau confesses in Jubilees 37:3 is the field-scene of Genesis quoted beside it.'),
  ('jubilees', 'jubilees', 37, 3, 'canon', 'genesis', 25, 32, 'free', E'Genesis 25:32 — *And Esau said, Behold, I am at the point to die: and what profit shall this birthright do to me?* Esau''s own contempt for the birthright underlies his sons'' anger in Jubilees 37:1-3.'),
  ('jubilees', 'jubilees', 37, 3, 'canon', 'hebrews', 12, 16, 'free', E'Hebrews 12:16 — *Lest there be any fornicator, or profane person, as Esau, who for one morsel of meat sold his birthright.* The New Testament reads the lentil-bargain of Jubilees 37:3 as profanity, not mere loss.'),
  ('jubilees', 'jubilees', 37, 1, 'canon', 'genesis', 27, 41, 'free', E'Genesis 27:41 — *And Esau hated Jacob because of the blessing wherewith his father blessed him: and Esau said in his heart, The days of mourning for my father are at hand; then will I slay my brother Jacob.* The hatred that ignites Esau''s sons in Jubilees 37:1 is the heart Genesis already exposed.'),
  -- thread: jubilees-37-oath-broken
  ('jubilees', 'jubilees', 37, 4, 'jubilees', 'jubilees', 36, 8, 'extras', E'Jubilees 36:8 — *And that each will love his brother with affection and righteousness, and that neither will desire evil against his brother from henceforth for ever all the days of your life, so that you may prosper in all your deeds and not be destroyed.* The very oath Esau recalls in Jubilees 37:4 was sworn before dying Isaac the chapter before.'),
  ('jubilees', 'jubilees', 37, 5, 'jubilees', 'jubilees', 36, 9, 'extras', E'Jubilees 36:9 — *And if either of you devises evil against his brother, know that from henceforth every one that devises evil against his brother will fall into his hand, and will be rooted out of the land of the living, and his seed will be destroyed from under heaven.* Esau''s sons devise the very evil (Jubilees 37:5) Isaac''s oath cursed with rooting-out.'),
  ('jubilees', 'jubilees', 37, 4, 'canon', 'obadiah', 1, 10, 'free', E'Obadiah 1:10 — *For thy violence against thy brother Jacob shame shall cover thee, and thou shalt be cut off for ever.* Breaking the brother-oath of Jubilees 37:4 is exactly the violence-against-Jacob Obadiah pronounces Edom cut off for.'),
  -- thread: jubilees-37-edom-pursues-brother
  ('jubilees', 'jubilees', 37, 10, 'canon', 'amos', 1, 11, 'free', E'Amos 1:11 — *Thus saith Yahuah (LORD); For three transgressions of Edom, and for four, I will not turn away the punishment thereof; because he did pursue his brother with the sword, and did cast off all pity, and his anger did tear perpetually, and he kept his wrath for ever:* The Edomite war-band of Jubilees 37:9-10 is Amos''s sword-pursuit of the brother itself.'),
  ('jubilees', 'jubilees', 37, 10, 'canon', 'ezekiel', 35, 5, 'free', E'Ezekiel 35:5 — *Because thou hast had a perpetual hatred, and hast shed the blood of the children of Yashar''el (Israel) by the force of the sword in the time of their calamity, in the time that their iniquity had an end:* Esau''s perpetual hatred armed in Jubilees 37:10 is the perpetual hatred Ezekiel charges Mount Seir with.'),
  ('jubilees', 'jubilees', 37, 9, 'canon', 'obadiah', 1, 14, 'free', E'Obadiah 1:14 — *Neither shouldest thou have stood in the crossway, to cut off those of his that did escape; neither shouldest thou have delivered up those of his that did remain in the day of distress.* The hired men-of-war assembled in Jubilees 37:9 are Edom''s standing-in-the-crossway against his brother.'),
  -- thread: jubilees-37-elder-serves-younger
  ('jubilees', 'jubilees', 37, 23, 'canon', 'genesis', 25, 23, 'free', E'Genesis 25:23 — *And Yahuah (LORD) said unto her, Two nations are in thy womb, and two manner of people shall be separated from thy bowels; and the one people shall be stronger than the other people; and the elder shall serve the younger.* Esau''s rooting-out curse in Jubilees 37:23 collides with the womb-oracle that already set Jacob over him.'),
  ('jubilees', 'jubilees', 37, 19, 'canon', 'malachi', 1, 3, 'free', E'Malachi 1:3 — *And I hated Esau, and laid his mountains and his heritage waste for the dragons of the wilderness.* Esau''s everlasting hatred of Jacob''s children (Jubilees 37:19) is answered by Yahuah laying Esau''s mountains waste.'),
  ('jubilees', 'jubilees', 37, 23, 'canon', 'romans', 9, 13, 'free', E'Romans 9:13 — *As it is written, Jacob have I loved, but Esau have I hated.* The curse Esau speaks over Jacob in Jubilees 37:23 is overruled by the election Paul names: Jacob loved, Esau hated.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session251_ju37_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session251_ju37_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-37-birthright-sold',
       E'The birthright Esau despised, the blessing he lost',
       E'Esau''s sons rage that the elder''s portion went to Jacob, and Esau confesses the old wound: *“Because I sold my birthright to Jacob for a small mess of lentils; and on the day my father sent me to hunt and catch and bring him something that he should eat and bless me, he came with guile and brought my father food and drink, and my father blessed him and put me under his hand.”* (Jubilees 37:3). This is no new tale — it is the bargain at the field already written: *And Jacob said, Sell me this day thy birthright. And Esau said, Behold, I am at the point to die: and what profit shall this birthright do to me?* (Genesis 25:31-32). The New Testament names the act profane — *Lest there be any fornicator, or profane person, as Esau, who for one morsel of meat sold his birthright.* (Hebrews 12:16). And the grudge Jubilees opens with is the very grudge of the blessing scene: *And Esau hated Jacob because of the blessing wherewith his father blessed him* (Genesis 27:41). It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53900
  FROM _session251_ju37_lookup sv, _session251_ju37_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=37 AND sv.verse_number=1
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=37 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-37-oath-broken',
       E'The oath of brotherhood, broken',
       E'Esau pleads the covenant his father bound on him: *“And now our father has caused us to swear, me and him, that we shall not mutually devise evil, either against his brother, and that we shall continue in love and in peace each with his brother and not make our ways corrupt.”* (Jubilees 37:4) — yet his sons answer, *“We shall not hearken to you to make peace with him… we shall go against him and slay him”* (Jubilees 37:5). The oath is no later invention: one chapter before, dying Isaac had made them swear it — *And that each will love his brother with affection and righteousness, and that neither will desire evil against his brother from henceforth for ever all the days of your life* (Jubilees 36:8) — with the curse attached, *And if either of you devises evil against his brother… he will be rooted out of the land of the living* (Jubilees 36:9). To break it is to inherit Edom''s doom: *For thy violence against thy brother Jacob shame shall cover thee, and thou shalt be cut off for ever.* (Obadiah 1:10). It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53903
  FROM _session251_ju37_lookup sv, _session251_ju37_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=37 AND sv.verse_number=4
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=37 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-37-edom-pursues-brother',
       E'Edom hires the nations and pursues his brother with the sword',
       E'Esau''s sons muster the mercenary nations against Jacob — *“Let us send to Aram and Philistia and Moab and Ammon… and let us go against him and do battle with him”* (Jubilees 37:6) — and hire *one thousand fighting men, chosen men of war* from Aram, and the like from Moab, Ammon, Philistia, *and from Edom and from the Horites one thousand chosen fighting men* (Jubilees 37:9-10). This armed pursuit of a brother is the indictment the prophets engrave on Edom: *because he did pursue his brother with the sword, and did cast off all pity, and his anger did tear perpetually, and he kept his wrath for ever* (Amos 1:11), and *Because thou hast had a perpetual hatred, and hast shed the blood of the children of Yashar''el (Israel) by the force of the sword in the time of their calamity* (Ezekiel 35:5). The seed-war — Esau against Jacob — is the oldest enmity, written long before. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53906
  FROM _session251_ju37_lookup sv, _session251_ju37_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=37 AND sv.verse_number=9
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=37 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-37-elder-serves-younger',
       E'Esau''s curse and the election: the elder serves the younger',
       E'Esau renounces the brotherhood and pronounces a self-curse over Jacob — *“You shall be rooted out, And your sons shall be rooted out, And there shall be no peace for you”* (Jubilees 37:23) — declaring *“And you do hate me and my children for ever. And there is no observing the tie of brotherhood with you.”* (Jubilees 37:19). Yet the rooting-out he hurls at Jacob rebounds on Edom, for the oracle of election was spoken in the womb: *and the one people shall be stronger than the other people; and the elder shall serve the younger.* (Genesis 25:23). Yahuah seals the choice through Malachi — *Was not Esau Jacob''s brother? saith Yahuah (LORD): yet I loved Jacob, And I hated Esau* (Malachi 1:2-3) — and Paul makes it the pattern of sovereign election: *Jacob have I loved, but Esau have I hated.* (Romans 9:13). Esau''s sword cannot overturn the seed kept. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53909
  FROM _session251_ju37_lookup sv, _session251_ju37_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=37 AND sv.verse_number=19
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=37 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jubilees-37-birthright-sold
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 25:31 — *And Jacob said, Sell me this day thy birthright.* The bargain Esau confesses in Jubilees 37:3 is the field-scene of Genesis quoted beside it.'
  FROM cross_reference_threads t, cross_references x, _session251_ju37_lookup sv, _session251_ju37_lookup tv
 WHERE t.slug='jubilees-37-birthright-sold'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=37 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=25 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 25:32 — *And Esau said, Behold, I am at the point to die: and what profit shall this birthright do to me?* Esau''s own contempt for the birthright underlies his sons'' anger in Jubilees 37:1-3.'
  FROM cross_reference_threads t, cross_references x, _session251_ju37_lookup sv, _session251_ju37_lookup tv
 WHERE t.slug='jubilees-37-birthright-sold'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=37 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=25 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 12:16 — *Lest there be any fornicator, or profane person, as Esau, who for one morsel of meat sold his birthright.* The New Testament reads the lentil-bargain of Jubilees 37:3 as profanity, not mere loss.'
  FROM cross_reference_threads t, cross_references x, _session251_ju37_lookup sv, _session251_ju37_lookup tv
 WHERE t.slug='jubilees-37-birthright-sold'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=37 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 27:41 — *And Esau hated Jacob because of the blessing wherewith his father blessed him: and Esau said in his heart, The days of mourning for my father are at hand; then will I slay my brother Jacob.* The hatred that ignites Esau''s sons in Jubilees 37:1 is the heart Genesis already exposed.'
  FROM cross_reference_threads t, cross_references x, _session251_ju37_lookup sv, _session251_ju37_lookup tv
 WHERE t.slug='jubilees-37-birthright-sold'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=37 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=27 AND tv.verse_number=41
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-37-oath-broken
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jubilees 36:8 — *And that each will love his brother with affection and righteousness, and that neither will desire evil against his brother from henceforth for ever all the days of your life, so that you may prosper in all your deeds and not be destroyed.* The very oath Esau recalls in Jubilees 37:4 was sworn before dying Isaac the chapter before.'
  FROM cross_reference_threads t, cross_references x, _session251_ju37_lookup sv, _session251_ju37_lookup tv
 WHERE t.slug='jubilees-37-oath-broken'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=37 AND sv.verse_number=4
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=36 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jubilees 36:9 — *And if either of you devises evil against his brother, know that from henceforth every one that devises evil against his brother will fall into his hand, and will be rooted out of the land of the living, and his seed will be destroyed from under heaven.* Esau''s sons devise the very evil (Jubilees 37:5) Isaac''s oath cursed with rooting-out.'
  FROM cross_reference_threads t, cross_references x, _session251_ju37_lookup sv, _session251_ju37_lookup tv
 WHERE t.slug='jubilees-37-oath-broken'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=37 AND sv.verse_number=5
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=36 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Obadiah 1:10 — *For thy violence against thy brother Jacob shame shall cover thee, and thou shalt be cut off for ever.* Breaking the brother-oath of Jubilees 37:4 is exactly the violence-against-Jacob Obadiah pronounces Edom cut off for.'
  FROM cross_reference_threads t, cross_references x, _session251_ju37_lookup sv, _session251_ju37_lookup tv
 WHERE t.slug='jubilees-37-oath-broken'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=37 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='obadiah' AND tv.chapter_number=1 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-37-edom-pursues-brother
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Amos 1:11 — *Thus saith Yahuah (LORD); For three transgressions of Edom, and for four, I will not turn away the punishment thereof; because he did pursue his brother with the sword, and did cast off all pity, and his anger did tear perpetually, and he kept his wrath for ever:* The Edomite war-band of Jubilees 37:9-10 is Amos''s sword-pursuit of the brother itself.'
  FROM cross_reference_threads t, cross_references x, _session251_ju37_lookup sv, _session251_ju37_lookup tv
 WHERE t.slug='jubilees-37-edom-pursues-brother'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=37 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=1 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 35:5 — *Because thou hast had a perpetual hatred, and hast shed the blood of the children of Yashar''el (Israel) by the force of the sword in the time of their calamity, in the time that their iniquity had an end:* Esau''s perpetual hatred armed in Jubilees 37:10 is the perpetual hatred Ezekiel charges Mount Seir with.'
  FROM cross_reference_threads t, cross_references x, _session251_ju37_lookup sv, _session251_ju37_lookup tv
 WHERE t.slug='jubilees-37-edom-pursues-brother'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=37 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=35 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Obadiah 1:14 — *Neither shouldest thou have stood in the crossway, to cut off those of his that did escape; neither shouldest thou have delivered up those of his that did remain in the day of distress.* The hired men-of-war assembled in Jubilees 37:9 are Edom''s standing-in-the-crossway against his brother.'
  FROM cross_reference_threads t, cross_references x, _session251_ju37_lookup sv, _session251_ju37_lookup tv
 WHERE t.slug='jubilees-37-edom-pursues-brother'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=37 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='obadiah' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-37-elder-serves-younger
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 25:23 — *And Yahuah (LORD) said unto her, Two nations are in thy womb, and two manner of people shall be separated from thy bowels; and the one people shall be stronger than the other people; and the elder shall serve the younger.* Esau''s rooting-out curse in Jubilees 37:23 collides with the womb-oracle that already set Jacob over him.'
  FROM cross_reference_threads t, cross_references x, _session251_ju37_lookup sv, _session251_ju37_lookup tv
 WHERE t.slug='jubilees-37-elder-serves-younger'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=37 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=25 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Malachi 1:3 — *And I hated Esau, and laid his mountains and his heritage waste for the dragons of the wilderness.* Esau''s everlasting hatred of Jacob''s children (Jubilees 37:19) is answered by Yahuah laying Esau''s mountains waste.'
  FROM cross_reference_threads t, cross_references x, _session251_ju37_lookup sv, _session251_ju37_lookup tv
 WHERE t.slug='jubilees-37-elder-serves-younger'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=37 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 9:13 — *As it is written, Jacob have I loved, but Esau have I hated.* The curse Esau speaks over Jacob in Jubilees 37:23 is overruled by the election Paul names: Jacob loved, Esau hated.'
  FROM cross_reference_threads t, cross_references x, _session251_ju37_lookup sv, _session251_ju37_lookup tv
 WHERE t.slug='jubilees-37-elder-serves-younger'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=37 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=9 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

