-- ----- fragment: minion_judith_08.sql (session253 judith 8) -----
-- Source anchor: apocrypha/judith ch8. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: jdt8 (view _session253_jdt8_lookup). Sort band base 60175, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_jdt8_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: judith-8-the-fasting-widow
  ('apocrypha', 'judith', 8, 6, 'canon', 'luke', 2, 37, 'free', E'Luke 2:37 — *And she was a widow of about fourscore and four years, which departed not from the temple, but served Elohim (God) with fastings and prayers night and day.* Anna the prophetess is Judith''s very portrait — the widow whose long fasting and prayer is her ministry to Israel.'),
  ('apocrypha', 'judith', 8, 8, 'canon', '1-timothy', 5, 5, 'free', E'1 Timothy 5:5 — *Now she that is a widow indeed, and desolate, trusteth in Elohim (God), and continueth in supplications and prayers night and day.* Paul''s widow indeed who trusts and prays continually is exactly the Judith of 8:8, who feared Yahuah greatly and gave none an ill word.'),
  -- thread: judith-8-tempt-not-yahuah
  ('apocrypha', 'judith', 8, 12, 'canon', 'deuteronomy', 8, 2, 'free', E'Deuteronomy 8:2 — *And thou shalt remember all the way which Yahuah Elohayka (the LORD thy God) led thee these forty years in the wilderness, to humble thee, and to prove thee, to know what was in thine heart, whether thou wouldest keep his commandments, or no.* Israel is the proved, not the prover; Judith''s rebuke in 8:12 turns the elders'' testing of God back into God''s testing of them.'),
  ('apocrypha', 'judith', 8, 16, 'canon', 'numbers', 23, 19, 'free', E'Numbers 23:19 — *Elohim (God) is not a man, that he should lie; neither the son of Adam, that he should repent: hath he said, and shall he not do it? or hath he spoken, and shall he not make it good?* Judith 8:16 echoes Balaam''s oracle almost word for word — Yahuah is not as man to be threatened nor the son of Adam to waver.'),
  -- thread: judith-8-he-trieth-us-as-our-fathers
  ('apocrypha', 'judith', 8, 26, 'canon', 'genesis', 22, 1, 'free', E'Genesis 22:1 — *And it came to pass after these things, that Elohim (God) did tempt Abraham, and said unto him, Abraham: and he said, Behold, here I am.* Judith 8:26 names the binding of Isaac as the very pattern of how Yahuah trieth His own — Abraham proved, and the son spared.'),
  ('apocrypha', 'judith', 8, 25, 'canon', 'deuteronomy', 8, 5, 'free', E'Deuteronomy 8:5 — *Thou shalt also consider in thine heart, that, as a man chasteneth his son, so Yahuah Elohayka (the LORD thy God) chasteneth thee.* Judith''s "which trieth us, even as he did our fathers" reads the siege as a Father chastening sons, not a God forsaking them.'),
  ('apocrypha', 'judith', 8, 27, 'canon', 'romans', 5, 3, 'free', E'Romans 5:3 — *And not only so, but we glory in tribulations also: knowing that tribulation worketh patience.* Judith 8:27 sees the lighter trial as admonition rather than vengeance, the same fruitful reading of suffering Paul gives — tribulation working patience.'),
  -- thread: judith-8-trust-though-he-try
  ('apocrypha', 'judith', 8, 17, 'canon', 'job', 13, 15, 'free', E'Job 13:15 — *Though he slay me, yet will I trust in him: but I will maintain mine own ways before him.* Judith 8:17''s resolve to wait on Yahuah whatever the outcome is Job''s unbargaining trust — He may slay, yet He is trusted still.'),
  ('apocrypha', 'judith', 8, 20, 'canon', 'deuteronomy', 8, 19, 'free', E'Deuteronomy 8:19 — *And it shall be, if thou do at all forget Yahuah Elohayka (the LORD thy God), and walk after other gods, and serve them, and worship them, I testify against you this day that ye shall surely perish.* Judith''s "we know none other god" in 8:20 is the obverse of Moses'' warning — the generation that serves Yahuah alone is the seed kept, against the worship of gods made with hands.'),
  -- thread: judith-8-yahuah-visit-by-my-hand
  ('apocrypha', 'judith', 8, 33, 'canon', 'judges', 4, 9, 'free', E'Judges 4:9 — *And she said, I will surely go with thee: notwithstanding the journey that thou takest shall not be for thine honour; for Yahuah (LORD) shall sell Sisera into the hand of a woman. And Deborah arose, and went with Barak to Kedesh.* Judith''s "by my hand" in 8:33 stands squarely in the line of Deborah and Jael — Yahuah selling the oppressor into the hand of a woman.'),
  ('apocrypha', 'judith', 8, 33, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The promise that the serpent''s head is crushed through the woman frames Judith''s hand in 8:33 — the head of the tyrant (Holofernes) falls by a woman''s hand.'),
  ('apocrypha', 'judith', 8, 32, 'canon', '1-corinthians', 1, 27, 'free', E'1 Corinthians 1:27 — *But Elohim (God) hath chosen the foolish things of the world to confound the wise; and Elohim (God) hath chosen the weak things of the world to confound the things which are mighty.* Judith''s deed that shall go throughout all generations (8:32) is the weak confounding the mighty — the kingdom of man dismantled so that no flesh should glory.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_jdt8_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_jdt8_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-8-the-fasting-widow',
       E'The widow who fasted and feared Yahuah greatly',
       E'Before she is a deliverer Judith is a widow at prayer: *So Judith was a widow in her house three years and four months* (Judith 8:4), and *she fasted all the days of her widowhood, save the eves of the sabbaths, and the sabbaths, and the eves of the new moons, and the new moons and the feasts and solemn days of the house of Yashar''el (Israel)* (Judith 8:6) — *And there was none that gave her an ill word; as she feared Yahuah (God) greatly* (Judith 8:8). It ain''t new: this is Anna''s portrait centuries before Anna. *And she was a widow of about fourscore and four years, which departed not from the temple, but served Elohim (God) with fastings and prayers night and day* (Luke 2:37). Paul measures the widow indeed by the same rule: *Now she that is a widow indeed, and desolate, trusteth in Elohim (God), and continueth in supplications and prayers night and day* (1 Timothy 5:5). And notice she fasts *save* the feasts and new moons and sabbaths — she keeps the appointed times of the house of Israel even in her mourning; the woman whose hand will deliver the nation is first a woman who keeps Torah and reckons the moedim.',
       sv.verse_id, ev.verse_id, 'extras', 60175
  FROM _session253_jdt8_lookup sv, _session253_jdt8_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=8 AND sv.verse_number=4
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=8 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-8-tempt-not-yahuah',
       E'Who are you to put Yahuah to the test?',
       E'The elders had bargained with Yahuah — surrender the city in five days if no rain comes — and Judith rebukes the bargain as a testing of Elohim: *And now who are you that have tempted Yahuah (God) this day, and stand instead of Yahuah (God) among the children of men?* (Judith 8:12) — *No, my brothers, provoke not Yahuah (God), our Elohim (God) to anger* (Judith 8:14). Faith does not set Yahuah a deadline. *And thou shalt remember all the way which Yahuah Elohayka (the LORD thy God) led thee these forty years in the wilderness, to humble thee, and to prove thee, to know what was in thine heart, whether thou wouldest keep his commandments, or no* (Deuteronomy 8:2) — it is He who proves us, not we who put Him on trial. And His unchanging nature is the ground: *Do not bind the counsels of Yahuah (God), our Elohim (God): for Yahuah (God) is not as man, that he may be threatened; neither is he as the son of Adam, that he should be wavering* (Judith 8:16), the very confession Balaam was made to speak — *Elohim (God) is not a man, that he should lie; neither the son of Adam, that he should repent* (Numbers 23:19).',
       sv.verse_id, ev.verse_id, 'extras', 60178
  FROM _session253_jdt8_lookup sv, _session253_jdt8_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=8 AND sv.verse_number=11
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=8 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-8-he-trieth-us-as-our-fathers',
       E'He trieth us, even as He did our fathers',
       E'Judith reframes the siege not as abandonment but as the testing of sons: *Moreover let us give thanks to Yahuah (God), our Elohim (God), which trieth us, even as he did our fathers* (Judith 8:25) — *Remember what things he did to Abraham, and how he tried Isaac, and what happened to Jacob in Mesopotamia of Syria* (Judith 8:26). The proving of Abraham is the pattern she names: *And it came to pass after these things, that Elohim (God) did tempt Abraham, and said unto him, Abraham: and he said, Behold, here I am* (Genesis 22:1). And the testing is fatherly chastening, not wrath: *Thou shalt also consider in thine heart, that, as a man chasteneth his son, so Yahuah Elohayka (the LORD thy God) chasteneth thee* (Deuteronomy 8:5). Paul names the same chain — that trial itself is the seedbed of hope: *And not only so, but we glory in tribulations also: knowing that tribulation worketh patience* (Romans 5:3). This is faith that does not bargain: it receives the fire as a Father''s hand.',
       sv.verse_id, ev.verse_id, 'extras', 60181
  FROM _session253_jdt8_lookup sv, _session253_jdt8_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=8 AND sv.verse_number=25
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=8 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-8-trust-though-he-try',
       E'Though He try us, yet will we trust Him',
       E'Against the elders'' five-day ultimatum Judith sets a faith with no clause: *For if he will not help us within these five days, he has power to defend us when he will, even every day, or to destroy us before our enemies* (Judith 8:15) — and *Therefore let us wait for salvation of him, and call upon him to help us, and he will hear our voice, if it please him* (Judith 8:17). She will not make her trust conditional on the outcome. This is Job''s defiant confidence: *Though he slay me, yet will I trust in him: but I will maintain mine own ways before him* (Job 13:15). And it is Israel''s only ground of hope — *But we know none other god, therefore we trust that he will not despise us, nor any of our nation* (Judith 8:20), the same singular allegiance Moses pressed: *And it shall be, if thou do at all forget Yahuah Elohayka (the LORD thy God), and walk after other gods, and serve them, and worship them, I testify against you this day that ye shall surely perish* (Deuteronomy 8:19). Faith that does not bargain with God — it trusts though He slay, and serves no other.',
       sv.verse_id, ev.verse_id, 'extras', 60184
  FROM _session253_jdt8_lookup sv, _session253_jdt8_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=8 AND sv.verse_number=15
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=8 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-8-yahuah-visit-by-my-hand',
       E'Yahuah will visit Israel by my hand',
       E'Judith announces the deliverance and hides its means: *You shall stand this night in the gate, and I will go forth with my waitingwoman: and within the days that you have promised to deliver the city to our enemies Yahuah (God) will visit Yashar''el (Israel) by my hand* (Judith 8:33). The salvation is Yahuah''s; the instrument is a woman''s hand — and the Scriptures love this scandal. Deborah named it before Barak: *and she said, I will surely go with thee: notwithstanding the journey that thou takest shall not be for thine honour; for Yahuah (LORD) shall sell Sisera into the hand of a woman* (Judges 4:9), and Jael drove the nail. It ain''t new — the bruising of the serpent''s head was always promised through the woman and her seed: *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel* (Genesis 3:15). This is the law of the kingdom of Elohim against the kingdom of man (Holofernes the tyrant who demanded the worship due to God alone): *But Elohim (God) hath chosen the weak things of the world to confound the things which are mighty* (1 Corinthians 1:27). The mighty host is dismantled not by an army but by the hand of a fasting widow — that no flesh should glory.',
       sv.verse_id, ev.verse_id, 'extras', 60187
  FROM _session253_jdt8_lookup sv, _session253_jdt8_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=8 AND sv.verse_number=32
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=8 AND ev.verse_number=33
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: judith-8-the-fasting-widow
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Luke 2:37 — *And she was a widow of about fourscore and four years, which departed not from the temple, but served Elohim (God) with fastings and prayers night and day.* Anna the prophetess is Judith''s very portrait — the widow whose long fasting and prayer is her ministry to Israel.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt8_lookup sv, _session253_jdt8_lookup tv
 WHERE t.slug='judith-8-the-fasting-widow'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=8 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=2 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Timothy 5:5 — *Now she that is a widow indeed, and desolate, trusteth in Elohim (God), and continueth in supplications and prayers night and day.* Paul''s widow indeed who trusts and prays continually is exactly the Judith of 8:8, who feared Yahuah greatly and gave none an ill word.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt8_lookup sv, _session253_jdt8_lookup tv
 WHERE t.slug='judith-8-the-fasting-widow'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=8 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='1-timothy' AND tv.chapter_number=5 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-8-tempt-not-yahuah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 8:2 — *And thou shalt remember all the way which Yahuah Elohayka (the LORD thy God) led thee these forty years in the wilderness, to humble thee, and to prove thee, to know what was in thine heart, whether thou wouldest keep his commandments, or no.* Israel is the proved, not the prover; Judith''s rebuke in 8:12 turns the elders'' testing of God back into God''s testing of them.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt8_lookup sv, _session253_jdt8_lookup tv
 WHERE t.slug='judith-8-tempt-not-yahuah'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=8 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=8 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 23:19 — *Elohim (God) is not a man, that he should lie; neither the son of Adam, that he should repent: hath he said, and shall he not do it? or hath he spoken, and shall he not make it good?* Judith 8:16 echoes Balaam''s oracle almost word for word — Yahuah is not as man to be threatened nor the son of Adam to waver.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt8_lookup sv, _session253_jdt8_lookup tv
 WHERE t.slug='judith-8-tempt-not-yahuah'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=8 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=23 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-8-he-trieth-us-as-our-fathers
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 22:1 — *And it came to pass after these things, that Elohim (God) did tempt Abraham, and said unto him, Abraham: and he said, Behold, here I am.* Judith 8:26 names the binding of Isaac as the very pattern of how Yahuah trieth His own — Abraham proved, and the son spared.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt8_lookup sv, _session253_jdt8_lookup tv
 WHERE t.slug='judith-8-he-trieth-us-as-our-fathers'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=8 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 8:5 — *Thou shalt also consider in thine heart, that, as a man chasteneth his son, so Yahuah Elohayka (the LORD thy God) chasteneth thee.* Judith''s "which trieth us, even as he did our fathers" reads the siege as a Father chastening sons, not a God forsaking them.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt8_lookup sv, _session253_jdt8_lookup tv
 WHERE t.slug='judith-8-he-trieth-us-as-our-fathers'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=8 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=8 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 5:3 — *And not only so, but we glory in tribulations also: knowing that tribulation worketh patience.* Judith 8:27 sees the lighter trial as admonition rather than vengeance, the same fruitful reading of suffering Paul gives — tribulation working patience.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt8_lookup sv, _session253_jdt8_lookup tv
 WHERE t.slug='judith-8-he-trieth-us-as-our-fathers'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=8 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=5 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-8-trust-though-he-try
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Job 13:15 — *Though he slay me, yet will I trust in him: but I will maintain mine own ways before him.* Judith 8:17''s resolve to wait on Yahuah whatever the outcome is Job''s unbargaining trust — He may slay, yet He is trusted still.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt8_lookup sv, _session253_jdt8_lookup tv
 WHERE t.slug='judith-8-trust-though-he-try'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=8 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=13 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 8:19 — *And it shall be, if thou do at all forget Yahuah Elohayka (the LORD thy God), and walk after other gods, and serve them, and worship them, I testify against you this day that ye shall surely perish.* Judith''s "we know none other god" in 8:20 is the obverse of Moses'' warning — the generation that serves Yahuah alone is the seed kept, against the worship of gods made with hands.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt8_lookup sv, _session253_jdt8_lookup tv
 WHERE t.slug='judith-8-trust-though-he-try'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=8 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=8 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-8-yahuah-visit-by-my-hand
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Judges 4:9 — *And she said, I will surely go with thee: notwithstanding the journey that thou takest shall not be for thine honour; for Yahuah (LORD) shall sell Sisera into the hand of a woman. And Deborah arose, and went with Barak to Kedesh.* Judith''s "by my hand" in 8:33 stands squarely in the line of Deborah and Jael — Yahuah selling the oppressor into the hand of a woman.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt8_lookup sv, _session253_jdt8_lookup tv
 WHERE t.slug='judith-8-yahuah-visit-by-my-hand'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=8 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=4 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The promise that the serpent''s head is crushed through the woman frames Judith''s hand in 8:33 — the head of the tyrant (Holofernes) falls by a woman''s hand.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt8_lookup sv, _session253_jdt8_lookup tv
 WHERE t.slug='judith-8-yahuah-visit-by-my-hand'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=8 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Corinthians 1:27 — *But Elohim (God) hath chosen the foolish things of the world to confound the wise; and Elohim (God) hath chosen the weak things of the world to confound the things which are mighty.* Judith''s deed that shall go throughout all generations (8:32) is the weak confounding the mighty — the kingdom of man dismantled so that no flesh should glory.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt8_lookup sv, _session253_jdt8_lookup tv
 WHERE t.slug='judith-8-yahuah-visit-by-my-hand'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=8 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=1 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

