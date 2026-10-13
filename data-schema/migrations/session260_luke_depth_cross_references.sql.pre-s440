-- =====================================================================
-- Session 260 — Luke (depth) FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py /tmp/nt-depth-wt/data-schema/migrations/session260_luke_depth_cross_references.sql
-- =====================================================================

\echo 'session260 — Luke (depth) cross-references starting...'
BEGIN;

-- ----- fragment: minion_luke_05.sql -----
-- Luke 5 — full-library Come-and-See cross-reference threads (NT DEPTH pass)
-- EMPTY/greenfield. 5 threads. Band base 14120, step +3.

-- ============================================================
-- 3a. Temp view
-- ============================================================
CREATE TEMP VIEW _lk05_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1',
   'pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================================================
-- 3b. cross_references rows
-- ============================================================
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- THREAD 1: draught of fishes (5:1-11)
  ('canon','luke',5,8,'canon','isaiah',6,5, 'free', E'*Then said I, Woe is me! for I am undone; because I am a man of unclean lips, and I dwell in the midst of a people of unclean lips: for mine eyes have seen the King, Yahuah Tseva''ot (LORD of hosts).* (Isaiah 6:5). Peter falls and cries *Depart from me; for I am a sinful man* (Luke 5:8) — the very undoing of Isaiah before the throne. The unworthy man, seeing the King, is not cast off but commissioned.'),
  ('canon','luke',5,10,'canon','jeremiah',16,16, 'free', E'*Behold, I will send for many fishers, saith Yahuah (LORD), and they shall fish them; and after will I send for many hunters, and they shall hunt them from every mountain, and from every hill, and out of the holes of the rocks.* (Jeremiah 16:16). *From henceforth thou shalt catch men* (Luke 5:10) — the fishers Yahuah promised, sent now to gather the scattered seed home.'),
  ('canon','luke',5,6,'canon','ezekiel',47,9, 'free', E'*And it shall come to pass, that every thing that liveth, which moveth, whithersoever the rivers shall come, shall live: and there shall be a very great multitude of fish, because these waters shall come thither: for they shall be healed; and every thing shall live whither the river cometh.* (Ezekiel 47:9). The net enclosing *a great multitude of fishes* (Luke 5:6) images the living waters of the sanctuary, where life teems wherever the river of Yahuah reaches.'),
  ('canon','luke',5,10,'canon','ezekiel',47,10, 'free', E'*And it shall come to pass, that the fishers shall stand upon it from En-gedi even unto En-eglaim; they shall be a place to spread forth nets; their fish shall be according to their kinds, as the fish of the great sea, exceeding many.* (Ezekiel 47:10). The fishers stand at the healed waters spreading their nets — and *from henceforth thou shalt catch men* (Luke 5:10) sets these fishers to that very work.'),

  -- THREAD 2: the leper sent to the priest (5:12-16)
  ('canon','luke',5,12,'canon','leviticus',13,45, 'free', E'*And the leper in whom the plague is, his clothes shall be rent, and his head bare, and he shall put a covering upon his upper lip, and shall cry, Unclean, unclean.* (Leviticus 13:45). *A man full of leprosy* (Luke 5:12) — the outcast Torah named, who must cry his own uncleanness.'),
  ('canon','luke',5,12,'canon','leviticus',13,46, 'free', E'*All the days wherein the plague shall be in him he shall be defiled; he is unclean: he shall dwell alone; without the camp shall his habitation be.* (Leviticus 13:46). The leper dwelt alone, outside the camp; the one who touched him *(I will: be thou clean)* (Luke 5:13) reaches into that exile.'),
  ('canon','luke',5,14,'canon','leviticus',14,2, 'free', E'*This shall be the law of the leper in the day of his cleansing: He shall be brought unto the priest:* (Leviticus 14:2). *Go, and shew thyself to the priest, and offer for thy cleansing, according as Moses commanded* (Luke 5:14) — Yahusha SENDS the cleansed man to keep the law of the leper. The Torah is upheld, not abolished.'),
  ('canon','luke',5,14,'canon','leviticus',14,4, 'free', E'*Then shall the priest command to take for him that is to be cleansed two birds alive and clean, and cedar wood, and scarlet, and hyssop:* (Leviticus 14:4). The offering *according as Moses commanded* (Luke 5:14) is this very rite — kept *for a testimony unto them.*'),
  ('canon','luke',5,13,'canon','2-kings',5,14, 'free', E'*Then went he down, and dipped himself seven times in Jordan, according to the saying of the man of Elohim (God): and his flesh came again like unto the flesh of a little child, and he was clean.* (2 Kings 5:14). Naaman the leper made clean through the prophet''s word foreshadows the leper made clean here by the Word himself: *immediately the leprosy departed from him* (Luke 5:13).'),

  -- THREAD 3: palsy forgiven — the Fathers prerogative in the Formed Son (5:17-26)
  ('canon','luke',5,21,'canon','isaiah',43,25, 'free', E'*I, even I, am he that blotteth out thy transgressions for mine own sake, and will not remember thy sins.* (Isaiah 43:25). The scribes ask *Who can forgive sins, but Elohim (God) alone?* (Luke 5:21) — and the answer stands: it is Yahuah''s own prerogative to blot out sins. That prerogative is now exercised in the Formed Son.'),
  ('canon','luke',5,20,'canon','psalms',103,3, 'free', E'*Who forgiveth all thine iniquities; who healeth all thy diseases;* (Psalm 103:3). Forgiving and healing are one work of one hand — *thy sins are forgiven thee* (Luke 5:20) joined to *Arise, and take up thy couch* (Luke 5:24).'),
  ('canon','luke',5,21,'canon','micah',7,18, 'free', E'*Who is a Elohim (God) like unto thee, that pardoneth iniquity, and passeth by the transgression of the remnant of his heritage? he retaineth not his anger for ever, because he delighteth in mercy.* (Micah 7:18). The pardoning that belongs to Elohim alone is the very thing done before their eyes.'),
  ('canon','luke',5,24,'canon','daniel',7,13, 'free', E'*I saw in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him.* (Daniel 7:13). *The Son of Adam hath power upon earth to forgive sins* (Luke 5:24) — the one like the Son of Adam, brought near before the Father, wields on earth the authority given him from the Ancient of days.'),

  -- THREAD 4: call of Levi — mercy, the weightier matter (5:27-32)
  ('canon','luke',5,32,'canon','hosea',6,6, 'free', E'*For I desired mercy, and not sacrifice; and the knowledge of Elohim (God) more than burnt offerings.* (Hosea 6:6). *I came not to call the righteous, but sinners to repentance* (Luke 5:32) — the physician eats with publicans because mercy, not the appearance of sacrifice, is what Yahuah desired all along.'),
  ('canon','luke',5,31,'canon','ezekiel',34,16, 'free', E'*I will seek that which was lost, and bring again that which was driven away, and will bind up that which was broken, and will strengthen that which was sick: but I will destroy the fat and the strong; I will feed them with judgment.* (Ezekiel 34:16). The Shepherd who seeks the lost and binds the broken is the physician who comes for *they that are sick* (Luke 5:31), not the self-satisfied whole.'),
  ('canon','luke',5,32,'canon','psalms',51,17, 'free', E'*The sacrifices of Elohim (God) are a broken spirit: a broken and a contrite heart, O Elohim (God), thou wilt not despise.* (Psalm 51:17). The repentance Yahusha calls sinners to (Luke 5:32) is this very offering — the contrite heart Yahuah will not despise.'),
  ('canon','luke',5,32,'apocrypha','ecclesiasticus',2,11, 'extras', E'*For Yahuah (God) is full of compassion and mercy, longsuffering, and very pitiful, and forgiveth sins, and saves in time of affliction.* (Sirach 2:11). The same library, in its wisdom-voice, knows the One who forgives sins and calls sinners to repentance (Luke 5:32) is full of compassion and mercy.'),
  ('canon','luke',5,31,'apocrypha','ecclesiasticus',38,9, 'extras', E'*My son, in your sickness be not negligent: but pray to Yahuah (God), and he will make you whole.* (Sirach 38:9). *They that are sick* (Luke 5:31) need the physician — and the wisdom-voice already taught the sick to turn to Yahuah, who makes whole.'),

  -- THREAD 5: bridegroom, new wine — renewal not replacement (5:33-39)
  ('canon','luke',5,34,'canon','joel',2,16, 'free', E'*Gather the people, sanctify the congregation, assemble the elders, gather the children, and those that suck the breasts: let the bridegroom go forth of his chamber, and the bride out of her closet.* (Joel 2:16). *Can ye make the children of the bridechamber fast, while the bridegroom is with them?* (Luke 5:34) — the bridegroom has gone forth; this is the day of joy, not of mourning.'),
  ('canon','luke',5,34,'canon','isaiah',62,5, 'free', E'*For as a young man marrieth a virgin, so shall thy sons marry thee: and as the bridegroom rejoiceth over the bride, so shall thy Elohim (God) rejoice over thee.* (Isaiah 62:5). The bridegroom is no stranger to the prophets: Yahuah rejoices over his people as a bridegroom over the bride — and that bridegroom is present (Luke 5:34).'),
  ('canon','luke',5,37,'canon','jeremiah',31,31, 'free', E'*Behold, the days come, saith Yahuah (LORD), that I will make a new covenant with the house of Yashar''el (Israel), and with the house of Yahudah (Judah):* (Jeremiah 31:31). The *new wine* and *new bottles* (Luke 5:37-38) are the renewed covenant promised to both houses — Yashar''el and Yahudah gathered as one.'),
  ('canon','luke',5,38,'canon','jeremiah',31,33, 'free', E'*But this shall be the covenant that I will make with the house of Yashar''el (Israel); After those days, saith Yahuah (LORD), I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people.* (Jeremiah 31:33). The renewed covenant is the SAME law, now written within. The new wine is the old covenant''s heart restored — renewal, never replacement of the Torah.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _lk05_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _lk05_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================================================
-- 3c. Threads
-- ============================================================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required)
SELECT 'luke-5-launch-out-into-the-deep-the-great-draught-of-fishes-isaiah-6-jeremiah-16-ezekiel-47',
       E'Launch out into the deep — the great draught of fishes (Isaiah 6; Jeremiah 16; Ezekiel 47)',
       E'At Yahusha''s (Jesus'') word the empty nets fill: *they inclosed a great multitude of fishes: and their net brake* (Luke 5:6). Simon Peter falls down and cries *Depart from me; for I am a sinful man, O Yahuah (Lord)* (Luke 5:8) — the same undoing Isaiah knew before the throne: *Woe is me! for I am undone; because I am a man of unclean lips... for mine eyes have seen the King, Yahuah Tseva''ot (LORD of hosts)* (Isaiah 6:5). The unworthy man who sees the King is not cast off but sent. *Fear not; from henceforth thou shalt catch men* (Luke 5:10) — these are the fishers Yahuah had long promised: *Behold, I will send for many fishers, saith Yahuah (LORD), and they shall fish them* (Jeremiah 16:16), gatherers of the scattered seed of Yashar''el out of every land. And the teeming net answers the sanctuary vision: *there shall be a very great multitude of fish, because these waters shall come thither: for they shall be healed; and every thing shall live whither the river cometh* (Ezekiel 47:9), where *the fishers shall stand... they shall be a place to spread forth nets* (Ezekiel 47:10). The catch is the gathering of men; the fishers are the sent.',
       sv.verse_id, ev.verse_id, 'free'
  FROM _lk05_lookup sv, _lk05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=5 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='luke' AND ev.chapter_number=5 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required)
SELECT 'luke-5-shew-thyself-to-the-priest-as-moses-commanded-leviticus-13-14-2-kings-5',
       E'Shew thyself to the priest — as Moses commanded (Leviticus 13-14; 2 Kings 5)',
       E'*A man full of leprosy* (Luke 5:12) is the outcast Torah named — *his clothes shall be rent, and his head bare... and shall cry, Unclean, unclean* (Leviticus 13:45), who *shall dwell alone; without the camp shall his habitation be* (Leviticus 13:46). Into that exile the Word reaches: *I will: be thou clean. And immediately the leprosy departed from him* (Luke 5:13) — as Naaman''s flesh *came again like unto the flesh of a little child, and he was clean* (2 Kings 5:14) at the prophet''s word, so now at the Word himself. Then mark what Yahusha does NOT do: he does not declare the law obsolete. He SENDS the man to keep it. *Go, and shew thyself to the priest, and offer for thy cleansing, according as Moses commanded, for a testimony unto them* (Luke 5:14) — *This shall be the law of the leper in the day of his cleansing: He shall be brought unto the priest* (Leviticus 14:2), who *command[s] to take for him that is to be cleansed two birds alive and clean, and cedar wood, and scarlet, and hyssop* (Leviticus 14:4). The Healer upholds the very Torah he gave. Grace is no license; the commandment stands, kept for a testimony.',
       sv.verse_id, ev.verse_id, 'free'
  FROM _lk05_lookup sv, _lk05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=5 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='luke' AND ev.chapter_number=5 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required)
SELECT 'luke-5-the-son-of-adam-hath-power-to-forgive-sins-isaiah-43-psalm-103-daniel-7',
       E'The Son of Adam hath power to forgive sins (Isaiah 43; Psalm 103; Micah 7; Daniel 7)',
       E'The palsied man is let down through the tiling, and Yahusha says *Man, thy sins are forgiven thee* (Luke 5:20). The scribes reason rightly from the Torah: *Who can forgive sins, but Elohim (God) alone?* (Luke 5:21) — for Yahuah said *I, even I, am he that blotteth out thy transgressions for mine own sake, and will not remember thy sins* (Isaiah 43:25), and *Who is a Elohim (God) like unto thee, that pardoneth iniquity... because he delighteth in mercy* (Micah 7:18). Forgiving and healing are one hand''s work: *Who forgiveth all thine iniquities; who healeth all thy diseases* (Psalm 103:3) — so *thy sins are forgiven thee* and *Arise, and take up thy couch* are spoken as one. And the title Yahusha takes is the prophet''s: *that ye may know that the Son of Adam hath power upon earth to forgive sins* (Luke 5:24). Daniel saw him — *one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him* (Daniel 7:13). The Formed Son, brought near before the Father, wields on earth the Father''s own prerogative to pardon. He does not seize it; it is given him from the Ancient of days.',
       sv.verse_id, ev.verse_id, 'free'
  FROM _lk05_lookup sv, _lk05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=5 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='luke' AND ev.chapter_number=5 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required)
SELECT 'luke-5-i-came-not-to-call-the-righteous-but-sinners-hosea-6-ezekiel-34-psalm-51',
       E'I came not to call the righteous, but sinners to repentance (Hosea 6; Ezekiel 34; Psalm 51; Sirach)',
       E'Levi the publican rises from the receipt of custom at one word — *Follow me* (Luke 5:27) — and the scribes murmur, *Why do ye eat and drink with publicans and sinners?* (Luke 5:30). Yahusha answers: *They that are whole need not a physician; but they that are sick. I came not to call the righteous, but sinners to repentance* (Luke 5:31-32). This is the weightier matter of Torah that Yahuah named through Hosea: *For I desired mercy, and not sacrifice; and the knowledge of Elohim (God) more than burnt offerings* (Hosea 6:6). He is the Shepherd of the prophets: *I will seek that which was lost, and bring again that which was driven away, and will bind up that which was broken, and will strengthen that which was sick* (Ezekiel 34:16). The repentance he calls for is the offering Yahuah never despises: *The sacrifices of Elohim (God) are a broken spirit: a broken and a contrite heart, O Elohim (God), thou wilt not despise* (Psalm 51:17). Even the wisdom-voice of the library knew this One: *Yahuah (God) is full of compassion and mercy, longsuffering, and very pitiful, and forgiveth sins, and saves in time of affliction* (Sirach 2:11); and it had taught the sick where to turn — *in your sickness be not negligent: but pray to Yahuah (God), and he will make you whole* (Sirach 38:9). The physician comes for the sick. That is mercy, and mercy is what Yahuah desired.',
       sv.verse_id, ev.verse_id, 'extras'
  FROM _lk05_lookup sv, _lk05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=5 AND sv.verse_number=27
   AND ev.edition_slug='canon' AND ev.book_slug='luke' AND ev.chapter_number=5 AND ev.verse_number=32
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required)
SELECT 'luke-5-the-bridegroom-and-the-new-wine-joel-2-isaiah-62-jeremiah-31',
       E'The bridegroom and the new wine — renewal, not replacement (Joel 2; Isaiah 62; Jeremiah 31)',
       E'Asked why his disciples do not fast, Yahusha answers: *Can ye make the children of the bridechamber fast, while the bridegroom is with them?* (Luke 5:34). The bridegroom is no new figure — the prophets long awaited him: *let the bridegroom go forth of his chamber, and the bride out of her closet* (Joel 2:16), for *as the bridegroom rejoiceth over the bride, so shall thy Elohim (God) rejoice over thee* (Isaiah 62:5). His presence is the day of joy. Then the parable: *no man putteth new wine into old bottles... But new wine must be put into new bottles; and both are preserved* (Luke 5:37-38). This is not the discarding of the old covenant — it is its renewal: *Behold, the days come, saith Yahuah (LORD), that I will make a new covenant with the house of Yashar''el (Israel), and with the house of Yahudah (Judah)* (Jeremiah 31:31), and that covenant is the SAME Torah brought inside — *I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people* (Jeremiah 31:33). The new wine is the old covenant''s heart restored, both houses gathered as one. Renewal, never replacement; the law is not abolished but written within.',
       sv.verse_id, ev.verse_id, 'free'
  FROM _lk05_lookup sv, _lk05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=5 AND sv.verse_number=33
   AND ev.edition_slug='canon' AND ev.book_slug='luke' AND ev.chapter_number=5 AND ev.verse_number=39
ON CONFLICT (slug) DO NOTHING;

