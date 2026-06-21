-- =====================================================================
-- Session 260 — Luke (depth) FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py /tmp/nt-depth-wt/data-schema/migrations/session260_luke2_depth_cross_references.sql
-- =====================================================================

\echo 'session260 — Luke (depth) cross-references starting...'
BEGIN;

-- ----- fragment: minion_luke_02.sql -----
-- ============================================================================
-- Luke 2 — full-library "Come and See" cross-reference threads (NT DEPTH pass)
-- THIN-ADD. Existing anchors AVOIDED: 2:13 (heavenly host / 1 Enoch),
-- 2:25 (Simeon & Anna as two witnesses). 4 NEW threads built on:
--   2:1-7 (Beth-lehem Ephratah / manger / tower of the flock)
--   2:8-12 (shepherds / the Shepherd-King born)
--   2:21-24 (circumcision 8th day / purification / firstborn presented — Torah kept)
--   2:39-52 (the child grew / my Father's business)
-- sort_order band base 14030, step 3.
-- ============================================================================

-- 3a. Temp view ----------------------------------------------------------------
CREATE TEMP VIEW _lk02_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1',
   'pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- 3b. cross_references rows ----------------------------------------------------
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- THREAD 1 — 2:1-7 Beth-lehem Ephratah / the manger / the tower of the flock
  ('canon','luke',2,4,'canon','micah',5,2, 'free', E'*But thou, Beth-lehem Ephratah, though thou be little among the thousands of Yahudah (Judah), yet out of thee shall he come forth unto me that is to be ruler in Yashar''el (Israel); whose goings forth have been from of old, from everlasting* (Micah 5:2). Joseph goes up *unto the city of David, which is called Bethlehem* (Luke 2:4) — and the little town the prophet named is exactly the town. The One born there is no late arrival: his *goings forth* are *from of old, from everlasting* — the Formed Son in the Father''s purpose before the foundation of the world.'),
  ('canon','luke',2,7,'canon','micah',5,4, 'free', E'*And he shall stand and feed in the strength of Yahuah (LORD), in the majesty of the name of Yahuah Elohav (the LORD his God)* (Micah 5:4). The babe *wrapped in swaddling clothes, and laid... in a manger* (Luke 2:7) is the promised Ruler who will feed the flock — and note the framing: he stands *in the strength of Yahuah*, *in the name of the LORD his God*. He is the Son who HAS a Father, doing the Father''s shepherding.'),
  ('canon','luke',2,7,'canon','micah',4,8, 'free', E'*And thou, O tower of the flock, the strong hold of the daughter of Zion, unto thee shall it come, even the first dominion; the kingdom shall come to the daughter of Jerusalem* (Micah 4:8). The *tower of the flock* — Migdal Eder — was the watchtower of the Beth-lehem shepherds. To that very place of the flock the dominion is promised; the child laid in the manger near the tower of the flock is the kingdom coming home.'),
  ('canon','luke',2,7,'canon','genesis',35,21, 'free', E'*And Yashar''el (Israel) journeyed, and spread his tent beyond the tower of Edar* (Genesis 35:21) — *and Rachel died, and was buried in the way to Ephrath, which is Beth-lehem* (Genesis 35:19). The tower of Edar (the tower of the flock) and Beth-lehem-Ephratah are joined from the days of Jacob; the manger sits where the patriarch pitched his tent and where Rachel weeps for her children — the firstborn brought forth on ground steeped in promise.'),

  -- THREAD 2 — 2:8-12 the shepherds / a Saviour, Messiah Yahuah / the Shepherd-King born
  ('canon','luke',2,11,'canon','isaiah',9,6, 'free', E'*For unto us a child is born, unto us a son is given: and the government shall be upon his shoulder: and his name shall be called Wonderful, Counsellor, El Gibbor (The mighty God), Avi-ad (The everlasting Father), Sar Shalom (The Prince of Peace)* (Isaiah 9:6). The angel''s *unto you is born this day... a Saviour, which is Messiah (Christ) Yahuah (Lord)* (Luke 2:11) is Isaiah''s child given — the Formed Son who bears the names because he perfectly reveals the invisible Father, the Prince of Peace announced over the field.'),
  ('canon','luke',2,11,'canon','isaiah',9,7, 'free', E'*Of the increase of his government and peace there shall be no end, upon the throne of David, and upon his kingdom, to order it... for ever. The zeal of Yahuah Tseva''ot (LORD of hosts) will perform this* (Isaiah 9:7). The Saviour born *in the city of David* (Luke 2:11) is the heir of David''s throne — and the everlasting kingdom is not man''s achievement but what *the zeal of Yahuah of hosts* performs.'),
  ('canon','luke',2,8,'canon','micah',5,4, 'free', E'*And he shall stand and feed in the strength of Yahuah (LORD)... and they shall abide: for now shall he be great unto the ends of the earth* (Micah 5:4). To *shepherds abiding in the field, keeping watch over their flock by night* (Luke 2:8) the Shepherd-King is first declared — the Feeder of the flock revealed to feeders of flocks. Fitting, for he is great *unto the ends of the earth*, the gathering of the scattered.'),
  ('canon','luke',2,11,'canon','ezekiel',34,23, 'free', E'*And I will set up one shepherd over them, and he shall feed them, even my servant David; he shall feed them, and he shall be their shepherd* (Ezekiel 34:23). The Father promised ONE Shepherd over a flock the false shepherds had scattered. *A Saviour... in the city of David* (Luke 2:11) is that one Shepherd born — gathering both houses, the sheep of Yahudah and the lost sheep of Yashar''el (Israel), into one fold (Romans 11: his people are not cast off but sought out).'),

  -- THREAD 3 — 2:21-24 circumcised the eighth day / purification / firstborn presented — the Torah kept
  ('canon','luke',2,21,'canon','genesis',17,12, 'free', E'*And he that is eight days old shall be circumcised among you, every man child in your generations* (Genesis 17:12) — the everlasting covenant given to Abraham. *And when eight days were accomplished for the circumcising of the child* (Luke 2:21), the holy family keeps it to the day. The covenant in the flesh is honored from the eighth day of his life; the Torah is upheld, not set aside.'),
  ('canon','luke',2,21,'canon','leviticus',12,3, 'free', E'*And in the eighth day the flesh of his foreskin shall be circumcised* (Leviticus 12:3). The same statute, repeated through Moses, is exactly what the child receives *when eight days were accomplished* (Luke 2:21). He who would say *one tittle of the law* shall not fail (Luke 16:17) begins his life kept under that very law.'),
  ('canon','luke',2,24,'canon','leviticus',12,8, 'free', E'*And if she be not able to bring a lamb, then she shall bring two turtles, or two young pigeons; the one for the burnt offering, and the other for a sin offering* (Leviticus 12:8). Mary brings *a pair of turtledoves, or two young pigeons* (Luke 2:24) — the offering of the poor, the lesser gift the Torah graciously provides. The King of Israel is presented by parents too poor for a lamb, every step *according to the law of Yahuah*.'),
  ('canon','luke',2,23,'canon','exodus',13,2, 'free', E'*Sanctify unto me all the firstborn, whatsoever openeth the womb among the children of Yashar''el (Israel), both of man and of beast: it is mine* (Exodus 13:2). Luke quotes it: *Every male that openeth the womb shall be called holy to Yahuah* (Luke 2:23). The firstborn Son is brought to the temple and given back to the Father whose he is — the Torah of the firstborn fulfilled in the flesh.'),
  ('canon','luke',2,23,'canon','exodus',13,12, 'free', E'*That thou shalt set apart unto Yahuah (LORD) all that openeth the matrix... the males shall be the LORD''S* (Exodus 13:12). The presenting of the child *to Yahuah* (Luke 2:22) is this ordinance kept. The holy family does not float above the law of Moses; they walk inside it — circumcision, purification, the firstborn set apart — the commandments standing whole at the cradle of HaMashiach.'),

  -- THREAD 4 — 2:39-52 the child grew / my Father's business
  ('canon','luke',2,52,'canon','1-samuel',2,26, 'free', E'*And the child Samuel grew on, and was in favour both with Yahuah (LORD), and also with men* (1 Samuel 2:26). Luke echoes it almost word for word: *And Yahusha (Jesus) increased in wisdom and stature, and in favour with Elohim (God) and man* (Luke 2:52). As Samuel grew before Yahuah in the house of Elohim, so the Formed Son grows in true Israelite piety, under the Torah, favored of the Father.'),
  ('canon','luke',2,49,'canon','malachi',3,1, 'free', E'*Behold, I will send my messenger... and Yahuah (Lord), whom ye seek, shall suddenly come to his temple, even the messenger of the covenant* (Malachi 3:1). When the boy says *wist ye not that I must be about my Father''s business?* (Luke 2:49) — found *in the temple* — the One who comes to his own house has come. Yet he comes as the SON who has a Father: it is the FATHER''S house, the Father''s business, the Father who sent him.'),
  ('canon','luke',2,49,'canon','psalms',27,4, 'free', E'*One thing have I desired of Yahuah (LORD), that will I seek after; that I may dwell in the house of Yahuah... and to enquire in his temple* (Psalm 27:4). The twelve-year-old''s one desire — to be *about my Father''s business* (Luke 2:49), *sitting in the midst of the doctors* in the temple — is David''s own longing fulfilled in the Son: the house of the Father is where he belongs.'),
  ('canon','luke',2,40,'canon','deuteronomy',6,7, 'free', E'*And thou shalt teach them diligently unto thy children... when thou sittest in thine house, and when thou walkest by the way* (Deuteronomy 6:7). That *the child grew, and waxed strong in spirit, filled with wisdom* (Luke 2:40) is the Torah''s own pattern bearing fruit — a son raised in the words of Yahuah, growing in the wisdom the Shema commands parents to plant.'),
  ('canon','luke',2,40,'canon','proverbs',4,4, 'free', E'*He taught me also, and said unto me, Let thine heart retain my words: keep my commandments, and live* (Proverbs 4:4) — *I was my father''s son, tender and only beloved* (Proverbs 4:3). The boy *filled with wisdom* (Luke 2:40) is the beloved Son raised in the father-to-son handing-down of Torah; the One who keeps the commandments and lives, then turns to be about his FATHER''S business.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _lk02_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _lk02_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- 3c. Threads -----------------------------------------------------------------
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'luke-2-beth-lehem-ephratah-and-the-tower-of-the-flock-micah-5-2-genesis-35',
       E'Out of Beth-lehem Ephratah, by the tower of the flock (Micah 5:2; Genesis 35)',
       E'Caesar''s decree drives Joseph *unto the city of David, which is called Bethlehem* (Luke 2:4), and there *she brought forth her firstborn son, and... laid him in a manger; because there was no room for them in the inn* (Luke 2:7). The empire thinks it is taxing the world; it is fulfilling a prophet. **Micah 5:2** named the town centuries before: *But thou, Beth-lehem Ephratah, though thou be little among the thousands of Yahudah (Judah), yet out of thee shall he come forth unto me that is to be ruler in Yashar''el (Israel); whose goings forth have been from of old, from everlasting.* The little town; the Ruler; and a One whose *goings forth* are *from everlasting* — the Formed Son already in the Father''s purpose before ever he is laid in the straw. **Micah 5:4** tells what he comes to do: *And he shall stand and feed in the strength of Yahuah (LORD), in the majesty of the name of Yahuah Elohav (the LORD his God)* — the Son who shepherds *in the strength* and *in the name* of his God, not apart from the Father. And the place is no accident. **Micah 4:8**: *And thou, O tower of the flock, the strong hold of the daughter of Zion, unto thee shall it come, even the first dominion; the kingdom shall come to the daughter of Jerusalem.* The *tower of the flock* — Migdal Eder — was the shepherds'' watchtower by Beth-lehem; to the place of the flock the dominion is promised. And it is ancient ground: **Genesis 35:21** — *And Yashar''el (Israel) journeyed, and spread his tent beyond the tower of Edar* — hard by where *Rachel died, and was buried in the way to Ephrath, which is Beth-lehem* (Genesis 35:19). The manger lies where Jacob pitched his tent and where Rachel weeps for her children; the firstborn comes forth on soil soaked in promise. Come and see: the library is one, and it ain''t new.',
       sv.verse_id, ev.verse_id, 'free', 14030
  FROM _lk02_lookup sv, _lk02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=2 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='luke' AND ev.chapter_number=2 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'luke-2-good-tidings-to-the-shepherds-the-shepherd-king-born-isaiah-9-ezekiel-34',
       E'Good tidings to the shepherds: the Shepherd-King is born (Isaiah 9; Ezekiel 34)',
       E'The first to hear are the lowest: *there were in the same country shepherds abiding in the field, keeping watch over their flock by night* (Luke 2:8), and to them the word comes — *For unto you is born this day in the city of David a Saviour, which is Messiah (Christ) Yahuah (Lord)* (Luke 2:11). **Isaiah 9:6** is the child announced: *For unto us a child is born, unto us a son is given: and the government shall be upon his shoulder: and his name shall be called Wonderful, Counsellor, El Gibbor (The mighty God), Avi-ad (The everlasting Father), Sar Shalom (The Prince of Peace).* The Formed Son bears these great names because he perfectly images and reveals the invisible Father — the Prince of Peace declared over the night field. **Isaiah 9:7**: *Of the increase of his government and peace there shall be no end, upon the throne of David, and upon his kingdom... for ever. The zeal of Yahuah Tseva''ot (LORD of hosts) will perform this* — the everlasting throne is not man''s work but the Father''s zeal accomplishing it. Why shepherds? Because a Shepherd is born. **Micah 5:4**: *And he shall stand and feed in the strength of Yahuah (LORD)... for now shall he be great unto the ends of the earth.* And **Ezekiel 34:23** gives the deepest root: *And I will set up one shepherd over them, and he shall feed them, even my servant David; he shall feed them, and he shall be their shepherd.* The Father had promised ONE Shepherd over a flock the false shepherds scattered; now that one Shepherd is born in the city of David — gathering Yahudah and the lost sheep of Yashar''el (Israel) into one fold. His people are not cast off; they are sought out and fed (Romans 11:1-2). Come and see how the whole library leans toward this manger.',
       sv.verse_id, ev.verse_id, 'free', 14033
  FROM _lk02_lookup sv, _lk02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=2 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='luke' AND ev.chapter_number=2 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'luke-2-circumcised-the-eighth-day-purified-and-presented-the-torah-kept-genesis-17-leviticus-12-exodus-13',
       E'Circumcised the eighth day, purified, the firstborn presented — the Torah kept (Genesis 17; Leviticus 12; Exodus 13)',
       E'Watch the holy family obey the Torah, point by point. *And when eight days were accomplished for the circumcising of the child, his name was called Yahusha (JESUS)* (Luke 2:21); *and when the days of her purification according to the law of Moses were accomplished, they brought him to Jerusalem, to present him to Yahuah (Lord)* (Luke 2:22), *to offer a sacrifice according to that which is said in the law of Yahuah (Lord), A pair of turtledoves, or two young pigeons* (Luke 2:24). Every move is *according to the law.* The circumcision keeps the Abrahamic covenant — **Genesis 17:12**: *And he that is eight days old shall be circumcised among you, every man child in your generations* — and the Mosaic restatement — **Leviticus 12:3**: *And in the eighth day the flesh of his foreskin shall be circumcised.* The offering is the poor woman''s allowance — **Leviticus 12:8**: *And if she be not able to bring a lamb, then she shall bring two turtles, or two young pigeons; the one for the burnt offering, and the other for a sin offering* — the King of Israel presented by parents too poor for a lamb. And the presenting itself fulfills the law of the firstborn. Luke quotes it: *Every male that openeth the womb shall be called holy to Yahuah* (Luke 2:23) — straight from **Exodus 13:2**: *Sanctify unto me all the firstborn, whatsoever openeth the womb among the children of Yashar''el (Israel)... it is mine*; and **Exodus 13:12**: *That thou shalt set apart unto Yahuah (LORD) all that openeth the matrix... the males shall be the LORD''S.* The firstborn Son is given back to the Father whose he is. Here is the answer to every claim that grace abolishes the law: the Messiah''s own infancy is lived inside the Torah — circumcision, purification, firstborn set apart — *it is easier for heaven and earth to pass, than one tittle of the law to fail* (Luke 16:17). Come and see: the commandments stand whole at the cradle of HaMashiach.',
       sv.verse_id, ev.verse_id, 'free', 14036
  FROM _lk02_lookup sv, _lk02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=2 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='luke' AND ev.chapter_number=2 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'luke-2-the-child-grew-and-my-fathers-business-1-samuel-2-malachi-3',
       E'The child grew, and I must be about my Father''s business (1 Samuel 2; Malachi 3)',
       E'Luke closes the infancy with growth and the first recorded words of the Son. *And the child grew, and waxed strong in spirit, filled with wisdom: and the grace of Elohim (God) was upon him* (Luke 2:40); and again, *And Yahusha (Jesus) increased in wisdom and stature, and in favour with Elohim (God) and man* (Luke 2:52). That is **1 Samuel 2:26** lived out: *And the child Samuel grew on, and was in favour both with Yahuah (LORD), and also with men* — the Formed Son growing in true Israelite piety, raised under the Torah. For that is how a covenant child is raised — **Deuteronomy 6:7**: *And thou shalt teach them diligently unto thy children... when thou sittest in thine house, and when thou walkest by the way* — and **Proverbs 4:4**: *He taught me also, and said unto me, Let thine heart retain my words: keep my commandments, and live*, the word of a father to *his father''s son, tender and only beloved* (Proverbs 4:3). Then at twelve, in the temple *sitting in the midst of the doctors* (Luke 2:46), he answers his mother: *wist ye not that I must be about my Father''s business?* (Luke 2:49). Mark the word — **my Father''s**. He is the Son who HAS a Father; the temple is the FATHER''S house, the business the Father''s, the will the Father''s. **Malachi 3:1** had said the moment would come: *and Yahuah (Lord), whom ye seek, shall suddenly come to his temple, even the messenger of the covenant* — the One who comes to his own house comes as the obedient Son. And his longing is David''s longing fulfilled — **Psalm 27:4**: *One thing have I desired of Yahuah (LORD), that will I seek after; that I may dwell in the house of Yahuah... and to enquire in his temple.* Come and see the boy who already knows the Father, growing up inside the Father''s law.',
       sv.verse_id, ev.verse_id, 'free', 14039
  FROM _lk02_lookup sv, _lk02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=2 AND sv.verse_number=39
   AND ev.edition_slug='canon' AND ev.book_slug='luke' AND ev.chapter_number=2 AND ev.verse_number=52
ON CONFLICT (slug) DO NOTHING;

-- 3d. Thread members ----------------------------------------------------------
-- THREAD 1 — 2:1-7
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Micah 5:2 — *out of thee shall he come forth... whose goings forth have been from of old, from everlasting* — the foretold birthplace and the Son from everlasting in the Father''s purpose.'
  FROM cross_reference_threads t, cross_references x, _lk02_lookup sv, _lk02_lookup tv
 WHERE t.slug='luke-2-beth-lehem-ephratah-and-the-tower-of-the-flock-micah-5-2-genesis-35'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=2 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=5 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Micah 5:4 — *he shall stand and feed in the strength of Yahuah... in the name of the LORD his God* — the Shepherd-Ruler who shepherds in the Father''s strength.'
  FROM cross_reference_threads t, cross_references x, _lk02_lookup sv, _lk02_lookup tv
 WHERE t.slug='luke-2-beth-lehem-ephratah-and-the-tower-of-the-flock-micah-5-2-genesis-35'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=2 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=5 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Micah 4:8 — *O tower of the flock... unto thee shall it come, even the first dominion* — Migdal Eder, the shepherds'' tower by Beth-lehem, where the kingdom comes home.'
  FROM cross_reference_threads t, cross_references x, _lk02_lookup sv, _lk02_lookup tv
 WHERE t.slug='luke-2-beth-lehem-ephratah-and-the-tower-of-the-flock-micah-5-2-genesis-35'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=2 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=4 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 35:21 — *Israel... spread his tent beyond the tower of Edar* (and Rachel buried in the way to Ephrath, v.19) — the manger on the ancient ground of Jacob and Rachel.'
  FROM cross_reference_threads t, cross_references x, _lk02_lookup sv, _lk02_lookup tv
 WHERE t.slug='luke-2-beth-lehem-ephratah-and-the-tower-of-the-flock-micah-5-2-genesis-35'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=2 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=35 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 — 2:8-12
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 9:6 — *unto us a child is born... his name shall be called Wonderful, Counsellor, El Gibbor, Avi-ad, Sar Shalom* — the child announced, the Formed Son who reveals the Father.'
  FROM cross_reference_threads t, cross_references x, _lk02_lookup sv, _lk02_lookup tv
 WHERE t.slug='luke-2-good-tidings-to-the-shepherds-the-shepherd-king-born-isaiah-9-ezekiel-34'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=2 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=9 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 9:7 — *of the increase of his government... no end, upon the throne of David... the zeal of Yahuah of hosts will perform this* — the everlasting Davidic throne the Father accomplishes.'
  FROM cross_reference_threads t, cross_references x, _lk02_lookup sv, _lk02_lookup tv
 WHERE t.slug='luke-2-good-tidings-to-the-shepherds-the-shepherd-king-born-isaiah-9-ezekiel-34'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=2 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=9 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Micah 5:4 — *he shall stand and feed... he shall be great unto the ends of the earth* — why a Shepherd is born is told to shepherds in the field.'
  FROM cross_reference_threads t, cross_references x, _lk02_lookup sv, _lk02_lookup tv
 WHERE t.slug='luke-2-good-tidings-to-the-shepherds-the-shepherd-king-born-isaiah-9-ezekiel-34'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=2 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=5 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ezekiel 34:23 — *I will set up one shepherd over them... even my servant David* — the one Shepherd promised over the scattered flock, born to gather both houses (Rom 11 guard).'
  FROM cross_reference_threads t, cross_references x, _lk02_lookup sv, _lk02_lookup tv
 WHERE t.slug='luke-2-good-tidings-to-the-shepherds-the-shepherd-king-born-isaiah-9-ezekiel-34'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=2 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=34 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 — 2:21-24
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 17:12 — *he that is eight days old shall be circumcised* — the Abrahamic covenant kept to the day.'
  FROM cross_reference_threads t, cross_references x, _lk02_lookup sv, _lk02_lookup tv
 WHERE t.slug='luke-2-circumcised-the-eighth-day-purified-and-presented-the-torah-kept-genesis-17-leviticus-12-exodus-13'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=2 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 12:3 — *in the eighth day the flesh of his foreskin shall be circumcised* — the same statute through Moses, exactly observed.'
  FROM cross_reference_threads t, cross_references x, _lk02_lookup sv, _lk02_lookup tv
 WHERE t.slug='luke-2-circumcised-the-eighth-day-purified-and-presented-the-torah-kept-genesis-17-leviticus-12-exodus-13'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=2 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=12 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 12:8 — *two turtles, or two young pigeons* — the offering of the poor; the King presented by parents too poor for a lamb.'
  FROM cross_reference_threads t, cross_references x, _lk02_lookup sv, _lk02_lookup tv
 WHERE t.slug='luke-2-circumcised-the-eighth-day-purified-and-presented-the-torah-kept-genesis-17-leviticus-12-exodus-13'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=2 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=12 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Exodus 13:2 — *Sanctify unto me all the firstborn... it is mine* — the law Luke 2:23 quotes; the firstborn Son given back to the Father.'
  FROM cross_reference_threads t, cross_references x, _lk02_lookup sv, _lk02_lookup tv
 WHERE t.slug='luke-2-circumcised-the-eighth-day-purified-and-presented-the-torah-kept-genesis-17-leviticus-12-exodus-13'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=2 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=13 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Exodus 13:12 — *set apart unto Yahuah all that openeth the matrix... the males shall be the LORD''S* — the presenting of the firstborn fulfilled, the Torah standing whole at the cradle.'
  FROM cross_reference_threads t, cross_references x, _lk02_lookup sv, _lk02_lookup tv
 WHERE t.slug='luke-2-circumcised-the-eighth-day-purified-and-presented-the-torah-kept-genesis-17-leviticus-12-exodus-13'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=2 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=13 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 — 2:39-52
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Samuel 2:26 — *the child Samuel grew on, and was in favour both with Yahuah, and also with men* — Luke 2:52 echoes it; the Son grows in Israelite piety under the Torah.'
  FROM cross_reference_threads t, cross_references x, _lk02_lookup sv, _lk02_lookup tv
 WHERE t.slug='luke-2-the-child-grew-and-my-fathers-business-1-samuel-2-malachi-3'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=2 AND sv.verse_number=52
   AND tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=2 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Malachi 3:1 — *Yahuah, whom ye seek, shall suddenly come to his temple, even the messenger of the covenant* — the One in his Father''s house is the promised coming to the temple, as the obedient Son.'
  FROM cross_reference_threads t, cross_references x, _lk02_lookup sv, _lk02_lookup tv
 WHERE t.slug='luke-2-the-child-grew-and-my-fathers-business-1-samuel-2-malachi-3'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=2 AND sv.verse_number=49
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=3 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 27:4 — *one thing have I desired... that I may dwell in the house of Yahuah... and to enquire in his temple* — David''s longing fulfilled in the boy in his Father''s house.'
  FROM cross_reference_threads t, cross_references x, _lk02_lookup sv, _lk02_lookup tv
 WHERE t.slug='luke-2-the-child-grew-and-my-fathers-business-1-samuel-2-malachi-3'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=2 AND sv.verse_number=49
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=27 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Deuteronomy 6:7 — *teach them diligently unto thy children* — the Shema''s command to raise a child in the words of Yahuah, bearing fruit as the child grew filled with wisdom.'
  FROM cross_reference_threads t, cross_references x, _lk02_lookup sv, _lk02_lookup tv
 WHERE t.slug='luke-2-the-child-grew-and-my-fathers-business-1-samuel-2-malachi-3'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=2 AND sv.verse_number=40
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Proverbs 4:4 — *Let thine heart retain my words: keep my commandments, and live* — the father-to-son handing-down of Torah to the beloved son.'
  FROM cross_reference_threads t, cross_references x, _lk02_lookup sv, _lk02_lookup tv
 WHERE t.slug='luke-2-the-child-grew-and-my-fathers-business-1-samuel-2-malachi-3'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=2 AND sv.verse_number=40
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_luke_04.sql -----
-- minion_luke_04.sql — Luke 4 NT-depth cross-references (THIN-ADD: 4 NEW threads)
-- DEDUP: 4:16 (nazareth-scroll) and 4:25 (elijah/elisha mercy contrast) ALREADY exist — NOT re-anchored.
-- Threads: 4:1-13 temptation answered with Torah; 4:31-37 unclean devil/Holy One (Watchers);
--          4:38-41 the Healer of Israel; 4:42-44 sent to preach the kingdom.

-- ============================================================ 3a. TEMP VIEW
CREATE TEMP VIEW _lk04_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1',
   'pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================================================ 3b. CROSS_REFERENCES
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- THREAD 1: 4:1-13 the temptation answered with the Torah (Deuteronomy)
  ('canon','luke',4,4,'canon','deuteronomy',8,3, 'free', E'*And he humbled thee, and suffered thee to hunger, and fed thee with manna... that he might make thee know that man doth not live by bread only, but by every word that proceedeth out of the mouth of Yahuah (LORD) doth man live* (Deuteronomy 8:3). The Son in the wilderness, forty days hungered (as Yashar''el was forty years humbled and hungered), parries the first blow with the very verse spoken to Israel — the new Israel doing what the old failed to do. The Word IS his bread.'),
  ('canon','luke',4,8,'canon','deuteronomy',6,13, 'free', E'*Thou shalt fear Yahuah Elohayka (the LORD thy God), and serve him, and shalt swear by his name* (Deuteronomy 6:13). When the devil claims the kingdoms and demands worship, the Son answers *it is written* — worship is owed to Yahuah ALONE. He will not seize the kingdoms by another hand; he will receive them FROM the Father in the Father''s way.'),
  ('canon','luke',4,12,'canon','deuteronomy',6,16, 'free', E'*Ye shall not tempt Yahuah Elohaychem (the LORD your God), as ye tempted him in Massah* (Deuteronomy 6:16). The third blow turned aside with the third word from Deuteronomy. Where Israel tempted Yahuah at Massah, the faithful Son will not put his Father to the test — he trusts, he does not provoke.'),
  ('canon','luke',4,10,'canon','psalms',91,11, 'free', E'*For he shall give his angels charge over thee, to keep thee in all thy ways* (Psalm 91:11). The devil himself can quote scripture — he hurls this very promise (and v.12, *they shall bear thee up... lest thou dash thy foot against a stone*) to bait the Son into reckless presumption. But the psalm guards *all thy ways*, the path of obedience, not a leap off the pinnacle. The Son reads the whole counsel rightly; the tempter twists it.'),

  -- THREAD 2: 4:31-37 the unclean devil cries out — the Holy One of Elohim
  ('canon','luke',4,34,'canon','psalms',89,18, 'free', E'*For Yahuah (LORD) is our defence; and the Holy One of Yashar''el (Israel) is our king* (Psalm 89:18). The unclean spirit names what the synagogue will not — *the Holy One of Elohim*. The very title the psalms set upon Yahuah''s anointed King is wrung out of a demon''s mouth in terror.'),
  ('canon','luke',4,35,'canon','isaiah',35,4, 'free', E'*Say to them that are of a fearful heart, Be strong, fear not: behold, your Elohim (God) will come with vengeance... he will come and save you* (Isaiah 35:4). Isaiah promised that when Elohim came he would come to SAVE — and the next verse opens blind eyes and deaf ears. In the Formed Son that coming is here, with authority over the unclean spirits.'),
  ('canon','luke',4,36,'canon','zechariah',13,2, 'free', E'*I will cause the prophets and the unclean spirit to pass out of the land* (Zechariah 13:2). Zechariah foretold the day Yahuah would purge the unclean spirit from the land; here, with a word, that cleansing begins — *with authority and power he commandeth the unclean spirits, and they come out.*'),
  ('canon','luke',4,34,'enoch','1-enoch',15,8, 'extras', E'*As for the spirits of heaven, in heaven shall be their dwelling, but as for the spirits of the earth which were born upon the earth, on the earth shall be their dwelling* (1 Enoch 15:8). Enoch names the origin of the unclean spirits: they are the disembodied spirits of the giants, the offspring of the fallen Watchers, loosed upon the earth. This is the *unclean devil* the Son confronts.'),
  ('canon','luke',4,35,'enoch','1-enoch',15,9, 'extras', E'*And the spirits of the giants afflict, oppress, destroy, attack, do battle, and work destruction on the earth, and cause trouble* (1 Enoch 15:9). The afflicting spirit that seized the man is exactly what Enoch described — and it knows its Judge. When the Holy One of Elohim commands, the bound offspring of the Watchers must obey; the sentence already gone forth against them stands.'),

  -- THREAD 3: 4:38-41 the Healer of Israel — devils confess what men will not
  ('canon','luke',4,39,'canon','psalms',103,3, 'free', E'*Who forgiveth all thine iniquities; who healeth all thy diseases* (Psalm 103:3). The psalm joins forgiving and healing as one mercy of Yahuah; the Son rebukes the fever and it leaves her, doing the Father''s own healing work — the benefits of Yahuah made flesh and present.'),
  ('canon','luke',4,40,'canon','exodus',15,26, 'free', E'*If thou wilt diligently hearken to the voice of Yahuah Elohayka... I will put none of these diseases upon thee... for I am Yahuah Rapha (the LORD that healeth thee)* (Exodus 15:26). At the bitter waters Yahuah revealed himself as Israel''s Healer, and bound that healing to keeping his statutes. As the sun sets, the Healer of Israel lays hands on every one and heals them — the same Yahuah Rapha, now near.'),
  ('canon','luke',4,41,'canon','isaiah',53,4, 'free', E'*Surely he hath borne our griefs, and carried our sorrows: yet we did esteem him stricken, smitten of Elohim (God), and afflicted* (Isaiah 53:4). The Servant who heals does so by bearing — he takes the sicknesses he lifts away. The devils cry *Thou art Messiah the Son of Elohim*, confessing aloud what the men of Nazareth would not; he silences them, for the testimony of the kingdom is not theirs to give.'),

  -- THREAD 4: 4:42-44 I must preach the kingdom — for therefore am I sent
  ('canon','luke',4,43,'canon','isaiah',61,1, 'free', E'*The Spirit of Adonai Yahuah (the Lord GOD) is upon me; because Yahuah (LORD) hath anointed me to preach good tidings unto the meek; he hath sent me to bind up the brokenhearted, to proclaim liberty to the captives* (Isaiah 61:1). The scroll he had just read in Nazareth (v.18) is now the shape of his whole mission — *therefore am I sent.* The Anointed One does the anointed work: to PREACH, in city after city.'),
  ('canon','luke',4,43,'canon','isaiah',52,7, 'free', E'*How beautiful upon the mountains are the feet of him that bringeth good tidings... that saith unto Zion, Thy Elohim (God) reigneth!* (Isaiah 52:7). The kingdom-tidings the Son must carry to other cities is exactly this herald''s cry — *thy Elohim reigneth.* He goes from town to town as the publisher of peace, announcing the reign.'),
  ('canon','luke',4,44,'canon','psalms',96,2, 'free', E'*Sing unto Yahuah (LORD), bless his name; shew forth his salvation from day to day* (Psalm 96:2). To preach the kingdom in synagogue after synagogue is to do what the psalm commands — to shew forth his salvation from day to day, that the Name be blessed in every place.'),
  ('canon','luke',4,44,'canon','psalms',96,3, 'free', E'*Declare his glory among the heathen, his wonders among all people* (Psalm 96:3). The salvation is not to be hoarded in one town; the same psalm sends it out to all peoples. *I must preach the kingdom of Elohim to other cities also* — the glory of Yahuah declared abroad, the gathering reaching out.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _lk04_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _lk04_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================================================ 3c. THREADS
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'luke-4-the-temptation-answered-with-the-torah-deuteronomy-8-and-6',
       E'It is written: the temptation answered with the Torah (Deuteronomy 8; 6)',
       E'Led by the Ruach into the wilderness, *forty days tempted of the devil* (Luke 4:2), the Formed Son walks the path Yashar''el walked — forty days as they had forty years, hungered and proven — and where the old Israel fell, the faithful Son stands. His one weapon, drawn three times, is the **Torah**: *it is written.*

To the bread-test: *It is written, That man shall not live by bread alone, but by every word of Elohim* (Luke 4:4) — straight from *that he might make thee know that man doth not live by bread only, but by every word that proceedeth out of the mouth of Yahuah (LORD) doth man live* (Deuteronomy 8:3). The Word is his bread.

To the kingdoms-and-worship test: *it is written, Thou shalt worship Yahuah Elohayka (the Lord thy God), and him only shalt thou serve* (Luke 4:8) — *Thou shalt fear Yahuah Elohayka (the LORD thy God), and serve him* (Deuteronomy 6:13). He will receive the kingdoms FROM the Father, never by bending to another.

To the pinnacle test the devil himself quotes scripture — *He shall give his angels charge over thee, to keep thee* (Psalm 91:11, with v.12) — twisting a promise that guards *all thy ways*, the way of obedience, into a dare to leap. The Son answers with the word that ends the matter: *It is said, Thou shalt not tempt Yahuah Elohayka* (Luke 4:12) — *Ye shall not tempt Yahuah Elohaychem... as ye tempted him in Massah* (Deuteronomy 6:16).

Three temptations, three words from Deuteronomy. The Son who HAS a Father does not abolish the Torah; he wields it, and lives by it, and overcomes by it — the Torah upheld, the tempter put to flight *for a season.*',
       sv.verse_id, ev.verse_id, 'free', 14090
  FROM _lk04_lookup sv, _lk04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=4 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='luke' AND ev.chapter_number=4 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'luke-4-the-unclean-devil-and-the-holy-one-of-elohim-1-enoch-15',
       E'The unclean devil cries out: the Holy One of Elohim (Zechariah 13; 1 Enoch 15)',
       E'In the Capernaum synagogue *there was a man, which had a spirit of an unclean devil* (Luke 4:33), and the spirit shrieks the truth the worshippers withhold: *I know thee who thou art; the Holy One of Elohim* (Luke 4:34). The very title the psalms lay on Yahuah''s anointed King — *Yahuah (LORD) is our defence; and the Holy One of Yashar''el (Israel) is our king* (Psalm 89:18) — is torn from a demon''s mouth in dread.

What IS this unclean devil? Enoch tells us its origin: the disembodied spirits of the giants, the offspring of the fallen Watchers, loosed upon the earth — *As for the spirits of heaven, in heaven shall be their dwelling, but as for the spirits of the earth which were born upon the earth, on the earth shall be their dwelling* (1 Enoch 15:8), and *the spirits of the giants afflict, oppress, destroy, attack, do battle, and work destruction on the earth, and cause trouble* (1 Enoch 15:9). These are the afflicting spirits — and they know their Judge.

Isaiah had promised that when Elohim came, he would come to SAVE: *behold, your Elohim (God) will come with vengeance... he will come and save you* (Isaiah 35:4) — and so he does, with authority over the unclean. And Zechariah foretold the very purging now begun: *I will cause the prophets and the unclean spirit to pass out of the land* (Zechariah 13:2). With one word the Formed Son commands, *Hold thy peace, and come out of him*, and the bound spawn of the Watchers must obey: *with authority and power he commandeth the unclean spirits, and they come out* (Luke 4:36). The sentence already gone forth against them stands; the Holy One subdues them.',
       sv.verse_id, ev.verse_id, 'extras', 14093
  FROM _lk04_lookup sv, _lk04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=4 AND sv.verse_number=33
   AND ev.edition_slug='canon' AND ev.book_slug='luke' AND ev.chapter_number=4 AND ev.verse_number=37
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'luke-4-the-healer-of-yisrael-exodus-15-and-isaiah-53',
       E'The Healer of Israel: who healeth all thy diseases (Exodus 15; Isaiah 53)',
       E'He leaves the synagogue for Simon''s house, where the wife''s mother lies *taken with a great fever* — *and he stood over her, and rebuked the fever; and it left her: and immediately she arose and ministered unto them* (Luke 4:39). As the sun sets the whole town brings its sick, and *he laid his hands on every one of them, and healed them* (Luke 4:40).

This is no new thing under the sun. The psalm joins forgiving and healing in one mercy of Yahuah: *Who forgiveth all thine iniquities; who healeth all thy diseases* (Psalm 103:3). And at the bitter waters Yahuah named himself Israel''s Physician — *If thou wilt diligently hearken to the voice of Yahuah Elohayka... I will put none of these diseases upon thee... for I am Yahuah Rapha (the LORD that healeth thee)* (Exodus 15:26). The Healer of Israel is here, doing the Father''s own work in the Formed Son.

And how does he heal? By bearing: *Surely he hath borne our griefs, and carried our sorrows* (Isaiah 53:4) — the Servant lifts away what he himself takes up. Meanwhile *devils also came out of many, crying out... Thou art Messiah (Christ) the Son of Elohim* (Luke 4:41) — confessing aloud what the men of Nazareth refused; but he *suffered them not to speak*, for the witness to the kingdom is not the demons'' to bear.',
       sv.verse_id, ev.verse_id, 'free', 14096
  FROM _lk04_lookup sv, _lk04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=4 AND sv.verse_number=38
   AND ev.edition_slug='canon' AND ev.book_slug='luke' AND ev.chapter_number=4 AND ev.verse_number=41
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'luke-4-i-must-preach-the-kingdom-for-therefore-am-i-sent-isaiah-61-and-52',
       E'I must preach the kingdom: for therefore am I sent (Isaiah 61; 52)',
       E'When the people of Capernaum would have kept him, he answers with the heart of his whole calling: *I must preach the kingdom of Elohim (God) to other cities also: for therefore am I sent* (Luke 4:43). The scroll he had opened in Nazareth now becomes the shape of his every step: *The Spirit of Adonai Yahuah (the Lord GOD) is upon me; because Yahuah (LORD) hath anointed me to preach good tidings unto the meek; he hath sent me to bind up the brokenhearted, to proclaim liberty to the captives* (Isaiah 61:1). The Anointed One does the anointed work — to PREACH.

And the tidings are a King''s reign announced: *How beautiful upon the mountains are the feet of him that bringeth good tidings... that saith unto Zion, Thy Elohim (God) reigneth!* (Isaiah 52:7). City after city, the herald''s cry goes out.

The psalm gives the same charge twice over — first inward, then outward: *Sing unto Yahuah (LORD), bless his name; shew forth his salvation from day to day* (Psalm 96:2), and *Declare his glory among the heathen, his wonders among all people* (Psalm 96:3). The salvation is not to be penned in one town; it is to be carried abroad. So the sent Son preaches *in the synagogues of Galilee* — the kingdom-tidings reaching out, the gathering begun.',
       sv.verse_id, ev.verse_id, 'free', 14099
  FROM _lk04_lookup sv, _lk04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=4 AND sv.verse_number=42
   AND ev.edition_slug='canon' AND ev.book_slug='luke' AND ev.chapter_number=4 AND ev.verse_number=44
ON CONFLICT (slug) DO NOTHING;

-- ============================================================ 3d. THREAD MEMBERS
-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 8:3 — *man doth not live by bread only, but by every word that proceedeth out of the mouth of Yahuah... doth man live.* The Son''s first answer; the Word is his bread.'
  FROM cross_reference_threads t, cross_references x, _lk04_lookup sv, _lk04_lookup tv
 WHERE t.slug='luke-4-the-temptation-answered-with-the-torah-deuteronomy-8-and-6'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=4 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=8 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 6:13 — *Thou shalt fear Yahuah Elohayka... and serve him.* Worship belongs to Yahuah alone; the kingdoms come from the Father, not the tempter.'
  FROM cross_reference_threads t, cross_references x, _lk04_lookup sv, _lk04_lookup tv
 WHERE t.slug='luke-4-the-temptation-answered-with-the-torah-deuteronomy-8-and-6'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=4 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 6:16 — *Ye shall not tempt Yahuah... as ye tempted him in Massah.* The faithful Son trusts the Father; he will not provoke him.'
  FROM cross_reference_threads t, cross_references x, _lk04_lookup sv, _lk04_lookup tv
 WHERE t.slug='luke-4-the-temptation-answered-with-the-torah-deuteronomy-8-and-6'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=4 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 91:11 — *he shall give his angels charge over thee, to keep thee* (with v.12). The devil''s own misquote: a promise guarding *all thy ways* twisted into a dare to leap. Scripture rightly read vs. scripture wrenched.'
  FROM cross_reference_threads t, cross_references x, _lk04_lookup sv, _lk04_lookup tv
 WHERE t.slug='luke-4-the-temptation-answered-with-the-torah-deuteronomy-8-and-6'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=4 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=91 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 89:18 — *the Holy One of Yashar''el (Israel) is our king.* The demon shrieks the King''s own title — *the Holy One of Elohim* — that the synagogue withholds.'
  FROM cross_reference_threads t, cross_references x, _lk04_lookup sv, _lk04_lookup tv
 WHERE t.slug='luke-4-the-unclean-devil-and-the-holy-one-of-elohim-1-enoch-15'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=4 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=89 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 35:4 — *your Elohim will come... he will come and save you.* When Elohim comes he comes to SAVE, with authority over the unclean.'
  FROM cross_reference_threads t, cross_references x, _lk04_lookup sv, _lk04_lookup tv
 WHERE t.slug='luke-4-the-unclean-devil-and-the-holy-one-of-elohim-1-enoch-15'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=4 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=35 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Zechariah 13:2 — *I will cause... the unclean spirit to pass out of the land.* The foretold purging begins with a word.'
  FROM cross_reference_threads t, cross_references x, _lk04_lookup sv, _lk04_lookup tv
 WHERE t.slug='luke-4-the-unclean-devil-and-the-holy-one-of-elohim-1-enoch-15'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=4 AND sv.verse_number=36
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=13 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 15:8 — the spirits of the earth dwell on the earth. The origin of the *unclean devil*: the disembodied spirits of the giants, offspring of the fallen Watchers.'
  FROM cross_reference_threads t, cross_references x, _lk04_lookup sv, _lk04_lookup tv
 WHERE t.slug='luke-4-the-unclean-devil-and-the-holy-one-of-elohim-1-enoch-15'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=4 AND sv.verse_number=34
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=15 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Enoch 15:9 — *the spirits of the giants afflict, oppress, destroy...* The afflicting spirit Enoch named; it knows its Judge and must obey the Holy One.'
  FROM cross_reference_threads t, cross_references x, _lk04_lookup sv, _lk04_lookup tv
 WHERE t.slug='luke-4-the-unclean-devil-and-the-holy-one-of-elohim-1-enoch-15'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=4 AND sv.verse_number=35
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=15 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 103:3 — *Who forgiveth all thine iniquities; who healeth all thy diseases.* Forgiving and healing, one mercy of Yahuah, made present in the Son.'
  FROM cross_reference_threads t, cross_references x, _lk04_lookup sv, _lk04_lookup tv
 WHERE t.slug='luke-4-the-healer-of-yisrael-exodus-15-and-isaiah-53'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=4 AND sv.verse_number=39
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=103 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 15:26 — *I am Yahuah Rapha (the LORD that healeth thee).* At the bitter waters Yahuah named himself Israel''s Physician; the Healer is now near.'
  FROM cross_reference_threads t, cross_references x, _lk04_lookup sv, _lk04_lookup tv
 WHERE t.slug='luke-4-the-healer-of-yisrael-exodus-15-and-isaiah-53'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=4 AND sv.verse_number=40
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=15 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 53:4 — *Surely he hath borne our griefs, and carried our sorrows.* The Servant heals by bearing; the devils confess *the Son of Elohim* but are silenced.'
  FROM cross_reference_threads t, cross_references x, _lk04_lookup sv, _lk04_lookup tv
 WHERE t.slug='luke-4-the-healer-of-yisrael-exodus-15-and-isaiah-53'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=4 AND sv.verse_number=41
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 61:1 — *the Spirit of Adonai Yahuah is upon me; because Yahuah hath anointed me to preach good tidings.* The Nazareth scroll becomes the shape of his whole mission.'
  FROM cross_reference_threads t, cross_references x, _lk04_lookup sv, _lk04_lookup tv
 WHERE t.slug='luke-4-i-must-preach-the-kingdom-for-therefore-am-i-sent-isaiah-61-and-52'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=4 AND sv.verse_number=43
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=61 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 52:7 — *that saith unto Zion, Thy Elohim reigneth!* The kingdom-tidings are a King''s reign announced, city after city.'
  FROM cross_reference_threads t, cross_references x, _lk04_lookup sv, _lk04_lookup tv
 WHERE t.slug='luke-4-i-must-preach-the-kingdom-for-therefore-am-i-sent-isaiah-61-and-52'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=4 AND sv.verse_number=43
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=52 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 96:2 — *shew forth his salvation from day to day.* To preach in synagogue after synagogue is to do exactly this — the Name blessed in every place.'
  FROM cross_reference_threads t, cross_references x, _lk04_lookup sv, _lk04_lookup tv
 WHERE t.slug='luke-4-i-must-preach-the-kingdom-for-therefore-am-i-sent-isaiah-61-and-52'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=4 AND sv.verse_number=44
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=96 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 96:3 — *Declare his glory among the heathen.* The salvation is carried abroad, not penned in one town; the gathering reaches out.'
  FROM cross_reference_threads t, cross_references x, _lk04_lookup sv, _lk04_lookup tv
 WHERE t.slug='luke-4-i-must-preach-the-kingdom-for-therefore-am-i-sent-isaiah-61-and-52'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=4 AND sv.verse_number=44
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=96 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_luke_11.sql -----
-- ============================================================================
-- minion_luke_11.sql — Luke 11 NT-depth cross-reference threads (THIN-ADD)
-- 4 NEW threads. DEDUP: do NOT re-anchor 11:37 or 11:42 (existing 11:37-52 woes).
-- New verse-blocks: 11:1-4 (the Lords Prayer), 11:5-13 (ask-seek-knock),
--                   11:14-23 (finger of Elohim), 11:29-32 (sign of Jonah).
-- sort_order band base 14300, step 3.
-- ============================================================================

-- 3a. Temp view --------------------------------------------------------------
CREATE TEMP VIEW _lk11_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1',
   'pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- 3b. cross_references rows ---------------------------------------------------
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- THREAD 1 — 11:1-4 Our Father / Hallowed be thy name -----------------------
  ('canon','luke',11,2,'canon','ezekiel',36,23, 'free', E'*And I will sanctify my great name, which was profaned among the heathen... and the heathen shall know that I am Yahuah (LORD)... when I shall be sanctified in you before their eyes* (Ezekiel 36:23). The very first petition — *Hallowed be thy name* — is the Father''s own promise turned into prayer: that his great Name be sanctified in the earth.'),
  ('canon','luke',11,2,'canon','isaiah',63,16, 'free', E'*Doubtless thou art our father, though Abraham be ignorant of us... thou, O Yahuah (LORD), art our father, our redeemer; thy name is from everlasting* (Isaiah 63:16). The Formed Son teaches sons to say *Our Father* — the address Yashar''el already knew in the prophets, now opened to all who pray.'),
  ('canon','luke',11,2,'canon','isaiah',64,8, 'free', E'*But now, O Yahuah (LORD), thou art our father; we are the clay, and thou our potter; and we all are the work of thy hand* (Isaiah 64:8). The Father addressed in prayer is the Maker who shaped us — the same Father the Son reveals.'),
  ('canon','luke',11,2,'canon','daniel',2,44, 'free', E'*And in the days of these kings shall the Elohim (God) of heaven set up a kingdom, which shall never be destroyed... it shall stand for ever* (Daniel 2:44). *Thy kingdom come* prays for this everlasting kingdom — the stone-cut-without-hands kingdom the Father sets up.'),
  ('canon','luke',11,3,'canon','proverbs',30,8, 'free', E'*Remove far from me vanity and lies: give me neither poverty nor riches; feed me with food convenient for me* (Proverbs 30:8). *Give us day by day our daily bread* — the humble cry for daily provision, no more and no less, from the Father''s hand.'),

  -- THREAD 2 — 11:5-13 ask, seek, knock / how much more the Father -----------
  ('canon','luke',11,9,'canon','jeremiah',29,12, 'free', E'*Then shall ye call upon me, and ye shall go and pray unto me, and I will hearken unto you* (Jeremiah 29:12). *Ask, and it shall be given you* — the Father has bound himself to hear the one who calls.'),
  ('canon','luke',11,9,'canon','jeremiah',29,13, 'free', E'*And ye shall seek me, and find me, when ye shall search for me with all your heart* (Jeremiah 29:13). *Seek, and ye shall find* — the promise Yahusha repeats is the Father''s own pledge to the whole-hearted seeker.'),
  ('canon','luke',11,9,'canon','isaiah',55,6, 'free', E'*Seek ye Yahuah (LORD) while he may be found, call ye upon him while he is near* (Isaiah 55:6). The open invitation behind *seek, and ye shall find* — the Father is near to be sought.'),
  ('canon','luke',11,9,'canon','isaiah',55,7, 'free', E'*Let the wicked forsake his way... and let him return unto Yahuah (LORD), and he will have mercy upon him; and to our Elohim (God), for he will abundantly pardon* (Isaiah 55:7). The Father who *abundantly pardon*s is the same who answers the one who knocks.'),
  ('canon','luke',11,13,'canon','psalms',84,11, 'free', E'*For Yahuah Elohim (the LORD God) is a sun and shield... no good thing will he withhold from them that walk uprightly* (Psalm 84:11). *How much more shall your heavenly Father give* — no good gift is withheld; the best gift is the Ruach HaKodesh.'),
  ('canon','luke',11,13,'canon','proverbs',8,17, 'free', E'*I love them that love me; and those that seek me early shall find me* (Proverbs 8:17). The giving heart of the Father, who delights to be sought and to be found.'),

  -- THREAD 3 — 11:14-23 finger of Elohim / the strong man bound ---------------
  ('canon','luke',11,20,'canon','exodus',8,19, 'free', E'*Then the magicians said unto Pharaoh, This is the finger of Elohim (God)* (Exodus 8:19). When Yahusha casts out devils *with the finger of Elohim*, it is the same power Pharaoh''s own magicians confessed in Egypt — the kingdom of Elohim breaking in.'),
  ('canon','luke',11,20,'canon','exodus',31,18, 'free', E'*And he gave unto Moses... two tables of testimony, tables of stone, written with the finger of Elohim (God)* (Exodus 31:18). The *finger of Elohim* that wrote the Torah on Sinai is the very power now binding the strong man — the Torah-giving Father and the Son who does his will are one work, never at odds; the Law is not abolished, it is from the same finger.'),
  ('canon','luke',11,22,'canon','isaiah',49,24, 'free', E'*Shall the prey be taken from the mighty, or the lawful captive delivered?* (Isaiah 49:24). The strong man''s captives — can they be loosed? The prophet asks the question the kingdom answers.'),
  ('canon','luke',11,22,'canon','isaiah',49,25, 'free', E'*But thus saith Yahuah (LORD), Even the captives of the mighty shall be taken away, and the prey of the terrible shall be delivered... and I will save thy children* (Isaiah 49:25). *A stronger than he shall come upon him... and divideth his spoils* — the captives of the strong man are taken away; the Father saves his children.'),
  ('canon','luke',11,18,'canon','1-samuel',2,25, 'free', E'*If one man sin against another, the judge shall judge him: but if a man sin against Yahuah (LORD), who shall intreat for him?* (1 Samuel 2:25). A house divided cannot stand; the kingdom rightly ordered under Yahuah cannot be turned against itself.'),
  ('canon','luke',11,21,'enoch','1-enoch',15,9, 'extras', E'*And the spirits of the giants afflict, oppress, destroy, attack, do battle, and work destruction on the earth, and cause trouble* (1 Enoch 15:9). The library names the unclean spirits Yahusha casts out — the disembodied spirits of the fallen Watchers'' giant offspring, the very strong man''s armoury now overcome.'),

  -- THREAD 4 — 11:29-32 sign of Jonah / queen of the south -------------------
  ('canon','luke',11,30,'canon','jonah',1,17, 'free', E'*Now Yahuah (LORD) had prepared a great fish to swallow up Jonah. And Jonah was in the belly of the fish three days and three nights* (Jonah 1:17). The *sign of Jonas* — the prophet three days entombed and brought up alive, a figure of the Son of Adam.'),
  ('canon','luke',11,32,'canon','jonah',3,4, 'free', E'*And Jonah began to enter into the city... and he cried, and said, Yet forty days, and Nineveh shall be overthrown* (Jonah 3:4). The preaching the men of Nineveh heard — and heeded, where this generation will not.'),
  ('canon','luke',11,32,'canon','jonah',3,5, 'free', E'*So the people of Nineveh believed Elohim (God), and proclaimed a fast, and put on sackcloth, from the greatest of them even to the least* (Jonah 3:5). *The men of Nineve shall rise up in the judgment... for they repented* — the repenting heathen will condemn the unrepentant, a warning of unbelief, not the casting-off of the people (Romans 11 guard).'),
  ('canon','luke',11,31,'canon','1-kings',10,1, 'free', E'*And when the queen of Sheba heard of the fame of Solomon concerning the name of Yahuah (LORD), she came to prove him with hard questions* (1 Kings 10:1). *The queen of the south... came from the utmost parts of the earth to hear the wisdom of Solomon* — she who came so far will rise to judge those who would not hear a greater than Solomon at hand.'),
  ('canon','luke',11,31,'canon','1-kings',10,9, 'free', E'*Blessed be Yahuah Elohayka (the LORD thy God)... because Yahuah (LORD) loved Yashar''el (Israel) for ever, therefore made he thee king, to do judgment and justice* (1 Kings 10:9). The foreign queen confessed Yahuah and his love for Yashar''el — the nations drawn toward the wisdom of Elohim.'),
  ('canon','luke',11,32,'canon','jeremiah',3,11, 'free', E'*And Yahuah (LORD) said unto me, The backsliding Yashar''el (Israel) hath justified herself more than treacherous Yahudah (Judah)* (Jeremiah 3:11). The same searching word — the one less guilty rises to shame the one who knew more yet repented less; the warning falls on unbelief within, not on the people cast off.'),
  ('canon','luke',11,31,'apocrypha','ecclesiasticus',47,17, 'extras', E'*The countries marvelled at thee for thy songs, and proverbs, and parables, and interpretations* (Sirach 47:17). The library remembers how Solomon''s wisdom drew the nations from afar — the very fame that brought the queen of the south; yet *a greater than Solomon is here*.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _lk11_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _lk11_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- 3c. threads ----------------------------------------------------------------
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'luke-11-our-father-hallowed-be-thy-name-and-thy-kingdom-come-ezekiel-36-isaiah-63',
       E'Our Father, hallowed be thy name, thy kingdom come (Ezekiel 36; Isaiah 63-64)',
       E'When his disciples ask *Lord, teach us to pray*, the Formed Son does not point them to himself — he points them to the **Father**. *Our Father which art in heaven, Hallowed be thy name* (Luke 11:2). This is the Son who HAS a Father teaching sons to pray to that same Father.\n\nEvery petition is rooted in the prophets. *Hallowed be thy name* prays back the Father''s own pledge: *And I will sanctify my great name, which was profaned among the heathen... and the heathen shall know that I am Yahuah (LORD)... when I shall be sanctified in you before their eyes* (Ezekiel 36:23). The Name is the Father''s to hallow, and he has sworn to hallow it.\n\n*Our Father* is the cry Yashar''el already knew: *Doubtless thou art our father... thou, O Yahuah (LORD), art our father, our redeemer; thy name is from everlasting* (Isaiah 63:16); *But now, O Yahuah (LORD), thou art our father; we are the clay, and thou our potter* (Isaiah 64:8). The Father addressed is the Maker who shaped us.\n\n*Thy kingdom come* reaches for Daniel''s vision: *in the days of these kings shall the Elohim (God) of heaven set up a kingdom, which shall never be destroyed... it shall stand for ever* (Daniel 2:44). And *give us day by day our daily bread* is the humble wisdom of Agur: *give me neither poverty nor riches; feed me with food convenient for me* (Proverbs 30:8). Forgiveness is asked on one condition — *for we also forgive every one that is indebted to us* (Luke 11:4). Come and see: the prayer the Son taught is the prayer of the prophets, lifted to the Father whose Name is from everlasting.',
       sv.verse_id, ev.verse_id, 'free', 14300
  FROM _lk11_lookup sv, _lk11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=11 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='luke' AND ev.chapter_number=11 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'luke-11-ask-seek-knock-how-much-more-the-fathers-good-gift-jeremiah-29-isaiah-55',
       E'Ask, seek, knock: how much more shall the Father give (Jeremiah 29; Isaiah 55)',
       E'*Ask, and it shall be given you; seek, and ye shall find; knock, and it shall be opened unto you* (Luke 11:9). These are not new promises — they are the Father''s ancient pledges, gathered up in three words.\n\n*Ask* rests on Jeremiah: *Then shall ye call upon me, and ye shall go and pray unto me, and I will hearken unto you* (Jeremiah 29:12). *Seek* rests on the very next verse: *And ye shall seek me, and find me, when ye shall search for me with all your heart* (Jeremiah 29:13). Isaiah throws the door wide: *Seek ye Yahuah (LORD) while he may be found, call ye upon him while he is near* (Isaiah 55:6), and the Father who answers is the Father who *will abundantly pardon* (Isaiah 55:7).\n\nThen Yahusha argues from the lesser to the greater: *If a son shall ask bread of any of you that is a father, will he give him a stone?* (Luke 11:11). Even evil men give good gifts to their children — *how much more shall your heavenly Father give the Ruach HaKodesh (Holy Spirit) to them that ask him?* (Luke 11:13). The Psalmist already knew this Father: *no good thing will he withhold from them that walk uprightly* (Psalm 84:11); and Wisdom calls out, *I love them that love me; and those that seek me early shall find me* (Proverbs 8:17). Come and see: the heart of the Father has never changed — he gives, and the best gift is his own Spirit.',
       sv.verse_id, ev.verse_id, 'free', 14303
  FROM _lk11_lookup sv, _lk11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=11 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='luke' AND ev.chapter_number=11 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'luke-11-the-finger-of-elohim-and-the-strong-man-bound-exodus-8-31-isaiah-49',
       E'The finger of Elohim casts out devils and binds the strong man (Exodus 8; 31; Isaiah 49)',
       E'They charge him with casting out devils by Beelzebub. Yahusha answers first with plain sense — *Every kingdom divided against itself is brought to desolation; and a house divided against a house falleth* (Luke 11:17), as Hannah''s house already taught: *if a man sin against Yahuah (LORD), who shall intreat for him?* (1 Samuel 2:25). Then he names the true power: *But if I with the finger of Elohim (God) cast out devils, no doubt the kingdom of Elohim (God) is come upon you* (Luke 11:20).\n\nThe *finger of Elohim* is a phrase the library carries with weight. In Egypt, Pharaoh''s own magicians failed and confessed: *This is the finger of Elohim (God)* (Exodus 8:19) — the power that broke Egypt. And on Sinai that same finger did its deepest work: *two tables of testimony, tables of stone, written with the finger of Elohim (God)* (Exodus 31:18) — the Torah itself. So the hand that wrote the Law is the hand now binding the strong man. The Father who gave the commandments and the Formed Son who does his will are one undivided work; the Law is not set against the kingdom — it springs from the same finger.\n\nThe strong man and his spoil come straight from Isaiah: *Shall the prey be taken from the mighty, or the lawful captive delivered?* (Isaiah 49:24) — and the answer, *the captives of the mighty shall be taken away... and I will save thy children* (Isaiah 49:25). *When a stronger than he shall come upon him... he taketh from him all his armour wherein he trusted, and divideth his spoils* (Luke 11:22). The library even names the captives'' captors: *the spirits of the giants afflict, oppress, destroy... and work destruction on the earth* (1 Enoch 15:9), the disembodied spirits of the Watchers'' offspring — the strong man''s armoury, now overcome. Come and see: the finger that wrote the Torah is the finger that sets the captives free.',
       sv.verse_id, ev.verse_id, 'extras', 14306
  FROM _lk11_lookup sv, _lk11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=11 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='luke' AND ev.chapter_number=11 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'luke-11-the-sign-of-jonah-and-the-queen-of-the-south-jonah-1-1-kings-10',
       E'The sign of Jonah and the queen of the south rise in judgment (Jonah 1; 1 Kings 10)',
       E'They seek a sign, and Yahusha gives them one already written: *there shall no sign be given it, but the sign of Jonas the prophet* (Luke 11:29). *For as Jonas was a sign unto the Ninevites, so shall also the Son of Adam be to this generation* (Luke 11:30). Jonah''s sign is the deep and the deliverance: *Now Yahuah (LORD) had prepared a great fish to swallow up Jonah. And Jonah was in the belly of the fish three days and three nights* (Jonah 1:17) — three days entombed and brought up alive, a figure of the Son of Adam.\n\nNineveh''s repentance is the witness against an unrepentant generation. *And Jonah... cried, and said, Yet forty days, and Nineveh shall be overthrown* (Jonah 3:4) — and they heeded: *So the people of Nineveh believed Elohim (God), and proclaimed a fast, and put on sackcloth, from the greatest of them even to the least* (Jonah 3:5). *The men of Nineve shall rise up in the judgment with this generation, and shall condemn it: for they repented... and, behold, a greater than Jonas is here* (Luke 11:32).\n\nSo too the queen who came so far: *And when the queen of Sheba heard of the fame of Solomon concerning the name of Yahuah (LORD), she came to prove him with hard questions* (1 Kings 10:1), and she confessed his Elohim — *because Yahuah (LORD) loved Yashar''el (Israel) for ever, therefore made he thee king, to do judgment and justice* (1 Kings 10:9). The library remembers that fame: *The countries marvelled at thee for thy songs, and proverbs, and parables, and interpretations* (Sirach 47:17). *The queen of the south shall rise up in the judgment... for she came from the utmost parts of the earth to hear the wisdom of Solomon; and, behold, a greater than Solomon is here* (Luke 11:31).\n\nThis is the searching pattern Jeremiah knew: *The backsliding Yashar''el (Israel) hath justified herself more than treacherous Yahudah (Judah)* (Jeremiah 3:11) — the one less guilty shames the one who knew more yet repented less. The judgment here falls on unbelief, never on the people cast off; *Elohim hath not cast away his people* (Romans 11). Come and see: repenting Nineveh and the seeking queen will themselves bear witness, for a greater than Jonah and a greater than Solomon now stands among us.',
       sv.verse_id, ev.verse_id, 'extras', 14309
  FROM _lk11_lookup sv, _lk11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=11 AND sv.verse_number=29
   AND ev.edition_slug='canon' AND ev.book_slug='luke' AND ev.chapter_number=11 AND ev.verse_number=32
ON CONFLICT (slug) DO NOTHING;

-- 3d. thread_members ---------------------------------------------------------
-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 36:23 — *I will sanctify my great name... when I shall be sanctified in you before their eyes.* Hallowed be thy name = the Father''s own pledge prayed back.'
  FROM cross_reference_threads t, cross_references x, _lk11_lookup sv, _lk11_lookup tv
 WHERE t.slug='luke-11-our-father-hallowed-be-thy-name-and-thy-kingdom-come-ezekiel-36-isaiah-63'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=11 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 63:16 — *thou, O Yahuah (LORD), art our father... thy name is from everlasting.* The Father Yashar''el already knew, now addressed in the prayer.'
  FROM cross_reference_threads t, cross_references x, _lk11_lookup sv, _lk11_lookup tv
 WHERE t.slug='luke-11-our-father-hallowed-be-thy-name-and-thy-kingdom-come-ezekiel-36-isaiah-63'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=11 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=63 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 64:8 — *thou art our father; we are the clay, and thou our potter.* The Father addressed is the Maker who shaped us.'
  FROM cross_reference_threads t, cross_references x, _lk11_lookup sv, _lk11_lookup tv
 WHERE t.slug='luke-11-our-father-hallowed-be-thy-name-and-thy-kingdom-come-ezekiel-36-isaiah-63'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=11 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=64 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Daniel 2:44 — *the Elohim (God) of heaven set up a kingdom, which shall never be destroyed... it shall stand for ever.* Thy kingdom come = the everlasting stone-kingdom.'
  FROM cross_reference_threads t, cross_references x, _lk11_lookup sv, _lk11_lookup tv
 WHERE t.slug='luke-11-our-father-hallowed-be-thy-name-and-thy-kingdom-come-ezekiel-36-isaiah-63'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=11 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=2 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Proverbs 30:8 — *give me neither poverty nor riches; feed me with food convenient for me.* Give us day by day our daily bread — the humble cry for daily provision.'
  FROM cross_reference_threads t, cross_references x, _lk11_lookup sv, _lk11_lookup tv
 WHERE t.slug='luke-11-our-father-hallowed-be-thy-name-and-thy-kingdom-come-ezekiel-36-isaiah-63'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=11 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=30 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 29:12 — *Then shall ye call upon me, and ye shall go and pray unto me, and I will hearken unto you.* Ask = the Father bound to hear.'
  FROM cross_reference_threads t, cross_references x, _lk11_lookup sv, _lk11_lookup tv
 WHERE t.slug='luke-11-ask-seek-knock-how-much-more-the-fathers-good-gift-jeremiah-29-isaiah-55'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=11 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=29 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 29:13 — *And ye shall seek me, and find me, when ye shall search for me with all your heart.* Seek = the Father''s pledge to the whole-hearted.'
  FROM cross_reference_threads t, cross_references x, _lk11_lookup sv, _lk11_lookup tv
 WHERE t.slug='luke-11-ask-seek-knock-how-much-more-the-fathers-good-gift-jeremiah-29-isaiah-55'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=11 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=29 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 55:6 — *Seek ye Yahuah (LORD) while he may be found, call ye upon him while he is near.* The open invitation behind seek and find.'
  FROM cross_reference_threads t, cross_references x, _lk11_lookup sv, _lk11_lookup tv
 WHERE t.slug='luke-11-ask-seek-knock-how-much-more-the-fathers-good-gift-jeremiah-29-isaiah-55'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=11 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=55 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 55:7 — *let him return unto Yahuah (LORD), and he will have mercy... he will abundantly pardon.* The Father who answers the one who knocks.'
  FROM cross_reference_threads t, cross_references x, _lk11_lookup sv, _lk11_lookup tv
 WHERE t.slug='luke-11-ask-seek-knock-how-much-more-the-fathers-good-gift-jeremiah-29-isaiah-55'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=11 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=55 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Psalm 84:11 — *no good thing will he withhold from them that walk uprightly.* How much more shall your heavenly Father give the Ruach HaKodesh.'
  FROM cross_reference_threads t, cross_references x, _lk11_lookup sv, _lk11_lookup tv
 WHERE t.slug='luke-11-ask-seek-knock-how-much-more-the-fathers-good-gift-jeremiah-29-isaiah-55'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=11 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=84 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Proverbs 8:17 — *I love them that love me; and those that seek me early shall find me.* The giving heart of the Father, who delights to be found.'
  FROM cross_reference_threads t, cross_references x, _lk11_lookup sv, _lk11_lookup tv
 WHERE t.slug='luke-11-ask-seek-knock-how-much-more-the-fathers-good-gift-jeremiah-29-isaiah-55'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=11 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=8 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 8:19 — *This is the finger of Elohim (God).* Pharaoh''s magicians confessed the power now casting out devils — the kingdom breaking in.'
  FROM cross_reference_threads t, cross_references x, _lk11_lookup sv, _lk11_lookup tv
 WHERE t.slug='luke-11-the-finger-of-elohim-and-the-strong-man-bound-exodus-8-31-isaiah-49'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=11 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=8 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 31:18 — *two tables of testimony... written with the finger of Elohim (God).* The finger that wrote the Torah is the finger that binds the strong man — the Law not abolished, from the same hand.'
  FROM cross_reference_threads t, cross_references x, _lk11_lookup sv, _lk11_lookup tv
 WHERE t.slug='luke-11-the-finger-of-elohim-and-the-strong-man-bound-exodus-8-31-isaiah-49'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=11 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=31 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 49:24 — *Shall the prey be taken from the mighty, or the lawful captive delivered?* The question the kingdom answers.'
  FROM cross_reference_threads t, cross_references x, _lk11_lookup sv, _lk11_lookup tv
 WHERE t.slug='luke-11-the-finger-of-elohim-and-the-strong-man-bound-exodus-8-31-isaiah-49'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=11 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=49 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 49:25 — *the captives of the mighty shall be taken away... and I will save thy children.* The stronger one divides the spoils; the Father saves his children.'
  FROM cross_reference_threads t, cross_references x, _lk11_lookup sv, _lk11_lookup tv
 WHERE t.slug='luke-11-the-finger-of-elohim-and-the-strong-man-bound-exodus-8-31-isaiah-49'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=11 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=49 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Samuel 2:25 — *if a man sin against Yahuah (LORD), who shall intreat for him?* A house divided cannot stand; the kingdom rightly ordered cannot turn against itself.'
  FROM cross_reference_threads t, cross_references x, _lk11_lookup sv, _lk11_lookup tv
 WHERE t.slug='luke-11-the-finger-of-elohim-and-the-strong-man-bound-exodus-8-31-isaiah-49'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=11 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=2 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'1 Enoch 15:9 — *the spirits of the giants afflict, oppress, destroy... and work destruction on the earth.* The library names the unclean spirits — the strong man''s armoury, now overcome.'
  FROM cross_reference_threads t, cross_references x, _lk11_lookup sv, _lk11_lookup tv
 WHERE t.slug='luke-11-the-finger-of-elohim-and-the-strong-man-bound-exodus-8-31-isaiah-49'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=11 AND sv.verse_number=21
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=15 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jonah 1:17 — *Jonah was in the belly of the fish three days and three nights.* The sign of Jonas — three days entombed and brought up alive, a figure of the Son of Adam.'
  FROM cross_reference_threads t, cross_references x, _lk11_lookup sv, _lk11_lookup tv
 WHERE t.slug='luke-11-the-sign-of-jonah-and-the-queen-of-the-south-jonah-1-1-kings-10'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=11 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='jonah' AND tv.chapter_number=1 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jonah 3:4 — *Yet forty days, and Nineveh shall be overthrown.* The preaching the men of Nineveh heeded, where this generation will not.'
  FROM cross_reference_threads t, cross_references x, _lk11_lookup sv, _lk11_lookup tv
 WHERE t.slug='luke-11-the-sign-of-jonah-and-the-queen-of-the-south-jonah-1-1-kings-10'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=11 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='jonah' AND tv.chapter_number=3 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jonah 3:5 — *the people of Nineveh believed Elohim (God), and proclaimed a fast.* The repenting heathen will condemn the unrepentant — a warning of unbelief, not the casting-off of the people (Rom 11 guard).'
  FROM cross_reference_threads t, cross_references x, _lk11_lookup sv, _lk11_lookup tv
 WHERE t.slug='luke-11-the-sign-of-jonah-and-the-queen-of-the-south-jonah-1-1-kings-10'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=11 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='jonah' AND tv.chapter_number=3 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Kings 10:1 — *when the queen of Sheba heard of the fame of Solomon... she came to prove him with hard questions.* The queen of the south who came from the utmost parts.'
  FROM cross_reference_threads t, cross_references x, _lk11_lookup sv, _lk11_lookup tv
 WHERE t.slug='luke-11-the-sign-of-jonah-and-the-queen-of-the-south-jonah-1-1-kings-10'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=11 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=10 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Kings 10:9 — *because Yahuah (LORD) loved Yashar''el (Israel) for ever, therefore made he thee king.* The foreign queen confessed Yahuah and his love for Yashar''el.'
  FROM cross_reference_threads t, cross_references x, _lk11_lookup sv, _lk11_lookup tv
 WHERE t.slug='luke-11-the-sign-of-jonah-and-the-queen-of-the-south-jonah-1-1-kings-10'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=11 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=10 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Jeremiah 3:11 — *The backsliding Yashar''el (Israel) hath justified herself more than treacherous Yahudah (Judah).* The one less guilty shames the one who knew more yet repented less; judgment of unbelief, not the people cast off.'
  FROM cross_reference_threads t, cross_references x, _lk11_lookup sv, _lk11_lookup tv
 WHERE t.slug='luke-11-the-sign-of-jonah-and-the-queen-of-the-south-jonah-1-1-kings-10'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=11 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=3 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Sirach 47:17 — *The countries marvelled at thee for thy songs, and proverbs, and parables, and interpretations.* The library remembers the fame that drew the nations to Solomon; yet a greater than Solomon is here.'
  FROM cross_reference_threads t, cross_references x, _lk11_lookup sv, _lk11_lookup tv
 WHERE t.slug='luke-11-the-sign-of-jonah-and-the-queen-of-the-south-jonah-1-1-kings-10'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=11 AND sv.verse_number=31
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=47 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session260 — Luke (depth) cross-references complete.'
