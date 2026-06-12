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