-- ============================================================
-- 3d. Thread members
-- ============================================================
-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 6:5 — *Woe is me! for I am undone; because I am a man of unclean lips... for mine eyes have seen the King, Yahuah Tseva''ot (LORD of hosts).* Peter''s *I am a sinful man* (Luke 5:8) is Isaiah''s undoing before the throne — the unworthy man sent.'
  FROM cross_reference_threads t, cross_references x, _lk05_lookup sv, _lk05_lookup tv
 WHERE t.slug='luke-5-launch-out-into-the-deep-the-great-draught-of-fishes-isaiah-6-jeremiah-16-ezekiel-47'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=5 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=6 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 16:16 — *Behold, I will send for many fishers, saith Yahuah (LORD), and they shall fish them.* *From henceforth thou shalt catch men* (Luke 5:10) — the promised fishers, sent to gather scattered Yashar''el home.'
  FROM cross_reference_threads t, cross_references x, _lk05_lookup sv, _lk05_lookup tv
 WHERE t.slug='luke-5-launch-out-into-the-deep-the-great-draught-of-fishes-isaiah-6-jeremiah-16-ezekiel-47'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=5 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=16 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 47:9 — *there shall be a very great multitude of fish, because these waters shall come thither: for they shall be healed; and every thing shall live whither the river cometh.* The net''s *great multitude of fishes* (Luke 5:6) images the living waters of the sanctuary.'
  FROM cross_reference_threads t, cross_references x, _lk05_lookup sv, _lk05_lookup tv
 WHERE t.slug='luke-5-launch-out-into-the-deep-the-great-draught-of-fishes-isaiah-6-jeremiah-16-ezekiel-47'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=5 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=47 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ezekiel 47:10 — *the fishers shall stand upon it... they shall be a place to spread forth nets.* The fishers stand at the healed waters — and *thou shalt catch men* (Luke 5:10) sets these fishers to that work.'
  FROM cross_reference_threads t, cross_references x, _lk05_lookup sv, _lk05_lookup tv
 WHERE t.slug='luke-5-launch-out-into-the-deep-the-great-draught-of-fishes-isaiah-6-jeremiah-16-ezekiel-47'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=5 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=47 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 13:45 — *the leper... his clothes shall be rent, and his head bare... and shall cry, Unclean, unclean.* The *man full of leprosy* (Luke 5:12) is the outcast Torah named.'
  FROM cross_reference_threads t, cross_references x, _lk05_lookup sv, _lk05_lookup tv
 WHERE t.slug='luke-5-shew-thyself-to-the-priest-as-moses-commanded-leviticus-13-14-2-kings-5'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=5 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=13 AND tv.verse_number=45
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 13:46 — *he shall dwell alone; without the camp shall his habitation be.* The Word reaches into that exile: *I will: be thou clean* (Luke 5:13).'
  FROM cross_reference_threads t, cross_references x, _lk05_lookup sv, _lk05_lookup tv
 WHERE t.slug='luke-5-shew-thyself-to-the-priest-as-moses-commanded-leviticus-13-14-2-kings-5'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=5 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=13 AND tv.verse_number=46
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 14:2 — *This shall be the law of the leper in the day of his cleansing: He shall be brought unto the priest.* Yahusha SENDS the cleansed man to keep it — *according as Moses commanded* (Luke 5:14). The Torah upheld, not abolished.'
  FROM cross_reference_threads t, cross_references x, _lk05_lookup sv, _lk05_lookup tv
 WHERE t.slug='luke-5-shew-thyself-to-the-priest-as-moses-commanded-leviticus-13-14-2-kings-5'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=5 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=14 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Leviticus 14:4 — *Then shall the priest command to take for him that is to be cleansed two birds alive and clean, and cedar wood, and scarlet, and hyssop.* The offering *as Moses commanded* (Luke 5:14) is this very rite, *for a testimony unto them.*'
  FROM cross_reference_threads t, cross_references x, _lk05_lookup sv, _lk05_lookup tv
 WHERE t.slug='luke-5-shew-thyself-to-the-priest-as-moses-commanded-leviticus-13-14-2-kings-5'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=5 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=14 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'2 Kings 5:14 — *his flesh came again like unto the flesh of a little child, and he was clean.* Naaman cleansed at the prophet''s word foreshadows the leper cleansed by the Word himself: *immediately the leprosy departed from him* (Luke 5:13).'
  FROM cross_reference_threads t, cross_references x, _lk05_lookup sv, _lk05_lookup tv
 WHERE t.slug='luke-5-shew-thyself-to-the-priest-as-moses-commanded-leviticus-13-14-2-kings-5'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=5 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=5 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 43:25 — *I, even I, am he that blotteth out thy transgressions for mine own sake, and will not remember thy sins.* The scribes ask *Who can forgive sins, but Elohim alone?* (Luke 5:21) — and Yahuah''s own prerogative is now exercised in the Formed Son.'
  FROM cross_reference_threads t, cross_references x, _lk05_lookup sv, _lk05_lookup tv
 WHERE t.slug='luke-5-the-son-of-adam-hath-power-to-forgive-sins-isaiah-43-psalm-103-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=5 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=43 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 103:3 — *Who forgiveth all thine iniquities; who healeth all thy diseases.* Forgiving and healing are one hand''s work — *thy sins are forgiven* joined to *Arise, and take up thy couch* (Luke 5:20,24).'
  FROM cross_reference_threads t, cross_references x, _lk05_lookup sv, _lk05_lookup tv
 WHERE t.slug='luke-5-the-son-of-adam-hath-power-to-forgive-sins-isaiah-43-psalm-103-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=5 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=103 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Micah 7:18 — *Who is a Elohim (God) like unto thee, that pardoneth iniquity... because he delighteth in mercy.* The pardoning that belongs to Elohim alone (Luke 5:21) is done before their eyes.'
  FROM cross_reference_threads t, cross_references x, _lk05_lookup sv, _lk05_lookup tv
 WHERE t.slug='luke-5-the-son-of-adam-hath-power-to-forgive-sins-isaiah-43-psalm-103-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=5 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=7 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Daniel 7:13 — *one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him.* *The Son of Adam hath power upon earth to forgive sins* (Luke 5:24) — the Formed Son, brought near before the Father, wields the authority given him from the Ancient of days.'
  FROM cross_reference_threads t, cross_references x, _lk05_lookup sv, _lk05_lookup tv
 WHERE t.slug='luke-5-the-son-of-adam-hath-power-to-forgive-sins-isaiah-43-psalm-103-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=5 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hosea 6:6 — *For I desired mercy, and not sacrifice; and the knowledge of Elohim (God) more than burnt offerings.* *I came not to call the righteous, but sinners to repentance* (Luke 5:32) — mercy, the weightier matter, is what Yahuah desired all along.'
  FROM cross_reference_threads t, cross_references x, _lk05_lookup sv, _lk05_lookup tv
 WHERE t.slug='luke-5-i-came-not-to-call-the-righteous-but-sinners-hosea-6-ezekiel-34-psalm-51'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=5 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=6 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 34:16 — *I will seek that which was lost... and will strengthen that which was sick.* The Shepherd who seeks the lost is the physician who comes for *they that are sick* (Luke 5:31).'
  FROM cross_reference_threads t, cross_references x, _lk05_lookup sv, _lk05_lookup tv
 WHERE t.slug='luke-5-i-came-not-to-call-the-righteous-but-sinners-hosea-6-ezekiel-34-psalm-51'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=5 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=34 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 51:17 — *The sacrifices of Elohim (God) are a broken spirit: a broken and a contrite heart, O Elohim (God), thou wilt not despise.* The repentance Yahusha calls for (Luke 5:32) is this offering Yahuah will not despise.'
  FROM cross_reference_threads t, cross_references x, _lk05_lookup sv, _lk05_lookup tv
 WHERE t.slug='luke-5-i-came-not-to-call-the-righteous-but-sinners-hosea-6-ezekiel-34-psalm-51'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=5 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=51 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Sirach 2:11 — *Yahuah (God) is full of compassion and mercy, longsuffering, and very pitiful, and forgiveth sins, and saves in time of affliction.* The library''s wisdom-voice knows the One who forgives sins and calls sinners to repentance (Luke 5:32).'
  FROM cross_reference_threads t, cross_references x, _lk05_lookup sv, _lk05_lookup tv
 WHERE t.slug='luke-5-i-came-not-to-call-the-righteous-but-sinners-hosea-6-ezekiel-34-psalm-51'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=5 AND sv.verse_number=32
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=2 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Sirach 38:9 — *My son, in your sickness be not negligent: but pray to Yahuah (God), and he will make you whole.* *They that are sick* (Luke 5:31) need the physician — the wisdom-voice taught the sick to turn to Yahuah, who makes whole.'
  FROM cross_reference_threads t, cross_references x, _lk05_lookup sv, _lk05_lookup tv
 WHERE t.slug='luke-5-i-came-not-to-call-the-righteous-but-sinners-hosea-6-ezekiel-34-psalm-51'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=5 AND sv.verse_number=31
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=38 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joel 2:16 — *let the bridegroom go forth of his chamber, and the bride out of her closet.* *Can ye make the children of the bridechamber fast, while the bridegroom is with them?* (Luke 5:34) — the bridegroom has gone forth; this is the day of joy.'
  FROM cross_reference_threads t, cross_references x, _lk05_lookup sv, _lk05_lookup tv
 WHERE t.slug='luke-5-the-bridegroom-and-the-new-wine-joel-2-isaiah-62-jeremiah-31'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=5 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 62:5 — *as the bridegroom rejoiceth over the bride, so shall thy Elohim (God) rejoice over thee.* The bridegroom is no stranger to the prophets — and he is present (Luke 5:34).'
  FROM cross_reference_threads t, cross_references x, _lk05_lookup sv, _lk05_lookup tv
 WHERE t.slug='luke-5-the-bridegroom-and-the-new-wine-joel-2-isaiah-62-jeremiah-31'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=5 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=62 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 31:31 — *I will make a new covenant with the house of Yashar''el (Israel), and with the house of Yahudah (Judah).* The *new wine* in *new bottles* (Luke 5:37-38) is the renewed covenant promised to both houses, gathered as one.'
  FROM cross_reference_threads t, cross_references x, _lk05_lookup sv, _lk05_lookup tv
 WHERE t.slug='luke-5-the-bridegroom-and-the-new-wine-joel-2-isaiah-62-jeremiah-31'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=5 AND sv.verse_number=37
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jeremiah 31:33 — *I will put my law in their inward parts, and write it in their hearts.* The renewed covenant is the SAME Torah brought inside. The new wine is the old covenant''s heart restored — renewal, never replacement of the law.'
  FROM cross_reference_threads t, cross_references x, _lk05_lookup sv, _lk05_lookup tv
 WHERE t.slug='luke-5-the-bridegroom-and-the-new-wine-joel-2-isaiah-62-jeremiah-31'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=5 AND sv.verse_number=38
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ============================================================
-- Fix sort_order on the threads (band 14120, step +3)
-- ============================================================
UPDATE cross_reference_threads SET sort_order=14120 WHERE slug='luke-5-launch-out-into-the-deep-the-great-draught-of-fishes-isaiah-6-jeremiah-16-ezekiel-47';
UPDATE cross_reference_threads SET sort_order=14123 WHERE slug='luke-5-shew-thyself-to-the-priest-as-moses-commanded-leviticus-13-14-2-kings-5';
UPDATE cross_reference_threads SET sort_order=14126 WHERE slug='luke-5-the-son-of-adam-hath-power-to-forgive-sins-isaiah-43-psalm-103-daniel-7';
UPDATE cross_reference_threads SET sort_order=14129 WHERE slug='luke-5-i-came-not-to-call-the-righteous-but-sinners-hosea-6-ezekiel-34-psalm-51';
UPDATE cross_reference_threads SET sort_order=14132 WHERE slug='luke-5-the-bridegroom-and-the-new-wine-joel-2-isaiah-62-jeremiah-31';

-- ----- fragment: minion_luke_06.sql -----
-- minion_luke_06.sql — Luke 6 full-library Come-and-See cross-reference threads (NT DEPTH pass)
-- EMPTY/greenfield. 7 threads. sort_order band base 14150 step +3.

