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

