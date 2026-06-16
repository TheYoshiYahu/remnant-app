-- ----- fragment: minion_matthew_17.sql (S260 Matthew depth) -----
-- ============================================================================
-- Matthew 17 — full-library cross-reference threads (NT DEPTH pass)
-- 4 threads / 19 members. Band 11480+, step +3.
-- ============================================================================

-- ---- 3a. Temp view ---------------------------------------------------------
CREATE TEMP VIEW _mt17_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1',
   'pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ---- 3b. cross_references rows ---------------------------------------------
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES

  -- THREAD 1 — Transfiguration (17:1-8)
  ('canon','matthew',17,2,'canon','exodus',34,29, 'free', E'*Moses wist not that the skin of his face shone while he talked with him* (Exodus 34:29). On the mount Moses'' face caught the glory like a borrowed light; here *his face did shine as the sun, and his raiment was white as the light* (Matthew 17:2) — the glory is His own.'),
  ('canon','matthew',17,2,'canon','exodus',34,30, 'free', E'*And when Aaron and all the children of Yashar''el (Israel) saw Moses, behold, the skin of his face shone; and they were afraid to come nigh him* (Exodus 34:30). The fear of the shining face returns on the holy mount — *they fell on their face, and were sore afraid* (Matthew 17:6).'),
  ('canon','matthew',17,3,'canon','malachi',4,4, 'free', E'*Remember ye the law of Moses my servant, which I commanded unto him in Horeb for all Yashar''el (Israel), with the statutes and judgments* (Malachi 4:4). Moses on the mount = the Torah itself standing witness to the Formed Son.'),
  ('canon','matthew',17,3,'canon','malachi',4,5, 'free', E'*Behold, I will send you Elijah the prophet before the coming of the great and dreadful day of Yahuah (LORD)* (Malachi 4:5). Malachi names Moses AND Elijah together — the law and the prophets — and both appear *talking with him* (Matthew 17:3).'),
  ('canon','matthew',17,5,'canon','deuteronomy',18,15, 'free', E'*Yahuah Elohayka (The LORD thy God) will raise up unto thee a Prophet from the midst of thee, of thy brethren, like unto me; unto him ye shall hearken* (Deuteronomy 18:15). The Father''s word *hear ye him* (Matthew 17:5) is the very promise of Moses fulfilled — the Prophet like Moses is here, and the Father commands the hearing.'),
  ('canon','matthew',17,5,'canon','deuteronomy',18,18, 'free', E'*I will raise them up a Prophet from among their brethren, like unto thee, and will put my words in his mouth; and he shall speak unto them all that I shall command him* (Deuteronomy 18:18). The words in His mouth are the Father''s words — *hear ye him*.'),
  ('canon','matthew',17,5,'canon','psalms',2,7, 'free', E'*I will declare the decree: Yahuah (LORD) hath said unto me, Thou art my Son; this day have I begotten thee* (Psalm 2:7). The voice from the cloud — *This is my beloved Son* (Matthew 17:5) — is the Father declaring the begotten Son, not a second deity speaking of itself.'),
  ('canon','matthew',17,5,'canon','isaiah',42,1, 'free', E'*Behold my servant, whom I uphold; mine elect, in whom my soul delighteth; I have put my spirit upon him* (Isaiah 42:1). *In whom I am well pleased* (Matthew 17:5) echoes the Father''s delight in His chosen Servant.'),
  ('canon','matthew',17,2,'canon','daniel',7,9, 'free', E'*The Ancient of days did sit, whose garment was white as snow, and the hair of his head like the pure wool: his throne was like the fiery flame* (Daniel 7:9). The raiment *white as the light* (Matthew 17:2) is the throne-glory of heaven shining out through the Formed Son.'),

  -- THREAD 2 — Elias is come already (17:9-13)
  ('canon','matthew',17,11,'canon','malachi',4,5, 'free', E'*Behold, I will send you Elijah the prophet before the coming of the great and dreadful day of Yahuah (LORD)* (Malachi 4:5). *Elias truly shall first come, and restore all things* (Matthew 17:11) — the promise stands.'),
  ('canon','matthew',17,11,'canon','malachi',4,6, 'free', E'*And he shall turn the heart of the fathers to the children, and the heart of the children to their fathers, lest I come and smite the earth with a curse* (Malachi 4:6). The restoring work of the Elijah-figure = the turning of hearts, the gathering home.'),
  ('canon','matthew',17,11,'apocrypha','ecclesiasticus',48,10, 'extras', E'*Who were ordained for reproofs in their times, to pacify the wrath of the judgment of Yahuah (God)... and to turn the heart of the father to the son, and to restore the tribes of Jacob* (Sirach 48:10). The second-Temple witness reads Elijah''s return as the restoring of the scattered tribes — the two-house gathering behind *restore all things* (Matthew 17:11).'),

  -- THREAD 3 — Faith as a grain of mustard seed (17:14-21)
  ('canon','matthew',17,20,'canon','zechariah',4,6, 'free', E'*Not by might, nor by power, but by my spirit, saith Yahuah Tseva''ot (LORD of hosts)* (Zechariah 4:6). The mountain is not moved by the strength of man but by trusting the Spirit — *because of your unbelief* (Matthew 17:20) names the lack.'),
  ('canon','matthew',17,20,'canon','zechariah',4,7, 'free', E'*Who art thou, O great mountain? before Zerubbabel thou shalt become a plain* (Zechariah 4:7). The very figure Yahusha takes up — *ye shall say unto this mountain, Remove hence... and it shall remove* (Matthew 17:20) — the obstacle levelled before faith.'),
  ('canon','matthew',17,15,'canon','psalms',50,15, 'free', E'*And call upon me in the day of trouble: I will deliver thee, and thou shalt glorify me* (Psalm 50:15). The father cried *have mercy on my son* (Matthew 17:15); deliverance answers the cry of trouble — *this kind goeth not out but by prayer and fasting* (Matthew 17:21).'),
  ('canon','matthew',17,20,'canon','isaiah',40,31, 'free', E'*But they that wait upon Yahuah (LORD) shall renew their strength; they shall mount up with wings as eagles; they shall run, and not be weary* (Isaiah 40:31). The mustard-seed faith is not the disciples'' own power but waiting on Yahuah, who makes nothing impossible.'),

  -- THREAD 4 — The tribute money / the children free (17:22-27)
  ('canon','matthew',17,24,'canon','exodus',30,13, 'free', E'*This they shall give, every one that passeth among them that are numbered, half a shekel after the shekel of the sanctuary... an half shekel shall be the offering of Yahuah (LORD)* (Exodus 30:13). The *tribute money* (Matthew 17:24) is the sanctuary half-shekel — the ransom of the soul before Yahuah.'),
  ('canon','matthew',17,24,'canon','exodus',30,14, 'free', E'*Every one that passeth among them that are numbered, from twenty years old and above, shall give an offering unto Yahuah (LORD)* (Exodus 30:14). The offering is rendered to Yahuah''s house — and the Son of that house *yet yields* lest He offend.'),
  ('canon','matthew',17,26,'canon','psalms',24,1, 'free', E'*The earth is Yahuah''s, and the fulness thereof; the world, and they that dwell therein* (Psalm 24:1). The kings take tribute *of strangers* not of their own children (Matthew 17:25-26); the Son is free, for all the earth — and the fish in the sea — is already His Father''s.'),
  ('canon','matthew',17,26,'canon','exodus',19,5, 'free', E'*then ye shall be a peculiar treasure unto me above all people: for all the earth is mine* (Exodus 19:5). The One who owns all the earth — *all the earth is mine* — stoops to render the dues of the very sanctuary He owns, lest He offend.')

)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _mt17_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _mt17_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ---- 3c. threads -----------------------------------------------------------
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-17-transfiguration-this-is-my-beloved-son-hear-ye-him-exodus-34-deuteronomy-18-malachi-4',
       E'The Transfiguration — Moses and Elijah, this is my beloved Son, hear ye him (Exodus 34; Deuteronomy 18; Malachi 4; Daniel 7)',
       E'On the high mountain *his face did shine as the sun, and his raiment was white as the light* (Matthew 17:2), and *there appeared unto them Moses and Elias talking with him* (Matthew 17:3). Watch the whole library converge. Moses'' own face once shone — *Moses wist not that the skin of his face shone while he talked with him* (Exodus 34:29), and *the children of Yashar''el (Israel) saw Moses, behold, the skin of his face shone; and they were afraid to come nigh him* (Exodus 34:30) — but that was a borrowed glory, caught from being near Yahuah; here the glory is the Son''s own. The two men are not random: Malachi names them together as the law and the prophets — *Remember ye the law of Moses my servant, which I commanded unto him in Horeb* (Malachi 4:4) and *Behold, I will send you Elijah the prophet* (Malachi 4:5). Moses (the Torah) and Elijah (the Prophets) both stand witness to the Formed Son. Then the cloud, and the Father''s voice: *This is my beloved Son, in whom I am well pleased; hear ye him* (Matthew 17:5). Hear every word of that. *Thou art my Son; this day have I begotten thee* (Psalm 2:7) — it is the FATHER who speaks, declaring the begotten One; this is not a second deity announcing itself, but the source naming the Son. *Behold my servant, whom I uphold; mine elect, in whom my soul delighteth; I have put my spirit upon him* (Isaiah 42:1) — *in whom I am well pleased* is the Father''s delight in His chosen Servant. And *hear ye him* is no new commandment: it is Moses'' own promise come true — *Yahuah Elohayka (The LORD thy God) will raise up unto thee a Prophet from the midst of thee, of thy brethren, like unto me; unto him ye shall hearken* (Deuteronomy 18:15), *and will put my words in his mouth; and he shall speak unto them all that I shall command him* (Deuteronomy 18:18). The Father is declaring His Son to be the Prophet like Moses, whose mouth carries the Father''s words. The raiment itself is throne-glory: *the Ancient of days did sit, whose garment was white as snow* (Daniel 7:9). Moses and Elijah fade — *they saw no man, save Yahusha (Jesus) only* (Matthew 17:8) — the Torah and the Prophets having done their work of pointing to Him.',
       sv.verse_id, ev.verse_id, 'free', 11480
  FROM _mt17_lookup sv, _mt17_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=17 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=17 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-17-elias-is-come-already-restore-all-things-malachi-4-sirach-48',
       E'Elias is come already — restore all things, the turning of hearts (Malachi 4; Sirach 48)',
       E'Coming down the mountain the disciples ask, *Why then say the scribes that Elias must first come?* (Matthew 17:10), and Yahusha answers, *Elias truly shall first come, and restore all things... But I say unto you, That Elias is come already* (Matthew 17:11-12) — *the disciples understood that he spake unto them of John the Baptist* (Matthew 17:13). The scribes were not wrong; they read Malachi rightly: *Behold, I will send you Elijah the prophet before the coming of the great and dreadful day of Yahuah (LORD)* (Malachi 4:5). And what is the restoring work? *And he shall turn the heart of the fathers to the children, and the heart of the children to their fathers, lest I come and smite the earth with a curse* (Malachi 4:6) — a turning of hearts, a gathering home. The second-Temple fathers read this gathering as the restoration of the scattered tribes: Sirach blesses Elijah, *Who were ordained for reproofs in their times, to pacify the wrath of the judgment of Yahuah (God)... and to turn the heart of the father to the son, and to restore the tribes of Jacob* (Sirach 48:10). There it is — *restore the tribes of Jacob* — the two-house hope, Judah and the scattered house of Yashar''el turned back together. John came in that Elijah-spirit to begin the turning; the full restoration still presses on toward the great day.',
       sv.verse_id, ev.verse_id, 'extras', 11483
  FROM _mt17_lookup sv, _mt17_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=17 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=17 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-17-faith-as-a-grain-of-mustard-seed-remove-this-mountain-zechariah-4-isaiah-40',
       E'Faith as a grain of mustard seed — remove hence to yonder place (Zechariah 4; Isaiah 40; Psalm 50)',
       E'The disciples could not cure the lunatick son, and Yahusha names the lack: *Because of your unbelief: for verily I say unto you, If ye have faith as a grain of mustard seed, ye shall say unto this mountain, Remove hence to yonder place; and it shall remove; and nothing shall be impossible unto you* (Matthew 17:20). The figure is Zechariah''s. There the great obstacle before Zerubbabel is levelled not by human strength but by the Spirit: *Not by might, nor by power, but by my spirit, saith Yahuah Tseva''ot (LORD of hosts)* (Zechariah 4:6) — *Who art thou, O great mountain? before Zerubbabel thou shalt become a plain* (Zechariah 4:7). The mountain becomes a plain. So the mustard-seed faith is not a quantity of willpower but trust leaning wholly on Yahuah — *they that wait upon Yahuah (LORD) shall renew their strength; they shall mount up with wings as eagles; they shall run, and not be weary* (Isaiah 40:31). And the father in the crowd had already shown the way of that faith, the cry of trouble: *call upon me in the day of trouble: I will deliver thee, and thou shalt glorify me* (Psalm 50:15) — which is why Yahusha adds, *this kind goeth not out but by prayer and fasting* (Matthew 17:21). Faith that moves mountains is faith that waits on, and calls upon, the One to whom nothing is impossible.',
       sv.verse_id, ev.verse_id, 'free', 11486
  FROM _mt17_lookup sv, _mt17_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=17 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=17 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-17-tribute-money-the-children-are-free-half-shekel-exodus-30-psalm-24',
       E'The tribute money and the fish — the children are free, yet He yields (Exodus 30; Exodus 19; Psalm 24)',
       E'At Capernaum the collectors ask, *Doth not your master pay tribute?* (Matthew 17:24). This *tribute money* is the sanctuary half-shekel of the Torah: *This they shall give, every one that passeth among them that are numbered, half a shekel after the shekel of the sanctuary... an half shekel shall be the offering of Yahuah (LORD)* (Exodus 30:13), the ransom *Every one that passeth among them that are numbered, from twenty years old and above, shall give an offering unto Yahuah (LORD)* (Exodus 30:14). It is rendered to Yahuah''s own house. So Yahusha presses the point gently: *of whom do the kings of the earth take custom or tribute? of their own children, or of strangers?... Then are the children free* (Matthew 17:25-26). The Son of the King is free in His own Father''s house — for *the earth is Yahuah''s, and the fulness thereof; the world, and they that dwell therein* (Psalm 24:1); the very fish in the sea is His. And yet, *lest we should offend them* (Matthew 17:27), He sends Peter to take the coin from the fish''s mouth and pay for both. The free Son stoops to yield — the One to whom *all the earth is mine* (Exodus 19:5) declares, taking on the dues of the very sanctuary He owns.',
       sv.verse_id, ev.verse_id, 'free', 11489
  FROM _mt17_lookup sv, _mt17_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=17 AND sv.verse_number=22
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=17 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

