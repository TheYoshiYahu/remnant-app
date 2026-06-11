-- ----- fragment: minion_jubilees_02.sql (session251 jubilees 2) -----
-- Source anchor: jubilees/jubilees ch2. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ju02 (view _session251_ju02_lookup). Sort band base 53025, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session251_ju02_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jubilees-2-six-days-creation
  ('jubilees', 'jubilees', 2, 4, 'canon', 'genesis', 1, 6, 'free', E'Genesis 1:6 — *And Elohim (God) said, Let there be a firmament in the midst of the waters, and let it divide the waters from the waters.* Jubilees 2:4 retells the second day''s dividing of the waters word for word.'),
  ('jubilees', 'jubilees', 2, 5, 'canon', 'genesis', 1, 9, 'free', E'Genesis 1:9 — *And Elohim (God) said, Let the waters under the heaven be gathered together unto one place, and let the dry land appear: and it was so.* The third-day command of Jubilees 2:5 is the same gathering of the waters and appearing of the dry land.'),
  ('jubilees', 'jubilees', 2, 14, 'canon', 'genesis', 1, 26, 'free', E'Genesis 1:26 — *And Elohim (God) said, Let us make man in our image, after our likeness: and let them have dominion over the fish of the sea, and over the fowl of the air, and over the cattle, and over all the earth.* Jubilees 2:14 gives the same man, male and female, dominion over all that moves on the earth and in the seas.'),
  ('jubilees', 'jubilees', 2, 16, 'canon', 'genesis', 2, 2, 'free', E'Genesis 2:2 — *And on the seventh day Elohim (God) ended his work which he had made; and he rested on the seventh day from all his work which he had made.* Jubilees 2:16 finishes the six days and gives the Sabbath rest exactly as the source closes the creation account.'),
  -- thread: jubilees-2-angels-first-day-spirits
  ('jubilees', 'jubilees', 2, 2, 'canon', 'psalms', 104, 4, 'free', E'Psalm 104:4 — *Who maketh his angels spirits; his ministers a flaming fire.* Jubilees 2:2 names these same serving spirits, including the angels of the spirit of fire, created on the first day.'),
  ('jubilees', 'jubilees', 2, 2, 'enoch', '1-enoch', 60, 13, 'extras', E'1 Enoch 60:13 — *And he showed me all the secrets of the lightning and thunder, and showed me the secrets of the winds, how they are divided to blow over the earth, and the secrets of the clouds and dew, and there I saw from whence they proceed in that place and from whence they saturate the dusty earth.* The same governed winds, clouds, lightning and thunder that Jubilees 2:2 assigns to angelic spirits.'),
  ('jubilees', 'jubilees', 2, 2, 'enoch', '1-enoch', 60, 14, 'extras', E'1 Enoch 60:14 — *And he showed me closed chambers out of which the winds are divided, the chamber of the hail and winds, the chamber of the mist, and of the clouds, and the cloud thereof hovers over the earth from the beginning of the world.* The chambers of hail and mist match Jubilees 2:2''s angels of snow, hail and hoar frost.'),
  ('jubilees', 'jubilees', 2, 3, 'canon', 'job', 38, 7, 'free', E'Job 38:7 — *When the morning stars sang together, and all the sons of Elohim (God) shouted for joy?* The host praising at creation in Jubilees 2:3 is the same heavenly rejoicing over the works of Yahuah.'),
  -- thread: jubilees-2-sun-sign-feasts-jubilees
  ('jubilees', 'jubilees', 2, 9, 'canon', 'genesis', 1, 14, 'free', E'Genesis 1:14 — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years.* Jubilees 2:9 reads the fourth-day lights as the appointed sign for sabbaths, feasts and jubilees.'),
  ('jubilees', 'jubilees', 2, 9, 'jubilees', 'jubilees', 6, 32, 'extras', E'Jubilees 6:32 — *And command you the children of Yashar''el (Israel) that they observe the years according to this reckoning-three hundred and sixty-four days, and (these) will constitute a complete year, and they will not disturb its time from its days and from its feasts.* The sun-as-sign of Jubilees 2:9 becomes the 364-day solar year Jubilees later commands.'),
  ('jubilees', 'jubilees', 2, 9, 'enoch', '1-enoch', 72, 1, 'extras', E'1 Enoch 72:1 — *The book of the courses of the luminaries of the heaven, the relations of each, according to their classes, their dominion and their seasons, according to their names and places of origin, and according to their months, which Uriel, the holy angel who was with me, who was their leader, showed me.* The same luminaries Jubilees 2:9 makes the sign for seasons and feasts govern Enoch''s calendar of the years.'),
  ('jubilees', 'jubilees', 2, 9, 'canon', 'leviticus', 23, 2, 'free', E'Leviticus 23:2 — *Speak unto the children of Yashar''el (Israel), and say unto them, Concerning the feasts of Yahuah (LORD), which ye shall proclaim to be holy convocations, even these are my feasts.* The feasts the sun marks in Jubilees 2:9 are the very moedim of Yahuah, His own appointed times.'),
  -- thread: jubilees-2-sabbath-hallowed-from-creation
  ('jubilees', 'jubilees', 2, 16, 'canon', 'genesis', 2, 3, 'free', E'Genesis 2:3 — *And Elohim (God) blessed the seventh day, and sanctified it: because that in it he had rested from all his work which Elohim (God) created and made.* Jubilees 2:16 gives this same blessed, sanctified seventh day as the great sign over creation.'),
  ('jubilees', 'jubilees', 2, 1, 'canon', 'exodus', 20, 11, 'free', E'Exodus 20:11 — *For in six days Yahuah (LORD) made heaven and earth, the sea, and all that in them is, and rested the seventh day: wherefore Yahuah (LORD) blessed the sabbath day, and hallowed it.* The fourth word grounds the Sabbath in creation exactly as Jubilees 2:1 says the seventh day was hallowed for all ages.'),
  ('jubilees', 'jubilees', 2, 21, 'canon', 'exodus', 31, 17, 'free', E'Exodus 31:17 — *It is a sign between me and the children of Yashar''el (Israel) for ever: for in six days Yahuah (LORD) made heaven and earth, and on the seventh day he rested, and was refreshed.* Jubilees 2:21 names the same created sign by which Israel keeps Sabbath with the angels for ever.'),
  ('jubilees', 'jubilees', 2, 25, 'canon', 'exodus', 31, 14, 'free', E'Exodus 31:14 — *Ye shall keep the sabbath therefore; for it is holy unto you: every one that defileth it shall surely be put to death: for whosoever doeth any work therein, that soul shall be cut off from among his people.* The death-penalty for defiling the day in Jubilees 2:25 quotes the Torah''s own statute.'),
  ('jubilees', 'jubilees', 2, 29, 'canon', 'isaiah', 58, 13, 'free', E'Isaiah 58:13 — *If thou turn away thy foot from the sabbath, from doing thy pleasure on my holy day; and call the sabbath a delight, the holy of Yahuah (LORD), honourable; and shalt honour him, not doing thine own ways, nor finding thine own pleasure, nor speaking thine own words.* Jubilees 2:29 forbids that same pleasure-seeking on the holy day, keeping the Sabbath honourable.'),
  -- thread: jubilees-2-israel-chosen-firstborn-seed
  ('jubilees', 'jubilees', 2, 20, 'canon', 'exodus', 4, 22, 'free', E'Exodus 4:22 — *And thou shalt say unto Pharaoh, Thus saith Yahuah (LORD), Yashar''el (Israel) is my son, even my firstborn.* Jubilees 2:20 writes the seed of Jacob down as that same firstborn son, sanctified for ever.'),
  ('jubilees', 'jubilees', 2, 19, 'canon', 'deuteronomy', 7, 6, 'free', E'Deuteronomy 7:6 — *For thou art an holy people unto Yahuah Elohayka (the LORD thy God): Yahuah Elohayka (the LORD thy God) hath chosen thee to be a special people unto himself, above all people that are upon the face of the earth.* The people separated and sanctified in Jubilees 2:19 are this chosen, holy people of the Torah.'),
  ('jubilees', 'jubilees', 2, 31, 'canon', 'leviticus', 23, 3, 'free', E'Leviticus 23:3 — *Six days shall work be done: but the seventh day is the sabbath of rest, an holy convocation; ye shall do no work therein: it is the sabbath of Yahuah (LORD) in all your dwellings.* The Sabbath Yahuah permits Israel alone to keep in Jubilees 2:31 stands first among the holy convocations of His feasts.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session251_ju02_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session251_ju02_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-2-six-days-creation',
       E'The six days of creation — Genesis retold on the heavenly tablets',
       E'The angel of the presence dictates to Moses the very opening of the Torah: *Write the complete history of the creation, how in six days Yahuah Elohim (the LORD God) finished all His works and all that He created, and kept Sabbath on the seventh day and hallowed it for all ages, and appointed it as a sign for all His works* (Jubilees 2:1). It ain''t new — this is Genesis 1 set beside itself. The firmament dividing the waters, *And on the second day He created the firmament in the midst of the waters, and the waters were divided on that day* (Jubilees 2:4), is the same word as *And Elohim (God) said, Let there be a firmament in the midst of the waters, and let it divide the waters from the waters* (Genesis 1:6). The dry land, the lights, the sea creatures, man given dominion — every day matches the source: *And Elohim (God) said, Let us make man in our image, after our likeness: and let them have dominion over the fish of the sea* (Genesis 1:26). And the rest that crowns the week stands engraved from the first page: *And on the seventh day Elohim (God) ended his work which he had made; and he rested on the seventh day from all his work which he had made* (Genesis 2:2).',
       sv.verse_id, ev.verse_id, 'extras', 53025
  FROM _session251_ju02_lookup sv, _session251_ju02_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=2 AND sv.verse_number=1
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=2 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-2-angels-first-day-spirits',
       E'The angels and the spirits of the elements, created on day one',
       E'Jubilees fills out what Genesis only implies: on the very first day the heavenly host was made. *For on the first day He created the heavens which are above and the earth and the waters and all the spirits which serve before Him–the angels of the presence, and the angels of sanctification, and the angels of the spirit of fire and the angels of the spirit of the winds, and the angels of the spirit of the clouds, and of darkness, and of snow and of hail and of hoar frost* (Jubilees 2:2). The Psalmist names this same household of ministering spirits: *Who maketh his angels spirits; his ministers a flaming fire* (Psalm 104:4). And the live Enoch apparatus shows the very same chambers of the elements being shown to a man caught up: *And he showed me all the secrets of the lightning and thunder, and showed me the secrets of the winds, how they are divided to blow over the earth, and the secrets of the clouds and dew* (1 Enoch 60:13) — *the chamber of the hail and winds, the chamber of the mist, and of the clouds* (1 Enoch 60:14). The angels seeing and praising the work, *And thereupon we saw His works, and praised Him, and lauded before Him on account of all His works* (Jubilees 2:3), is the heavenly host worshipping at creation — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53028
  FROM _session251_ju02_lookup sv, _session251_ju02_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=2 AND sv.verse_number=2
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=2 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-2-sun-sign-feasts-jubilees',
       E'The sun a great sign — for sabbaths, feasts, and jubilees',
       E'On the fourth day the luminaries are not merely lamps but the clock of the appointed times: *And Elohim (God) appointed the sun to be a great sign on the earth for days and for sabbaths and for months and for feasts and for years and for sabbaths of years and for jubilees and for all seasons of the years* (Jubilees 2:9). This is Genesis read with open eyes: *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years* (Genesis 1:14). The moedim are written into the sun from the fourth day — the feasts are not a later invention. Jubilees presses it to the solar reckoning later: *And command you the children of Yashar''el (Israel) that they observe the years according to this reckoning-three hundred and sixty-four days* (Jubilees 6:32), and the live Enoch apparatus opens its calendar book the same way: *The book of the courses of the luminaries of the heaven... showed me all their laws exactly as they are, and how it is with regard to all the years of the world* (1 Enoch 72:1). The feasts the sun marks are Yahuah''s own: *Concerning the feasts of Yahuah (LORD), which ye shall proclaim to be holy convocations, even these are my feasts* (Leviticus 23:2). It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53031
  FROM _session251_ju02_lookup sv, _session251_ju02_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=2 AND sv.verse_number=8
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=2 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-2-sabbath-hallowed-from-creation',
       E'The Sabbath hallowed from creation — the eternal sign',
       E'The seventh day is not a Sinai novelty; it is the crown of creation, kept in heaven before any flesh kept it on earth: *And He gave us a great sign, the Sabbath day, that we should work six days, but keep Sabbath on the seventh day from all work* (Jubilees 2:16), and *on this we kept Sabbath in the heavens before it was made known to any flesh to keep Sabbath thereon on the earth* (Jubilees 2:30). Genesis already sealed it: *And Elohim (God) blessed the seventh day, and sanctified it: because that in it he had rested from all his work which Elohim (God) created and made* (Genesis 2:3). The fourth word at Sinai grounds the rest in creation itself: *For in six days Yahuah (LORD) made heaven and earth, the sea, and all that in them is, and rested the seventh day: wherefore Yahuah (LORD) blessed the sabbath day, and hallowed it* (Exodus 20:11). And it is named the everlasting covenant sign — exactly Jubilees'' language: *It is a sign between me and the children of Yashar''el (Israel) for ever: for in six days Yahuah (LORD) made heaven and earth, and on the seventh day he rested, and was refreshed* (Exodus 31:17). The prophets keep calling it a delight, not a burden: *If thou turn away thy foot from the sabbath, from doing thy pleasure on my holy day; and call the sabbath a delight, the holy of Yahuah (LORD), honourable* (Isaiah 58:13). Torah stands; the sign is eternal. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53034
  FROM _session251_ju02_lookup sv, _session251_ju02_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=2 AND sv.verse_number=16
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=2 AND ev.verse_number=30
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-2-israel-chosen-firstborn-seed',
       E'Israel chosen — the seed of Jacob, the firstborn, kept for the Sabbath',
       E'The Sabbath is the badge of an elect people, separated from the nations: *Behold, I will separate to Myself a people from among all the peoples, and these will keep the Sabbath day, and I will sanctify them to Myself as My people, and will bless them* (Jubilees 2:19), and *I have chosen the seed of Jacob from amongst all that I have seen, and have written him down as My firstborn son, and have sanctified him to Myself for ever and ever* (Jubilees 2:20). The firstborn-son title is straight from the Exodus deliverance: *Thus saith Yahuah (LORD), Yashar''el (Israel) is my son, even my firstborn* (Exodus 4:22). The election is Moses'' own charter: *For thou art an holy people unto Yahuah Elohayka (the LORD thy God): Yahuah Elohayka (the LORD thy God) hath chosen thee to be a special people unto himself, above all people that are upon the face of the earth* (Deuteronomy 7:6). And the Sabbath that seals this people is fixed in the calendar of holy convocations: *Six days shall work be done: but the seventh day is the sabbath of rest, an holy convocation; ye shall do no work therein: it is the sabbath of Yahuah (LORD) in all your dwellings* (Leviticus 23:3). Election precedes the keeping; the seed of Jacob is kept holy and gathered as Yahuah''s portion — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53037
  FROM _session251_ju02_lookup sv, _session251_ju02_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=2 AND sv.verse_number=19
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=2 AND ev.verse_number=31
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jubilees-2-six-days-creation
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:6 — *And Elohim (God) said, Let there be a firmament in the midst of the waters, and let it divide the waters from the waters.* Jubilees 2:4 retells the second day''s dividing of the waters word for word.'
  FROM cross_reference_threads t, cross_references x, _session251_ju02_lookup sv, _session251_ju02_lookup tv
 WHERE t.slug='jubilees-2-six-days-creation'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=2 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 1:9 — *And Elohim (God) said, Let the waters under the heaven be gathered together unto one place, and let the dry land appear: and it was so.* The third-day command of Jubilees 2:5 is the same gathering of the waters and appearing of the dry land.'
  FROM cross_reference_threads t, cross_references x, _session251_ju02_lookup sv, _session251_ju02_lookup tv
 WHERE t.slug='jubilees-2-six-days-creation'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=2 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 1:26 — *And Elohim (God) said, Let us make man in our image, after our likeness: and let them have dominion over the fish of the sea, and over the fowl of the air, and over the cattle, and over all the earth.* Jubilees 2:14 gives the same man, male and female, dominion over all that moves on the earth and in the seas.'
  FROM cross_reference_threads t, cross_references x, _session251_ju02_lookup sv, _session251_ju02_lookup tv
 WHERE t.slug='jubilees-2-six-days-creation'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=2 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 2:2 — *And on the seventh day Elohim (God) ended his work which he had made; and he rested on the seventh day from all his work which he had made.* Jubilees 2:16 finishes the six days and gives the Sabbath rest exactly as the source closes the creation account.'
  FROM cross_reference_threads t, cross_references x, _session251_ju02_lookup sv, _session251_ju02_lookup tv
 WHERE t.slug='jubilees-2-six-days-creation'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=2 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-2-angels-first-day-spirits
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 104:4 — *Who maketh his angels spirits; his ministers a flaming fire.* Jubilees 2:2 names these same serving spirits, including the angels of the spirit of fire, created on the first day.'
  FROM cross_reference_threads t, cross_references x, _session251_ju02_lookup sv, _session251_ju02_lookup tv
 WHERE t.slug='jubilees-2-angels-first-day-spirits'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=2 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=104 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 60:13 — *And he showed me all the secrets of the lightning and thunder, and showed me the secrets of the winds, how they are divided to blow over the earth, and the secrets of the clouds and dew, and there I saw from whence they proceed in that place and from whence they saturate the dusty earth.* The same governed winds, clouds, lightning and thunder that Jubilees 2:2 assigns to angelic spirits.'
  FROM cross_reference_threads t, cross_references x, _session251_ju02_lookup sv, _session251_ju02_lookup tv
 WHERE t.slug='jubilees-2-angels-first-day-spirits'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=2 AND sv.verse_number=2
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=60 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 60:14 — *And he showed me closed chambers out of which the winds are divided, the chamber of the hail and winds, the chamber of the mist, and of the clouds, and the cloud thereof hovers over the earth from the beginning of the world.* The chambers of hail and mist match Jubilees 2:2''s angels of snow, hail and hoar frost.'
  FROM cross_reference_threads t, cross_references x, _session251_ju02_lookup sv, _session251_ju02_lookup tv
 WHERE t.slug='jubilees-2-angels-first-day-spirits'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=2 AND sv.verse_number=2
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=60 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Job 38:7 — *When the morning stars sang together, and all the sons of Elohim (God) shouted for joy?* The host praising at creation in Jubilees 2:3 is the same heavenly rejoicing over the works of Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session251_ju02_lookup sv, _session251_ju02_lookup tv
 WHERE t.slug='jubilees-2-angels-first-day-spirits'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=2 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=38 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-2-sun-sign-feasts-jubilees
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:14 — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years.* Jubilees 2:9 reads the fourth-day lights as the appointed sign for sabbaths, feasts and jubilees.'
  FROM cross_reference_threads t, cross_references x, _session251_ju02_lookup sv, _session251_ju02_lookup tv
 WHERE t.slug='jubilees-2-sun-sign-feasts-jubilees'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=2 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jubilees 6:32 — *And command you the children of Yashar''el (Israel) that they observe the years according to this reckoning-three hundred and sixty-four days, and (these) will constitute a complete year, and they will not disturb its time from its days and from its feasts.* The sun-as-sign of Jubilees 2:9 becomes the 364-day solar year Jubilees later commands.'
  FROM cross_reference_threads t, cross_references x, _session251_ju02_lookup sv, _session251_ju02_lookup tv
 WHERE t.slug='jubilees-2-sun-sign-feasts-jubilees'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=2 AND sv.verse_number=9
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=6 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 72:1 — *The book of the courses of the luminaries of the heaven, the relations of each, according to their classes, their dominion and their seasons, according to their names and places of origin, and according to their months, which Uriel, the holy angel who was with me, who was their leader, showed me.* The same luminaries Jubilees 2:9 makes the sign for seasons and feasts govern Enoch''s calendar of the years.'
  FROM cross_reference_threads t, cross_references x, _session251_ju02_lookup sv, _session251_ju02_lookup tv
 WHERE t.slug='jubilees-2-sun-sign-feasts-jubilees'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=2 AND sv.verse_number=9
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=72 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Leviticus 23:2 — *Speak unto the children of Yashar''el (Israel), and say unto them, Concerning the feasts of Yahuah (LORD), which ye shall proclaim to be holy convocations, even these are my feasts.* The feasts the sun marks in Jubilees 2:9 are the very moedim of Yahuah, His own appointed times.'
  FROM cross_reference_threads t, cross_references x, _session251_ju02_lookup sv, _session251_ju02_lookup tv
 WHERE t.slug='jubilees-2-sun-sign-feasts-jubilees'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=2 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-2-sabbath-hallowed-from-creation
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 2:3 — *And Elohim (God) blessed the seventh day, and sanctified it: because that in it he had rested from all his work which Elohim (God) created and made.* Jubilees 2:16 gives this same blessed, sanctified seventh day as the great sign over creation.'
  FROM cross_reference_threads t, cross_references x, _session251_ju02_lookup sv, _session251_ju02_lookup tv
 WHERE t.slug='jubilees-2-sabbath-hallowed-from-creation'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=2 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 20:11 — *For in six days Yahuah (LORD) made heaven and earth, the sea, and all that in them is, and rested the seventh day: wherefore Yahuah (LORD) blessed the sabbath day, and hallowed it.* The fourth word grounds the Sabbath in creation exactly as Jubilees 2:1 says the seventh day was hallowed for all ages.'
  FROM cross_reference_threads t, cross_references x, _session251_ju02_lookup sv, _session251_ju02_lookup tv
 WHERE t.slug='jubilees-2-sabbath-hallowed-from-creation'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=2 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 31:17 — *It is a sign between me and the children of Yashar''el (Israel) for ever: for in six days Yahuah (LORD) made heaven and earth, and on the seventh day he rested, and was refreshed.* Jubilees 2:21 names the same created sign by which Israel keeps Sabbath with the angels for ever.'
  FROM cross_reference_threads t, cross_references x, _session251_ju02_lookup sv, _session251_ju02_lookup tv
 WHERE t.slug='jubilees-2-sabbath-hallowed-from-creation'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=2 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=31 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Exodus 31:14 — *Ye shall keep the sabbath therefore; for it is holy unto you: every one that defileth it shall surely be put to death: for whosoever doeth any work therein, that soul shall be cut off from among his people.* The death-penalty for defiling the day in Jubilees 2:25 quotes the Torah''s own statute.'
  FROM cross_reference_threads t, cross_references x, _session251_ju02_lookup sv, _session251_ju02_lookup tv
 WHERE t.slug='jubilees-2-sabbath-hallowed-from-creation'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=2 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=31 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Isaiah 58:13 — *If thou turn away thy foot from the sabbath, from doing thy pleasure on my holy day; and call the sabbath a delight, the holy of Yahuah (LORD), honourable; and shalt honour him, not doing thine own ways, nor finding thine own pleasure, nor speaking thine own words.* Jubilees 2:29 forbids that same pleasure-seeking on the holy day, keeping the Sabbath honourable.'
  FROM cross_reference_threads t, cross_references x, _session251_ju02_lookup sv, _session251_ju02_lookup tv
 WHERE t.slug='jubilees-2-sabbath-hallowed-from-creation'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=2 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=58 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-2-israel-chosen-firstborn-seed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 4:22 — *And thou shalt say unto Pharaoh, Thus saith Yahuah (LORD), Yashar''el (Israel) is my son, even my firstborn.* Jubilees 2:20 writes the seed of Jacob down as that same firstborn son, sanctified for ever.'
  FROM cross_reference_threads t, cross_references x, _session251_ju02_lookup sv, _session251_ju02_lookup tv
 WHERE t.slug='jubilees-2-israel-chosen-firstborn-seed'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=2 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=4 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 7:6 — *For thou art an holy people unto Yahuah Elohayka (the LORD thy God): Yahuah Elohayka (the LORD thy God) hath chosen thee to be a special people unto himself, above all people that are upon the face of the earth.* The people separated and sanctified in Jubilees 2:19 are this chosen, holy people of the Torah.'
  FROM cross_reference_threads t, cross_references x, _session251_ju02_lookup sv, _session251_ju02_lookup tv
 WHERE t.slug='jubilees-2-israel-chosen-firstborn-seed'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=2 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 23:3 — *Six days shall work be done: but the seventh day is the sabbath of rest, an holy convocation; ye shall do no work therein: it is the sabbath of Yahuah (LORD) in all your dwellings.* The Sabbath Yahuah permits Israel alone to keep in Jubilees 2:31 stands first among the holy convocations of His feasts.'
  FROM cross_reference_threads t, cross_references x, _session251_ju02_lookup sv, _session251_ju02_lookup tv
 WHERE t.slug='jubilees-2-israel-chosen-firstborn-seed'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=2 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