CREATE TEMP VIEW _lk06_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1',
   'pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================================================ 3b. cross_references rows
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- Thread 1: 6:1-5 Lord of the sabbath
  ('canon','luke',6,1,'canon','deuteronomy',23,25, 'free', E'*When thou comest into the standing corn of thy neighbour, then thou mayest pluck the ears with thine hand; but thou shalt not move a sickle unto thy neighbour''s standing corn.* (Deuteronomy 23:25) — the disciples were not breaking any law. Plucking the ears by hand is expressly granted in the Torah. The Pharisees charged a transgression the Torah never named.'),
  ('canon','luke',6,3,'canon','1-samuel',21,6, 'free', E'*So the priest gave him hallowed bread: for there was no bread there but the shewbread, that was taken from before Yahuah (LORD), to put hot bread in the day when it was taken away.* (1 Samuel 21:6) — David and his men ate the holy bread in their hunger, and the Word does not condemn him. Mercy to the hungry is woven into the Torah itself.'),
  ('canon','luke',6,4,'canon','leviticus',24,9, 'free', E'*And it shall be Aaron''s and his sons''; and they shall eat it in the holy place: for it is most holy unto him of the offerings of Yahuah (LORD) made by fire by a perpetual statute.* (Leviticus 24:9) — the shewbread, twelve cakes set every sabbath (Leviticus 24:8), was for the priests alone. Yahusha names the very statute, then shows that mercy is the heart the statute serves.'),
  ('canon','luke',6,5,'canon','exodus',20,11, 'free', E'*For in six days Yahuah (LORD) made heaven and earth, the sea, and all that in them is, and rested the seventh day: wherefore Yahuah (LORD) blessed the sabbath day, and hallowed it.* (Exodus 20:11) — the Son of Adam is Yahuah (Lord) of the sabbath because he is the Formed One who hallowed it at creation. The Lord of the day is its right Interpreter, never its abolisher.'),
  -- Thread 2: 6:6-11 withered hand / lawful to do good
  ('canon','luke',6,9,'canon','deuteronomy',22,4, 'free', E'*Thou shalt not see thy brother''s ass or his ox fall down by the way, and hide thyself from them: thou shalt surely help him to lift them up again.* (Deuteronomy 22:4) — if the Torah commands lifting up a fallen beast, how much more a fallen man? Doing good is not licence taken against the sabbath; it is the sabbath rightly kept.'),
  ('canon','luke',6,9,'canon','isaiah',58,13, 'free', E'*If thou turn away thy foot from the sabbath, from doing thy pleasure on my holy day; and call the sabbath a delight, the holy of Yahuah (LORD), honourable; and shalt honour him, not doing thine own ways, nor finding thine own pleasure, nor speaking thine own words:* (Isaiah 58:13) — the sabbath is a delight, and a hand restored whole is the delight of the day, not its violation.'),
  ('canon','luke',6,9,'canon','leviticus',19,18, 'free', E'*Thou shalt not avenge, nor bear any grudge against the children of thy people, but thou shalt love thy neighbour as thyself: I am Yahuah (LORD).* (Leviticus 19:18) — to love thy neighbour as thyself is to save life when it stands before thee. The withered hand healed is this command obeyed on the holy day.'),
  ('canon','luke',6,10,'canon','proverbs',12,10, 'free', E'*A righteous man regardeth the life of his beast: but the tender mercies of the wicked are cruel.* (Proverbs 12:10) — the righteous man regards even a beast. The scribes, watching to accuse rather than to rejoice that a man was made whole, showed whose mercies were cruel.'),
  -- Thread 3: 6:12-16 the Twelve
  ('canon','luke',6,13,'canon','genesis',49,28, 'free', E'*All these are the twelve tribes of Yashar''el (Israel): and this is it that their father spake unto them, and blessed them; every one according to his blessing he blessed them.* (Genesis 49:28) — twelve tribes from Ya''aqov''s loins; twelve apostles named by the Son. The number is no accident: the houses of Yashar''el are being re-gathered into one.'),
  ('canon','luke',6,13,'canon','exodus',24,4, 'free', E'*And Moses wrote all the words of Yahuah (LORD), and rose up early in the morning, and builded an altar under the hill, and twelve pillars, according to the twelve tribes of Yashar''el (Israel).* (Exodus 24:4) — Moses set up twelve pillars for the twelve tribes at the covenant-cutting. The Son sets twelve men at the renewing of the same covenant people.'),
  ('canon','luke',6,13,'canon','numbers',1,16, 'free', E'*These were the renowned of the congregation, princes of the tribes of their fathers, heads of thousands in Yashar''el (Israel).* (Numbers 1:16) — a head out of every tribe to muster the congregation. So the Twelve are heads for the tribes re-mustered for the kingdom.'),
  -- Thread 4: 6:17-26 beatitudes & woes
  ('canon','luke',6,20,'canon','isaiah',61,1, 'free', E'*The Spirit of Adonai Yahuah (the Lord GOD) is upon me; because Yahuah (LORD) hath anointed me to preach good tidings unto the meek; he hath sent me to bind up the brokenhearted, to proclaim liberty to the captives, and the opening of the prison to them that are bound;* (Isaiah 61:1) — the Anointed One brings good tidings to the meek. Blessed are the poor because the kingdom is theirs, exactly as Isaiah foretold.'),
  ('canon','luke',6,21,'canon','psalms',37,11, 'free', E'*But the meek shall inherit the earth; and shall delight themselves in the abundance of peace.* (Psalm 37:11) — the hungry shall be filled, the weeping shall laugh, because the meek inherit. The kingdom turns the present order upside down.'),
  ('canon','luke',6,21,'canon','isaiah',65,13, 'free', E'*Therefore thus saith Adonai Yahuah (the Lord GOD), Behold, my servants shall eat, but ye shall be hungry: behold, my servants shall drink, but ye shall be thirsty: behold, my servants shall rejoice, but ye shall be ashamed:* (Isaiah 65:13) — the very reversal Yahusha proclaims: his servants filled, the self-satisfied left hungry. The blessing and the woe are the two sides of Isaiah''s word.'),
  ('canon','luke',6,24,'canon','jeremiah',17,5, 'free', E'*Thus saith Yahuah (LORD); Cursed be the man that trusteth in man, and maketh flesh his arm, and whose heart departeth from Yahuah (LORD).* (Jeremiah 17:5) — woe to the rich who have received their consolation, for they trusted in flesh. *Blessed is the man that trusteth in Yahuah (LORD)* (Jeremiah 17:7) — the blessing belongs to those who lean on him.'),
  ('canon','luke',6,24,'canon','amos',6,1, 'free', E'*Woe to them that are at ease in Zion, and trust in the mountain of Samaria, which are named chief of the nations, to whom the house of Yashar''el (Israel) came!* (Amos 6:1) — the prophet''s woe upon the at-ease and the full is the same woe Yahusha speaks. The luxury that forgets Yahuah is the trap.'),
  -- Thread 5: 6:27-36 love your enemies
  ('canon','luke',6,27,'canon','exodus',23,4, 'free', E'*If thou meet thine enemy''s ox or his ass going astray, thou shalt surely bring it back to him again.* (Exodus 23:4) — to love your enemy is no new commandment. The Torah already bids you serve your enemy''s straying beast, and your hater''s fallen ass (Exodus 23:5).'),
  ('canon','luke',6,27,'canon','proverbs',25,21, 'free', E'*If thine enemy be hungry, give him bread to eat; and if he be thirsty, give him water to drink:* (Proverbs 25:21) — *For thou shalt heap coals of fire upon his head, and Yahuah (LORD) shall reward thee* (Proverbs 25:22). Do good to them that hate you — the wisdom of Yahuah said it long before.'),
  ('canon','luke',6,31,'canon','leviticus',19,18, 'free', E'*Thou shalt not avenge, nor bear any grudge against the children of thy people, but thou shalt love thy neighbour as thyself: I am Yahuah (LORD).* (Leviticus 19:18) — do as ye would be done by; this is *love thy neighbour as thyself* widened to embrace even the enemy. The royal law stands at the centre.'),
  ('canon','luke',6,36,'canon','deuteronomy',18,13, 'free', E'*Thou shalt be perfect with Yahuah Elohayka (the LORD thy God).* (Deuteronomy 18:13) — *Be ye therefore merciful, as your Father also is merciful* — the children bear the Father''s likeness. To be perfect and merciful with him is to image his own character, exactly as the Torah charged Yashar''el.'),
  -- Thread 6: 6:37-42 judge not / mote & beam
  ('canon','luke',6,37,'canon','leviticus',19,15, 'free', E'*Ye shall do no unrighteousness in judgment: thou shalt not respect the person of the poor, nor honour the person of the mighty: but in righteousness shalt thou judge thy neighbour.* (Leviticus 19:15) — *judge not* is no ban on discernment; the Torah commands righteous judgment. It is the crooked measure, the respect of persons, the hypocrite''s scale, that is forbidden.'),
  ('canon','luke',6,38,'canon','proverbs',24,23, 'free', E'*These things also belong to the wise. It is not good to have respect of persons in judgment.* (Proverbs 24:23) — with the measure ye mete it is measured back. The wise do not weight the scale by the face of the man; mercy shown is mercy received.'),
  ('canon','luke',6,37,'apocrypha','ecclesiasticus',28,2, 'extras', E'*Forgive your neighbour the hurt that he has done to you, so shall your sins also be forgiven when you prayest.* (Sirach 28:2) — *forgive, and ye shall be forgiven.* The wisdom of Yahuah taught Yashar''el this same measure-for-measure of mercy generations before.'),
  -- Thread 7: 6:43-49 fruit / why call ye me Lord / two builders
  ('canon','luke',6,43,'canon','jeremiah',17,10, 'free', E'*I Yahuah (LORD) search the heart, I try the reins, even to give every man according to his ways, and according to the fruit of his doings.* (Jeremiah 17:10) — the tree is known by its fruit because Yahuah searches the heart and renders to every man by the fruit of his doings. The fruit cannot lie about the root.'),
  ('canon','luke',6,45,'canon','proverbs',12,14, 'free', E'*A man shall be satisfied with good by the fruit of his mouth: and the recompence of a man''s hands shall be rendered unto him.* (Proverbs 12:14) — out of the abundance of the heart the mouth speaketh; the fruit of the mouth declares the treasure within.'),
  ('canon','luke',6,46,'canon','ezekiel',13,10, 'free', E'*Because, even because they have seduced my people, saying, Peace; and there was no peace; and one built up a wall, and, lo, others daubed it with untempered morter:* (Ezekiel 13:10) — *why call ye me Lord, Lord, and do not* — the house built without foundation is the untempered wall, hearing without doing, that the storm will rend down (Ezekiel 13:11).'),
  ('canon','luke',6,48,'canon','isaiah',28,16, 'free', E'*Therefore thus saith Adonai Yahuah (the Lord GOD), Behold, I lay in Zion for a foundation a stone, a tried stone, a precious corner stone, a sure foundation: he that believeth shall not make haste.* (Isaiah 28:16) — the house that endures the flood is laid upon the rock Yahuah himself laid in Zion. To hear his sayings and do them is to build on that sure foundation.'),
  ('canon','luke',6,49,'canon','proverbs',10,25, 'free', E'*As the whirlwind passeth, so is the wicked no more: but the righteous is an everlasting foundation.* (Proverbs 10:25) — the house upon the earth without a foundation falls in the whirlwind; the righteous, who hears and does, is an everlasting foundation.'),
  ('canon','luke',6,44,'apocrypha','ecclesiasticus',27,6, 'extras', E'*The fruit declareth if the tree have been dressed; so is the utterance of a conceit in the heart of man.* (Sirach 27:6) — every tree is known by his own fruit, and a man''s speech declares his heart. The wisdom of Yahuah names the same test Yahusha names.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _lk06_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _lk06_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================================================ 3c. threads
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'luke-6-the-son-of-adam-is-lord-of-the-sabbath-deuteronomy-23-1-samuel-21',
       E'The Son of Adam is Yahuah of the sabbath (Deuteronomy 23; 1 Samuel 21; Leviticus 24)',
       E'The Pharisees charged the disciples with breaking the sabbath for plucking ears of corn — but the Torah they claimed to guard never forbade it. *When thou comest into the standing corn of thy neighbour, then thou mayest pluck the ears with thine hand; but thou shalt not move a sickle unto thy neighbour''s standing corn.* (Deuteronomy 23:25). Plucking by hand is expressly lawful. The accusation was the tradition''s, not the Torah''s.\n\nYahusha (Jesus) answers from the Scriptures: *Have ye not read so much as this, what David did, when himself was an hungred* (Luke 6:3). *So the priest gave him hallowed bread: for there was no bread there but the shewbread, that was taken from before Yahuah (LORD)* (1 Samuel 21:6). David ate the holy bread that *it is not lawful to eat but for the priests alone* (Luke 6:4) — *And it shall be Aaron''s and his sons''... they shall eat it in the holy place: for it is most holy* (Leviticus 24:9), the twelve cakes set in order *every sabbath... by an everlasting covenant* (Leviticus 24:8). The Word does not condemn David, for mercy to the hungry is woven into the Torah itself.\n\nThen the seal: *the Son of Adam is Yahuah (Lord) also of the sabbath* (Luke 6:5). He is Lord of the day because he is the Formed Son who hallowed it: *For in six days Yahuah (LORD) made heaven and earth... and rested the seventh day: wherefore Yahuah (LORD) blessed the sabbath day, and hallowed it* (Exodus 20:11). The Lord of the sabbath is its right Interpreter — never its abolisher. He does not break the day; he restores its meaning. The fourth commandment stands, and its Maker walks among them keeping it as it was given to be kept.',
       sv.verse_id, ev.verse_id, 'free', 14150
  FROM _lk06_lookup sv, _lk06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=6 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='luke' AND ev.chapter_number=6 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'luke-6-is-it-lawful-to-do-good-on-the-sabbath-deuteronomy-22-isaiah-58',
       E'Is it lawful to do good on the sabbath? — the withered hand restored (Deuteronomy 22; Isaiah 58)',
       E'On another sabbath a man stood in the synagogue *whose right hand was withered* (Luke 6:6), and the scribes watched *that they might find an accusation against him* (Luke 6:7). Yahusha (Jesus) sets the question plainly: *Is it lawful on the sabbath days to do good, or to do evil? to save life, or to destroy it?* (Luke 6:9).\n\nThe Torah answers itself. *Thou shalt not see thy brother''s ass or his ox fall down by the way, and hide thyself from them: thou shalt surely help him to lift them up again.* (Deuteronomy 22:4). If the law commands you to lift a fallen beast, how much more a fallen man? Mercy is commanded, and the day does not suspend it.\n\nThe sabbath was never meant to be a cage. *If thou turn away thy foot from the sabbath, from doing thy pleasure on my holy day; and call the sabbath a delight, the holy of Yahuah (LORD), honourable* (Isaiah 58:13) — and a hand made whole is the delight of the day, not its breaking. To heal is to obey *thou shalt... love thy neighbour as thyself: I am Yahuah (LORD)* (Leviticus 19:18). The watchers, by contrast, kept the day to accuse rather than to rejoice — *A righteous man regardeth the life of his beast: but the tender mercies of the wicked are cruel* (Proverbs 12:10). Doing good and saving life IS the sabbath rightly kept. The healing upholds the day; the hardness of those who *were filled with madness* (Luke 6:11) profaned it.',
       sv.verse_id, ev.verse_id, 'free', 14153
  FROM _lk06_lookup sv, _lk06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=6 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='luke' AND ev.chapter_number=6 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'luke-6-he-chose-twelve-the-tribes-regathered-genesis-49-exodus-24',
       E'He chose twelve — the tribes re-gathered (Genesis 49; Exodus 24; Numbers 1)',
       E'After a whole night in prayer to Elohim (God), *of them he chose twelve, whom also he named apostles* (Luke 6:13). The number is no accident. From the beginning the covenant people were twelve: *All these are the twelve tribes of Yashar''el (Israel): and this is it that their father spake unto them, and blessed them; every one according to his blessing he blessed them.* (Genesis 49:28).\n\nWhen the covenant was cut at Sinai, Moses marked the same number in stone and pillar: *And Moses wrote all the words of Yahuah (LORD)... and builded an altar under the hill, and twelve pillars, according to the twelve tribes of Yashar''el (Israel).* (Exodus 24:4). And when the congregation was mustered for the march, a head was set over each tribe: *These were the renowned of the congregation, princes of the tribes of their fathers, heads of thousands in Yashar''el (Israel).* (Numbers 1:16).\n\nSo the Son sets twelve men at the renewing of the same covenant people — heads for the tribes re-mustered. This is the two-house promise stirring: Yahuah hath not cast away his people, but is gathering Yahudah (Judah) and the scattered house of Yashar''el back into one. The Twelve are the firstfruits of that ingathering — not a new people replacing the old, but the old re-gathered to her own root.',
       sv.verse_id, ev.verse_id, 'free', 14156
  FROM _lk06_lookup sv, _lk06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=6 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='luke' AND ev.chapter_number=6 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'luke-6-blessed-be-ye-poor-woe-unto-the-rich-isaiah-61-65-jeremiah-17',
       E'Blessed be ye poor, woe unto the rich — the great reversal (Isaiah 61; Isaiah 65; Jeremiah 17)',
       E'On the plain Yahusha (Jesus) lifts his eyes and speaks the kingdom''s reversal: *Blessed be ye poor: for yours is the kingdom of Elohim (God)* (Luke 6:20). This is the Anointed One''s own commission unfolding: *The Spirit of Adonai Yahuah (the Lord GOD) is upon me; because Yahuah (LORD) hath anointed me to preach good tidings unto the meek; he hath sent me to bind up the brokenhearted* (Isaiah 61:1).\n\n*Blessed are ye that hunger now: for ye shall be filled. Blessed are ye that weep now: for ye shall laugh.* (Luke 6:21) — *But the meek shall inherit the earth; and shall delight themselves in the abundance of peace* (Psalm 37:11). The kingdom turns the present order over.\n\nThen the woes fall as the prophets foretold. *Behold, my servants shall eat, but ye shall be hungry... behold, my servants shall rejoice, but ye shall be ashamed* (Isaiah 65:13). *But woe unto you that are rich! for ye have received your consolation* (Luke 6:24) — they trusted in flesh: *Cursed be the man that trusteth in man, and maketh flesh his arm, and whose heart departeth from Yahuah (LORD)* (Jeremiah 17:5), while *Blessed is the man that trusteth in Yahuah (LORD)* (Jeremiah 17:7). And the woe upon the at-ease and the full is Amos'' own: *Woe to them that are at ease in Zion... to whom the house of Yashar''el (Israel) came!* (Amos 6:1). The beatitude and the woe are the two faces of one prophetic word — and Yahusha speaks them whole.',
       sv.verse_id, ev.verse_id, 'free', 14159
  FROM _lk06_lookup sv, _lk06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=6 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='luke' AND ev.chapter_number=6 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'luke-6-love-your-enemies-merciful-as-your-father-leviticus-19-exodus-23',
       E'Love your enemies — merciful as your Father (Leviticus 19; Exodus 23; Proverbs 25)',
       E'*But I say unto you which hear, Love your enemies, do good to them which hate you* (Luke 6:27). This is no abolition of the Torah and no addition to it — it is the Torah''s own heart drawn out. The law already bound Yashar''el to serve even an enemy: *If thou meet thine enemy''s ox or his ass going astray, thou shalt surely bring it back to him again* (Exodus 23:4); and *the ass of him that hateth thee lying under his burden... thou shalt surely help with him* (Exodus 23:5).\n\nThe wisdom of Yahuah said it plainly: *If thine enemy be hungry, give him bread to eat; and if he be thirsty, give him water to drink: For thou shalt heap coals of fire upon his head, and Yahuah (LORD) shall reward thee* (Proverbs 25:21-22).\n\n*And as ye would that men should do to you, do ye also to them likewise* (Luke 6:31) — this is *thou shalt... love thy neighbour as thyself: I am Yahuah (LORD)* (Leviticus 19:18), widened to embrace the enemy. The royal law stands at the centre. And the reason given is the Father''s own likeness: *Be ye therefore merciful, as your Father also is merciful* (Luke 6:36) — *Thou shalt be perfect with Yahuah Elohayka (the LORD thy God)* (Deuteronomy 18:13). The children bear the Father''s character; to love the enemy is to image the One who *is kind unto the unthankful and to the evil* (Luke 6:35).',
       sv.verse_id, ev.verse_id, 'free', 14162
  FROM _lk06_lookup sv, _lk06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=6 AND sv.verse_number=27
   AND ev.edition_slug='canon' AND ev.book_slug='luke' AND ev.chapter_number=6 AND ev.verse_number=36
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'luke-6-judge-not-the-mote-and-the-beam-leviticus-19-proverbs-24-sirach-28',
       E'Judge not — the mote and the beam (Leviticus 19; Proverbs 24; Sirach 28)',
       E'*Judge not, and ye shall not be judged: condemn not, and ye shall not be condemned: forgive, and ye shall be forgiven* (Luke 6:37). This is no ban on discernment — the Torah commands righteous judgment: *Ye shall do no unrighteousness in judgment: thou shalt not respect the person of the poor, nor honour the person of the mighty: but in righteousness shalt thou judge thy neighbour* (Leviticus 19:15). What is forbidden is the crooked scale and the hypocrite''s measure — the man who beholds *the mote that is in thy brother''s eye, but perceivest not the beam that is in thine own eye* (Luke 6:41).\n\n*With the same measure that ye mete withal it shall be measured to you again* (Luke 6:38) — *It is not good to have respect of persons in judgment* (Proverbs 24:23). The wise do not weight the scale by the face of the man; mercy shown is mercy received.\n\nThe wisdom handed to Yashar''el taught the same measure-for-measure of mercy generations before: *Forgive your neighbour the hurt that he has done to you, so shall your sins also be forgiven when you prayest.* (Sirach 28:2). *Forgive, and ye shall be forgiven* is not a new word — it is the library speaking with one voice. First cast out the beam from thine own eye, *and then shalt thou see clearly* (Luke 6:42).',
       sv.verse_id, ev.verse_id, 'extras', 14165
  FROM _lk06_lookup sv, _lk06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=6 AND sv.verse_number=37
   AND ev.edition_slug='canon' AND ev.book_slug='luke' AND ev.chapter_number=6 AND ev.verse_number=42
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'luke-6-why-call-ye-me-lord-and-do-not-the-two-builders-isaiah-28-ezekiel-13',
       E'Why call ye me Lord, and do not — the two builders (Jeremiah 17; Isaiah 28; Ezekiel 13)',
       E'The tree is known by its fruit: *For a good tree bringeth not forth corrupt fruit; neither doth a corrupt tree bring forth good fruit* (Luke 6:43). The fruit cannot lie about the root, because Yahuah searches beneath it: *I Yahuah (LORD) search the heart, I try the reins, even to give every man according to his ways, and according to the fruit of his doings* (Jeremiah 17:10). *Out of the abundance of the heart his mouth speaketh* (Luke 6:45) — *A man shall be satisfied with good by the fruit of his mouth* (Proverbs 12:14); the speech declares the treasure within. *The fruit declareth if the tree have been dressed; so is the utterance of a conceit in the heart of man* (Sirach 27:6).\n\nThen the seal of the whole sermon — the anti-antinomian word: *And why call ye me, Yahuah (Lord), Yahuah (Lord), and do not the things which I say?* (Luke 6:46). Hearing without doing is the untempered wall the prophet condemned: *one built up a wall, and, lo, others daubed it with untempered morter... it shall fall* (Ezekiel 13:10-11). The man who hears and does builds deep: *He is like a man which built an house, and digged deep, and laid the foundation on a rock* (Luke 6:48) — laid upon the stone Yahuah himself set: *Behold, I lay in Zion for a foundation a stone, a tried stone, a precious corner stone, a sure foundation* (Isaiah 28:16). But the hearer who does not is *like a man that without a foundation built an house upon the earth... and immediately it fell* (Luke 6:49) — *As the whirlwind passeth, so is the wicked no more: but the righteous is an everlasting foundation* (Proverbs 10:25). To call him Lord is to do what he says.',
       sv.verse_id, ev.verse_id, 'extras', 14168
  FROM _lk06_lookup sv, _lk06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=6 AND sv.verse_number=43
   AND ev.edition_slug='canon' AND ev.book_slug='luke' AND ev.chapter_number=6 AND ev.verse_number=49
ON CONFLICT (slug) DO NOTHING;

-- ============================================================ 3d. thread_members
-- Thread 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 23:25 — *thou mayest pluck the ears with thine hand* — the plucking was lawful; the charge was the tradition''s, not the Torah''s.'
  FROM cross_reference_threads t, cross_references x, _lk06_lookup sv, _lk06_lookup tv
 WHERE t.slug='luke-6-the-son-of-adam-is-lord-of-the-sabbath-deuteronomy-23-1-samuel-21'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=6 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=23 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Samuel 21:6 — *the priest gave him hallowed bread... the shewbread* — David ate the holy bread in hunger and the Word does not condemn him.'
  FROM cross_reference_threads t, cross_references x, _lk06_lookup sv, _lk06_lookup tv
 WHERE t.slug='luke-6-the-son-of-adam-is-lord-of-the-sabbath-deuteronomy-23-1-samuel-21'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=6 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=21 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 24:9 — *they shall eat it in the holy place: for it is most holy* — the shewbread was for the priests alone; Yahusha names the statute, then shows the mercy it serves.'
  FROM cross_reference_threads t, cross_references x, _lk06_lookup sv, _lk06_lookup tv
 WHERE t.slug='luke-6-the-son-of-adam-is-lord-of-the-sabbath-deuteronomy-23-1-samuel-21'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=6 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=24 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Exodus 20:11 — *Yahuah (LORD) blessed the sabbath day, and hallowed it* — the Son of Adam is Lord of the day because he is the Formed One who hallowed it; its Interpreter, not its abolisher.'
  FROM cross_reference_threads t, cross_references x, _lk06_lookup sv, _lk06_lookup tv
 WHERE t.slug='luke-6-the-son-of-adam-is-lord-of-the-sabbath-deuteronomy-23-1-samuel-21'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=6 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 22:4 — *thou shalt surely help him to lift them up again* — if the Torah bids lifting a fallen beast, how much more a fallen man on the holy day.'
  FROM cross_reference_threads t, cross_references x, _lk06_lookup sv, _lk06_lookup tv
 WHERE t.slug='luke-6-is-it-lawful-to-do-good-on-the-sabbath-deuteronomy-22-isaiah-58'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=6 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=22 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 58:13 — *call the sabbath a delight, the holy of Yahuah (LORD), honourable* — a hand made whole is the delight of the day, not its breaking.'
  FROM cross_reference_threads t, cross_references x, _lk06_lookup sv, _lk06_lookup tv
 WHERE t.slug='luke-6-is-it-lawful-to-do-good-on-the-sabbath-deuteronomy-22-isaiah-58'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=6 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=58 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 19:18 — *thou shalt love thy neighbour as thyself* — to save life when it stands before thee is this command obeyed on the sabbath.'
  FROM cross_reference_threads t, cross_references x, _lk06_lookup sv, _lk06_lookup tv
 WHERE t.slug='luke-6-is-it-lawful-to-do-good-on-the-sabbath-deuteronomy-22-isaiah-58'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=6 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Proverbs 12:10 — *the tender mercies of the wicked are cruel* — the watchers kept the day to accuse rather than to rejoice that a man was made whole.'
  FROM cross_reference_threads t, cross_references x, _lk06_lookup sv, _lk06_lookup tv
 WHERE t.slug='luke-6-is-it-lawful-to-do-good-on-the-sabbath-deuteronomy-22-isaiah-58'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=6 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=12 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 49:28 — *All these are the twelve tribes of Yashar''el (Israel)* — twelve from Ya''aqov''s loins; twelve named by the Son. The houses re-gathered into one.'
  FROM cross_reference_threads t, cross_references x, _lk06_lookup sv, _lk06_lookup tv
 WHERE t.slug='luke-6-he-chose-twelve-the-tribes-regathered-genesis-49-exodus-24'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=6 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 24:4 — *twelve pillars, according to the twelve tribes* — Moses marked twelve at the covenant-cutting; the Son sets twelve at its renewing.'
  FROM cross_reference_threads t, cross_references x, _lk06_lookup sv, _lk06_lookup tv
 WHERE t.slug='luke-6-he-chose-twelve-the-tribes-regathered-genesis-49-exodus-24'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=6 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=24 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Numbers 1:16 — *princes of the tribes of their fathers, heads of thousands in Yashar''el* — a head over each tribe to muster the congregation; so the Twelve for the tribes re-mustered.'
  FROM cross_reference_threads t, cross_references x, _lk06_lookup sv, _lk06_lookup tv
 WHERE t.slug='luke-6-he-chose-twelve-the-tribes-regathered-genesis-49-exodus-24'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=6 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=1 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 61:1 — *anointed me to preach good tidings unto the meek* — the Anointed One''s own commission; blessed are the poor, for the kingdom is theirs.'
  FROM cross_reference_threads t, cross_references x, _lk06_lookup sv, _lk06_lookup tv
 WHERE t.slug='luke-6-blessed-be-ye-poor-woe-unto-the-rich-isaiah-61-65-jeremiah-17'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=6 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=61 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 37:11 — *the meek shall inherit the earth* — the hungry filled, the weeping made to laugh; the kingdom turns the present order over.'
  FROM cross_reference_threads t, cross_references x, _lk06_lookup sv, _lk06_lookup tv
 WHERE t.slug='luke-6-blessed-be-ye-poor-woe-unto-the-rich-isaiah-61-65-jeremiah-17'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=6 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=37 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 65:13 — *my servants shall eat, but ye shall be hungry... shall rejoice, but ye shall be ashamed* — the very reversal Yahusha proclaims, the two sides of one prophetic word.'
  FROM cross_reference_threads t, cross_references x, _lk06_lookup sv, _lk06_lookup tv
 WHERE t.slug='luke-6-blessed-be-ye-poor-woe-unto-the-rich-isaiah-61-65-jeremiah-17'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=6 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=65 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jeremiah 17:5 — *Cursed be the man that trusteth in man, and maketh flesh his arm* — woe to the rich who trust in flesh; blessed the man that trusteth in Yahuah (Jeremiah 17:7).'
  FROM cross_reference_threads t, cross_references x, _lk06_lookup sv, _lk06_lookup tv
 WHERE t.slug='luke-6-blessed-be-ye-poor-woe-unto-the-rich-isaiah-61-65-jeremiah-17'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=6 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=17 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Amos 6:1 — *Woe to them that are at ease in Zion... to whom the house of Yashar''el (Israel) came!* — the prophet''s woe upon the at-ease and the full is the woe Yahusha speaks.'
  FROM cross_reference_threads t, cross_references x, _lk06_lookup sv, _lk06_lookup tv
 WHERE t.slug='luke-6-blessed-be-ye-poor-woe-unto-the-rich-isaiah-61-65-jeremiah-17'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=6 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=6 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 5
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 23:4 — *thine enemy''s ox or his ass going astray, thou shalt surely bring it back* — the Torah already bound Yashar''el to serve even an enemy.'
  FROM cross_reference_threads t, cross_references x, _lk06_lookup sv, _lk06_lookup tv
 WHERE t.slug='luke-6-love-your-enemies-merciful-as-your-father-leviticus-19-exodus-23'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=6 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=23 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 25:21 — *If thine enemy be hungry, give him bread to eat* — do good to them that hate you; the wisdom of Yahuah said it long before (Proverbs 25:22).'
  FROM cross_reference_threads t, cross_references x, _lk06_lookup sv, _lk06_lookup tv
 WHERE t.slug='luke-6-love-your-enemies-merciful-as-your-father-leviticus-19-exodus-23'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=6 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=25 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 19:18 — *thou shalt love thy neighbour as thyself* — the golden rule of v.31 is the royal law widened to embrace the enemy.'
  FROM cross_reference_threads t, cross_references x, _lk06_lookup sv, _lk06_lookup tv
 WHERE t.slug='luke-6-love-your-enemies-merciful-as-your-father-leviticus-19-exodus-23'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=6 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Deuteronomy 18:13 — *Thou shalt be perfect with Yahuah Elohayka (the LORD thy God)* — be merciful as your Father is merciful; the children image his own character.'
  FROM cross_reference_threads t, cross_references x, _lk06_lookup sv, _lk06_lookup tv
 WHERE t.slug='luke-6-love-your-enemies-merciful-as-your-father-leviticus-19-exodus-23'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=6 AND sv.verse_number=36
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=18 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 6
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 19:15 — *in righteousness shalt thou judge thy neighbour* — judge not is no ban on discernment; the Torah commands righteous judgment. The crooked scale is what is forbidden.'
  FROM cross_reference_threads t, cross_references x, _lk06_lookup sv, _lk06_lookup tv
 WHERE t.slug='luke-6-judge-not-the-mote-and-the-beam-leviticus-19-proverbs-24-sirach-28'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=6 AND sv.verse_number=37
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 24:23 — *It is not good to have respect of persons in judgment* — with the measure ye mete it is measured back; the wise do not weight the scale by the face of the man.'
  FROM cross_reference_threads t, cross_references x, _lk06_lookup sv, _lk06_lookup tv
 WHERE t.slug='luke-6-judge-not-the-mote-and-the-beam-leviticus-19-proverbs-24-sirach-28'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=6 AND sv.verse_number=38
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=24 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Sirach 28:2 — *Forgive your neighbour the hurt... so shall your sins also be forgiven* — forgive and ye shall be forgiven; the library speaks the same measure of mercy with one voice.'
  FROM cross_reference_threads t, cross_references x, _lk06_lookup sv, _lk06_lookup tv
 WHERE t.slug='luke-6-judge-not-the-mote-and-the-beam-leviticus-19-proverbs-24-sirach-28'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=6 AND sv.verse_number=37
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=28 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 7
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 17:10 — *I Yahuah (LORD) search the heart... according to the fruit of his doings* — the tree is known by its fruit because Yahuah searches the root beneath it.'
  FROM cross_reference_threads t, cross_references x, _lk06_lookup sv, _lk06_lookup tv
 WHERE t.slug='luke-6-why-call-ye-me-lord-and-do-not-the-two-builders-isaiah-28-ezekiel-13'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=6 AND sv.verse_number=43
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=17 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 12:14 — *satisfied with good by the fruit of his mouth* — out of the abundance of the heart the mouth speaketh; the speech declares the treasure within.'
  FROM cross_reference_threads t, cross_references x, _lk06_lookup sv, _lk06_lookup tv
 WHERE t.slug='luke-6-why-call-ye-me-lord-and-do-not-the-two-builders-isaiah-28-ezekiel-13'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=6 AND sv.verse_number=45
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=12 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 13:10 — *one built up a wall... daubed it with untempered morter* — why call ye me Lord and do not; hearing without doing is the untempered wall the storm will rend (Ezekiel 13:11).'
  FROM cross_reference_threads t, cross_references x, _lk06_lookup sv, _lk06_lookup tv
 WHERE t.slug='luke-6-why-call-ye-me-lord-and-do-not-the-two-builders-isaiah-28-ezekiel-13'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=6 AND sv.verse_number=46
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=13 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 28:16 — *I lay in Zion for a foundation a stone... a sure foundation* — the house that endures the flood is laid upon the rock Yahuah himself set in Zion.'
  FROM cross_reference_threads t, cross_references x, _lk06_lookup sv, _lk06_lookup tv
 WHERE t.slug='luke-6-why-call-ye-me-lord-and-do-not-the-two-builders-isaiah-28-ezekiel-13'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=6 AND sv.verse_number=48
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=28 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Proverbs 10:25 — *the righteous is an everlasting foundation* — the house without a foundation falls in the whirlwind; the hearer who does is built to stand.'
  FROM cross_reference_threads t, cross_references x, _lk06_lookup sv, _lk06_lookup tv
 WHERE t.slug='luke-6-why-call-ye-me-lord-and-do-not-the-two-builders-isaiah-28-ezekiel-13'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=6 AND sv.verse_number=49
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=10 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Sirach 27:6 — *The fruit declareth if the tree have been dressed; so is the utterance... in the heart of man* — the wisdom of Yahuah names the same test: a man''s speech declares his heart.'
  FROM cross_reference_threads t, cross_references x, _lk06_lookup sv, _lk06_lookup tv
 WHERE t.slug='luke-6-why-call-ye-me-lord-and-do-not-the-two-builders-isaiah-28-ezekiel-13'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=6 AND sv.verse_number=44
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=27 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_luke_09.sql -----
-- minion_luke_09.sql — Come-and-See full-library cross-references for LUKE 9 (NT DEPTH pass)
-- EMPTY/greenfield. 8 threads. band base 14240 step +3. tag _lk09_lookup.

CREATE TEMP VIEW _lk09_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1',
   'pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================================================
-- 3b. cross_references rows
-- ============================================================
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- Thread 1: 9:1-6 the twelve sent
  ('canon','luke',9,2,'canon','numbers',11,16, 'free', E'*And Yahuah (LORD) said unto Moses, Gather unto me seventy men of the elders of Yashar''el (Israel), whom thou knowest to be the elders of the people, and officers over them; and bring them unto the tabernacle of the congregation, that they may stand there with thee.* (Numbers 11:16). The sent ones are endued by the Sender, not self-commissioned.'),
  ('canon','luke',9,2,'canon','numbers',11,17, 'free', E'*And I will come down and talk with thee there: and I will take of the spirit which is upon thee, and will put it upon them; and they shall bear the burden of the people with thee, that thou bear it not thyself alone.* (Numbers 11:17). The same Spirit that rested on Moses is put upon the sent; the Twelve carry the Master''s word, not their own.'),
  ('canon','luke',9,3,'canon','2-kings',4,29, 'free', E'*Then he said to Gehazi, Gird up thy loins, and take my staff in thine hand, and go thy way: if thou meet any man, salute him not...* (2 Kings 4:29). Elisha sends his servant ahead bearing nothing but the prophet''s staff and word — the sent one goes light, carrying the Sender''s authority.'),
  -- Thread 2: 9:10-17 feeding the five thousand
  ('canon','luke',9,13,'canon','2-kings',4,42, 'free', E'*And there came a man from Baal-shalisha, and brought the man of Elohim (God) bread of the firstfruits, twenty loaves of barley, and full ears of corn in the husk thereof. And he said, Give unto the people, that they may eat.* (2 Kings 4:42). A handful of loaves set before a hungry multitude — the same impossibility Yahusha''s disciples name.'),
  ('canon','luke',9,17,'canon','2-kings',4,43, 'free', E'*And his servitor said, What, should I set this before an hundred men? He said again, Give the people, that they may eat: for thus saith Yahuah (LORD), They shall eat, and shall leave thereof.* (2 Kings 4:43). Elisha fed a hundred and there was left over; here a greater than Elisha feeds five thousand, and twelve baskets remain.'),
  ('canon','luke',9,17,'canon','exodus',16,12, 'free', E'*I have heard the murmurings of the children of Yashar''el (Israel): speak unto them, saying, At even ye shall eat flesh, and in the morning ye shall be filled with bread; and ye shall know that I am Yahuah Elohaychem (the LORD your God).* (Exodus 16:12). The wilderness bread that filled Yashar''el is the Shepherd''s own hand spreading a table.'),
  ('canon','luke',9,13,'canon','psalms',78,19, 'free', E'*Yea, they spake against Elohim (God); they said, Can Elohim (God) furnish a table in the wilderness?* (Psalm 78:19). The disciples'' *we have no more but five loaves* is the old wilderness doubt; the answer is the filled multitude.'),
  ('canon','luke',9,11,'canon','numbers',27,17, 'free', E'*Which may go out before them... that the congregation of Yahuah (LORD) be not as sheep which have no shepherd.* (Numbers 27:17). The Shepherd Moses prayed for receives the scattered flock and feeds them.'),
  -- Thread 3: 9:18-22 the Messiah confessed, the suffering foretold
  ('canon','luke',9,20,'canon','psalms',2,7, 'free', E'*I will declare the decree: Yahuah (LORD) hath said unto me, Thou art my Son; this day have I begotten thee.* (Psalm 2:7). Peter confesses *the Messiah (Christ) of Elohim (God)* — the begotten Son the Father declared, the Formed Son who HAS a Father.'),
  ('canon','luke',9,22,'canon','isaiah',53,5, 'free', E'*But he was wounded for our transgressions, he was bruised for our iniquities: the chastisement of our peace was upon him; and with his stripes we are healed.* (Isaiah 53:5). *The Son of Adam must suffer many things* is no surprise reversal — it is the servant Isaiah saw centuries before.'),
  ('canon','luke',9,22,'canon','isaiah',53,12, 'free', E'*...because he hath poured out his soul unto death: and he was numbered with the transgressors; and he bare the sin of many, and made intercession for the transgressors.* (Isaiah 53:12). Rejected of the elders, slain, bearing the sin of many — the confessed Messiah and the suffering servant are one.'),
  ('canon','luke',9,22,'canon','hosea',6,2, 'free', E'*After two days will he revive us: in the third day he will raise us up, and we shall live in his sight.* (Hosea 6:2). *Raised the third day* is written into the prophets; the rising is as sure as the suffering.'),
  ('canon','luke',9,22,'canon','daniel',7,13, 'free', E'*I saw in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him.* (Daniel 7:13). The kaph stands — *one like the Son of Adam* — the Formed Son who took on flesh, the one who suffers and yet receives the everlasting kingdom.'),
  -- Thread 4: 9:23-27 the cost, and the glory of the Son of Adam
  ('canon','luke',9,26,'canon','daniel',7,13, 'free', E'*...behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days...* (Daniel 7:13). *When he shall come in his own glory* — the kaph preserved; he comes in the likeness, with the clouds, not flattened into the Ancient of days but brought before him.'),
  ('canon','luke',9,26,'canon','daniel',7,14, 'free', E'*And there was given him dominion, and glory, and a kingdom... his dominion is an everlasting dominion, which shall not pass away...* (Daniel 7:14). The glory the Son comes in is glory GIVEN him by the Father — the Formed Son exalted, never self-existent-apart-from-the-Father.'),
  ('canon','luke',9,26,'canon','zechariah',14,5, 'free', E'*...and Yahuah Elohai (the LORD my God) shall come, and all the saints with thee.* (Zechariah 14:5). *In his own glory, and in his Father''s, and of the holy angels* — the coming with the holy ones Zechariah foresaw.'),
  ('canon','luke',9,25,'canon','psalms',49,7, 'free', E'*None of them can by any means redeem his brother, nor give to Elohim (God) a ransom for him:* (Psalm 49:7). *What is a man advantaged, if he gain the whole world, and lose himself* — no wealth ransoms a soul; only the giving-up of life saves it.'),
  ('canon','luke',9,25,'canon','psalms',49,8, 'free', E'*(For the redemption of their soul is precious, and it ceaseth for ever:)* (Psalm 49:8). The soul''s redemption is beyond price; he who would save his life by gaining the world loses the only thing that cannot be bought back.'),
  -- Thread 5: 9:28-36 the Transfiguration — Moses, Elijah, and the Father''s voice
  ('canon','luke',9,29,'canon','exodus',34,29, 'free', E'*...that Moses wist not that the skin of his face shone while he talked with him.* (Exodus 34:29). Moses'' face shone with borrowed glory; on the mount Yahusha''s own countenance is altered and his raiment white — the glory is his own.'),
  ('canon','luke',9,30,'canon','exodus',34,30, 'free', E'*And when Aaron and all the children of Yashar''el (Israel) saw Moses, behold, the skin of his face shone; and they were afraid to come nigh him.* (Exodus 34:30). The same Moses whose shining face Yashar''el feared now stands talking with the Son in glory.'),
  ('canon','luke',9,35,'canon','deuteronomy',18,15, 'free', E'*Yahuah Elohayka (The LORD thy God) will raise up unto thee a Prophet from the midst of thee, of thy brethren, like unto me; unto him ye shall hearken;* (Deuteronomy 18:15). *Hear him* — the Father''s voice quotes Moses'' own promise. Moses (the Torah) stands on the mount and points to the Prophet he foretold.'),
  ('canon','luke',9,35,'canon','deuteronomy',18,18, 'free', E'*I will raise them up a Prophet from among their brethren, like unto thee, and will put my words in his mouth; and he shall speak unto them all that I shall command him.* (Deuteronomy 18:18). The Father puts his words in the Son''s mouth and commands *hear him* — the Torah is not silenced but fulfilled in the One it pointed to.'),
  ('canon','luke',9,30,'canon','malachi',4,4, 'free', E'*Remember ye the law of Moses my servant, which I commanded unto him in Horeb for all Yashar''el (Israel), with the statutes and judgments.* (Malachi 4:4). Moses and Elijah stand together on the mount exactly as Malachi names them — the Law and the Prophet of restoration, the Torah remembered, never abolished.'),
  ('canon','luke',9,30,'canon','malachi',4,5, 'free', E'*Behold, I will send you Elijah the prophet before the coming of the great and dreadful day of Yahuah (LORD):* (Malachi 4:5). Elijah in glory beside the Son — the prophet of the turning, witnessing to the One who accomplishes the decease at Jerusalem.'),
  ('canon','luke',9,29,'canon','daniel',7,9, 'free', E'*...the Ancient of days did sit, whose garment was white as snow, and the hair of his head like the pure wool...* (Daniel 7:9). The raiment *white and glistering* is the heavenly white of the throne-room vision — the Son shown in the Father''s own glory.'),
  ('canon','luke',9,31,'apocrypha','ecclesiasticus',45,5, 'extras', E'*He made him to hear his voice, and brought him into the dark cloud, and gave him commandments before his face, even the law of life and knowledge, that he might teach Jacob his covenants, and Yashar''el (Israel) his judgments.* (Sirach 45:5). The same Moses brought into the cloud to receive *the law of life* now stands in the cloud on the mount — and a voice out of the cloud names the beloved Son.'),
  ('canon','luke',9,30,'apocrypha','ecclesiasticus',48,10, 'extras', E'*Who were ordained for reproofs in their times... and to turn the heart of the father to the son, and to restore the tribes of Jacob.* (Sirach 48:10). Elijah''s appointed work — to restore the tribes of Jacob — frames why he stands beside the Son who gathers the scattered house.'),
  -- Thread 6: 9:37-45 the foul spirit cast out, the passion foretold
  ('canon','luke',9,42,'canon','isaiah',35,5, 'free', E'*Then the eyes of the blind shall be opened, and the ears of the deaf shall be unstopped.* (Isaiah 35:5). The afflicted child loosed is the sign Isaiah named — the kingdom drawing near in the healing of the broken.'),
  ('canon','luke',9,42,'canon','isaiah',35,6, 'free', E'*Then shall the lame man leap as an hart, and the tongue of the dumb sing: for in the wilderness shall waters break out, and streams in the desert.* (Isaiah 35:6). The unclean spirit rebuked and the child delivered — the desert beginning to bloom.'),
  ('canon','luke',9,39,'enoch','1-enoch',15,9, 'extras', E'*And the spirits of the giants afflict, oppress, destroy, attack, do battle, and work destruction on the earth, and cause trouble...* (1 Enoch 15:9). The library names what the *spirit* that *teareth* the child is — the afflicting spirits proceeding from the giants, the Watcher-rebellion''s aftermath.'),
  ('canon','luke',9,42,'enoch','1-enoch',15,11, 'extras', E'*...thus shall they destroy until the day of the consummation, the great judgement in which the age shall be consummated, over the Watchers and the godless...* (1 Enoch 15:11). These spirits destroy until the judgment; the Son rebukes one here as a foretaste of the consummation that ends them.'),
  -- Thread 7: 9:46-50 greatness inverted, the Spirit not fenced
  ('canon','luke',9,48,'canon','proverbs',15,33, 'free', E'*The fear of Yahuah (LORD) is the instruction of wisdom; and before honour is humility.* (Proverbs 15:33). *He that is least among you all, the same shall be great* — the way up is down, exactly as wisdom taught.'),
  ('canon','luke',9,48,'canon','proverbs',18,12, 'free', E'*Before destruction the heart of man is haughty, and before honour is humility.* (Proverbs 18:12). The reasoning *which of them should be greatest* is the haughty heart; the child set in the midst is the humility that goes before honour.'),
  ('canon','luke',9,48,'canon','isaiah',57,15, 'free', E'*...I dwell in the high and holy place, with him also that is of a contrite and humble spirit, to revive the spirit of the humble...* (Isaiah 57:15). The High and Lofty One dwells with the lowly — so to receive the little child is to receive the One who sent the Son.'),
  ('canon','luke',9,50,'canon','numbers',11,29, 'free', E'*And Moses said unto him, Enviest thou for my sake? would Elohim (God) that all the LORD''S people were prophets, and that Yahuah (LORD) would put his spirit upon them!* (Numbers 11:29). John says *we forbad him*; Yahusha says *forbid him not* — the very word Moses spoke when Joshua would fence the Spirit to the camp.'),
  -- Thread 8: 9:51-62 the face set to Jerusalem, the undivided call
  ('canon','luke',9,51,'canon','isaiah',50,7, 'free', E'*For Adonai Yahuah (the Lord GOD) will help me; therefore shall I not be confounded: therefore have I set my face like a flint, and I know that I shall not be ashamed.* (Isaiah 50:7). *He stedfastly set his face to go to Jerusalem* — the flint-set face of the servant of Isaiah, resolute toward the suffering ahead.'),
  ('canon','luke',9,54,'canon','2-kings',1,10, 'free', E'*And Elijah answered and said to the captain of fifty, If I be a man of Elohim (God), then let fire come down from heaven, and consume thee and thy fifty. And there came down fire from heaven...* (2 Kings 1:10). James and John reach for Elijah''s fire — *even as Elias did* — but the Son rebukes the impulse: he came to save, not to consume.'),
  ('canon','luke',9,56,'canon','2-kings',1,12, 'free', E'*And Elijah answered and said unto them, If I be a man of Elohim (God), let fire come down from heaven, and consume thee and thy fifty. And the fire of Elohim (God) came down from heaven, and consumed him and his fifty.* (2 Kings 1:12). *The Son of Adam is not come to destroy men''s lives, but to save them* — the same power, turned now wholly toward mercy.'),
  ('canon','luke',9,59,'canon','1-kings',19,20, 'free', E'*And he left the oxen, and ran after Elijah, and said, Let me, I pray thee, kiss my father and my mother, and then I will follow thee. And he said unto him, Go back again...* (1 Kings 19:20). Elisha asked first to kiss his parents; Yahusha presses the call harder — *let the dead bury their dead* — the kingdom''s claim is undivided.'),
  ('canon','luke',9,62,'canon','1-kings',19,21, 'free', E'*And he returned back from him, and took a yoke of oxen, and slew them... Then he arose, and went after Elijah, and ministered unto him.* (1 Kings 19:21). Elisha burned his plough and never looked back; *no man, having put his hand to the plough, and looking back, is fit for the kingdom of Elohim (God).*')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _lk09_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _lk09_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================================================
-- 3c. threads
-- ============================================================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'luke-9-the-twelve-sent-to-preach-the-kingdom-numbers-11-2-kings-4',
       E'He sent them to preach the kingdom (Numbers 11; 2 Kings 4)',
       E'Yahusha (Jesus) *called his twelve disciples together, and gave them power and authority over all devils, and to cure diseases. And he sent them to preach the kingdom of Elohim (God), and to heal the sick* (Luke 9:1-2). The sent ones do not go in their own name or their own strength — they bear the Sender''s word. This is the old pattern of the Spirit shared out from the head to the many. *And Yahuah (LORD) said unto Moses, Gather unto me seventy men of the elders of Yashar''el (Israel)... that they may stand there with thee* (Numbers 11:16), and then: *I will take of the spirit which is upon thee, and will put it upon them; and they shall bear the burden of the people with thee, that thou bear it not thyself alone* (Numbers 11:17). The same Spirit, divided out, that the burden be carried by many. And they go light, carrying the Sender''s authority, not their own provision: *take my staff in thine hand, and go thy way: if thou meet any man, salute him not* (2 Kings 4:29) — Elisha sends Gehazi ahead bearing nothing but the prophet''s staff. *Take nothing for your journey* (Luke 9:3) is the same trust: the word in the mouth is the whole equipment.',
       sv.verse_id, ev.verse_id, 'free', 14240
  FROM _lk09_lookup sv, _lk09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=9 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='luke' AND ev.chapter_number=9 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'luke-9-feeding-the-five-thousand-the-shepherd-feeds-the-flock-2-kings-4-exodus-16',
       E'Give ye them to eat: the Shepherd feeds the flock (2 Kings 4; Exodus 16; Psalm 78)',
       E'*Give ye them to eat* (Luke 9:13), Yahusha (Jesus) says, and the disciples answer with the old wilderness arithmetic of impossibility — *we have no more but five loaves and two fishes.* But the Shepherd has done this before, and more besides. Elisha set a handful of loaves before a hungry crowd: *And his servitor said, What, should I set this before an hundred men? He said again, Give the people, that they may eat: for thus saith Yahuah (LORD), They shall eat, and shall leave thereof* (2 Kings 4:43) — fed a hundred and left over. Here a greater than Elisha feeds five thousand, *and there was taken up of fragments that remained to them twelve baskets* (Luke 9:17). It is the wilderness bread again: *At even ye shall eat flesh, and in the morning ye shall be filled with bread; and ye shall know that I am Yahuah Elohaychem (the LORD your God)* (Exodus 16:12). The disciples'' doubt is the fathers'' doubt: *Can Elohim (God) furnish a table in the wilderness?* (Psalm 78:19) — and the answer is the filled multitude. This is the Shepherd Moses prayed for, that *the congregation of Yahuah (LORD) be not as sheep which have no shepherd* (Numbers 27:17), gathering the scattered flock and spreading the table with his own hand.',
       sv.verse_id, ev.verse_id, 'free', 14243
  FROM _lk09_lookup sv, _lk09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=9 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='luke' AND ev.chapter_number=9 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'luke-9-the-messiah-of-elohim-confessed-and-the-suffering-foretold-psalm-2-isaiah-53',
       E'The Messiah of Elohim confessed; the Son of Adam must suffer (Psalm 2; Isaiah 53; Hosea 6)',
       E'*But whom say ye that I am? Peter answering said, The Messiah (Christ) of Elohim (God)* (Luke 9:20). The Formed Son is confessed — and at once he names what kind of Messiah he is. *The Son of Adam must suffer many things, and be rejected of the elders and chief priests and scribes, and be slain, and be raised the third day* (Luke 9:22). This is no surprise turn; it is written. He is the begotten the Father declared: *Yahuah (LORD) hath said unto me, Thou art my Son; this day have I begotten thee* (Psalm 2:7) — the Son who HAS a Father, not a second self-existent person. And he is the servant Isaiah saw: *he was wounded for our transgressions, he was bruised for our iniquities: the chastisement of our peace was upon him; and with his stripes we are healed* (Isaiah 53:5), the one who *hath poured out his soul unto death: and he was numbered with the transgressors; and he bare the sin of many* (Isaiah 53:12). The rising is as sure as the suffering: *After two days will he revive us: in the third day he will raise us up, and we shall live in his sight* (Hosea 6:2). And the figure who suffers is the very one who receives the kingdom — *one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days* (Daniel 7:13): the kaph preserved, the Formed Son who took on flesh, despised yet enthroned.',
       sv.verse_id, ev.verse_id, 'free', 14246
  FROM _lk09_lookup sv, _lk09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=9 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='luke' AND ev.chapter_number=9 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'luke-9-take-up-thy-cross-and-the-glory-of-the-son-of-adam-daniel-7-psalm-49',
       E'Take up the cross; the Son of Adam in his glory (Daniel 7; Zechariah 14; Psalm 49)',
       E'*If any man will come after me, let him deny himself, and take up his cross daily, and follow me* (Luke 9:23). The cost is the whole self, and the warning is plain: *whosoever shall be ashamed of me and of my words, of him shall the Son of Adam be ashamed, when he shall come in his own glory, and in his Father''s, and of the holy angels* (Luke 9:26). That glory is Daniel''s vision — *one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days* (Daniel 7:13), and to him *was given dominion, and glory, and a kingdom... his dominion is an everlasting dominion, which shall not pass away* (Daniel 7:14). Mark the kaph and mark the giving: he comes in the likeness, with the clouds, and the glory is glory GIVEN him by the Father — the Formed Son exalted, never severed from the One who exalts him. It is the coming Zechariah saw: *and Yahuah Elohai (the LORD my God) shall come, and all the saints with thee* (Zechariah 14:5). Against that weight, what is the world worth? *What is a man advantaged, if he gain the whole world, and lose himself* (Luke 9:25) — for *none of them can by any means redeem his brother, nor give to Elohim (God) a ransom for him* (Psalm 49:7), since *the redemption of their soul is precious, and it ceaseth for ever* (Psalm 49:8). No wealth buys back a soul; only the losing of life for his sake saves it.',
       sv.verse_id, ev.verse_id, 'free', 14249
  FROM _lk09_lookup sv, _lk09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=9 AND sv.verse_number=23
   AND ev.edition_slug='canon' AND ev.book_slug='luke' AND ev.chapter_number=9 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'luke-9-the-transfiguration-moses-and-elijah-hear-him-deuteronomy-18-exodus-34-malachi-4',
       E'The Transfiguration: Moses, Elijah, and the Father''s voice — hear him (Deuteronomy 18; Exodus 34; Malachi 4)',
       E'On the mount *the fashion of his countenance was altered, and his raiment was white and glistering* (Luke 9:29) — the heavenly white of the throne-room, where *the Ancient of days did sit, whose garment was white as snow* (Daniel 7:9). Moses'' face once shone with borrowed glory: *Moses wist not that the skin of his face shone while he talked with him* (Exodus 34:29), and Yashar''el *were afraid to come nigh him* (Exodus 34:30) — but here the glory is the Son''s own. And the two who appear are the Law and the Prophets in person: *there talked with him two men, which were Moses and Elias* (Luke 9:30) — exactly the pair Malachi names at the close of the prophets: *Remember ye the law of Moses my servant... with the statutes and judgments* (Malachi 4:4) and *Behold, I will send you Elijah the prophet before the coming of the great and dreadful day of Yahuah (LORD)* (Malachi 4:5). The Torah is not silenced on the mount; it stands and testifies. Then the Father speaks: *This is my beloved Son: hear him* (Luke 9:35) — and *hear him* is Moses'' own promise quoted back: *Yahuah Elohayka (The LORD thy God) will raise up unto thee a Prophet... unto him ye shall hearken* (Deuteronomy 18:15); *I will... put my words in his mouth; and he shall speak unto them all that I shall command him* (Deuteronomy 18:18). The Father puts his words in the Son''s mouth and commands the hearing. The same Moses who *was brought into the dark cloud, and gave him commandments before his face, even the law of life* (Sirach 45:5) stands again in the cloud; and Elijah, *ordained... to turn the heart of the father to the son, and to restore the tribes of Jacob* (Sirach 48:10), stands beside the One who gathers the scattered house.',
       sv.verse_id, ev.verse_id, 'extras', 14252
  FROM _lk09_lookup sv, _lk09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=9 AND sv.verse_number=28
   AND ev.edition_slug='canon' AND ev.book_slug='luke' AND ev.chapter_number=9 AND ev.verse_number=36
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'luke-9-the-unclean-spirit-rebuked-and-the-passion-foretold-isaiah-35-1-enoch-15',
       E'The unclean spirit rebuked; the Son of Adam delivered up (Isaiah 35; 1 Enoch 15)',
       E'The only child is torn by *a spirit* that *teareth him that he foameth again* (Luke 9:39); the disciples could not cast it out, but Yahusha (Jesus) *rebuked the unclean spirit, and healed the child, and delivered him again to his father* (Luke 9:42). This is the sign Isaiah named of the kingdom drawing near: *Then the eyes of the blind shall be opened, and the ears of the deaf shall be unstopped* (Isaiah 35:5); *Then shall the lame man leap as an hart, and the tongue of the dumb sing: for in the wilderness shall waters break out, and streams in the desert* (Isaiah 35:6). The library names what these afflicting spirits are: *the spirits of the giants afflict, oppress, destroy, attack, do battle, and work destruction on the earth, and cause trouble* (1 Enoch 15:9) — the aftermath of the Watcher-rebellion. And it names how long they will work: *thus shall they destroy until the day of the consummation, the great judgement in which the age shall be consummated, over the Watchers and the godless* (1 Enoch 15:11). The Son rebukes one here as a foretaste of that consummation. And in the same breath he foretells his own delivering-up: *Let these sayings sink down into your ears: for the Son of Adam shall be delivered into the hands of men* (Luke 9:44) — the One who masters the spirits will be handed over to men.',
       sv.verse_id, ev.verse_id, 'extras', 14255
  FROM _lk09_lookup sv, _lk09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=9 AND sv.verse_number=37
   AND ev.edition_slug='canon' AND ev.book_slug='luke' AND ev.chapter_number=9 AND ev.verse_number=45
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'luke-9-greatness-inverted-and-the-spirit-not-fenced-proverbs-15-isaiah-57-numbers-11',
       E'The least shall be great; forbid him not (Proverbs 15; Isaiah 57; Numbers 11)',
       E'They reasoned *which of them should be greatest* (Luke 9:46), and Yahusha (Jesus) set a child in the midst: *whosoever shall receive this child in my name receiveth me... for he that is least among you all, the same shall be great* (Luke 9:48). The way up is down, exactly as wisdom taught: *The fear of Yahuah (LORD) is the instruction of wisdom; and before honour is humility* (Proverbs 15:33); *Before destruction the heart of man is haughty, and before honour is humility* (Proverbs 18:12). And the One who is highest dwells lowest: *I dwell in the high and holy place, with him also that is of a contrite and humble spirit, to revive the spirit of the humble* (Isaiah 57:15) — so to receive the little child is to receive the One who sent the Son. Then John would fence the Spirit: *Master, we saw one casting out devils in thy name; and we forbad him, because he followeth not with us* (Luke 9:49). But Yahusha answers, *Forbid him not* (Luke 9:50) — the very word Moses spoke when Joshua would shut the Spirit up to the camp: *Enviest thou for my sake? would Elohim (God) that all the LORD''S people were prophets, and that Yahuah (LORD) would put his spirit upon them!* (Numbers 11:29). The Spirit is not the property of the inner circle.',
       sv.verse_id, ev.verse_id, 'free', 14258
  FROM _lk09_lookup sv, _lk09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=9 AND sv.verse_number=46
   AND ev.edition_slug='canon' AND ev.book_slug='luke' AND ev.chapter_number=9 AND ev.verse_number=50
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'luke-9-he-set-his-face-to-go-to-jerusalem-the-undivided-call-isaiah-50-2-kings-1-1-kings-19',
       E'He set his face to Jerusalem; the undivided call (Isaiah 50; 2 Kings 1; 1 Kings 19)',
       E'*When the time was come that he should be received up, he stedfastly set his face to go to Jerusalem* (Luke 9:51) — the flint-set face of Isaiah''s servant: *Adonai Yahuah (the Lord GOD) will help me... therefore have I set my face like a flint, and I know that I shall not be ashamed* (Isaiah 50:7). Resolute toward the suffering ahead. When the Samaritan village would not receive him, James and John reached for Elijah''s fire — *Lord, wilt thou that we command fire to come down from heaven, and consume them, even as Elias did?* (Luke 9:54), recalling *let fire come down from heaven, and consume thee and thy fifty. And there came down fire from heaven* (2 Kings 1:10; cf. 2 Kings 1:12). But the Son rebukes the impulse: *the Son of Adam is not come to destroy men''s lives, but to save them* (Luke 9:56) — the same power, turned wholly toward mercy. And the call he gives is undivided. Elisha, when called, asked first *Let me, I pray thee, kiss my father and my mother, and then I will follow thee* (1 Kings 19:20), then *took a yoke of oxen, and slew them... Then he arose, and went after Elijah* (1 Kings 19:21) — he burned his plough and never looked back. Yahusha presses the claim harder still: *No man, having put his hand to the plough, and looking back, is fit for the kingdom of Elohim (God)* (Luke 9:62).',
       sv.verse_id, ev.verse_id, 'free', 14261
  FROM _lk09_lookup sv, _lk09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=9 AND sv.verse_number=51
   AND ev.edition_slug='canon' AND ev.book_slug='luke' AND ev.chapter_number=9 AND ev.verse_number=62
ON CONFLICT (slug) DO NOTHING;

-- ============================================================
-- 3d. thread_members
-- ============================================================
-- Thread 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 11:16 — *Gather unto me seventy men of the elders of Yashar''el (Israel)... that they may stand there with thee.* The endued helpers stand WITH the sender.'
  FROM cross_reference_threads t, cross_references x, _lk09_lookup sv, _lk09_lookup tv
 WHERE t.slug='luke-9-the-twelve-sent-to-preach-the-kingdom-numbers-11-2-kings-4'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=9 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=11 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 11:17 — *I will take of the spirit which is upon thee, and will put it upon them.* The Sender''s Spirit shared out to the sent.'
  FROM cross_reference_threads t, cross_references x, _lk09_lookup sv, _lk09_lookup tv
 WHERE t.slug='luke-9-the-twelve-sent-to-preach-the-kingdom-numbers-11-2-kings-4'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=9 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=11 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Kings 4:29 — *take my staff in thine hand, and go thy way.* The sent one carries the prophet''s authority, nothing else.'
  FROM cross_reference_threads t, cross_references x, _lk09_lookup sv, _lk09_lookup tv
 WHERE t.slug='luke-9-the-twelve-sent-to-preach-the-kingdom-numbers-11-2-kings-4'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=9 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=4 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Kings 4:42 — *brought... bread of the firstfruits, twenty loaves of barley... Give unto the people, that they may eat.* A handful before a multitude.'
  FROM cross_reference_threads t, cross_references x, _lk09_lookup sv, _lk09_lookup tv
 WHERE t.slug='luke-9-feeding-the-five-thousand-the-shepherd-feeds-the-flock-2-kings-4-exodus-16'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=9 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=4 AND tv.verse_number=42
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Kings 4:43 — *They shall eat, and shall leave thereof.* Elisha fed a hundred with leftovers; a greater feeds five thousand with twelve baskets.'
  FROM cross_reference_threads t, cross_references x, _lk09_lookup sv, _lk09_lookup tv
 WHERE t.slug='luke-9-feeding-the-five-thousand-the-shepherd-feeds-the-flock-2-kings-4-exodus-16'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=9 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=4 AND tv.verse_number=43
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 16:12 — *in the morning ye shall be filled with bread.* The wilderness bread is the Shepherd''s own hand.'
  FROM cross_reference_threads t, cross_references x, _lk09_lookup sv, _lk09_lookup tv
 WHERE t.slug='luke-9-feeding-the-five-thousand-the-shepherd-feeds-the-flock-2-kings-4-exodus-16'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=9 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=16 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 78:19 — *Can Elohim (God) furnish a table in the wilderness?* The fathers'' doubt, answered by the filled multitude.'
  FROM cross_reference_threads t, cross_references x, _lk09_lookup sv, _lk09_lookup tv
 WHERE t.slug='luke-9-feeding-the-five-thousand-the-shepherd-feeds-the-flock-2-kings-4-exodus-16'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=9 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=78 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Numbers 27:17 — *that the congregation of Yahuah (LORD) be not as sheep which have no shepherd.* The Shepherd Moses prayed for feeds the flock.'
  FROM cross_reference_threads t, cross_references x, _lk09_lookup sv, _lk09_lookup tv
 WHERE t.slug='luke-9-feeding-the-five-thousand-the-shepherd-feeds-the-flock-2-kings-4-exodus-16'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=9 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=27 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 2:7 — *Thou art my Son; this day have I begotten thee.* The begotten Son the Father declared — the Formed Son who HAS a Father.'
  FROM cross_reference_threads t, cross_references x, _lk09_lookup sv, _lk09_lookup tv
 WHERE t.slug='luke-9-the-messiah-of-elohim-confessed-and-the-suffering-foretold-psalm-2-isaiah-53'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=9 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 53:5 — *he was wounded for our transgressions... with his stripes we are healed.* The suffering servant the confessed Messiah is.'
  FROM cross_reference_threads t, cross_references x, _lk09_lookup sv, _lk09_lookup tv
 WHERE t.slug='luke-9-the-messiah-of-elohim-confessed-and-the-suffering-foretold-psalm-2-isaiah-53'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=9 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 53:12 — *he was numbered with the transgressors; and he bare the sin of many.* Rejected and slain, bearing the sin of many.'
  FROM cross_reference_threads t, cross_references x, _lk09_lookup sv, _lk09_lookup tv
 WHERE t.slug='luke-9-the-messiah-of-elohim-confessed-and-the-suffering-foretold-psalm-2-isaiah-53'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=9 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Hosea 6:2 — *in the third day he will raise us up.* The rising as sure as the suffering — raised the third day, written.'
  FROM cross_reference_threads t, cross_references x, _lk09_lookup sv, _lk09_lookup tv
 WHERE t.slug='luke-9-the-messiah-of-elohim-confessed-and-the-suffering-foretold-psalm-2-isaiah-53'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=9 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Daniel 7:13 — *one like the Son of Adam came with the clouds of heaven.* The kaph preserved: the One who suffers receives the kingdom.'
  FROM cross_reference_threads t, cross_references x, _lk09_lookup sv, _lk09_lookup tv
 WHERE t.slug='luke-9-the-messiah-of-elohim-confessed-and-the-suffering-foretold-psalm-2-isaiah-53'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=9 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 7:13 — *one like the Son of Adam came with the clouds of heaven.* He comes in his own glory in the likeness — the kaph preserved.'
  FROM cross_reference_threads t, cross_references x, _lk09_lookup sv, _lk09_lookup tv
 WHERE t.slug='luke-9-take-up-thy-cross-and-the-glory-of-the-son-of-adam-daniel-7-psalm-49'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=9 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 7:14 — *there was given him dominion, and glory, and a kingdom.* The glory is GIVEN him by the Father — the Formed Son exalted.'
  FROM cross_reference_threads t, cross_references x, _lk09_lookup sv, _lk09_lookup tv
 WHERE t.slug='luke-9-take-up-thy-cross-and-the-glory-of-the-son-of-adam-daniel-7-psalm-49'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=9 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Zechariah 14:5 — *Yahuah Elohai (the LORD my God) shall come, and all the saints with thee.* The coming with the holy ones.'
  FROM cross_reference_threads t, cross_references x, _lk09_lookup sv, _lk09_lookup tv
 WHERE t.slug='luke-9-take-up-thy-cross-and-the-glory-of-the-son-of-adam-daniel-7-psalm-49'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=9 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=14 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 49:7 — *None of them can by any means redeem his brother.* No wealth ransoms a soul.'
  FROM cross_reference_threads t, cross_references x, _lk09_lookup sv, _lk09_lookup tv
 WHERE t.slug='luke-9-take-up-thy-cross-and-the-glory-of-the-son-of-adam-daniel-7-psalm-49'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=9 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=49 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Psalm 49:8 — *the redemption of their soul is precious, and it ceaseth for ever.* The soul beyond price; gain the world and lose the only thing.'
  FROM cross_reference_threads t, cross_references x, _lk09_lookup sv, _lk09_lookup tv
 WHERE t.slug='luke-9-take-up-thy-cross-and-the-glory-of-the-son-of-adam-daniel-7-psalm-49'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=9 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=49 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 5
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 34:29 — *Moses wist not that the skin of his face shone.* Moses'' borrowed glory; on the mount the glory is the Son''s own.'
  FROM cross_reference_threads t, cross_references x, _lk09_lookup sv, _lk09_lookup tv
 WHERE t.slug='luke-9-the-transfiguration-moses-and-elijah-hear-him-deuteronomy-18-exodus-34-malachi-4'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=9 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=34 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 34:30 — *the skin of his face shone; and they were afraid to come nigh him.* The same Moses now stands with the Son in glory.'
  FROM cross_reference_threads t, cross_references x, _lk09_lookup sv, _lk09_lookup tv
 WHERE t.slug='luke-9-the-transfiguration-moses-and-elijah-hear-him-deuteronomy-18-exodus-34-malachi-4'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=9 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=34 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 18:15 — *a Prophet... unto him ye shall hearken.* The Father''s *hear him* quotes Moses'' own promise.'
  FROM cross_reference_threads t, cross_references x, _lk09_lookup sv, _lk09_lookup tv
 WHERE t.slug='luke-9-the-transfiguration-moses-and-elijah-hear-him-deuteronomy-18-exodus-34-malachi-4'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=9 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=18 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Deuteronomy 18:18 — *I will... put my words in his mouth.* The Father commands the hearing of the Prophet he raised up.'
  FROM cross_reference_threads t, cross_references x, _lk09_lookup sv, _lk09_lookup tv
 WHERE t.slug='luke-9-the-transfiguration-moses-and-elijah-hear-him-deuteronomy-18-exodus-34-malachi-4'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=9 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=18 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Malachi 4:4 — *Remember ye the law of Moses my servant.* The Torah stands and testifies on the mount, never abolished.'
  FROM cross_reference_threads t, cross_references x, _lk09_lookup sv, _lk09_lookup tv
 WHERE t.slug='luke-9-the-transfiguration-moses-and-elijah-hear-him-deuteronomy-18-exodus-34-malachi-4'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=9 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Malachi 4:5 — *I will send you Elijah the prophet.* Elijah in glory, the prophet of the turning, beside the Son.'
  FROM cross_reference_threads t, cross_references x, _lk09_lookup sv, _lk09_lookup tv
 WHERE t.slug='luke-9-the-transfiguration-moses-and-elijah-hear-him-deuteronomy-18-exodus-34-malachi-4'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=9 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=4 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Daniel 7:9 — *the Ancient of days... whose garment was white as snow.* The raiment white and glistering — the throne-room white.'
  FROM cross_reference_threads t, cross_references x, _lk09_lookup sv, _lk09_lookup tv
 WHERE t.slug='luke-9-the-transfiguration-moses-and-elijah-hear-him-deuteronomy-18-exodus-34-malachi-4'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=9 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 8, E'Sirach 45:5 — *brought him into the dark cloud, and gave him commandments... even the law of life.* Moses in the cloud receiving the Torah now stands in the cloud on the mount.'
  FROM cross_reference_threads t, cross_references x, _lk09_lookup sv, _lk09_lookup tv
 WHERE t.slug='luke-9-the-transfiguration-moses-and-elijah-hear-him-deuteronomy-18-exodus-34-malachi-4'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=9 AND sv.verse_number=31
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=45 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 9, E'Sirach 48:10 — *to turn the heart of the father to the son, and to restore the tribes of Jacob.* Elijah''s appointed work of restoration frames his standing beside the gathering Son.'
  FROM cross_reference_threads t, cross_references x, _lk09_lookup sv, _lk09_lookup tv
 WHERE t.slug='luke-9-the-transfiguration-moses-and-elijah-hear-him-deuteronomy-18-exodus-34-malachi-4'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=9 AND sv.verse_number=30
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=48 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 6
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 35:5 — *the eyes of the blind shall be opened, and the ears of the deaf shall be unstopped.* The kingdom-sign in the healing of the broken.'
  FROM cross_reference_threads t, cross_references x, _lk09_lookup sv, _lk09_lookup tv
 WHERE t.slug='luke-9-the-unclean-spirit-rebuked-and-the-passion-foretold-isaiah-35-1-enoch-15'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=9 AND sv.verse_number=42
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=35 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 35:6 — *Then shall the lame man leap as an hart.* The unclean spirit rebuked, the child loosed — the desert beginning to bloom.'
  FROM cross_reference_threads t, cross_references x, _lk09_lookup sv, _lk09_lookup tv
 WHERE t.slug='luke-9-the-unclean-spirit-rebuked-and-the-passion-foretold-isaiah-35-1-enoch-15'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=9 AND sv.verse_number=42
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=35 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 15:9 — *the spirits of the giants afflict, oppress, destroy... and cause trouble.* The library names what the spirit that teareth the child is.'
  FROM cross_reference_threads t, cross_references x, _lk09_lookup sv, _lk09_lookup tv
 WHERE t.slug='luke-9-the-unclean-spirit-rebuked-and-the-passion-foretold-isaiah-35-1-enoch-15'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=9 AND sv.verse_number=39
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=15 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 15:11 — *thus shall they destroy until the day of the consummation... over the Watchers.* The Son rebukes one as a foretaste of the judgment that ends them.'
  FROM cross_reference_threads t, cross_references x, _lk09_lookup sv, _lk09_lookup tv
 WHERE t.slug='luke-9-the-unclean-spirit-rebuked-and-the-passion-foretold-isaiah-35-1-enoch-15'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=9 AND sv.verse_number=42
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=15 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 7
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 15:33 — *before honour is humility.* The way up is down — the least shall be great.'
  FROM cross_reference_threads t, cross_references x, _lk09_lookup sv, _lk09_lookup tv
 WHERE t.slug='luke-9-greatness-inverted-and-the-spirit-not-fenced-proverbs-15-isaiah-57-numbers-11'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=9 AND sv.verse_number=48
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=15 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 18:12 — *Before destruction the heart of man is haughty.* The reasoning over greatness is the haughty heart.'
  FROM cross_reference_threads t, cross_references x, _lk09_lookup sv, _lk09_lookup tv
 WHERE t.slug='luke-9-greatness-inverted-and-the-spirit-not-fenced-proverbs-15-isaiah-57-numbers-11'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=9 AND sv.verse_number=48
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=18 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 57:15 — *I dwell... with him also that is of a contrite and humble spirit.* The Highest dwells with the lowly; receive the child, receive him.'
  FROM cross_reference_threads t, cross_references x, _lk09_lookup sv, _lk09_lookup tv
 WHERE t.slug='luke-9-greatness-inverted-and-the-spirit-not-fenced-proverbs-15-isaiah-57-numbers-11'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=9 AND sv.verse_number=48
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=57 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Numbers 11:29 — *would Elohim (God) that all the LORD''S people were prophets.* Moses'' own word when Joshua would fence the Spirit: forbid him not.'
  FROM cross_reference_threads t, cross_references x, _lk09_lookup sv, _lk09_lookup tv
 WHERE t.slug='luke-9-greatness-inverted-and-the-spirit-not-fenced-proverbs-15-isaiah-57-numbers-11'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=9 AND sv.verse_number=50
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=11 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 8
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 50:7 — *I have set my face like a flint, and I know that I shall not be ashamed.* The flint-set face of the servant, resolute toward Jerusalem.'
  FROM cross_reference_threads t, cross_references x, _lk09_lookup sv, _lk09_lookup tv
 WHERE t.slug='luke-9-he-set-his-face-to-go-to-jerusalem-the-undivided-call-isaiah-50-2-kings-1-1-kings-19'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=9 AND sv.verse_number=51
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=50 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Kings 1:10 — *let fire come down from heaven, and consume thee.* James and John reach for Elijah''s fire — even as Elias did.'
  FROM cross_reference_threads t, cross_references x, _lk09_lookup sv, _lk09_lookup tv
 WHERE t.slug='luke-9-he-set-his-face-to-go-to-jerusalem-the-undivided-call-isaiah-50-2-kings-1-1-kings-19'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=9 AND sv.verse_number=54
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=1 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Kings 1:12 — *let fire come down from heaven... And the fire of Elohim (God) came down.* The same power, now turned wholly toward mercy: he came to save.'
  FROM cross_reference_threads t, cross_references x, _lk09_lookup sv, _lk09_lookup tv
 WHERE t.slug='luke-9-he-set-his-face-to-go-to-jerusalem-the-undivided-call-isaiah-50-2-kings-1-1-kings-19'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=9 AND sv.verse_number=56
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=1 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Kings 19:20 — *Let me, I pray thee, kiss my father and my mother, and then I will follow thee.* Elisha asked first; Yahusha presses the call harder.'
  FROM cross_reference_threads t, cross_references x, _lk09_lookup sv, _lk09_lookup tv
 WHERE t.slug='luke-9-he-set-his-face-to-go-to-jerusalem-the-undivided-call-isaiah-50-2-kings-1-1-kings-19'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=9 AND sv.verse_number=59
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=19 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Kings 19:21 — *Then he arose, and went after Elijah, and ministered unto him.* Elisha burned his plough and never looked back — fit for the kingdom.'
  FROM cross_reference_threads t, cross_references x, _lk09_lookup sv, _lk09_lookup tv
 WHERE t.slug='luke-9-he-set-his-face-to-go-to-jerusalem-the-undivided-call-isaiah-50-2-kings-1-1-kings-19'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=9 AND sv.verse_number=62
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=19 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_luke_21.sql -----
-- ===========================================================================
-- minion_luke_21.sql — Luke 21 DEPTH pass (THIN-ADD; 3 NEW threads)
-- DEDUP: existing live thread on Luke 21:20 (times-of-the-gentiles...) — NOT touched.
-- New anchors: 21:1-4 (widow's two mites), 21:25-28 (signs / Son of Adam in a cloud),
--              21:29-36 (fig tree / my words shall not pass / watch and pray).
-- band base 14600, step +3.
-- ===========================================================================

-- 3a. Temp view -------------------------------------------------------------
CREATE TEMP VIEW _lk21_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1',
   'pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- 3b. cross_references rows --------------------------------------------------
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- THREAD 1: 21:1-4 the poor widow's two mites
  ('canon','luke',21,4,'canon','deuteronomy',15,11, 'free', E'*For the poor shall never cease out of the land: therefore I command thee, saying, Thou shalt open thine hand wide unto thy brother, to thy poor, and to thy needy, in thy land.* (Deuteronomy 15:11). The Torah''s open hand is the heart Yahusha (Jesus) is weighing in the treasury: not the size of the gift but the openness of the hand. The rich gave of their abundance; the widow opened her hand wide out of her want.'),
  ('canon','luke',21,4,'canon','deuteronomy',15,7, 'free', E'*If there be among you a poor man of one of thy brethren within any of thy gates in thy land which Yahuah Elohayka (the LORD thy God) giveth thee, thou shalt not harden thine heart, nor shut thine hand from thy poor brother* (Deuteronomy 15:7). The widow is the poor of the land Yahusha looks on with favour; the un-hardened, un-shut hand is the very thing the Torah commanded — and she, the poorest, kept it most fully.'),
  ('canon','luke',21,4,'canon','1-kings',17,12, 'free', E'*And she said, As Yahuah Elohayka (the LORD thy God) liveth, I have not a cake, but an handful of meal in a barrel, and a little oil in a cruse: and, behold, I am gathering two sticks, that I may go in and dress it for me and my son, that we may eat it, and die.* (1 Kings 17:12). The widow of Zarephath gave Elijah her last meal before her own death — the same whole-hearted, give-the-last self-giving the two mites carry. *She of her penury hath cast in all the living that she had.*'),
  ('canon','luke',21,4,'canon','1-kings',17,15, 'free', E'*And she went and did according to the saying of Elijah: and she, and he, and her house, did eat many days.* (1 Kings 17:15). The widow who gave her last was not impoverished but sustained — the barrel of meal wasted not. The two mites are cast into the same providence: the Father who feeds the open-handed.'),
  ('canon','luke',21,2,'canon','2-kings',12,9, 'free', E'*But Jehoiada the priest took a chest, and bored a hole in the lid of it, and set it beside the altar, on the right side as one cometh into the house of Yahuah (LORD): and the priests that kept the door put therein all the money that was brought into the house of Yahuah (LORD).* (2 Kings 12:9). The treasury-chest of the temple Yahusha watches in 21:1-2 is the very institution Jehoiada set beside the altar — and into it the poor widow casts *two mites,* the smallest coin, and is counted to have given the most.'),

  -- THREAD 2: 21:25-28 signs in sun, moon, stars / Son of Adam in a cloud
  ('canon','luke',21,25,'canon','joel',2,30, 'free', E'*And I will shew wonders in the heavens and in the earth, blood, and fire, and pillars of smoke. The sun shall be turned into darkness, and the moon into blood, before the great and the terrible day of Yahuah (LORD) come.* (Joel 2:30-31). The *signs in the sun, and in the moon, and in the stars* are not new — they are the heavens'' own herald of the day of Yahuah that Joel named, the same darkening before the same great day.'),
  ('canon','luke',21,25,'canon','isaiah',13,10, 'free', E'*For the stars of heaven and the constellations thereof shall not give their light: the sun shall be darkened in his going forth, and the moon shall not cause her light to shine.* (Isaiah 13:10). Isaiah set the sun, moon and stars going dark over the day of Yahuah; Luke 21:25 gathers that same prophetic sky over the coming of the Son. *The powers of heaven shall be shaken* (Luke 21:26).'),
  ('canon','luke',21,27,'canon','daniel',7,13, 'free', E'*I saw in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him.* (Daniel 7:13). Luke keeps Daniel''s vision — *the Son of Adam coming in a cloud with power and great glory.* The *kaph* of Daniel''s *one like* honours the incarnation: the Formed Son who took on flesh, who is brought near before the Ancient of days, the Father, and remains the cloud-rider he was.'),
  ('canon','luke',21,27,'canon','daniel',7,14, 'free', E'*And there was given him dominion, and glory, and a kingdom, that all people, nations, and languages, should serve him: his dominion is an everlasting dominion, which shall not pass away, and his kingdom that which shall not be destroyed.* (Daniel 7:14). The *power and great glory* of Luke 21:27 is the dominion *given him* by the Father in Daniel''s vision — conferred, not seized; the Son who has a Father receives the everlasting kingdom from him.'),
  ('canon','luke',21,26,'canon','haggai',2,6, 'free', E'*For thus saith Yahuah Tseva''ot (LORD of hosts); Yet once, it is a little while, and I will shake the heavens, and the earth, and the sea, and the dry land; And I will shake all nations, and the desire of all nations shall come* (Haggai 2:6-7). *The powers of heaven shall be shaken* — the same shaking Haggai foretold, the heavens trembling before the One whom all nations desire comes in glory.'),

  -- THREAD 3: 21:29-36 fig tree / heaven and earth pass / watch and pray
  ('canon','luke',21,33,'canon','isaiah',40,8, 'free', E'*The grass withereth, the flower fadeth: but the word of our Elohim (God) shall stand for ever.* (Isaiah 40:8). *Heaven and earth shall pass away: but my words shall not pass away* (Luke 21:33) is Isaiah''s own confession on the lips of the Son — the created order fades like the flower; the word of Elohim, which the Son speaks, outlasts heaven and earth.'),
  ('canon','luke',21,33,'canon','psalms',119,89, 'free', E'*For ever, O Yahuah (LORD), thy word is settled in heaven.* (Psalm 119:89). The word that *shall not pass away* is the word already settled for ever in heaven. When Yahusha says his words will outlast heaven and earth, he speaks of the one settled, abiding word of Yahuah — the Torah and the prophets and his own teaching are one enduring word.'),
  ('canon','luke',21,35,'canon','isaiah',24,17, 'free', E'*Fear, and the pit, and the snare, are upon thee, O inhabitant of the earth.* (Isaiah 24:17). *For as a snare shall it come on all them that dwell on the face of the whole earth* (Luke 21:35). The snare that overtakes the earth-dwellers unawares is Isaiah''s snare — the day that springs shut on the careless. Hence *watch ye therefore, and pray always* (Luke 21:36).'),
  ('canon','luke',21,34,'canon','malachi',4,1, 'free', E'*For, behold, the day cometh, that shall burn as an oven; and all the proud, yea, and all that do wickedly, shall be stubble: and the day that cometh shall burn them up, saith Yahuah Tseva''ot (LORD of hosts), that it shall leave them neither root nor branch.* (Malachi 4:1). The day that comes *unawares* on the surfeited heart is Malachi''s burning day — and *take heed to yourselves* (Luke 21:34) is the mercy that warns before the oven, that the watchful may *stand before the Son of Adam* (Luke 21:36).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _lk21_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _lk21_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- 3c. threads ---------------------------------------------------------------
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'luke-21-the-poor-widows-two-mites-deuteronomy-15-1-kings-17',
       E'The poor widow hath cast in more than they all (Deuteronomy 15; 1 Kings 17)',
       E'Yahusha (Jesus) sits over against the treasury and weighs not the coin but the heart. *And he saw also a certain poor widow casting in thither two mites. And he said, Of a truth I say unto you, that this poor widow hath cast in more than they all: For all these have of their abundance cast in unto the offerings of Elohim (God): but she of her penury hath cast in all the living that she had.* (Luke 21:2-4). The treasury-chest he watches is the one Jehoiada set beside the altar — *the priests that kept the door put therein all the money that was brought into the house of Yahuah (LORD)* (2 Kings 12:9) — and into that long-standing house she casts the smallest coin and is counted to have given the most.\n\nThe measure is the Torah''s own. *If there be among you a poor man of one of thy brethren... thou shalt not harden thine heart, nor shut thine hand from thy poor brother* (Deuteronomy 15:7); *Thou shalt open thine hand wide unto thy brother, to thy poor, and to thy needy, in thy land* (Deuteronomy 15:11). The rich kept their hand half-closed and gave of their abundance; the widow, who was herself the poor of the land, opened her hand wide and gave all. The commandment of the open hand is fulfilled most fully by the one with least to open.\n\nAnd the widow who gives her last is no stranger to the prophets. *I have not a cake, but an handful of meal in a barrel, and a little oil in a cruse... that we may eat it, and die* (1 Kings 17:12) — yet she made Elijah a little cake first, and *she, and he, and her house, did eat many days* (1 Kings 17:15). The barrel of meal wasted not. The two mites are cast into that same providence: the Father who sees the whole-hearted gift sustains the open hand. *Of a truth I say unto you, that this poor widow hath cast in more than they all.*',
       sv.verse_id, ev.verse_id, 'free', 14600
  FROM _lk21_lookup sv, _lk21_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=21 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='luke' AND ev.chapter_number=21 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'luke-21-the-son-of-adam-coming-in-a-cloud-daniel-7-joel-2',
       E'The Son of Adam coming in a cloud with power and great glory (Daniel 7; Joel 2)',
       E'*And there shall be signs in the sun, and in the moon, and in the stars; and upon the earth distress of nations, with perplexity; the sea and the waves roaring; Men''s hearts failing them for fear... for the powers of heaven shall be shaken.* (Luke 21:25-26). None of this sky is new. The prophets hung it long before. *The sun shall be turned into darkness, and the moon into blood, before the great and the terrible day of Yahuah (LORD) come* (Joel 2:30-31); *For the stars of heaven and the constellations thereof shall not give their light: the sun shall be darkened in his going forth, and the moon shall not cause her light to shine* (Isaiah 13:10). The heavens are doing what Joel and Isaiah said the heavens would do over the day of Yahuah. And *the powers of heaven shall be shaken* is Haggai''s shaking: *Yet once, it is a little while, and I will shake the heavens, and the earth, and the sea, and the dry land; And I will shake all nations, and the desire of all nations shall come* (Haggai 2:6-7).\n\nThen the figure comes. *And then shall they see the Son of Adam coming in a cloud with power and great glory.* (Luke 21:27). Read Daniel''s night-vision underneath it: *behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him* (Daniel 7:13). The *kaph* — Daniel''s *one like* — is honoured, not flattened: the Formed Son resembled mortal-man because he took on flesh, while remaining the cloud-rider who rides the clouds of heaven. He is *brought near before* the Ancient of days, the Father; he is the Son who has a Father.\n\nAnd the *power and great glory* is conferred, never seized. *And there was given him dominion, and glory, and a kingdom, that all people, nations, and languages, should serve him: his dominion is an everlasting dominion, which shall not pass away, and his kingdom that which shall not be destroyed* (Daniel 7:14). The Father gives; the Son receives the everlasting kingdom. So the sign that makes the nations'' hearts fail is, for the gathered, the dawn of redemption: *when these things begin to come to pass, then look up, and lift up your heads; for your redemption draweth nigh* (Luke 21:28).',
       sv.verse_id, ev.verse_id, 'free', 14603
  FROM _lk21_lookup sv, _lk21_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=21 AND sv.verse_number=25
   AND ev.edition_slug='canon' AND ev.book_slug='luke' AND ev.chapter_number=21 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'luke-21-heaven-and-earth-shall-pass-but-my-words-shall-not-isaiah-40-psalm-119',
       E'Heaven and earth shall pass away, but my words shall not (Isaiah 40; Psalm 119)',
       E'Yahusha (Jesus) points to the fig tree and all the trees: *When they now shoot forth, ye see and know of your own selves that summer is now nigh at hand. So likewise ye, when ye see these things come to pass, know ye that the kingdom of Elohim (God) is nigh at hand.* (Luke 21:30-31). The seasons preach the kingdom. Then he sets his own word above the seasons and above the world itself: *Heaven and earth shall pass away: but my words shall not pass away.* (Luke 21:33).\n\nThat is no new claim — it is Isaiah''s confession on the lips of the Son. *The grass withereth, the flower fadeth: but the word of our Elohim (God) shall stand for ever* (Isaiah 40:8). And it is the psalmist''s settled word: *For ever, O Yahuah (LORD), thy word is settled in heaven* (Psalm 119:89). The created order fades like the flower; the word of Elohim outlasts the heaven and earth it made. When the Son says *my words shall not pass away,* he is naming himself the speaker of that one abiding word — the Torah, the prophets, and his own teaching are one enduring voice, settled in heaven for ever. This is the same banner he raised in Luke: *it is easier for heaven and earth to pass, than one tittle of the law to fail* (Luke 16:17). The word stands.\n\nAnd because the word stands, the warning is mercy. *Take heed to yourselves, lest at any time your hearts be overcharged with surfeiting, and drunkenness, and cares of this life, and so that day come upon you unawares. For as a snare shall it come on all them that dwell on the face of the whole earth.* (Luke 21:34-35). That snare is Isaiah''s: *Fear, and the pit, and the snare, are upon thee, O inhabitant of the earth* (Isaiah 24:17). And the day it springs shut is Malachi''s burning oven: *behold, the day cometh, that shall burn as an oven; and all the proud, yea, and all that do wickedly, shall be stubble* (Malachi 4:1). The Son warns the careless before the oven, that the watchful may not be caught. *Watch ye therefore, and pray always, that ye may be accounted worthy to escape all these things that shall come to pass, and to stand before the Son of Adam* (Luke 21:36).',
       sv.verse_id, ev.verse_id, 'free', 14606
  FROM _lk21_lookup sv, _lk21_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=21 AND sv.verse_number=29
   AND ev.edition_slug='canon' AND ev.book_slug='luke' AND ev.chapter_number=21 AND ev.verse_number=36
ON CONFLICT (slug) DO NOTHING;

-- 3d. thread_members --------------------------------------------------------
-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 15:11 — *Thou shalt open thine hand wide unto thy brother, to thy poor, and to thy needy, in thy land.* The Torah''s open hand is the measure of the widow''s gift.'
  FROM cross_reference_threads t, cross_references x, _lk21_lookup sv, _lk21_lookup tv
 WHERE t.slug='luke-21-the-poor-widows-two-mites-deuteronomy-15-1-kings-17'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=21 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=15 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 15:7 — *thou shalt not harden thine heart, nor shut thine hand from thy poor brother.* The un-shut hand is the commandment the poorest kept most fully.'
  FROM cross_reference_threads t, cross_references x, _lk21_lookup sv, _lk21_lookup tv
 WHERE t.slug='luke-21-the-poor-widows-two-mites-deuteronomy-15-1-kings-17'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=21 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=15 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Kings 17:12 — *I have not a cake, but an handful of meal in a barrel... that we may eat it, and die.* The widow of Zarephath gives her last — the whole-hearted self-giving the two mites carry.'
  FROM cross_reference_threads t, cross_references x, _lk21_lookup sv, _lk21_lookup tv
 WHERE t.slug='luke-21-the-poor-widows-two-mites-deuteronomy-15-1-kings-17'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=21 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=17 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Kings 17:15 — *she, and he, and her house, did eat many days.* The one who gave her last was sustained; the open hand is cast into the Father''s providence.'
  FROM cross_reference_threads t, cross_references x, _lk21_lookup sv, _lk21_lookup tv
 WHERE t.slug='luke-21-the-poor-widows-two-mites-deuteronomy-15-1-kings-17'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=21 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=17 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'2 Kings 12:9 — *Jehoiada the priest took a chest, and bored a hole in the lid of it, and set it beside the altar... the priests that kept the door put therein all the money.* The temple treasury-chest Yahusha watches, into which she casts two mites.'
  FROM cross_reference_threads t, cross_references x, _lk21_lookup sv, _lk21_lookup tv
 WHERE t.slug='luke-21-the-poor-widows-two-mites-deuteronomy-15-1-kings-17'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=21 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=12 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joel 2:30-31 — *The sun shall be turned into darkness, and the moon into blood, before the great and the terrible day of Yahuah (LORD) come.* The signs in sun, moon and stars are Joel''s herald of the day of Yahuah.'
  FROM cross_reference_threads t, cross_references x, _lk21_lookup sv, _lk21_lookup tv
 WHERE t.slug='luke-21-the-son-of-adam-coming-in-a-cloud-daniel-7-joel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=21 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 13:10 — *the sun shall be darkened in his going forth, and the moon shall not cause her light to shine.* Isaiah''s darkened sky over the day of Yahuah is the same sky over the coming of the Son.'
  FROM cross_reference_threads t, cross_references x, _lk21_lookup sv, _lk21_lookup tv
 WHERE t.slug='luke-21-the-son-of-adam-coming-in-a-cloud-daniel-7-joel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=21 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=13 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 7:13 — *one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days.* The kaph (*one like*) honours the incarnation: the Formed Son, brought near before the Father, the cloud-rider in flesh.'
  FROM cross_reference_threads t, cross_references x, _lk21_lookup sv, _lk21_lookup tv
 WHERE t.slug='luke-21-the-son-of-adam-coming-in-a-cloud-daniel-7-joel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=21 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Daniel 7:14 — *there was given him dominion, and glory, and a kingdom... his dominion is an everlasting dominion, which shall not pass away.* The power and glory of Luke 21:27 is conferred by the Father, not seized; the Son receives the everlasting kingdom.'
  FROM cross_reference_threads t, cross_references x, _lk21_lookup sv, _lk21_lookup tv
 WHERE t.slug='luke-21-the-son-of-adam-coming-in-a-cloud-daniel-7-joel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=21 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Haggai 2:6-7 — *I will shake the heavens, and the earth... and the desire of all nations shall come.* *The powers of heaven shall be shaken* (Luke 21:26) is Haggai''s shaking before the One whom all nations desire comes in glory.'
  FROM cross_reference_threads t, cross_references x, _lk21_lookup sv, _lk21_lookup tv
 WHERE t.slug='luke-21-the-son-of-adam-coming-in-a-cloud-daniel-7-joel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=21 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='haggai' AND tv.chapter_number=2 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 40:8 — *The grass withereth, the flower fadeth: but the word of our Elohim (God) shall stand for ever.* Isaiah''s confession on the lips of the Son: the world fades, the word stands.'
  FROM cross_reference_threads t, cross_references x, _lk21_lookup sv, _lk21_lookup tv
 WHERE t.slug='luke-21-heaven-and-earth-shall-pass-but-my-words-shall-not-isaiah-40-psalm-119'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=21 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=40 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 119:89 — *For ever, O Yahuah (LORD), thy word is settled in heaven.* The word that shall not pass away is the one settled, abiding word of Yahuah — Torah, prophets, and the Son''s teaching, one enduring voice.'
  FROM cross_reference_threads t, cross_references x, _lk21_lookup sv, _lk21_lookup tv
 WHERE t.slug='luke-21-heaven-and-earth-shall-pass-but-my-words-shall-not-isaiah-40-psalm-119'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=21 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=119 AND tv.verse_number=89
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 24:17 — *Fear, and the pit, and the snare, are upon thee, O inhabitant of the earth.* The snare that overtakes the earth-dwellers unawares (Luke 21:35) is Isaiah''s snare.'
  FROM cross_reference_threads t, cross_references x, _lk21_lookup sv, _lk21_lookup tv
 WHERE t.slug='luke-21-heaven-and-earth-shall-pass-but-my-words-shall-not-isaiah-40-psalm-119'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=21 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=24 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Malachi 4:1 — *the day cometh, that shall burn as an oven; and all the proud... shall be stubble.* The day that comes unawares on the surfeited heart is Malachi''s burning day; the warning is mercy before the oven.'
  FROM cross_reference_threads t, cross_references x, _lk21_lookup sv, _lk21_lookup tv
 WHERE t.slug='luke-21-heaven-and-earth-shall-pass-but-my-words-shall-not-isaiah-40-psalm-119'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=21 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=4 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_luke_22.sql -----
-- Luke 22 — NT DEPTH pass — THIN-ADD (5 NEW threads; 22:35-38 already threaded, NOT touched)

CREATE TEMP VIEW _lk22_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1',
   'pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================================================
-- 3b. cross_references rows
-- ============================================================
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- THREAD 1 — Luke 22:14-20 the Passover kept and filled, the new covenant in his blood
  ('canon','luke',22,20,'canon','exodus',12,14, 'free', E'*And this day shall be unto you for a memorial; and ye shall keep it a feast to Yahuah (LORD) throughout your generations; ye shall keep it a feast by an ordinance for ever.* (Exodus 12:14). The Passover Yahusha keeps in this upper room is the very feast Yahuah ordained for ever — he does not retire it, he fills it.'),
  ('canon','luke',22,20,'canon','exodus',24,8, 'free', E'*And Moses took the blood, and sprinkled it on the people, and said, Behold the blood of the covenant, which Yahuah (LORD) hath made with you concerning all these words.* (Exodus 24:8). *This cup is the new testament in my blood* echoes the blood of the covenant at Sinai — the same covenant Elohim, now sealed afresh.'),
  ('canon','luke',22,20,'canon','jeremiah',31,33, 'free', E'*But this shall be the covenant that I will make with the house of Yashar''el (Israel); After those days, saith Yahuah (LORD), I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people.* (Jeremiah 31:33). The new covenant is the same Torah written WITHIN — not a law abolished but a law put in the inward parts.'),
  ('canon','luke',22,20,'canon','isaiah',53,12, 'free', E'*...because he hath poured out his soul unto death: and he was numbered with the transgressors; and he bare the sin of many, and made intercession for the transgressors.* (Isaiah 53:12). The blood *shed for you* is the soul poured out the servant-song foretold.'),
  ('canon','luke',22,20,'canon','1-corinthians',11,25, 'free', E'*After the same manner also he took the cup, when he had supped, saying, This cup is the new covenant in my blood: this do ye, as oft as ye drink it, in remembrance of me.* (1 Corinthians 11:25). Paul hands down the very words — the new covenant in his blood, Jeremiah 31 fulfilled at the table.'),

  -- THREAD 2 — Luke 22:24-30 greatness inverted; thrones judging the twelve tribes
  ('canon','luke',22,30,'canon','daniel',7,14, 'free', E'*And there was given him dominion, and glory, and a kingdom... his dominion is an everlasting dominion, which shall not pass away, and his kingdom that which shall not be destroyed.* (Daniel 7:14). The kingdom Yahusha appoints to the twelve is the everlasting dominion GIVEN to the Son of Adam — conferred, not seized.'),
  ('canon','luke',22,30,'canon','daniel',7,18, 'free', E'*But the saints of the El Elyon (most High) shall take the kingdom, and possess the kingdom for ever, even for ever and ever.* (Daniel 7:18). The thrones of the twelve are the saints receiving the kingdom Daniel saw handed down from the Ancient of days.'),
  ('canon','luke',22,30,'canon','1-samuel',8,7, 'free', E'*And Yahuah (LORD) said unto Samuel, Hearken unto the voice of the people... for they have not rejected thee, but they have rejected me, that I should not reign over them.* (1 Samuel 8:7). The true King is Yahuah; the thrones of the twelve judge UNDER him, the great reversal of the Gentile kings who lord it over.'),
  ('canon','luke',22,30,'canon','psalms',122,5, 'free', E'*For there are set thrones of judgment, the thrones of the house of David.* (Psalm 122:5). *Sit on thrones judging the twelve tribes of Yashar''el* plants the apostles on David''s thrones of judgment in the gathered city.'),
  ('canon','luke',22,30,'enoch','1-enoch',62,1, 'extras', E'*And thus Yahuah (God) of Spirits named the Elect One, And seated him on the throne of His glory, And he shall judge all the works of the holy in heaven above, And weigh their deeds in the balance.* (1 Enoch 62:1). The Elect One enthroned to judge is the same Son of Adam who shares his judgment-seat with the twelve over the tribes.'),

  -- THREAD 3 — Luke 22:31-34 Satan asks to sift you as wheat; the intercession that holds
  ('canon','luke',22,31,'canon','job',1,12, 'free', E'*And Yahuah (LORD) said unto Satan, Behold, all that he hath is in thy power; only upon himself put not forth thine hand. So Satan went forth from the presence of Yahuah (LORD).* (Job 1:12). The adversary must ASK and is bounded — *Satan hath desired to have you* is the same accuser permitted only so far.'),
  ('canon','luke',22,31,'canon','job',2,6, 'free', E'*And Yahuah (LORD) said unto Satan, Behold, he is in thine hand; but save his life.* (Job 2:6). The sifting is permitted, but the life is fenced — as Job''s was kept, so Yahusha prays Peter''s faith fail not.'),
  ('canon','luke',22,31,'canon','amos',9,9, 'free', E'*For, lo, I will command, and I will sift the house of Yashar''el (Israel) among all nations, like as corn is sifted in a sieve, yet shall not the least grain fall upon the earth.* (Amos 9:9). The very word *sift you as wheat* is Amos''s sieve — the house of Israel shaken among the nations, yet not one grain lost.'),
  ('canon','luke',22,32,'canon','zechariah',3,2, 'free', E'*And Yahuah (LORD) said unto Satan, Yahuah (LORD) rebuke thee, O Satan; even Yahuah (LORD) that hath chosen Jerusalem rebuke thee: is not this a brand plucked out of the fire?* (Zechariah 3:2). Satan stands to resist; Yahuah rebukes and plucks the brand from the fire — *I have prayed for thee* is that same rescuing intercession.'),

  -- THREAD 4 — Luke 22:39-46 Gethsemane; not my will, but thine, be done
  ('canon','luke',22,42,'canon','psalms',42,11, 'free', E'*Why art thou cast down, O my soul? and why art thou disquieted within me? hope thou in Elohim (God): for I shall yet praise him, who is the health of my countenance, and my Elohim (God).* (Psalm 42:11). The soul cast down yet hoping in Elohim is the agony of the garden — the Son pours out his trouble and yet trusts the Father.'),
  ('canon','luke',22,42,'canon','isaiah',51,17, 'free', E'*Awake, awake, stand up, O Jerusalem, which hast drunk at the hand of Yahuah (LORD) the cup of his fury; thou hast drunken the dregs of the cup of trembling, and wrung them out.* (Isaiah 51:17). *Remove this cup from me* is the cup of trembling — the Son takes from the Father''s hand what Jerusalem could not bear.'),
  ('canon','luke',22,42,'canon','isaiah',51,22, 'free', E'*Thus saith thy Yahuah (Lord) Yahuah (LORD)... Behold, I have taken out of thine hand the cup of trembling, even the dregs of the cup of my fury; thou shalt no more drink it again.* (Isaiah 51:22). The cup is taken out of his people''s hand because the Son drank it — *not my will, but thine, be done.*'),
  ('canon','luke',22,43,'canon','1-kings',19,5, 'free', E'*And as he lay and slept under a juniper tree, behold, then an angel touched him, and said unto him, Arise and eat.* (1 Kings 19:5). As an angel strengthened Elijah in his weariness unto the great journey, so *there appeared an angel unto him from heaven, strengthening him.*'),
  ('canon','luke',22,43,'canon','1-kings',19,7, 'free', E'*And the angel of Yahuah (LORD) came again the second time, and touched him, and said, Arise and eat; because the journey is too great for thee.* (1 Kings 19:7). The journey too great is sustained from heaven — the Father sends strength to the Son he does not spare.'),

  -- THREAD 5 — Luke 22:66-71 the Son of Adam at the right hand of the power of Elohim
  ('canon','luke',22,69,'canon','psalms',110,1, 'free', E'*Yahuah (LORD) said unto my Lord, Sit thou at my right hand, until I make thine enemies thy footstool.* (Psalm 110:1). *Sit on the right hand of the power of Elohim* is David''s own oracle — the Father seats the Son at his right hand.'),
  ('canon','luke',22,69,'canon','daniel',7,13, 'free', E'*I saw in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him.* (Daniel 7:13). *Hereafter shall the Son of Adam sit* — the kaph stands: one LIKE the Son of Adam, brought near to the Ancient of days, the Formed Son before the Father.'),
  ('canon','luke',22,69,'canon','daniel',7,14, 'free', E'*And there was given him dominion, and glory, and a kingdom... his dominion is an everlasting dominion.* (Daniel 7:14). The dominion is GIVEN him at the Ancient of days'' hand — the Son enthroned by the Father, not co-equal but conferred.'),
  ('canon','luke',22,69,'canon','acts',2,34, 'free', E'*For David is not ascended into the heavens: but he saith himself, Yahuah (LORD) said unto my Lord, Sit thou on my right hand.* (Acts 2:34). Peter, once converted, preaches the very throne — Elohim hath made him both Lord and Messiah, exalted to the right hand.'),
  ('canon','luke',22,69,'enoch','1-enoch',62,5, 'extras', E'*And that Angel of Peace who went with me said to me: ''These are the secrets which thou hast seen.''* (1 Enoch 62:5). In the same vision the Elect One is *seated... on the throne of His glory* — the Son of Adam enthroned to judge, the hidden secret now confessed before the council.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _lk22_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _lk22_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================================================
-- 3c. threads
-- ============================================================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'luke-22-this-cup-is-the-new-covenant-in-my-blood-exodus-24-jeremiah-31',
       E'This cup is the new covenant in my blood (Exodus 24; Jeremiah 31)',
       E'On the night he is betrayed Yahusha (Jesus) does not abolish the Passover — he KEEPS it and fills it. *With desire I have desired to eat this passover with you before I suffer* (Luke 22:15), and over the bread and the cup he says, *This is my body which is given for you... This cup is the new testament in my blood, which is shed for you* (Luke 22:19-20).\n\nThe feast itself is everlasting by Yahuah''s own word: *And this day shall be unto you for a memorial; and ye shall keep it a feast to Yahuah (LORD) throughout your generations; ye shall keep it a feast by an ordinance for ever* (Exodus 12:14). And the blood of the cup is the blood of the covenant first sprinkled at Sinai: *And Moses took the blood, and sprinkled it on the people, and said, Behold the blood of the covenant, which Yahuah (LORD) hath made with you concerning all these words* (Exodus 24:8).\n\nWhat is *new* about the new covenant is not a different law but the same Torah written within: *I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people* (Jeremiah 31:33). The covenant is renewed, the law internalized — never set aside. The blood *shed for you* is the soul poured out that Isaiah saw: *because he hath poured out his soul unto death: and he was numbered with the transgressors; and he bare the sin of many, and made intercession for the transgressors* (Isaiah 53:12). And Paul hands the same words down to the assemblies: *This cup is the new covenant in my blood: this do ye, as oft as ye drink it, in remembrance of me* (1 Corinthians 11:25). One library, one covenant, one Passover filled to the full.',
       sv.verse_id, ev.verse_id, 'free', 14630
  FROM _lk22_lookup sv, _lk22_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=22 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='luke' AND ev.chapter_number=22 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'luke-22-sit-on-thrones-judging-the-twelve-tribes-daniel-7-psalm-122',
       E'Ye shall sit on thrones judging the twelve tribes of Yashar''el (Daniel 7; Psalm 122)',
       E'A strife breaks out over *which of them should be accounted the greatest* (Luke 22:24), and Yahusha turns the world''s ladder upside down: *the kings of the Gentiles exercise lordship over them... But ye shall not be so... I am among you as he that serveth* (Luke 22:25-27). Then he confers the kingdom — but notice it is GIVEN, not grasped: *And I appoint unto you a kingdom, as my Father hath appointed unto me; That ye may eat and drink at my table in my kingdom, and sit on thrones judging the twelve tribes of Yashar''el (Israel)* (Luke 22:29-30).\n\nThis is Daniel''s vision come to the table. The dominion is handed down: *And there was given him dominion, and glory, and a kingdom... his dominion is an everlasting dominion, which shall not pass away, and his kingdom that which shall not be destroyed* (Daniel 7:14). And the saints receive it from him: *But the saints of the El Elyon (most High) shall take the kingdom, and possess the kingdom for ever, even for ever and ever* (Daniel 7:18). The true King over all is Yahuah himself — *they have not rejected thee, but they have rejected me, that I should not reign over them* (1 Samuel 8:7) — and the thrones the twelve sit on are David''s own judgment-seats: *For there are set thrones of judgment, the thrones of the house of David* (Psalm 122:5).\n\nHear the phrase plainly: *judging the twelve tribes of Yashar''el.* Not the church-instead-of-Israel, but the twelve tribes themselves — Judah and the scattered house of Israel re-gathered, for *Elohim hath not cast away his people.* The witness reaches into the wider library too, where the Elect One judges from the throne of glory: *And thus Yahuah (God) of Spirits named the Elect One, And seated him on the throne of His glory, And he shall judge all the works of the holy in heaven above, And weigh their deeds in the balance* (1 Enoch 62:1). The Son shares his judgment-seat with the twelve over the gathered tribes — restoration, not replacement.',
       sv.verse_id, ev.verse_id, 'extras', 14633
  FROM _lk22_lookup sv, _lk22_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=22 AND sv.verse_number=24
   AND ev.edition_slug='canon' AND ev.book_slug='luke' AND ev.chapter_number=22 AND ev.verse_number=30
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'luke-22-satan-hath-desired-to-sift-you-as-wheat-job-amos-9-zechariah-3',
       E'Satan hath desired to sift you as wheat (Job; Amos 9; Zechariah 3)',
       E'*And Yahuah (Lord) said, Simon, Simon, behold, Satan hath desired to have you, that he may sift you as wheat: But I have prayed for thee, that thy faith fail not: and when thou art converted, strengthen thy brethren* (Luke 22:31-32). Two things stand together here: the adversary may sift, but only by leave; and the Son''s prayer holds the sifted one through it.\n\nThe accuser must always ASK, and is always bounded. *And Yahuah (LORD) said unto Satan, Behold, all that he hath is in thy power; only upon himself put not forth thine hand. So Satan went forth from the presence of Yahuah (LORD)* (Job 1:12) — and again, *Behold, he is in thine hand; but save his life* (Job 2:6). The hand of the enemy reaches exactly as far as Yahuah permits and not a finger further.\n\nThe word *sift you as wheat* is drawn straight from the prophets: *For, lo, I will command, and I will sift the house of Yashar''el (Israel) among all nations, like as corn is sifted in a sieve, yet shall not the least grain fall upon the earth* (Amos 9:9). The house of Israel is shaken among the nations — yet not one true grain is lost. And the intercession that rescues is the picture of Zechariah''s vision: Satan stands to resist, and Yahuah rebukes him and plucks the brand from the fire — *Yahuah (LORD) rebuke thee, O Satan; even Yahuah (LORD) that hath chosen Jerusalem rebuke thee: is not this a brand plucked out of the fire?* (Zechariah 3:2). *I have prayed for thee* is that same plucking hand — the sifting permitted, the faith preserved.',
       sv.verse_id, ev.verse_id, 'free', 14636
  FROM _lk22_lookup sv, _lk22_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=22 AND sv.verse_number=31
   AND ev.edition_slug='canon' AND ev.book_slug='luke' AND ev.chapter_number=22 AND ev.verse_number=34
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'luke-22-not-my-will-but-thine-be-done-isaiah-51-1-kings-19',
       E'Not my will, but thine, be done (Isaiah 51; 1 Kings 19)',
       E'In the garden the Formed Son kneels and prays: *Father, if thou be willing, remove this cup from me: nevertheless not my will, but thine, be done* (Luke 22:42). This is the heart of who he is — the Son who HAS a Father and submits his will to the Father''s. Not a co-equal person bargaining, not a created angel; the begotten Son, in flesh, bowing his own will under the will of the One who sent him.\n\nHis soul is the soul of the Psalms in their deepest trouble: *Why art thou cast down, O my soul? and why art thou disquieted within me? hope thou in Elohim (God): for I shall yet praise him, who is the health of my countenance, and my Elohim (God)* (Psalm 42:11) — cast down, yet hoping in Elohim. The cup he asks to have removed is the prophets'' cup of trembling: *thou hast drunken the dregs of the cup of trembling, and wrung them out* (Isaiah 51:17). And by drinking it himself the Son takes it out of his people''s hand for ever: *Behold, I have taken out of thine hand the cup of trembling, even the dregs of the cup of my fury; thou shalt no more drink it again* (Isaiah 51:22).\n\nAnd the Father does not leave him unaided — *there appeared an angel unto him from heaven, strengthening him* (Luke 22:43). It is the very mercy shown to Elijah, spent and despairing under the juniper tree: *behold, then an angel touched him, and said unto him, Arise and eat* (1 Kings 19:5); *the angel of Yahuah (LORD) came again the second time, and touched him, and said, Arise and eat; because the journey is too great for thee* (1 Kings 19:7). The journey is too great — so heaven sends strength to the obedient Son who says, *not my will, but thine.*',
       sv.verse_id, ev.verse_id, 'free', 14639
  FROM _lk22_lookup sv, _lk22_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=22 AND sv.verse_number=39
   AND ev.edition_slug='canon' AND ev.book_slug='luke' AND ev.chapter_number=22 AND ev.verse_number=46
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'luke-22-the-son-of-adam-on-the-right-hand-of-the-power-psalm-110-daniel-7',
       E'Hereafter shall the Son of Adam sit on the right hand of the power of Elohim (Psalm 110; Daniel 7)',
       E'Before the council they ask, *Art thou the Messiah (Christ)? tell us* (Luke 22:67), and Yahusha answers with a throne: *Hereafter shall the Son of Adam sit on the right hand of the power of Elohim (God)* (Luke 22:69). He names himself by David''s oracle and by Daniel''s vision at once.\n\nDavid heard the Father speak it: *Yahuah (LORD) said unto my Lord, Sit thou at my right hand, until I make thine enemies thy footstool* (Psalm 110:1) — the Father seats the Son at his own right hand. And Daniel saw it given in heaven: *behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him* (Daniel 7:13). The kaph stands — *one LIKE the Son of Adam* — the Formed Son in the likeness of flesh, brought near before the Father, and the dominion handed to him: *And there was given him dominion, and glory, and a kingdom... his dominion is an everlasting dominion* (Daniel 7:14). It is GIVEN him — the Son enthroned by the Father, never seizing what is the Father''s to bestow.\n\nPeter, once converted and strengthening his brethren, preaches this very throne: *David is not ascended into the heavens: but he saith himself, Yahuah (LORD) said unto my Lord, Sit thou on my right hand* (Acts 2:34). And the wider library bears the same witness — the Elect One, the Son of Adam, seated on the throne of glory to judge: *And that Angel of Peace who went with me said to me: ''These are the secrets which thou hast seen''* (1 Enoch 62:5), the hidden secret of the enthroned Son now confessed openly before the men who blindfolded and struck him.',
       sv.verse_id, ev.verse_id, 'extras', 14642
  FROM _lk22_lookup sv, _lk22_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=22 AND sv.verse_number=66
   AND ev.edition_slug='canon' AND ev.book_slug='luke' AND ev.chapter_number=22 AND ev.verse_number=71
ON CONFLICT (slug) DO NOTHING;

-- ============================================================
-- 3d. thread_members
-- ============================================================
-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 12:14 — *And this day shall be unto you for a memorial; and ye shall keep it a feast to Yahuah (LORD) throughout your generations; ye shall keep it a feast by an ordinance for ever.* The Passover is an ordinance for ever — Yahusha keeps it, he does not retire it.'
  FROM cross_reference_threads t, cross_references x, _lk22_lookup sv, _lk22_lookup tv
 WHERE t.slug='luke-22-this-cup-is-the-new-covenant-in-my-blood-exodus-24-jeremiah-31'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=22 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 24:8 — *And Moses took the blood, and sprinkled it on the people, and said, Behold the blood of the covenant, which Yahuah (LORD) hath made with you concerning all these words.* The cup is the blood of the covenant first sprinkled at Sinai.'
  FROM cross_reference_threads t, cross_references x, _lk22_lookup sv, _lk22_lookup tv
 WHERE t.slug='luke-22-this-cup-is-the-new-covenant-in-my-blood-exodus-24-jeremiah-31'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=22 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=24 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 31:33 — *I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people.* The new covenant is the same Torah written WITHIN — never abolished.'
  FROM cross_reference_threads t, cross_references x, _lk22_lookup sv, _lk22_lookup tv
 WHERE t.slug='luke-22-this-cup-is-the-new-covenant-in-my-blood-exodus-24-jeremiah-31'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=22 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 53:12 — *...because he hath poured out his soul unto death: and he was numbered with the transgressors; and he bare the sin of many, and made intercession for the transgressors.* The blood shed for you is the soul poured out the servant-song foretold.'
  FROM cross_reference_threads t, cross_references x, _lk22_lookup sv, _lk22_lookup tv
 WHERE t.slug='luke-22-this-cup-is-the-new-covenant-in-my-blood-exodus-24-jeremiah-31'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=22 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Corinthians 11:25 — *This cup is the new covenant in my blood: this do ye, as oft as ye drink it, in remembrance of me.* Paul hands down the very words — Jeremiah 31 fulfilled at the table.'
  FROM cross_reference_threads t, cross_references x, _lk22_lookup sv, _lk22_lookup tv
 WHERE t.slug='luke-22-this-cup-is-the-new-covenant-in-my-blood-exodus-24-jeremiah-31'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=22 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=11 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 7:14 — *And there was given him dominion, and glory, and a kingdom... his dominion is an everlasting dominion, which shall not pass away.* The kingdom is GIVEN to the Son of Adam — conferred, not seized.'
  FROM cross_reference_threads t, cross_references x, _lk22_lookup sv, _lk22_lookup tv
 WHERE t.slug='luke-22-sit-on-thrones-judging-the-twelve-tribes-daniel-7-psalm-122'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=22 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 7:18 — *But the saints of the El Elyon (most High) shall take the kingdom, and possess the kingdom for ever, even for ever and ever.* The thrones of the twelve are the saints receiving the kingdom from the Ancient of days.'
  FROM cross_reference_threads t, cross_references x, _lk22_lookup sv, _lk22_lookup tv
 WHERE t.slug='luke-22-sit-on-thrones-judging-the-twelve-tribes-daniel-7-psalm-122'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=22 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Samuel 8:7 — *they have not rejected thee, but they have rejected me, that I should not reign over them.* Yahuah is the true King; the thrones of the twelve judge under him.'
  FROM cross_reference_threads t, cross_references x, _lk22_lookup sv, _lk22_lookup tv
 WHERE t.slug='luke-22-sit-on-thrones-judging-the-twelve-tribes-daniel-7-psalm-122'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=22 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=8 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 122:5 — *For there are set thrones of judgment, the thrones of the house of David.* The apostles judge from David''s thrones over the gathered tribes.'
  FROM cross_reference_threads t, cross_references x, _lk22_lookup sv, _lk22_lookup tv
 WHERE t.slug='luke-22-sit-on-thrones-judging-the-twelve-tribes-daniel-7-psalm-122'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=22 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=122 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Enoch 62:1 — *And thus Yahuah (God) of Spirits named the Elect One, And seated him on the throne of His glory, And he shall judge all the works of the holy in heaven above, And weigh their deeds in the balance.* The Elect One enthroned to judge shares his seat with the twelve over the tribes.'
  FROM cross_reference_threads t, cross_references x, _lk22_lookup sv, _lk22_lookup tv
 WHERE t.slug='luke-22-sit-on-thrones-judging-the-twelve-tribes-daniel-7-psalm-122'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=22 AND sv.verse_number=30
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=62 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Job 1:12 — *Behold, all that he hath is in thy power; only upon himself put not forth thine hand. So Satan went forth from the presence of Yahuah (LORD).* The adversary must ASK and is bounded — the same accuser permitted only so far.'
  FROM cross_reference_threads t, cross_references x, _lk22_lookup sv, _lk22_lookup tv
 WHERE t.slug='luke-22-satan-hath-desired-to-sift-you-as-wheat-job-amos-9-zechariah-3'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=22 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=1 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Job 2:6 — *Behold, he is in thine hand; but save his life.* The sifting is permitted, but the life is fenced — as Job''s was kept.'
  FROM cross_reference_threads t, cross_references x, _lk22_lookup sv, _lk22_lookup tv
 WHERE t.slug='luke-22-satan-hath-desired-to-sift-you-as-wheat-job-amos-9-zechariah-3'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=22 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=2 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Amos 9:9 — *For, lo, I will command, and I will sift the house of Yashar''el (Israel) among all nations, like as corn is sifted in a sieve, yet shall not the least grain fall upon the earth.* The very word *sift you as wheat* is Amos''s sieve — not one grain lost.'
  FROM cross_reference_threads t, cross_references x, _lk22_lookup sv, _lk22_lookup tv
 WHERE t.slug='luke-22-satan-hath-desired-to-sift-you-as-wheat-job-amos-9-zechariah-3'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=22 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=9 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Zechariah 3:2 — *Yahuah (LORD) rebuke thee, O Satan; even Yahuah (LORD) that hath chosen Jerusalem rebuke thee: is not this a brand plucked out of the fire?* Satan resists; Yahuah rebukes and plucks the brand — *I have prayed for thee* is that rescuing intercession.'
  FROM cross_reference_threads t, cross_references x, _lk22_lookup sv, _lk22_lookup tv
 WHERE t.slug='luke-22-satan-hath-desired-to-sift-you-as-wheat-job-amos-9-zechariah-3'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=22 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=3 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 42:11 — *Why art thou cast down, O my soul?... hope thou in Elohim (God): for I shall yet praise him.* The soul cast down yet hoping in Elohim is the agony of the garden.'
  FROM cross_reference_threads t, cross_references x, _lk22_lookup sv, _lk22_lookup tv
 WHERE t.slug='luke-22-not-my-will-but-thine-be-done-isaiah-51-1-kings-19'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=22 AND sv.verse_number=42
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=42 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 51:17 — *thou hast drunken the dregs of the cup of trembling, and wrung them out.* *Remove this cup from me* is the cup of trembling — the Son takes from the Father''s hand what Jerusalem could not bear.'
  FROM cross_reference_threads t, cross_references x, _lk22_lookup sv, _lk22_lookup tv
 WHERE t.slug='luke-22-not-my-will-but-thine-be-done-isaiah-51-1-kings-19'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=22 AND sv.verse_number=42
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=51 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 51:22 — *Behold, I have taken out of thine hand the cup of trembling... thou shalt no more drink it again.* By drinking it the Son takes the cup out of his people''s hand for ever.'
  FROM cross_reference_threads t, cross_references x, _lk22_lookup sv, _lk22_lookup tv
 WHERE t.slug='luke-22-not-my-will-but-thine-be-done-isaiah-51-1-kings-19'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=22 AND sv.verse_number=42
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=51 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Kings 19:5 — *behold, then an angel touched him, and said unto him, Arise and eat.* As an angel strengthened Elijah, so an angel from heaven strengthened the Son.'
  FROM cross_reference_threads t, cross_references x, _lk22_lookup sv, _lk22_lookup tv
 WHERE t.slug='luke-22-not-my-will-but-thine-be-done-isaiah-51-1-kings-19'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=22 AND sv.verse_number=43
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=19 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Kings 19:7 — *Arise and eat; because the journey is too great for thee.* The journey too great is sustained from heaven — the Father sends strength to the obedient Son.'
  FROM cross_reference_threads t, cross_references x, _lk22_lookup sv, _lk22_lookup tv
 WHERE t.slug='luke-22-not-my-will-but-thine-be-done-isaiah-51-1-kings-19'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=22 AND sv.verse_number=43
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=19 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 110:1 — *Yahuah (LORD) said unto my Lord, Sit thou at my right hand, until I make thine enemies thy footstool.* David''s oracle — the Father seats the Son at his right hand.'
  FROM cross_reference_threads t, cross_references x, _lk22_lookup sv, _lk22_lookup tv
 WHERE t.slug='luke-22-the-son-of-adam-on-the-right-hand-of-the-power-psalm-110-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=22 AND sv.verse_number=69
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=110 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 7:13 — *behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him.* The kaph stands — one LIKE the Son of Adam, the Formed Son brought near to the Father.'
  FROM cross_reference_threads t, cross_references x, _lk22_lookup sv, _lk22_lookup tv
 WHERE t.slug='luke-22-the-son-of-adam-on-the-right-hand-of-the-power-psalm-110-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=22 AND sv.verse_number=69
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 7:14 — *And there was given him dominion, and glory, and a kingdom... his dominion is an everlasting dominion.* The dominion is GIVEN him at the Ancient of days'' hand — enthroned by the Father, not co-equal but conferred.'
  FROM cross_reference_threads t, cross_references x, _lk22_lookup sv, _lk22_lookup tv
 WHERE t.slug='luke-22-the-son-of-adam-on-the-right-hand-of-the-power-psalm-110-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=22 AND sv.verse_number=69
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Acts 2:34 — *David is not ascended into the heavens: but he saith himself, Yahuah (LORD) said unto my Lord, Sit thou on my right hand.* Peter, once converted, preaches the very throne.'
  FROM cross_reference_threads t, cross_references x, _lk22_lookup sv, _lk22_lookup tv
 WHERE t.slug='luke-22-the-son-of-adam-on-the-right-hand-of-the-power-psalm-110-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=22 AND sv.verse_number=69
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=2 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Enoch 62:5 — *And that Angel of Peace who went with me said to me: ''These are the secrets which thou hast seen.''* In the same vision the Elect One, the Son of Adam, is seated on the throne of glory to judge — the hidden secret now confessed before the council.'
  FROM cross_reference_threads t, cross_references x, _lk22_lookup sv, _lk22_lookup tv
 WHERE t.slug='luke-22-the-son-of-adam-on-the-right-hand-of-the-power-psalm-110-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=22 AND sv.verse_number=69
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=62 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session260 — Luke (depth) cross-references complete.'