-- ---- 3d. thread_members ----------------------------------------------------
-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 34:29 — *Moses wist not that the skin of his face shone while he talked with him.* Moses'' borrowed glory; here the glory is the Son''s own.'
  FROM cross_reference_threads t, cross_references x, _mt17_lookup sv, _mt17_lookup tv
 WHERE t.slug='matthew-17-transfiguration-this-is-my-beloved-son-hear-ye-him-exodus-34-deuteronomy-18-malachi-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=17 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=34 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 34:30 — *the skin of his face shone; and they were afraid to come nigh him.* The fear of the shining face returns: *they fell on their face, and were sore afraid.*'
  FROM cross_reference_threads t, cross_references x, _mt17_lookup sv, _mt17_lookup tv
 WHERE t.slug='matthew-17-transfiguration-this-is-my-beloved-son-hear-ye-him-exodus-34-deuteronomy-18-malachi-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=17 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=34 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 7:9 — *the Ancient of days did sit, whose garment was white as snow.* The raiment white as the light is heaven''s throne-glory shining through the Son.'
  FROM cross_reference_threads t, cross_references x, _mt17_lookup sv, _mt17_lookup tv
 WHERE t.slug='matthew-17-transfiguration-this-is-my-beloved-son-hear-ye-him-exodus-34-deuteronomy-18-malachi-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=17 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Malachi 4:4 — *Remember ye the law of Moses my servant... in Horeb for all Yashar''el (Israel).* Moses on the mount = the Torah standing witness to the Son.'
  FROM cross_reference_threads t, cross_references x, _mt17_lookup sv, _mt17_lookup tv
 WHERE t.slug='matthew-17-transfiguration-this-is-my-beloved-son-hear-ye-him-exodus-34-deuteronomy-18-malachi-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=17 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Malachi 4:5 — *Behold, I will send you Elijah the prophet.* Malachi names Moses AND Elijah together — the law and the prophets — and both appear talking with Him.'
  FROM cross_reference_threads t, cross_references x, _mt17_lookup sv, _mt17_lookup tv
 WHERE t.slug='matthew-17-transfiguration-this-is-my-beloved-son-hear-ye-him-exodus-34-deuteronomy-18-malachi-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=17 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=4 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Deuteronomy 18:15 — *a Prophet from the midst of thee... like unto me; unto him ye shall hearken.* The Father''s "hear ye him" is Moses'' own promise fulfilled.'
  FROM cross_reference_threads t, cross_references x, _mt17_lookup sv, _mt17_lookup tv
 WHERE t.slug='matthew-17-transfiguration-this-is-my-beloved-son-hear-ye-him-exodus-34-deuteronomy-18-malachi-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=17 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=18 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Deuteronomy 18:18 — *will put my words in his mouth; and he shall speak unto them all that I shall command him.* The words in His mouth are the Father''s words — hear ye Him.'
  FROM cross_reference_threads t, cross_references x, _mt17_lookup sv, _mt17_lookup tv
 WHERE t.slug='matthew-17-transfiguration-this-is-my-beloved-son-hear-ye-him-exodus-34-deuteronomy-18-malachi-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=17 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=18 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 8, E'Psalm 2:7 — *Yahuah (LORD) hath said unto me, Thou art my Son; this day have I begotten thee.* The voice from the cloud is the FATHER declaring the begotten Son — not a second deity speaking of itself.'
  FROM cross_reference_threads t, cross_references x, _mt17_lookup sv, _mt17_lookup tv
 WHERE t.slug='matthew-17-transfiguration-this-is-my-beloved-son-hear-ye-him-exodus-34-deuteronomy-18-malachi-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=17 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 9, E'Isaiah 42:1 — *Behold my servant, whom I uphold; mine elect, in whom my soul delighteth.* "In whom I am well pleased" echoes the Father''s delight in His chosen Servant.'
  FROM cross_reference_threads t, cross_references x, _mt17_lookup sv, _mt17_lookup tv
 WHERE t.slug='matthew-17-transfiguration-this-is-my-beloved-son-hear-ye-him-exodus-34-deuteronomy-18-malachi-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=17 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=42 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Malachi 4:5 — *Behold, I will send you Elijah the prophet before the coming of the great and dreadful day of Yahuah (LORD).* The scribes read it rightly; Elias must first come.'
  FROM cross_reference_threads t, cross_references x, _mt17_lookup sv, _mt17_lookup tv
 WHERE t.slug='matthew-17-elias-is-come-already-restore-all-things-malachi-4-sirach-48'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=17 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=4 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Malachi 4:6 — *he shall turn the heart of the fathers to the children, and the heart of the children to their fathers.* The restoring work = the turning of hearts, the gathering home.'
  FROM cross_reference_threads t, cross_references x, _mt17_lookup sv, _mt17_lookup tv
 WHERE t.slug='matthew-17-elias-is-come-already-restore-all-things-malachi-4-sirach-48'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=17 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=4 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Sirach 48:10 — *to turn the heart of the father to the son, and to restore the tribes of Jacob.* The second-Temple witness: Elijah''s return restores the scattered tribes — the two-house gathering.'
  FROM cross_reference_threads t, cross_references x, _mt17_lookup sv, _mt17_lookup tv
 WHERE t.slug='matthew-17-elias-is-come-already-restore-all-things-malachi-4-sirach-48'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=17 AND sv.verse_number=11
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=48 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Zechariah 4:6 — *Not by might, nor by power, but by my spirit, saith Yahuah Tseva''ot (LORD of hosts).* The mountain is moved by trusting the Spirit, not the strength of man.'
  FROM cross_reference_threads t, cross_references x, _mt17_lookup sv, _mt17_lookup tv
 WHERE t.slug='matthew-17-faith-as-a-grain-of-mustard-seed-remove-this-mountain-zechariah-4-isaiah-40'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=17 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=4 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Zechariah 4:7 — *Who art thou, O great mountain? before Zerubbabel thou shalt become a plain.* The very figure Yahusha takes up: the mountain made a plain before faith.'
  FROM cross_reference_threads t, cross_references x, _mt17_lookup sv, _mt17_lookup tv
 WHERE t.slug='matthew-17-faith-as-a-grain-of-mustard-seed-remove-this-mountain-zechariah-4-isaiah-40'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=17 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=4 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 40:31 — *they that wait upon Yahuah (LORD) shall renew their strength; they shall mount up with wings as eagles.* Mustard-seed faith = waiting on Yahuah, not the disciples'' own power.'
  FROM cross_reference_threads t, cross_references x, _mt17_lookup sv, _mt17_lookup tv
 WHERE t.slug='matthew-17-faith-as-a-grain-of-mustard-seed-remove-this-mountain-zechariah-4-isaiah-40'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=17 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=40 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 50:15 — *call upon me in the day of trouble: I will deliver thee.* The father cried "have mercy on my son"; deliverance answers the cry — "by prayer and fasting."'
  FROM cross_reference_threads t, cross_references x, _mt17_lookup sv, _mt17_lookup tv
 WHERE t.slug='matthew-17-faith-as-a-grain-of-mustard-seed-remove-this-mountain-zechariah-4-isaiah-40'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=17 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=50 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 30:13 — *half a shekel after the shekel of the sanctuary... an half shekel shall be the offering of Yahuah (LORD).* The tribute money is the sanctuary half-shekel, the ransom of the soul.'
  FROM cross_reference_threads t, cross_references x, _mt17_lookup sv, _mt17_lookup tv
 WHERE t.slug='matthew-17-tribute-money-the-children-are-free-half-shekel-exodus-30-psalm-24'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=17 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=30 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 30:14 — *from twenty years old and above, shall give an offering unto Yahuah (LORD).* The offering is rendered to Yahuah''s house — and the Son of that house yet yields.'
  FROM cross_reference_threads t, cross_references x, _mt17_lookup sv, _mt17_lookup tv
 WHERE t.slug='matthew-17-tribute-money-the-children-are-free-half-shekel-exodus-30-psalm-24'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=17 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=30 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 24:1 — *The earth is Yahuah''s, and the fulness thereof.* The kings take tribute of strangers, not their own children; the Son is free, for all the earth — and the fish — is His Father''s.'
  FROM cross_reference_threads t, cross_references x, _mt17_lookup sv, _mt17_lookup tv
 WHERE t.slug='matthew-17-tribute-money-the-children-are-free-half-shekel-exodus-30-psalm-24'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=17 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=24 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Exodus 19:5 — *ye shall be a peculiar treasure unto me above all people: for all the earth is mine.* The One who owns all the earth stoops to render the dues of the sanctuary He owns, lest He offend.'
  FROM cross_reference_threads t, cross_references x, _mt17_lookup sv, _mt17_lookup tv
 WHERE t.slug='matthew-17-tribute-money-the-children-are-free-half-shekel-exodus-30-psalm-24'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=17 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=19 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
