-- ----- fragment: minion_matthew_04.sql (S260 Matthew depth) -----
-- ============================================================================
-- Matthew 4 — full-library cross-reference threads (NT DEPTH pass)
-- 6 threads / 14 members. sort_order band 11090 step +3.
-- ============================================================================

-- 3a. Temp view -------------------------------------------------------------
CREATE TEMP VIEW _mt04_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1',
   'pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- 3b. cross_references rows -------------------------------------------------
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- THREAD 1: 4:1-4 — man shall not live by bread alone
  ('canon','matthew',4,4,'canon','deuteronomy',8,3, 'free', E'*man doth not live by bread only, but by every word that proceedeth out of the mouth of Yahuah (LORD) doth man live* (Deuteronomy 8:3). When the tempter says *command that these stones be made bread* (Matthew 4:3), Yahusha (Jesus) does not reach for power — he reaches for the Torah, quoting Moses word for word: *It is written, Man shall not live by bread alone, but by every word that proceedeth out of the mouth of Elohim (God)* (Matthew 4:4). The Formed Son obeys the very instruction he was given to deliver.'),
  ('canon','matthew',4,4,'canon','deuteronomy',8,2, 'free', E'*thou shalt remember all the way which Yahuah Elohayka (the LORD thy God) led thee these forty years in the wilderness, to humble thee, and to prove thee, to know what was in thine heart, whether thou wouldest keep his commandments, or no* (Deuteronomy 8:2). Forty years Yashar''el (Israel) was proved in the wilderness with hunger and manna; here the Son fasts *forty days and forty nights* (Matthew 4:2) and is proved in the same wilderness. Where the first son murmured, the Formed Son trusts every word from the Father''s mouth.'),
  -- THREAD 2: 4:5-7 — thou shalt not tempt Yahuah
  ('canon','matthew',4,7,'canon','deuteronomy',6,16, 'free', E'*Ye shall not tempt Yahuah Elohaychem (the LORD your God), as ye tempted him in Massah* (Deuteronomy 6:16). To the dare *cast thyself down* the Son answers *It is written again, Thou shalt not tempt Yahuah Elohayka (the Lord thy God)* (Matthew 4:6-7) — again the Torah, again Moses, naming the very sin of Massah where Israel put Yahuah to the test for water.'),
  ('canon','matthew',4,6,'canon','psalms',91,11, 'free', E'*For he shall give his angels charge over thee, to keep thee in all thy ways* (Psalm 91:11). The devil can quote Scripture too — *for it is written, He shall give his angels charge concerning thee* (Matthew 4:6). But he tears the promise of the One who *dwelleth in the secret place of the El Elyon (most High)* (Psalm 91:1) out of its frame of trust and twists it into a demand. Scripture is rightly handled by faith, never weaponized to test the Father.'),
  ('canon','matthew',4,6,'canon','psalms',91,12, 'free', E'*They shall bear thee up in their hands, lest thou dash thy foot against a stone* (Psalm 91:12). This is the line the tempter throws at the Son verbatim — *in their hands they shall bear thee up, lest at any time thou dash thy foot against a stone* (Matthew 4:6). The shelter promised to the one who trusts is not a stunt to be staged; the Son refuses to make the Father''s care into a test of the Father.'),
  -- THREAD 3: 4:8-11 — worship Yahuah and him only serve
  ('canon','matthew',4,10,'canon','deuteronomy',6,13, 'free', E'*Thou shalt fear Yahuah Elohayka (the LORD thy God), and serve him, and shalt swear by his name* (Deuteronomy 6:13). Offered *all the kingdoms of the world* for one act of worship (Matthew 4:8-9), the Son drives the adversary off with the Torah a third time: *Get thee hence, Satan: for it is written, Thou shalt worship Yahuah Elohayka (the Lord thy God), and him only shalt thou serve* (Matthew 4:10). The first commandment held, by the One who gave it.'),
  ('canon','matthew',4,10,'canon','exodus',34,14, 'free', E'*For thou shalt worship no other god: for Yahuah (LORD), whose name is Jealous, is a jealous Elohim (God)* (Exodus 34:14). The worship the devil craves belongs to Yahuah alone. Where Yashar''el bowed to the golden calf at the foot of the mount, the Formed Son will bow to no rival glory, however many kingdoms are dangled before him.'),
  -- THREAD 4: 4:12-16 — Galilee of the nations, darkness to light
  ('canon','matthew',4,16,'canon','isaiah',9,1, 'free', E'*when at the first he lightly afflicted the land of Zebulun and the land of Naphtali, and afterward did more grievously afflict her by the way of the sea, beyond Jordan, in Galilee of the nations* (Isaiah 9:1). Matthew names this prophecy outright: dwelling *in the borders of Zabulon and Nephthalim* (Matthew 4:13), the light comes first to the very northern tribes carried off into exile — the lost house of Israel.'),
  ('canon','matthew',4,16,'canon','isaiah',9,2, 'free', E'*The people that walked in darkness have seen a great light: they that dwell in the land of the shadow of death, upon them hath the light shined* (Isaiah 9:2). Matthew echoes it almost word for word — *The people which sat in darkness saw great light; and to them which sat in the region and shadow of death light is sprung up* (Matthew 4:16). The dawn breaks first over scattered Ephraim, the gathering of the two houses begun in Galilee of the nations.'),
  -- THREAD 5: 4:17-22 — repent / fishers of men / they left all
  ('canon','matthew',4,19,'canon','jeremiah',16,16, 'free', E'*Behold, I will send for many fishers, saith Yahuah (LORD), and they shall fish them* (Jeremiah 16:16). In Jeremiah the fishers are sent to gather the scattered house of Israel *from the land of the north* (Jeremiah 16:15) back to their land. When the Son tells the fishermen *Follow me, and I will make you fishers of men* (Matthew 4:19), the long-promised ingathering of the exiles has begun by the sea of Galilee.'),
  ('canon','matthew',4,17,'canon','ezekiel',18,30, 'free', E'*Repent, and turn yourselves from all your transgressions; so iniquity shall not be your ruin* (Ezekiel 18:30). The Son''s first word in his preaching is *Repent: for the kingdom of heaven is at hand* (Matthew 4:17) — and repentance, in the prophets, is no mere feeling but a turning from transgression back to the way of Yahuah, the very turning the Torah and prophets have always called for.'),
  ('canon','matthew',4,20,'canon','1-kings',19,20, 'free', E'*And he left the oxen, and ran after Elijah... And he returned back from him, and took a yoke of oxen, and slew them... and went after Elijah, and ministered unto him* (1 Kings 19:20-21). As Elisha left his plough to follow the prophet, so the fishermen *straightway left their nets, and followed him* (Matthew 4:20), and James and John *immediately left the ship and their father* (Matthew 4:22). The true call is answered by leaving all.'),
  -- THREAD 6: 4:23-25 — healing every sickness
  ('canon','matthew',4,23,'canon','isaiah',53,4, 'free', E'*Surely he hath borne our griefs, and carried our sorrows: yet we did esteem him stricken, smitten of Elohim (God), and afflicted* (Isaiah 53:4). When Yahusha goes about *healing all manner of sickness and all manner of disease* (Matthew 4:23), the suffering Servant is at work — the One who carries the infirmities he heals, taking them upon himself.'),
  ('canon','matthew',4,23,'canon','psalms',103,3, 'free', E'*Who forgiveth all thine iniquities; who healeth all thy diseases* (Psalm 103:3). The benefits of Yahuah are sin pardoned and sickness healed together; in the Formed Son both come near at once, *healing all manner of sickness... among the people* (Matthew 4:23).'),
  ('canon','matthew',4,23,'canon','malachi',4,2, 'free', E'*But unto you that fear my name shall the Sun of righteousness arise with healing in his wings* (Malachi 4:2). Malachi promised that healing would dawn for them that fear the Name; in Galilee the Sun of righteousness has risen, and the great multitudes feel his wings.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _mt04_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _mt04_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- 3c. Threads ---------------------------------------------------------------
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-4-man-shall-not-live-by-bread-alone-it-is-written-deuteronomy-8',
       E'Man shall not live by bread alone — it is written (Deuteronomy 8:3; the forty years recapitulated)',
       E'The first temptation, and the first answer is Torah. *And when the tempter came to him, he said, If thou be the Son of Elohim (God), command that these stones be made bread* (Matthew 4:3). Yahusha (Jesus), an hungred after forty days, does not turn the stones — he turns to the scroll: *It is written, Man shall not live by bread alone, but by every word that proceedeth out of the mouth of Elohim (God)* (Matthew 4:4). He is quoting Moses verbatim: *man doth not live by bread only, but by every word that proceedeth out of the mouth of Yahuah (LORD) doth man live* (Deuteronomy 8:3). And the whole scene is set in the frame of Deuteronomy 8:2 — *thou shalt remember all the way which Yahuah Elohayka (the LORD thy God) led thee these forty years in the wilderness, to humble thee, and to prove thee... whether thou wouldest keep his commandments, or no.* Forty years Yashar''el was proved with hunger and manna and murmured; *forty days and forty nights* (Matthew 4:2) the Son is proved with hunger and holds fast. The Formed Son walks Israel''s road over again, and where the firstborn nation failed, he keeps the Father''s word.',
       sv.verse_id, ev.verse_id, 'free', 11090
  FROM _mt04_lookup sv, _mt04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=4 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=4 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-4-thou-shalt-not-tempt-the-lord-pinnacle-deuteronomy-6-psalm-91',
       E'Thou shalt not tempt Yahuah — Scripture twisted, Scripture answered (Deuteronomy 6:16; Psalm 91)',
       E'Now the devil quotes the Bible. He takes the Son to a pinnacle of the temple and says, *If thou be the Son of Elohim (God), cast thyself down: for it is written, He shall give his angels charge concerning thee: and in their hands they shall bear thee up, lest at any time thou dash thy foot against a stone* (Matthew 4:6). That is Psalm 91:11-12 word for word — *For he shall give his angels charge over thee, to keep thee in all thy ways. They shall bear thee up in their hands, lest thou dash thy foot against a stone.* But the promise belongs to the one who *dwelleth in the secret place of the El Elyon (most High)* (Psalm 91:1) — it is shelter for trust, not a script for a stunt. The adversary tears a true word out of its frame to bend it into a dare. And the Son answers, again, with the Torah: *It is written again, Thou shalt not tempt Yahuah Elohayka (the Lord thy God)* (Matthew 4:7) — *Ye shall not tempt Yahuah Elohaychem (the LORD your God), as ye tempted him in Massah* (Deuteronomy 6:16). Scripture is honored by faith, not handled to test the Father.',
       sv.verse_id, ev.verse_id, 'free', 11093
  FROM _mt04_lookup sv, _mt04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=4 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=4 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-4-him-only-shalt-thou-serve-all-the-kingdoms-deuteronomy-6-exodus-34',
       E'Him only shalt thou serve — the kingdoms refused (Deuteronomy 6:13; Exodus 34:14)',
       E'The third dare is the boldest: *the devil taketh him up into an exceeding high mountain, and sheweth him all the kingdoms of the world, and the glory of them; and saith unto him, All these things will I give thee, if thou wilt fall down and worship me* (Matthew 4:8-9). The Son does not bargain. He commands: *Get thee hence, Satan: for it is written, Thou shalt worship Yahuah Elohayka (the Lord thy God), and him only shalt thou serve* (Matthew 4:10) — Moses again: *Thou shalt fear Yahuah Elohayka (the LORD thy God), and serve him, and shalt swear by his name* (Deuteronomy 6:13). This is the first commandment, and the Formed Son who delivered it keeps it under fire: *For thou shalt worship no other god: for Yahuah (LORD), whose name is Jealous, is a jealous Elohim (God)* (Exodus 34:14). Three tests, three answers, and every answer is *it is written.* Messiah does not abolish the Torah he gives — he lives it.',
       sv.verse_id, ev.verse_id, 'free', 11096
  FROM _mt04_lookup sv, _mt04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=4 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=4 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-4-galilee-of-the-nations-the-people-in-darkness-saw-light-isaiah-9',
       E'Galilee of the nations — the people in darkness saw great light (Isaiah 9:1-2)',
       E'Matthew lifts the curtain on his own meaning: *leaving Nazareth, he came and dwelt in Capernaum, which is upon the sea coast, in the borders of Zabulon and Nephthalim: that it might be fulfilled which was spoken by Esaias the prophet* (Matthew 4:13-14). The prophecy is Isaiah''s: *when at the first he lightly afflicted the land of Zebulun and the land of Naphtali... and afterward... by the way of the sea, beyond Jordan, in Galilee of the nations* (Isaiah 9:1). These are the northern tribes, the first carried off into Assyrian exile, the lost house of Israel. And it is to them the dawn comes first: *The people that walked in darkness have seen a great light: they that dwell in the land of the shadow of death, upon them hath the light shined* (Isaiah 9:2), which Matthew echoes — *The people which sat in darkness saw great light; and to them which sat in the region and shadow of death light is sprung up* (Matthew 4:16). The light does not begin in Jerusalem but in scattered Ephraim''s country — the gathering of the two houses, begun where they were lost.',
       sv.verse_id, ev.verse_id, 'free', 11099
  FROM _mt04_lookup sv, _mt04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=4 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=4 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-4-fishers-of-men-repent-they-left-their-nets-jeremiah-16-ezekiel-18',
       E'Fishers of men — repent, and they left their nets (Jeremiah 16:16; Ezekiel 18:30; 1 Kings 19)',
       E'The preaching begins: *From that time Yahusha (Jesus) began to preach, and to say, Repent: for the kingdom of heaven is at hand* (Matthew 4:17). His first word is the prophets'' word — not a feeling but a turning: *Repent, and turn yourselves from all your transgressions; so iniquity shall not be your ruin* (Ezekiel 18:30). Then he calls the fishermen: *Follow me, and I will make you fishers of men* (Matthew 4:19). The figure is Jeremiah''s, and it is an ingathering of the scattered: *Behold, I will send for many fishers, saith Yahuah (LORD), and they shall fish them* (Jeremiah 16:16) — sent to bring the children of Yashar''el home *from the land of the north* (Jeremiah 16:15). And the answer to the call is total, in the very pattern of Elisha, who *left the oxen, and ran after Elijah... and went after Elijah, and ministered unto him* (1 Kings 19:20-21): *they straightway left their nets, and followed him* (Matthew 4:20). The kingdom is at hand, the fishers are sent, and the called leave all.',
       sv.verse_id, ev.verse_id, 'free', 11102
  FROM _mt04_lookup sv, _mt04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=4 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=4 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-4-healing-all-manner-of-sickness-the-sun-of-righteousness-isaiah-53-malachi-4',
       E'Healing all manner of sickness — the Sun of righteousness with healing in his wings (Isaiah 53:4; Psalm 103:3; Malachi 4:2)',
       E'And then the healing pours out: *Yahusha (Jesus) went about all Galilee... healing all manner of sickness and all manner of disease among the people* (Matthew 4:23), until *there followed him great multitudes* (Matthew 4:25). This is the Servant of Isaiah at work — *Surely he hath borne our griefs, and carried our sorrows* (Isaiah 53:4) — for he does not heal from a distance but takes the infirmity upon himself. It is the mercy David sang: *Who forgiveth all thine iniquities; who healeth all thy diseases* (Psalm 103:3), pardon and healing arriving together in the Formed Son. And it is the dawn Malachi promised at the close of the prophets: *But unto you that fear my name shall the Sun of righteousness arise with healing in his wings* (Malachi 4:2). In Galilee of the nations, that Sun has risen, and the multitudes feel the warmth of his wings.',
       sv.verse_id, ev.verse_id, 'free', 11105
  FROM _mt04_lookup sv, _mt04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=4 AND sv.verse_number=23
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=4 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

-- 3d. Thread members --------------------------------------------------------
-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 8:3 — *man doth not live by bread only, but by every word that proceedeth out of the mouth of Yahuah (LORD) doth man live.* The Son answers the tempter by quoting Moses.'
  FROM cross_reference_threads t, cross_references x, _mt04_lookup sv, _mt04_lookup tv
 WHERE t.slug='matthew-4-man-shall-not-live-by-bread-alone-it-is-written-deuteronomy-8'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=4 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=8 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 8:2 — *these forty years in the wilderness, to humble thee, and to prove thee... whether thou wouldest keep his commandments, or no.* The forty-day fast recapitulates Israel''s forty years of testing.'
  FROM cross_reference_threads t, cross_references x, _mt04_lookup sv, _mt04_lookup tv
 WHERE t.slug='matthew-4-man-shall-not-live-by-bread-alone-it-is-written-deuteronomy-8'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=4 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=8 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 6:16 — *Ye shall not tempt Yahuah Elohaychem (the LORD your God), as ye tempted him in Massah.* The Son''s answer to the pinnacle dare.'
  FROM cross_reference_threads t, cross_references x, _mt04_lookup sv, _mt04_lookup tv
 WHERE t.slug='matthew-4-thou-shalt-not-tempt-the-lord-pinnacle-deuteronomy-6-psalm-91'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=4 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 91:11 — *For he shall give his angels charge over thee, to keep thee in all thy ways.* The promise the devil quotes, torn from its frame of trust.'
  FROM cross_reference_threads t, cross_references x, _mt04_lookup sv, _mt04_lookup tv
 WHERE t.slug='matthew-4-thou-shalt-not-tempt-the-lord-pinnacle-deuteronomy-6-psalm-91'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=4 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=91 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 91:12 — *They shall bear thee up in their hands, lest thou dash thy foot against a stone.* Quoted verbatim by the tempter; shelter for faith, not a stunt to stage.'
  FROM cross_reference_threads t, cross_references x, _mt04_lookup sv, _mt04_lookup tv
 WHERE t.slug='matthew-4-thou-shalt-not-tempt-the-lord-pinnacle-deuteronomy-6-psalm-91'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=4 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=91 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 6:13 — *Thou shalt fear Yahuah Elohayka (the LORD thy God), and serve him, and shalt swear by his name.* The first commandment, quoted to refuse the kingdoms.'
  FROM cross_reference_threads t, cross_references x, _mt04_lookup sv, _mt04_lookup tv
 WHERE t.slug='matthew-4-him-only-shalt-thou-serve-all-the-kingdoms-deuteronomy-6-exodus-34'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=4 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 34:14 — *For thou shalt worship no other god: for Yahuah (LORD), whose name is Jealous, is a jealous Elohim (God).* Worship belongs to Yahuah alone.'
  FROM cross_reference_threads t, cross_references x, _mt04_lookup sv, _mt04_lookup tv
 WHERE t.slug='matthew-4-him-only-shalt-thou-serve-all-the-kingdoms-deuteronomy-6-exodus-34'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=4 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=34 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 9:1 — *the land of Zebulun and the land of Naphtali... in Galilee of the nations.* The prophecy Matthew names; the light comes first to the northern tribes.'
  FROM cross_reference_threads t, cross_references x, _mt04_lookup sv, _mt04_lookup tv
 WHERE t.slug='matthew-4-galilee-of-the-nations-the-people-in-darkness-saw-light-isaiah-9'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=4 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=9 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 9:2 — *The people that walked in darkness have seen a great light.* Matthew 4:16 echoes it almost word for word: the dawn over scattered Ephraim.'
  FROM cross_reference_threads t, cross_references x, _mt04_lookup sv, _mt04_lookup tv
 WHERE t.slug='matthew-4-galilee-of-the-nations-the-people-in-darkness-saw-light-isaiah-9'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=4 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=9 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 16:16 — *Behold, I will send for many fishers, saith Yahuah (LORD), and they shall fish them.* The fishers are sent to gather scattered Israel home from the north.'
  FROM cross_reference_threads t, cross_references x, _mt04_lookup sv, _mt04_lookup tv
 WHERE t.slug='matthew-4-fishers-of-men-repent-they-left-their-nets-jeremiah-16-ezekiel-18'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=4 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=16 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 18:30 — *Repent, and turn yourselves from all your transgressions; so iniquity shall not be your ruin.* The Son''s first word is the prophets'' turning, not a feeling.'
  FROM cross_reference_threads t, cross_references x, _mt04_lookup sv, _mt04_lookup tv
 WHERE t.slug='matthew-4-fishers-of-men-repent-they-left-their-nets-jeremiah-16-ezekiel-18'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=4 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=18 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Kings 19:20 — *And he left the oxen, and ran after Elijah.* Elisha leaves his plough to follow; the fishermen leave their nets in the same pattern.'
  FROM cross_reference_threads t, cross_references x, _mt04_lookup sv, _mt04_lookup tv
 WHERE t.slug='matthew-4-fishers-of-men-repent-they-left-their-nets-jeremiah-16-ezekiel-18'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=4 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=19 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 6
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 53:4 — *Surely he hath borne our griefs, and carried our sorrows.* The suffering Servant takes the infirmities he heals upon himself.'
  FROM cross_reference_threads t, cross_references x, _mt04_lookup sv, _mt04_lookup tv
 WHERE t.slug='matthew-4-healing-all-manner-of-sickness-the-sun-of-righteousness-isaiah-53-malachi-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=4 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 103:3 — *Who forgiveth all thine iniquities; who healeth all thy diseases.* Pardon and healing arrive together in the Formed Son.'
  FROM cross_reference_threads t, cross_references x, _mt04_lookup sv, _mt04_lookup tv
 WHERE t.slug='matthew-4-healing-all-manner-of-sickness-the-sun-of-righteousness-isaiah-53-malachi-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=4 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=103 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Malachi 4:2 — *But unto you that fear my name shall the Sun of righteousness arise with healing in his wings.* The dawn the prophets promised has risen over Galilee.'
  FROM cross_reference_threads t, cross_references x, _mt04_lookup sv, _mt04_lookup tv
 WHERE t.slug='matthew-4-healing-all-manner-of-sickness-the-sun-of-righteousness-isaiah-53-malachi-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=4 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=4 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
