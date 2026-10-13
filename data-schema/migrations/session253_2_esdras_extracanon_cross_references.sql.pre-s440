-- =====================================================================
-- Session 253 — 2 Esdras FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py ../data-schema/migrations/session253_2_esdras_extracanon_cross_references.sql
-- =====================================================================

\echo 'session253 — 2 Esdras cross-references starting...'
BEGIN;

-- ----- fragment: minion_2esdras_01.sql (session253 2-esdras 1) -----
-- Source anchor: apocrypha/2-esdras ch1. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2esd1 (view _session253_2esd1_lookup). Sort band base 63000, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2esd1_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-esdras-1-out-of-egypt-forsaken
  ('apocrypha', '2-esdras', 1, 7, 'canon', 'deuteronomy', 8, 16, 'free', E'Deuteronomy 8:16 — *Who fed thee in the wilderness with manna, which thy fathers knew not, that he might humble thee, and that he might prove thee, to do thee good at thy latter end;* The Egypt-redemption Esdras recalls in 1:7 is Moses'' own latter-end purpose — proven, humbled, meant for good.'),
  ('apocrypha', '2-esdras', 1, 7, 'canon', 'deuteronomy', 8, 11, 'free', E'Deuteronomy 8:11 — *Beware that thou forget not Yahuah Elohayka (the LORD thy God), in not keeping his commandments, and his judgments, and his statutes, which I command thee this day:* The despising of counsels in 2 Esdras 1:7 is exactly the forgetting Torah warned against — Torah stands, the breach is theirs.'),
  ('apocrypha', '2-esdras', 1, 14, 'canon', 'nehemiah', 9, 12, 'free', E'Nehemiah 9:12 — *Moreover thou leddest them in the day by a cloudy pillar; and in the night by a pillar of fire, to give them light in the way wherein they should go.* The pillar of fire of 2 Esdras 1:14 is the very mercy the Levites confess Yashar''el forgot.'),
  ('apocrypha', '2-esdras', 1, 14, 'canon', 'nehemiah', 9, 16, 'free', E'Nehemiah 9:16 — *But they and our fathers dealt proudly, and hardened their necks, and hearkened not to thy commandments,* The same forgetting Esdras names in 1:14 is the hardened neck of the great confession.'),
  -- thread: 2-esdras-1-manna-water-rock
  ('apocrypha', '2-esdras', 1, 19, 'canon', 'exodus', 16, 4, 'free', E'Exodus 16:4 — *Then said Yahuah (LORD) unto Moses, Behold, I will rain bread from heaven for you; and the people shall go out and gather a certain rate every day, that I may prove them, whether they will walk in my law, or no.* The manna Esdras recalls in 1:19 is the bread rained from heaven — given to prove whether they would walk in the law.'),
  ('apocrypha', '2-esdras', 1, 19, 'canon', 'psalms', 78, 25, 'free', E'Psalm 78:25 — *Man did eat angels’ food: he sent them meat to the full.* The Psalm uses Esdras'' exact figure — "angels’ bread" (1:19) is "angels’ food" sent to the full.'),
  ('apocrypha', '2-esdras', 1, 19, 'canon', 'john', 6, 32, 'free', E'John 6:32 — *Then Yahusha (Jesus) said unto them, Verily, verily, I say unto you, Moses gave you not that bread from heaven; but my Father giveth you the true bread from heaven.* The manna of 2 Esdras 1:19 was a token of the true bread from heaven — Yahusha Himself.'),
  ('apocrypha', '2-esdras', 1, 20, 'canon', '1-corinthians', 10, 4, 'free', E'1 Corinthians 10:4 — *And did all drink the same spiritual drink: for they drank of that spiritual Rock that followed them: and that Rock was Messiah (Christ).* The cloven rock of 2 Esdras 1:20 was the spiritual Rock — the Messiah giving them to drink.'),
  -- thread: 2-esdras-1-hen-house-desolate
  ('apocrypha', '2-esdras', 1, 30, 'canon', 'matthew', 23, 37, 'free', E'Matthew 23:37 — *O Jerusalem, Jerusalem, thou that killest the prophets, and stonest them which are sent unto thee, how often would I have gathered thy children together, even as a hen gathereth her chickens under her wings, and ye would not!* Yahusha takes up the hen-and-chickens figure of 2 Esdras 1:30 exactly — the same yearning, the same refusal.'),
  ('apocrypha', '2-esdras', 1, 33, 'canon', 'matthew', 23, 38, 'free', E'Matthew 23:38 — *Behold, your house is left unto you desolate.* The desolate house of 2 Esdras 1:33 is the very word Yahusha speaks over Jerusalem — the house given over.'),
  -- thread: 2-esdras-1-slain-prophets
  ('apocrypha', '2-esdras', 1, 32, 'canon', 'nehemiah', 9, 26, 'free', E'Nehemiah 9:26 — *Nevertheless they were disobedient, and rebelled against thee, and cast thy law behind their backs, and slew thy prophets which testified against them to turn them to thee, and they wrought great provocations.* The slain prophets of 2 Esdras 1:32 are the confessed sin of the great prayer — prophets sent to turn them, and killed.'),
  ('apocrypha', '2-esdras', 1, 32, 'canon', 'matthew', 23, 35, 'free', E'Matthew 23:35 — *That upon you may come all the righteous blood shed upon the earth, from the blood of righteous Abel unto the blood of Zacharias son of Barachias, whom ye slew between the temple and the altar.* The blood Esdras says Yahuah will require of their hands in 1:32 is the righteous blood Yahusha requires of that generation.'),
  -- thread: 2-esdras-1-remnant-not-replaced
  ('apocrypha', '2-esdras', 1, 24, 'canon', 'romans', 11, 1, 'free', E'Romans 11:1 — *I say then, Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham, of the tribe of Benjamin.* The turning to other nations in 2 Esdras 1:24 is no casting-away of Yashar''el — Elohim forbid; the seed of Abraham stands.'),
  ('apocrypha', '2-esdras', 1, 35, 'canon', 'romans', 11, 5, 'free', E'Romans 11:5 — *Even so then at this present time also there is a remnant according to the election of grace.* The "people that shall come" of 2 Esdras 1:35 is read in framework as the faithful remnant kept by election — the unfaithful forfeit, the remnant holds.'),
  ('apocrypha', '2-esdras', 1, 25, 'canon', 'deuteronomy', 30, 3, 'free', E'Deuteronomy 30:3 — *That then Yahuah Elohayka (the LORD thy God) will turn thy captivity, and have compassion upon thee, and will return and gather thee from all the nations, whither Yahuah Elohayka (the LORD thy God) hath scattered thee.* The forsaking of 2 Esdras 1:25 is not the last word — the regathering is promised; the prodigal returns.'),
  ('apocrypha', '2-esdras', 1, 35, 'canon', 'hosea', 1, 10, 'free', E'Hosea 1:10 — *Yet the number of the children of Yashar''el (Israel) shall be as the sand of the sea, which cannot be measured nor numbered; and it shall come to pass, that in the place where it was said unto them, Ye are not my people, there it shall be said unto them, Ye are the sons of the living Elohim (God).* The believing people of 2 Esdras 1:35 are the not-my-people made sons — Yashar''el restored, the two houses regathered, not replaced.'),
  ('apocrypha', '2-esdras', 1, 39, 'canon', 'romans', 11, 28, 'free', E'Romans 11:28 — *As concerning the gospel, they are enemies for your sakes: but as touching the election, they are beloved for the fathers’ sakes.* Esdras names Abraham, Isaac, and Jacob as leaders of the people to come in 1:39 — the covenant line kept; beloved for the fathers’ sakes.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2esd1_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2esd1_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-1-out-of-egypt-forsaken',
       E'I brought you out of Egypt, yet ye forsook me',
       E'Yahuah opens the indictment by rehearsing the redemption Yashar''el forgot: *Am not I even he that brought them out of the land of Egypt, from the house of bondage? but they have provoked me to wrath, and despised my counsels* (2 Esdras 1:7), and again *I gave you light in a pillar of fire, and great wonders have I done among you; yet have you forgotten me, says Yahuah (God)* (2 Esdras 1:14). It ain''t new — this is Moses'' own charge: *Who fed thee in the wilderness with manna, which thy fathers knew not, that he might humble thee, and that he might prove thee, to do thee good at thy latter end* (Deuteronomy 8:16), and the standing covenant warning, *Beware that thou forget not Yahuah Elohayka (the LORD thy God), in not keeping his commandments* (Deuteronomy 8:11). The Levites'' great confession spreads the same scroll: *Moreover thou leddest them in the day by a cloudy pillar; and in the night by a pillar of fire, to give them light in the way wherein they should go* (Nehemiah 9:12) — and the verdict, *But they and our fathers dealt proudly, and hardened their necks, and hearkened not to thy commandments* (Nehemiah 9:16). The grace came first; the forgetting followed.',
       sv.verse_id, ev.verse_id, 'extras', 63000
  FROM _session253_2esd1_lookup sv, _session253_2esd1_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=1 AND sv.verse_number=7
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=1 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-1-manna-water-rock',
       E'Manna, angels'' bread, and water from the rock',
       E'The mercies are itemized: *Then had I pity upon your mournings, and gave you manna to eat; so you did eat angels’ bread* (2 Esdras 1:19), and *When you were thirsty, did I not cleave the rock, and waters flowed out to your fill?* (2 Esdras 1:20). The source is the wilderness record: *Then said Yahuah (LORD) unto Moses, Behold, I will rain bread from heaven for you; and the people shall go out and gather a certain rate every day, that I may prove them, whether they will walk in my law, or no* (Exodus 16:4). The Psalmist names it the very phrase Esdras uses — *Man did eat angels’ food: he sent them meat to the full* (Psalm 78:25). And it ain''t new: the manna and the rock were always reaching toward the Messiah. Yahusha takes up the manna and reveals its substance — *Verily, verily, I say unto you, Moses gave you not that bread from heaven; but my Father giveth you the true bread from heaven* (John 6:32). The rock Esdras says was cleaved Sha''ul names outright: *And did all drink the same spiritual drink: for they drank of that spiritual Rock that followed them: and that Rock was Messiah (Christ)* (1 Corinthians 10:4). The bread and the water were Him all along.',
       sv.verse_id, ev.verse_id, 'extras', 63003
  FROM _session253_2esd1_lookup sv, _session253_2esd1_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=1 AND sv.verse_number=19
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=1 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-1-hen-house-desolate',
       E'As a hen gathereth her chickens; your house desolate',
       E'The lament turns tender before it turns to judgment: *I gathered you together, as a hen gathers her chickens under her wings: but now, what shall I do to you? I will cast you out from my face* (2 Esdras 1:30), and the sentence, *Your house is desolate, I will cast you out as the wind does stubble* (2 Esdras 1:33). It ain''t new — Yahusha stands over the same Jerusalem and weeps the same figure word for word: *O Jerusalem, Jerusalem, thou that killest the prophets, and stonest them which are sent unto thee, how often would I have gathered thy children together, even as a hen gathereth her chickens under her wings, and ye would not!* (Matthew 23:37), and pronounces the same desolation, *Behold, your house is left unto you desolate* (Matthew 23:38). The grief is the grief of a Father, not the spite of a stranger — the same yearning hand, the same withdrawn house, in the mouth of the Messiah.',
       sv.verse_id, ev.verse_id, 'extras', 63006
  FROM _session253_2esd1_lookup sv, _session253_2esd1_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=1 AND sv.verse_number=30
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=1 AND ev.verse_number=33
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-1-slain-prophets',
       E'My servants the prophets, whom ye slew',
       E'Among the indictments stands the killing of the messengers: *I sent to you my servants the prophets, whom you have taken and slain, and torn their bodies in pieces, whose blood I will require of your hands, says Yahuah (God)* (2 Esdras 1:32). It ain''t new — the Levites confessed it long before: *Nevertheless they were disobedient, and rebelled against thee, and cast thy law behind their backs, and slew thy prophets which testified against them to turn them to thee, and they wrought great provocations* (Nehemiah 9:26). And Yahusha names it as the standing charge of Jerusalem and requires the blood: *That upon you may come all the righteous blood shed upon the earth, from the blood of righteous Abel unto the blood of Zacharias son of Barachias, whom ye slew between the temple and the altar* (Matthew 23:35). One witness across the library: the prophets sent in mercy, slain in rebellion, their blood required.',
       sv.verse_id, ev.verse_id, 'extras', 63009
  FROM _session253_2esd1_lookup sv, _session253_2esd1_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=1 AND sv.verse_number=32
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=1 AND ev.verse_number=32
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-1-remnant-not-replaced',
       E'A people that shall come — the remnant kept, not Israel replaced',
       E'Here the words sound, on the surface, like a handing-over: *What shall I do to you, O Jacob? you, Juda, wouldest not obey me: I will turn me to other nations, and to those will I give my name, that they may keep my statutes* (2 Esdras 1:24), and *Your houses will I give to a people that shall come; which not having heard of me yet shall believe me* (2 Esdras 1:35). Read this in framework, not as the antichrist supersession that cancels Yashar''el. The UNFAITHFUL generation forfeits the inheritance; the covenant itself is never broken — Sha''ul settles it: *I say then, Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham, of the tribe of Benjamin* (Romans 11:1), *Even so then at this present time also there is a remnant according to the election of grace* (Romans 11:5). Election precedes confession, and the prodigal returns: *That then Yahuah Elohayka (the LORD thy God) will turn thy captivity, and have compassion upon thee, and will return and gather thee from all the nations, whither Yahuah Elohayka (the LORD thy God) hath scattered thee* (Deuteronomy 30:3). The very "not my people" become sons — both houses regathered, not a church replacing them: *and it shall come to pass, that in the place where it was said unto them, Ye are not my people, there it shall be said unto them, Ye are the sons of the living Elohim (God)* (Hosea 1:10). And Esdras names the leaders of the people to come — *Abraham, Isaac, and Jacob* and the prophets (1:39) — the covenant line kept, not cut off.',
       sv.verse_id, ev.verse_id, 'extras', 63012
  FROM _session253_2esd1_lookup sv, _session253_2esd1_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=1 AND sv.verse_number=24
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=1 AND ev.verse_number=40
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-esdras-1-out-of-egypt-forsaken
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 8:16 — *Who fed thee in the wilderness with manna, which thy fathers knew not, that he might humble thee, and that he might prove thee, to do thee good at thy latter end;* The Egypt-redemption Esdras recalls in 1:7 is Moses'' own latter-end purpose — proven, humbled, meant for good.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd1_lookup sv, _session253_2esd1_lookup tv
 WHERE t.slug='2-esdras-1-out-of-egypt-forsaken'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=1 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=8 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 8:11 — *Beware that thou forget not Yahuah Elohayka (the LORD thy God), in not keeping his commandments, and his judgments, and his statutes, which I command thee this day:* The despising of counsels in 2 Esdras 1:7 is exactly the forgetting Torah warned against — Torah stands, the breach is theirs.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd1_lookup sv, _session253_2esd1_lookup tv
 WHERE t.slug='2-esdras-1-out-of-egypt-forsaken'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=1 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=8 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Nehemiah 9:12 — *Moreover thou leddest them in the day by a cloudy pillar; and in the night by a pillar of fire, to give them light in the way wherein they should go.* The pillar of fire of 2 Esdras 1:14 is the very mercy the Levites confess Yashar''el forgot.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd1_lookup sv, _session253_2esd1_lookup tv
 WHERE t.slug='2-esdras-1-out-of-egypt-forsaken'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=1 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=9 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Nehemiah 9:16 — *But they and our fathers dealt proudly, and hardened their necks, and hearkened not to thy commandments,* The same forgetting Esdras names in 1:14 is the hardened neck of the great confession.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd1_lookup sv, _session253_2esd1_lookup tv
 WHERE t.slug='2-esdras-1-out-of-egypt-forsaken'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=1 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=9 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-1-manna-water-rock
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 16:4 — *Then said Yahuah (LORD) unto Moses, Behold, I will rain bread from heaven for you; and the people shall go out and gather a certain rate every day, that I may prove them, whether they will walk in my law, or no.* The manna Esdras recalls in 1:19 is the bread rained from heaven — given to prove whether they would walk in the law.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd1_lookup sv, _session253_2esd1_lookup tv
 WHERE t.slug='2-esdras-1-manna-water-rock'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=1 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=16 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 78:25 — *Man did eat angels’ food: he sent them meat to the full.* The Psalm uses Esdras'' exact figure — "angels’ bread" (1:19) is "angels’ food" sent to the full.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd1_lookup sv, _session253_2esd1_lookup tv
 WHERE t.slug='2-esdras-1-manna-water-rock'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=1 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=78 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 6:32 — *Then Yahusha (Jesus) said unto them, Verily, verily, I say unto you, Moses gave you not that bread from heaven; but my Father giveth you the true bread from heaven.* The manna of 2 Esdras 1:19 was a token of the true bread from heaven — Yahusha Himself.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd1_lookup sv, _session253_2esd1_lookup tv
 WHERE t.slug='2-esdras-1-manna-water-rock'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=1 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=6 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Corinthians 10:4 — *And did all drink the same spiritual drink: for they drank of that spiritual Rock that followed them: and that Rock was Messiah (Christ).* The cloven rock of 2 Esdras 1:20 was the spiritual Rock — the Messiah giving them to drink.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd1_lookup sv, _session253_2esd1_lookup tv
 WHERE t.slug='2-esdras-1-manna-water-rock'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=1 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=10 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-1-hen-house-desolate
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 23:37 — *O Jerusalem, Jerusalem, thou that killest the prophets, and stonest them which are sent unto thee, how often would I have gathered thy children together, even as a hen gathereth her chickens under her wings, and ye would not!* Yahusha takes up the hen-and-chickens figure of 2 Esdras 1:30 exactly — the same yearning, the same refusal.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd1_lookup sv, _session253_2esd1_lookup tv
 WHERE t.slug='2-esdras-1-hen-house-desolate'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=1 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=23 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 23:38 — *Behold, your house is left unto you desolate.* The desolate house of 2 Esdras 1:33 is the very word Yahusha speaks over Jerusalem — the house given over.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd1_lookup sv, _session253_2esd1_lookup tv
 WHERE t.slug='2-esdras-1-hen-house-desolate'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=1 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=23 AND tv.verse_number=38
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-1-slain-prophets
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Nehemiah 9:26 — *Nevertheless they were disobedient, and rebelled against thee, and cast thy law behind their backs, and slew thy prophets which testified against them to turn them to thee, and they wrought great provocations.* The slain prophets of 2 Esdras 1:32 are the confessed sin of the great prayer — prophets sent to turn them, and killed.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd1_lookup sv, _session253_2esd1_lookup tv
 WHERE t.slug='2-esdras-1-slain-prophets'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=1 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=9 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 23:35 — *That upon you may come all the righteous blood shed upon the earth, from the blood of righteous Abel unto the blood of Zacharias son of Barachias, whom ye slew between the temple and the altar.* The blood Esdras says Yahuah will require of their hands in 1:32 is the righteous blood Yahusha requires of that generation.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd1_lookup sv, _session253_2esd1_lookup tv
 WHERE t.slug='2-esdras-1-slain-prophets'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=1 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=23 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-1-remnant-not-replaced
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Romans 11:1 — *I say then, Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham, of the tribe of Benjamin.* The turning to other nations in 2 Esdras 1:24 is no casting-away of Yashar''el — Elohim forbid; the seed of Abraham stands.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd1_lookup sv, _session253_2esd1_lookup tv
 WHERE t.slug='2-esdras-1-remnant-not-replaced'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=1 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 11:5 — *Even so then at this present time also there is a remnant according to the election of grace.* The "people that shall come" of 2 Esdras 1:35 is read in framework as the faithful remnant kept by election — the unfaithful forfeit, the remnant holds.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd1_lookup sv, _session253_2esd1_lookup tv
 WHERE t.slug='2-esdras-1-remnant-not-replaced'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=1 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 30:3 — *That then Yahuah Elohayka (the LORD thy God) will turn thy captivity, and have compassion upon thee, and will return and gather thee from all the nations, whither Yahuah Elohayka (the LORD thy God) hath scattered thee.* The forsaking of 2 Esdras 1:25 is not the last word — the regathering is promised; the prodigal returns.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd1_lookup sv, _session253_2esd1_lookup tv
 WHERE t.slug='2-esdras-1-remnant-not-replaced'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=1 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Hosea 1:10 — *Yet the number of the children of Yashar''el (Israel) shall be as the sand of the sea, which cannot be measured nor numbered; and it shall come to pass, that in the place where it was said unto them, Ye are not my people, there it shall be said unto them, Ye are the sons of the living Elohim (God).* The believing people of 2 Esdras 1:35 are the not-my-people made sons — Yashar''el restored, the two houses regathered, not replaced.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd1_lookup sv, _session253_2esd1_lookup tv
 WHERE t.slug='2-esdras-1-remnant-not-replaced'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=1 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=1 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Romans 11:28 — *As concerning the gospel, they are enemies for your sakes: but as touching the election, they are beloved for the fathers’ sakes.* Esdras names Abraham, Isaac, and Jacob as leaders of the people to come in 1:39 — the covenant line kept; beloved for the fathers’ sakes.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd1_lookup sv, _session253_2esd1_lookup tv
 WHERE t.slug='2-esdras-1-remnant-not-replaced'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=1 AND sv.verse_number=39
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2esdras_02.sql (session253 2-esdras 2) -----
-- Source anchor: apocrypha/2-esdras ch2. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2esd2 (view _session253_2esd2_lookup). Sort band base 63025, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2esd2_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-esdras-2-mother-zion-forsaken-comforted
  ('apocrypha', '2-esdras', 2, 2, 'canon', 'isaiah', 49, 14, 'free', E'Isaiah 49:14 — *But Zion said, Yahuah (LORD) hath forsaken me, and my Lord hath forgotten me.* Zion''s cry that she is a widow and forsaken in 2 Esdras 2:2 is the prophet''s own word in the mother''s mouth.'),
  ('apocrypha', '2-esdras', 2, 4, 'canon', 'isaiah', 54, 7, 'free', E'Isaiah 54:7 — *For a small moment have I forsaken thee; but with great mercies will I gather thee.* The forsaking the mother laments in 2 Esdras 2:4 is answered by the great-mercy gathering Isaiah promises the widowed Zion.'),
  ('apocrypha', '2-esdras', 2, 15, 'canon', 'isaiah', 54, 5, 'free', E'Isaiah 54:5 — *For thy Maker is thine husband; Yahuah Tseva''ot (LORD of hosts) is his name; and thy Redeemer the Holy One of Yashar''el (Israel); The Elohim (God) of the whole earth shall he be called.* The ''I have chosen you'' that lifts the widow in 2 Esdras 2:15 names Yahuah himself as the husband of the once-forsaken mother.'),
  ('apocrypha', '2-esdras', 2, 17, 'canon', 'romans', 11, 2, 'free', E'Romans 11:2 — *Elohim (God) hath not cast away his people which he foreknew. Wot ye not what the scripture saith of Elias? how he maketh intercession to Elohim (God) against Yashar''el (Israel), saying,* The ''Fear not... for I have chosen you'' of 2 Esdras 2:17 is Paul''s own guard against supersession: election stands, the people are not cast away.'),
  -- thread: 2-esdras-2-kingdom-tree-of-life-tabernacles
  ('apocrypha', '2-esdras', 2, 12, 'canon', 'revelation', 22, 2, 'free', E'Revelation 22:2 — *In the midst of the street of it, and on either side of the river, was there the tree of life, which bare twelve manner of fruits, and yielded her fruit every month: and the leaves of the tree were for the healing of the nations.* The tree of life given to Zion''s children in 2 Esdras 2:12 is John''s restored tree in the holy city.'),
  ('apocrypha', '2-esdras', 2, 12, 'canon', 'revelation', 2, 7, 'free', E'Revelation 2:7 — *He that hath an ear, let him hear what the Spirit saith unto the churches; To him that overcometh will I give to eat of the tree of life, which is in the midst of the paradise of Elohim (God).* The tree of life of 2 Esdras 2:12 is the overcomer''s reward in the paradise of Elohim.'),
  ('apocrypha', '2-esdras', 2, 11, 'canon', 'revelation', 22, 3, 'free', E'Revelation 22:3 — *And there shall be no more curse: but the throne of Elohim (God) and of the Lamb shall be in it; and his servants shall serve him:* The everlasting tabernacles prepared in 2 Esdras 2:11 are the curse-free dwelling of the throne where the servants serve.'),
  -- thread: 2-esdras-2-raise-the-dead-from-the-graves
  ('apocrypha', '2-esdras', 2, 16, 'canon', 'daniel', 12, 2, 'free', E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The raising of the dead from the graves in 2 Esdras 2:16 is Daniel''s awakening of those who sleep in the dust.'),
  ('apocrypha', '2-esdras', 2, 16, 'canon', 'john', 5, 28, 'free', E'John 5:28 — *Marvel not at this: for the hour is coming, in the which all that are in the graves shall hear his voice,* The ''bring them out of the graves'' of 2 Esdras 2:16 is the hour when all in the graves hear the voice of the Son.'),
  ('apocrypha', '2-esdras', 2, 23, 'canon', 'john', 5, 29, 'free', E'John 5:29 — *And shall come forth; they that have done good, unto the resurrection of life; and they that have done evil, unto the resurrection of damnation.* The ''first place in my resurrection'' offered in 2 Esdras 2:23 is the resurrection of life Yahusha names for those who have done good.'),
  -- thread: 2-esdras-2-do-right-to-the-widow-and-poor
  ('apocrypha', '2-esdras', 2, 20, 'canon', 'matthew', 25, 35, 'free', E'Matthew 25:35 — *For I was an hungred, and ye gave me meat: I was thirsty, and ye gave me drink: I was a stranger, and ye took me in:* The ''give to the poor, defend the orphan'' of 2 Esdras 2:20 is the mercy the King counts at his judgment of the nations.'),
  ('apocrypha', '2-esdras', 2, 21, 'canon', 'matthew', 25, 36, 'free', E'Matthew 25:36 — *Naked, and ye clothed me: I was sick, and ye visited me: I was in prison, and ye came unto me.* The ''clothe the naked... heal the broken and the weak'' of 2 Esdras 2:21 is named verbatim among the works the King receives.'),
  ('apocrypha', '2-esdras', 2, 20, 'canon', 'matthew', 25, 40, 'free', E'Matthew 25:40 — *And the King shall answer and say unto them, Verily I say unto you, Inasmuch as ye have done it unto one of the least of these my brethren, ye have done it unto me.* The mercy-works commanded in 2 Esdras 2:20 are reckoned by the King as done unto himself.'),
  -- thread: 2-esdras-2-look-for-your-shepherd-everlasting-light
  ('apocrypha', '2-esdras', 2, 34, 'canon', 'john', 10, 11, 'free', E'John 10:11 — *I am the good shepherd: the good shepherd giveth his life for the sheep.* The Shepherd nigh at hand whom the heathen are bidden to look for in 2 Esdras 2:34 is Yahusha the Good Shepherd who gives his life for the sheep.'),
  ('apocrypha', '2-esdras', 2, 35, 'canon', 'revelation', 22, 5, 'free', E'Revelation 22:5 — *And there shall be no night there; and they need no candle, neither light of the sun; for Yahuah Elohim (the Lord God) giveth them light: and they shall reign for ever and ever.* The everlasting light promised in 2 Esdras 2:35 is the lampless, sunless light of the city where the redeemed reign for ever.'),
  -- thread: 2-esdras-2-receive-thy-number-o-sion-sealed-in-white
  ('apocrypha', '2-esdras', 2, 41, 'canon', 'revelation', 6, 11, 'free', E'Revelation 6:11 — *And white robes were given unto every one of them; and it was said unto them, that they should rest yet for a little season, until their fellowservants also and their brethren, that should be killed as they were, should be fulfilled.* The ''receive thy number, O Sion... is fulfilled'' of 2 Esdras 2:41 is John''s roll completing only when the white-robed are fulfilled.'),
  ('apocrypha', '2-esdras', 2, 40, 'canon', 'revelation', 7, 14, 'free', E'Revelation 7:14 — *And I said unto him, Sir, thou knowest. And he said to me, These are they which came out of great tribulation, and have washed their robes, and made them white in the blood of the Lamb.* Those clothed in white in 2 Esdras 2:40 are John''s company robed white through great tribulation.'),
  ('apocrypha', '2-esdras', 2, 40, 'canon', 'revelation', 14, 12, 'free', E'Revelation 14:12 — *Here is the patience of the saints: here are they that keep the commandments of Elohim (God), and the faith of Yahusha (Jesus).* Those ''which have fulfilled the law of Yahuah'' in 2 Esdras 2:40 are John''s saints who keep the commandments and the faith — Torah stands.'),
  -- thread: 2-esdras-2-great-multitude-crowned-by-the-son-of-elohim
  ('apocrypha', '2-esdras', 2, 42, 'canon', 'revelation', 7, 9, 'free', E'Revelation 7:9 — *After this I beheld, and, lo, a great multitude, which no man could number, of all nations, and kindreds, and people, and tongues, stood before the throne, and before the Lamb, clothed with white robes, and palms in their hands;* The great people on mount Sion whom Esdras could not number, receiving palms, in 2 Esdras 2:42 is John''s innumerable palm-bearing multitude before the throne.'),
  ('apocrypha', '2-esdras', 2, 43, 'canon', 'revelation', 14, 1, 'free', E'Revelation 14:1 — *And I looked, and, lo, a Lamb stood on the mount Sion, and with him an hundred forty and four thousand, having his Father''s name written in their foreheads.* The young man of high stature on mount Sion who crowns the people in 2 Esdras 2:43 stands where John sees the Lamb on mount Sion with the Name-bearing company.'),
  ('apocrypha', '2-esdras', 2, 45, 'canon', 'revelation', 2, 10, 'free', E'Revelation 2:10 — *Fear none of those things which thou shalt suffer: behold, the devil shall cast some of you into prison, that ye may be tried; and ye shall have tribulation ten days: be thou faithful unto death, and I will give thee a crown of life.* Those crowned for confessing the Name in 2 Esdras 2:45 are John''s faithful-unto-death who receive the crown of life.'),
  ('apocrypha', '2-esdras', 2, 47, 'canon', 'revelation', 7, 17, 'free', E'Revelation 7:17 — *For the Lamb which is in the midst of the throne shall feed them, and shall lead them unto living fountains of waters: and Elohim (God) shall wipe away all tears from their eyes.* The Son of Elohim standing in the midst of the multitude and crowning them in 2 Esdras 2:47 is the Lamb in the midst of the throne who shepherds them.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2esd2_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2esd2_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-2-mother-zion-forsaken-comforted',
       E'The forsaken mother bidden to embrace her children again',
       E'Mother Zion grieves her scattered children, then is chosen and comforted: *The mother that bare them says to them, Go your way, you children; for I am a widow and forsaken.* (2 Esdras 2:2) and *Mother, embrace your children, and bring them up with gladness, make their feet as fast as a pillar: for I have chosen you, says Yahuah.* (2 Esdras 2:15). This is the very arc of the Servant-Songs: the forsaken wife of youth gathered with everlasting mercy — *For a small moment have I forsaken thee; but with great mercies will I gather thee.* (Isaiah 54:7) — and the woman who thinks herself abandoned, answered by a mother''s compassion — *But Zion said, Yahuah hath forsaken me, and my Lord hath forgotten me.* (Isaiah 49:14). The forfeiting generation does not end the election: the faithful remnant of the houses keeps the inheritance, for *Elohim hath not cast away his people which he foreknew.* (Romans 11:2). It ain''t new — the widow-mother of 2 Esdras is the forsaken-then-regathered Zion of the prophets.',
       sv.verse_id, ev.verse_id, 'extras', 63025
  FROM _session253_2esd2_lookup sv, _session253_2esd2_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=2 AND sv.verse_number=2
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=2 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-2-kingdom-tree-of-life-tabernacles',
       E'The kingdom prepared, the everlasting tabernacles, the tree of life',
       E'The prepared kingdom is handed to the faithful with the tree of life and the everlasting dwellings: *Thus says Yahuah to Esdras, Tell my people that I will give them the kingdom of Jerusalem, which I would have given to Yashar''el. Their glory also will I take to me, and give these the everlasting tabernacles, which I had prepared for them.* (2 Esdras 2:10-11) and *They shall have the tree of life for an ointment of sweet savour; they shall neither labour, nor be weary.* (2 Esdras 2:12). This is the close of the Apocalypse: the river and the tree restored in the city — *In the midst of the street of it, and on either side of the river, was there the tree of life, which bare twelve manner of fruits, and yielded her fruit every month: and the leaves of the tree were for the healing of the nations.* (Revelation 22:2) — promised to the overcomer — *To him that overcometh will I give to eat of the tree of life, which is in the midst of the paradise of Elohim.* (Revelation 2:7). The Esdras vision and the live Revelation apparatus see the same prepared inheritance.',
       sv.verse_id, ev.verse_id, 'extras', 63028
  FROM _session253_2esd2_lookup sv, _session253_2esd2_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=2 AND sv.verse_number=10
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=2 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-2-raise-the-dead-from-the-graves',
       E'I will raise up the dead from their graves',
       E'The promise that crowns the chapter''s comfort is bodily resurrection: *And those that be dead will I raise up again from their places, and bring them out of the graves: for I have known my name in Yashar''el.* (2 Esdras 2:16) and *Wherever you findest the dead, take them and bury them, and I will give you the first place in my resurrection.* (2 Esdras 2:23). This is Daniel''s awakening of the dust — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* (Daniel 12:2) — and the Son''s voice that empties the graves — *Marvel not at this: for the hour is coming, in the which all that are in the graves shall hear his voice,* (John 5:28) and *And shall come forth; they that have done good, unto the resurrection of life; and they that have done evil, unto the resurrection of damnation.* (John 5:29). The resurrection 2 Esdras pledges to mother Zion''s children is the resurrection Daniel sealed and Yahusha unsealed.',
       sv.verse_id, ev.verse_id, 'extras', 63031
  FROM _session253_2esd2_lookup sv, _session253_2esd2_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=2 AND sv.verse_number=16
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=2 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-2-do-right-to-the-widow-and-poor',
       E'Do right to the widow, clothe the naked, bury the dead',
       E'The comfort is yoked to covenant mercy-works: *Do right to the widow, judge for the fatherless, give to the poor, defend the orphan, clothe the naked, Heal the broken and the weak, laugh not a lame man to scorn, defend the maimed, and let the blind man come into the sight of my clearness.* (2 Esdras 2:20-21). This is the very ledger of the judgment of the nations — *For I was an hungred, and ye gave me meat: I was thirsty, and ye gave me drink: I was a stranger, and ye took me in:* (Matthew 25:35) and *Naked, and ye clothed me: I was sick, and ye visited me: I was in prison, and ye came unto me.* (Matthew 25:36) — reckoned as done to the King himself — *And the King shall answer and say unto them, Verily I say unto you, Inasmuch as ye have done it unto one of the least of these my brethren, ye have done it unto me.* (Matthew 25:40). It ain''t new: the mercy-Torah of 2 Esdras 2 is the standard of the throne in Matthew 25.',
       sv.verse_id, ev.verse_id, 'extras', 63034
  FROM _session253_2esd2_lookup sv, _session253_2esd2_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=2 AND sv.verse_number=20
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=2 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-2-look-for-your-shepherd-everlasting-light',
       E'Look for your Shepherd; the everlasting light shall shine',
       E'The heathen who hear are turned to the coming Shepherd and the unfading light: *And therefore I say to you, O you heathen, that hear and understand, look for your Shepherd, he shall give you everlasting rest; for he is nigh at hand, that shall come in the end of the world.* (2 Esdras 2:34) and *Be ready to the reward of the kingdom, for the everlasting light shall shine upon you for evermore.* (2 Esdras 2:35). The Shepherd nigh at hand is the Good Shepherd who lays down his life — *I am the good shepherd: the good shepherd giveth his life for the sheep.* (John 10:11) — and the everlasting light is the lampless city — *And there shall be no night there; and they need no candle, neither light of the sun; for Yahuah Elohim (the Lord God) giveth them light: and they shall reign for ever and ever.* (Revelation 22:5). Here the Son genuinely in view in 2 Esdras is Yahusha the Shepherd and the Light.',
       sv.verse_id, ev.verse_id, 'extras', 63037
  FROM _session253_2esd2_lookup sv, _session253_2esd2_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=2 AND sv.verse_number=34
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=2 AND ev.verse_number=36
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-2-receive-thy-number-o-sion-sealed-in-white',
       E'Receive thy number, O Sion; the sealed in white robes',
       E'The vision turns to the completed roll of the redeemed, robed and sealed: *Arise up and stand, behold the number of those that be sealed in the feast of Yahuah;* (2 Esdras 2:38) and *Take your number, O Sion, and shut up those of yours that are clothed in white, which have fulfilled the law of Yahuah.* (2 Esdras 2:40). This is the completed number that waits in Revelation — *And white robes were given unto every one of them; and it was said unto them, that they should rest yet for a little season, until their fellowservants also and their brethren, that should be killed as they were, should be fulfilled.* (Revelation 6:11) — robed white through the tribulation — *And I said unto him, Sir, thou knowest. And he said to me, These are they which came out of great tribulation, and have washed their robes, and made them white in the blood of the Lamb.* (Revelation 7:14) — those who keep Torah and the faith — *Here is the patience of the saints: here are they that keep the commandments of Elohim, and the faith of Yahusha.* (Revelation 14:12). The ''number, O Sion'' of Esdras is the sealed remnant of the live Revelation pack — and Torah stands, for these have fulfilled the law of Yahuah.',
       sv.verse_id, ev.verse_id, 'extras', 63040
  FROM _session253_2esd2_lookup sv, _session253_2esd2_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=2 AND sv.verse_number=38
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=2 AND ev.verse_number=41
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-2-great-multitude-crowned-by-the-son-of-elohim',
       E'The great multitude crowned by the Son of Elohim on mount Sion',
       E'Esdras sees the climactic vision — an unnumbered people on mount Sion, crowned and palm-bearing, set by the Son of Elohim himself: *I Esdras saw upon the mount Sion a great people, whom I could not number, and they all praised Yahuah with songs.* (2 Esdras 2:42) and *He answered and said to me, These be they that have put off the mortal clothing, and put on the immortal, and have confessed the name of Yahuah: now are they crowned, and receive palms.* (2 Esdras 2:45) and *So he answered and said to me, It is the Son of Yahuah, whom they have confessed in the world.* (2 Esdras 2:47). This is the throne-vision of the Apocalypse, the very self-link of the live Revelation apparatus: the innumerable palm-bearing multitude — *After this I beheld, and, lo, a great multitude, which no man could number, of all nations, and kindreds, and people, and tongues, stood before the throne, and before the Lamb, clothed with white robes, and palms in their hands;* (Revelation 7:9) — the Lamb on mount Sion with the Name in their foreheads — *And I looked, and, lo, a Lamb stood on the mount Sion, and with him an hundred forty and four thousand, having his Father''s name written in their foreheads.* (Revelation 14:1) — and the crown the faithful-unto-death receive — *be thou faithful unto death, and I will give thee a crown of life.* (Revelation 2:10). The messianic Son of Elohim who crowns them is genuinely the Messiah: the Son confessed in the world is Yahusha, and Esdras commends those who stand stiffly for his Name.',
       sv.verse_id, ev.verse_id, 'extras', 63043
  FROM _session253_2esd2_lookup sv, _session253_2esd2_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=2 AND sv.verse_number=42
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=2 AND ev.verse_number=47
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-esdras-2-mother-zion-forsaken-comforted
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 49:14 — *But Zion said, Yahuah (LORD) hath forsaken me, and my Lord hath forgotten me.* Zion''s cry that she is a widow and forsaken in 2 Esdras 2:2 is the prophet''s own word in the mother''s mouth.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd2_lookup sv, _session253_2esd2_lookup tv
 WHERE t.slug='2-esdras-2-mother-zion-forsaken-comforted'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=2 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=49 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 54:7 — *For a small moment have I forsaken thee; but with great mercies will I gather thee.* The forsaking the mother laments in 2 Esdras 2:4 is answered by the great-mercy gathering Isaiah promises the widowed Zion.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd2_lookup sv, _session253_2esd2_lookup tv
 WHERE t.slug='2-esdras-2-mother-zion-forsaken-comforted'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=2 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=54 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 54:5 — *For thy Maker is thine husband; Yahuah Tseva''ot (LORD of hosts) is his name; and thy Redeemer the Holy One of Yashar''el (Israel); The Elohim (God) of the whole earth shall he be called.* The ''I have chosen you'' that lifts the widow in 2 Esdras 2:15 names Yahuah himself as the husband of the once-forsaken mother.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd2_lookup sv, _session253_2esd2_lookup tv
 WHERE t.slug='2-esdras-2-mother-zion-forsaken-comforted'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=2 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=54 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 11:2 — *Elohim (God) hath not cast away his people which he foreknew. Wot ye not what the scripture saith of Elias? how he maketh intercession to Elohim (God) against Yashar''el (Israel), saying,* The ''Fear not... for I have chosen you'' of 2 Esdras 2:17 is Paul''s own guard against supersession: election stands, the people are not cast away.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd2_lookup sv, _session253_2esd2_lookup tv
 WHERE t.slug='2-esdras-2-mother-zion-forsaken-comforted'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=2 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-2-kingdom-tree-of-life-tabernacles
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 22:2 — *In the midst of the street of it, and on either side of the river, was there the tree of life, which bare twelve manner of fruits, and yielded her fruit every month: and the leaves of the tree were for the healing of the nations.* The tree of life given to Zion''s children in 2 Esdras 2:12 is John''s restored tree in the holy city.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd2_lookup sv, _session253_2esd2_lookup tv
 WHERE t.slug='2-esdras-2-kingdom-tree-of-life-tabernacles'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=2 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 2:7 — *He that hath an ear, let him hear what the Spirit saith unto the churches; To him that overcometh will I give to eat of the tree of life, which is in the midst of the paradise of Elohim (God).* The tree of life of 2 Esdras 2:12 is the overcomer''s reward in the paradise of Elohim.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd2_lookup sv, _session253_2esd2_lookup tv
 WHERE t.slug='2-esdras-2-kingdom-tree-of-life-tabernacles'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=2 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 22:3 — *And there shall be no more curse: but the throne of Elohim (God) and of the Lamb shall be in it; and his servants shall serve him:* The everlasting tabernacles prepared in 2 Esdras 2:11 are the curse-free dwelling of the throne where the servants serve.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd2_lookup sv, _session253_2esd2_lookup tv
 WHERE t.slug='2-esdras-2-kingdom-tree-of-life-tabernacles'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=2 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-2-raise-the-dead-from-the-graves
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The raising of the dead from the graves in 2 Esdras 2:16 is Daniel''s awakening of those who sleep in the dust.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd2_lookup sv, _session253_2esd2_lookup tv
 WHERE t.slug='2-esdras-2-raise-the-dead-from-the-graves'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=2 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 5:28 — *Marvel not at this: for the hour is coming, in the which all that are in the graves shall hear his voice,* The ''bring them out of the graves'' of 2 Esdras 2:16 is the hour when all in the graves hear the voice of the Son.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd2_lookup sv, _session253_2esd2_lookup tv
 WHERE t.slug='2-esdras-2-raise-the-dead-from-the-graves'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=2 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=5 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 5:29 — *And shall come forth; they that have done good, unto the resurrection of life; and they that have done evil, unto the resurrection of damnation.* The ''first place in my resurrection'' offered in 2 Esdras 2:23 is the resurrection of life Yahusha names for those who have done good.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd2_lookup sv, _session253_2esd2_lookup tv
 WHERE t.slug='2-esdras-2-raise-the-dead-from-the-graves'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=2 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=5 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-2-do-right-to-the-widow-and-poor
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 25:35 — *For I was an hungred, and ye gave me meat: I was thirsty, and ye gave me drink: I was a stranger, and ye took me in:* The ''give to the poor, defend the orphan'' of 2 Esdras 2:20 is the mercy the King counts at his judgment of the nations.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd2_lookup sv, _session253_2esd2_lookup tv
 WHERE t.slug='2-esdras-2-do-right-to-the-widow-and-poor'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=2 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=25 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 25:36 — *Naked, and ye clothed me: I was sick, and ye visited me: I was in prison, and ye came unto me.* The ''clothe the naked... heal the broken and the weak'' of 2 Esdras 2:21 is named verbatim among the works the King receives.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd2_lookup sv, _session253_2esd2_lookup tv
 WHERE t.slug='2-esdras-2-do-right-to-the-widow-and-poor'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=2 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=25 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 25:40 — *And the King shall answer and say unto them, Verily I say unto you, Inasmuch as ye have done it unto one of the least of these my brethren, ye have done it unto me.* The mercy-works commanded in 2 Esdras 2:20 are reckoned by the King as done unto himself.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd2_lookup sv, _session253_2esd2_lookup tv
 WHERE t.slug='2-esdras-2-do-right-to-the-widow-and-poor'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=2 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=25 AND tv.verse_number=40
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-2-look-for-your-shepherd-everlasting-light
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 10:11 — *I am the good shepherd: the good shepherd giveth his life for the sheep.* The Shepherd nigh at hand whom the heathen are bidden to look for in 2 Esdras 2:34 is Yahusha the Good Shepherd who gives his life for the sheep.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd2_lookup sv, _session253_2esd2_lookup tv
 WHERE t.slug='2-esdras-2-look-for-your-shepherd-everlasting-light'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=2 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=10 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 22:5 — *And there shall be no night there; and they need no candle, neither light of the sun; for Yahuah Elohim (the Lord God) giveth them light: and they shall reign for ever and ever.* The everlasting light promised in 2 Esdras 2:35 is the lampless, sunless light of the city where the redeemed reign for ever.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd2_lookup sv, _session253_2esd2_lookup tv
 WHERE t.slug='2-esdras-2-look-for-your-shepherd-everlasting-light'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=2 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-2-receive-thy-number-o-sion-sealed-in-white
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 6:11 — *And white robes were given unto every one of them; and it was said unto them, that they should rest yet for a little season, until their fellowservants also and their brethren, that should be killed as they were, should be fulfilled.* The ''receive thy number, O Sion... is fulfilled'' of 2 Esdras 2:41 is John''s roll completing only when the white-robed are fulfilled.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd2_lookup sv, _session253_2esd2_lookup tv
 WHERE t.slug='2-esdras-2-receive-thy-number-o-sion-sealed-in-white'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=2 AND sv.verse_number=41
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=6 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 7:14 — *And I said unto him, Sir, thou knowest. And he said to me, These are they which came out of great tribulation, and have washed their robes, and made them white in the blood of the Lamb.* Those clothed in white in 2 Esdras 2:40 are John''s company robed white through great tribulation.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd2_lookup sv, _session253_2esd2_lookup tv
 WHERE t.slug='2-esdras-2-receive-thy-number-o-sion-sealed-in-white'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=2 AND sv.verse_number=40
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=7 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 14:12 — *Here is the patience of the saints: here are they that keep the commandments of Elohim (God), and the faith of Yahusha (Jesus).* Those ''which have fulfilled the law of Yahuah'' in 2 Esdras 2:40 are John''s saints who keep the commandments and the faith — Torah stands.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd2_lookup sv, _session253_2esd2_lookup tv
 WHERE t.slug='2-esdras-2-receive-thy-number-o-sion-sealed-in-white'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=2 AND sv.verse_number=40
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=14 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-2-great-multitude-crowned-by-the-son-of-elohim
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 7:9 — *After this I beheld, and, lo, a great multitude, which no man could number, of all nations, and kindreds, and people, and tongues, stood before the throne, and before the Lamb, clothed with white robes, and palms in their hands;* The great people on mount Sion whom Esdras could not number, receiving palms, in 2 Esdras 2:42 is John''s innumerable palm-bearing multitude before the throne.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd2_lookup sv, _session253_2esd2_lookup tv
 WHERE t.slug='2-esdras-2-great-multitude-crowned-by-the-son-of-elohim'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=2 AND sv.verse_number=42
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 14:1 — *And I looked, and, lo, a Lamb stood on the mount Sion, and with him an hundred forty and four thousand, having his Father''s name written in their foreheads.* The young man of high stature on mount Sion who crowns the people in 2 Esdras 2:43 stands where John sees the Lamb on mount Sion with the Name-bearing company.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd2_lookup sv, _session253_2esd2_lookup tv
 WHERE t.slug='2-esdras-2-great-multitude-crowned-by-the-son-of-elohim'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=2 AND sv.verse_number=43
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=14 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 2:10 — *Fear none of those things which thou shalt suffer: behold, the devil shall cast some of you into prison, that ye may be tried; and ye shall have tribulation ten days: be thou faithful unto death, and I will give thee a crown of life.* Those crowned for confessing the Name in 2 Esdras 2:45 are John''s faithful-unto-death who receive the crown of life.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd2_lookup sv, _session253_2esd2_lookup tv
 WHERE t.slug='2-esdras-2-great-multitude-crowned-by-the-son-of-elohim'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=2 AND sv.verse_number=45
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=2 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 7:17 — *For the Lamb which is in the midst of the throne shall feed them, and shall lead them unto living fountains of waters: and Elohim (God) shall wipe away all tears from their eyes.* The Son of Elohim standing in the midst of the multitude and crowning them in 2 Esdras 2:47 is the Lamb in the midst of the throne who shepherds them.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd2_lookup sv, _session253_2esd2_lookup tv
 WHERE t.slug='2-esdras-2-great-multitude-crowned-by-the-son-of-elohim'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=2 AND sv.verse_number=47
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=7 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2esdras_03.sql (session253 2-esdras 3) -----
-- Source anchor: apocrypha/2-esdras ch3. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2esd3 (view _session253_2esd3_lookup). Sort band base 63050, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2esd3_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-esdras-3-wicked-heart-of-adam
  ('apocrypha', '2-esdras', 3, 21, 'canon', 'romans', 5, 12, 'free', E'Romans 5:12 — *Wherefore, as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned:* Sha''ul traces death to the one transgression of Adam exactly as 2 Esdras 3:21 traces our overthrow to the first Adam''s wicked heart.'),
  ('apocrypha', '2-esdras', 3, 21, 'canon', 'genesis', 6, 5, 'free', E'Genesis 6:5 — *And GOD saw that the wickedness of man was great in the earth, and that every imagination of the thoughts of his heart was only evil continually.* The wicked heart Ezra names in 2 Esdras 3:21 is the very imagination Yahuah saw before the flood.'),
  ('apocrypha', '2-esdras', 3, 22, 'canon', 'genesis', 8, 21, 'free', E'Genesis 8:21 — *And Yahuah (LORD) smelled a sweet savour; and Yahuah (LORD) said in his heart, I will not again curse the ground any more for man''s sake; for the imagination of man''s heart is evil from his youth; neither will I again smite any more every thing living, as I have done.* That the evil ''abode still'' after the flood (2 Esdras 3:22) is Yahuah''s own verdict over Noah''s altar.'),
  -- thread: 2-esdras-3-law-not-take-away-wicked-heart
  ('apocrypha', '2-esdras', 3, 20, 'canon', 'romans', 7, 18, 'free', E'Romans 7:18 — *For I know that in me (that is, in my flesh,) dwelleth no good thing: for to will is present with me; but how to perform that which is good I find not.* This is Ezra''s grief that the law could not bring forth fruit (2 Esdras 3:20) felt in Sha''ul''s own members.'),
  ('apocrypha', '2-esdras', 3, 20, 'canon', 'romans', 7, 23, 'free', E'Romans 7:23 — *But I see another law in my members, warring against the law of my mind, and bringing me into captivity to the law of sin which is in my members.* The seed-war Ezra describes between the holy law and the malignant root (2 Esdras 3:20,22) is the very warring Sha''ul names within.'),
  ('apocrypha', '2-esdras', 3, 20, 'canon', 'jeremiah', 17, 9, 'free', E'Jeremiah 17:9 — *The heart is deceitful above all things, and desperately wicked: who can know it?* The wicked heart Yahuah did not yet take away (2 Esdras 3:20) is the unsearchable heart the prophet weighs.'),
  ('apocrypha', '2-esdras', 3, 20, 'canon', 'ezekiel', 36, 26, 'free', E'Ezekiel 36:26 — *A new heart also will I give you, and a new spirit will I put within you: and I will take away the stony heart out of your flesh, and I will give you an heart of flesh.* What Ezra laments was withheld (2 Esdras 3:20) Yahuah promises to do — the wicked heart taken away, a new one given.'),
  -- thread: 2-esdras-3-the-breath-and-the-commandment
  ('apocrypha', '2-esdras', 3, 5, 'canon', 'genesis', 2, 7, 'free', E'Genesis 2:7 — *And Yahuah Elohim (the LORD God) formed man of the dust of the ground, and breathed into his nostrils the breath of life; and man became a living soul.* Ezra''s body given the breath of life and made living (2 Esdras 3:5) is this verse retold.'),
  ('apocrypha', '2-esdras', 3, 7, 'canon', 'genesis', 3, 17, 'free', E'Genesis 3:17 — *And unto Adam he said, Because thou hast hearkened unto the voice of thy wife, and hast eaten of the tree, of which I commanded thee, saying, Thou shalt not eat of it: cursed is the ground for thy sake; in sorrow shalt thou eat of it all the days of thy life;* the transgressed commandment and appointed death of 2 Esdras 3:7 is this sentence over Adam.'),
  ('apocrypha', '2-esdras', 3, 7, 'canon', 'romans', 5, 12, 'free', E'Romans 5:12 — *Wherefore, as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned:* the death appointed ''in him and in his generations'' (2 Esdras 3:7) is Sha''ul''s death passing upon all men.'),
  -- thread: 2-esdras-3-jacob-chosen-everlasting-covenant
  ('apocrypha', '2-esdras', 3, 15, 'canon', 'genesis', 17, 7, 'free', E'Genesis 17:7 — *And I will establish my covenant between me and thee and thy seed after thee in their generations for an everlasting covenant, to be a Elohim (God) unto thee, and to thy seed after thee.* The everlasting covenant never to forsake Abraham''s seed (2 Esdras 3:15) is cut here.'),
  ('apocrypha', '2-esdras', 3, 16, 'canon', 'romans', 9, 13, 'free', E'Romans 9:13 — *As it is written, Jacob have I loved, but Esau have I hated.* Ezra''s ''you did choose him to you, and put by Esau'' (2 Esdras 3:16) is the same sovereign election Sha''ul cites.'),
  ('apocrypha', '2-esdras', 3, 15, 'canon', 'romans', 11, 1, 'free', E'Romans 11:1 — *I say then, Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham, of the tribe of Benjamin.* Because Yahuah promised never to forsake the seed (2 Esdras 3:15), Israel is not cast away.'),
  -- thread: 2-esdras-3-israel-by-name-kept-the-precepts
  ('apocrypha', '2-esdras', 3, 36, 'canon', 'ezekiel', 36, 27, 'free', E'Ezekiel 36:27 — *And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them.* The Israel that ''by name has kept your precepts'' (2 Esdras 3:36) is the people Yahuah enables to keep His judgments by His Spirit.'),
  ('apocrypha', '2-esdras', 3, 32, 'canon', 'ezekiel', 36, 24, 'free', E'Ezekiel 36:24 — *For I will take you from among the heathen, and gather you out of all countries, and will bring you into your own land.* Ezra''s question of who knows Yahuah beside Israel (2 Esdras 3:32) is answered by the regathering of that very people.'),
  ('apocrypha', '2-esdras', 3, 32, 'canon', 'romans', 11, 1, 'free', E'Romans 11:1 — *I say then, Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham, of the tribe of Benjamin.* Israel believing the covenants as Jacob did (2 Esdras 3:32) is the people Sha''ul insists is not cast away.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2esd3_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2esd3_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-3-wicked-heart-of-adam',
       E'The grain of evil seed sown in the heart of Adam',
       E'Ezra''s first complaint reaches behind every sin to a single root in the first man: *For the first Adam bearing a wicked heart transgressed, and was overcome; and so be all they that are born of him* (2 Esdras 3:21), so that *infirmity was made permanent* and *the good departed away, and the evil abode still* (2 Esdras 3:22). It ain''t new — this is Sha''ul''s whole argument: *Wherefore, as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned* (Romans 5:12). The flood-generation, Ezra says, were only watering the same seed, for Yahuah saw from the beginning *that every imagination of the thoughts of his heart was only evil continually* (Genesis 6:5), and even after the waters He owned *the imagination of man''s heart is evil from his youth* (Genesis 8:21). The wicked heart is not theory but the diagnosis underneath all of Scripture''s mercy.',
       sv.verse_id, ev.verse_id, 'extras', 63050
  FROM _session253_2esd3_lookup sv, _session253_2esd3_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=3 AND sv.verse_number=21
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=3 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-3-law-not-take-away-wicked-heart',
       E'The law given, yet the wicked heart not taken away',
       E'Ezra rehearses Sinai — *that you might give the law to the seed of Jacob* (2 Esdras 3:19) — and then sets his finger on the wound: *And yet tookest you not away from them a wicked heart, that your law might bring forth fruit in them* (2 Esdras 3:20). The good law lands on bad soil, *the law (also) in the heart of the people with the malignity of the root* (2 Esdras 3:22). This is precisely Sha''ul''s torn cry over the same holy Torah: *For I delight in the law of Elohim (God) after the inward man: But I see another law in my members, warring against the law of my mind, and bringing me into captivity to the law of sin which is in my members* (Romans 7:22-23). The flesh cannot do what the commandment requires — *For I know that in me (that is, in my flesh,) dwelleth no good thing* (Romans 7:18). And the prophet had already exposed why the law brings forth no fruit: *The heart is deceitful above all things, and desperately wicked: who can know it?* (Jeremiah 17:9). The complaint cries for the new heart that only Yahuah Himself can give.',
       sv.verse_id, ev.verse_id, 'extras', 63053
  FROM _session253_2esd3_lookup sv, _session253_2esd3_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=3 AND sv.verse_number=20
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=3 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-3-the-breath-and-the-commandment',
       E'Adam formed, given breath, given the commandment he transgressed',
       E'Before the complaint, Ezra retells the making of the first man: *And gavest a body to Adam without soul, which was the workmanship of yours hands, and did breathe into him the breath of life, and he was made living before you* (2 Esdras 3:5) — a near-quotation of Bereshith: *And Yahuah Elohim (the LORD God) formed man of the dust of the ground, and breathed into his nostrils the breath of life; and man became a living soul* (Genesis 2:7). Then comes the single charge that loosed death: *And to him you gavest commandment to love your way: which he transgressed, and immediately you appointedst death in him and in his generations* (2 Esdras 3:7). So the LORD pronounced over the man who ate: *cursed is the ground for thy sake; in sorrow shalt thou eat of it all the days of thy life* (Genesis 3:17). Ezra is reading Genesis 2-3 straight; it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 63056
  FROM _session253_2esd3_lookup sv, _session253_2esd3_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=3 AND sv.verse_number=5
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=3 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-3-jacob-chosen-everlasting-covenant',
       E'Abraham loved, the everlasting covenant, Jacob chosen',
       E'Against the wreck of Sion, Ezra rests on election that precedes any confession: *And madest an everlasting covenant with him, promising him that you would never forsake his seed* (2 Esdras 3:15), and *As for Jacob, you did choose him to you, and put by Esau: and so Jacob became a great multitude* (2 Esdras 3:16). This is the covenant Yahuah cut with Abraham: *And I will establish my covenant between me and thee and thy seed after thee in their generations for an everlasting covenant* (Genesis 17:7). And the choosing of Jacob over Esau is the very text Sha''ul presses to show election stands not of works: *As it is written, Jacob have I loved, but Esau have I hated* (Romans 9:13). Because that election precedes confession, the unfaithful generation forfeits but the seed is never cast away: *I say then, Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham, of the tribe of Benjamin* (Romans 11:1). Yahuah will never forsake the seed.',
       sv.verse_id, ev.verse_id, 'extras', 63059
  FROM _session253_2esd3_lookup sv, _session253_2esd3_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=3 AND sv.verse_number=15
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=3 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-3-israel-by-name-kept-the-precepts',
       E'Israel by name hath kept thy precepts',
       E'Ezra''s complaint ends not in despair over the nations but in a confession of the faithful remnant: *Or is there any other people that knoweth you beside Yashar''el (Israel)? or what generation has so believed your covenants as Jacob?* (2 Esdras 3:32), closing with *You shall find that Yashar''el (Israel) by name has kept your precepts; but not the heathen* (2 Esdras 3:36). This is not a people replacing Israel — it is Israel, by name, holding the covenant when the nations ''think not upon your commandments'' (2 Esdras 3:33). The prophets answer the grief: though scattered for their own way, Yahuah gathers them home — *For I will take you from among the heathen, and gather you out of all countries, and will bring you into your own land* (Ezekiel 36:24) — and gives the new heart that makes the precept-keeping real: *And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them* (Ezekiel 36:27). And Sha''ul guards the floor under it all: *I say then, Hath Elohim (God) cast away his people? Elohim (God) forbid* (Romans 11:1). The covenant holds with Israel; election precedes confession.',
       sv.verse_id, ev.verse_id, 'extras', 63062
  FROM _session253_2esd3_lookup sv, _session253_2esd3_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=3 AND sv.verse_number=32
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=3 AND ev.verse_number=36
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-esdras-3-wicked-heart-of-adam
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Romans 5:12 — *Wherefore, as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned:* Sha''ul traces death to the one transgression of Adam exactly as 2 Esdras 3:21 traces our overthrow to the first Adam''s wicked heart.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd3_lookup sv, _session253_2esd3_lookup tv
 WHERE t.slug='2-esdras-3-wicked-heart-of-adam'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=3 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=5 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 6:5 — *And GOD saw that the wickedness of man was great in the earth, and that every imagination of the thoughts of his heart was only evil continually.* The wicked heart Ezra names in 2 Esdras 3:21 is the very imagination Yahuah saw before the flood.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd3_lookup sv, _session253_2esd3_lookup tv
 WHERE t.slug='2-esdras-3-wicked-heart-of-adam'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=3 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 8:21 — *And Yahuah (LORD) smelled a sweet savour; and Yahuah (LORD) said in his heart, I will not again curse the ground any more for man''s sake; for the imagination of man''s heart is evil from his youth; neither will I again smite any more every thing living, as I have done.* That the evil ''abode still'' after the flood (2 Esdras 3:22) is Yahuah''s own verdict over Noah''s altar.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd3_lookup sv, _session253_2esd3_lookup tv
 WHERE t.slug='2-esdras-3-wicked-heart-of-adam'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=3 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=8 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-3-law-not-take-away-wicked-heart
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Romans 7:18 — *For I know that in me (that is, in my flesh,) dwelleth no good thing: for to will is present with me; but how to perform that which is good I find not.* This is Ezra''s grief that the law could not bring forth fruit (2 Esdras 3:20) felt in Sha''ul''s own members.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd3_lookup sv, _session253_2esd3_lookup tv
 WHERE t.slug='2-esdras-3-law-not-take-away-wicked-heart'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=3 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=7 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 7:23 — *But I see another law in my members, warring against the law of my mind, and bringing me into captivity to the law of sin which is in my members.* The seed-war Ezra describes between the holy law and the malignant root (2 Esdras 3:20,22) is the very warring Sha''ul names within.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd3_lookup sv, _session253_2esd3_lookup tv
 WHERE t.slug='2-esdras-3-law-not-take-away-wicked-heart'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=3 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=7 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 17:9 — *The heart is deceitful above all things, and desperately wicked: who can know it?* The wicked heart Yahuah did not yet take away (2 Esdras 3:20) is the unsearchable heart the prophet weighs.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd3_lookup sv, _session253_2esd3_lookup tv
 WHERE t.slug='2-esdras-3-law-not-take-away-wicked-heart'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=3 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=17 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ezekiel 36:26 — *A new heart also will I give you, and a new spirit will I put within you: and I will take away the stony heart out of your flesh, and I will give you an heart of flesh.* What Ezra laments was withheld (2 Esdras 3:20) Yahuah promises to do — the wicked heart taken away, a new one given.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd3_lookup sv, _session253_2esd3_lookup tv
 WHERE t.slug='2-esdras-3-law-not-take-away-wicked-heart'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=3 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-3-the-breath-and-the-commandment
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 2:7 — *And Yahuah Elohim (the LORD God) formed man of the dust of the ground, and breathed into his nostrils the breath of life; and man became a living soul.* Ezra''s body given the breath of life and made living (2 Esdras 3:5) is this verse retold.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd3_lookup sv, _session253_2esd3_lookup tv
 WHERE t.slug='2-esdras-3-the-breath-and-the-commandment'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=3 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:17 — *And unto Adam he said, Because thou hast hearkened unto the voice of thy wife, and hast eaten of the tree, of which I commanded thee, saying, Thou shalt not eat of it: cursed is the ground for thy sake; in sorrow shalt thou eat of it all the days of thy life;* the transgressed commandment and appointed death of 2 Esdras 3:7 is this sentence over Adam.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd3_lookup sv, _session253_2esd3_lookup tv
 WHERE t.slug='2-esdras-3-the-breath-and-the-commandment'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=3 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 5:12 — *Wherefore, as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned:* the death appointed ''in him and in his generations'' (2 Esdras 3:7) is Sha''ul''s death passing upon all men.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd3_lookup sv, _session253_2esd3_lookup tv
 WHERE t.slug='2-esdras-3-the-breath-and-the-commandment'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=3 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=5 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-3-jacob-chosen-everlasting-covenant
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 17:7 — *And I will establish my covenant between me and thee and thy seed after thee in their generations for an everlasting covenant, to be a Elohim (God) unto thee, and to thy seed after thee.* The everlasting covenant never to forsake Abraham''s seed (2 Esdras 3:15) is cut here.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd3_lookup sv, _session253_2esd3_lookup tv
 WHERE t.slug='2-esdras-3-jacob-chosen-everlasting-covenant'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=3 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 9:13 — *As it is written, Jacob have I loved, but Esau have I hated.* Ezra''s ''you did choose him to you, and put by Esau'' (2 Esdras 3:16) is the same sovereign election Sha''ul cites.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd3_lookup sv, _session253_2esd3_lookup tv
 WHERE t.slug='2-esdras-3-jacob-chosen-everlasting-covenant'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=3 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=9 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 11:1 — *I say then, Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham, of the tribe of Benjamin.* Because Yahuah promised never to forsake the seed (2 Esdras 3:15), Israel is not cast away.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd3_lookup sv, _session253_2esd3_lookup tv
 WHERE t.slug='2-esdras-3-jacob-chosen-everlasting-covenant'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=3 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-3-israel-by-name-kept-the-precepts
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 36:27 — *And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them.* The Israel that ''by name has kept your precepts'' (2 Esdras 3:36) is the people Yahuah enables to keep His judgments by His Spirit.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd3_lookup sv, _session253_2esd3_lookup tv
 WHERE t.slug='2-esdras-3-israel-by-name-kept-the-precepts'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=3 AND sv.verse_number=36
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 36:24 — *For I will take you from among the heathen, and gather you out of all countries, and will bring you into your own land.* Ezra''s question of who knows Yahuah beside Israel (2 Esdras 3:32) is answered by the regathering of that very people.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd3_lookup sv, _session253_2esd3_lookup tv
 WHERE t.slug='2-esdras-3-israel-by-name-kept-the-precepts'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=3 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 11:1 — *I say then, Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham, of the tribe of Benjamin.* Israel believing the covenants as Jacob did (2 Esdras 3:32) is the people Sha''ul insists is not cast away.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd3_lookup sv, _session253_2esd3_lookup tv
 WHERE t.slug='2-esdras-3-israel-by-name-kept-the-precepts'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=3 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2esdras_04.sql (session253 2-esdras 4) -----
-- Source anchor: apocrypha/2-esdras ch4. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2esd4 (view _session253_2esd4_lookup). Sort band base 63075, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2esd4_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-esdras-4-weigh-the-fire
  ('apocrypha', '2-esdras', 4, 5, 'canon', 'job', 38, 4, 'free', E'Job 38:4 — *Where wast thou when I laid the foundations of the earth? declare, if thou hast understanding.* The Most High answers Ezra exactly as He answered Job — by the unanswerable question that exposes the creature''s limit.'),
  ('apocrypha', '2-esdras', 4, 5, 'canon', 'job', 38, 5, 'free', E'Job 38:5 — *Who hath laid the measures thereof, if thou knowest? or who hath stretched the line upon it?* The challenge to measure is Yahuah''s own test of the dust that would weigh the fire of 2 Esdras 4:5.'),
  ('apocrypha', '2-esdras', 4, 5, 'canon', 'isaiah', 40, 12, 'free', E'Isaiah 40:12 — *Who hath measured the waters in the hollow of his hand, and meted out heaven with the span, and comprehended the dust of the earth in a measure, and weighed the mountains in scales, and the hills in a balance?* What Uriel asks Ezra to do, only the Creator does — He alone weighs wind and water.'),
  ('apocrypha', '2-esdras', 4, 9, 'canon', 'proverbs', 30, 4, 'free', E'Proverbs 30:4 — *Who hath ascended up into heaven, or descended? who hath gathered the wind in his fists? who hath bound the waters in a garment? who hath established all the ends of the earth? what is his name, and what is his son''s name, if thou canst tell?* Agur''s riddle of the gathered wind names the same unscalable height Ezra confesses he cannot reach — and points past it to the Father and the Son.'),
  -- thread: 2-esdras-4-ways-past-finding-out
  ('apocrypha', '2-esdras', 4, 21, 'canon', 'isaiah', 55, 8, 'free', E'Isaiah 55:8 — *For my thoughts are not your thoughts, neither are your ways my ways, saith Yahuah (LORD).* The gulf Uriel marks between earth-dweller and Heaven-dweller is exactly the gulf Yahuah names between His ways and ours.'),
  ('apocrypha', '2-esdras', 4, 21, 'canon', 'isaiah', 55, 9, 'free', E'Isaiah 55:9 — *For as the heavens are higher than the earth, so are my ways higher than your ways, and my thoughts than your thoughts.* The literal height of the heavens above the earth is Uriel''s very measure of what the creature cannot reach in 2 Esdras 4:21.'),
  ('apocrypha', '2-esdras', 4, 21, 'canon', 'deuteronomy', 29, 29, 'free', E'Deuteronomy 29:29 — *The secret things belong unto Yahuah Eloheinu (the LORD our God): but those things which are revealed belong unto us and to our children for ever, that we may do all the words of this law.* Moses already drew Uriel''s line: the secret things stay above the heavens, the revealed Torah is given the earth-dweller to keep.'),
  -- thread: 2-esdras-4-evil-seed-in-adam
  ('apocrypha', '2-esdras', 4, 30, 'canon', 'genesis', 8, 21, 'free', E'Genesis 8:21 — *And Yahuah (LORD) smelled a sweet savour; and Yahuah (LORD) said in his heart, I will not again curse the ground any more for man''s sake; for the imagination of man''s heart is evil from his youth; neither will I again smite any more every thing living, as I have done.* The evil seed sown in the heart of Adam is the same evil imagination Yahuah names from man''s youth.'),
  ('apocrypha', '2-esdras', 4, 30, 'canon', 'romans', 5, 12, 'free', E'Romans 5:12 — *Wherefore, as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned:* Paul reads Adam''s heart exactly as Uriel does — one man''s seed bringing forth ungodliness and death upon all.'),
  ('apocrypha', '2-esdras', 4, 30, 'canon', 'matthew', 13, 30, 'free', E'Matthew 13:30 — *Let both grow together until the harvest: and in the time of harvest I will say to the reapers, Gather ye together first the tares, and bind them in bundles to burn them: but gather the wheat into my barn.* Yahusha''s harvest of the tares is Uriel''s awaited time of threshing when the ears of wickedness are cut down.'),
  ('apocrypha', '2-esdras', 4, 32, 'canon', 'matthew', 13, 39, 'free', E'Matthew 13:39 — *The enemy that sowed them is the devil; the harvest is the end of the world; and the reapers are the angels.* The evil sower and the end-time reaping Yahusha explains are the same seed and floor Uriel sets before Ezra.'),
  -- thread: 2-esdras-4-souls-in-their-chambers
  ('apocrypha', '2-esdras', 4, 35, 'canon', 'revelation', 6, 9, 'free', E'Revelation 6:9 — *And when he had opened the fifth seal, I saw under the altar the souls of them that were slain for the word of Elohim (God), and for the testimony which they held:* John''s souls under the altar are Uriel''s souls of the righteous waiting in their chambers.'),
  ('apocrypha', '2-esdras', 4, 35, 'canon', 'revelation', 6, 10, 'free', E'Revelation 6:10 — *And they cried with a loud voice, saying, How long, O Yahuah (Lord), holy and true, dost thou not judge and avenge our blood on them that dwell on the earth?* Their ''How long'' is word for word the question the righteous souls ask in 2 Esdras 4:35.'),
  ('apocrypha', '2-esdras', 4, 36, 'canon', 'revelation', 6, 11, 'free', E'Revelation 6:11 — *And white robes were given unto every one of them; and it was said unto them, that they should rest yet for a little season, until their fellowservants also and their brethren, that should be killed as they were, should be fulfilled.* The answer to wait ''until the number is filled'' is exactly Uriel''s reply that the seeds must first be complete.'),
  -- thread: 2-esdras-4-womb-and-the-grave
  ('apocrypha', '2-esdras', 4, 41, 'canon', 'john', 16, 21, 'free', E'John 16:21 — *A woman when she is in travail hath sorrow, because her hour is come: but as soon as she is delivered of the child, she remembereth no more the anguish, for joy that a man is born into the world.* Yahusha''s travailing woman delivered into joy is Uriel''s womb of the grave hasting to deliver the souls committed to it.'),
  ('apocrypha', '2-esdras', 4, 42, 'canon', 'romans', 8, 22, 'free', E'Romans 8:22 — *For we know that the whole creation groaneth and travaileth in pain together until now.* Paul names the same birth-travail of creation that Uriel makes the sign of the grave''s coming deliverance.'),
  ('apocrypha', '2-esdras', 4, 42, 'canon', '1-corinthians', 15, 36, 'free', E'1 Corinthians 15:36 — *Thou fool, that which thou sowest is not quickened, except it die:* Paul''s seed that must die to be raised is the same harvest the grave-womb of 2 Esdras 4:42 hastes to bring forth.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2esd4_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2esd4_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-4-weigh-the-fire',
       E'Weigh me the weight of the fire',
       E'Uriel hands Ezra three impossibilities: *Go your way, weigh me the weight of the fire, or measure me the blast of the wind, or call me again the day that is past* (2 Esdras 4:5) — *Nevertheless now have I asked you but only of the fire and wind, and of the day wherethrough you have passed, and of things from which you can not be separated, and yet can you give me no answer of them* (2 Esdras 4:9). The same Voice silenced Job from the whirlwind: *Where wast thou when I laid the foundations of the earth? declare, if thou hast understanding* (Job 38:4); *Who hath laid the measures thereof, if thou knowest? or who hath stretched the line upon it?* (Job 38:5). It is the Most High''s own measuring hand: *Who hath measured the waters in the hollow of his hand, and meted out heaven with the span, and comprehended the dust of the earth in a measure, and weighed the mountains in scales, and the hills in a balance?* (Isaiah 40:12). And the wind He gathers belongs to a Name and a Son: *Who hath ascended up into heaven, or descended? who hath gathered the wind in his fists? who hath bound the waters in a garment? who hath established all the ends of the earth? what is his name, and what is his son''s name, if thou canst tell?* (Proverbs 30:4). It ain''t new — the creature cannot weigh the fire of the One who weighs the worlds.',
       sv.verse_id, ev.verse_id, 'extras', 63075
  FROM _session253_2esd4_lookup sv, _session253_2esd4_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=4 AND sv.verse_number=5
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=4 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-4-ways-past-finding-out',
       E'The ways of the Most High past finding out',
       E'When Ezra cannot answer, Uriel draws the lesson: *If you were judge now between these two, whom wouldest you begin to justify?* (2 Esdras 4:18) — *even so they that dwell upon the earth may understand nothing but that which is upon the earth: and he that dwells above the heavens may only understand the things that are above the height of the heavens* (2 Esdras 4:21). This is no novelty: Yahuah said the same through Isaiah — *For my thoughts are not your thoughts, neither are your ways my ways, saith Yahuah (LORD)* (Isaiah 55:8); *For as the heavens are higher than the earth, so are my ways higher than your ways, and my thoughts than your thoughts* (Isaiah 55:9). And Moses set the boundary at Moab: *The secret things belong unto Yahuah Eloheinu (the LORD our God): but those things which are revealed belong unto us and to our children for ever, that we may do all the words of this law* (Deuteronomy 29:29). The earth-bound mind keeps the revealed Torah; it does not climb to weigh the secret counsel of the heavens.',
       sv.verse_id, ev.verse_id, 'extras', 63078
  FROM _session253_2esd4_lookup sv, _session253_2esd4_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=4 AND sv.verse_number=21
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=4 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-4-evil-seed-in-adam',
       E'The grain of evil seed sown in the heart of Adam',
       E'Uriel names the root of the corruption Ezra mourns: *For the grain of evil seed has been sown in the heart of Adam from the beginning, and how much ungodliness has it brought up to this time? and how much shall it yet bring forth until the time of threshing come?* (2 Esdras 4:30). This is the very diagnosis Yahuah gave after the flood — *the imagination of man''s heart is evil from his youth* (Genesis 8:21) — and the apostle''s reckoning of the one man through whom it spread: *Wherefore, as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned* (Romans 5:12). And the time of threshing Uriel awaits is the Messiah''s own harvest: *Let both grow together until the harvest: and in the time of harvest I will say to the reapers, Gather ye together first the tares, and bind them in bundles to burn them: but gather the wheat into my barn* (Matthew 13:30); *The enemy that sowed them is the devil; the harvest is the end of the world; and the reapers are the angels* (Matthew 13:39). The evil seed in Adam, the wheat and tares, the threshing-floor — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 63081
  FROM _session253_2esd4_lookup sv, _session253_2esd4_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=4 AND sv.verse_number=30
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=4 AND ev.verse_number=32
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-4-souls-in-their-chambers',
       E'How long? — the souls of the righteous in their chambers',
       E'Ezra is shown the cry of the waiting dead: *Did not the souls also of the righteous ask question of these things in their chambers, saying, How long shall I hope on this fashion? when comes the fruit of the floor of our reward?* (2 Esdras 4:35) — *And to these things Uriel the archangel gave them answer, and said, Even when the number of seeds is filled in you: for he has weighed the world in the balance* (2 Esdras 4:36). John sees the very same souls and hears the very same cry: *And when he had opened the fifth seal, I saw under the altar the souls of them that were slain for the word of Elohim (God), and for the testimony which they held* (Revelation 6:9); *And they cried with a loud voice, saying, How long, O Yahuah (Lord), holy and true, dost thou not judge and avenge our blood on them that dwell on the earth?* (Revelation 6:10). And the answer is identical — wait until the full number is complete: *And white robes were given unto every one of them; and it was said unto them, that they should rest yet for a little season, until their fellowservants also and their brethren, that should be killed as they were, should be fulfilled* (Revelation 6:11). The chambers of the souls, the ''how long,'' the fixed number to be filled — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 63084
  FROM _session253_2esd4_lookup sv, _session253_2esd4_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=4 AND sv.verse_number=35
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=4 AND ev.verse_number=37
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-4-womb-and-the-grave',
       E'The grave as the womb travailing to deliver',
       E'Uriel gives the resurrection its sign in the birth-pang: *Go your way to a woman with child, and ask of her when she has fulfilled her nine months, if her womb may keep the birth any longer within her* (2 Esdras 4:40) — *In the grave the chambers of souls are like the womb of a woman: For like as a woman that travaileth makes haste to escape the necessity of the travail: even so do these places haste to deliver those things that are committed to them* (2 Esdras 4:41-42). Yahusha gave the same figure of the travailing woman delivered into joy: *A woman when she is in travail hath sorrow, because her hour is come: but as soon as she is delivered of the child, she remembereth no more the anguish, for joy that a man is born into the world* (John 16:21). Creation itself groans in that labour: *For we know that the whole creation groaneth and travaileth in pain together until now* (Romans 8:22). And the seed that must die before it is quickened is Paul''s own picture of the grave''s harvest: *Thou fool, that which thou sowest is not quickened, except it die* (1 Corinthians 15:36). The grave a womb, the dead a seed waiting to be born — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 63087
  FROM _session253_2esd4_lookup sv, _session253_2esd4_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=4 AND sv.verse_number=40
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=4 AND ev.verse_number=42
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-esdras-4-weigh-the-fire
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Job 38:4 — *Where wast thou when I laid the foundations of the earth? declare, if thou hast understanding.* The Most High answers Ezra exactly as He answered Job — by the unanswerable question that exposes the creature''s limit.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd4_lookup sv, _session253_2esd4_lookup tv
 WHERE t.slug='2-esdras-4-weigh-the-fire'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=4 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=38 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Job 38:5 — *Who hath laid the measures thereof, if thou knowest? or who hath stretched the line upon it?* The challenge to measure is Yahuah''s own test of the dust that would weigh the fire of 2 Esdras 4:5.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd4_lookup sv, _session253_2esd4_lookup tv
 WHERE t.slug='2-esdras-4-weigh-the-fire'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=4 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=38 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 40:12 — *Who hath measured the waters in the hollow of his hand, and meted out heaven with the span, and comprehended the dust of the earth in a measure, and weighed the mountains in scales, and the hills in a balance?* What Uriel asks Ezra to do, only the Creator does — He alone weighs wind and water.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd4_lookup sv, _session253_2esd4_lookup tv
 WHERE t.slug='2-esdras-4-weigh-the-fire'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=4 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=40 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Proverbs 30:4 — *Who hath ascended up into heaven, or descended? who hath gathered the wind in his fists? who hath bound the waters in a garment? who hath established all the ends of the earth? what is his name, and what is his son''s name, if thou canst tell?* Agur''s riddle of the gathered wind names the same unscalable height Ezra confesses he cannot reach — and points past it to the Father and the Son.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd4_lookup sv, _session253_2esd4_lookup tv
 WHERE t.slug='2-esdras-4-weigh-the-fire'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=4 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=30 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-4-ways-past-finding-out
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 55:8 — *For my thoughts are not your thoughts, neither are your ways my ways, saith Yahuah (LORD).* The gulf Uriel marks between earth-dweller and Heaven-dweller is exactly the gulf Yahuah names between His ways and ours.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd4_lookup sv, _session253_2esd4_lookup tv
 WHERE t.slug='2-esdras-4-ways-past-finding-out'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=4 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=55 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 55:9 — *For as the heavens are higher than the earth, so are my ways higher than your ways, and my thoughts than your thoughts.* The literal height of the heavens above the earth is Uriel''s very measure of what the creature cannot reach in 2 Esdras 4:21.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd4_lookup sv, _session253_2esd4_lookup tv
 WHERE t.slug='2-esdras-4-ways-past-finding-out'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=4 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=55 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 29:29 — *The secret things belong unto Yahuah Eloheinu (the LORD our God): but those things which are revealed belong unto us and to our children for ever, that we may do all the words of this law.* Moses already drew Uriel''s line: the secret things stay above the heavens, the revealed Torah is given the earth-dweller to keep.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd4_lookup sv, _session253_2esd4_lookup tv
 WHERE t.slug='2-esdras-4-ways-past-finding-out'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=4 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=29 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-4-evil-seed-in-adam
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 8:21 — *And Yahuah (LORD) smelled a sweet savour; and Yahuah (LORD) said in his heart, I will not again curse the ground any more for man''s sake; for the imagination of man''s heart is evil from his youth; neither will I again smite any more every thing living, as I have done.* The evil seed sown in the heart of Adam is the same evil imagination Yahuah names from man''s youth.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd4_lookup sv, _session253_2esd4_lookup tv
 WHERE t.slug='2-esdras-4-evil-seed-in-adam'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=4 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=8 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 5:12 — *Wherefore, as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned:* Paul reads Adam''s heart exactly as Uriel does — one man''s seed bringing forth ungodliness and death upon all.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd4_lookup sv, _session253_2esd4_lookup tv
 WHERE t.slug='2-esdras-4-evil-seed-in-adam'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=4 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=5 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 13:30 — *Let both grow together until the harvest: and in the time of harvest I will say to the reapers, Gather ye together first the tares, and bind them in bundles to burn them: but gather the wheat into my barn.* Yahusha''s harvest of the tares is Uriel''s awaited time of threshing when the ears of wickedness are cut down.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd4_lookup sv, _session253_2esd4_lookup tv
 WHERE t.slug='2-esdras-4-evil-seed-in-adam'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=4 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=13 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 13:39 — *The enemy that sowed them is the devil; the harvest is the end of the world; and the reapers are the angels.* The evil sower and the end-time reaping Yahusha explains are the same seed and floor Uriel sets before Ezra.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd4_lookup sv, _session253_2esd4_lookup tv
 WHERE t.slug='2-esdras-4-evil-seed-in-adam'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=4 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=13 AND tv.verse_number=39
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-4-souls-in-their-chambers
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 6:9 — *And when he had opened the fifth seal, I saw under the altar the souls of them that were slain for the word of Elohim (God), and for the testimony which they held:* John''s souls under the altar are Uriel''s souls of the righteous waiting in their chambers.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd4_lookup sv, _session253_2esd4_lookup tv
 WHERE t.slug='2-esdras-4-souls-in-their-chambers'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=4 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=6 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 6:10 — *And they cried with a loud voice, saying, How long, O Yahuah (Lord), holy and true, dost thou not judge and avenge our blood on them that dwell on the earth?* Their ''How long'' is word for word the question the righteous souls ask in 2 Esdras 4:35.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd4_lookup sv, _session253_2esd4_lookup tv
 WHERE t.slug='2-esdras-4-souls-in-their-chambers'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=4 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=6 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 6:11 — *And white robes were given unto every one of them; and it was said unto them, that they should rest yet for a little season, until their fellowservants also and their brethren, that should be killed as they were, should be fulfilled.* The answer to wait ''until the number is filled'' is exactly Uriel''s reply that the seeds must first be complete.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd4_lookup sv, _session253_2esd4_lookup tv
 WHERE t.slug='2-esdras-4-souls-in-their-chambers'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=4 AND sv.verse_number=36
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=6 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-4-womb-and-the-grave
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 16:21 — *A woman when she is in travail hath sorrow, because her hour is come: but as soon as she is delivered of the child, she remembereth no more the anguish, for joy that a man is born into the world.* Yahusha''s travailing woman delivered into joy is Uriel''s womb of the grave hasting to deliver the souls committed to it.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd4_lookup sv, _session253_2esd4_lookup tv
 WHERE t.slug='2-esdras-4-womb-and-the-grave'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=4 AND sv.verse_number=41
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=16 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 8:22 — *For we know that the whole creation groaneth and travaileth in pain together until now.* Paul names the same birth-travail of creation that Uriel makes the sign of the grave''s coming deliverance.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd4_lookup sv, _session253_2esd4_lookup tv
 WHERE t.slug='2-esdras-4-womb-and-the-grave'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=4 AND sv.verse_number=42
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=8 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Corinthians 15:36 — *Thou fool, that which thou sowest is not quickened, except it die:* Paul''s seed that must die to be raised is the same harvest the grave-womb of 2 Esdras 4:42 hastes to bring forth.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd4_lookup sv, _session253_2esd4_lookup tv
 WHERE t.slug='2-esdras-4-womb-and-the-grave'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=4 AND sv.verse_number=42
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2esdras_05.sql (session253 2-esdras 5) -----
-- Source anchor: apocrypha/2-esdras ch5. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2esd5 (view _session253_2esd5_lookup). Sort band base 63100, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2esd5_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-esdras-5-iniquity-faith-cold
  ('apocrypha', '2-esdras', 5, 1, 'canon', 'matthew', 24, 12, 'free', E'Matthew 24:12 — *And because iniquity shall abound, the love of many shall wax cold.* Yahusha names the same token Uriel gives — iniquity increased and the land barren of faith (2 Esdras 5:1-2).'),
  ('apocrypha', '2-esdras', 5, 2, 'canon', '2-timothy', 3, 1, 'free', E'2 Timothy 3:1 — *This know also, that in the last days perilous times shall come.* Sha''ul''s last-days warning matches the iniquity multiplied above all that was heard of old (2 Esdras 5:2).'),
  ('apocrypha', '2-esdras', 5, 1, 'canon', 'luke', 18, 8, 'free', E'Luke 18:8 — *I tell you that he will avenge them speedily. Nevertheless when the Son of Adam cometh, shall he find faith on the earth?* The Son of Adam asks at His coming the very thing Esdras foresees — the land barren of faith (2 Esdras 5:1).'),
  ('apocrypha', '2-esdras', 5, 1, 'canon', 'amos', 8, 11, 'free', E'Amos 8:11 — *Behold, the days come, saith Adonai Yahuah (the Lord GOD), that I will send a famine in the land, not a famine of bread, nor a thirst for water, but of hearing the words of Yahuah (LORD):* Amos''s famine of hearing IS the way of truth hidden (2 Esdras 5:1).'),
  -- thread: 2-esdras-5-sun-by-night-blood-wood
  ('apocrypha', '2-esdras', 5, 4, 'canon', 'luke', 21, 25, 'free', E'Luke 21:25 — *And there shall be signs in the sun, and in the moon, and in the stars; and upon the earth distress of nations, with perplexity; the sea and the waves roaring;* Yahusha''s signs in sun and moon match the sun shining by night and the moon thrice in the day (2 Esdras 5:4).'),
  ('apocrypha', '2-esdras', 5, 4, 'canon', 'revelation', 6, 12, 'free', E'Revelation 6:12 — *And I beheld when he had opened the sixth seal, and, lo, there was a great earthquake; and the sun became black as sackcloth of hair, and the moon became as blood;* the sixth seal''s disordered lights are the same token as the sun shining by night (2 Esdras 5:4).'),
  ('apocrypha', '2-esdras', 5, 5, 'canon', '2-thessalonians', 2, 9, 'free', E'2 Thessalonians 2:9 — *Even him, whose coming is after the working of Satan with all power and signs and lying wonders,* the lying wonders that trouble the people answer to the blood from wood and the crying stone (2 Esdras 5:5).'),
  ('apocrypha', '2-esdras', 5, 6, 'canon', 'matthew', 24, 7, 'free', E'Matthew 24:7 — *For nation shall rise against nation, and kingdom against kingdom: and there shall be famines, and pestilences, and earthquakes, in divers places.* Yahusha''s catalogue of birth-pangs stands with the unlooked-for rule and the scattering flight (2 Esdras 5:6).'),
  -- thread: 2-esdras-5-one-vine-one-people
  ('apocrypha', '2-esdras', 5, 23, 'canon', 'isaiah', 5, 1, 'free', E'Isaiah 5:1 — *Now will I sing to my wellbeloved a song of my beloved touching his vineyard. My wellbeloved hath a vineyard in a very fruitful hill:* Isaiah''s vineyard is Esdras''s one only vine, chosen of every wood of the earth (2 Esdras 5:23).'),
  ('apocrypha', '2-esdras', 5, 23, 'canon', 'psalms', 80, 8, 'free', E'Psalms 80:8 — *Thou hast brought a vine out of Egypt: thou hast cast out the heathen, and planted it.* The vine brought out of Egypt is the one vine Yahuah chose for Himself (2 Esdras 5:23).'),
  ('apocrypha', '2-esdras', 5, 27, 'canon', 'deuteronomy', 7, 6, 'free', E'Deuteronomy 7:6 — *For thou art an holy people unto Yahuah Elohayka (the LORD thy God): Yahuah Elohayka (the LORD thy God) hath chosen thee to be a special people unto himself, above all people that are upon the face of the earth.* Moshe''s chosen special people is the one people whom Yahuah loved and gave the law (2 Esdras 5:27).'),
  -- thread: 2-esdras-5-israel-not-cast-away
  ('apocrypha', '2-esdras', 5, 28, 'canon', 'romans', 11, 1, 'free', E'Romans 11:1 — *I say then, Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham, of the tribe of Benjamin.* Sha''ul flatly denies the casting-off that Esdras''s scattering might seem to imply (2 Esdras 5:28).'),
  ('apocrypha', '2-esdras', 5, 28, 'canon', 'romans', 11, 28, 'free', E'Romans 11:28 — *As concerning the gospel, they are enemies for your sakes: but as touching the election, they are beloved for the fathers'' sakes.* The one people scattered among many remains beloved by election (2 Esdras 5:28).'),
  ('apocrypha', '2-esdras', 5, 33, 'canon', 'romans', 11, 29, 'free', E'Romans 11:29 — *For the gifts and calling of Elohim (God) are without repentance.* The Maker who loves Yashar''el better than Esdras ever could has a calling that cannot be revoked (2 Esdras 5:33).'),
  -- thread: 2-esdras-5-womb-of-earth-times-seasons
  ('apocrypha', '2-esdras', 5, 48, 'canon', 'ecclesiastes', 3, 1, 'free', E'Ecclesiastes 3:1 — *To every thing there is a season, and a time to every purpose under the heaven:* the womb of the earth bringing forth its seed in their times is the Preacher''s season for every purpose (2 Esdras 5:48).'),
  ('apocrypha', '2-esdras', 5, 48, 'canon', 'galatians', 4, 4, 'free', E'Galatians 4:4 — *But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law,* the fulness of the time is the appointed measure of the womb of the earth (2 Esdras 5:48).'),
  ('apocrypha', '2-esdras', 5, 42, 'canon', 'acts', 1, 7, 'free', E'Acts 1:7 — *And he said unto them, It is not for you to know the times or the seasons, which the Father hath put in his own power.* The ring of judgment with no swiftness of the first is the times and seasons kept in the Father''s power (2 Esdras 5:42).'),
  ('apocrypha', '2-esdras', 5, 44, 'canon', 'mark', 13, 32, 'free', E'Mark 13:32 — *But of that day and that hour knoweth no man, no, not the angels which are in heaven, neither the Son, but the Father.* The creature that may not haste above the Maker is told that even the day and hour rest with the Father (2 Esdras 5:44).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2esd5_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2esd5_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-5-iniquity-faith-cold',
       E'The way of truth hidden — the signs of the end',
       E'Uriel unrolls the tokens of the last days: *Nevertheless as concerning the tokens, behold, the days shall come, that they which dwell upon earth shall be taken in a great number, and the way of truth shall be hidden, and the land shall be barren of faith.* (2 Esdras 5:1) — *But iniquity shall be increased above that which now you see, or that you have heard long ago.* (2 Esdras 5:2) — *then shall unrighteousness and incontinency be multiplied upon earth.* (2 Esdras 5:10). It ain''t new: Yahusha unfolds the very same sign upon the Mount of Olives, *And because iniquity shall abound, the love of many shall wax cold.* (Matthew 24:12). Sha''ul writes it to Timothy, *This know also, that in the last days perilous times shall come.* (2 Timothy 3:1). The Master makes faith the question that hangs over the end — *I tell you that he will avenge them speedily. Nevertheless when the Son of Adam cometh, shall he find faith on the earth?* (Luke 18:8) — the land barren of faith. And the hidden way of truth is the prophet''s own famine: *Behold, the days come, saith Adonai Yahuah (the Lord GOD), that I will send a famine in the land, not a famine of bread, nor a thirst for water, but of hearing the words of Yahuah (LORD):* (Amos 8:11). The witness is one.',
       sv.verse_id, ev.verse_id, 'extras', 63100
  FROM _session253_2esd5_lookup sv, _session253_2esd5_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=5 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=5 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-5-sun-by-night-blood-wood',
       E'The sun shining by night, blood from wood — the cosmic tokens',
       E'The tokens turn to the heavens and the deep: *But if the Most High grant you to live, you shall see after the third trumpet that the sun shall suddenly shine again in the night, and the moon thrice in the day:* (2 Esdras 5:4) — *And blood shall drop out of wood, and the stone shall give his voice, and the people shall be troubled:* (2 Esdras 5:5). Yahusha foretells the same upheaval of the lights: *And there shall be signs in the sun, and in the moon, and in the stars; and upon the earth distress of nations, with perplexity; the sea and the waves roaring;* (Luke 21:25). The Revelation opens the sixth seal on the disordered sun and moon — *And I beheld when he had opened the sixth seal, and, lo, there was a great earthquake; and the sun became black as sackcloth of hair, and the moon became as blood;* (Revelation 6:12). And the lying wonders that trouble the people belong to the man of sin, *Even him, whose coming is after the working of Satan with all power and signs and lying wonders,* (2 Thessalonians 2:9) — the false signs over against the true tokens. Nation against nation completes the list — *For nation shall rise against nation, and kingdom against kingdom: and there shall be famines, and pestilences, and earthquakes, in divers places.* (Matthew 24:7).',
       sv.verse_id, ev.verse_id, 'extras', 63103
  FROM _session253_2esd5_lookup sv, _session253_2esd5_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=5 AND sv.verse_number=4
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=5 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-5-one-vine-one-people',
       E'The one vine, the one dove, the one people',
       E'Esdras pleads from the chosenness of Yashar''el: *And said, O Yahuah (God) that bearest rule, of every wood of the earth, and of all the trees thereof, you have chosen you one only vine:* (2 Esdras 5:23) — *And among all the multitudes of people you have gotten you one people: and to this people, whom you lovedst, you gavest a law that is approved of all.* (2 Esdras 5:27). The one only vine is Isaiah''s vineyard: *For the vineyard of Yahuah (the LORD) of hosts is the house of Yashar''el (Israel), and the men of Judah his pleasant plant:* — *Now will I sing to my wellbeloved a song of my beloved touching his vineyard. My wellbeloved hath a vineyard in a very fruitful hill:* (Isaiah 5:1). The psalmist names the vine brought out of Egypt — *Thou hast brought a vine out of Egypt: thou hast cast out the heathen, and planted it.* (Psalm 80:8). And the one people loved and given the law is Moshe''s word: *For thou art an holy people unto Yahuah Elohayka (the LORD thy God): Yahuah Elohayka (the LORD thy God) hath chosen thee to be a special people unto himself, above all people that are upon the face of the earth.* (Deuteronomy 7:6). The law approved of all still stands.',
       sv.verse_id, ev.verse_id, 'extras', 63106
  FROM _session253_2esd5_lookup sv, _session253_2esd5_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=5 AND sv.verse_number=23
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=5 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-5-israel-not-cast-away',
       E'Why hast thou scattered thine only one people? — Israel not cast away',
       E'Esdras grieves over the scattering: *And now, O Yahuah (God), why have you given this one people over to many? and upon the one root have you prepared others, and why have you scattered your only one people among many?* (2 Esdras 5:28) — and Uriel turns the grief, *You are sore troubled in mind for Yashar''el (Israel)''s sake: lovest you that people better than he that made them?* (2 Esdras 5:33). The scattering is never a casting-off. Sha''ul answers the very question outright: *I say then, Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham, of the tribe of Benjamin.* (Romans 11:1). The election holds for the fathers'' sakes — *As concerning the gospel, they are enemies for your sakes: but as touching the election, they are beloved for the fathers'' sakes.* (Romans 11:28) — and it does not fail, *For the gifts and calling of Elohim (God) are without repentance.* (Romans 11:29). The unfaithful generation forfeits; the faithful remnant of both houses keeps the inheritance. No people-that-shall-come replaces Yashar''el — election precedes confession, and the gathering is the two sticks made one.',
       sv.verse_id, ev.verse_id, 'extras', 63109
  FROM _session253_2esd5_lookup sv, _session253_2esd5_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=5 AND sv.verse_number=28
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=5 AND ev.verse_number=33
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-5-womb-of-earth-times-seasons',
       E'The womb of the earth — the times and the seasons in the Maker''s hand',
       E'Uriel answers the why-not-all-at-once with the womb and the seasons: *And he said to me, I will liken my judgment to a ring: like as there is no slackness of the last, even so there is no swiftness of the first.* (2 Esdras 5:42) — *And he said to me, Ask the womb of a woman, and say to her, If you bring forth children, why do you it not together, but one after another?* (2 Esdras 5:46) — *Then said he to me, Even so have I given the womb of the earth to those that be sown in it in their times.* (2 Esdras 5:48). The Preacher set it first: *To every thing there is a season, and a time to every purpose under the heaven:* (Ecclesiastes 3:1). The fulness of the time is the Father''s own — when the womb of the earth had run its appointed measure, *But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law,* (Galatians 4:4). The times and seasons are reserved to Him alone — *And he said unto them, It is not for you to know the times or the seasons, which the Father hath put in his own power.* (Acts 1:7) — even the day and hour, *But of that day and that hour knoweth no man, no, not the angels which are in heaven, neither the Son, but the Father.* (Mark 13:32). The creature may not haste above the Maker.',
       sv.verse_id, ev.verse_id, 'extras', 63112
  FROM _session253_2esd5_lookup sv, _session253_2esd5_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=5 AND sv.verse_number=42
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=5 AND ev.verse_number=49
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-esdras-5-iniquity-faith-cold
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 24:12 — *And because iniquity shall abound, the love of many shall wax cold.* Yahusha names the same token Uriel gives — iniquity increased and the land barren of faith (2 Esdras 5:1-2).'
  FROM cross_reference_threads t, cross_references x, _session253_2esd5_lookup sv, _session253_2esd5_lookup tv
 WHERE t.slug='2-esdras-5-iniquity-faith-cold'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=5 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Timothy 3:1 — *This know also, that in the last days perilous times shall come.* Sha''ul''s last-days warning matches the iniquity multiplied above all that was heard of old (2 Esdras 5:2).'
  FROM cross_reference_threads t, cross_references x, _session253_2esd5_lookup sv, _session253_2esd5_lookup tv
 WHERE t.slug='2-esdras-5-iniquity-faith-cold'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=5 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='2-timothy' AND tv.chapter_number=3 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Luke 18:8 — *I tell you that he will avenge them speedily. Nevertheless when the Son of Adam cometh, shall he find faith on the earth?* The Son of Adam asks at His coming the very thing Esdras foresees — the land barren of faith (2 Esdras 5:1).'
  FROM cross_reference_threads t, cross_references x, _session253_2esd5_lookup sv, _session253_2esd5_lookup tv
 WHERE t.slug='2-esdras-5-iniquity-faith-cold'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=5 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=18 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Amos 8:11 — *Behold, the days come, saith Adonai Yahuah (the Lord GOD), that I will send a famine in the land, not a famine of bread, nor a thirst for water, but of hearing the words of Yahuah (LORD):* Amos''s famine of hearing IS the way of truth hidden (2 Esdras 5:1).'
  FROM cross_reference_threads t, cross_references x, _session253_2esd5_lookup sv, _session253_2esd5_lookup tv
 WHERE t.slug='2-esdras-5-iniquity-faith-cold'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=5 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=8 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-5-sun-by-night-blood-wood
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Luke 21:25 — *And there shall be signs in the sun, and in the moon, and in the stars; and upon the earth distress of nations, with perplexity; the sea and the waves roaring;* Yahusha''s signs in sun and moon match the sun shining by night and the moon thrice in the day (2 Esdras 5:4).'
  FROM cross_reference_threads t, cross_references x, _session253_2esd5_lookup sv, _session253_2esd5_lookup tv
 WHERE t.slug='2-esdras-5-sun-by-night-blood-wood'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=5 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=21 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 6:12 — *And I beheld when he had opened the sixth seal, and, lo, there was a great earthquake; and the sun became black as sackcloth of hair, and the moon became as blood;* the sixth seal''s disordered lights are the same token as the sun shining by night (2 Esdras 5:4).'
  FROM cross_reference_threads t, cross_references x, _session253_2esd5_lookup sv, _session253_2esd5_lookup tv
 WHERE t.slug='2-esdras-5-sun-by-night-blood-wood'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=5 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=6 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Thessalonians 2:9 — *Even him, whose coming is after the working of Satan with all power and signs and lying wonders,* the lying wonders that trouble the people answer to the blood from wood and the crying stone (2 Esdras 5:5).'
  FROM cross_reference_threads t, cross_references x, _session253_2esd5_lookup sv, _session253_2esd5_lookup tv
 WHERE t.slug='2-esdras-5-sun-by-night-blood-wood'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=5 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='2-thessalonians' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 24:7 — *For nation shall rise against nation, and kingdom against kingdom: and there shall be famines, and pestilences, and earthquakes, in divers places.* Yahusha''s catalogue of birth-pangs stands with the unlooked-for rule and the scattering flight (2 Esdras 5:6).'
  FROM cross_reference_threads t, cross_references x, _session253_2esd5_lookup sv, _session253_2esd5_lookup tv
 WHERE t.slug='2-esdras-5-sun-by-night-blood-wood'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=5 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-5-one-vine-one-people
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 5:1 — *Now will I sing to my wellbeloved a song of my beloved touching his vineyard. My wellbeloved hath a vineyard in a very fruitful hill:* Isaiah''s vineyard is Esdras''s one only vine, chosen of every wood of the earth (2 Esdras 5:23).'
  FROM cross_reference_threads t, cross_references x, _session253_2esd5_lookup sv, _session253_2esd5_lookup tv
 WHERE t.slug='2-esdras-5-one-vine-one-people'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=5 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=5 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalms 80:8 — *Thou hast brought a vine out of Egypt: thou hast cast out the heathen, and planted it.* The vine brought out of Egypt is the one vine Yahuah chose for Himself (2 Esdras 5:23).'
  FROM cross_reference_threads t, cross_references x, _session253_2esd5_lookup sv, _session253_2esd5_lookup tv
 WHERE t.slug='2-esdras-5-one-vine-one-people'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=5 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=80 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 7:6 — *For thou art an holy people unto Yahuah Elohayka (the LORD thy God): Yahuah Elohayka (the LORD thy God) hath chosen thee to be a special people unto himself, above all people that are upon the face of the earth.* Moshe''s chosen special people is the one people whom Yahuah loved and gave the law (2 Esdras 5:27).'
  FROM cross_reference_threads t, cross_references x, _session253_2esd5_lookup sv, _session253_2esd5_lookup tv
 WHERE t.slug='2-esdras-5-one-vine-one-people'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=5 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-5-israel-not-cast-away
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Romans 11:1 — *I say then, Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham, of the tribe of Benjamin.* Sha''ul flatly denies the casting-off that Esdras''s scattering might seem to imply (2 Esdras 5:28).'
  FROM cross_reference_threads t, cross_references x, _session253_2esd5_lookup sv, _session253_2esd5_lookup tv
 WHERE t.slug='2-esdras-5-israel-not-cast-away'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=5 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 11:28 — *As concerning the gospel, they are enemies for your sakes: but as touching the election, they are beloved for the fathers'' sakes.* The one people scattered among many remains beloved by election (2 Esdras 5:28).'
  FROM cross_reference_threads t, cross_references x, _session253_2esd5_lookup sv, _session253_2esd5_lookup tv
 WHERE t.slug='2-esdras-5-israel-not-cast-away'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=5 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 11:29 — *For the gifts and calling of Elohim (God) are without repentance.* The Maker who loves Yashar''el better than Esdras ever could has a calling that cannot be revoked (2 Esdras 5:33).'
  FROM cross_reference_threads t, cross_references x, _session253_2esd5_lookup sv, _session253_2esd5_lookup tv
 WHERE t.slug='2-esdras-5-israel-not-cast-away'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=5 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-5-womb-of-earth-times-seasons
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ecclesiastes 3:1 — *To every thing there is a season, and a time to every purpose under the heaven:* the womb of the earth bringing forth its seed in their times is the Preacher''s season for every purpose (2 Esdras 5:48).'
  FROM cross_reference_threads t, cross_references x, _session253_2esd5_lookup sv, _session253_2esd5_lookup tv
 WHERE t.slug='2-esdras-5-womb-of-earth-times-seasons'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=5 AND sv.verse_number=48
   AND tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=3 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Galatians 4:4 — *But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law,* the fulness of the time is the appointed measure of the womb of the earth (2 Esdras 5:48).'
  FROM cross_reference_threads t, cross_references x, _session253_2esd5_lookup sv, _session253_2esd5_lookup tv
 WHERE t.slug='2-esdras-5-womb-of-earth-times-seasons'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=5 AND sv.verse_number=48
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 1:7 — *And he said unto them, It is not for you to know the times or the seasons, which the Father hath put in his own power.* The ring of judgment with no swiftness of the first is the times and seasons kept in the Father''s power (2 Esdras 5:42).'
  FROM cross_reference_threads t, cross_references x, _session253_2esd5_lookup sv, _session253_2esd5_lookup tv
 WHERE t.slug='2-esdras-5-womb-of-earth-times-seasons'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=5 AND sv.verse_number=42
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=1 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Mark 13:32 — *But of that day and that hour knoweth no man, no, not the angels which are in heaven, neither the Son, but the Father.* The creature that may not haste above the Maker is told that even the day and hour rest with the Father (2 Esdras 5:44).'
  FROM cross_reference_threads t, cross_references x, _session253_2esd5_lookup sv, _session253_2esd5_lookup tv
 WHERE t.slug='2-esdras-5-womb-of-earth-times-seasons'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=5 AND sv.verse_number=44
   AND tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=13 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2esdras_06.sql (session253 2-esdras 6) -----
-- Source anchor: apocrypha/2-esdras ch6. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2esd6 (view _session253_2esd6_lookup). Sort band base 63125, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2esd6_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-esdras-6-made-through-me-alone
  ('apocrypha', '2-esdras', 6, 6, 'canon', 'john', 1, 3, 'free', E'John 1:3 — *All things were made by him; and without him was not any thing made that was made.* The Word''s sole agency in John is the very ''through me alone, and through none other'' the Voice claims in 2 Esdras 6:6.'),
  ('apocrypha', '2-esdras', 6, 6, 'canon', 'colossians', 1, 16, 'free', E'Colossians 1:16 — *For by him were all things created, that are in heaven, and that are in earth, visible and invisible, whether they be thrones, or dominions, or principalities, or powers: all things were created by him, and for him:* Paul''s ''all things created by him, and for him'' is the same one-hand creation of 2 Esdras 6:6.'),
  ('apocrypha', '2-esdras', 6, 6, 'canon', 'colossians', 1, 17, 'free', E'Colossians 1:17 — *And he is before all things, and by him all things consist.* He who was before all and holds all together is the ''by me also they shall be ended'' of 2 Esdras 6:6 — Beginning and End in one hand.'),
  ('apocrypha', '2-esdras', 6, 6, 'canon', 'isaiah', 44, 24, 'free', E'Isaiah 44:24 — *Thus saith Yahuah (LORD), thy redeemer, and he that formed thee from the womb, I am Yahuah (LORD) that maketh all things; that stretcheth forth the heavens alone; that spreadeth abroad the earth by myself;* The prophet''s ''alone... by myself'' is exactly the ''through none other'' of 2 Esdras 6:6.'),
  -- thread: 2-esdras-6-jacob-the-heel-of-esau
  ('apocrypha', '2-esdras', 6, 8, 'canon', 'isaiah', 44, 5, 'free', E'Isaiah 44:5 — *One shall say, I am the LORD''S; and another shall call himself by the name of Jacob; and another shall subscribe with his hand unto Yahuah (LORD), and surname himself by the name of Yashar''el (Israel).* The name of Jacob taken up by the hand answers the heel-grasping hand of Jacob in 2 Esdras 6:8.'),
  ('apocrypha', '2-esdras', 6, 9, 'canon', 'deuteronomy', 7, 7, 'free', E'Deuteronomy 7:7 — *Yahuah (LORD) did not set his love upon you, nor choose you, because ye were more in number than any people; for ye were the fewest of all people:* The election of Jacob over Esau in 2 Esdras 6:9 rests on the same sovereign choosing of the few, not the many.'),
  -- thread: 2-esdras-6-the-books-opened
  ('apocrypha', '2-esdras', 6, 20, 'canon', 'revelation', 20, 12, 'free', E'Revelation 20:12 — *And I saw the dead, small and great, stand before Elohim (God); and the books were opened: and another book was opened, which is the book of life: and the dead were judged out of those things which were written in the books, according to their works.* John''s opened books before the throne are the very ''books opened before the firmament'' of 2 Esdras 6:20 — the self-link of the live Revelation apparatus.'),
  ('apocrypha', '2-esdras', 6, 20, 'canon', 'daniel', 12, 2, 'free', E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The sealed token Daniel kept for the end is shown openly in 2 Esdras 6:20 — the dead seen all together when the books are opened.'),
  -- thread: 2-esdras-6-the-trumpet-and-the-raised
  ('apocrypha', '2-esdras', 6, 23, 'canon', '1-thessalonians', 4, 16, 'free', E'1 Thessalonians 4:16 — *For Yahuah (Lord) himself shall descend from heaven with a shout, with the voice of the archangel, and with the trump of Elohim (God): and the dead in Messiah (Christ) shall rise first:* Paul''s trump that raises the dead is the trumpet that gives a sound in 2 Esdras 6:23.'),
  ('apocrypha', '2-esdras', 6, 21, 'canon', 'daniel', 12, 2, 'free', E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The dead ''raised up'' in 2 Esdras 6:21 is Daniel''s awaking from the dust to everlasting life.'),
  ('apocrypha', '2-esdras', 6, 23, 'canon', 'malachi', 4, 5, 'free', E'Malachi 4:5 — *Behold, I will send you Elijah the prophet before the coming of the great and dreadful day of Yahuah (LORD):* The trumpet-token of the end in 2 Esdras 6:23 is heralded by Malachi''s Elijah before the dreadful day.'),
  ('apocrypha', '2-esdras', 6, 23, 'canon', 'malachi', 4, 6, 'free', E'Malachi 4:6 — *And he shall turn the heart of the fathers to the children, and the heart of the children to their fathers, lest I come and smite the earth with a curse.* The turned heart of the fathers prepares the very day whose trumpet sounds in 2 Esdras 6:23.'),
  -- thread: 2-esdras-6-the-word-a-perfect-work
  ('apocrypha', '2-esdras', 6, 38, 'canon', 'john', 1, 1, 'free', E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The ''word'' that was a perfect work in 2 Esdras 6:38 is the Word that was in the beginning.'),
  ('apocrypha', '2-esdras', 6, 43, 'canon', 'john', 1, 10, 'free', E'John 1:10 — *He was in the world, and the world was made by him, and the world knew him not.* The world made as soon as the word went forth (2 Esdras 6:43) is the world made by the Word in John''s prologue.'),
  ('apocrypha', '2-esdras', 6, 38, 'canon', 'colossians', 1, 15, 'free', E'Colossians 1:15 — *Who is the image of the invisible Elohim (God), the firstborn of every creature:* The spoken word that perfected the first creation (2 Esdras 6:38) is the firstborn image through whom Paul says all was made.'),
  -- thread: 2-esdras-6-the-world-for-our-sakes
  ('apocrypha', '2-esdras', 6, 55, 'canon', 'deuteronomy', 7, 6, 'free', E'Deuteronomy 7:6 — *For thou art an holy people unto Yahuah Elohayka (the LORD thy God): Yahuah Elohayka (the LORD thy God) hath chosen thee to be a special people unto himself, above all people that are upon the face of the earth.* The world made ''for our sakes'' in 2 Esdras 6:55 is the holy, chosen, treasured people of Moses.'),
  ('apocrypha', '2-esdras', 6, 58, 'canon', 'deuteronomy', 7, 8, 'free', E'Deuteronomy 7:8 — *But because Yahuah (LORD) loved you, and because he would keep the oath which he had sworn unto your fathers, hath Yahuah (LORD) brought you out with a mighty hand, and redeemed you out of the house of bondmen, from the hand of Pharaoh king of Egypt.* The firstborn and fervent-lover of 2 Esdras 6:58 is loved for the oath''s sake, as Moses says — election, not merit.'),
  ('apocrypha', '2-esdras', 6, 58, 'canon', 'isaiah', 44, 21, 'free', E'Isaiah 44:21 — *Remember these, O Jacob and Yashar''el (Israel); for thou art my servant: I have formed thee; thou art my servant: O Yashar''el (Israel), thou shalt not be forgotten of me.* The firstborn people given into hands yet not forgotten (2 Esdras 6:58) is the servant Yashar''el the prophet vows never to forget — Israel is not cast away.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2esd6_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2esd6_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-6-made-through-me-alone',
       E'Made through me alone, and through none other',
       E'Before paradise, before the angels, before the firmament was named, the Voice declares the sole agency of creation: *Then did I consider these things, and they all were made through me alone, and through none other: by me also they shall be ended, and by none other.* (2 Esdras 6:6). The Beginning and the End in one hand. John names that same Word: *All things were made by him; and without him was not any thing made that was made.* (John 1:3). Paul gathers the whole created order into Him: *For by him were all things created, that are in heaven, and that are in earth, visible and invisible, whether they be thrones, or dominions, or principalities, or powers: all things were created by him, and for him:* (Colossians 1:16), and *he is before all things, and by him all things consist.* (Colossians 1:17). And the prophet seals the ''alone'' with no other hand beside Him: *Thus saith Yahuah (LORD), thy redeemer, and he that formed thee from the womb, I am Yahuah (LORD) that maketh all things; that stretcheth forth the heavens alone; that spreadeth abroad the earth by myself;* (Isaiah 44:24). It ain''t new — the Formed Wisdom by whom all was made, and by whom all shall be ended.',
       sv.verse_id, ev.verse_id, 'extras', 63125
  FROM _session253_2esd6_lookup sv, _session253_2esd6_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=6 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=6 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-6-jacob-the-heel-of-esau',
       E'Jacob''s hand held first the heel of Esau',
       E'Esdras asks the parting of the times, and the answer is a birth: *From Abraham to Isaac, when Jacob and Esau were born of him, Jacob''s hand held first the heel of Esau.* (2 Esdras 6:8) — *For Esau is the end of the world, and Jacob is the beginning of it that followeth.* (2 Esdras 6:9). The old age and the age to come hinge on the elder and the younger, the supplanter''s hand at the heel. Election precedes confession — *and another shall call himself by the name of Jacob; and another shall subscribe with his hand unto Yahuah (LORD), and surname himself by the name of Yashar''el (Israel).* (Isaiah 44:5). And the Chooser sets His love not on the many but the kept seed: *Yahuah (LORD) did not set his love upon you, nor choose you, because ye were more in number than any people; for ye were the fewest of all people:* (Deuteronomy 7:7). The hand between the heel and the hand is the remnant''s hold on the inheritance — not a people that supplants Israel, but the faithful seed grasping the age that follows.',
       sv.verse_id, ev.verse_id, 'extras', 63128
  FROM _session253_2esd6_lookup sv, _session253_2esd6_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=6 AND sv.verse_number=8
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=6 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-6-the-books-opened',
       E'The books shall be opened before the firmament',
       E'The token of the end is a courtroom and a resurrection together: *And when the world, that shall begin to vanish away, shall be finished, then will I shew these tokens: the books shall be opened before the firmament, and they shall see all together:* (2 Esdras 6:20). John sees the same scene at the white throne: *And I saw the dead, small and great, stand before Elohim (God); and the books were opened: and another book was opened, which is the book of life: and the dead were judged out of those things which were written in the books, according to their works.* (Revelation 20:12). Daniel had sealed it for this very hour, the wise written in the book and waking from the dust: *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* (Daniel 12:2). The vanishing world and the opened books are the one ledger of the last day.',
       sv.verse_id, ev.verse_id, 'extras', 63131
  FROM _session253_2esd6_lookup sv, _session253_2esd6_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=6 AND sv.verse_number=20
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=6 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-6-the-trumpet-and-the-raised',
       E'The trumpet shall give a sound, and they shall be raised up',
       E'The signs gather to a blast and a waking: *And the children of a year old shall speak with their voices, the women with child shall bring forth untimely children of three or four months old, and they shall live, and be raised up.* (2 Esdras 6:21) — *And the trumpet shall give a sound, which when every man heareth, they shall be suddenly afraid.* (2 Esdras 6:23). Paul sounds the same trump over the same raising of the dead: *For Yahuah (Lord) himself shall descend from heaven with a shout, with the voice of the archangel, and with the trump of Elohim (God): and the dead in Messiah (Christ) shall rise first:* (1 Thessalonians 4:16). And the prophet names the herald before that great and dreadful day, the heart of the fathers turned: *Behold, I will send you Elijah the prophet before the coming of the great and dreadful day of Yahuah (LORD):* (Malachi 4:5) — *And he shall turn the heart of the fathers to the children, and the heart of the children to their fathers, lest I come and smite the earth with a curse.* (Malachi 4:6). The trumpet of Esdras is the last trump of the gathering.',
       sv.verse_id, ev.verse_id, 'extras', 63134
  FROM _session253_2esd6_lookup sv, _session253_2esd6_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=6 AND sv.verse_number=21
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=6 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-6-the-word-a-perfect-work',
       E'Your word was a perfect work',
       E'Esdras recites the six days, and the engine of every day is the spoken word: *you spakest from the beginning of the creation, even the first day, and saidst thus; Let heaven and earth be made; and your word was a perfect work.* (2 Esdras 6:38) — *For as soon as your word went forth the work was made.* (2 Esdras 6:43). This is the Logos of the prologue, the Word that was in the beginning and by which all was made: *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* (John 1:1) — *He was in the world, and the world was made by him, and the world knew him not.* (John 1:10). And He who is the image of the invisible holds the first place in that making: *Who is the image of the invisible Elohim (God), the firstborn of every creature:* (Colossians 1:15). The word that went forth and the work that was made are the Formed Wisdom, the perfect work of the first day.',
       sv.verse_id, ev.verse_id, 'extras', 63137
  FROM _session253_2esd6_lookup sv, _session253_2esd6_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=6 AND sv.verse_number=38
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=6 AND ev.verse_number=43
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-6-the-world-for-our-sakes',
       E'You madest the world for our sakes',
       E'The creation-recital lands on a covenant claim, the chosen people the reason for the whole: *All this have I spoken before you, O Yahuah (God), because you madest the world for our sakes* (2 Esdras 6:55) — *But we your people, whom you have called your firstborn, your only begotten, and your fervent lover, are given into their hands.* (2 Esdras 6:58). This is no church displacing Israel; it is the firstborn beloved of the oath. Moses names the same chosen, holy, treasured people: *For thou art an holy people unto Yahuah Elohayka (the LORD thy God): Yahuah Elohayka (the LORD thy God) hath chosen thee to be a special people unto himself, above all people that are upon the face of the earth.* (Deuteronomy 7:6), loved for the oath''s sake, not their number: *But because Yahuah (LORD) loved you, and because he would keep the oath which he had sworn unto your fathers, hath Yahuah (LORD) brought you out with a mighty hand, and redeemed you out of the house of bondmen, from the hand of Pharaoh king of Egypt.* (Deuteronomy 7:8). And the firstborn Yashar''el remembered for the redeemer''s sake: *Remember these, O Jacob and Yashar''el (Israel); for thou art my servant: I have formed thee; thou art my servant: O Yashar''el (Israel), thou shalt not be forgotten of me.* (Isaiah 44:21). Election precedes confession; the world is made for the kept seed.',
       sv.verse_id, ev.verse_id, 'extras', 63140
  FROM _session253_2esd6_lookup sv, _session253_2esd6_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=6 AND sv.verse_number=55
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=6 AND ev.verse_number=59
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-esdras-6-made-through-me-alone
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 1:3 — *All things were made by him; and without him was not any thing made that was made.* The Word''s sole agency in John is the very ''through me alone, and through none other'' the Voice claims in 2 Esdras 6:6.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd6_lookup sv, _session253_2esd6_lookup tv
 WHERE t.slug='2-esdras-6-made-through-me-alone'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=6 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Colossians 1:16 — *For by him were all things created, that are in heaven, and that are in earth, visible and invisible, whether they be thrones, or dominions, or principalities, or powers: all things were created by him, and for him:* Paul''s ''all things created by him, and for him'' is the same one-hand creation of 2 Esdras 6:6.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd6_lookup sv, _session253_2esd6_lookup tv
 WHERE t.slug='2-esdras-6-made-through-me-alone'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=6 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=1 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Colossians 1:17 — *And he is before all things, and by him all things consist.* He who was before all and holds all together is the ''by me also they shall be ended'' of 2 Esdras 6:6 — Beginning and End in one hand.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd6_lookup sv, _session253_2esd6_lookup tv
 WHERE t.slug='2-esdras-6-made-through-me-alone'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=6 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=1 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 44:24 — *Thus saith Yahuah (LORD), thy redeemer, and he that formed thee from the womb, I am Yahuah (LORD) that maketh all things; that stretcheth forth the heavens alone; that spreadeth abroad the earth by myself;* The prophet''s ''alone... by myself'' is exactly the ''through none other'' of 2 Esdras 6:6.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd6_lookup sv, _session253_2esd6_lookup tv
 WHERE t.slug='2-esdras-6-made-through-me-alone'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=6 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-6-jacob-the-heel-of-esau
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 44:5 — *One shall say, I am the LORD''S; and another shall call himself by the name of Jacob; and another shall subscribe with his hand unto Yahuah (LORD), and surname himself by the name of Yashar''el (Israel).* The name of Jacob taken up by the hand answers the heel-grasping hand of Jacob in 2 Esdras 6:8.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd6_lookup sv, _session253_2esd6_lookup tv
 WHERE t.slug='2-esdras-6-jacob-the-heel-of-esau'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=6 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 7:7 — *Yahuah (LORD) did not set his love upon you, nor choose you, because ye were more in number than any people; for ye were the fewest of all people:* The election of Jacob over Esau in 2 Esdras 6:9 rests on the same sovereign choosing of the few, not the many.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd6_lookup sv, _session253_2esd6_lookup tv
 WHERE t.slug='2-esdras-6-jacob-the-heel-of-esau'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=6 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-6-the-books-opened
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 20:12 — *And I saw the dead, small and great, stand before Elohim (God); and the books were opened: and another book was opened, which is the book of life: and the dead were judged out of those things which were written in the books, according to their works.* John''s opened books before the throne are the very ''books opened before the firmament'' of 2 Esdras 6:20 — the self-link of the live Revelation apparatus.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd6_lookup sv, _session253_2esd6_lookup tv
 WHERE t.slug='2-esdras-6-the-books-opened'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=6 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The sealed token Daniel kept for the end is shown openly in 2 Esdras 6:20 — the dead seen all together when the books are opened.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd6_lookup sv, _session253_2esd6_lookup tv
 WHERE t.slug='2-esdras-6-the-books-opened'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=6 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-6-the-trumpet-and-the-raised
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Thessalonians 4:16 — *For Yahuah (Lord) himself shall descend from heaven with a shout, with the voice of the archangel, and with the trump of Elohim (God): and the dead in Messiah (Christ) shall rise first:* Paul''s trump that raises the dead is the trumpet that gives a sound in 2 Esdras 6:23.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd6_lookup sv, _session253_2esd6_lookup tv
 WHERE t.slug='2-esdras-6-the-trumpet-and-the-raised'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=6 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='1-thessalonians' AND tv.chapter_number=4 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The dead ''raised up'' in 2 Esdras 6:21 is Daniel''s awaking from the dust to everlasting life.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd6_lookup sv, _session253_2esd6_lookup tv
 WHERE t.slug='2-esdras-6-the-trumpet-and-the-raised'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=6 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Malachi 4:5 — *Behold, I will send you Elijah the prophet before the coming of the great and dreadful day of Yahuah (LORD):* The trumpet-token of the end in 2 Esdras 6:23 is heralded by Malachi''s Elijah before the dreadful day.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd6_lookup sv, _session253_2esd6_lookup tv
 WHERE t.slug='2-esdras-6-the-trumpet-and-the-raised'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=6 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=4 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Malachi 4:6 — *And he shall turn the heart of the fathers to the children, and the heart of the children to their fathers, lest I come and smite the earth with a curse.* The turned heart of the fathers prepares the very day whose trumpet sounds in 2 Esdras 6:23.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd6_lookup sv, _session253_2esd6_lookup tv
 WHERE t.slug='2-esdras-6-the-trumpet-and-the-raised'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=6 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=4 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-6-the-word-a-perfect-work
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The ''word'' that was a perfect work in 2 Esdras 6:38 is the Word that was in the beginning.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd6_lookup sv, _session253_2esd6_lookup tv
 WHERE t.slug='2-esdras-6-the-word-a-perfect-work'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=6 AND sv.verse_number=38
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 1:10 — *He was in the world, and the world was made by him, and the world knew him not.* The world made as soon as the word went forth (2 Esdras 6:43) is the world made by the Word in John''s prologue.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd6_lookup sv, _session253_2esd6_lookup tv
 WHERE t.slug='2-esdras-6-the-word-a-perfect-work'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=6 AND sv.verse_number=43
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Colossians 1:15 — *Who is the image of the invisible Elohim (God), the firstborn of every creature:* The spoken word that perfected the first creation (2 Esdras 6:38) is the firstborn image through whom Paul says all was made.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd6_lookup sv, _session253_2esd6_lookup tv
 WHERE t.slug='2-esdras-6-the-word-a-perfect-work'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=6 AND sv.verse_number=38
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=1 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-6-the-world-for-our-sakes
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 7:6 — *For thou art an holy people unto Yahuah Elohayka (the LORD thy God): Yahuah Elohayka (the LORD thy God) hath chosen thee to be a special people unto himself, above all people that are upon the face of the earth.* The world made ''for our sakes'' in 2 Esdras 6:55 is the holy, chosen, treasured people of Moses.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd6_lookup sv, _session253_2esd6_lookup tv
 WHERE t.slug='2-esdras-6-the-world-for-our-sakes'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=6 AND sv.verse_number=55
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 7:8 — *But because Yahuah (LORD) loved you, and because he would keep the oath which he had sworn unto your fathers, hath Yahuah (LORD) brought you out with a mighty hand, and redeemed you out of the house of bondmen, from the hand of Pharaoh king of Egypt.* The firstborn and fervent-lover of 2 Esdras 6:58 is loved for the oath''s sake, as Moses says — election, not merit.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd6_lookup sv, _session253_2esd6_lookup tv
 WHERE t.slug='2-esdras-6-the-world-for-our-sakes'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=6 AND sv.verse_number=58
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 44:21 — *Remember these, O Jacob and Yashar''el (Israel); for thou art my servant: I have formed thee; thou art my servant: O Yashar''el (Israel), thou shalt not be forgotten of me.* The firstborn people given into hands yet not forgotten (2 Esdras 6:58) is the servant Yashar''el the prophet vows never to forget — Israel is not cast away.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd6_lookup sv, _session253_2esd6_lookup tv
 WHERE t.slug='2-esdras-6-the-world-for-our-sakes'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=6 AND sv.verse_number=58
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2esdras_07.sql (session253 2-esdras 7) -----
-- Source anchor: apocrypha/2-esdras ch7. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2esd7 (view _session253_2esd7_lookup). Sort band base 63150, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2esd7_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-esdras-7-strait-gate-inheritance
  ('apocrypha', '2-esdras', 7, 7, 'canon', 'matthew', 7, 13, 'free', E'Matthew 7:13 — *Enter ye in at the strait gate: for wide is the gate, and broad is the way, that leadeth to destruction, and many there be which go in thereat:* The broad way to destruction is Esdras''s wide door of the present world that brings not life.'),
  ('apocrypha', '2-esdras', 7, 8, 'canon', 'matthew', 7, 14, 'free', E'Matthew 7:14 — *Because strait is the gate, and narrow is the way, which leadeth unto life, and few there be that find it.* The one-man path between fire and water is Yahusha''s narrow way that few find.'),
  ('apocrypha', '2-esdras', 7, 14, 'canon', 'luke', 13, 24, 'free', E'Luke 13:24 — *Strive to enter in at the strait gate: for many, I say unto you, will seek to enter in, and shall not be able.* Those who labour not to enter the strait things can never receive what is laid up, exactly as Yahusha warns of the many who shall not be able.'),
  -- thread: 2-esdras-7-israel-portion-not-cast-away
  ('apocrypha', '2-esdras', 7, 10, 'canon', 'romans', 11, 1, 'free', E'Romans 11:1 — *I say then, Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham, of the tribe of Benjamin.* The narrow inheritance is still Israel''s portion — the remnant keeps it, the people are not cast away.'),
  ('apocrypha', '2-esdras', 7, 18, 'canon', 'deuteronomy', 30, 19, 'free', E'Deuteronomy 30:19 — *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live:* The righteous who suffer strait things and hope for wide are the seed that chose life, just as Moses set it before Israel.'),
  -- thread: 2-esdras-7-my-son-the-messiah
  ('apocrypha', '2-esdras', 7, 28, 'canon', 'revelation', 20, 6, 'free', E'Revelation 20:6 — *Blessed and holy is he that hath part in the first resurrection: on such the second death hath no power, but they shall be priests of Elohim (God) and of Messiah (Christ), and shall reign with him a thousand years.* My son the Messiah revealed with those that be with him, rejoicing for an age, is the reign of the firstfruits in the first resurrection.'),
  ('apocrypha', '2-esdras', 7, 29, 'canon', '1-corinthians', 15, 22, 'free', E'1 Corinthians 15:22 — *For as in Adam all die, even so in Messiah (Christ) shall all be made alive.* That my son Messiah shall die, and all men that have life, is the very Adam-and-Messiah ordering Sha''ul preaches.'),
  ('apocrypha', '2-esdras', 7, 29, 'canon', '1-corinthians', 15, 23, 'free', E'1 Corinthians 15:23 — *But every man in his own order: Messiah (Christ) the firstfruits; afterward they that are Messiah''s (Christ''s) at his coming.* The Messiah dies first, then all that have life follow in their own order, as Esdras foretells.'),
  -- thread: 2-esdras-7-silence-and-the-raising
  ('apocrypha', '2-esdras', 7, 32, 'canon', 'daniel', 12, 2, 'free', E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The earth restoring those asleep in her, the dust giving up those in silence, is Daniel''s sleepers waking from the dust.'),
  ('apocrypha', '2-esdras', 7, 32, 'canon', 'john', 5, 28, 'free', E'John 5:28 — *Marvel not at this: for the hour is coming, in the which all that are in the graves shall hear his voice,* The secret places delivering up the committed souls is the hour when all in the graves hear His voice.'),
  ('apocrypha', '2-esdras', 7, 32, 'canon', 'revelation', 20, 13, 'free', E'Revelation 20:13 — *And the sea gave up the dead which were in it; and death and hell delivered up the dead which were in them: and they were judged every man according to their works.* The dust and the secret places yielding their dead is John''s sea, death, and hell giving up theirs for the judgment.'),
  -- thread: 2-esdras-7-seat-of-judgment-day-of-doom
  ('apocrypha', '2-esdras', 7, 33, 'canon', 'matthew', 25, 31, 'free', E'Matthew 25:31 — *When the Son of Adam shall come in his glory, and all the holy angels with him, then shall he sit upon the throne of his glory:* The Most High appearing on the seat of judgment is the Son of Adam taking the throne of His glory.'),
  ('apocrypha', '2-esdras', 7, 43, 'canon', 'matthew', 25, 46, 'free', E'Matthew 25:46 — *And these shall go away into everlasting punishment: but the righteous into life eternal.* The day of doom that begins the immortality to come is the parting of the cursed and the righteous at Yahusha''s judgment.'),
  ('apocrypha', '2-esdras', 7, 33, 'canon', 'revelation', 20, 11, 'free', E'Revelation 20:11 — *And I saw a great white throne, and him that sat on it, from whose face the earth and the heaven fled away; and there was found no place for them.* The Most High upon the seat of judgment, misery passing away, is John''s great white throne before which earth and heaven flee.'),
  -- thread: 2-esdras-7-in-adam-all-die
  ('apocrypha', '2-esdras', 7, 48, 'canon', 'romans', 5, 12, 'free', E'Romans 5:12 — *Wherefore, as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned:* That Adam fell not alone but all that come of him fall is Sha''ul''s one man by whom death passed upon all.'),
  ('apocrypha', '2-esdras', 7, 11, 'canon', 'romans', 5, 19, 'free', E'Romans 5:19 — *For as by one man''s disobedience many were made sinners, so by the obedience of one shall many be made righteous.* Adam''s transgression decreeing the death that now is done is answered by the obedience of the one who makes many righteous.'),
  -- thread: 2-esdras-7-choose-life-few-saved
  ('apocrypha', '2-esdras', 7, 59, 'canon', 'deuteronomy', 30, 15, 'free', E'Deuteronomy 30:15 — *See, I have set before thee this day life and good, and death and evil;* The life of which Moses spoke, choose life that you may live, is the very setting of life and good against death and evil.'),
  ('apocrypha', '2-esdras', 7, 58, 'canon', 'revelation', 14, 13, 'free', E'Revelation 14:13 — *And I heard a voice from heaven saying unto me, Write, Blessed are the dead which die in Yahuah (Lord) from henceforth: Yea, saith the Spirit, that they may rest from their labours; and their works do follow them.* He that gets the victory receives the thing the angel promised — the blessed rest of the dead who die in Yahuah, their works following.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2esd7_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2esd7_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-7-strait-gate-inheritance',
       E'The narrow path between fire and water — the strait gate',
       E'The angel sets before Esdras a city of all good things, but the way in is deadly: *The entrance thereof is narrow, and is set in a dangerous place to fall, like as if there were a fire on the right hand, and on the left a deep water* (2 Esdras 7:7), *And one only path between them both, even between the fire and the water, so small that there could but one man go there at once* (2 Esdras 7:8) — and the inheritance is only for the one who passes the danger set before it. Yahusha draws the same map: *Enter ye in at the strait gate: for wide is the gate, and broad is the way, that leadeth to destruction, and many there be which go in thereat* (Matthew 7:13), *Because strait is the gate, and narrow is the way, which leadeth unto life, and few there be that find it* (Matthew 7:14). When one asked whether few are saved, He answered the very thing: *Strive to enter in at the strait gate: for many, I say unto you, will seek to enter in, and shall not be able* (Luke 13:24). It ain''t new — the few-find-it road was already the witness of the elders.',
       sv.verse_id, ev.verse_id, 'extras', 63150
  FROM _session253_2esd7_lookup sv, _session253_2esd7_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=7 AND sv.verse_number=7
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=7 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-7-israel-portion-not-cast-away',
       E'Israel''s portion — the inheritance kept for the faithful remnant',
       E'The whole parable lands on one word: *Even so also is Yashar''el (Israel)''s portion* (2 Esdras 7:10) — the narrow inheritance is Israel''s inheritance, won by the faithful who pass the danger, not transferred away from the seed. The righteous walk the hard road in hope: *Nevertheless the righteous shall suffer strait things, and hope for wide* (2 Esdras 7:18). This is no church replacing Israel; it is the covenant standing while the unfaithful forfeit, and the elect remnant keeps the portion — *I say then, Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham, of the tribe of Benjamin* (Romans 11:1). The choice the angel presses was Moses''s own charge: *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live* (Deuteronomy 30:19) — the seed lives by choosing the covenant, not by being supplanted.',
       sv.verse_id, ev.verse_id, 'extras', 63153
  FROM _session253_2esd7_lookup sv, _session253_2esd7_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=7 AND sv.verse_number=10
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=7 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-7-my-son-the-messiah',
       E'My son the Messiah revealed — and the Messiah die',
       E'Here 4 Ezra speaks its own messianism plainly: *For my son the Messiah shall be revealed with those that be with him, and they that remain shall rejoice within four hundred years* (2 Esdras 7:28), *After these years shall my son Messiah (Christ) die, and all men that have life* (2 Esdras 7:29). A revealed Son called Messiah, who reigns with those that are His, and then dies — the death of Messiah is no NT novelty; it stands written here as Israel''s own expectation. Sha''ul preaches the same order of the ages: *For as in Adam all die, even so in Messiah (Christ) shall all be made alive* (1 Corinthians 15:22), *But every man in his own order: Messiah (Christ) the firstfruits; afterward they that are Messiah''s (Christ''s) at his coming* (1 Corinthians 15:23). And the reign with those that are His is John''s first resurrection: *Blessed and holy is he that hath part in the first resurrection: on such the second death hath no power, but they shall be priests of Elohim (God) and of Messiah (Christ), and shall reign with him a thousand years* (Revelation 20:6).',
       sv.verse_id, ev.verse_id, 'extras', 63156
  FROM _session253_2esd7_lookup sv, _session253_2esd7_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=7 AND sv.verse_number=28
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=7 AND ev.verse_number=29
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-7-silence-and-the-raising',
       E'The seven days'' silence and the raising of the dead',
       E'After the Messiah''s death the world returns to primal stillness, then wakes to resurrection: *And the world shall be turned into the old silence seven days, like as in the former judgments: so that no man shall remain* (2 Esdras 7:30), *And after seven days the world, that yet awakes not, shall be raised up, and that shall die that is corrupt* (2 Esdras 7:31), *And the earth shall restore those that are asleep in her, and so shall the dust those that dwell in silence, and the secret places shall deliver those souls that were committed to them* (2 Esdras 7:32). Daniel saw the same waking dust: *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt* (Daniel 12:2). Yahusha gathers it into one hour: *Marvel not at this: for the hour is coming, in the which all that are in the graves shall hear his voice* (John 5:28), *And shall come forth; they that have done good, unto the resurrection of life; and they that have done evil, unto the resurrection of damnation* (John 5:29). And John watched the sea and the dust give up their dead: *And the sea gave up the dead which were in it; and death and hell delivered up the dead which were in them: and they were judged every man according to their works* (Revelation 20:13).',
       sv.verse_id, ev.verse_id, 'extras', 63159
  FROM _session253_2esd7_lookup sv, _session253_2esd7_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=7 AND sv.verse_number=30
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=7 AND ev.verse_number=32
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-7-seat-of-judgment-day-of-doom',
       E'The seat of judgment — the day of doom',
       E'Then the Most High takes the throne and the verdict stands: *And the Most High shall appear upon the seat of judgment, and misery shall pass away, and the long suffering shall have an end* (2 Esdras 7:33), *But judgment only shall remain, truth shall stand, and faith shall wax strong* (2 Esdras 7:34) — *But the day of doom shall be the end of this time, and the beginning of the immortality for to come, in which corruption is past* (2 Esdras 7:43). Yahusha is the One on that seat, dividing the nations: *When the Son of Adam shall come in his glory, and all the holy angels with him, then shall he sit upon the throne of his glory* (Matthew 25:31), and the two ways part forever — *And these shall go away into everlasting punishment: but the righteous into life eternal* (Matthew 25:46). John saw the same throne: *And I saw a great white throne, and him that sat on it, from whose face the earth and the heaven fled away; and there was found no place for them* (Revelation 20:11).',
       sv.verse_id, ev.verse_id, 'extras', 63162
  FROM _session253_2esd7_lookup sv, _session253_2esd7_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=7 AND sv.verse_number=33
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=7 AND ev.verse_number=43
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-7-in-adam-all-die',
       E'O thou Adam, what hast thou done — we all that come of thee',
       E'Esdras grieves the fountainhead of death: *O you Adam, what have you done? for though it was you that sinned, you are not fallen alone, but we all that come of you* (2 Esdras 7:48) — and earlier, *Because for their sakes I made the world: and when Adam transgressed my statutes, then was decreed that now is done* (2 Esdras 7:11). This is the very gravity Sha''ul carries to the cross: *Wherefore, as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned* (Romans 5:12), *For as by one man''s disobedience many were made sinners, so by the obedience of one shall many be made righteous* (Romans 5:19). The one Adam''s fall that pulls down all who come of him is answered by the one Messiah''s obedience — the death decreed in Adam undone in Him.',
       sv.verse_id, ev.verse_id, 'extras', 63165
  FROM _session253_2esd7_lookup sv, _session253_2esd7_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=7 AND sv.verse_number=48
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=7 AND ev.verse_number=48
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-7-choose-life-few-saved',
       E'Choose life — the battle, and the few that win the victory',
       E'The angel frames the whole age as a contest with one prize: *This is the condition of the battle, which man that is born upon the earth shall fight* (2 Esdras 7:57), *For this is the life of which Moses spoke to the people while he lived, saying, Choose you life, that you may live* (2 Esdras 7:59) — yet *There should be very few left perhaps in an innumerable multitude* (2 Esdras 7:70). The summons is Moses''s own: *See, I have set before thee this day life and good, and death and evil* (Deuteronomy 30:15). And the winners of the victory are those who die in faithfulness — *And I heard a voice from heaven saying unto me, Write, Blessed are the dead which die in Yahuah (Lord) from henceforth: Yea, saith the Spirit, that they may rest from their labours; and their works do follow them* (Revelation 14:13). The narrow door and the few who find it close the chapter where it opened — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 63168
  FROM _session253_2esd7_lookup sv, _session253_2esd7_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=7 AND sv.verse_number=57
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=7 AND ev.verse_number=70
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-esdras-7-strait-gate-inheritance
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 7:13 — *Enter ye in at the strait gate: for wide is the gate, and broad is the way, that leadeth to destruction, and many there be which go in thereat:* The broad way to destruction is Esdras''s wide door of the present world that brings not life.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd7_lookup sv, _session253_2esd7_lookup tv
 WHERE t.slug='2-esdras-7-strait-gate-inheritance'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=7 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 7:14 — *Because strait is the gate, and narrow is the way, which leadeth unto life, and few there be that find it.* The one-man path between fire and water is Yahusha''s narrow way that few find.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd7_lookup sv, _session253_2esd7_lookup tv
 WHERE t.slug='2-esdras-7-strait-gate-inheritance'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=7 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Luke 13:24 — *Strive to enter in at the strait gate: for many, I say unto you, will seek to enter in, and shall not be able.* Those who labour not to enter the strait things can never receive what is laid up, exactly as Yahusha warns of the many who shall not be able.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd7_lookup sv, _session253_2esd7_lookup tv
 WHERE t.slug='2-esdras-7-strait-gate-inheritance'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=7 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=13 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-7-israel-portion-not-cast-away
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Romans 11:1 — *I say then, Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham, of the tribe of Benjamin.* The narrow inheritance is still Israel''s portion — the remnant keeps it, the people are not cast away.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd7_lookup sv, _session253_2esd7_lookup tv
 WHERE t.slug='2-esdras-7-israel-portion-not-cast-away'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=7 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 30:19 — *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live:* The righteous who suffer strait things and hope for wide are the seed that chose life, just as Moses set it before Israel.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd7_lookup sv, _session253_2esd7_lookup tv
 WHERE t.slug='2-esdras-7-israel-portion-not-cast-away'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=7 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-7-my-son-the-messiah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 20:6 — *Blessed and holy is he that hath part in the first resurrection: on such the second death hath no power, but they shall be priests of Elohim (God) and of Messiah (Christ), and shall reign with him a thousand years.* My son the Messiah revealed with those that be with him, rejoicing for an age, is the reign of the firstfruits in the first resurrection.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd7_lookup sv, _session253_2esd7_lookup tv
 WHERE t.slug='2-esdras-7-my-son-the-messiah'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=7 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Corinthians 15:22 — *For as in Adam all die, even so in Messiah (Christ) shall all be made alive.* That my son Messiah shall die, and all men that have life, is the very Adam-and-Messiah ordering Sha''ul preaches.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd7_lookup sv, _session253_2esd7_lookup tv
 WHERE t.slug='2-esdras-7-my-son-the-messiah'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=7 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Corinthians 15:23 — *But every man in his own order: Messiah (Christ) the firstfruits; afterward they that are Messiah''s (Christ''s) at his coming.* The Messiah dies first, then all that have life follow in their own order, as Esdras foretells.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd7_lookup sv, _session253_2esd7_lookup tv
 WHERE t.slug='2-esdras-7-my-son-the-messiah'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=7 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-7-silence-and-the-raising
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The earth restoring those asleep in her, the dust giving up those in silence, is Daniel''s sleepers waking from the dust.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd7_lookup sv, _session253_2esd7_lookup tv
 WHERE t.slug='2-esdras-7-silence-and-the-raising'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=7 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 5:28 — *Marvel not at this: for the hour is coming, in the which all that are in the graves shall hear his voice,* The secret places delivering up the committed souls is the hour when all in the graves hear His voice.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd7_lookup sv, _session253_2esd7_lookup tv
 WHERE t.slug='2-esdras-7-silence-and-the-raising'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=7 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=5 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 20:13 — *And the sea gave up the dead which were in it; and death and hell delivered up the dead which were in them: and they were judged every man according to their works.* The dust and the secret places yielding their dead is John''s sea, death, and hell giving up theirs for the judgment.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd7_lookup sv, _session253_2esd7_lookup tv
 WHERE t.slug='2-esdras-7-silence-and-the-raising'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=7 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-7-seat-of-judgment-day-of-doom
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 25:31 — *When the Son of Adam shall come in his glory, and all the holy angels with him, then shall he sit upon the throne of his glory:* The Most High appearing on the seat of judgment is the Son of Adam taking the throne of His glory.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd7_lookup sv, _session253_2esd7_lookup tv
 WHERE t.slug='2-esdras-7-seat-of-judgment-day-of-doom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=7 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=25 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 25:46 — *And these shall go away into everlasting punishment: but the righteous into life eternal.* The day of doom that begins the immortality to come is the parting of the cursed and the righteous at Yahusha''s judgment.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd7_lookup sv, _session253_2esd7_lookup tv
 WHERE t.slug='2-esdras-7-seat-of-judgment-day-of-doom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=7 AND sv.verse_number=43
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=25 AND tv.verse_number=46
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 20:11 — *And I saw a great white throne, and him that sat on it, from whose face the earth and the heaven fled away; and there was found no place for them.* The Most High upon the seat of judgment, misery passing away, is John''s great white throne before which earth and heaven flee.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd7_lookup sv, _session253_2esd7_lookup tv
 WHERE t.slug='2-esdras-7-seat-of-judgment-day-of-doom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=7 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-7-in-adam-all-die
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Romans 5:12 — *Wherefore, as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned:* That Adam fell not alone but all that come of him fall is Sha''ul''s one man by whom death passed upon all.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd7_lookup sv, _session253_2esd7_lookup tv
 WHERE t.slug='2-esdras-7-in-adam-all-die'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=7 AND sv.verse_number=48
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=5 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 5:19 — *For as by one man''s disobedience many were made sinners, so by the obedience of one shall many be made righteous.* Adam''s transgression decreeing the death that now is done is answered by the obedience of the one who makes many righteous.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd7_lookup sv, _session253_2esd7_lookup tv
 WHERE t.slug='2-esdras-7-in-adam-all-die'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=7 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=5 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-7-choose-life-few-saved
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 30:15 — *See, I have set before thee this day life and good, and death and evil;* The life of which Moses spoke, choose life that you may live, is the very setting of life and good against death and evil.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd7_lookup sv, _session253_2esd7_lookup tv
 WHERE t.slug='2-esdras-7-choose-life-few-saved'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=7 AND sv.verse_number=59
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 14:13 — *And I heard a voice from heaven saying unto me, Write, Blessed are the dead which die in Yahuah (Lord) from henceforth: Yea, saith the Spirit, that they may rest from their labours; and their works do follow them.* He that gets the victory receives the thing the angel promised — the blessed rest of the dead who die in Yahuah, their works following.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd7_lookup sv, _session253_2esd7_lookup tv
 WHERE t.slug='2-esdras-7-choose-life-few-saved'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=7 AND sv.verse_number=58
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=14 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2esdras_08.sql (session253 2-esdras 8) -----
-- Source anchor: apocrypha/2-esdras ch8. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2esd8 (view _session253_2esd8_lookup). Sort band base 63175, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2esd8_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-esdras-8-world-to-come-few-saved
  ('apocrypha', '2-esdras', 8, 1, 'canon', 'matthew', 7, 13, 'free', E'Matthew 7:13 — *Enter ye in at the strait gate: for wide is the gate, and broad is the way, that leadeth to destruction, and many there be which go in thereat:* Yahusha''s wide-and-narrow ways are Esdras''s world-for-many and world-to-come-for-few.'),
  ('apocrypha', '2-esdras', 8, 3, 'canon', 'matthew', 22, 14, 'free', E'Matthew 22:14 — *For many are called, but few are chosen.* The Messiah''s epigram says in one line what 2 Esdras 8:3 says of the many created but the few saved.'),
  ('apocrypha', '2-esdras', 8, 1, 'canon', 'isaiah', 65, 17, 'free', E'Isaiah 65:17 — *For, behold, I create new heavens and a new earth: and the former shall not be remembered, nor come into mind.* The age Esdras calls ''the world to come'' is Isaiah''s new heavens and new earth.'),
  -- thread: 2-esdras-8-fashioned-in-the-womb-nurtured-in-the-law
  ('apocrypha', '2-esdras', 8, 8, 'canon', 'psalms', 139, 13, 'free', E'Psalm 139:13 — *For thou hast possessed my reins: thou hast covered me in my mother’s womb.* David''s covering in the womb is Esdras''s creature fashioned and preserved nine months in the mother''s womb.'),
  ('apocrypha', '2-esdras', 8, 8, 'canon', 'psalms', 139, 14, 'free', E'Psalm 139:14 — *I will praise thee; for I am fearfully and wonderfully made: marvellous are thy works; and that my soul knoweth right well.* The fearful, wonderful making of the body answers the great labour with which 2 Esdras 8:8 says the creature is fashioned.'),
  -- thread: 2-esdras-8-no-man-but-hath-sinned-mercy-without-works
  ('apocrypha', '2-esdras', 8, 35, 'canon', 'romans', 3, 23, 'free', E'Romans 3:23 — *For all have sinned, and come short of the glory of Elohim (God);* Sha''ul''s verdict is Esdras''s — no man born but he hath sinned, none of the faithful but hath done amiss.'),
  ('apocrypha', '2-esdras', 8, 35, 'canon', 'ecclesiastes', 7, 20, 'free', E'Ecclesiastes 7:20 — *For there is not a just man upon earth, that doeth good, and sinneth not.* The Preacher''s ''not a just man upon earth'' is precisely 2 Esdras 8:35''s ''no man... but he has dealt wickedly.'''),
  ('apocrypha', '2-esdras', 8, 32, 'canon', 'psalms', 143, 2, 'free', E'Psalm 143:2 — *And enter not into judgment with thy servant: for in thy sight shall no man living be justified.* David, like Esdras in 8:32, flees judgment-by-works and pleads to be counted among those who have no works of righteousness but mercy.'),
  -- thread: 2-esdras-8-humbled-thyself-justified
  ('apocrypha', '2-esdras', 8, 49, 'canon', 'luke', 18, 13, 'free', E'Luke 18:13 — *And the publican, standing afar off, would not lift up so much as his eyes unto heaven, but smote upon his breast, saying, Elohim (God) be merciful to me a sinner.* The publican who dares not be glorified is the very humility for which Esdras is commended in 8:49.'),
  ('apocrypha', '2-esdras', 8, 49, 'canon', 'luke', 18, 14, 'free', E'Luke 18:14 — *I tell you, this man went down to his house justified rather than the other: for every one that exalteth himself shall be abased; and he that humbleth himself shall be exalted.* Yahusha''s rule — the humble exalted — is why Esdras''s not-judging-himself-worthy is commended above all in 8:49.'),
  -- thread: 2-esdras-8-paradise-tree-of-life-immortality
  ('apocrypha', '2-esdras', 8, 52, 'canon', 'luke', 23, 43, 'free', E'Luke 23:43 — *And Yahusha (Jesus) said unto him, Verily I say unto thee, To day shalt thou be with me in paradise.* The paradise Esdras says is ''opened'' to the lowly is the paradise the Messiah opens from the tree to the thief in 8:52.'),
  ('apocrypha', '2-esdras', 8, 52, 'canon', 'revelation', 22, 2, 'free', E'Revelation 22:2 — *In the midst of the street of it, and on either side of the river, was there the tree of life, which bare twelve manner of fruits, and yielded her fruit every month: and the leaves of the tree were for the healing of the nations.* John sees planted in the builded city the very tree of life Esdras names in 8:52.'),
  ('apocrypha', '2-esdras', 8, 54, 'canon', 'revelation', 21, 4, 'free', E'Revelation 21:4 — *And Elohim (God) shall wipe away all tears from their eyes; and there shall be no more death, neither sorrow, nor crying, neither shall there be any more pain: for the former things are passed away.* The passing of sorrows in 2 Esdras 8:54 is John''s wiping away of all tears.'),
  ('apocrypha', '2-esdras', 8, 54, 'canon', '2-timothy', 1, 10, 'free', E'2 Timothy 1:10 — *But is now made manifest by the appearing of our Saviour Yahusha HaMashiach (Jesus Christ), who hath abolished death, and hath brought life and immortality to light through the gospel:* The ''treasure of immortality'' shewed in the end (8:54) is brought to light through the Besorah.'),
  -- thread: 2-esdras-8-shewn-to-thee-and-a-few-like-thee
  ('apocrypha', '2-esdras', 8, 62, 'canon', 'matthew', 22, 14, 'free', E'Matthew 22:14 — *For many are called, but few are chosen.* The ''few like you'' to whom alone these things are shewed (8:62) are the chosen few of the Messiah''s word.'),
  ('apocrypha', '2-esdras', 8, 62, 'canon', '2-timothy', 1, 9, 'free', E'2 Timothy 1:9 — *Who hath saved us, and called us with an holy calling, not according to our works, but according to his own purpose and grace, which was given us in HaMashiach Yahusha (Christ Jesus) before the world began,* The few to whom the wonders are shewn in 8:62 are kept by purpose and grace, election before works.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2esd8_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2esd8_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-8-world-to-come-few-saved',
       E'This world for many, the world to come for few',
       E'The Most High answers Ezra on the two ages and the narrow remnant: *And he answered me, saying, The most High has made this world for many, but the world to come for few* (2 Esdras 8:1), *There be many created, but few shall be saved* (2 Esdras 8:3). It ain''t new. Yahusha speaks the very same strait gate: *Enter ye in at the strait gate: for wide is the gate, and broad is the way, that leadeth to destruction, and many there be which go in thereat* (Matthew 7:13), and seals it in a sentence — *For many are called, but few are chosen* (Matthew 22:14). And the world to come itself the Tanakh foresaw: *For, behold, I create new heavens and a new earth: and the former shall not be remembered, nor come into mind* (Isaiah 65:17). Esdras and the Gospel measure the same two ways and the same few who walk the narrow one.',
       sv.verse_id, ev.verse_id, 'extras', 63175
  FROM _session253_2esd8_lookup sv, _session253_2esd8_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=8 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=8 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-8-fashioned-in-the-womb-nurtured-in-the-law',
       E'Fashioned in the womb, nurtured in thy law',
       E'Ezra pleads the Maker''s own care over the creature He forms: *For when the body is fashioned now in the mother’s womb, and you give it members, your creature is preserved in fire and water, and nine months does your workmanship endure your creature which is created in her* (2 Esdras 8:8), *You broughtest it up with your righteousness, and nurturedst it in your law, and reformedst it with your judgment* (2 Esdras 8:12). It ain''t new. David sang it first: *For thou hast possessed my reins: thou hast covered me in my mother’s womb* (Psalm 139:13), *I will praise thee; for I am fearfully and wonderfully made: marvellous are thy works; and that my soul knoweth right well* (Psalm 139:14). The Hand that knits the body in the womb is the Hand that rears it in the Torah — formation and instruction are one work of the same Elohim.',
       sv.verse_id, ev.verse_id, 'extras', 63178
  FROM _session253_2esd8_lookup sv, _session253_2esd8_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=8 AND sv.verse_number=8
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=8 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-8-no-man-but-hath-sinned-mercy-without-works',
       E'No man born but hath sinned; mercy to them without works',
       E'Ezra confesses the universal fall and casts the people on mercy, not merit: *For in truth them is no man among them that be born, but he has dealt wickedly; and among the faithful there is none which has not done amiss* (2 Esdras 8:35), and *For if you have a desire to have mercy upon us, you shall be called merciful, to us namely, that have no works of righteousness* (2 Esdras 8:32). It ain''t new. Sha''ul says it flat: *For all have sinned, and come short of the glory of Elohim* (Romans 3:23); the Preacher said it long before — *For there is not a just man upon earth, that doeth good, and sinneth not* (Ecclesiastes 7:20); and David prayed it at the throne: *And enter not into judgment with thy servant: for in thy sight shall no man living be justified* (Psalm 143:2). Esdras stands exactly where the Tanakh and the Besorah stand — none righteous, all upon mercy.',
       sv.verse_id, ev.verse_id, 'extras', 63181
  FROM _session253_2esd8_lookup sv, _session253_2esd8_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=8 AND sv.verse_number=32
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=8 AND ev.verse_number=35
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-8-humbled-thyself-justified',
       E'Thou hast humbled thyself — and so art commended',
       E'The Most High commends Ezra not for his glory but for his lowliness: *In that you have humbled thyself, as it becometh you, and have not judged thyself worthy to be much glorified among the righteous* (2 Esdras 8:49). It ain''t new. Yahusha tells the very parable: the publican *standing afar off, would not lift up so much as his eyes unto heaven, but smote upon his breast, saying, Elohim be merciful to me a sinner* (Luke 18:13) — *I tell you, this man went down to his house justified rather than the other: for every one that exalteth himself shall be abased; and he that humbleth himself shall be exalted* (Luke 18:14). Esdras refuses to reckon himself worthy of glory and is therefore commended above all; the publican who will not lift his eyes goes home justified. The same law of the lowly runs through both.',
       sv.verse_id, ev.verse_id, 'extras', 63184
  FROM _session253_2esd8_lookup sv, _session253_2esd8_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=8 AND sv.verse_number=47
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=8 AND ev.verse_number=49
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-8-paradise-tree-of-life-immortality',
       E'Paradise opened, the tree of life planted, the treasure of immortality',
       E'To the lowly the Most High names the inheritance laid up: *For to you is paradise opened, the tree of life is planted, the time to come is prepared, plenteousness is made ready, a city is builded, and rest is allowed, yes, perfect goodness and wisdom* (2 Esdras 8:52), *Sorrows are passed, and in the end is shewed the treasure of immortality* (2 Esdras 8:54). It ain''t new. Yahusha opened that paradise from the tree: *And Yahusha said unto him, Verily I say unto thee, To day shalt thou be with me in paradise* (Luke 23:43). The tree of life John saw restored — *the tree of life, which bare twelve manner of fruits, and yielded her fruit every month: and the leaves of the tree were for the healing of the nations* (Revelation 22:2) — and the city without sorrow: *and there shall be no more death, neither sorrow, nor crying, neither shall there be any more pain: for the former things are passed away* (Revelation 21:4). And the treasure of immortality the Besorah brings to light: *who hath abolished death, and hath brought life and immortality to light through the gospel* (2 Timothy 1:10). Every promise to the humble in Esdras is opened in the Messiah.',
       sv.verse_id, ev.verse_id, 'extras', 63187
  FROM _session253_2esd8_lookup sv, _session253_2esd8_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=8 AND sv.verse_number=52
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=8 AND ev.verse_number=54
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-8-shewn-to-thee-and-a-few-like-thee',
       E'These things shewed to thee, and a few like thee',
       E'The Most High reserves the secret of the last times for the faithful remnant: *These things have I not shewed to all men, but to you, and a few like you* (2 Esdras 8:62), *Behold, O Yahuah, now have you shewed me the multitude of the wonders, which you will begin to do in the last times: but at what time, you have not shewed me* (2 Esdras 8:63). It ain''t new — and it is not the church for Israel. The faithful few are the kept remnant of both houses, not a replacement: *For many are called, but few are chosen* (Matthew 22:14), and the saving is by election and grace, *not according to our works, but according to his own purpose and grace, which was given us in HaMashiach Yahusha before the world began* (2 Timothy 1:9). The mysteries of the last times are entrusted to the chosen few, as they always were.',
       sv.verse_id, ev.verse_id, 'extras', 63190
  FROM _session253_2esd8_lookup sv, _session253_2esd8_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=8 AND sv.verse_number=62
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=8 AND ev.verse_number=63
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-esdras-8-world-to-come-few-saved
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 7:13 — *Enter ye in at the strait gate: for wide is the gate, and broad is the way, that leadeth to destruction, and many there be which go in thereat:* Yahusha''s wide-and-narrow ways are Esdras''s world-for-many and world-to-come-for-few.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd8_lookup sv, _session253_2esd8_lookup tv
 WHERE t.slug='2-esdras-8-world-to-come-few-saved'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=8 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 22:14 — *For many are called, but few are chosen.* The Messiah''s epigram says in one line what 2 Esdras 8:3 says of the many created but the few saved.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd8_lookup sv, _session253_2esd8_lookup tv
 WHERE t.slug='2-esdras-8-world-to-come-few-saved'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=8 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=22 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 65:17 — *For, behold, I create new heavens and a new earth: and the former shall not be remembered, nor come into mind.* The age Esdras calls ''the world to come'' is Isaiah''s new heavens and new earth.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd8_lookup sv, _session253_2esd8_lookup tv
 WHERE t.slug='2-esdras-8-world-to-come-few-saved'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=8 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=65 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-8-fashioned-in-the-womb-nurtured-in-the-law
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 139:13 — *For thou hast possessed my reins: thou hast covered me in my mother’s womb.* David''s covering in the womb is Esdras''s creature fashioned and preserved nine months in the mother''s womb.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd8_lookup sv, _session253_2esd8_lookup tv
 WHERE t.slug='2-esdras-8-fashioned-in-the-womb-nurtured-in-the-law'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=8 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=139 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 139:14 — *I will praise thee; for I am fearfully and wonderfully made: marvellous are thy works; and that my soul knoweth right well.* The fearful, wonderful making of the body answers the great labour with which 2 Esdras 8:8 says the creature is fashioned.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd8_lookup sv, _session253_2esd8_lookup tv
 WHERE t.slug='2-esdras-8-fashioned-in-the-womb-nurtured-in-the-law'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=8 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=139 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-8-no-man-but-hath-sinned-mercy-without-works
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Romans 3:23 — *For all have sinned, and come short of the glory of Elohim (God);* Sha''ul''s verdict is Esdras''s — no man born but he hath sinned, none of the faithful but hath done amiss.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd8_lookup sv, _session253_2esd8_lookup tv
 WHERE t.slug='2-esdras-8-no-man-but-hath-sinned-mercy-without-works'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=8 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=3 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ecclesiastes 7:20 — *For there is not a just man upon earth, that doeth good, and sinneth not.* The Preacher''s ''not a just man upon earth'' is precisely 2 Esdras 8:35''s ''no man... but he has dealt wickedly.'''
  FROM cross_reference_threads t, cross_references x, _session253_2esd8_lookup sv, _session253_2esd8_lookup tv
 WHERE t.slug='2-esdras-8-no-man-but-hath-sinned-mercy-without-works'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=8 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=7 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 143:2 — *And enter not into judgment with thy servant: for in thy sight shall no man living be justified.* David, like Esdras in 8:32, flees judgment-by-works and pleads to be counted among those who have no works of righteousness but mercy.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd8_lookup sv, _session253_2esd8_lookup tv
 WHERE t.slug='2-esdras-8-no-man-but-hath-sinned-mercy-without-works'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=8 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=143 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-8-humbled-thyself-justified
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Luke 18:13 — *And the publican, standing afar off, would not lift up so much as his eyes unto heaven, but smote upon his breast, saying, Elohim (God) be merciful to me a sinner.* The publican who dares not be glorified is the very humility for which Esdras is commended in 8:49.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd8_lookup sv, _session253_2esd8_lookup tv
 WHERE t.slug='2-esdras-8-humbled-thyself-justified'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=8 AND sv.verse_number=49
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=18 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Luke 18:14 — *I tell you, this man went down to his house justified rather than the other: for every one that exalteth himself shall be abased; and he that humbleth himself shall be exalted.* Yahusha''s rule — the humble exalted — is why Esdras''s not-judging-himself-worthy is commended above all in 8:49.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd8_lookup sv, _session253_2esd8_lookup tv
 WHERE t.slug='2-esdras-8-humbled-thyself-justified'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=8 AND sv.verse_number=49
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=18 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-8-paradise-tree-of-life-immortality
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Luke 23:43 — *And Yahusha (Jesus) said unto him, Verily I say unto thee, To day shalt thou be with me in paradise.* The paradise Esdras says is ''opened'' to the lowly is the paradise the Messiah opens from the tree to the thief in 8:52.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd8_lookup sv, _session253_2esd8_lookup tv
 WHERE t.slug='2-esdras-8-paradise-tree-of-life-immortality'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=8 AND sv.verse_number=52
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=23 AND tv.verse_number=43
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 22:2 — *In the midst of the street of it, and on either side of the river, was there the tree of life, which bare twelve manner of fruits, and yielded her fruit every month: and the leaves of the tree were for the healing of the nations.* John sees planted in the builded city the very tree of life Esdras names in 8:52.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd8_lookup sv, _session253_2esd8_lookup tv
 WHERE t.slug='2-esdras-8-paradise-tree-of-life-immortality'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=8 AND sv.verse_number=52
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 21:4 — *And Elohim (God) shall wipe away all tears from their eyes; and there shall be no more death, neither sorrow, nor crying, neither shall there be any more pain: for the former things are passed away.* The passing of sorrows in 2 Esdras 8:54 is John''s wiping away of all tears.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd8_lookup sv, _session253_2esd8_lookup tv
 WHERE t.slug='2-esdras-8-paradise-tree-of-life-immortality'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=8 AND sv.verse_number=54
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Timothy 1:10 — *But is now made manifest by the appearing of our Saviour Yahusha HaMashiach (Jesus Christ), who hath abolished death, and hath brought life and immortality to light through the gospel:* The ''treasure of immortality'' shewed in the end (8:54) is brought to light through the Besorah.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd8_lookup sv, _session253_2esd8_lookup tv
 WHERE t.slug='2-esdras-8-paradise-tree-of-life-immortality'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=8 AND sv.verse_number=54
   AND tv.edition_slug='canon' AND tv.book_slug='2-timothy' AND tv.chapter_number=1 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-8-shewn-to-thee-and-a-few-like-thee
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 22:14 — *For many are called, but few are chosen.* The ''few like you'' to whom alone these things are shewed (8:62) are the chosen few of the Messiah''s word.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd8_lookup sv, _session253_2esd8_lookup tv
 WHERE t.slug='2-esdras-8-shewn-to-thee-and-a-few-like-thee'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=8 AND sv.verse_number=62
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=22 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Timothy 1:9 — *Who hath saved us, and called us with an holy calling, not according to our works, but according to his own purpose and grace, which was given us in HaMashiach Yahusha (Christ Jesus) before the world began,* The few to whom the wonders are shewn in 8:62 are kept by purpose and grace, election before works.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd8_lookup sv, _session253_2esd8_lookup tv
 WHERE t.slug='2-esdras-8-shewn-to-thee-and-a-few-like-thee'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=8 AND sv.verse_number=62
   AND tv.edition_slug='canon' AND tv.book_slug='2-timothy' AND tv.chapter_number=1 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2esdras_09.sql (session253 2-esdras 9) -----
-- Source anchor: apocrypha/2-esdras ch9. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2esd9 (view _session253_2esd9_lookup). Sort band base 63200, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2esd9_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-esdras-9-signs-of-the-end
  ('apocrypha', '2-esdras', 9, 3, 'canon', 'matthew', 24, 7, 'free', E'Matthew 24:7 — *For nation shall rise against nation, and kingdom against kingdom: and there shall be famines, and pestilences, and earthquakes, in divers places.* The earthquakes and uproars of the peoples that mark Ezra''s hour are the very birth-pangs Yahusha names before the visitation of 2 Esdras 9:3.'),
  ('apocrypha', '2-esdras', 9, 2, 'canon', 'matthew', 24, 14, 'free', E'Matthew 24:14 — *And this gospel of the kingdom shall be preached in all the world for a witness unto all nations; and then shall the end come.* As the Highest will *begin to visit the world* once the signs are read, so the end comes only after the witness is borne in 2 Esdras 9:2.'),
  ('apocrypha', '2-esdras', 9, 5, 'canon', 'daniel', 12, 1, 'free', E'Daniel 12:1 — *And at that time shall Michael stand up, the great prince which standeth for the children of thy people: and there shall be a time of trouble, such as never was since there was a nation even to that same time: and at that time thy people shall be delivered, every one that shall be found written in the book.* The manifest end with its plain beginning and ending of 2 Esdras 9:5 is Daniel''s time of trouble whose deliverance is for the written remnant.'),
  -- thread: 2-esdras-9-saved-by-works-and-faith
  ('apocrypha', '2-esdras', 9, 7, 'canon', 'matthew', 7, 14, 'free', E'Matthew 7:14 — *Because strait is the gate, and narrow is the way, which leadeth unto life, and few there be that find it.* The few who *escape by his works, and by faith* in 2 Esdras 9:7 are the few that find the narrow way to life.'),
  ('apocrypha', '2-esdras', 9, 7, 'canon', 'matthew', 7, 21, 'free', E'Matthew 7:21 — *Not every one that saith unto me, Yahuah (Lord), Yahuah (Lord), shall enter into the kingdom of heaven; but he that doeth the will of my Father which is in heaven.* Ezra''s salvation *by his works, and by faith* is Yahusha''s doer of the Father''s will, not the mere confessor, in 2 Esdras 9:7.'),
  ('apocrypha', '2-esdras', 9, 8, 'canon', 'james', 2, 17, 'free', E'James 2:17 — *Even so faith, if it hath not works, is dead, being alone.* The very pairing Ezra makes — escape *by his works, and by faith* — is James''s living faith that bears works, in 2 Esdras 9:8.'),
  -- thread: 2-esdras-9-torment-after-death
  ('apocrypha', '2-esdras', 9, 12, 'canon', 'luke', 16, 23, 'free', E'Luke 16:23 — *And in hell he lift up his eyes, being in torments, and seeth Abraham afar off, and Lazarus in his bosom.* Those who despised the law and *must know it after death by pain* in 2 Esdras 9:12 are the rich man lifting up his eyes in torment.'),
  ('apocrypha', '2-esdras', 9, 11, 'canon', 'luke', 16, 25, 'free', E'Luke 16:25 — *But Abraham said, Son, remember that thou in thy lifetime receivedst thy good things, and likewise Lazarus evil things: but now he is comforted, and thou art tormented.* Ezra''s ones who had *liberty* and *place of repentance* yet despised it are Abraham''s son who had his good things in his lifetime, in 2 Esdras 9:11.'),
  ('apocrypha', '2-esdras', 9, 9, 'canon', 'daniel', 12, 2, 'free', E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The pitiful case of those who abused His ways and *dwell in torments* in 2 Esdras 9:9 is Daniel''s waking to shame and everlasting contempt.'),
  -- thread: 2-esdras-9-grape-of-the-cluster
  ('apocrypha', '2-esdras', 9, 21, 'canon', 'isaiah', 5, 7, 'free', E'Isaiah 5:7 — *For the vineyard of Yahuah Tseva''ot (LORD of hosts) is the house of Yashar''el (Israel), and the men of Yahudah (Judah) his pleasant plant: and he looked for judgment, but behold oppression; for righteousness, but behold a cry.* The *plant of a great people* kept in 2 Esdras 9:21 is Isaiah''s pleasant plant, the two houses of Yashar''el and Yahudah.'),
  ('apocrypha', '2-esdras', 9, 21, 'canon', 'isaiah', 5, 2, 'free', E'Isaiah 5:2 — *And he fenced it, and gathered out the stones thereof, and planted it with the choicest vine, and built a tower in the midst of it, and also made a winepress therein: and he looked that it should bring forth grapes, and it brought forth wild grapes.* The Holy One who *kept me a grape of the cluster* in 2 Esdras 9:21 is the husbandman of Isaiah''s vineyard who sought His grapes.'),
  ('apocrypha', '2-esdras', 9, 22, 'canon', 'romans', 11, 5, 'free', E'Romans 11:5 — *Even so then at this present time also there is a remnant according to the election of grace.* The grape kept while the multitude perishes in 2 Esdras 9:22 is Sha''ul''s remnant according to the election of grace.'),
  ('apocrypha', '2-esdras', 9, 22, 'canon', 'romans', 11, 1, 'free', E'Romans 11:1 — *I say then, Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham, of the tribe of Benjamin.* The perishing of the multitude in 2 Esdras 9:22 is not Israel cast away, for the grape — the elect remnant — is kept.'),
  -- thread: 2-esdras-9-law-sown-perishes-not
  ('apocrypha', '2-esdras', 9, 31, 'canon', 'matthew', 13, 8, 'free', E'Matthew 13:8 — *But other fell into good ground, and brought forth fruit, some an hundredfold, some sixtyfold, some thirtyfold.* The law that the Holy One says He will *sow in you, and it shall bring fruit* in 2 Esdras 9:31 is the seed that bears fruit in the good ground of Yahusha''s parable.'),
  ('apocrypha', '2-esdras', 9, 31, 'canon', 'jeremiah', 31, 33, 'free', E'Jeremiah 31:33 — *But this shall be the covenant that I will make with the house of Yashar''el (Israel); After those days, saith Yahuah (LORD), I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people.* The law *sown in you* that brings fruit forever in 2 Esdras 9:31 is the same law written upon the inward parts in the new covenant.'),
  ('apocrypha', '2-esdras', 9, 37, 'canon', 'hebrews', 8, 10, 'free', E'Hebrews 8:10 — *For this is the covenant that I will make with the house of Yashar''el (Israel) after those days, saith Yahuah (Lord); I will put my laws into their mind, and write them in their hearts: and I will be to them a Elohim (God), and they shall be to me a people:* That the law *perishes not, but remains in his force* in 2 Esdras 9:37 is confirmed where the covenant writes the same law on mind and heart.'),
  -- thread: 2-esdras-9-barren-woman-mourns
  ('apocrypha', '2-esdras', 9, 45, 'canon', '1-samuel', 1, 11, 'free', E'1 Samuel 1:11 — *And she vowed a vow, and said, O Yahuah Tseva''ot (LORD of hosts), if thou wilt indeed look on the affliction of thine handmaid, and remember me, and not forget thine handmaid, but wilt give unto thine handmaid a man child, then I will give him unto Yahuah (LORD) all the days of his life, and there shall no razor come upon his head.* The handmaid whom *Yahuah heard* and gave a son after thirty years of prayer in 2 Esdras 9:45 is Hannah, who vowed and was remembered.'),
  ('apocrypha', '2-esdras', 9, 44, 'canon', '1-samuel', 1, 10, 'free', E'1 Samuel 1:10 — *And she was in bitterness of soul, and prayed unto Yahuah (LORD), and wept sore.* The woman who did nothing *but make my prayer to the Highest* day and night in 2 Esdras 9:44 is Hannah in bitterness of soul, weeping sore at Shiloh.'),
  ('apocrypha', '2-esdras', 9, 43, 'canon', 'isaiah', 54, 1, 'free', E'Isaiah 54:1 — *Sing, O barren, thou that didst not bear; break forth into singing, and cry aloud, thou that didst not travail with child: for more are the children of the desolate than the children of the married wife, saith Yahuah (LORD).* The barren one who *had no child* in 2 Esdras 9:43 is the desolate Tziyon bidden to sing, for her children shall outnumber the married wife''s.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2esd9_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2esd9_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-9-signs-of-the-end',
       E'Measure the time: the signs of the end',
       E'The messenger bids Ezra read the season by its signs: *Measure you the time diligently in itself: and when you see part of the signs past, which I have told you before,* *Then shall you understand, that it is the very same time, in which the Highest will begin to visit the world which he made.* *Therefore when there shall be seen earthquakes and uproars of the people in the world:* It ain''t new — Yahusha gives the same birth-pangs on Olivet: *For nation shall rise against nation, and kingdom against kingdom: and there shall be famines, and pestilences, and earthquakes, in divers places.* (Matthew 24:7), and the appointed end follows the witness: *And this gospel of the kingdom shall be preached in all the world for a witness unto all nations; and then shall the end come.* (Matthew 24:14). Daniel set the same hour of trouble and deliverance: *And at that time shall Michael stand up, the great prince which standeth for the children of thy people: and there shall be a time of trouble, such as never was since there was a nation even to that same time: and at that time thy people shall be delivered, every one that shall be found written in the book.* (Daniel 12:1).',
       sv.verse_id, ev.verse_id, 'extras', 63200
  FROM _session253_2esd9_lookup sv, _session253_2esd9_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=9 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=9 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-9-saved-by-works-and-faith',
       E'Saved by his works and by faith: the narrow way',
       E'The salvation is for the doer who trusts: *And every one that shall be saved, and shall be able to escape by his works, and by faith, by which you have believed,* *Shall be preserved from the said perils, and shall see my salvation in my land, and within my borders: for I have sanctified them for me from the beginning.* This is no law-as-curse — it is the same Torah-keeping faith Yahusha sets at the strait gate: *Because strait is the gate, and narrow is the way, which leadeth unto life, and few there be that find it.* (Matthew 7:14), and *Not every one that saith unto me, Yahuah (Lord), Yahuah (Lord), shall enter into the kingdom of heaven; but he that doeth the will of my Father which is in heaven.* (Matthew 7:21). James holds Ezra''s same wedding of works and faith: *Even so faith, if it hath not works, is dead, being alone.* (James 2:17).',
       sv.verse_id, ev.verse_id, 'extras', 63203
  FROM _session253_2esd9_lookup sv, _session253_2esd9_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=9 AND sv.verse_number=7
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=9 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-9-torment-after-death',
       E'They knew Him not: torment after death',
       E'Those who spurned the open door of repentance reap pain beyond the grave: *And they that have loathed my law, while they had yet liberty, and, when as yet place of repentance was open to them, understood not, but despised it;* *The same must know it after death by pain.* Yahusha paints that same torment in the rich man who slighted Moses and the prophets: *And in hell he lift up his eyes, being in torments, and seeth Abraham afar off, and Lazarus in his bosom.* (Luke 16:23) — *But Abraham said, Son, remember that thou in thy lifetime receivedst thy good things, and likewise Lazarus evil things: but now he is comforted, and thou art tormented.* (Luke 16:25). Daniel divides the risen dead the same way: *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* (Daniel 12:2).',
       sv.verse_id, ev.verse_id, 'extras', 63206
  FROM _session253_2esd9_lookup sv, _session253_2esd9_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=9 AND sv.verse_number=9
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=9 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-9-grape-of-the-cluster',
       E'A grape of the cluster kept: the remnant of the great people',
       E'Though the multitude perish, the Holy One preserves a seed: *And I saw, and spared it greatly, and have kept me a grape of the cluster, and a plant of a great people.* *Let the multitude perish then, which was born in vain; and let my grape be kept, and my plant; for with great labour have I made it perfect.* This is the vineyard of Yahuah — His own house, not a church replacing it: *And he fenced it, and gathered out the stones thereof, and planted it with the choicest vine...* (Isaiah 5:2) — *For the vineyard of Yahuah Tseva''ot (LORD of hosts) is the house of Yashar''el (Israel), and the men of Yahudah (Judah) his pleasant plant...* (Isaiah 5:7). Sha''ul keeps Ezra''s grape as the remnant that is never cast away: *I say then, Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham, of the tribe of Benjamin.* (Romans 11:1) — *Even so then at this present time also there is a remnant according to the election of grace.* (Romans 11:5). The unfaithful generation forfeits; the faithful remnant of both houses keeps the inheritance.',
       sv.verse_id, ev.verse_id, 'extras', 63209
  FROM _session253_2esd9_lookup sv, _session253_2esd9_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=9 AND sv.verse_number=21
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=9 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-9-law-sown-perishes-not',
       E'I sow my law in you: the seed that perishes not',
       E'Ezra pleads the covenant at Sinai, the law sown into Israel: *And you spakest saying, Hear me, O Yashar''el (Israel); and mark my words, you seed of Jacob.* *For, behold, I sow my law in you, and it shall bring fruit in you, and you shall be honoured in it for ever.* Though the fathers kept it not, the law itself cannot perish: *Notwithstanding the law perishes not, but remains in his force.* It ain''t new — Yahusha''s sower casts the same seed that bears fruit in good ground: *But other fell into good ground, and brought forth fruit, some an hundredfold, some sixtyfold, some thirtyfold.* (Matthew 13:8). And the law Ezra says is *sown in you* is the very law of the new covenant written within: *But this shall be the covenant that I will make with the house of Yashar''el (Israel)... I will put my law in their inward parts, and write it in their hearts...* (Jeremiah 31:33), echoed in *I will put my laws into their mind, and write them in their hearts...* (Hebrews 8:10). Torah stands and remains in force.',
       sv.verse_id, ev.verse_id, 'extras', 63212
  FROM _session253_2esd9_lookup sv, _session253_2esd9_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=9 AND sv.verse_number=31
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=9 AND ev.verse_number=37
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-9-barren-woman-mourns',
       E'The barren woman who bore a son: from grief to glory',
       E'Ezra turns to a woman in deep mourning, who tells her story: *I your servant have been barren, and had no child, though I had an husband thirty years,* *And those thirty years I did nothing else day and night, and every hour, but make my, prayer to the Highest.* *After thirty years Yahuah (God) heard me yours handmaid, looked upon my misery, considered my trouble, and gave me a son...* Her barrenness-turned-fruitfulness is Hannah''s, who wept and vowed at Shiloh: *And she was in bitterness of soul, and prayed unto Yahuah (LORD), and wept sore.* (1 Samuel 1:10) — *And she vowed a vow, and said, O Yahuah Tseva''ot (LORD of hosts), if thou wilt indeed look on the affliction of thine handmaid, and remember me, and not forget thine handmaid, but wilt give unto thine handmaid a man child...* (1 Samuel 1:11). And the woman is figure of desolate Tziyon, bidden to sing: *Sing, O barren, thou that didst not bear; break forth into singing, and cry aloud, thou that didst not travail with child: for more are the children of the desolate than the children of the married wife, saith Yahuah (LORD).* (Isaiah 54:1).',
       sv.verse_id, ev.verse_id, 'extras', 63215
  FROM _session253_2esd9_lookup sv, _session253_2esd9_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=9 AND sv.verse_number=38
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=9 AND ev.verse_number=47
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-esdras-9-signs-of-the-end
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 24:7 — *For nation shall rise against nation, and kingdom against kingdom: and there shall be famines, and pestilences, and earthquakes, in divers places.* The earthquakes and uproars of the peoples that mark Ezra''s hour are the very birth-pangs Yahusha names before the visitation of 2 Esdras 9:3.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd9_lookup sv, _session253_2esd9_lookup tv
 WHERE t.slug='2-esdras-9-signs-of-the-end'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=9 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 24:14 — *And this gospel of the kingdom shall be preached in all the world for a witness unto all nations; and then shall the end come.* As the Highest will *begin to visit the world* once the signs are read, so the end comes only after the witness is borne in 2 Esdras 9:2.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd9_lookup sv, _session253_2esd9_lookup tv
 WHERE t.slug='2-esdras-9-signs-of-the-end'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=9 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 12:1 — *And at that time shall Michael stand up, the great prince which standeth for the children of thy people: and there shall be a time of trouble, such as never was since there was a nation even to that same time: and at that time thy people shall be delivered, every one that shall be found written in the book.* The manifest end with its plain beginning and ending of 2 Esdras 9:5 is Daniel''s time of trouble whose deliverance is for the written remnant.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd9_lookup sv, _session253_2esd9_lookup tv
 WHERE t.slug='2-esdras-9-signs-of-the-end'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=9 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-9-saved-by-works-and-faith
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 7:14 — *Because strait is the gate, and narrow is the way, which leadeth unto life, and few there be that find it.* The few who *escape by his works, and by faith* in 2 Esdras 9:7 are the few that find the narrow way to life.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd9_lookup sv, _session253_2esd9_lookup tv
 WHERE t.slug='2-esdras-9-saved-by-works-and-faith'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=9 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 7:21 — *Not every one that saith unto me, Yahuah (Lord), Yahuah (Lord), shall enter into the kingdom of heaven; but he that doeth the will of my Father which is in heaven.* Ezra''s salvation *by his works, and by faith* is Yahusha''s doer of the Father''s will, not the mere confessor, in 2 Esdras 9:7.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd9_lookup sv, _session253_2esd9_lookup tv
 WHERE t.slug='2-esdras-9-saved-by-works-and-faith'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=9 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'James 2:17 — *Even so faith, if it hath not works, is dead, being alone.* The very pairing Ezra makes — escape *by his works, and by faith* — is James''s living faith that bears works, in 2 Esdras 9:8.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd9_lookup sv, _session253_2esd9_lookup tv
 WHERE t.slug='2-esdras-9-saved-by-works-and-faith'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=9 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=2 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-9-torment-after-death
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Luke 16:23 — *And in hell he lift up his eyes, being in torments, and seeth Abraham afar off, and Lazarus in his bosom.* Those who despised the law and *must know it after death by pain* in 2 Esdras 9:12 are the rich man lifting up his eyes in torment.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd9_lookup sv, _session253_2esd9_lookup tv
 WHERE t.slug='2-esdras-9-torment-after-death'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=9 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=16 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Luke 16:25 — *But Abraham said, Son, remember that thou in thy lifetime receivedst thy good things, and likewise Lazarus evil things: but now he is comforted, and thou art tormented.* Ezra''s ones who had *liberty* and *place of repentance* yet despised it are Abraham''s son who had his good things in his lifetime, in 2 Esdras 9:11.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd9_lookup sv, _session253_2esd9_lookup tv
 WHERE t.slug='2-esdras-9-torment-after-death'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=9 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=16 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The pitiful case of those who abused His ways and *dwell in torments* in 2 Esdras 9:9 is Daniel''s waking to shame and everlasting contempt.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd9_lookup sv, _session253_2esd9_lookup tv
 WHERE t.slug='2-esdras-9-torment-after-death'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=9 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-9-grape-of-the-cluster
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 5:7 — *For the vineyard of Yahuah Tseva''ot (LORD of hosts) is the house of Yashar''el (Israel), and the men of Yahudah (Judah) his pleasant plant: and he looked for judgment, but behold oppression; for righteousness, but behold a cry.* The *plant of a great people* kept in 2 Esdras 9:21 is Isaiah''s pleasant plant, the two houses of Yashar''el and Yahudah.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd9_lookup sv, _session253_2esd9_lookup tv
 WHERE t.slug='2-esdras-9-grape-of-the-cluster'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=9 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=5 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 5:2 — *And he fenced it, and gathered out the stones thereof, and planted it with the choicest vine, and built a tower in the midst of it, and also made a winepress therein: and he looked that it should bring forth grapes, and it brought forth wild grapes.* The Holy One who *kept me a grape of the cluster* in 2 Esdras 9:21 is the husbandman of Isaiah''s vineyard who sought His grapes.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd9_lookup sv, _session253_2esd9_lookup tv
 WHERE t.slug='2-esdras-9-grape-of-the-cluster'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=9 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=5 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 11:5 — *Even so then at this present time also there is a remnant according to the election of grace.* The grape kept while the multitude perishes in 2 Esdras 9:22 is Sha''ul''s remnant according to the election of grace.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd9_lookup sv, _session253_2esd9_lookup tv
 WHERE t.slug='2-esdras-9-grape-of-the-cluster'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=9 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 11:1 — *I say then, Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham, of the tribe of Benjamin.* The perishing of the multitude in 2 Esdras 9:22 is not Israel cast away, for the grape — the elect remnant — is kept.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd9_lookup sv, _session253_2esd9_lookup tv
 WHERE t.slug='2-esdras-9-grape-of-the-cluster'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=9 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-9-law-sown-perishes-not
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 13:8 — *But other fell into good ground, and brought forth fruit, some an hundredfold, some sixtyfold, some thirtyfold.* The law that the Holy One says He will *sow in you, and it shall bring fruit* in 2 Esdras 9:31 is the seed that bears fruit in the good ground of Yahusha''s parable.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd9_lookup sv, _session253_2esd9_lookup tv
 WHERE t.slug='2-esdras-9-law-sown-perishes-not'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=9 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=13 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 31:33 — *But this shall be the covenant that I will make with the house of Yashar''el (Israel); After those days, saith Yahuah (LORD), I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people.* The law *sown in you* that brings fruit forever in 2 Esdras 9:31 is the same law written upon the inward parts in the new covenant.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd9_lookup sv, _session253_2esd9_lookup tv
 WHERE t.slug='2-esdras-9-law-sown-perishes-not'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=9 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 8:10 — *For this is the covenant that I will make with the house of Yashar''el (Israel) after those days, saith Yahuah (Lord); I will put my laws into their mind, and write them in their hearts: and I will be to them a Elohim (God), and they shall be to me a people:* That the law *perishes not, but remains in his force* in 2 Esdras 9:37 is confirmed where the covenant writes the same law on mind and heart.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd9_lookup sv, _session253_2esd9_lookup tv
 WHERE t.slug='2-esdras-9-law-sown-perishes-not'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=9 AND sv.verse_number=37
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=8 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-9-barren-woman-mourns
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Samuel 1:11 — *And she vowed a vow, and said, O Yahuah Tseva''ot (LORD of hosts), if thou wilt indeed look on the affliction of thine handmaid, and remember me, and not forget thine handmaid, but wilt give unto thine handmaid a man child, then I will give him unto Yahuah (LORD) all the days of his life, and there shall no razor come upon his head.* The handmaid whom *Yahuah heard* and gave a son after thirty years of prayer in 2 Esdras 9:45 is Hannah, who vowed and was remembered.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd9_lookup sv, _session253_2esd9_lookup tv
 WHERE t.slug='2-esdras-9-barren-woman-mourns'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=9 AND sv.verse_number=45
   AND tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=1 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Samuel 1:10 — *And she was in bitterness of soul, and prayed unto Yahuah (LORD), and wept sore.* The woman who did nothing *but make my prayer to the Highest* day and night in 2 Esdras 9:44 is Hannah in bitterness of soul, weeping sore at Shiloh.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd9_lookup sv, _session253_2esd9_lookup tv
 WHERE t.slug='2-esdras-9-barren-woman-mourns'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=9 AND sv.verse_number=44
   AND tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=1 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 54:1 — *Sing, O barren, thou that didst not bear; break forth into singing, and cry aloud, thou that didst not travail with child: for more are the children of the desolate than the children of the married wife, saith Yahuah (LORD).* The barren one who *had no child* in 2 Esdras 9:43 is the desolate Tziyon bidden to sing, for her children shall outnumber the married wife''s.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd9_lookup sv, _session253_2esd9_lookup tv
 WHERE t.slug='2-esdras-9-barren-woman-mourns'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=9 AND sv.verse_number=43
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=54 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2esdras_10.sql (session253 2-esdras 10) -----
-- Source anchor: apocrypha/2-esdras ch10. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2esd10 (view _session253_2esd10_lookup). Sort band base 63225, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2esd10_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-esdras-10-zion-laid-waste
  ('apocrypha', '2-esdras', 10, 22, 'canon', 'lamentations', 1, 1, 'free', E'Lamentations 1:1 — *How doth the city sit solitary, that was full of people! how is she become as a widow! she that was great among the nations, and princess among the provinces, how is she become tributary!* The widowed solitary city is the very desolation Ezra catalogues in 2 Esdras 10:22.'),
  ('apocrypha', '2-esdras', 10, 22, 'canon', 'lamentations', 2, 6, 'free', E'Lamentations 2:6 — *And he hath violently taken away his tabernacle, as if it were of a garden: he hath destroyed his places of the assembly: Yahuah (LORD) hath caused the solemn feasts and sabbaths to be forgotten in Zion, and hath despised in the indignation of his anger the king and the priest.* The silenced song and put-out candlestick of 2 Esdras 10:22 is Jeremiah''s forgotten feasts and silenced assembly of Zion.'),
  ('apocrypha', '2-esdras', 10, 23, 'canon', 'psalms', 137, 4, 'free', E'Psalm 137:4 — *How shall we sing the LORD’S song in a strange land?* Ezra''s grounded psaltery and silenced song in 2 Esdras 10:23 is the exile''s hung-up harp by the rivers of Babylon.'),
  -- thread: 2-esdras-10-receive-thy-son-be-comforted
  ('apocrypha', '2-esdras', 10, 16, 'canon', 'isaiah', 66, 13, 'free', E'Isaiah 66:13 — *As one whom his mother comforteth, so will I comfort you; and ye shall be comforted in Jerusalem.* Ezra''s counsel that she shall receive her son and be commended (2 Esdras 10:16) is the LORD''s own comfort, mother-tender, gathered up in Jerusalem.'),
  ('apocrypha', '2-esdras', 10, 24, 'canon', 'revelation', 21, 4, 'free', E'Revelation 21:4 — *And Elohim (God) shall wipe away all tears from their eyes; and there shall be no more death, neither sorrow, nor crying, neither shall there be any more pain: for the former things are passed away.* The rest and ease from labour the Highest gives the mourner in 2 Esdras 10:24 is the final wiping-away of every tear in the New Jerusalem.'),
  -- thread: 2-esdras-10-woman-becomes-builded-city
  ('apocrypha', '2-esdras', 10, 27, 'canon', 'revelation', 21, 2, 'free', E'Revelation 21:2 — *And I John saw the holy city, new Jerusalem, coming down from Elohim (God) out of heaven, prepared as a bride adorned for her husband.* The city builded that shews itself from the foundations in 2 Esdras 10:27 is John''s holy city descending as a bride.'),
  ('apocrypha', '2-esdras', 10, 27, 'canon', 'revelation', 21, 9, 'free', E'Revelation 21:9 — *And there came unto me one of the seven angels which had the seven vials full of the seven last plagues, and talked with me, saying, Come hither, I will shew thee the bride, the Lamb’s wife.* The angel-guided vision of the woman-become-city in 2 Esdras 10:27 matches the angel who shews John the bride who is the city.'),
  ('apocrypha', '2-esdras', 10, 25, 'canon', 'galatians', 4, 26, 'free', E'Galatians 4:26 — *But Jerusalem which is above is free, which is the mother of us all.* The mourning mother whose face shines and is unveiled as a city (2 Esdras 10:25) is Paul''s Jerusalem above, the mother of us all.'),
  -- thread: 2-esdras-10-this-woman-is-sion
  ('apocrypha', '2-esdras', 10, 50, 'canon', 'revelation', 21, 11, 'free', E'Revelation 21:11 — *Having the glory of Elohim (God): and her light was like unto a stone most precious, even like a jasper stone, clear as crystal;* The brightness of her glory and comeliness of her beauty shewn Ezra in 2 Esdras 10:50 is the jasper-clear glory of John''s holy city.'),
  ('apocrypha', '2-esdras', 10, 44, 'canon', 'hebrews', 12, 22, 'free', E'Hebrews 12:22 — *But ye are come unto mount Sion, and unto the city of the living Elohim (God), the heavenly Jerusalem, and to an innumerable company of angels,* The woman who is Sion in 2 Esdras 10:44 is the heavenly Jerusalem the faithful are come unto in Hebrews.'),
  ('apocrypha', '2-esdras', 10, 50, 'apocrypha', 'tobit', 13, 16, 'extras', E'Tobit 13:16 — *For Jerusalem shall be built up with sapphires and emeralds, and precious stone: your walls and towers and battlements with pure gold.* The comeliness of the city''s beauty shewn Ezra in 2 Esdras 10:50 is Tobit''s own jeweled, rebuilt Jerusalem — the deuterocanon self-witnessing the New Jerusalem.'),
  -- thread: 2-esdras-10-barren-bears-zion-travails
  ('apocrypha', '2-esdras', 10, 46, 'canon', 'isaiah', 54, 1, 'free', E'Isaiah 54:1 — *Sing, O barren, thou that didst not bear; break forth into singing, and cry aloud, thou that didst not travail with child: for more are the children of the desolate than the children of the married wife, saith Yahuah (LORD).* The barren who at last bare a son in 2 Esdras 10:46 is Isaiah''s barren Zion whose children outnumber the married wife''s.'),
  ('apocrypha', '2-esdras', 10, 46, 'canon', 'galatians', 4, 27, 'free', E'Galatians 4:27 — *For it is written, Rejoice, thou barren that bearest not; break forth and cry, thou that travailest not: for the desolate hath many more children than she which hath an husband.* Paul reads the barren-who-bears, the same figure as Sion in 2 Esdras 10:46, as the Jerusalem above bringing forth her children.'),
  ('apocrypha', '2-esdras', 10, 45, 'canon', 'isaiah', 66, 8, 'free', E'Isaiah 66:8 — *Who hath heard such a thing? who hath seen such things? Shall the earth be made to bring forth in one day? or shall a nation be born at once? for as soon as Zion travailed, she brought forth her children.* The barren Sion who bears in 2 Esdras 10:45 is Isaiah''s Zion who travails and brings forth a nation at once.'),
  -- thread: 2-esdras-10-city-no-mans-building
  ('apocrypha', '2-esdras', 10, 54, 'canon', 'hebrews', 11, 10, 'free', E'Hebrews 11:10 — *For he looked for a city which hath foundations, whose builder and maker is Elohim (God).* The city no man''s building can stand in, shewn only by the Highest (2 Esdras 10:54), is the city with foundations whose builder and maker is Elohim that Abraham awaited.'),
  ('apocrypha', '2-esdras', 10, 53, 'apocrypha', 'baruch-with-the-letter-of-jeremiah', 5, 1, 'extras', E'Baruch 5:1 — *Put off, O Jerusalem, the garment of mourning and affliction, and put on the comeliness of the glory that comes from Yahuah (God) for ever.* The empty field where the Highest begins to shew his city (2 Esdras 10:53) is Baruch''s Jerusalem stripping off mourning for the glory that comes from Yahuah for ever — the deuterocanon''s own grief-to-glory turn.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2esd10_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2esd10_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-10-zion-laid-waste',
       E'Our sanctuary laid waste — the city that sits solitary',
       E'Ezra would have the mourning mother lift her eyes off a single dead son to a grief far greater: *Our psaltery is laid on the ground, our song is put to silence, our rejoicing is at an end, the light of our candlestick is put out, the ark of our covenant is spoiled, our holy things are defiled... and the name that is called upon us is almost profaned* (2 Esdras 10:22), *the seal of Sion has now lost her honour; for she is delivered into the hands of them that hate us* (2 Esdras 10:23). It is the lament of the fallen city that Jeremiah wept before him — *How doth the city sit solitary, that was full of people! how is she become as a widow!* (Lamentations 1:1) — and the silenced feasts of Zion: *Yahuah (LORD) hath caused the solemn feasts and sabbaths to be forgotten in Zion* (Lamentations 2:6). By Babylon''s rivers the same harps hung silent: *How shall we sing the LORD’S song in a strange land?* (Psalm 137:4). It ain''t new — the daughter of Zion''s mourning is one mourning across the whole library.',
       sv.verse_id, ev.verse_id, 'extras', 63225
  FROM _session253_2esd10_lookup sv, _session253_2esd10_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=10 AND sv.verse_number=21
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=10 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-10-receive-thy-son-be-comforted',
       E'Keep thy sorrow — thou shalt receive thy son, and be comforted',
       E'To the woman who would die mourning, Ezra speaks the gospel of the resurrection and of comfort: *For if you shall acknowledge the determination of Yahuah (God) to be just, you shall both receive your son in time, and shall be commended among women* (2 Esdras 10:16) — the son is not lost but received again *in time*, the world to come breaking through the grief. *Therefore... the Highest shall give you rest and ease from your labour* (2 Esdras 10:24). This is the Comforter''s own promise over Jerusalem: *As one whom his mother comforteth, so will I comfort you; and ye shall be comforted in Jerusalem* (Isaiah 66:13). The grieving mother is herself to be comforted as a mother comforts — sorrow turned, in time, to the receiving back of what death took.',
       sv.verse_id, ev.verse_id, 'extras', 63228
  FROM _session253_2esd10_lookup sv, _session253_2esd10_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=10 AND sv.verse_number=16
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=10 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-10-woman-becomes-builded-city',
       E'The woman vanishes — a city builded appears',
       E'While Ezra yet speaks comfort, the mourning woman is transfigured before his eyes: *her face upon a sudden shined exceedingly, and her countenance glistered* (2 Esdras 10:25), and then *the woman appeared to me no more, but there was a city builded, and a large place shewed itself from the foundations* (2 Esdras 10:27). The grieving mother becomes the glorified city. So John sees her descend: *I John saw the holy city, new Jerusalem, coming down from Elohim (God) out of heaven, prepared as a bride adorned for her husband* (Revelation 21:2) — and the angel names her both bride and city: *I will shew thee the bride, the Lamb’s wife. And he carried me away in the spirit to a great and high mountain, and shewed me that great city, the holy Jerusalem* (Revelation 21:9-10). Paul already knew her: *Jerusalem which is above is free, which is the mother of us all* (Galatians 4:26). The mother IS the city; it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 63231
  FROM _session253_2esd10_lookup sv, _session253_2esd10_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=10 AND sv.verse_number=25
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=10 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-10-this-woman-is-sion',
       E'This woman whom thou sawest is Sion — the glory and beauty of the city',
       E'Uriel gives the solution plainly: *This woman, whom you sawest is Sion* (2 Esdras 10:44), and because Ezra grieved unfeignedly for her, *so has he shewed you the brightness of her glory, and the comeliness of her beauty* (2 Esdras 10:50). The woman whom he saw is the city; her mourning was the destruction of Jerusalem, her builded splendour the Zion to come. John is shewn that same brightness: the holy Jerusalem *Having the glory of Elohim (God): and her light was like unto a stone most precious, even like a jasper stone, clear as crystal* (Revelation 21:11). The deuterocanon''s own gathered city sings the same jewels — *Jerusalem shall be built up with sapphires and emeralds, and precious stone: your walls and towers and battlements with pure gold* (Tobit 13:16) — and Hebrews names the destination: *ye are come unto mount Sion, and unto the city of the living Elohim (God), the heavenly Jerusalem* (Hebrews 12:22). The grieving mother is the glorified gathered city.',
       sv.verse_id, ev.verse_id, 'extras', 63234
  FROM _session253_2esd10_lookup sv, _session253_2esd10_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=10 AND sv.verse_number=44
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=10 AND ev.verse_number=50
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-10-barren-bears-zion-travails',
       E'The barren bare a son — Zion travails and brings forth',
       E'Uriel reads the woman''s thirty barren years and the son she bore: *she has been thirty years barren: those are the thirty years in which there was no offering made in her. But after thirty years Solomon builded the city and offered offerings: and then bare the barren a son* (2 Esdras 10:45-46). The barren who bears is the prophets'' own song of Zion: *Sing, O barren, thou that didst not bear; break forth into singing, and cry aloud, thou that didst not travail with child: for more are the children of the desolate than the children of the married wife* (Isaiah 54:1), which Paul lifts straight onto the Jerusalem above — *Rejoice, thou barren that bearest not; break forth and cry, thou that travailest not: for the desolate hath many more children than she which hath an husband* (Galatians 4:27). And Zion''s bearing is sudden, a whole people at once: *as soon as Zion travailed, she brought forth her children* (Isaiah 66:8). The mourning barren mother brings forth the gathered city full of children.',
       sv.verse_id, ev.verse_id, 'extras', 63237
  FROM _session253_2esd10_lookup sv, _session253_2esd10_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=10 AND sv.verse_number=45
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=10 AND ev.verse_number=46
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-10-city-no-mans-building',
       E'Where no foundation was — the city no man''s hands can build',
       E'Uriel explains why Ezra was sent to an empty field: *Therefore I commanded you to go into the field, where no foundation of any building was. For in the place in which the Highest begins to shew his city, there can no man’s building be able to stand* (2 Esdras 10:53-54). The true Zion is not raised by man''s hands; her foundations are Elohim''s. This is Abraham''s hope: *For he looked for a city which hath foundations, whose builder and maker is Elohim (God)* (Hebrews 11:10). And her builded glory casts off mourning for the garment of everlasting righteousness: *Put off, O Jerusalem, the garment of mourning and affliction, and put on the comeliness of the glory that comes from Yahuah (God) for ever* (Baruch 5:1). The empty field where no man builds is exactly where the Highest shews the city with foundations.',
       sv.verse_id, ev.verse_id, 'extras', 63240
  FROM _session253_2esd10_lookup sv, _session253_2esd10_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=10 AND sv.verse_number=53
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=10 AND ev.verse_number=54
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-esdras-10-zion-laid-waste
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Lamentations 1:1 — *How doth the city sit solitary, that was full of people! how is she become as a widow! she that was great among the nations, and princess among the provinces, how is she become tributary!* The widowed solitary city is the very desolation Ezra catalogues in 2 Esdras 10:22.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd10_lookup sv, _session253_2esd10_lookup tv
 WHERE t.slug='2-esdras-10-zion-laid-waste'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=10 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='lamentations' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Lamentations 2:6 — *And he hath violently taken away his tabernacle, as if it were of a garden: he hath destroyed his places of the assembly: Yahuah (LORD) hath caused the solemn feasts and sabbaths to be forgotten in Zion, and hath despised in the indignation of his anger the king and the priest.* The silenced song and put-out candlestick of 2 Esdras 10:22 is Jeremiah''s forgotten feasts and silenced assembly of Zion.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd10_lookup sv, _session253_2esd10_lookup tv
 WHERE t.slug='2-esdras-10-zion-laid-waste'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=10 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='lamentations' AND tv.chapter_number=2 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 137:4 — *How shall we sing the LORD’S song in a strange land?* Ezra''s grounded psaltery and silenced song in 2 Esdras 10:23 is the exile''s hung-up harp by the rivers of Babylon.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd10_lookup sv, _session253_2esd10_lookup tv
 WHERE t.slug='2-esdras-10-zion-laid-waste'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=10 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=137 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-10-receive-thy-son-be-comforted
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 66:13 — *As one whom his mother comforteth, so will I comfort you; and ye shall be comforted in Jerusalem.* Ezra''s counsel that she shall receive her son and be commended (2 Esdras 10:16) is the LORD''s own comfort, mother-tender, gathered up in Jerusalem.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd10_lookup sv, _session253_2esd10_lookup tv
 WHERE t.slug='2-esdras-10-receive-thy-son-be-comforted'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=10 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=66 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 21:4 — *And Elohim (God) shall wipe away all tears from their eyes; and there shall be no more death, neither sorrow, nor crying, neither shall there be any more pain: for the former things are passed away.* The rest and ease from labour the Highest gives the mourner in 2 Esdras 10:24 is the final wiping-away of every tear in the New Jerusalem.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd10_lookup sv, _session253_2esd10_lookup tv
 WHERE t.slug='2-esdras-10-receive-thy-son-be-comforted'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=10 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-10-woman-becomes-builded-city
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 21:2 — *And I John saw the holy city, new Jerusalem, coming down from Elohim (God) out of heaven, prepared as a bride adorned for her husband.* The city builded that shews itself from the foundations in 2 Esdras 10:27 is John''s holy city descending as a bride.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd10_lookup sv, _session253_2esd10_lookup tv
 WHERE t.slug='2-esdras-10-woman-becomes-builded-city'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=10 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 21:9 — *And there came unto me one of the seven angels which had the seven vials full of the seven last plagues, and talked with me, saying, Come hither, I will shew thee the bride, the Lamb’s wife.* The angel-guided vision of the woman-become-city in 2 Esdras 10:27 matches the angel who shews John the bride who is the city.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd10_lookup sv, _session253_2esd10_lookup tv
 WHERE t.slug='2-esdras-10-woman-becomes-builded-city'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=10 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Galatians 4:26 — *But Jerusalem which is above is free, which is the mother of us all.* The mourning mother whose face shines and is unveiled as a city (2 Esdras 10:25) is Paul''s Jerusalem above, the mother of us all.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd10_lookup sv, _session253_2esd10_lookup tv
 WHERE t.slug='2-esdras-10-woman-becomes-builded-city'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=10 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=4 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-10-this-woman-is-sion
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 21:11 — *Having the glory of Elohim (God): and her light was like unto a stone most precious, even like a jasper stone, clear as crystal;* The brightness of her glory and comeliness of her beauty shewn Ezra in 2 Esdras 10:50 is the jasper-clear glory of John''s holy city.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd10_lookup sv, _session253_2esd10_lookup tv
 WHERE t.slug='2-esdras-10-this-woman-is-sion'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=10 AND sv.verse_number=50
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 12:22 — *But ye are come unto mount Sion, and unto the city of the living Elohim (God), the heavenly Jerusalem, and to an innumerable company of angels,* The woman who is Sion in 2 Esdras 10:44 is the heavenly Jerusalem the faithful are come unto in Hebrews.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd10_lookup sv, _session253_2esd10_lookup tv
 WHERE t.slug='2-esdras-10-this-woman-is-sion'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=10 AND sv.verse_number=44
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Tobit 13:16 — *For Jerusalem shall be built up with sapphires and emeralds, and precious stone: your walls and towers and battlements with pure gold.* The comeliness of the city''s beauty shewn Ezra in 2 Esdras 10:50 is Tobit''s own jeweled, rebuilt Jerusalem — the deuterocanon self-witnessing the New Jerusalem.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd10_lookup sv, _session253_2esd10_lookup tv
 WHERE t.slug='2-esdras-10-this-woman-is-sion'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=10 AND sv.verse_number=50
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=13 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-10-barren-bears-zion-travails
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 54:1 — *Sing, O barren, thou that didst not bear; break forth into singing, and cry aloud, thou that didst not travail with child: for more are the children of the desolate than the children of the married wife, saith Yahuah (LORD).* The barren who at last bare a son in 2 Esdras 10:46 is Isaiah''s barren Zion whose children outnumber the married wife''s.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd10_lookup sv, _session253_2esd10_lookup tv
 WHERE t.slug='2-esdras-10-barren-bears-zion-travails'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=10 AND sv.verse_number=46
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=54 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Galatians 4:27 — *For it is written, Rejoice, thou barren that bearest not; break forth and cry, thou that travailest not: for the desolate hath many more children than she which hath an husband.* Paul reads the barren-who-bears, the same figure as Sion in 2 Esdras 10:46, as the Jerusalem above bringing forth her children.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd10_lookup sv, _session253_2esd10_lookup tv
 WHERE t.slug='2-esdras-10-barren-bears-zion-travails'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=10 AND sv.verse_number=46
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=4 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 66:8 — *Who hath heard such a thing? who hath seen such things? Shall the earth be made to bring forth in one day? or shall a nation be born at once? for as soon as Zion travailed, she brought forth her children.* The barren Sion who bears in 2 Esdras 10:45 is Isaiah''s Zion who travails and brings forth a nation at once.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd10_lookup sv, _session253_2esd10_lookup tv
 WHERE t.slug='2-esdras-10-barren-bears-zion-travails'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=10 AND sv.verse_number=45
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=66 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-10-city-no-mans-building
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hebrews 11:10 — *For he looked for a city which hath foundations, whose builder and maker is Elohim (God).* The city no man''s building can stand in, shewn only by the Highest (2 Esdras 10:54), is the city with foundations whose builder and maker is Elohim that Abraham awaited.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd10_lookup sv, _session253_2esd10_lookup tv
 WHERE t.slug='2-esdras-10-city-no-mans-building'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=10 AND sv.verse_number=54
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Baruch 5:1 — *Put off, O Jerusalem, the garment of mourning and affliction, and put on the comeliness of the glory that comes from Yahuah (God) for ever.* The empty field where the Highest begins to shew his city (2 Esdras 10:53) is Baruch''s Jerusalem stripping off mourning for the glory that comes from Yahuah for ever — the deuterocanon''s own grief-to-glory turn.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd10_lookup sv, _session253_2esd10_lookup tv
 WHERE t.slug='2-esdras-10-city-no-mans-building'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=10 AND sv.verse_number=53
   AND tv.edition_slug='apocrypha' AND tv.book_slug='baruch-with-the-letter-of-jeremiah' AND tv.chapter_number=5 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2esdras_11.sql (session253 2-esdras 11) -----
-- Source anchor: apocrypha/2-esdras ch11. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2esd11 (view _session253_2esd11_lookup). Sort band base 63250, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2esd11_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-esdras-11-eagle-from-the-sea
  ('apocrypha', '2-esdras', 11, 1, 'canon', 'daniel', 7, 3, 'free', E'Daniel 7:3 — *And four great beasts came up from the sea, diverse one from another.* The eagle of 2 Esdras 11:1 rises from the same sea as Daniel''s four beasts, the same vision of empire reworked for Ezra.'),
  ('apocrypha', '2-esdras', 11, 1, 'canon', 'revelation', 13, 1, 'free', E'Revelation 13:1 — *And I stood upon the sand of the sea, and saw a beast rise up out of the sea, having seven heads and ten horns, and upon his horns ten crowns, and upon his heads the name of blasphemy.* John''s beast and Ezra''s eagle both ascend from the sea, the kingdom-of-man surfacing out of the nations.'),
  -- thread: 2-esdras-11-reigned-over-all-the-earth
  ('apocrypha', '2-esdras', 11, 6, 'canon', 'daniel', 7, 23, 'free', E'Daniel 7:23 — *Thus he said, The fourth beast shall be the fourth kingdom upon earth, which shall be diverse from all kingdoms, and shall devour the whole earth, and shall tread it down, and break it in pieces.* The eagle to whom all things under heaven are subject (2 Esdras 11:6) is Daniel''s whole-earth-devouring fourth kingdom.'),
  ('apocrypha', '2-esdras', 11, 6, 'canon', 'revelation', 13, 7, 'free', E'Revelation 13:7 — *And it was given unto him to make war with the saints, and to overcome them: and power was given him over all kindreds, and tongues, and nations.* The beast''s power over all nations matches the eagle whom no creature upon earth dares speak against (2 Esdras 11:6).'),
  -- thread: 2-esdras-11-three-heads-seven-kings
  ('apocrypha', '2-esdras', 11, 23, 'canon', 'revelation', 17, 9, 'free', E'Revelation 17:9 — *And here is the mind which hath wisdom. The seven heads are seven mountains, on which the woman sitteth.* The eagle''s three heads (2 Esdras 11:23) belong to the same head-counting apocalyptic that John''s angel reads as kings and mountains.'),
  ('apocrypha', '2-esdras', 11, 23, 'canon', 'revelation', 17, 12, 'free', E'Revelation 17:12 — *And the ten horns which thou sawest are ten kings, which have received no kingdom as yet; but receive power as kings one hour with the beast.* The eagle''s wings that rise and reign and appear no more (2 Esdras 11:23) are the same short-lived kings John numbers as the ten horns.'),
  -- thread: 2-esdras-11-much-oppression
  ('apocrypha', '2-esdras', 11, 32, 'canon', 'daniel', 7, 7, 'free', E'Daniel 7:7 — *After this I saw in the night visions, and behold a fourth beast, dreadful and terrible, and strong exceedingly; and it had great iron teeth: it devoured and brake in pieces, and stamped the residue with the feet of it: and it was diverse from all the beasts that were before it; and it had ten horns.* The head that put the whole earth in fear (2 Esdras 11:32) is Daniel''s dreadful fourth beast that devours and tramples.'),
  ('apocrypha', '2-esdras', 11, 32, 'canon', 'daniel', 7, 25, 'free', E'Daniel 7:25 — *And he shall speak great words against the El Elyon (most High), and shall wear out the saints of the El Elyon (most High), and think to change times and laws: and they shall be given into his hand until a time and times and the dividing of time.* The head ruling with much oppression (2 Esdras 11:32) wears the face of Daniel''s little horn that grinds the saints and presumes to change the times and law.'),
  -- thread: 2-esdras-11-lion-out-of-the-wood
  ('apocrypha', '2-esdras', 11, 37, 'canon', 'revelation', 5, 5, 'free', E'Revelation 5:5 — *And one of the elders saith unto me, Weep not: behold, the Lion of the tribe of Juda, the Root of David, hath prevailed to open the book, and to loose the seven seals thereof.* The roaring lion who sends a man''s voice against the eagle (2 Esdras 11:37) is the Messiah-Lion of Judah, Yahusha enthroned to judge the kingdom-of-man.'),
  ('apocrypha', '2-esdras', 11, 37, 'canon', 'revelation', 17, 14, 'free', E'Revelation 17:14 — *These shall make war with the Lamb, and the Lamb shall overcome them: for he is Lord of lords, and King of kings: and they that are with him are called, and chosen, and faithful.* The Lion who confronts the eagle (2 Esdras 11:37) overthrows the beast-system just as the Lamb overcomes the kings who war against him.'),
  -- thread: 2-esdras-11-fourth-beast-judged
  ('apocrypha', '2-esdras', 11, 39, 'canon', 'daniel', 7, 26, 'free', E'Daniel 7:26 — *But the judgment shall sit, and they shall take away his dominion, to consume and to destroy it unto the end.* The Lion''s verdict that the fourth beast''s time ends through it (2 Esdras 11:39) is Daniel''s seated judgment stripping the beast of its dominion.'),
  ('apocrypha', '2-esdras', 11, 46, 'canon', 'daniel', 7, 27, 'free', E'Daniel 7:27 — *And the kingdom and dominion, and the greatness of the kingdom under the whole heaven, shall be given to the people of the saints of the El Elyon (most High), whose kingdom is an everlasting kingdom, and all dominions shall serve and obey him.* When the eagle vanishes and the earth is refreshed (2 Esdras 11:46), the dominion passes to the saints of the Most High in Daniel''s everlasting kingdom.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2esd11_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2esd11_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-11-eagle-from-the-sea',
       E'The eagle out of the sea — the fourth beast',
       E'Ezra dreams: *Then saw I a dream, and, behold, there came up from the sea an eagle, which had twelve feathered wings, and three heads.* (2 Esdras 11:1) It ain''t new — Daniel had already seen the four beasts rise from the same waters: *And four great beasts came up from the sea, diverse one from another.* (Daniel 7:3) And John stood where Ezra stood: *And I stood upon the sand of the sea, and saw a beast rise up out of the sea, having seven heads and ten horns, and upon his horns ten crowns, and upon his heads the name of blasphemy.* (Revelation 13:1) The sea is the churning of the nations, and out of it comes the kingdom-of-man that wears the wings of empire.',
       sv.verse_id, ev.verse_id, 'extras', 63250
  FROM _session253_2esd11_lookup sv, _session253_2esd11_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=11 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=11 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-11-reigned-over-all-the-earth',
       E'Subject to her — dominion over all the earth',
       E'The eagle''s reach is total: *And I saw that all things under heaven were subject to her, and no man spoke against her, no, not one creature upon earth.* (2 Esdras 11:6) Daniel said it of the fourth kingdom: *the fourth beast shall be the fourth kingdom upon earth, which shall be diverse from all kingdoms, and shall devour the whole earth, and shall tread it down, and break it in pieces.* (Daniel 7:23) And Revelation: *And it was given unto him to make war with the saints, and to overcome them: and power was given him over all kindreds, and tongues, and nations.* (Revelation 13:7) The empire claims the whole compass of the earth — but it is *given*, on a leash, and the Most High will call in the lease.',
       sv.verse_id, ev.verse_id, 'extras', 63253
  FROM _session253_2esd11_lookup sv, _session253_2esd11_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=11 AND sv.verse_number=5
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=11 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-11-three-heads-seven-kings',
       E'The three heads and the wings — heads, horns, kings',
       E'The structure of the beast is counted out: *And there was no more upon the eagle''s body, but three heads that rested, and six little wings.* (2 Esdras 11:23) John''s angel decodes the same anatomy: *And here is the mind which hath wisdom. The seven heads are seven mountains, on which the woman sitteth.* (Revelation 17:9) *And the ten horns which thou sawest are ten kings, which have received no kingdom as yet; but receive power as kings one hour with the beast.* (Revelation 17:12) Heads and wings, heads and horns — the apocalyptists count the kings of the kingdom-of-man system, each rising for its hour and passing away.',
       sv.verse_id, ev.verse_id, 'extras', 63256
  FROM _session253_2esd11_lookup sv, _session253_2esd11_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=11 AND sv.verse_number=22
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=11 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-11-much-oppression',
       E'Much oppression — the head that put the earth in fear',
       E'The midmost head wakes and devours: *But this head put the whole earth in fear, and bare rule in it over all those that dwelt upon the earth with much oppression; and it had the governance of the world more than all the wings that had been.* (2 Esdras 11:32) Daniel saw this terror exactly: *After this I saw in the night visions, and behold a fourth beast, dreadful and terrible, and strong exceedingly; and it had great iron teeth: it devoured and brake in pieces, and stamped the residue with the feet of it: and it was diverse from all the beasts that were before it; and it had ten horns.* (Daniel 7:7) And the little horn that grows out of it speaks against the Most High: *And he shall speak great words against the El Elyon (most High), and shall wear out the saints of the El Elyon (most High), and think to change times and laws.* (Daniel 7:25) The system rules by fear and oppression — and that is precisely its indictment.',
       sv.verse_id, ev.verse_id, 'extras', 63259
  FROM _session253_2esd11_lookup sv, _session253_2esd11_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=11 AND sv.verse_number=32
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=11 AND ev.verse_number=32
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-11-lion-out-of-the-wood',
       E'The roaring lion — the Lion of Judah judges the eagle',
       E'Against the eagle a deliverer rises: *And I beheld, and lo, as it were a roaring lion chased out of the wood: and I saw that he sent out a man''s voice to the eagle, and said,* (2 Esdras 11:37) *Hear you, I will talk with you, and the Highest shall say to you,* (2 Esdras 11:38) This Lion is the Messiah of 4 Ezra — the same Lion John sees enthroned to open the sealed book and bring the kingdom-of-man to judgment: *behold, the Lion of the tribe of Juda, the Root of David, hath prevailed to open the book, and to loose the seven seals thereof.* (Revelation 5:5) These shall make war with the Lamb — and the Lamb wins: *These shall make war with the Lamb, and the Lamb shall overcome them: for he is Lord of lords, and King of kings: and they that are with him are called, and chosen, and faithful.* (Revelation 17:14) The eagle terrifies the earth; the Lion speaks with a man''s voice and ends it.',
       sv.verse_id, ev.verse_id, 'extras', 63262
  FROM _session253_2esd11_lookup sv, _session253_2esd11_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=11 AND sv.verse_number=37
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=11 AND ev.verse_number=38
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-11-fourth-beast-judged',
       E'Art not thou the fourth beast — judgment and refreshing',
       E'The Lion names the eagle plainly and pronounces its end: *Art not you it that remainest of the four beasts, whom I made to reign in my world, that the end of their times might come through them?* (2 Esdras 11:39) Daniel had already seen the dominion stripped and given to the saints: *But the judgment shall sit, and they shall take away his dominion, to consume and to destroy it unto the end.* (Daniel 7:26) The eagle is told to vanish *that all the earth may be refreshed, and may return, being delivered from your violence, and that she may hope for the judgment and mercy of him that made her.* (2 Esdras 11:46) And the kingdom passes to the people of Elohim: *And the kingdom and dominion, and the greatness of the kingdom under the whole heaven, shall be given to the people of the saints of the El Elyon (most High), whose kingdom is an everlasting kingdom, and all dominions shall serve and obey him.* (Daniel 7:27) Dismantle the system — and the meek inherit the refreshed earth.',
       sv.verse_id, ev.verse_id, 'extras', 63265
  FROM _session253_2esd11_lookup sv, _session253_2esd11_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=11 AND sv.verse_number=39
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=11 AND ev.verse_number=46
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-esdras-11-eagle-from-the-sea
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 7:3 — *And four great beasts came up from the sea, diverse one from another.* The eagle of 2 Esdras 11:1 rises from the same sea as Daniel''s four beasts, the same vision of empire reworked for Ezra.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd11_lookup sv, _session253_2esd11_lookup tv
 WHERE t.slug='2-esdras-11-eagle-from-the-sea'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=11 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 13:1 — *And I stood upon the sand of the sea, and saw a beast rise up out of the sea, having seven heads and ten horns, and upon his horns ten crowns, and upon his heads the name of blasphemy.* John''s beast and Ezra''s eagle both ascend from the sea, the kingdom-of-man surfacing out of the nations.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd11_lookup sv, _session253_2esd11_lookup tv
 WHERE t.slug='2-esdras-11-eagle-from-the-sea'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=11 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=13 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-11-reigned-over-all-the-earth
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 7:23 — *Thus he said, The fourth beast shall be the fourth kingdom upon earth, which shall be diverse from all kingdoms, and shall devour the whole earth, and shall tread it down, and break it in pieces.* The eagle to whom all things under heaven are subject (2 Esdras 11:6) is Daniel''s whole-earth-devouring fourth kingdom.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd11_lookup sv, _session253_2esd11_lookup tv
 WHERE t.slug='2-esdras-11-reigned-over-all-the-earth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=11 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 13:7 — *And it was given unto him to make war with the saints, and to overcome them: and power was given him over all kindreds, and tongues, and nations.* The beast''s power over all nations matches the eagle whom no creature upon earth dares speak against (2 Esdras 11:6).'
  FROM cross_reference_threads t, cross_references x, _session253_2esd11_lookup sv, _session253_2esd11_lookup tv
 WHERE t.slug='2-esdras-11-reigned-over-all-the-earth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=11 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=13 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-11-three-heads-seven-kings
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 17:9 — *And here is the mind which hath wisdom. The seven heads are seven mountains, on which the woman sitteth.* The eagle''s three heads (2 Esdras 11:23) belong to the same head-counting apocalyptic that John''s angel reads as kings and mountains.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd11_lookup sv, _session253_2esd11_lookup tv
 WHERE t.slug='2-esdras-11-three-heads-seven-kings'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=11 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=17 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 17:12 — *And the ten horns which thou sawest are ten kings, which have received no kingdom as yet; but receive power as kings one hour with the beast.* The eagle''s wings that rise and reign and appear no more (2 Esdras 11:23) are the same short-lived kings John numbers as the ten horns.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd11_lookup sv, _session253_2esd11_lookup tv
 WHERE t.slug='2-esdras-11-three-heads-seven-kings'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=11 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=17 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-11-much-oppression
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 7:7 — *After this I saw in the night visions, and behold a fourth beast, dreadful and terrible, and strong exceedingly; and it had great iron teeth: it devoured and brake in pieces, and stamped the residue with the feet of it: and it was diverse from all the beasts that were before it; and it had ten horns.* The head that put the whole earth in fear (2 Esdras 11:32) is Daniel''s dreadful fourth beast that devours and tramples.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd11_lookup sv, _session253_2esd11_lookup tv
 WHERE t.slug='2-esdras-11-much-oppression'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=11 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 7:25 — *And he shall speak great words against the El Elyon (most High), and shall wear out the saints of the El Elyon (most High), and think to change times and laws: and they shall be given into his hand until a time and times and the dividing of time.* The head ruling with much oppression (2 Esdras 11:32) wears the face of Daniel''s little horn that grinds the saints and presumes to change the times and law.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd11_lookup sv, _session253_2esd11_lookup tv
 WHERE t.slug='2-esdras-11-much-oppression'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=11 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-11-lion-out-of-the-wood
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 5:5 — *And one of the elders saith unto me, Weep not: behold, the Lion of the tribe of Juda, the Root of David, hath prevailed to open the book, and to loose the seven seals thereof.* The roaring lion who sends a man''s voice against the eagle (2 Esdras 11:37) is the Messiah-Lion of Judah, Yahusha enthroned to judge the kingdom-of-man.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd11_lookup sv, _session253_2esd11_lookup tv
 WHERE t.slug='2-esdras-11-lion-out-of-the-wood'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=11 AND sv.verse_number=37
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=5 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 17:14 — *These shall make war with the Lamb, and the Lamb shall overcome them: for he is Lord of lords, and King of kings: and they that are with him are called, and chosen, and faithful.* The Lion who confronts the eagle (2 Esdras 11:37) overthrows the beast-system just as the Lamb overcomes the kings who war against him.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd11_lookup sv, _session253_2esd11_lookup tv
 WHERE t.slug='2-esdras-11-lion-out-of-the-wood'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=11 AND sv.verse_number=37
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=17 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-11-fourth-beast-judged
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 7:26 — *But the judgment shall sit, and they shall take away his dominion, to consume and to destroy it unto the end.* The Lion''s verdict that the fourth beast''s time ends through it (2 Esdras 11:39) is Daniel''s seated judgment stripping the beast of its dominion.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd11_lookup sv, _session253_2esd11_lookup tv
 WHERE t.slug='2-esdras-11-fourth-beast-judged'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=11 AND sv.verse_number=39
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 7:27 — *And the kingdom and dominion, and the greatness of the kingdom under the whole heaven, shall be given to the people of the saints of the El Elyon (most High), whose kingdom is an everlasting kingdom, and all dominions shall serve and obey him.* When the eagle vanishes and the earth is refreshed (2 Esdras 11:46), the dominion passes to the saints of the Most High in Daniel''s everlasting kingdom.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd11_lookup sv, _session253_2esd11_lookup tv
 WHERE t.slug='2-esdras-11-fourth-beast-judged'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=11 AND sv.verse_number=46
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2esdras_12.sql (session253 2-esdras 12) -----
-- Source anchor: apocrypha/2-esdras ch12. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2esd12 (view _session253_2esd12_lookup). Sort band base 63275, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2esd12_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-esdras-12-lion-is-the-anointed
  ('apocrypha', '2-esdras', 12, 32, 'canon', 'genesis', 49, 9, 'free', E'Genesis 49:9 — *Yahudah (Judah) is a lion''s whelp: from the prey, my son, thou art gone up: he stooped down, he couched as a lion, and as an old lion; who shall rouse him up?* The roaring lion that rebukes the eagle is the whelp of Judah of Jacob''s blessing, the Anointed sprung from David''s tribe of 2 Esdras 12:32.'),
  ('apocrypha', '2-esdras', 12, 32, 'canon', 'genesis', 49, 10, 'free', E'Genesis 49:10 — *The sceptre shall not depart from Yahudah (Judah), nor a lawgiver from between his feet, until Shiloh come; and unto him shall the gathering of the people be.* The Anointed kept unto the end of 2 Esdras 12:32 is Shiloh, in whom the sceptre of Judah comes to rest and the people are gathered.'),
  ('apocrypha', '2-esdras', 12, 31, 'canon', 'revelation', 5, 5, 'free', E'Revelation 5:5 — *And one of the elders saith unto me, Weep not: behold, the Lion of the tribe of Juda, the Root of David, hath prevailed to open the book, and to loose the seven seals thereof.* The lion rising out of the wood and roaring against the eagle in 2 Esdras 12:31 is the very Lion of the tribe of Judah who prevails in John''s throne-vision.'),
  -- thread: 2-esdras-12-eagle-is-daniels-fourth-kingdom
  ('apocrypha', '2-esdras', 12, 11, 'canon', 'daniel', 7, 23, 'free', E'Daniel 7:23 — *Thus he said, The fourth beast shall be the fourth kingdom upon earth, which shall be diverse from all kingdoms, and shall devour the whole earth, and shall tread it down, and break it in pieces.* The angel ties the eagle from the sea directly to Daniel''s brother-vision in 2 Esdras 12:11 — both name the fourth, devouring kingdom of man.'),
  ('apocrypha', '2-esdras', 12, 13, 'canon', 'revelation', 13, 1, 'free', E'Revelation 13:1 — *And I stood upon the sand of the sea, and saw a beast rise up out of the sea, having seven heads and ten horns, and upon his horns ten crowns, and upon his heads the name of blasphemy.* The kingdom feared above all that rose up from the sea in 2 Esdras 12:13 is John''s many-headed beast risen from the same sea — the kingdom-system of man.'),
  -- thread: 2-esdras-12-beast-slain-kingdom-to-the-saints
  ('apocrypha', '2-esdras', 12, 3, 'canon', 'daniel', 7, 11, 'free', E'Daniel 7:11 — *I beheld then because of the voice of the great words which the horn spake: I beheld even till the beast was slain, and his body destroyed, and given to the burning flame.* The whole body of the eagle burnt in 2 Esdras 12:3 is Daniel''s beast slain and given to the burning flame — the same end of the kingdom of man.'),
  ('apocrypha', '2-esdras', 12, 33, 'canon', 'daniel', 7, 27, 'free', E'Daniel 7:27 — *And the kingdom and dominion, and the greatness of the kingdom under the whole heaven, shall be given to the people of the saints of the El Elyon (most High), whose kingdom is an everlasting kingdom, and all dominions shall serve and obey him.* After the Anointed sets the kingdoms before him in judgment in 2 Esdras 12:33, the dominion passes to the saints of the Most High.'),
  ('apocrypha', '2-esdras', 12, 33, 'canon', '2-thessalonians', 2, 8, 'free', E'2 Thessalonians 2:8 — *And then shall that Wicked be revealed, whom Yahuah (Lord) shall consume with the spirit of his mouth, and shall destroy with the brightness of his coming:* The Anointed who reproves and corrects the wicked kingdoms in 2 Esdras 12:33 is the One who consumes the Wicked with the breath of his mouth at his coming.'),
  -- thread: 2-esdras-12-rest-of-my-people-delivered
  ('apocrypha', '2-esdras', 12, 34, 'canon', 'isaiah', 11, 11, 'free', E'Isaiah 11:11 — *And it shall come to pass in that day, that Yahuah (Lord) shall set his hand again the second time to recover the remnant of his people, which shall be left, from Assyria, and from Egypt, and from Pathros, and from Cush, and from Elam, and from Shinar, and from Hamath, and from the islands of the sea.* The rest of the people delivered with mercy in 2 Esdras 12:34 is the remnant Yahuah recovers a second time from the lands of the dispersion.'),
  ('apocrypha', '2-esdras', 12, 34, 'canon', 'isaiah', 11, 12, 'free', E'Isaiah 11:12 — *And he shall set up an ensign for the nations, and shall assemble the outcasts of Yashar''el (Israel), and gather together the dispersed of Yahudah (Judah) from the four corners of the earth.* The mercy shown to the rest of the people in 2 Esdras 12:34 gathers both houses — outcast Israel and dispersed Judah — from the four corners.'),
  ('apocrypha', '2-esdras', 12, 34, 'canon', 'ezekiel', 37, 22, 'free', E'Ezekiel 37:22 — *And I will make them one nation in the land upon the mountains of Yashar''el (Israel); and one king shall be king to them all: and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all:* The rest of the people the Anointed makes joyful in 2 Esdras 12:34 are the two sticks joined into one nation under one King.'),
  -- thread: 2-esdras-12-write-in-a-book-and-seal-it
  ('apocrypha', '2-esdras', 12, 37, 'canon', 'daniel', 12, 4, 'free', E'Daniel 12:4 — *But thou, O Daniel, shut up the words, and seal the book, even to the time of the end: many shall run to and fro, and knowledge shall be increased.* The charge to write the vision in a book and hide it in 2 Esdras 12:37 echoes Daniel''s sealing of the words until the time of the end.'),
  ('apocrypha', '2-esdras', 12, 38, 'canon', 'daniel', 12, 9, 'free', E'Daniel 12:9 — *And he said, Go thy way, Daniel: for the words are closed up and sealed till the time of the end.* The secrets taught only to the wise who can keep them in 2 Esdras 12:38 are Daniel''s words closed and sealed for the latter days.'),
  -- thread: 2-esdras-12-day-of-judgment
  ('apocrypha', '2-esdras', 12, 34, 'canon', 'daniel', 12, 2, 'free', E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The coming day of judgment in 2 Esdras 12:34 is Daniel''s awakening of the sleepers in the dust to everlasting life or contempt.'),
  ('apocrypha', '2-esdras', 12, 34, 'canon', 'revelation', 20, 12, 'free', E'Revelation 20:12 — *And I saw the dead, small and great, stand before Elohim (God); and the books were opened: and another book was opened, which is the book of life: and the dead were judged out of those things which were written in the books, according to their works.* The day of judgment spoken from the beginning in 2 Esdras 12:34 is John''s great white throne, where the books are opened and the dead are judged.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2esd12_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2esd12_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-12-lion-is-the-anointed',
       E'The Lion is the Anointed — the Lion of Judah',
       E'Esdras hears the meaning of the lion that roared against the eagle: *This is the anointed, which the Highest has kept for them and for their wickedness to the end: he shall reprove them, and shall upbraid them with their cruelty.* (2 Esdras 12:32). 4 Ezra''s own messianism names him plainly — the kept Anointed One who springs from Judah. Come and see the lion of the dream: *Yahudah (Judah) is a lion''s whelp: from the prey, my son, thou art gone up: he stooped down, he couched as a lion, and as an old lion; who shall rouse him up?* (Genesis 49:9), and the sceptre that abides until Shiloh: *The sceptre shall not depart from Yahudah (Judah), nor a lawgiver from between his feet, until Shiloh come; and unto him shall the gathering of the people be.* (Genesis 49:10). John sees the same Lion prevail: *And one of the elders saith unto me, Weep not: behold, the Lion of the tribe of Juda, the Root of David, hath prevailed to open the book, and to loose the seven seals thereof.* (Revelation 5:5). It ain''t new — the kept Anointed of Esdras is the Lion of Judah, the Root of David, Yahusha.',
       sv.verse_id, ev.verse_id, 'extras', 63275
  FROM _session253_2esd12_lookup sv, _session253_2esd12_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=12 AND sv.verse_number=31
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=12 AND ev.verse_number=32
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-12-eagle-is-daniels-fourth-kingdom',
       E'The eagle is Daniel''s fourth kingdom',
       E'The angel unfolds the eagle to Esdras: *The eagle, whom you sawest come up from the sea, is the kingdom which was seen in the vision of your brother Daniel.* (2 Esdras 12:11), *Behold, the days will come, that there shall rise up a kingdom upon earth, and it shall be feared above all the kingdoms that were before it.* (2 Esdras 12:13). Come and see the brother-vision named: *Thus he said, The fourth beast shall be the fourth kingdom upon earth, which shall be diverse from all kingdoms, and shall devour the whole earth, and shall tread it down, and break it in pieces.* (Daniel 7:23). John watches the same kingdom-of-man rise: *And I stood upon the sand of the sea, and saw a beast rise up out of the sea, having seven heads and ten horns, and upon his horns ten crowns, and upon his heads the name of blasphemy.* (Revelation 13:1). The eagle is the beast-system from the sea — the kingdom of man dismantled, not Israel.',
       sv.verse_id, ev.verse_id, 'extras', 63278
  FROM _session253_2esd12_lookup sv, _session253_2esd12_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=12 AND sv.verse_number=11
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=12 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-12-beast-slain-kingdom-to-the-saints',
       E'The beast slain — the kingdom given to the saints',
       E'Esdras hears the eagle''s end and the Anointed''s judgment: *And I saw, and, behold, they appeared no more, and the whole body of the eagle was burnt so that the earth was in great fear* (2 Esdras 12:3); *For he shall set them before him alive in judgment, and shall rebuke them, and correct them.* (2 Esdras 12:33). Come and see Daniel: *I beheld even till the beast was slain, and his body destroyed, and given to the burning flame.* (Daniel 7:11); and the kingdom that follows: *And the kingdom and dominion, and the greatness of the kingdom under the whole heaven, shall be given to the people of the saints of the El Elyon (most High), whose kingdom is an everlasting kingdom, and all dominions shall serve and obey him.* (Daniel 7:27). Paul names the consuming of the Wicked: *And then shall that Wicked be revealed, whom Yahuah (Lord) shall consume with the spirit of his mouth, and shall destroy with the brightness of his coming* (2 Thessalonians 2:8). The burnt eagle, the slain beast, the Anointed''s word — one judgment, one everlasting kingdom for the saints.',
       sv.verse_id, ev.verse_id, 'extras', 63281
  FROM _session253_2esd12_lookup sv, _session253_2esd12_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=12 AND sv.verse_number=3
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=12 AND ev.verse_number=33
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-12-rest-of-my-people-delivered',
       E'The rest of my people delivered — the remnant of both houses',
       E'The Anointed''s work is not only to judge but to gather: *For the rest of my people shall he deliver with mercy, those that have been pressed upon my borders, and he shall make them joyful until the coming of the day of judgment, of which I have spoken to you from the beginning.* (2 Esdras 12:34). This is no church replacing Israel — it is the faithful remnant kept and regathered. Come and see Yahuah''s own hand to recover them: *And it shall come to pass in that day, that Yahuah (Lord) shall set his hand again the second time to recover the remnant of his people, which shall be left, from Assyria, and from Egypt, and from Pathros, and from Cush, and from Elam, and from Shinar, and from Hamath, and from the islands of the sea.* (Isaiah 11:11), *and shall assemble the outcasts of Yashar''el (Israel), and gather together the dispersed of Yahudah (Judah) from the four corners of the earth.* (Isaiah 11:12). Ezekiel makes the two houses one: *And I will make them one nation in the land upon the mountains of Yashar''el (Israel); and one king shall be king to them all: and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all* (Ezekiel 37:22). The rest delivered with mercy is the two-house remnant gathered under one King.',
       sv.verse_id, ev.verse_id, 'extras', 63284
  FROM _session253_2esd12_lookup sv, _session253_2esd12_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=12 AND sv.verse_number=34
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=12 AND ev.verse_number=34
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-12-write-in-a-book-and-seal-it',
       E'Write in a book and seal it — sealed till the time of the end',
       E'The Highest commands Esdras: *Therefore write all these things that you have seen in a book, and hide them* (2 Esdras 12:37), *And teach them to the wise of the people, whose hearts you know may comprehend and keep these secrets.* (2 Esdras 12:38). Come and see Daniel given the same charge: *But thou, O Daniel, shut up the words, and seal the book, even to the time of the end: many shall run to and fro, and knowledge shall be increased.* (Daniel 12:4), *And he said, Go thy way, Daniel: for the words are closed up and sealed till the time of the end.* (Daniel 12:9). The apocalyptic vision is written, sealed, and reserved for the wise of the latter days — it ain''t new, the seer of Esdras stands in Daniel''s office.',
       sv.verse_id, ev.verse_id, 'extras', 63287
  FROM _session253_2esd12_lookup sv, _session253_2esd12_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=12 AND sv.verse_number=37
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=12 AND ev.verse_number=38
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-12-day-of-judgment',
       E'Until the day of judgment — the books opened',
       E'Esdras hears the horizon of the vision: *and he shall make them joyful until the coming of the day of judgment, of which I have spoken to you from the beginning.* (2 Esdras 12:34). Come and see Daniel''s resurrection-judgment: *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* (Daniel 12:2). John sees the day come and the books opened: *And I saw the dead, small and great, stand before Elohim (God); and the books were opened: and another book was opened, which is the book of life: and the dead were judged out of those things which were written in the books, according to their works.* (Revelation 20:12). The day of judgment of which the Highest spoke from the beginning is the white-throne reckoning when the dead awake and the books are opened.',
       sv.verse_id, ev.verse_id, 'extras', 63290
  FROM _session253_2esd12_lookup sv, _session253_2esd12_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=12 AND sv.verse_number=34
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=12 AND ev.verse_number=34
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-esdras-12-lion-is-the-anointed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 49:9 — *Yahudah (Judah) is a lion''s whelp: from the prey, my son, thou art gone up: he stooped down, he couched as a lion, and as an old lion; who shall rouse him up?* The roaring lion that rebukes the eagle is the whelp of Judah of Jacob''s blessing, the Anointed sprung from David''s tribe of 2 Esdras 12:32.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd12_lookup sv, _session253_2esd12_lookup tv
 WHERE t.slug='2-esdras-12-lion-is-the-anointed'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=12 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 49:10 — *The sceptre shall not depart from Yahudah (Judah), nor a lawgiver from between his feet, until Shiloh come; and unto him shall the gathering of the people be.* The Anointed kept unto the end of 2 Esdras 12:32 is Shiloh, in whom the sceptre of Judah comes to rest and the people are gathered.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd12_lookup sv, _session253_2esd12_lookup tv
 WHERE t.slug='2-esdras-12-lion-is-the-anointed'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=12 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 5:5 — *And one of the elders saith unto me, Weep not: behold, the Lion of the tribe of Juda, the Root of David, hath prevailed to open the book, and to loose the seven seals thereof.* The lion rising out of the wood and roaring against the eagle in 2 Esdras 12:31 is the very Lion of the tribe of Judah who prevails in John''s throne-vision.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd12_lookup sv, _session253_2esd12_lookup tv
 WHERE t.slug='2-esdras-12-lion-is-the-anointed'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=12 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=5 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-12-eagle-is-daniels-fourth-kingdom
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 7:23 — *Thus he said, The fourth beast shall be the fourth kingdom upon earth, which shall be diverse from all kingdoms, and shall devour the whole earth, and shall tread it down, and break it in pieces.* The angel ties the eagle from the sea directly to Daniel''s brother-vision in 2 Esdras 12:11 — both name the fourth, devouring kingdom of man.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd12_lookup sv, _session253_2esd12_lookup tv
 WHERE t.slug='2-esdras-12-eagle-is-daniels-fourth-kingdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=12 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 13:1 — *And I stood upon the sand of the sea, and saw a beast rise up out of the sea, having seven heads and ten horns, and upon his horns ten crowns, and upon his heads the name of blasphemy.* The kingdom feared above all that rose up from the sea in 2 Esdras 12:13 is John''s many-headed beast risen from the same sea — the kingdom-system of man.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd12_lookup sv, _session253_2esd12_lookup tv
 WHERE t.slug='2-esdras-12-eagle-is-daniels-fourth-kingdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=12 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=13 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-12-beast-slain-kingdom-to-the-saints
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 7:11 — *I beheld then because of the voice of the great words which the horn spake: I beheld even till the beast was slain, and his body destroyed, and given to the burning flame.* The whole body of the eagle burnt in 2 Esdras 12:3 is Daniel''s beast slain and given to the burning flame — the same end of the kingdom of man.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd12_lookup sv, _session253_2esd12_lookup tv
 WHERE t.slug='2-esdras-12-beast-slain-kingdom-to-the-saints'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=12 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 7:27 — *And the kingdom and dominion, and the greatness of the kingdom under the whole heaven, shall be given to the people of the saints of the El Elyon (most High), whose kingdom is an everlasting kingdom, and all dominions shall serve and obey him.* After the Anointed sets the kingdoms before him in judgment in 2 Esdras 12:33, the dominion passes to the saints of the Most High.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd12_lookup sv, _session253_2esd12_lookup tv
 WHERE t.slug='2-esdras-12-beast-slain-kingdom-to-the-saints'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=12 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Thessalonians 2:8 — *And then shall that Wicked be revealed, whom Yahuah (Lord) shall consume with the spirit of his mouth, and shall destroy with the brightness of his coming:* The Anointed who reproves and corrects the wicked kingdoms in 2 Esdras 12:33 is the One who consumes the Wicked with the breath of his mouth at his coming.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd12_lookup sv, _session253_2esd12_lookup tv
 WHERE t.slug='2-esdras-12-beast-slain-kingdom-to-the-saints'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=12 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='2-thessalonians' AND tv.chapter_number=2 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-12-rest-of-my-people-delivered
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 11:11 — *And it shall come to pass in that day, that Yahuah (Lord) shall set his hand again the second time to recover the remnant of his people, which shall be left, from Assyria, and from Egypt, and from Pathros, and from Cush, and from Elam, and from Shinar, and from Hamath, and from the islands of the sea.* The rest of the people delivered with mercy in 2 Esdras 12:34 is the remnant Yahuah recovers a second time from the lands of the dispersion.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd12_lookup sv, _session253_2esd12_lookup tv
 WHERE t.slug='2-esdras-12-rest-of-my-people-delivered'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=12 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 11:12 — *And he shall set up an ensign for the nations, and shall assemble the outcasts of Yashar''el (Israel), and gather together the dispersed of Yahudah (Judah) from the four corners of the earth.* The mercy shown to the rest of the people in 2 Esdras 12:34 gathers both houses — outcast Israel and dispersed Judah — from the four corners.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd12_lookup sv, _session253_2esd12_lookup tv
 WHERE t.slug='2-esdras-12-rest-of-my-people-delivered'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=12 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 37:22 — *And I will make them one nation in the land upon the mountains of Yashar''el (Israel); and one king shall be king to them all: and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all:* The rest of the people the Anointed makes joyful in 2 Esdras 12:34 are the two sticks joined into one nation under one King.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd12_lookup sv, _session253_2esd12_lookup tv
 WHERE t.slug='2-esdras-12-rest-of-my-people-delivered'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=12 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-12-write-in-a-book-and-seal-it
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 12:4 — *But thou, O Daniel, shut up the words, and seal the book, even to the time of the end: many shall run to and fro, and knowledge shall be increased.* The charge to write the vision in a book and hide it in 2 Esdras 12:37 echoes Daniel''s sealing of the words until the time of the end.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd12_lookup sv, _session253_2esd12_lookup tv
 WHERE t.slug='2-esdras-12-write-in-a-book-and-seal-it'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=12 AND sv.verse_number=37
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 12:9 — *And he said, Go thy way, Daniel: for the words are closed up and sealed till the time of the end.* The secrets taught only to the wise who can keep them in 2 Esdras 12:38 are Daniel''s words closed and sealed for the latter days.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd12_lookup sv, _session253_2esd12_lookup tv
 WHERE t.slug='2-esdras-12-write-in-a-book-and-seal-it'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=12 AND sv.verse_number=38
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-12-day-of-judgment
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The coming day of judgment in 2 Esdras 12:34 is Daniel''s awakening of the sleepers in the dust to everlasting life or contempt.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd12_lookup sv, _session253_2esd12_lookup tv
 WHERE t.slug='2-esdras-12-day-of-judgment'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=12 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 20:12 — *And I saw the dead, small and great, stand before Elohim (God); and the books were opened: and another book was opened, which is the book of life: and the dead were judged out of those things which were written in the books, according to their works.* The day of judgment spoken from the beginning in 2 Esdras 12:34 is John''s great white throne, where the books are opened and the dead are judged.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd12_lookup sv, _session253_2esd12_lookup tv
 WHERE t.slug='2-esdras-12-day-of-judgment'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=12 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2esdras_13.sql (session253 2-esdras 13) -----
-- Source anchor: apocrypha/2-esdras ch13. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2esd13 (view _session253_2esd13_lookup). Sort band base 63300, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2esd13_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-esdras-13-man-from-the-sea-with-the-clouds
  ('apocrypha', '2-esdras', 13, 3, 'canon', 'daniel', 7, 13, 'free', E'Daniel 7:13 — *I saw in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him.* Ezra''s Man waxing strong with the thousands of heaven is Daniel''s Son of Adam coming with the clouds, before whom all things tremble.'),
  ('apocrypha', '2-esdras', 13, 32, 'canon', 'daniel', 7, 14, 'free', E'Daniel 7:14 — *And there was given him dominion, and glory, and a kingdom, that all people, nations, and languages, should serve him: his dominion is an everlasting dominion, which shall not pass away, and his kingdom that which shall not be destroyed.* When the Son is declared as the man ascending, the everlasting kingdom Daniel saw given to the Son of Adam is his.'),
  ('apocrypha', '2-esdras', 13, 26, 'canon', 'psalms', 2, 7, 'free', E'Psalms 2:7 — *I will declare the decree: Yahuah (LORD) hath said unto me, Thou art my Son; this day have I begotten thee.* The One whom the Highest has kept a great season to deliver his creature is the begotten Son of the decree.'),
  -- thread: 2-esdras-13-breath-of-his-mouth-slays-the-wicked
  ('apocrypha', '2-esdras', 13, 10, 'canon', 'isaiah', 11, 4, 'free', E'Isaiah 11:4 — *But with righteousness shall he judge the poor, and reprove with equity for the meek of the earth: and he shall smite the earth with the rod of his mouth, and with the breath of his lips shall he slay the wicked.* The blast of fire and flaming breath from the Man''s mouth is Isaiah''s Branch slaying the wicked with the breath of his lips.'),
  ('apocrypha', '2-esdras', 13, 38, 'canon', '2-thessalonians', 2, 8, 'free', E'2 Thessalonians 2:8 — *And then shall that Wicked be revealed, whom Yahuah (Lord) shall consume with the spirit of his mouth, and shall destroy with the brightness of his coming.* The Son destroying the wicked without labour by the law like fire is the Lord consuming the Wicked with the spirit of his mouth.'),
  ('apocrypha', '2-esdras', 13, 9, 'canon', 'revelation', 19, 15, 'free', E'Revelation 19:15 — *And out of his mouth goeth a sharp sword, that with it he should smite the nations: and he shall rule them with a rod of iron: and he treadeth the winepress of the fierceness and wrath of El Shaddai (Almighty God).* The Man who holds no instrument of war is John''s rider whose sword proceeds from his mouth to smite the nations.'),
  -- thread: 2-esdras-13-mount-zion-built-without-hands
  ('apocrypha', '2-esdras', 13, 35, 'canon', 'psalms', 2, 6, 'free', E'Psalms 2:6 — *Yet have I set my king upon my holy hill of Zion.* The Son standing on the top of mount Sion is the King the Father sets upon his holy hill.'),
  ('apocrypha', '2-esdras', 13, 36, 'canon', 'revelation', 7, 9, 'free', E'Revelation 7:9 — *After this I beheld, and, lo, a great multitude, which no man could number, of all nations, and kindreds, and people, and tongues, stood before the throne, and before the Lamb, clothed with white robes, and palms in their hands.* Zion shewed to all men, prepared and builded without hands, is where John''s innumerable multitude stands before the Lamb.'),
  -- thread: 2-esdras-13-ten-tribes-arzareth-two-house-gathering
  ('apocrypha', '2-esdras', 13, 47, 'canon', 'isaiah', 11, 11, 'free', E'Isaiah 11:11 — *And it shall come to pass in that day, that Yahuah (Lord) shall set his hand again the second time to recover the remnant of his people, which shall be left, from Assyria, and from Egypt, and from Pathros, and from Cush, and from Elam, and from Shinar, and from Hamath, and from the islands of the sea.* The ten tribes carried beyond the river and now beginning to come are the remnant Yahuah recovers a second time from Assyria.'),
  ('apocrypha', '2-esdras', 13, 47, 'canon', 'isaiah', 11, 12, 'free', E'Isaiah 11:12 — *And he shall set up an ensign for the nations, and shall assemble the outcasts of Yashar''el (Israel), and gather together the dispersed of Yahudah (Judah) from the four corners of the earth.* The peaceable multitude returning with peace is the outcasts of Israel and the dispersed of Judah assembled from the four corners.'),
  ('apocrypha', '2-esdras', 13, 40, 'canon', 'ezekiel', 37, 22, 'free', E'Ezekiel 37:22 — *And I will make them one nation in the land upon the mountains of Yashar''el (Israel); and one king shall be king to them all: and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all.* The ten tribes led captive by Assyria are the divided kingdom Ezekiel sees made one nation under one king.'),
  ('apocrypha', '2-esdras', 13, 39, 'canon', 'hosea', 1, 11, 'free', E'Hosea 1:11 — *Then shall the children of Yahudah (Judah) and the children of Yashar''el (Israel) be gathered together, and appoint themselves one head, and they shall come up out of the land: for great shall be the day of Jezreel.* The peaceable multitude gathered to the Son is Judah and Israel gathered together under one head.'),
  ('apocrypha', '2-esdras', 13, 47, 'canon', 'jeremiah', 31, 8, 'free', E'Jeremiah 31:8 — *Behold, I will bring them from the north country, and gather them from the coasts of the earth, and with them the blind and the lame, the woman with child and her that travaileth with child together: a great company shall return thither.* The Highest staying the stream so the tribes may pass through is the great company Yahuah brings home from the north country.'),
  -- thread: 2-esdras-13-remnant-defended-israel-not-cast-away
  ('apocrypha', '2-esdras', 13, 49, 'canon', 'romans', 11, 1, 'free', E'Romans 11:1 — *I say then, Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham, of the tribe of Benjamin.* The Son defending his people that remain is Paul''s witness that Elohim has not cast away his people.'),
  ('apocrypha', '2-esdras', 13, 48, 'canon', 'hosea', 1, 10, 'free', E'Hosea 1:10 — *Yet the number of the children of Yashar''el (Israel) shall be as the sand of the sea, which cannot be measured nor numbered; and it shall come to pass, that in the place where it was said unto them, Ye are not my people, there it shall be said unto them, Ye are the sons of the living Elohim (God).* Those found within his borders, defended in that day, are the once-disowned reclaimed as sons of the living Elohim.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2esd13_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2esd13_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-13-man-from-the-sea-with-the-clouds',
       E'The Man from the sea, coming with the clouds',
       E'Ezra sees the likeness of a Man rise from the deep and ride the heavens: *And, lo, there arose a wind from the sea, that it moved all the waves thereof* (2 Esdras 13:2), and *I beheld, and, lo, that man waxed strong with the thousands of heaven: and when he turned his countenance to look, all the things trembled that were seen under him* (2 Esdras 13:3). The angel names him plainly — *then shall my Son be declared, whom you sawest as a man ascending* (2 Esdras 13:32). This is no allegory of a nation; 4 Ezra''s own messianism beholds the Son of Adam Daniel saw: *I saw in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him* (Daniel 7:13). And to him the everlasting kingdom is given — *And there was given him dominion, and glory, and a kingdom, that all people, nations, and languages, should serve him: his dominion is an everlasting dominion, which shall not pass away, and his kingdom that which shall not be destroyed* (Daniel 7:14). The Father has long kept him hidden, to be revealed in his time: *The same is he whom Yahuah (God) the Highest has kept a great season, which by his own self shall deliver his creature: and he shall order them that are left behind* (2 Esdras 13:26) — *Thou art my Son; this day have I begotten thee* (Psalms 2:7). Come and see: the Man from the sea is Yahusha, the Son of Adam coming with the clouds.',
       sv.verse_id, ev.verse_id, 'extras', 63300
  FROM _session253_2esd13_lookup sv, _session253_2esd13_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=13 AND sv.verse_number=3
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=13 AND ev.verse_number=32
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-13-breath-of-his-mouth-slays-the-wicked',
       E'No sword, but the breath of his mouth',
       E'The gathered armies of the nations storm the Man to subdue him, yet he lifts no weapon: *as he saw the violence of the multitude that came, he neither lifted up his hand, nor held sword, nor any instrument of war* (2 Esdras 13:9), *But only I saw that he sent out of his mouth as it had been a blast of fire, and out of his lips a flaming breath, and out of his tongue he cast out sparks and tempests* (2 Esdras 13:10). The angel reads it as judgment by the word — *he shall destroy them without labour by the law which is like to fire* (2 Esdras 13:38). This is the Branch of Jesse who needs no army: *with righteousness shall he judge the poor, and reprove with equity for the meek of the earth: and he shall smite the earth with the rod of his mouth, and with the breath of his lips shall he slay the wicked* (Isaiah 11:4). Paul saw the same Wicked undone — *And then shall that Wicked be revealed, whom Yahuah (Lord) shall consume with the spirit of his mouth, and shall destroy with the brightness of his coming* (2 Thessalonians 2:8). And John saw the rider whose only weapon is the word — *And out of his mouth goeth a sharp sword, that with it he should smite the nations: and he shall rule them with a rod of iron* (Revelation 19:15). Come and see: the system of man is not broken by man''s sword but by the breath of his mouth.',
       sv.verse_id, ev.verse_id, 'extras', 63303
  FROM _session253_2esd13_lookup sv, _session253_2esd13_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=13 AND sv.verse_number=9
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=13 AND ev.verse_number=38
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-13-mount-zion-built-without-hands',
       E'Standing on Zion, the hill graven without hands',
       E'The Man flies up to a mountain he himself has graved — *he had graved himself a great mountain, and flew up upon it* (2 Esdras 13:6) — and the angel sets the Son there in the last day: *But he shall stand upon the top of the mount Sion. And Sion shall come, and shall be shewed to all men, being prepared and builded, like as you sawest the hill graven without hands* (2 Esdras 13:35-36). This is the King set on the holy hill, the inheritance promised to the Son — *Yet have I set my king upon my holy hill of Zion* (Psalms 2:6). John saw the Lamb stand on that very mount with the firstfruits, and the gathered host that no man could number standing before the throne — *After this I beheld, and, lo, a great multitude, which no man could number, of all nations, and kindreds, and people, and tongues, stood before the throne, and before the Lamb, clothed with white robes, and palms in their hands* (Revelation 7:9). Come and see: the hill built without hands is Zion prepared from before, where the Son gathers his own.',
       sv.verse_id, ev.verse_id, 'extras', 63306
  FROM _session253_2esd13_lookup sv, _session253_2esd13_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=13 AND sv.verse_number=6
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=13 AND ev.verse_number=36
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-13-ten-tribes-arzareth-two-house-gathering',
       E'The ten tribes of Arzareth and the two-house gathering',
       E'The peaceable multitude the Son gathers are named: *Those are the ten tribes, which were carried away prisoners out of their own land in the time of Osea the king, whom Salmanasar the king of Assyria led away captive, and he carried them over the waters, and so came they into another land* (2 Esdras 13:40) — into the far country *called Arsareth* (2 Esdras 13:45), kept until *the latter time; and now when they shall begin to come, The Highest shall stay the springs of the stream again, that they may go through* (2 Esdras 13:46-47). This is not a new people supplanting the old; it is the lost house of Israel coming home. Isaiah named the day — *Yahuah (Lord) shall set his hand again the second time to recover the remnant of his people, which shall be left, from Assyria* (Isaiah 11:11), and *shall assemble the outcasts of Yashar''el (Israel), and gather together the dispersed of Yahudah (Judah) from the four corners of the earth* (Isaiah 11:12). Ezekiel saw the two sticks made one — *And I will make them one nation in the land upon the mountains of Yashar''el (Israel); and one king shall be king to them all: and they shall be no more two nations* (Ezekiel 37:22). Hosea saw both houses under one head — *Then shall the children of Yahudah (Judah) and the children of Yashar''el (Israel) be gathered together, and appoint themselves one head, and they shall come up out of the land: for great shall be the day of Jezreel* (Hosea 1:11). And Jeremiah saw the Shepherd lead them home — *Behold, I will bring them from the north country, and gather them from the coasts of the earth... a great company shall return thither* (Jeremiah 31:8). Come and see: Arzareth''s return is the regathering of the whole house — Israel is not cast away (Romans 11:1).',
       sv.verse_id, ev.verse_id, 'extras', 63309
  FROM _session253_2esd13_lookup sv, _session253_2esd13_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=13 AND sv.verse_number=39
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=13 AND ev.verse_number=47
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-13-remnant-defended-israel-not-cast-away',
       E'He defends the remnant that remain',
       E'When the Son consumes the warring nations, he does not abolish his people but shelters them: *Now when he destroys the multitude of the nations that are gathered together, he shall defend his people that remain* (2 Esdras 13:49). The ones kept are *they that are found within my borders* (2 Esdras 13:48) — the faithful remnant, not a replacement. Paul guards exactly this: *I say then, Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham, of the tribe of Benjamin* (Romans 11:1). The unfaithful generation forfeits, but election precedes confession, and even those once Lo-ammi are reclaimed — *Yet the number of the children of Yashar''el (Israel) shall be as the sand of the sea... in the place where it was said unto them, Ye are not my people, there it shall be said unto them, Ye are the sons of the living Elohim (God)* (Hosea 1:10). Come and see: the day of deliverance defends the remnant of both houses; Israel is never cast away.',
       sv.verse_id, ev.verse_id, 'extras', 63312
  FROM _session253_2esd13_lookup sv, _session253_2esd13_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=13 AND sv.verse_number=48
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=13 AND ev.verse_number=49
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-esdras-13-man-from-the-sea-with-the-clouds
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 7:13 — *I saw in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him.* Ezra''s Man waxing strong with the thousands of heaven is Daniel''s Son of Adam coming with the clouds, before whom all things tremble.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd13_lookup sv, _session253_2esd13_lookup tv
 WHERE t.slug='2-esdras-13-man-from-the-sea-with-the-clouds'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=13 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 7:14 — *And there was given him dominion, and glory, and a kingdom, that all people, nations, and languages, should serve him: his dominion is an everlasting dominion, which shall not pass away, and his kingdom that which shall not be destroyed.* When the Son is declared as the man ascending, the everlasting kingdom Daniel saw given to the Son of Adam is his.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd13_lookup sv, _session253_2esd13_lookup tv
 WHERE t.slug='2-esdras-13-man-from-the-sea-with-the-clouds'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=13 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalms 2:7 — *I will declare the decree: Yahuah (LORD) hath said unto me, Thou art my Son; this day have I begotten thee.* The One whom the Highest has kept a great season to deliver his creature is the begotten Son of the decree.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd13_lookup sv, _session253_2esd13_lookup tv
 WHERE t.slug='2-esdras-13-man-from-the-sea-with-the-clouds'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=13 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-13-breath-of-his-mouth-slays-the-wicked
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 11:4 — *But with righteousness shall he judge the poor, and reprove with equity for the meek of the earth: and he shall smite the earth with the rod of his mouth, and with the breath of his lips shall he slay the wicked.* The blast of fire and flaming breath from the Man''s mouth is Isaiah''s Branch slaying the wicked with the breath of his lips.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd13_lookup sv, _session253_2esd13_lookup tv
 WHERE t.slug='2-esdras-13-breath-of-his-mouth-slays-the-wicked'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=13 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Thessalonians 2:8 — *And then shall that Wicked be revealed, whom Yahuah (Lord) shall consume with the spirit of his mouth, and shall destroy with the brightness of his coming.* The Son destroying the wicked without labour by the law like fire is the Lord consuming the Wicked with the spirit of his mouth.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd13_lookup sv, _session253_2esd13_lookup tv
 WHERE t.slug='2-esdras-13-breath-of-his-mouth-slays-the-wicked'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=13 AND sv.verse_number=38
   AND tv.edition_slug='canon' AND tv.book_slug='2-thessalonians' AND tv.chapter_number=2 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 19:15 — *And out of his mouth goeth a sharp sword, that with it he should smite the nations: and he shall rule them with a rod of iron: and he treadeth the winepress of the fierceness and wrath of El Shaddai (Almighty God).* The Man who holds no instrument of war is John''s rider whose sword proceeds from his mouth to smite the nations.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd13_lookup sv, _session253_2esd13_lookup tv
 WHERE t.slug='2-esdras-13-breath-of-his-mouth-slays-the-wicked'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=13 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=19 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-13-mount-zion-built-without-hands
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalms 2:6 — *Yet have I set my king upon my holy hill of Zion.* The Son standing on the top of mount Sion is the King the Father sets upon his holy hill.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd13_lookup sv, _session253_2esd13_lookup tv
 WHERE t.slug='2-esdras-13-mount-zion-built-without-hands'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=13 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=2 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 7:9 — *After this I beheld, and, lo, a great multitude, which no man could number, of all nations, and kindreds, and people, and tongues, stood before the throne, and before the Lamb, clothed with white robes, and palms in their hands.* Zion shewed to all men, prepared and builded without hands, is where John''s innumerable multitude stands before the Lamb.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd13_lookup sv, _session253_2esd13_lookup tv
 WHERE t.slug='2-esdras-13-mount-zion-built-without-hands'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=13 AND sv.verse_number=36
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-13-ten-tribes-arzareth-two-house-gathering
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 11:11 — *And it shall come to pass in that day, that Yahuah (Lord) shall set his hand again the second time to recover the remnant of his people, which shall be left, from Assyria, and from Egypt, and from Pathros, and from Cush, and from Elam, and from Shinar, and from Hamath, and from the islands of the sea.* The ten tribes carried beyond the river and now beginning to come are the remnant Yahuah recovers a second time from Assyria.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd13_lookup sv, _session253_2esd13_lookup tv
 WHERE t.slug='2-esdras-13-ten-tribes-arzareth-two-house-gathering'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=13 AND sv.verse_number=47
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 11:12 — *And he shall set up an ensign for the nations, and shall assemble the outcasts of Yashar''el (Israel), and gather together the dispersed of Yahudah (Judah) from the four corners of the earth.* The peaceable multitude returning with peace is the outcasts of Israel and the dispersed of Judah assembled from the four corners.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd13_lookup sv, _session253_2esd13_lookup tv
 WHERE t.slug='2-esdras-13-ten-tribes-arzareth-two-house-gathering'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=13 AND sv.verse_number=47
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 37:22 — *And I will make them one nation in the land upon the mountains of Yashar''el (Israel); and one king shall be king to them all: and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all.* The ten tribes led captive by Assyria are the divided kingdom Ezekiel sees made one nation under one king.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd13_lookup sv, _session253_2esd13_lookup tv
 WHERE t.slug='2-esdras-13-ten-tribes-arzareth-two-house-gathering'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=13 AND sv.verse_number=40
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Hosea 1:11 — *Then shall the children of Yahudah (Judah) and the children of Yashar''el (Israel) be gathered together, and appoint themselves one head, and they shall come up out of the land: for great shall be the day of Jezreel.* The peaceable multitude gathered to the Son is Judah and Israel gathered together under one head.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd13_lookup sv, _session253_2esd13_lookup tv
 WHERE t.slug='2-esdras-13-ten-tribes-arzareth-two-house-gathering'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=13 AND sv.verse_number=39
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=1 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jeremiah 31:8 — *Behold, I will bring them from the north country, and gather them from the coasts of the earth, and with them the blind and the lame, the woman with child and her that travaileth with child together: a great company shall return thither.* The Highest staying the stream so the tribes may pass through is the great company Yahuah brings home from the north country.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd13_lookup sv, _session253_2esd13_lookup tv
 WHERE t.slug='2-esdras-13-ten-tribes-arzareth-two-house-gathering'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=13 AND sv.verse_number=47
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-13-remnant-defended-israel-not-cast-away
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Romans 11:1 — *I say then, Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham, of the tribe of Benjamin.* The Son defending his people that remain is Paul''s witness that Elohim has not cast away his people.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd13_lookup sv, _session253_2esd13_lookup tv
 WHERE t.slug='2-esdras-13-remnant-defended-israel-not-cast-away'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=13 AND sv.verse_number=49
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hosea 1:10 — *Yet the number of the children of Yashar''el (Israel) shall be as the sand of the sea, which cannot be measured nor numbered; and it shall come to pass, that in the place where it was said unto them, Ye are not my people, there it shall be said unto them, Ye are the sons of the living Elohim (God).* Those found within his borders, defended in that day, are the once-disowned reclaimed as sons of the living Elohim.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd13_lookup sv, _session253_2esd13_lookup tv
 WHERE t.slug='2-esdras-13-remnant-defended-israel-not-cast-away'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=13 AND sv.verse_number=48
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=1 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2esdras_14.sql (session253 2-esdras 14) -----
-- Source anchor: apocrypha/2-esdras ch14. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2esd14 (view _session253_2esd14_lookup). Sort band base 63325, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2esd14_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-esdras-14-voice-from-the-bush
  ('apocrypha', '2-esdras', 14, 1, 'canon', 'exodus', 3, 2, 'free', E'Exodus 3:2 — *And the angel of Yahuah (LORD) appeared unto him in a flame of fire out of the midst of a bush: and he looked, and, behold, the bush burned with fire, and the bush was not consumed.* The bush that calls Esdras is the very bush of Horeb, named outright in the next verses.'),
  ('apocrypha', '2-esdras', 14, 2, 'canon', 'exodus', 3, 4, 'free', E'Exodus 3:4 — *And when Yahuah (LORD) saw that he turned aside to see, Elohim (God) called unto him out of the midst of the bush, and said, Moses, Moses. And he said, Here am I.* Esdras answers "Here am I" with the same words and to the same doubled call that Moses gave.'),
  ('apocrypha', '2-esdras', 14, 3, 'canon', 'exodus', 3, 6, 'free', E'Exodus 3:6 — *Moreover he said, I am the Elohim (God) of thy father, the Elohim (God) of Abraham, the Elohim (God) of Isaac, and the Elohim (God) of Jacob. And Moses hid his face; for he was afraid to look upon Elohim (God).* The One who manifestly revealed Himself to Moses in the bush is the One now revealing Himself to Esdras.'),
  ('apocrypha', '2-esdras', 14, 4, 'canon', 'exodus', 3, 10, 'free', E'Exodus 3:10 — *Come now therefore, and I will send thee unto Pharaoh, that thou mayest bring forth my people the children of Yashar''el (Israel) out of Egypt.* The sending and leading of the people out of Egypt that Esdras recalls is the commission given at the bush.'),
  -- thread: 2-esdras-14-taken-to-remain-with-the-son
  ('apocrypha', '2-esdras', 14, 9, 'canon', 'genesis', 5, 24, 'free', E'Genesis 5:24 — *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him.* Esdras being "taken away from all" without ordinary death is the Enoch translation he himself parallels.'),
  ('apocrypha', '2-esdras', 14, 9, 'canon', '2-kings', 2, 11, 'free', E'2 Kings 2:11 — *And it came to pass, as they still went on, and talked, that, behold, there appeared a chariot of fire, and horses of fire, and parted them both asunder; and Elijah went up by a whirlwind into heaven.* Elijah''s bodily taking is the same translation into which Esdras is gathered to remain until the times be ended.'),
  ('apocrypha', '2-esdras', 14, 9, 'canon', 'hebrews', 11, 5, 'free', E'Hebrews 11:5 — *By faith Enoch was translated that he should not see death; and was not found, because Elohim (God) had translated him: for before his translation he had this testimony, that he pleased Elohim (God).* The not-seeing-death that pleased Elohim is exactly the lot promised Esdras, taken to abide with the Son.'),
  ('apocrypha', '2-esdras', 14, 9, 'canon', 'acts', 1, 9, 'free', E'Acts 1:9 — *And when he had spoken these things, while they beheld, he was taken up; and a cloud received him out of their sight.* The "my Son" with whom Esdras is to remain was Himself taken up; the translated wait with the ascended Messiah.'),
  -- thread: 2-esdras-14-the-law-is-burnt
  ('apocrypha', '2-esdras', 14, 21, 'canon', 'jeremiah', 36, 28, 'free', E'Jeremiah 36:28 — *Take thee again another roll, and write in it all the former words that were in the first roll, which Jehoiakim the king of Yahudah (Judah) hath burned.* The burnt-law-rewritten of Esdras is the same mercy Jeremiah received when the king burned the scroll.'),
  ('apocrypha', '2-esdras', 14, 22, 'canon', 'jeremiah', 36, 32, 'free', E'Jeremiah 36:32 — *Then took Jeremiah another roll, and gave it to Baruch the scribe, the son of Neriah; who wrote therein from the mouth of Jeremiah all the words of the book which Jehoiakim king of Yahudah (Judah) had burned in the fire: and there were added besides unto them many like words.* Esdras dictating the restored Word by the Spirit mirrors Jeremiah dictating to Baruch after the fire.'),
  ('apocrypha', '2-esdras', 14, 21, 'canon', 'psalms', 119, 89, 'free', E'Psalm 119:89 — *For ever, O Yahuah (LORD), thy word is settled in heaven.* Though the law be burnt on earth, it stands settled in heaven, and so can be restored to men.'),
  -- thread: 2-esdras-14-cup-of-fire-wisdom
  ('apocrypha', '2-esdras', 14, 39, 'canon', 'john', 4, 14, 'free', E'John 4:14 — *But whosoever drinketh of the water that I shall give him shall never thirst; but the water that I shall give him shall be in him a well of water springing up into everlasting life.* The cup like water yet like fire, drunk inward, is the living water that becomes a well of understanding within.'),
  ('apocrypha', '2-esdras', 14, 40, 'canon', 'john', 7, 38, 'free', E'John 7:38 — *He that believeth on me, as the scripture hath said, out of his belly shall flow rivers of living water.* Wisdom growing in Esdras''s breast so his mouth pours forth is the river of the Spirit flowing out of the inward man.'),
  ('apocrypha', '2-esdras', 14, 22, 'canon', 'john', 4, 14, 'free', E'John 4:14 — *But whosoever drinketh of the water that I shall give him shall never thirst; but the water that I shall give him shall be in him a well of water springing up into everlasting life.* The Ruach HaKodesh Esdras prays into himself to write the Word is this springing well of the Spirit.'),
  -- thread: 2-esdras-14-after-death-the-judgment
  ('apocrypha', '2-esdras', 14, 35, 'canon', 'daniel', 12, 2, 'free', E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* Esdras''s "after death... when we shall live again" with the righteous made manifest and the ungodly declared is Daniel''s resurrection to life or to contempt.'),
  ('apocrypha', '2-esdras', 14, 34, 'canon', 'daniel', 12, 3, 'free', E'Daniel 12:3 — *And they that be wise shall shine as the brightness of the firmament; and they that turn many to righteousness as the stars for ever and ever.* The kept-alive who obtain mercy and whose names are made manifest are the wise who shine in Daniel''s rising.'),
  -- thread: 2-esdras-14-ninety-four-books
  ('apocrypha', '2-esdras', 14, 46, 'canon', 'deuteronomy', 31, 26, 'free', E'Deuteronomy 31:26 — *Take this book of the law, and put it in the side of the ark of the covenant of Yahuah Elohaychem (the LORD your God), that it may be there for a witness against thee.* The seventy books reserved beside the public canon echo the law-book kept by the ark as a witness.'),
  ('apocrypha', '2-esdras', 14, 6, 'canon', 'matthew', 13, 11, 'free', E'Matthew 13:11 — *He answered and said unto them, Because it is given unto you to know the mysteries of the kingdom of heaven, but to them it is not given.* "These words shall you declare, and these shall you hide" is the Master''s own pattern of mysteries entrusted to the wise.'),
  ('apocrypha', '2-esdras', 14, 45, 'canon', 'revelation', 22, 18, 'free', E'Revelation 22:18 — *For I testify unto every man that heareth the words of the prophecy of this book, If any man shall add unto these things, Elohim (God) shall add unto him the plagues that are written in this book:* The openly-published Word is the canon that may be neither added to nor diminished.'),
  ('apocrypha', '2-esdras', 14, 45, 'canon', 'revelation', 22, 19, 'free', E'Revelation 22:19 — *And if any man shall take away from the words of the book of this prophecy, Elohim (God) shall take away his part out of the book of life, and out of the holy city, and from the things which are written in this book.* The Word published "that the worthy and unworthy may read it" is sealed against subtraction as well as addition.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2esd14_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2esd14_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-14-voice-from-the-bush',
       E'The Voice Out of the Bush — Esdras Called as Moses Was',
       E'Ezra is hailed from a bush as Moses was at Horeb: *And it came to pass upon the third day, I sat under an oak, and, behold, there came a voice out of a bush over against me, and said, Esdras, Esdras* (2 Esdras 14:1), and *In the bush I did manifestly reveal myself to Moses, and talked with him, when my people served in Egypt* (2 Esdras 14:3). The pattern is the burning bush itself — *the bush burned with fire, and the bush was not consumed* (Exodus 3:2) — and the doubled name of the called man: *Elohim called unto him out of the midst of the bush, and said, Moses, Moses. And he said, Here am I* (Exodus 3:4), answered word-for-word by *And I said, Here am I, Yahuah* (2 Esdras 14:2). It ain''t new: the same Voice that raised up the first deliverer raises up the restorer of the Word.',
       sv.verse_id, ev.verse_id, 'extras', 63325
  FROM _session253_2esd14_lookup sv, _session253_2esd14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=14 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=14 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-14-taken-to-remain-with-the-son',
       E'Taken Away to Remain With My Son — The Translation Pattern',
       E'Esdras is told he will not die in the common way but be taken up: *For you shall be taken away from all, and from henceforth you shall remain with my Son, and with such as be like you, until the times be ended* (2 Esdras 14:9), and at the last, *And I did so* — his work finished, he is gathered (2 Esdras 14:48). This is the translation pattern of Enoch and Elijah, the men who *were not, for Elohim took* them: *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him* (Genesis 5:24); *Elijah went up by a whirlwind into heaven* (2 Kings 2:11). Note 2 Esdras''s own messianism: Esdras is to abide *with my Son* — and the Son Himself was taken up bodily, *a cloud received him out of their sight* (Acts 1:9). The translated saints await Him.',
       sv.verse_id, ev.verse_id, 'extras', 63328
  FROM _session253_2esd14_lookup sv, _session253_2esd14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=14 AND sv.verse_number=9
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=14 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-14-the-law-is-burnt',
       E'Thy Law Is Burnt — The Word Rewritten',
       E'Esdras grieves that the Scriptures are destroyed and prays for their restoration: *For your law is burnt, therefore no man knoweth the things that are done of you, or the work that shall begin* (2 Esdras 14:21), and *send the Ruach HaKodesh (Holy Spirit) into me, and I shall write all that has been done in the world since the beginning, which were written in your law, that men may find your path, and that they which will live in the latter days may live* (2 Esdras 14:22). The Word was burnt once before, by a king''s fire, and rewritten at Yahuah''s command: *Then the word of Yahuah came to Jeremiah, after that the king had burned the roll... Take thee again another roll, and write in it all the former words* (Jeremiah 36:27-28), and Baruch *wrote therein from the mouth of Jeremiah all the words of the book which Jehoiakim king of Yahudah had burned in the fire: and there were added besides unto them many like words* (Jeremiah 36:32). The Word cannot be burned out of being, *For ever, O Yahuah, thy word is settled in heaven* (Psalm 119:89).',
       sv.verse_id, ev.verse_id, 'extras', 63331
  FROM _session253_2esd14_lookup sv, _session253_2esd14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=14 AND sv.verse_number=21
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=14 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-14-cup-of-fire-wisdom',
       E'The Cup Like Fire — Living Water and Understanding',
       E'Esdras is given a cup to drink that floods him with wisdom: *he reached me a full cup, which was full as it were with water, but the colour of it was like fire* (2 Esdras 14:39), and *when I had drunk of it, my heart uttered understanding, and wisdom grew in my breast, for my spirit strengthened my memory* (2 Esdras 14:40). The Messiah offers the same indwelling draught of the Spirit: *whosoever drinketh of the water that I shall give him shall never thirst; but the water that I shall give him shall be in him a well of water springing up into everlasting life* (John 4:14), and *out of his belly shall flow rivers of living water* (John 7:38). The fiery cup that opens Esdras''s mouth that it is *opened, and shut no more* is the Spirit poured into a vessel to make him speak.',
       sv.verse_id, ev.verse_id, 'extras', 63334
  FROM _session253_2esd14_lookup sv, _session253_2esd14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=14 AND sv.verse_number=39
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=14 AND ev.verse_number=41
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-14-after-death-the-judgment',
       E'After Death the Judgment — When We Shall Live Again',
       E'Esdras preaches resurrection and a manifest judgment to the regathered remnant: *if so be that you will subdue your own understanding, and reform your hearts, you shall be kept alive and after death you shall obtain mercy* (2 Esdras 14:34), and *For after death shall the judgment come, when we shall live again: and then shall the names of the righteous be manifest, and the works of the ungodly shall be declared* (2 Esdras 14:35). This is Daniel''s two-fold awaking: *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt* (Daniel 12:2). The 4 Ezra resurrection hope is no church-novelty — it is the Tanakh''s own promise, kept for the faithful of both houses who reform their hearts.',
       sv.verse_id, ev.verse_id, 'extras', 63337
  FROM _session253_2esd14_lookup sv, _session253_2esd14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=14 AND sv.verse_number=34
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=14 AND ev.verse_number=35
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-14-ninety-four-books',
       E'The Twenty-Four and the Seventy — Words Declared and Words Hidden',
       E'The whole canon-question lives in Esdras''s commission: *These words shall you declare, and these shall you hide* (2 Esdras 14:6); the five scribes write *two hundred and four books* (2 Esdras 14:44 — ninety-four in the older count), and the order comes, *The first that you have written publish openly, that the worthy and unworthy may read it: But keep the seventy last, that you may deliver them only to such as be wise among the people* (2 Esdras 14:45-46). A book kept beside the ark is the Tanakh''s own pattern: *Take this book of the law, and put it in the side of the ark of the covenant of Yahuah Elohaychem, that it may be there for a witness against thee* (Deuteronomy 31:26). Hidden things for the wise is the Master''s own way — *Because it is given unto you to know the mysteries of the kingdom of heaven, but to them it is not given* (Matthew 13:11). Yet the published Word stands inviolable and complete: *If any man shall add unto these things, Elohim shall add unto him the plagues that are written in this book* (Revelation 22:18).',
       sv.verse_id, ev.verse_id, 'extras', 63340
  FROM _session253_2esd14_lookup sv, _session253_2esd14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=14 AND sv.verse_number=44
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=14 AND ev.verse_number=47
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-esdras-14-voice-from-the-bush
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 3:2 — *And the angel of Yahuah (LORD) appeared unto him in a flame of fire out of the midst of a bush: and he looked, and, behold, the bush burned with fire, and the bush was not consumed.* The bush that calls Esdras is the very bush of Horeb, named outright in the next verses.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd14_lookup sv, _session253_2esd14_lookup tv
 WHERE t.slug='2-esdras-14-voice-from-the-bush'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=14 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=3 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 3:4 — *And when Yahuah (LORD) saw that he turned aside to see, Elohim (God) called unto him out of the midst of the bush, and said, Moses, Moses. And he said, Here am I.* Esdras answers "Here am I" with the same words and to the same doubled call that Moses gave.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd14_lookup sv, _session253_2esd14_lookup tv
 WHERE t.slug='2-esdras-14-voice-from-the-bush'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=14 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=3 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 3:6 — *Moreover he said, I am the Elohim (God) of thy father, the Elohim (God) of Abraham, the Elohim (God) of Isaac, and the Elohim (God) of Jacob. And Moses hid his face; for he was afraid to look upon Elohim (God).* The One who manifestly revealed Himself to Moses in the bush is the One now revealing Himself to Esdras.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd14_lookup sv, _session253_2esd14_lookup tv
 WHERE t.slug='2-esdras-14-voice-from-the-bush'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=14 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=3 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Exodus 3:10 — *Come now therefore, and I will send thee unto Pharaoh, that thou mayest bring forth my people the children of Yashar''el (Israel) out of Egypt.* The sending and leading of the people out of Egypt that Esdras recalls is the commission given at the bush.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd14_lookup sv, _session253_2esd14_lookup tv
 WHERE t.slug='2-esdras-14-voice-from-the-bush'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=14 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=3 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-14-taken-to-remain-with-the-son
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 5:24 — *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him.* Esdras being "taken away from all" without ordinary death is the Enoch translation he himself parallels.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd14_lookup sv, _session253_2esd14_lookup tv
 WHERE t.slug='2-esdras-14-taken-to-remain-with-the-son'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=14 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Kings 2:11 — *And it came to pass, as they still went on, and talked, that, behold, there appeared a chariot of fire, and horses of fire, and parted them both asunder; and Elijah went up by a whirlwind into heaven.* Elijah''s bodily taking is the same translation into which Esdras is gathered to remain until the times be ended.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd14_lookup sv, _session253_2esd14_lookup tv
 WHERE t.slug='2-esdras-14-taken-to-remain-with-the-son'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=14 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=2 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 11:5 — *By faith Enoch was translated that he should not see death; and was not found, because Elohim (God) had translated him: for before his translation he had this testimony, that he pleased Elohim (God).* The not-seeing-death that pleased Elohim is exactly the lot promised Esdras, taken to abide with the Son.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd14_lookup sv, _session253_2esd14_lookup tv
 WHERE t.slug='2-esdras-14-taken-to-remain-with-the-son'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=14 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Acts 1:9 — *And when he had spoken these things, while they beheld, he was taken up; and a cloud received him out of their sight.* The "my Son" with whom Esdras is to remain was Himself taken up; the translated wait with the ascended Messiah.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd14_lookup sv, _session253_2esd14_lookup tv
 WHERE t.slug='2-esdras-14-taken-to-remain-with-the-son'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=14 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=1 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-14-the-law-is-burnt
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 36:28 — *Take thee again another roll, and write in it all the former words that were in the first roll, which Jehoiakim the king of Yahudah (Judah) hath burned.* The burnt-law-rewritten of Esdras is the same mercy Jeremiah received when the king burned the scroll.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd14_lookup sv, _session253_2esd14_lookup tv
 WHERE t.slug='2-esdras-14-the-law-is-burnt'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=14 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=36 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 36:32 — *Then took Jeremiah another roll, and gave it to Baruch the scribe, the son of Neriah; who wrote therein from the mouth of Jeremiah all the words of the book which Jehoiakim king of Yahudah (Judah) had burned in the fire: and there were added besides unto them many like words.* Esdras dictating the restored Word by the Spirit mirrors Jeremiah dictating to Baruch after the fire.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd14_lookup sv, _session253_2esd14_lookup tv
 WHERE t.slug='2-esdras-14-the-law-is-burnt'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=14 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=36 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 119:89 — *For ever, O Yahuah (LORD), thy word is settled in heaven.* Though the law be burnt on earth, it stands settled in heaven, and so can be restored to men.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd14_lookup sv, _session253_2esd14_lookup tv
 WHERE t.slug='2-esdras-14-the-law-is-burnt'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=14 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=119 AND tv.verse_number=89
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-14-cup-of-fire-wisdom
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 4:14 — *But whosoever drinketh of the water that I shall give him shall never thirst; but the water that I shall give him shall be in him a well of water springing up into everlasting life.* The cup like water yet like fire, drunk inward, is the living water that becomes a well of understanding within.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd14_lookup sv, _session253_2esd14_lookup tv
 WHERE t.slug='2-esdras-14-cup-of-fire-wisdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=14 AND sv.verse_number=39
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=4 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 7:38 — *He that believeth on me, as the scripture hath said, out of his belly shall flow rivers of living water.* Wisdom growing in Esdras''s breast so his mouth pours forth is the river of the Spirit flowing out of the inward man.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd14_lookup sv, _session253_2esd14_lookup tv
 WHERE t.slug='2-esdras-14-cup-of-fire-wisdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=14 AND sv.verse_number=40
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=7 AND tv.verse_number=38
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 4:14 — *But whosoever drinketh of the water that I shall give him shall never thirst; but the water that I shall give him shall be in him a well of water springing up into everlasting life.* The Ruach HaKodesh Esdras prays into himself to write the Word is this springing well of the Spirit.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd14_lookup sv, _session253_2esd14_lookup tv
 WHERE t.slug='2-esdras-14-cup-of-fire-wisdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=14 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=4 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-14-after-death-the-judgment
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* Esdras''s "after death... when we shall live again" with the righteous made manifest and the ungodly declared is Daniel''s resurrection to life or to contempt.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd14_lookup sv, _session253_2esd14_lookup tv
 WHERE t.slug='2-esdras-14-after-death-the-judgment'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=14 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 12:3 — *And they that be wise shall shine as the brightness of the firmament; and they that turn many to righteousness as the stars for ever and ever.* The kept-alive who obtain mercy and whose names are made manifest are the wise who shine in Daniel''s rising.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd14_lookup sv, _session253_2esd14_lookup tv
 WHERE t.slug='2-esdras-14-after-death-the-judgment'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=14 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-14-ninety-four-books
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 31:26 — *Take this book of the law, and put it in the side of the ark of the covenant of Yahuah Elohaychem (the LORD your God), that it may be there for a witness against thee.* The seventy books reserved beside the public canon echo the law-book kept by the ark as a witness.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd14_lookup sv, _session253_2esd14_lookup tv
 WHERE t.slug='2-esdras-14-ninety-four-books'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=14 AND sv.verse_number=46
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=31 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 13:11 — *He answered and said unto them, Because it is given unto you to know the mysteries of the kingdom of heaven, but to them it is not given.* "These words shall you declare, and these shall you hide" is the Master''s own pattern of mysteries entrusted to the wise.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd14_lookup sv, _session253_2esd14_lookup tv
 WHERE t.slug='2-esdras-14-ninety-four-books'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=14 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=13 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 22:18 — *For I testify unto every man that heareth the words of the prophecy of this book, If any man shall add unto these things, Elohim (God) shall add unto him the plagues that are written in this book:* The openly-published Word is the canon that may be neither added to nor diminished.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd14_lookup sv, _session253_2esd14_lookup tv
 WHERE t.slug='2-esdras-14-ninety-four-books'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=14 AND sv.verse_number=45
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 22:19 — *And if any man shall take away from the words of the book of this prophecy, Elohim (God) shall take away his part out of the book of life, and out of the holy city, and from the things which are written in this book.* The Word published "that the worthy and unworthy may read it" is sealed against subtraction as well as addition.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd14_lookup sv, _session253_2esd14_lookup tv
 WHERE t.slug='2-esdras-14-ninety-four-books'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=14 AND sv.verse_number=45
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2esdras_15.sql (session253 2-esdras 15) -----
-- Source anchor: apocrypha/2-esdras ch15. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2esd15 (view _session253_2esd15_lookup). Sort band base 63350, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2esd15_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-esdras-15-sword-sent-who-may-turn
  ('apocrypha', '2-esdras', 15, 5, 'canon', 'jeremiah', 25, 29, 'free', E'Jeremiah 25:29 — *For, lo, I begin to bring evil on the city which is called by my name, and should ye be utterly unpunished? Ye shall not be unpunished: for I will call for a sword upon all the inhabitants of the earth, saith Yahuah Tseva''ot (LORD of hosts).* The plagues Ezra hears decreed on the world are the very sword Jeremiah is told Yahuah will call upon all the inhabitants of the earth.'),
  ('apocrypha', '2-esdras', 15, 8, 'canon', 'jeremiah', 25, 31, 'free', E'Jeremiah 25:31 — *A noise shall come even to the ends of the earth; for Yahuah (LORD) hath a controversy with the nations, he will plead with all flesh; he will give them that are wicked to the sword, saith Yahuah (LORD).* When Ezra''s Yahuah declares He will hold His tongue no more, it is this controversy with the nations breaking its long silence.'),
  ('apocrypha', '2-esdras', 15, 5, 'canon', 'revelation', 6, 8, 'free', E'Revelation 6:8 — *And I looked, and behold a pale horse: and his name that sat on him was Death, and Hell followed with him. And power was given unto them over the fourth part of the earth, to kill with sword, and with hunger, and with death, and with the beasts of the earth.* The sword, famine, death and destruction loosed on Ezra''s world ride out under the fourth seal as the pale horse over the earth.'),
  -- thread: 2-esdras-15-innocent-blood-cries
  ('apocrypha', '2-esdras', 15, 8, 'canon', 'revelation', 6, 10, 'free', E'Revelation 6:10 — *And they cried with a loud voice, saying, How long, O Yahuah (Lord), holy and true, dost thou not judge and avenge our blood on them that dwell on the earth?* The souls of the just that complain continually in Ezra are the souls under the altar crying how long for the avenging of their blood.'),
  ('apocrypha', '2-esdras', 15, 9, 'canon', 'revelation', 18, 24, 'free', E'Revelation 18:24 — *And in her was found the blood of prophets, and of saints, and of all that were slain upon the earth.* Yahuah''s vow to receive to Himself all the innocent blood is answered when that blood is found in Babylon and she is judged for it.'),
  ('apocrypha', '2-esdras', 15, 9, 'canon', 'jeremiah', 25, 31, 'free', E'Jeremiah 25:31 — *A noise shall come even to the ends of the earth; for Yahuah (LORD) hath a controversy with the nations, he will plead with all flesh; he will give them that are wicked to the sword, saith Yahuah (LORD).* The avenging Yahuah promises in Ezra is His standing controversy with the nations over the blood of His own.'),
  -- thread: 2-esdras-15-egypt-plagues-mighty-hand
  ('apocrypha', '2-esdras', 15, 11, 'canon', 'deuteronomy', 4, 34, 'free', E'Deuteronomy 4:34 — *Or hath Elohim (God) assayed to go and take him a nation from the midst of another nation, by temptations, by signs, and by wonders, and by war, and by a mighty hand, and by a stretched out arm, and by great terrors, according to all that Yahuah Elohaychem (the LORD your God) did for you in Egypt before your eyes?* Ezra''s ''mighty hand and stretched out arm'' against Egypt is the very Exodus formula of Yahuah''s redeeming arm.'),
  ('apocrypha', '2-esdras', 15, 11, 'canon', 'ezekiel', 30, 4, 'free', E'Ezekiel 30:4 — *And the sword shall come upon Egypt, and great pain shall be in Ethiopia, when the slain shall fall in Egypt, and they shall take away her multitude, and her foundations shall be broken down.* The plagues Ezra sees smiting Egypt and its foundations are Ezekiel''s day-of-Yahuah sword falling on Egypt''s slain and foundations.'),
  ('apocrypha', '2-esdras', 15, 12, 'canon', 'ezekiel', 30, 13, 'free', E'Ezekiel 30:13 — *Thus saith Adonai Yahuah (the Lord GOD); I will also destroy the idols, and I will cause their images to cease out of Noph; and there shall be no more a prince of the land of Egypt: and I will put a fear in the land of Egypt.* Egypt''s mourning under the plague in Ezra matches the fear Yahuah puts in the land when He strikes its idols and foundations in Ezekiel.'),
  -- thread: 2-esdras-15-woe-keep-not-commandments
  ('apocrypha', '2-esdras', 15, 24, 'canon', 'jeremiah', 25, 15, 'free', E'Jeremiah 25:15 — *For thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel) unto me; Take the wine cup of this fury at my hand, and cause all the nations, to whom I send thee, to drink it.* The woe and plagues poured on the commandment-breakers in Ezra are this cup of fury Yahuah causes all the nations to drink.'),
  ('apocrypha', '2-esdras', 15, 25, 'canon', 'revelation', 18, 4, 'free', E'Revelation 18:4 — *And I heard another voice from heaven, saying, Come out of her, my people, that ye be not partakers of her sins, and that ye receive not of her plagues.* Yahuah''s ''go your way, you children, from the power, defile not my sanctuary'' is the same call to come out of Babylon lest His people share her plagues.'),
  ('apocrypha', '2-esdras', 15, 24, 'canon', 'revelation', 6, 10, 'free', E'Revelation 6:10 — *And they cried with a loud voice, saying, How long, O Yahuah (Lord), holy and true, dost thou not judge and avenge our blood on them that dwell on the earth?* The woe on those who keep not the commandments answers the cry of the slain for Yahuah''s holy and true judgment on them that dwell on the earth.'),
  -- thread: 2-esdras-15-babylon-fallen-plagues-one-day
  ('apocrypha', '2-esdras', 15, 43, 'canon', 'revelation', 18, 2, 'free', E'Revelation 18:2 — *And he cried mightily with a strong voice, saying, Babylon the great is fallen, is fallen, and is become the habitation of devils, and the hold of every foul spirit, and a cage of every unclean and hateful bird.* The Babylon Ezra''s avengers go stedfastly to make afraid is the Babylon the angel cries is fallen, is fallen.'),
  ('apocrypha', '2-esdras', 15, 49, 'canon', 'revelation', 18, 8, 'free', E'Revelation 18:8 — *Therefore shall her plagues come in one day, death, and mourning, and famine; and she shall be utterly burned with fire: for strong is Yahuah Elohim (the Lord God) who judgeth her.* The widowhood, famine, sword and pestilence Yahuah sends on Asia are the very plagues — death, mourning, famine, burning — that fall on Babylon in one day.'),
  ('apocrypha', '2-esdras', 15, 56, 'canon', 'revelation', 18, 6, 'free', E'Revelation 18:6 — *Reward her even as she rewarded you, and double unto her double according to her works: in the cup which she hath filled fill to her double.* Yahuah''s ''like as you have done to my chosen, even so shall Yahuah do to you'' is the lex talionis the seer cries over fallen Babylon.'),
  ('apocrypha', '2-esdras', 15, 53, 'canon', 'revelation', 18, 24, 'free', E'Revelation 18:24 — *And in her was found the blood of prophets, and of saints, and of all that were slain upon the earth.* Asia is judged because ''you had always slain my chosen'' — the same charge of the blood of saints found in Babylon.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2esd15_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2esd15_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-15-sword-sent-who-may-turn',
       E'The sword is sent: I will hold my tongue no more',
       E'Yahuah lifts the restraint on judgment: *Behold, says Yahuah (God), I will bring plagues upon the world; the sword, famine, death, and destruction* (2 Esdras 15:5), for *I will hold my tongue no more as touching their wickedness* (2 Esdras 15:8). This is the prophets'' controversy with all flesh — *A noise shall come even to the ends of the earth; for Yahuah (LORD) hath a controversy with the nations, he will plead with all flesh; he will give them that are wicked to the sword, saith Yahuah (LORD)* (Jeremiah 25:31). The four scourges of Ezra are the four sore judgments of Ezekiel — *for I will call for a sword upon all the inhabitants of the earth, saith Yahuah Tseva''ot (LORD of hosts)* (Jeremiah 25:29). It ain''t new: the same sword that hangs over the nations in the prophets is the sword the seer of Ezra still sees coming.',
       sv.verse_id, ev.verse_id, 'extras', 63350
  FROM _session253_2esd15_lookup sv, _session253_2esd15_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=15 AND sv.verse_number=5
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=15 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-15-innocent-blood-cries',
       E'The innocent blood cries to me',
       E'The martyrs are not forgotten: *behold, the innocent and righteous blood cries to me, and the souls of the just complain continually* (2 Esdras 15:8), and so *I will surely avenge them, and receive to me all the innocent blood from among them* (2 Esdras 15:9). This is the cry under the altar — *And they cried with a loud voice, saying, How long, O Yahuah (Lord), holy and true, dost thou not judge and avenge our blood on them that dwell on the earth?* (Revelation 6:10). The blood that cries is the blood Babylon is finally charged with — *And in her was found the blood of prophets, and of saints, and of all that were slain upon the earth* (Revelation 18:24). It ain''t new: from Abel onward the righteous blood cries up from the ground, and Yahuah hears.',
       sv.verse_id, ev.verse_id, 'extras', 63353
  FROM _session253_2esd15_lookup sv, _session253_2esd15_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=15 AND sv.verse_number=8
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=15 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-15-egypt-plagues-mighty-hand',
       E'I will smite Egypt with plagues as before',
       E'The deliverance is rehearsed in judgment''s key: *I will bring them with a mighty hand and a stretched out arm, and smite Egypt with plagues, as before, and will destroy all the land thereof* (2 Esdras 15:11). The mighty-hand-and-stretched-arm is the Exodus formula — *Or hath Elohim (God) assayed to go and take him a nation from the midst of another nation... by a mighty hand, and by a stretched out arm... according to all that Yahuah Elohaychem (the LORD your God) did for you in Egypt before your eyes?* (Deuteronomy 4:34). And the renewed sword upon Egypt is Ezekiel''s oracle — *And the sword shall come upon Egypt, and great pain shall be in Ethiopia, when the slain shall fall in Egypt* (Ezekiel 30:4). It ain''t new: the Arm that broke Egypt once breaks the proud world-system again.',
       sv.verse_id, ev.verse_id, 'extras', 63356
  FROM _session253_2esd15_lookup sv, _session253_2esd15_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=15 AND sv.verse_number=10
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=15 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-15-woe-keep-not-commandments',
       E'Woe to them that keep not my commandments',
       E'The woe falls on the world for covenant-breaking: *Woe to them that sin, and keep not my commandments! says Yahuah (God)* (2 Esdras 15:24), and *defile not my sanctuary* (2 Esdras 15:25). The cup of fury is passed to every nation — *Take the wine cup of this fury at my hand, and cause all the nations, to whom I send thee, to drink it* (Jeremiah 25:15). And the call to come out before the plagues fall is Babylon''s own — *Come out of her, my people, that ye be not partakers of her sins, and that ye receive not of her plagues* (Revelation 18:4). It ain''t new: Torah stands, and the woe is on those who keep not the commandments, never on those who do; the kept seed is called out before wrath.',
       sv.verse_id, ev.verse_id, 'extras', 63359
  FROM _session253_2esd15_lookup sv, _session253_2esd15_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=15 AND sv.verse_number=24
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=15 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-15-babylon-fallen-plagues-one-day',
       E'Babylon made afraid: the plagues in one day',
       E'The vision turns on Babylon and her partner Asia: *They shall go stedfastly to Babylon, and make her afraid* (2 Esdras 15:43), and to Asia — *I will send plagues upon you; widowhood, poverty, famine, sword, and pestilence* (2 Esdras 15:49). This is the fall the seer of Patmos saw — *Babylon the great is fallen, is fallen, and is become the habitation of devils* (Revelation 18:2) — her plagues converging in a single day — *Therefore shall her plagues come in one day, death, and mourning, and famine; and she shall be utterly burned with fire* (Revelation 18:8). And the harlot''s recompense for slaying the chosen — *Reward her even as she rewarded you, and double unto her double according to her works* (Revelation 18:6) — is Ezra''s *Like as you have done to my chosen... even so shall Yahuah (God) do to you* (2 Esdras 15:56). The system is dismantled; the eagle-empire and her glory are burned. It ain''t new: the Babylon of the prophets is the Babylon of the seer is the Babylon of Ezra.',
       sv.verse_id, ev.verse_id, 'extras', 63362
  FROM _session253_2esd15_lookup sv, _session253_2esd15_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=15 AND sv.verse_number=43
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=15 AND ev.verse_number=56
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-esdras-15-sword-sent-who-may-turn
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 25:29 — *For, lo, I begin to bring evil on the city which is called by my name, and should ye be utterly unpunished? Ye shall not be unpunished: for I will call for a sword upon all the inhabitants of the earth, saith Yahuah Tseva''ot (LORD of hosts).* The plagues Ezra hears decreed on the world are the very sword Jeremiah is told Yahuah will call upon all the inhabitants of the earth.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd15_lookup sv, _session253_2esd15_lookup tv
 WHERE t.slug='2-esdras-15-sword-sent-who-may-turn'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=15 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=25 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 25:31 — *A noise shall come even to the ends of the earth; for Yahuah (LORD) hath a controversy with the nations, he will plead with all flesh; he will give them that are wicked to the sword, saith Yahuah (LORD).* When Ezra''s Yahuah declares He will hold His tongue no more, it is this controversy with the nations breaking its long silence.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd15_lookup sv, _session253_2esd15_lookup tv
 WHERE t.slug='2-esdras-15-sword-sent-who-may-turn'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=15 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=25 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 6:8 — *And I looked, and behold a pale horse: and his name that sat on him was Death, and Hell followed with him. And power was given unto them over the fourth part of the earth, to kill with sword, and with hunger, and with death, and with the beasts of the earth.* The sword, famine, death and destruction loosed on Ezra''s world ride out under the fourth seal as the pale horse over the earth.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd15_lookup sv, _session253_2esd15_lookup tv
 WHERE t.slug='2-esdras-15-sword-sent-who-may-turn'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=15 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=6 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-15-innocent-blood-cries
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 6:10 — *And they cried with a loud voice, saying, How long, O Yahuah (Lord), holy and true, dost thou not judge and avenge our blood on them that dwell on the earth?* The souls of the just that complain continually in Ezra are the souls under the altar crying how long for the avenging of their blood.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd15_lookup sv, _session253_2esd15_lookup tv
 WHERE t.slug='2-esdras-15-innocent-blood-cries'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=15 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=6 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 18:24 — *And in her was found the blood of prophets, and of saints, and of all that were slain upon the earth.* Yahuah''s vow to receive to Himself all the innocent blood is answered when that blood is found in Babylon and she is judged for it.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd15_lookup sv, _session253_2esd15_lookup tv
 WHERE t.slug='2-esdras-15-innocent-blood-cries'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=15 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=18 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 25:31 — *A noise shall come even to the ends of the earth; for Yahuah (LORD) hath a controversy with the nations, he will plead with all flesh; he will give them that are wicked to the sword, saith Yahuah (LORD).* The avenging Yahuah promises in Ezra is His standing controversy with the nations over the blood of His own.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd15_lookup sv, _session253_2esd15_lookup tv
 WHERE t.slug='2-esdras-15-innocent-blood-cries'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=15 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=25 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-15-egypt-plagues-mighty-hand
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 4:34 — *Or hath Elohim (God) assayed to go and take him a nation from the midst of another nation, by temptations, by signs, and by wonders, and by war, and by a mighty hand, and by a stretched out arm, and by great terrors, according to all that Yahuah Elohaychem (the LORD your God) did for you in Egypt before your eyes?* Ezra''s ''mighty hand and stretched out arm'' against Egypt is the very Exodus formula of Yahuah''s redeeming arm.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd15_lookup sv, _session253_2esd15_lookup tv
 WHERE t.slug='2-esdras-15-egypt-plagues-mighty-hand'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=15 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=4 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 30:4 — *And the sword shall come upon Egypt, and great pain shall be in Ethiopia, when the slain shall fall in Egypt, and they shall take away her multitude, and her foundations shall be broken down.* The plagues Ezra sees smiting Egypt and its foundations are Ezekiel''s day-of-Yahuah sword falling on Egypt''s slain and foundations.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd15_lookup sv, _session253_2esd15_lookup tv
 WHERE t.slug='2-esdras-15-egypt-plagues-mighty-hand'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=15 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=30 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 30:13 — *Thus saith Adonai Yahuah (the Lord GOD); I will also destroy the idols, and I will cause their images to cease out of Noph; and there shall be no more a prince of the land of Egypt: and I will put a fear in the land of Egypt.* Egypt''s mourning under the plague in Ezra matches the fear Yahuah puts in the land when He strikes its idols and foundations in Ezekiel.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd15_lookup sv, _session253_2esd15_lookup tv
 WHERE t.slug='2-esdras-15-egypt-plagues-mighty-hand'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=15 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=30 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-15-woe-keep-not-commandments
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 25:15 — *For thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel) unto me; Take the wine cup of this fury at my hand, and cause all the nations, to whom I send thee, to drink it.* The woe and plagues poured on the commandment-breakers in Ezra are this cup of fury Yahuah causes all the nations to drink.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd15_lookup sv, _session253_2esd15_lookup tv
 WHERE t.slug='2-esdras-15-woe-keep-not-commandments'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=15 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=25 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 18:4 — *And I heard another voice from heaven, saying, Come out of her, my people, that ye be not partakers of her sins, and that ye receive not of her plagues.* Yahuah''s ''go your way, you children, from the power, defile not my sanctuary'' is the same call to come out of Babylon lest His people share her plagues.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd15_lookup sv, _session253_2esd15_lookup tv
 WHERE t.slug='2-esdras-15-woe-keep-not-commandments'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=15 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=18 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 6:10 — *And they cried with a loud voice, saying, How long, O Yahuah (Lord), holy and true, dost thou not judge and avenge our blood on them that dwell on the earth?* The woe on those who keep not the commandments answers the cry of the slain for Yahuah''s holy and true judgment on them that dwell on the earth.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd15_lookup sv, _session253_2esd15_lookup tv
 WHERE t.slug='2-esdras-15-woe-keep-not-commandments'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=15 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=6 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-15-babylon-fallen-plagues-one-day
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 18:2 — *And he cried mightily with a strong voice, saying, Babylon the great is fallen, is fallen, and is become the habitation of devils, and the hold of every foul spirit, and a cage of every unclean and hateful bird.* The Babylon Ezra''s avengers go stedfastly to make afraid is the Babylon the angel cries is fallen, is fallen.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd15_lookup sv, _session253_2esd15_lookup tv
 WHERE t.slug='2-esdras-15-babylon-fallen-plagues-one-day'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=15 AND sv.verse_number=43
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=18 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 18:8 — *Therefore shall her plagues come in one day, death, and mourning, and famine; and she shall be utterly burned with fire: for strong is Yahuah Elohim (the Lord God) who judgeth her.* The widowhood, famine, sword and pestilence Yahuah sends on Asia are the very plagues — death, mourning, famine, burning — that fall on Babylon in one day.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd15_lookup sv, _session253_2esd15_lookup tv
 WHERE t.slug='2-esdras-15-babylon-fallen-plagues-one-day'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=15 AND sv.verse_number=49
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=18 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 18:6 — *Reward her even as she rewarded you, and double unto her double according to her works: in the cup which she hath filled fill to her double.* Yahuah''s ''like as you have done to my chosen, even so shall Yahuah do to you'' is the lex talionis the seer cries over fallen Babylon.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd15_lookup sv, _session253_2esd15_lookup tv
 WHERE t.slug='2-esdras-15-babylon-fallen-plagues-one-day'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=15 AND sv.verse_number=56
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=18 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 18:24 — *And in her was found the blood of prophets, and of saints, and of all that were slain upon the earth.* Asia is judged because ''you had always slain my chosen'' — the same charge of the blood of saints found in Babylon.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd15_lookup sv, _session253_2esd15_lookup tv
 WHERE t.slug='2-esdras-15-babylon-fallen-plagues-one-day'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=15 AND sv.verse_number=53
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=18 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2esdras_16.sql (session253 2-esdras 16) -----
-- Source anchor: apocrypha/2-esdras ch16. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2esd16 (view _session253_2esd16_lookup). Sort band base 63375, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2esd16_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-esdras-16-woe-babylon-unquenchable-sword
  ('apocrypha', '2-esdras', 16, 1, 'canon', 'revelation', 18, 2, 'free', E'Revelation 18:2 — *And he cried mightily with a strong voice, saying, Babylon the great is fallen, is fallen, and is become the habitation of devils, and the hold of every foul spirit, and a cage of every unclean and hateful bird.* The Babylon over whom Esdras cries woe (2 Esdras 16:1) is the same great city the angel of the Revelation declares fallen.'),
  ('apocrypha', '2-esdras', 16, 4, 'canon', 'revelation', 18, 8, 'free', E'Revelation 18:8 — *Therefore shall her plagues come in one day, death, and mourning, and famine; and she shall be utterly burned with fire: for strong is Yahuah Elohim (the Lord God) who judgeth her.* Esdras'' fire that no man may quench (2 Esdras 16:4) is the fire that utterly burns Babylon, for strong is the Yahuah who judges her.'),
  ('apocrypha', '2-esdras', 16, 3, 'canon', 'isaiah', 24, 6, 'free', E'Isaiah 24:6 — *Therefore hath the curse devoured the earth, and they that dwell therein are desolate: therefore the inhabitants of the earth are burned, and few men left.* The sword none may turn back (2 Esdras 16:3) is the curse Isaiah saw devour the earth and burn its inhabitants until few are left.'),
  -- thread: 2-esdras-16-mighty-hand-arrows-that-miss-not
  ('apocrypha', '2-esdras', 16, 12, 'canon', 'luke', 21, 25, 'free', E'Luke 21:25 — *And there shall be signs in the sun, and in the moon, and in the stars; and upon the earth distress of nations, with perplexity; the sea and the waves roaring;* The sea rising with troubled waves before Yahuah''s glory (2 Esdras 16:12) is the roaring sea and distress of nations Yahusha set as a sign of the end.'),
  ('apocrypha', '2-esdras', 16, 13, 'canon', 'isaiah', 24, 18, 'free', E'Isaiah 24:18 — *And it shall come to pass, that he who fleeth from the noise of the fear shall fall into the pit; and he that cometh up out of the midst of the pit shall be taken in the snare: for the windows from on high are open, and the foundations of the earth do shake.* The sharp arrows shot into the ends of the world that shall not miss (2 Esdras 16:13) reach the man who flees, for the very foundations shake under the opened windows on high.'),
  -- thread: 2-esdras-16-beginning-of-sorrows-famine-sword
  ('apocrypha', '2-esdras', 16, 18, 'canon', 'matthew', 24, 8, 'free', E'Matthew 24:8 — *All these are the beginning of sorrows.* Esdras'' "beginning of sorrows... beginning of famine... beginning of wars" (2 Esdras 16:18) is the very phrase Yahusha set over the wars and famines of the last days.'),
  ('apocrypha', '2-esdras', 16, 18, 'canon', 'luke', 21, 10, 'free', E'Luke 21:10 — *Then said he unto them, Nation shall rise against nation, and kingdom against kingdom:* The beginning of wars and great death (2 Esdras 16:18) is the nation-against-nation upheaval Yahusha foretold.'),
  ('apocrypha', '2-esdras', 16, 39, 'canon', 'matthew', 24, 7, 'free', E'Matthew 24:7 — *For nation shall rise against nation, and kingdom against kingdom: and there shall be famines, and pestilences, and earthquakes, in divers places.* The plagues that shall not be slack to come on the earth (2 Esdras 16:39) are the famines and pestilences Yahusha said must come on every side.'),
  -- thread: 2-esdras-16-pilgrims-sit-loose-to-the-world
  ('apocrypha', '2-esdras', 16, 42, 'canon', '1-john', 2, 15, 'free', E'1 John 2:15 — *Love not the world, neither the things that are in the world. If any man love the world, the love of the Father is not in him.* The merchandise held as if it brought no profit and the house built as if one shall not dwell in it (2 Esdras 16:42) is John''s charge not to love the world.'),
  ('apocrypha', '2-esdras', 16, 42, 'canon', '1-john', 2, 17, 'free', E'1 John 2:17 — *And the world passeth away, and the lust thereof: but he that doeth the will of Elohim (God) abideth for ever.* Esdras bids each buy and build as one who will lose it (2 Esdras 16:42) because the world is passing, and only the doer of Elohim''s will abides.'),
  ('apocrypha', '2-esdras', 16, 40, 'canon', 'revelation', 18, 4, 'free', E'Revelation 18:4 — *And I heard another voice from heaven, saying, Come out of her, my people, that ye be not partakers of her sins, and that ye receive not of her plagues.* "O my people, hear my word: make you ready" and be as pilgrims (2 Esdras 16:40) is the same heavenly summons to the remnant to come out of Babylon before her plagues.'),
  -- thread: 2-esdras-16-all-knowing-maker-and-judge
  ('apocrypha', '2-esdras', 16, 54, 'canon', 'malachi', 3, 16, 'free', E'Malachi 3:16 — *Then they that feared Yahuah (LORD) spake often one to another: and Yahuah (LORD) hearkened, and heard it, and a book of remembrance was written before him for them that feared Yahuah (LORD), and that thought upon his name.* The Yahuah who knows every thought and heart (2 Esdras 16:54) writes the fearers'' very words in His book of remembrance.'),
  ('apocrypha', '2-esdras', 16, 66, 'canon', 'luke', 21, 36, 'free', E'Luke 21:36 — *Watch ye therefore, and pray always, that ye may be accounted worthy to escape all these things that shall come to pass, and to stand before the Son of Adam.* Esdras'' question "how will you hide your sins before Yahuah and his angels?" (2 Esdras 16:66) drives to the watchfulness Yahusha commands so that one may stand before the Son of Adam.'),
  -- thread: 2-esdras-16-chosen-tried-as-gold-kept-through-trouble
  ('apocrypha', '2-esdras', 16, 73, 'canon', '1-peter', 1, 7, 'free', E'1 Peter 1:7 — *That the trial of your faith, being much more precious than of gold that perisheth, though it be tried with fire, might be found unto praise and honour and glory at the appearing of Yahusha HaMashiach (Jesus Christ):* The chosen tried as gold in the fire (2 Esdras 16:73) is Peter''s trial of faith, more precious than perishing gold, proven by fire unto glory.'),
  ('apocrypha', '2-esdras', 16, 73, 'canon', 'zechariah', 13, 9, 'free', E'Zechariah 13:9 — *And I will bring the third part through the fire, and will refine them as silver is refined, and will try them as gold is tried: they shall call on my name, and I will hear them: I will say, It is my people: and they shall say, Yahuah (LORD) is my Elohim (God).* The trying of the chosen as gold (2 Esdras 16:73) is the refining of the remnant third whom Yahuah brings through the fire and claims as His people.'),
  ('apocrypha', '2-esdras', 16, 74, 'canon', 'matthew', 24, 13, 'free', E'Matthew 24:13 — *But he that shall endure unto the end, the same shall be saved.* The beloved told the days of trouble are at hand but "I will deliver you from the same" (2 Esdras 16:74) is the endurance unto the end Yahusha promises shall be saved.'),
  ('apocrypha', '2-esdras', 16, 76, 'canon', 'luke', 21, 36, 'free', E'Luke 21:36 — *Watch ye therefore, and pray always, that ye may be accounted worthy to escape all these things that shall come to pass, and to stand before the Son of Adam.* Yahuah''s guidance of them who keep His commandments and precepts (2 Esdras 16:76) is the watching and praying by which the kept remnant escapes and stands before the Son of Adam.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2esd16_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2esd16_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-16-woe-babylon-unquenchable-sword',
       E'Woe, Babylon — the sword and fire none can turn back',
       E'The woes open over the nations of the world-system: *Woe be to you, Babylon, and Asia! woe be to you, Egypt and Syria!* (2 Esdras 16:1), and the judgment is sent past all recall — *A sword is sent upon you, and who may turn it back?* (2 Esdras 16:3) — *A fire is sent among you, and who may quench it?* (2 Esdras 16:4). The same Babylon falls in the Revelation, and the apostle hears the heavens answer the wail with the very wording Esdras uses for the unquenchable fire: *And he cried mightily with a strong voice, saying, Babylon the great is fallen, is fallen, and is become the habitation of devils, and the hold of every foul spirit, and a cage of every unclean and hateful bird.* (Revelation 18:2). The prophets had already pronounced the curse that *devoured the earth* — *Therefore hath the curse devoured the earth, and they that dwell therein are desolate: therefore the inhabitants of the earth are burned, and few men left.* (Isaiah 24:6). It ain''t new: the same word against the kingdom of man, sent and not turned back.',
       sv.verse_id, ev.verse_id, 'extras', 63375
  FROM _session253_2esd16_lookup sv, _session253_2esd16_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=16 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=16 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-16-mighty-hand-arrows-that-miss-not',
       E'The mighty hand that bends the bow — the Creator''s wrath',
       E'The judge is no idol but the living Maker: *The mighty Yahuah (God) sends the plagues and who is he that can drive them away?* (2 Esdras 16:8) — *For strong is his right hand that bendeth the bow, his arrows that he shooteth are sharp, and shall not miss, when they begin to be shot into the ends of the world.* (2 Esdras 16:13). When He thunders the whole creation trembles — *The earth quakes, and the foundations thereof; the sea ariseth up with waves from the deep, and the waves of it are troubled* (2 Esdras 16:12). Yahusha foretold the same shaking before the end: *And there shall be signs in the sun, and in the moon, and in the stars; and upon the earth distress of nations, with perplexity; the sea and the waves roaring;* (Luke 21:25). And Isaiah saw the very foundations heave — *for the windows from on high are open, and the foundations of the earth do shake.* (Isaiah 24:18). The arrows of the Almighty do not miss.',
       sv.verse_id, ev.verse_id, 'extras', 63378
  FROM _session253_2esd16_lookup sv, _session253_2esd16_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=16 AND sv.verse_number=8
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=16 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-16-beginning-of-sorrows-famine-sword',
       E'The beginning of sorrows — famine, sword, and great death',
       E'The tribulation is named as a birth-onset: *The beginning of sorrows and great mournings; the beginning of famine and great death; the beginning of wars, and the powers shall stand in fear; the beginning of evils!* (2 Esdras 16:18), and the pangs come quick as travail — *Even so shall not the plagues be slack to come upon the earth, and the world shall mourn, and sorrows shall come upon it on every side.* (2 Esdras 16:39). Yahusha used the identical figure for the last days: *For nation shall rise against nation, and kingdom against kingdom: and there shall be famines, and pestilences, and earthquakes, in divers places.* (Matthew 24:7) — *All these are the beginning of sorrows.* (Matthew 24:8). And Luke heard Him list the same scourges — *Then said he unto them, Nation shall rise against nation, and kingdom against kingdom:* (Luke 21:10). It ain''t new: the beginning of sorrows is the same birth-pang in both witnesses.',
       sv.verse_id, ev.verse_id, 'extras', 63381
  FROM _session253_2esd16_lookup sv, _session253_2esd16_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=16 AND sv.verse_number=18
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=16 AND ev.verse_number=39
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-16-pilgrims-sit-loose-to-the-world',
       E'Be as pilgrims — buy as one who will lose, build as one who shall not dwell',
       E'★ The call to the elect: sit loose to the perishing world-system and be ready. *O my people, hear my word: make you ready to your battle, and in those evils be even as pilgrims upon the earth.* (2 Esdras 16:40) — *He that selleth, let him be as he that fleeth away: and he that buyeth, as one that will lose:* (2 Esdras 16:41) — *He that occupieth merchandise, as he that has no profit by it: and he that buildeth, as he that shall not dwell in it:* (2 Esdras 16:42). John gives the same charge by the contrary command — *Love not the world, neither the things that are in the world. If any man love the world, the love of the Father is not in him.* (1 John 2:15) — *And the world passeth away, and the lust thereof: but he that doeth the will of Elohim (God) abideth for ever.* (1 John 2:17). And Yahusha''s voice from heaven calls the remnant clean out of the doomed city — *Come out of her, my people, that ye be not partakers of her sins, and that ye receive not of her plagues.* (Revelation 18:4). Hold the world as a pilgrim holds a road he is only passing.',
       sv.verse_id, ev.verse_id, 'extras', 63384
  FROM _session253_2esd16_lookup sv, _session253_2esd16_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=16 AND sv.verse_number=40
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=16 AND ev.verse_number=42
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-16-all-knowing-maker-and-judge',
       E'The Maker who spoke the world knows every hidden sin',
       E'The judge before whom no sin can hide is the Creator Himself: *Behold, Yahuah (God) knoweth all the works of men, their imaginations, their thoughts, and their hearts:* (2 Esdras 16:54) — *Which spoke but the word, Let the earth be made; and it was made: Let the heaven be made; and it was created.* (2 Esdras 16:55) — *In his word were the stars made, and he knoweth the number of them.* (2 Esdras 16:56). Therefore no concealment avails — *What will you do? or how will you hide your sins before Yahuah (God) and his angels?* (2 Esdras 16:66). The fearers of Yahuah are written in His book even now — *Then they that feared Yahuah (LORD) spake often one to another: and Yahuah (LORD) hearkened, and heard it, and a book of remembrance was written before him for them that feared Yahuah (LORD), and that thought upon his name.* (Malachi 3:16). And the same Maker who spoke the worlds is the Word by whom all hidden things are searched — *And the world passeth away, and the lust thereof: but he that doeth the will of Elohim (God) abideth for ever.* (1 John 2:17). The word that made the stars numbers your thoughts.',
       sv.verse_id, ev.verse_id, 'extras', 63387
  FROM _session253_2esd16_lookup sv, _session253_2esd16_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=16 AND sv.verse_number=54
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=16 AND ev.verse_number=66
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-16-chosen-tried-as-gold-kept-through-trouble',
       E'My chosen tried as gold — kept through the days of trouble',
       E'★ The seed sealed and kept: the persecution of those that fear Yahuah is the very furnace that reveals the elect — *Then shall they be known, who are my chosen; and they shall be tried as the gold in the fire.* (2 Esdras 16:73). Then comes the promise to the beloved remnant — *Hear, O you my beloved, says Yahuah (God): behold, the days of trouble are at hand, but I will deliver you from the same.* (2 Esdras 16:74) — the guide of *them who keep my commandments and precepts* (2 Esdras 16:76). Peter says the same of the scattered elect — *That the trial of your faith, being much more precious than of gold that perisheth, though it be tried with fire, might be found unto praise and honour and glory at the appearing of Yahusha HaMashiach (Jesus Christ):* (1 Peter 1:7). The prophets foresaw the refining of the remnant — *And I will bring the third part through the fire, and will refine them as silver is refined, and will try them as gold is tried: they shall call on my name, and I will hear them: I will say, It is my people* (Zechariah 13:9). And Yahusha''s word to the kept seed is the promise of endurance — *But he that shall endure unto the end, the same shall be saved.* (Matthew 24:13). The chosen are not consumed by the fire but proven by it — election before confession, the remnant of both houses kept whole.',
       sv.verse_id, ev.verse_id, 'extras', 63390
  FROM _session253_2esd16_lookup sv, _session253_2esd16_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=16 AND sv.verse_number=73
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=16 AND ev.verse_number=78
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-esdras-16-woe-babylon-unquenchable-sword
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 18:2 — *And he cried mightily with a strong voice, saying, Babylon the great is fallen, is fallen, and is become the habitation of devils, and the hold of every foul spirit, and a cage of every unclean and hateful bird.* The Babylon over whom Esdras cries woe (2 Esdras 16:1) is the same great city the angel of the Revelation declares fallen.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd16_lookup sv, _session253_2esd16_lookup tv
 WHERE t.slug='2-esdras-16-woe-babylon-unquenchable-sword'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=16 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=18 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 18:8 — *Therefore shall her plagues come in one day, death, and mourning, and famine; and she shall be utterly burned with fire: for strong is Yahuah Elohim (the Lord God) who judgeth her.* Esdras'' fire that no man may quench (2 Esdras 16:4) is the fire that utterly burns Babylon, for strong is the Yahuah who judges her.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd16_lookup sv, _session253_2esd16_lookup tv
 WHERE t.slug='2-esdras-16-woe-babylon-unquenchable-sword'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=16 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=18 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 24:6 — *Therefore hath the curse devoured the earth, and they that dwell therein are desolate: therefore the inhabitants of the earth are burned, and few men left.* The sword none may turn back (2 Esdras 16:3) is the curse Isaiah saw devour the earth and burn its inhabitants until few are left.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd16_lookup sv, _session253_2esd16_lookup tv
 WHERE t.slug='2-esdras-16-woe-babylon-unquenchable-sword'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=16 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=24 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-16-mighty-hand-arrows-that-miss-not
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Luke 21:25 — *And there shall be signs in the sun, and in the moon, and in the stars; and upon the earth distress of nations, with perplexity; the sea and the waves roaring;* The sea rising with troubled waves before Yahuah''s glory (2 Esdras 16:12) is the roaring sea and distress of nations Yahusha set as a sign of the end.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd16_lookup sv, _session253_2esd16_lookup tv
 WHERE t.slug='2-esdras-16-mighty-hand-arrows-that-miss-not'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=16 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=21 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 24:18 — *And it shall come to pass, that he who fleeth from the noise of the fear shall fall into the pit; and he that cometh up out of the midst of the pit shall be taken in the snare: for the windows from on high are open, and the foundations of the earth do shake.* The sharp arrows shot into the ends of the world that shall not miss (2 Esdras 16:13) reach the man who flees, for the very foundations shake under the opened windows on high.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd16_lookup sv, _session253_2esd16_lookup tv
 WHERE t.slug='2-esdras-16-mighty-hand-arrows-that-miss-not'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=16 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=24 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-16-beginning-of-sorrows-famine-sword
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 24:8 — *All these are the beginning of sorrows.* Esdras'' "beginning of sorrows... beginning of famine... beginning of wars" (2 Esdras 16:18) is the very phrase Yahusha set over the wars and famines of the last days.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd16_lookup sv, _session253_2esd16_lookup tv
 WHERE t.slug='2-esdras-16-beginning-of-sorrows-famine-sword'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=16 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Luke 21:10 — *Then said he unto them, Nation shall rise against nation, and kingdom against kingdom:* The beginning of wars and great death (2 Esdras 16:18) is the nation-against-nation upheaval Yahusha foretold.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd16_lookup sv, _session253_2esd16_lookup tv
 WHERE t.slug='2-esdras-16-beginning-of-sorrows-famine-sword'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=16 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=21 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 24:7 — *For nation shall rise against nation, and kingdom against kingdom: and there shall be famines, and pestilences, and earthquakes, in divers places.* The plagues that shall not be slack to come on the earth (2 Esdras 16:39) are the famines and pestilences Yahusha said must come on every side.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd16_lookup sv, _session253_2esd16_lookup tv
 WHERE t.slug='2-esdras-16-beginning-of-sorrows-famine-sword'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=16 AND sv.verse_number=39
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-16-pilgrims-sit-loose-to-the-world
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 John 2:15 — *Love not the world, neither the things that are in the world. If any man love the world, the love of the Father is not in him.* The merchandise held as if it brought no profit and the house built as if one shall not dwell in it (2 Esdras 16:42) is John''s charge not to love the world.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd16_lookup sv, _session253_2esd16_lookup tv
 WHERE t.slug='2-esdras-16-pilgrims-sit-loose-to-the-world'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=16 AND sv.verse_number=42
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=2 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 John 2:17 — *And the world passeth away, and the lust thereof: but he that doeth the will of Elohim (God) abideth for ever.* Esdras bids each buy and build as one who will lose it (2 Esdras 16:42) because the world is passing, and only the doer of Elohim''s will abides.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd16_lookup sv, _session253_2esd16_lookup tv
 WHERE t.slug='2-esdras-16-pilgrims-sit-loose-to-the-world'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=16 AND sv.verse_number=42
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=2 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 18:4 — *And I heard another voice from heaven, saying, Come out of her, my people, that ye be not partakers of her sins, and that ye receive not of her plagues.* "O my people, hear my word: make you ready" and be as pilgrims (2 Esdras 16:40) is the same heavenly summons to the remnant to come out of Babylon before her plagues.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd16_lookup sv, _session253_2esd16_lookup tv
 WHERE t.slug='2-esdras-16-pilgrims-sit-loose-to-the-world'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=16 AND sv.verse_number=40
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=18 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-16-all-knowing-maker-and-judge
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Malachi 3:16 — *Then they that feared Yahuah (LORD) spake often one to another: and Yahuah (LORD) hearkened, and heard it, and a book of remembrance was written before him for them that feared Yahuah (LORD), and that thought upon his name.* The Yahuah who knows every thought and heart (2 Esdras 16:54) writes the fearers'' very words in His book of remembrance.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd16_lookup sv, _session253_2esd16_lookup tv
 WHERE t.slug='2-esdras-16-all-knowing-maker-and-judge'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=16 AND sv.verse_number=54
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=3 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Luke 21:36 — *Watch ye therefore, and pray always, that ye may be accounted worthy to escape all these things that shall come to pass, and to stand before the Son of Adam.* Esdras'' question "how will you hide your sins before Yahuah and his angels?" (2 Esdras 16:66) drives to the watchfulness Yahusha commands so that one may stand before the Son of Adam.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd16_lookup sv, _session253_2esd16_lookup tv
 WHERE t.slug='2-esdras-16-all-knowing-maker-and-judge'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=16 AND sv.verse_number=66
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=21 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-16-chosen-tried-as-gold-kept-through-trouble
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Peter 1:7 — *That the trial of your faith, being much more precious than of gold that perisheth, though it be tried with fire, might be found unto praise and honour and glory at the appearing of Yahusha HaMashiach (Jesus Christ):* The chosen tried as gold in the fire (2 Esdras 16:73) is Peter''s trial of faith, more precious than perishing gold, proven by fire unto glory.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd16_lookup sv, _session253_2esd16_lookup tv
 WHERE t.slug='2-esdras-16-chosen-tried-as-gold-kept-through-trouble'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=16 AND sv.verse_number=73
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=1 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Zechariah 13:9 — *And I will bring the third part through the fire, and will refine them as silver is refined, and will try them as gold is tried: they shall call on my name, and I will hear them: I will say, It is my people: and they shall say, Yahuah (LORD) is my Elohim (God).* The trying of the chosen as gold (2 Esdras 16:73) is the refining of the remnant third whom Yahuah brings through the fire and claims as His people.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd16_lookup sv, _session253_2esd16_lookup tv
 WHERE t.slug='2-esdras-16-chosen-tried-as-gold-kept-through-trouble'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=16 AND sv.verse_number=73
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=13 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 24:13 — *But he that shall endure unto the end, the same shall be saved.* The beloved told the days of trouble are at hand but "I will deliver you from the same" (2 Esdras 16:74) is the endurance unto the end Yahusha promises shall be saved.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd16_lookup sv, _session253_2esd16_lookup tv
 WHERE t.slug='2-esdras-16-chosen-tried-as-gold-kept-through-trouble'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=16 AND sv.verse_number=74
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Luke 21:36 — *Watch ye therefore, and pray always, that ye may be accounted worthy to escape all these things that shall come to pass, and to stand before the Son of Adam.* Yahuah''s guidance of them who keep His commandments and precepts (2 Esdras 16:76) is the watching and praying by which the kept remnant escapes and stands before the Son of Adam.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd16_lookup sv, _session253_2esd16_lookup tv
 WHERE t.slug='2-esdras-16-chosen-tried-as-gold-kept-through-trouble'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=16 AND sv.verse_number=76
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=21 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session253 — 2 Esdras cross-references complete.'
