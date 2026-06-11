-- ----- fragment: minion_1enoch_02.sql (session250 1-enoch 2) -----
-- Source anchor: enoch/1-enoch ch2. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en02 (view _session250_en02_lookup). Sort band base 50025, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en02_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-2-luminaries-appointed-order
  ('enoch', '1-enoch', 2, 1, 'canon', 'genesis', 1, 14, 'free', E'Genesis 1:14 — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years:* The luminaries that Enoch watches rising and setting in season are the same fourth-day lights Yahuah appointed for signs and seasons and moedim.'),
  ('enoch', '1-enoch', 2, 1, 'canon', 'jeremiah', 31, 35, 'free', E'Jeremiah 31:35 — *Thus saith Yahuah (LORD), which giveth the sun for a light by day, and the ordinances of the moon and of the stars for a light by night, which divideth the sea when the waves thereof roar; Yahuah Tseva''ot (LORD of hosts) is his name:* Enoch''s "appointed order" of sun, moon, and stars is exactly the fixed ordinance Jeremiah binds to Yahuah''s name and to the endurance of Yashar''el.'),
  ('enoch', '1-enoch', 2, 1, 'canon', 'psalms', 19, 1, 'free', E'Psalm 19:1 — *The heavens declare the glory of Elohim (God); and the firmament sheweth his handywork.* The orbits that never change are the Psalmist''s wordless sermon, preaching the Maker to everyone who will "observe."'),
  ('enoch', '1-enoch', 2, 1, 'canon', 'job', 38, 33, 'free', E'Job 38:33 — *Knowest thou the ordinances of heaven? canst thou set the dominion thereof in the earth?* Yahuah''s challenge to Job over the fixed ordinances of heaven is the very lesson Enoch draws — man did not appoint the order he is told to behold.'),
  ('enoch', '1-enoch', 2, 1, 'enoch', '1-enoch', 5, 1, 'extras', E'1 Enoch 5:1 — *Observe ye how the trees cover themselves with green leaves and bear fruit: wherefore give ye heed and know with regard to all His works, and recognize how He that liveth for ever hath made them so.* The same imperative "observe" carries through the exhortation — sky, earth, and tree all rebuke the rebel by their obedience.'),
  -- thread: 1-enoch-2-earth-steadfast-creation-obeys
  ('enoch', '1-enoch', 2, 2, 'canon', 'psalms', 148, 6, 'free', E'Psalm 148:6 — *He hath also stablished them for ever and ever: he hath made a decree which shall not pass.* What Enoch calls "how steadfast they are" the Psalmist names a decree that shall not pass — the works of Elohim are fixed by command.'),
  ('enoch', '1-enoch', 2, 2, 'canon', 'jeremiah', 8, 7, 'free', E'Jeremiah 8:7 — *Yea, the stork in the heaven knoweth her appointed times; and the turtle and the crane and the swallow observe the time of their coming; but my people know not the judgment of Yahuah (LORD).* Enoch''s "none of the things upon earth change" becomes Jeremiah''s indictment: creation keeps its appointed times while the covenant people forget theirs.'),
  ('enoch', '1-enoch', 2, 2, 'apocrypha', 'ecclesiasticus', 16, 28, 'extras', E'Sirach 16:28 — *None of them hindereth another, and they shall never disobey his word.* Ben Sira makes Enoch''s point exactly — the works of Elohim keep their ranks and never disobey, which is why their steadfastness testifies against every rebel.'),
  ('enoch', '1-enoch', 2, 2, 'enoch', '1-enoch', 5, 3, 'extras', E'1 Enoch 5:3 — *And behold how the sea and the rivers in like manner accomplish and change not their tasks from His commandments.* Enoch''s own next chapter adds sea and rivers to the unchanging earth, sharpening the exhortation toward the sinners who did change their way.'),
  -- thread: 1-enoch-2-summer-winter-appointed-seasons
  ('enoch', '1-enoch', 2, 3, 'canon', 'genesis', 8, 22, 'free', E'Genesis 8:22 — *While the earth remaineth, seedtime and harvest, and cold and heat, and summer and winter, and day and night shall not cease.* Enoch''s "summer and the winter" is Yahuah''s post-Flood oath that the seasons shall not cease — the steadfast order the rest of the book sets against the Watchers'' rebellion.'),
  ('enoch', '1-enoch', 2, 3, 'canon', 'psalms', 104, 19, 'free', E'Psalm 104:19 — *He appointed the moon for seasons: the sun knoweth his going down.* The seasons Enoch tells the reader to behold are appointed by the lights, just as the Psalmist sings of the moon set for the moedim.'),
  ('enoch', '1-enoch', 2, 3, 'canon', 'jeremiah', 5, 24, 'free', E'Jeremiah 5:24 — *Neither say they in their heart, Let us now fear Yahuah Eloheinu (the LORD our God), that giveth rain, both the former and the latter, in his season: he reserveth unto us the appointed weeks of the harvest.* The clouds, dew, and rain that fill Enoch''s earth are Jeremiah''s former and latter rains, given in season by the One whom the people forget to fear.'),
  ('enoch', '1-enoch', 2, 3, 'jubilees', 'jubilees', 2, 9, 'extras', E'Jubilees 2:9 — *And Elohim (God) appointed the sun to be a great sign on the earth for days and for sabbaths and for months and for feasts and for years and for sabbaths of years and for jubilees and for all seasons of the years.* Jubilees spells out what Enoch''s summer and winter imply — the appointed times, feasts, and sabbaths are fixed by the lights, not by men.'),
  ('enoch', '1-enoch', 2, 3, 'apocrypha', 'ecclesiasticus', 43, 6, 'extras', E'Sirach 43:6 — *He made the moon also to serve in her season for a declaration of times, and a sign of the world.* Ben Sira joins Enoch''s seasonal witness: the moon serves in her season as a declaration of times, the calendar God hung in the sky.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en02_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en02_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-2-luminaries-appointed-order',
       E'The luminaries transgress not their appointed order',
       E'Enoch begins the great exhortation by sending the eye upward: *Observe ye everything that takes place in the heaven, how they do not change their orbits, and the luminaries which are in the heaven, how they all rise and set in order each in its season, and transgress not against their appointed order.* (1 Enoch 2:1). It ain''t new — this is Genesis 1''s fourth day, where Yahuah set the lights *to divide the day from the night; and let them be for signs, and for seasons, and for days, and years* (Genesis 1:14). The prophets read the same heavens as a covenant decree: *Thus saith Yahuah (LORD), which giveth the sun for a light by day, and the ordinances of the moon and of the stars for a light by night* (Jeremiah 31:35); the Psalmist hears them preach, *The heavens declare the glory of Elohim (God); and the firmament sheweth his handywork* (Psalm 19:1); and Job is asked, *Knowest thou the ordinances of heaven?* (Job 38:33). Enoch will press the same summons again in the next chapter, *Observe ye how the trees cover themselves with green leaves and bear fruit; wherefore give ye heed and know with regard to all His works, and recognize how He that liveth for ever hath made them so* (1 Enoch 5:1). The Watchers transgressed their appointed order; the luminaries never do — the witness against the rebel is the obedient sky.',
       sv.verse_id, ev.verse_id, 'extras', 50025
  FROM _session250_en02_lookup sv, _session250_en02_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=2 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=2 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-2-earth-steadfast-creation-obeys',
       E'Behold the earth: the works of Elohim change not',
       E'Enoch turns the eye down: *Behold ye the earth, and give heed to the things which take place upon it from first to last, how steadfast they are, how none of the things upon earth change, but all the works of Elohim (God) appear to you.* (1 Enoch 2:2). The decree that holds them steadfast is the Psalmist''s: *He hath also stablished them for ever and ever: he hath made a decree which shall not pass.* (Psalm 148:6). Ben Sira says the works keep ranks without rebellion — *None of them hindereth another, and they shall never disobey his word.* (Sirach 16:28) — and the indictment writes itself: the creation never disobeys, but man does. Jeremiah lays the irony bare, *Yea, the stork in the heaven knoweth her appointed times; and the turtle and the crane and the swallow observe the time of their coming; but my people know not the judgment of Yahuah (LORD).* (Jeremiah 8:7). Enoch makes the same contrast plain a chapter on, holding up the sea and rivers that *accomplish and change not their tasks from His commandments* (1 Enoch 5:3). Torah stands and the cosmos keeps it — the Watchers'' sin was rebellion against this very order, not a flaw in the order itself.',
       sv.verse_id, ev.verse_id, 'extras', 50028
  FROM _session250_en02_lookup sv, _session250_en02_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=2 AND sv.verse_number=2
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=2 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-2-summer-winter-appointed-seasons',
       E'Summer and winter: the appointed seasons keep their times',
       E'The exhortation closes on the turning year: *Behold the summer and the winter, how the whole earth is filled with water, and clouds and dew and rain lie upon it.* (1 Enoch 2:3). This is the covenant Yahuah swore after the Flood — *While the earth remaineth, seedtime and harvest, and cold and heat, and summer and winter, and day and night shall not cease.* (Genesis 8:22) — the very judgement Enoch''s book moves toward, yet the seasons it secures roll on undisturbed. The Psalmist ties the rhythm to the lights, *He appointed the moon for seasons: the sun knoweth his going down* (Psalm 104:19), and Jeremiah names the rain that fills the earth as Yahuah''s faithful gift, the One *that giveth rain, both the former and the latter, in his season: he reserveth unto us the appointed weeks of the harvest* (Jeremiah 5:24). The extra-canonical witnesses say the same: the sun and moon were set *for days and for sabbaths and for months and for feasts and for years and for sabbaths of years and for jubilees and for all seasons of the years* (Jubilees 2:9), and the moon serves *in her season for a declaration of times, and a sign of the world* (Sirach 43:6). The appointed times are not invented by men or by confession — they are written into the summer and winter, the moedim kept by the lights themselves.',
       sv.verse_id, ev.verse_id, 'extras', 50031
  FROM _session250_en02_lookup sv, _session250_en02_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=2 AND sv.verse_number=3
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=2 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-2-luminaries-appointed-order
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:14 — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years:* The luminaries that Enoch watches rising and setting in season are the same fourth-day lights Yahuah appointed for signs and seasons and moedim.'
  FROM cross_reference_threads t, cross_references x, _session250_en02_lookup sv, _session250_en02_lookup tv
 WHERE t.slug='1-enoch-2-luminaries-appointed-order'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=2 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 31:35 — *Thus saith Yahuah (LORD), which giveth the sun for a light by day, and the ordinances of the moon and of the stars for a light by night, which divideth the sea when the waves thereof roar; Yahuah Tseva''ot (LORD of hosts) is his name:* Enoch''s "appointed order" of sun, moon, and stars is exactly the fixed ordinance Jeremiah binds to Yahuah''s name and to the endurance of Yashar''el.'
  FROM cross_reference_threads t, cross_references x, _session250_en02_lookup sv, _session250_en02_lookup tv
 WHERE t.slug='1-enoch-2-luminaries-appointed-order'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=2 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 19:1 — *The heavens declare the glory of Elohim (God); and the firmament sheweth his handywork.* The orbits that never change are the Psalmist''s wordless sermon, preaching the Maker to everyone who will "observe."'
  FROM cross_reference_threads t, cross_references x, _session250_en02_lookup sv, _session250_en02_lookup tv
 WHERE t.slug='1-enoch-2-luminaries-appointed-order'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=2 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Job 38:33 — *Knowest thou the ordinances of heaven? canst thou set the dominion thereof in the earth?* Yahuah''s challenge to Job over the fixed ordinances of heaven is the very lesson Enoch draws — man did not appoint the order he is told to behold.'
  FROM cross_reference_threads t, cross_references x, _session250_en02_lookup sv, _session250_en02_lookup tv
 WHERE t.slug='1-enoch-2-luminaries-appointed-order'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=2 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=38 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Enoch 5:1 — *Observe ye how the trees cover themselves with green leaves and bear fruit: wherefore give ye heed and know with regard to all His works, and recognize how He that liveth for ever hath made them so.* The same imperative "observe" carries through the exhortation — sky, earth, and tree all rebuke the rebel by their obedience.'
  FROM cross_reference_threads t, cross_references x, _session250_en02_lookup sv, _session250_en02_lookup tv
 WHERE t.slug='1-enoch-2-luminaries-appointed-order'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=2 AND sv.verse_number=1
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=5 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-2-earth-steadfast-creation-obeys
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 148:6 — *He hath also stablished them for ever and ever: he hath made a decree which shall not pass.* What Enoch calls "how steadfast they are" the Psalmist names a decree that shall not pass — the works of Elohim are fixed by command.'
  FROM cross_reference_threads t, cross_references x, _session250_en02_lookup sv, _session250_en02_lookup tv
 WHERE t.slug='1-enoch-2-earth-steadfast-creation-obeys'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=2 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=148 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 8:7 — *Yea, the stork in the heaven knoweth her appointed times; and the turtle and the crane and the swallow observe the time of their coming; but my people know not the judgment of Yahuah (LORD).* Enoch''s "none of the things upon earth change" becomes Jeremiah''s indictment: creation keeps its appointed times while the covenant people forget theirs.'
  FROM cross_reference_threads t, cross_references x, _session250_en02_lookup sv, _session250_en02_lookup tv
 WHERE t.slug='1-enoch-2-earth-steadfast-creation-obeys'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=2 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=8 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Sirach 16:28 — *None of them hindereth another, and they shall never disobey his word.* Ben Sira makes Enoch''s point exactly — the works of Elohim keep their ranks and never disobey, which is why their steadfastness testifies against every rebel.'
  FROM cross_reference_threads t, cross_references x, _session250_en02_lookup sv, _session250_en02_lookup tv
 WHERE t.slug='1-enoch-2-earth-steadfast-creation-obeys'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=2 AND sv.verse_number=2
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=16 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 5:3 — *And behold how the sea and the rivers in like manner accomplish and change not their tasks from His commandments.* Enoch''s own next chapter adds sea and rivers to the unchanging earth, sharpening the exhortation toward the sinners who did change their way.'
  FROM cross_reference_threads t, cross_references x, _session250_en02_lookup sv, _session250_en02_lookup tv
 WHERE t.slug='1-enoch-2-earth-steadfast-creation-obeys'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=2 AND sv.verse_number=2
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=5 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-2-summer-winter-appointed-seasons
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 8:22 — *While the earth remaineth, seedtime and harvest, and cold and heat, and summer and winter, and day and night shall not cease.* Enoch''s "summer and the winter" is Yahuah''s post-Flood oath that the seasons shall not cease — the steadfast order the rest of the book sets against the Watchers'' rebellion.'
  FROM cross_reference_threads t, cross_references x, _session250_en02_lookup sv, _session250_en02_lookup tv
 WHERE t.slug='1-enoch-2-summer-winter-appointed-seasons'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=2 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=8 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 104:19 — *He appointed the moon for seasons: the sun knoweth his going down.* The seasons Enoch tells the reader to behold are appointed by the lights, just as the Psalmist sings of the moon set for the moedim.'
  FROM cross_reference_threads t, cross_references x, _session250_en02_lookup sv, _session250_en02_lookup tv
 WHERE t.slug='1-enoch-2-summer-winter-appointed-seasons'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=2 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=104 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 5:24 — *Neither say they in their heart, Let us now fear Yahuah Eloheinu (the LORD our God), that giveth rain, both the former and the latter, in his season: he reserveth unto us the appointed weeks of the harvest.* The clouds, dew, and rain that fill Enoch''s earth are Jeremiah''s former and latter rains, given in season by the One whom the people forget to fear.'
  FROM cross_reference_threads t, cross_references x, _session250_en02_lookup sv, _session250_en02_lookup tv
 WHERE t.slug='1-enoch-2-summer-winter-appointed-seasons'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=2 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=5 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 2:9 — *And Elohim (God) appointed the sun to be a great sign on the earth for days and for sabbaths and for months and for feasts and for years and for sabbaths of years and for jubilees and for all seasons of the years.* Jubilees spells out what Enoch''s summer and winter imply — the appointed times, feasts, and sabbaths are fixed by the lights, not by men.'
  FROM cross_reference_threads t, cross_references x, _session250_en02_lookup sv, _session250_en02_lookup tv
 WHERE t.slug='1-enoch-2-summer-winter-appointed-seasons'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=2 AND sv.verse_number=3
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Sirach 43:6 — *He made the moon also to serve in her season for a declaration of times, and a sign of the world.* Ben Sira joins Enoch''s seasonal witness: the moon serves in her season as a declaration of times, the calendar God hung in the sky.'
  FROM cross_reference_threads t, cross_references x, _session250_en02_lookup sv, _session250_en02_lookup tv
 WHERE t.slug='1-enoch-2-summer-winter-appointed-seasons'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=2 AND sv.verse_number=3
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=43 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

