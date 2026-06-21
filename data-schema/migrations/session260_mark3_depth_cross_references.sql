-- =====================================================================
-- Session 260 — Mark (depth) FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py /tmp/nt-depth-wt/data-schema/migrations/session260_mark3_depth_cross_references.sql
-- =====================================================================

\echo 'session260 — Mark (depth) cross-references starting...'
BEGIN;

-- ----- fragment: minion_mark_01.sql -----
-- ============================================================================
-- MINION FRAGMENT — MARK 1 (NT depth pass, THIN-ADD)
-- 4 NEW threads on verse-blocks 1:1-8, 1:9-11, 1:12-15, 1:40-45.
-- DEDUP: existing anchor 1:24 (unclean-spirits/Watchers + Holy-One) NOT touched.
-- Band base 13000, step 3.
-- ============================================================================

-- 3a. Temp view ------------------------------------------------------------
CREATE TEMP VIEW _mk01_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1',
   'pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- 3b. cross_references rows -------------------------------------------------
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- ---- Thread 1: 1:1-8 prepare the way of Yahuah / the forerunner ----
  ('canon','mark',1,2,'canon','malachi',3,1, 'free', E'*Behold, I will send my messenger, and he shall prepare the way before me: and Yahuah (Lord), whom ye seek, shall suddenly come to his temple, even the messenger of the covenant* (Malachi 3:1). Mark opens his gospel by quoting this very word — the messenger goes before Yahuah Himself, who comes to His temple. The forerunner prepares the way for the coming of Yahuah in the Formed Son.'),
  ('canon','mark',1,3,'canon','isaiah',40,3, 'free', E'*The voice of him that crieth in the wilderness, Prepare ye the way of Yahuah (LORD), make straight in the desert a highway for our Elohim (God)* (Isaiah 40:3). Mark 1:3 lifts this straight off Isaiah''s scroll — John is that wilderness voice, and the One whose highway he levels is Yahuah Himself, *and the glory of Yahuah shall be revealed, and all flesh shall see it together* (Isaiah 40:5).'),
  ('canon','mark',1,2,'canon','malachi',4,5, 'free', E'*Behold, I will send you Elijah the prophet before the coming of the great and dreadful day of Yahuah (LORD)* (Malachi 4:5). The promised messenger comes in the spirit of Elijah, *and he shall turn the heart of the fathers to the children* (Malachi 4:6) — the forerunner who readies the people before the day of Yahuah.'),
  ('canon','mark',1,6,'canon','2-kings',1,8, 'free', E'*He was an hairy man, and girt with a girdle of leather about his loins. And he said, It is Elijah the Tishbite* (2 Kings 1:8). John''s dress — *clothed with camel''s hair, and with a girdle of a skin about his loins* (Mark 1:6) — is Elijah''s own garb worn again, the visible sign that the Elijah-to-come (Malachi 4:5) has arrived.'),

  -- ---- Thread 2: 1:9-11 baptism / the Father declares the Son ----
  ('canon','mark',1,11,'canon','psalms',2,7, 'free', E'*I will declare the decree: Yahuah (LORD) hath said unto me, Thou art my Son; this day have I begotten thee* (Psalm 2:7). The voice from heaven — *Thou art my beloved Son, in whom I am well pleased* (Mark 1:11) — is the Father speaking the words of the royal decree over His Anointed. The Father acknowledges the Son He sends; the Son is begotten, not a second co-equal.'),
  ('canon','mark',1,10,'canon','isaiah',42,1, 'free', E'*Behold my servant, whom I uphold; mine elect, in whom my soul delighteth; I have put my spirit upon him* (Isaiah 42:1). At Jordan the Father puts His Spirit upon the Son just as Isaiah said — *the Spirit like a dove descending upon him* (Mark 1:10) — the chosen Servant anointed for the work the Father gives him.'),
  ('canon','mark',1,10,'canon','genesis',1,2, 'free', E'*And the earth was without form, and void; and darkness was upon the face of the deep. And the Spirit of Elohim (God) moved upon the face of the waters* (Genesis 1:2). As the Ruach once brooded over the waters at the first creation, the same Spirit descends *like a dove* upon the Son rising from the waters of Jordan — a new beginning hovered over by the Spirit of Elohim.'),
  ('canon','mark',1,10,'canon','isaiah',11,2, 'free', E'*And the spirit of Yahuah (LORD) shall rest upon him, the spirit of wisdom and understanding, the spirit of counsel and might* (Isaiah 11:2). The Branch out of Jesse''s stem is the One on whom the Spirit rests; at the baptism that resting is made visible — the Father endues the Formed Son for righteous reign.'),
  ('canon','mark',1,10,'canon','isaiah',63,11, 'free', E'*Then he remembered the days of old, Moses, and his people, saying, Where is he that brought them up out of the sea with the shepherd of his flock? where is he that put his holy Spirit within him?* (Isaiah 63:11). The Spirit put within the shepherd at the sea is put now within the greater Shepherd at the Jordan — the Father''s holy Spirit resting upon the One who leads His people home.'),

  -- ---- Thread 3: 1:12-15 wilderness forty days / the kingdom at hand ----
  ('canon','mark',1,13,'canon','deuteronomy',8,2, 'free', E'*And thou shalt remember all the way which Yahuah Elohayka (the LORD thy God) led thee these forty years in the wilderness, to humble thee, and to prove thee, to know what was in thine heart, whether thou wouldest keep his commandments, or no* (Deuteronomy 8:2). Yashar''el was forty years proved in the wilderness and failed; the Son is *there in the wilderness forty days, tempted of Satan* (Mark 1:13) — the true Yashar''el tested and not failing, for *man doth not live by bread only, but by every word that proceedeth out of the mouth of Yahuah* (Deuteronomy 8:3).'),
  ('canon','mark',1,13,'canon','exodus',34,28, 'free', E'*And he was there with Yahuah (LORD) forty days and forty nights; he did neither eat bread, nor drink water* (Exodus 34:28). Moses'' forty days on the mount, fasting before Yahuah, is one shadow of the Son''s forty days; the deliverer set apart and proven before the great work begins.'),
  ('canon','mark',1,13,'canon','1-kings',19,8, 'free', E'*And he arose, and did eat and drink, and went in the strength of that meat forty days and forty nights unto Horeb the mount of Elohim (God)* (1 Kings 19:8). Elijah''s forty days to the mount of Elohim, *and the angels ministered unto him* (Mark 1:13) as one ministered to Elijah under the juniper — the wilderness pattern of the sent one sustained.'),
  ('canon','mark',1,15,'canon','daniel',2,44, 'free', E'*And in the days of these kings shall the Elohim (God) of heaven set up a kingdom, which shall never be destroyed... it shall break in pieces and consume all these kingdoms, and it shall stand for ever* (Daniel 2:44). When the Son proclaims *the kingdom of Elohim is at hand* (Mark 1:15), this is the everlasting kingdom Daniel foresaw — the stone cut without hands, now drawing near.'),
  ('canon','mark',1,15,'canon','deuteronomy',30,2, 'free', E'*And shalt return unto Yahuah Elohayka (the LORD thy God), and shalt obey his voice according to all that I command thee this day, thou and thy children, with all thine heart, and with all thy soul* (Deuteronomy 30:2). *Repent ye, and believe the gospel* (Mark 1:15) is this very call to return — turning back to the covenant, that Yahuah *will turn thy captivity... and will return and gather thee from all the nations* (Deuteronomy 30:3).'),

  -- ---- Thread 4: 1:40-45 the leper cleansed / sent to keep the Torah ----
  ('canon','mark',1,44,'canon','leviticus',14,2, 'free', E'*This shall be the law of the leper in the day of his cleansing: He shall be brought unto the priest* (Leviticus 14:2). Yahusha sends the cleansed man to do exactly this — *go thy way, shew thyself to the priest, and offer for thy cleansing those things which Moses commanded* (Mark 1:44). The Torah of the leper is upheld and honoured, never set aside.'),
  ('canon','mark',1,44,'canon','leviticus',13,45, 'free', E'*And the leper in whom the plague is, his clothes shall be rent, and his head bare... and shall cry, Unclean, unclean* (Leviticus 13:45) — *without the camp shall his habitation be* (Leviticus 13:46). This is the misery the man came out of: cut off, dwelling alone. Yahusha touches him and restores him to the camp by the very door Moses appointed — the priest''s testimony.'),
  ('canon','mark',1,42,'canon','2-kings',5,14, 'free', E'*Then went he down, and dipped himself seven times in Jordan... and his flesh came again like unto the flesh of a little child, and he was clean* (2 Kings 5:14). Naaman''s leprous flesh made new prefigures this hour: *as soon as he had spoken, immediately the leprosy departed from him, and he was cleansed* (Mark 1:42) — greater than Elisha, the Son cleanses with a word and a touch.'),
  ('canon','mark',1,41,'canon','numbers',12,13, 'free', E'*And Moses cried unto Yahuah (LORD), saying, Heal her now, O Elohim (God), I beseech thee* (Numbers 12:13) — Moses pleading for Miriam, *leprous, white as snow* (Numbers 12:10). What Moses could only beseech of Yahuah, the Son does in His own person: *I will; be thou clean* (Mark 1:41), the Father''s healing power exercised in the Formed Son.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _mk01_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _mk01_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- 3c. threads --------------------------------------------------------------
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'mark-1-prepare-ye-the-way-of-yahuah-the-forerunner-malachi-3-isaiah-40',
       E'Prepare ye the way of Yahuah — the forerunner who readies the people (Malachi 3; Isaiah 40)',
       E'Mark opens the gospel not with a birth but with a scroll: *As it is written in the prophets, Behold, I send my messenger before thy face, which shall prepare thy way before thee. The voice of one crying in the wilderness, Prepare ye the way of Yahuah (Lord), make his paths straight* (Mark 1:2-3). Come and see how old this word is. Malachi heard it first: *Behold, I will send my messenger, and he shall prepare the way before me: and Yahuah (Lord), whom ye seek, shall suddenly come to his temple* (Malachi 3:1) — the One who comes after the messenger is Yahuah Himself, and the way is prepared for HIM. Isaiah heard it too: *The voice of him that crieth in the wilderness, Prepare ye the way of Yahuah (LORD), make straight in the desert a highway for our Elohim* (Isaiah 40:3), *and the glory of Yahuah shall be revealed, and all flesh shall see it together* (Isaiah 40:5). The forerunner readies a highway for the coming of Yahuah in the Formed Son — not a second God, but the visible coming of the invisible Father''s glory in His Anointed. And who is this forerunner? Malachi names him: *Behold, I will send you Elijah the prophet before the coming of the great and dreadful day of Yahuah* (Malachi 4:5), *and he shall turn the heart of the fathers to the children* (Malachi 4:6). John wears the very sign of it — *clothed with camel''s hair, and with a girdle of a skin about his loins* (Mark 1:6), exactly Elijah''s garb: *He was an hairy man, and girt with a girdle of leather about his loins. And he said, It is Elijah the Tishbite* (2 Kings 1:8). The library is one: the messenger promised in Malachi, the wilderness voice of Isaiah, the Elijah-to-come — all meet in the man at the Jordan, and the way they prepare is the coming of Yahuah Himself.',
       sv.verse_id, ev.verse_id, 'free', 13000
  FROM _mk01_lookup sv, _mk01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=1 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='mark' AND ev.chapter_number=1 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'mark-1-thou-art-my-beloved-son-the-father-declares-and-anoints-psalm-2-isaiah-42',
       E'Thou art my beloved Son — the Father declares and the Spirit anoints (Psalm 2; Isaiah 42)',
       E'At the Jordan the heavens tear open: *And straightway coming up out of the water, he saw the heavens opened, and the Spirit like a dove descending upon him: And there came a voice from heaven, saying, Thou art my beloved Son, in whom I am well pleased* (Mark 1:10-11). Come and see — this is not three co-equal persons announcing themselves; it is the **Father** acknowledging the **Son** He sends, and the Father''s Spirit resting upon Him. The voice speaks the royal decree of the second Psalm: *I will declare the decree: Yahuah (LORD) hath said unto me, Thou art my Son; this day have I begotten thee* (Psalm 2:7) — the Son is begotten, declared, set as king upon Zion by the Father. The descending Spirit fulfils Isaiah''s word over the chosen Servant: *Behold my servant, whom I uphold; mine elect, in whom my soul delighteth; I have put my spirit upon him* (Isaiah 42:1) — *in whom my soul delighteth* and *in whom I am well pleased* are the same Father''s delight in the same Son. The dove over the water recalls the very first page: *And the Spirit of Elohim moved upon the face of the waters* (Genesis 1:2) — the Spirit that brooded over creation now broods over the One in whom all is made new. This is the anointing Isaiah promised for the Branch of Jesse: *And the spirit of Yahuah shall rest upon him, the spirit of wisdom and understanding, the spirit of counsel and might* (Isaiah 11:2); and the Spirit put within the shepherd of old: *where is he that put his holy Spirit within him?* (Isaiah 63:11). The Formed Son does nothing of Himself; the Father declares Him, the Father''s Spirit endues Him, and so He goes forth to do the Father''s will.',
       sv.verse_id, ev.verse_id, 'free', 13003
  FROM _mk01_lookup sv, _mk01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=1 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='mark' AND ev.chapter_number=1 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'mark-1-forty-days-in-the-wilderness-the-kingdom-at-hand-deut-8-daniel-2',
       E'Forty days in the wilderness, the kingdom at hand — the true Yashar''el proved (Deuteronomy 8; Daniel 2)',
       E'No sooner is the Son declared than He is driven out to be tested: *And immediately the Spirit driveth him into the wilderness. And he was there in the wilderness forty days, tempted of Satan; and was with the wild beasts; and the angels ministered unto him* (Mark 1:12-13). Come and see the pattern. Yashar''el was forty YEARS in the wilderness and failed the proving: *thou shalt remember all the way which Yahuah Elohayka led thee these forty years in the wilderness, to humble thee, and to prove thee, to know what was in thine heart, whether thou wouldest keep his commandments, or no* (Deuteronomy 8:2) — and the lesson learned there was *man doth not live by bread only, but by every word that proceedeth out of the mouth of Yahuah doth man live* (Deuteronomy 8:3). The Son is the true Yashar''el, forty days proven and NOT failing. Moses kept the same fast on the mount: *he was there with Yahuah forty days and forty nights; he did neither eat bread, nor drink water* (Exodus 34:28); and Elijah walked it: *he... went in the strength of that meat forty days and forty nights unto Horeb the mount of Elohim* (1 Kings 19:8) — and as an angel fed Elijah, so *the angels ministered* to the Son. Then the proving done, He preaches: *The time is fulfilled, and the kingdom of Elohim is at hand: repent ye, and believe the gospel* (Mark 1:15). This is the kingdom Daniel saw: *in the days of these kings shall the Elohim of heaven set up a kingdom, which shall never be destroyed... and it shall stand for ever* (Daniel 2:44) — the stone cut without hands, now near. And *repent* is no new word: it is Moses'' call to *return unto Yahuah Elohayka... with all thine heart, and with all thy soul* (Deuteronomy 30:2), the turning that brings the scattered home. Tested like Israel, victorious where Israel fell, the Son opens the everlasting kingdom with a call to return to the covenant.',
       sv.verse_id, ev.verse_id, 'free', 13006
  FROM _mk01_lookup sv, _mk01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=1 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='mark' AND ev.chapter_number=1 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'mark-1-the-leper-cleansed-sent-to-keep-what-moses-commanded-leviticus-13-14',
       E'The leper cleansed — sent to keep what Moses commanded (Leviticus 13-14)',
       E'A leper falls at His feet: *If thou wilt, thou canst make me clean. And Yahusha, moved with compassion, put forth his hand, and touched him, and saith unto him, I will; be thou clean* (Mark 1:40-41), *and immediately the leprosy departed from him, and he was cleansed* (Mark 1:42). Come and see what He does next, for here is the whole posture toward the Torah: *go thy way, shew thyself to the priest, and offer for thy cleansing those things which Moses commanded, for a testimony unto them* (Mark 1:44). The Son does not abolish the law of the leper — He SENDS the man to keep it. Moses wrote it: *This shall be the law of the leper in the day of his cleansing: He shall be brought unto the priest* (Leviticus 14:2). The man had lived the curse of it: *the leper in whom the plague is, his clothes shall be rent, and his head bare... and shall cry, Unclean, unclean* (Leviticus 13:45), *without the camp shall his habitation be* (Leviticus 13:46) — cut off, dwelling alone. Now restored, he goes to the priest as Moses commanded, the Torah upheld and honoured. The Tanakh had foreshadowed such a cleansing in Naaman: *his flesh came again like unto the flesh of a little child, and he was clean* (2 Kings 5:14) — but Yahusha is greater than Elisha, cleansing with a word and a touch. And where Moses could only cry *Heal her now, O Elohim, I beseech thee* (Numbers 12:13) over leprous Miriam, the Son speaks in His own person, *I will; be thou clean* — the Father''s healing mercy exercised in the Formed Son, who then sends the healed man straight back into the keeping of the commandment.',
       sv.verse_id, ev.verse_id, 'free', 13009
  FROM _mk01_lookup sv, _mk01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=1 AND sv.verse_number=40
   AND ev.edition_slug='canon' AND ev.book_slug='mark' AND ev.chapter_number=1 AND ev.verse_number=44
ON CONFLICT (slug) DO NOTHING;

-- 3d. thread_members -------------------------------------------------------
-- Thread 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Malachi 3:1 — *Behold, I will send my messenger, and he shall prepare the way before me: and Yahuah, whom ye seek, shall suddenly come to his temple* — Mark quotes it; the way is prepared for Yahuah Himself.'
  FROM cross_reference_threads t, cross_references x, _mk01_lookup sv, _mk01_lookup tv
 WHERE t.slug='mark-1-prepare-ye-the-way-of-yahuah-the-forerunner-malachi-3-isaiah-40'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=1 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=3 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 40:3 — *The voice of him that crieth in the wilderness, Prepare ye the way of Yahuah, make straight in the desert a highway for our Elohim* — the wilderness voice Mark 1:3 lifts verbatim.'
  FROM cross_reference_threads t, cross_references x, _mk01_lookup sv, _mk01_lookup tv
 WHERE t.slug='mark-1-prepare-ye-the-way-of-yahuah-the-forerunner-malachi-3-isaiah-40'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=1 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=40 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Malachi 4:5 — *Behold, I will send you Elijah the prophet before the coming of the great and dreadful day of Yahuah* — the Elijah-to-come who is the messenger.'
  FROM cross_reference_threads t, cross_references x, _mk01_lookup sv, _mk01_lookup tv
 WHERE t.slug='mark-1-prepare-ye-the-way-of-yahuah-the-forerunner-malachi-3-isaiah-40'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=1 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=4 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Kings 1:8 — *He was an hairy man, and girt with a girdle of leather about his loins... It is Elijah the Tishbite* — John''s camel-hair-and-leather is Elijah''s very garb (Mark 1:6).'
  FROM cross_reference_threads t, cross_references x, _mk01_lookup sv, _mk01_lookup tv
 WHERE t.slug='mark-1-prepare-ye-the-way-of-yahuah-the-forerunner-malachi-3-isaiah-40'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=1 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=1 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 2:7 — *Yahuah hath said unto me, Thou art my Son; this day have I begotten thee* — the Father''s royal decree, spoken as the heavenly voice in Mark 1:11.'
  FROM cross_reference_threads t, cross_references x, _mk01_lookup sv, _mk01_lookup tv
 WHERE t.slug='mark-1-thou-art-my-beloved-son-the-father-declares-and-anoints-psalm-2-isaiah-42'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=1 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 42:1 — *Behold my servant... mine elect, in whom my soul delighteth; I have put my spirit upon him* — the Father''s delight and the Spirit put upon the Servant, made visible at Jordan.'
  FROM cross_reference_threads t, cross_references x, _mk01_lookup sv, _mk01_lookup tv
 WHERE t.slug='mark-1-thou-art-my-beloved-son-the-father-declares-and-anoints-psalm-2-isaiah-42'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=1 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=42 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 1:2 — *the Spirit of Elohim moved upon the face of the waters* — the same Ruach that brooded over creation descends like a dove on the Son rising from the waters.'
  FROM cross_reference_threads t, cross_references x, _mk01_lookup sv, _mk01_lookup tv
 WHERE t.slug='mark-1-thou-art-my-beloved-son-the-father-declares-and-anoints-psalm-2-isaiah-42'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=1 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 11:2 — *And the spirit of Yahuah shall rest upon him, the spirit of wisdom and understanding* — the Branch of Jesse on whom the Spirit rests, the anointing seen at the baptism.'
  FROM cross_reference_threads t, cross_references x, _mk01_lookup sv, _mk01_lookup tv
 WHERE t.slug='mark-1-thou-art-my-beloved-son-the-father-declares-and-anoints-psalm-2-isaiah-42'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=1 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Isaiah 63:11 — *where is he that put his holy Spirit within him?* — the holy Spirit put within the shepherd of old, now put within the greater Shepherd at the Jordan.'
  FROM cross_reference_threads t, cross_references x, _mk01_lookup sv, _mk01_lookup tv
 WHERE t.slug='mark-1-thou-art-my-beloved-son-the-father-declares-and-anoints-psalm-2-isaiah-42'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=1 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=63 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 8:2 — *Yahuah Elohayka led thee these forty years in the wilderness, to humble thee, and to prove thee* — Israel''s forty-year proving that the Son retraces in forty days and does not fail.'
  FROM cross_reference_threads t, cross_references x, _mk01_lookup sv, _mk01_lookup tv
 WHERE t.slug='mark-1-forty-days-in-the-wilderness-the-kingdom-at-hand-deut-8-daniel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=1 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=8 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 34:28 — *he was there with Yahuah forty days and forty nights; he did neither eat bread, nor drink water* — Moses'' forty-day fast on the mount, a shadow of the Son''s wilderness fast.'
  FROM cross_reference_threads t, cross_references x, _mk01_lookup sv, _mk01_lookup tv
 WHERE t.slug='mark-1-forty-days-in-the-wilderness-the-kingdom-at-hand-deut-8-daniel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=1 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=34 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Kings 19:8 — *he... went in the strength of that meat forty days and forty nights unto Horeb the mount of Elohim* — Elijah''s forty days, an angel sustaining him as angels ministered to the Son.'
  FROM cross_reference_threads t, cross_references x, _mk01_lookup sv, _mk01_lookup tv
 WHERE t.slug='mark-1-forty-days-in-the-wilderness-the-kingdom-at-hand-deut-8-daniel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=1 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=19 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Daniel 2:44 — *shall the Elohim of heaven set up a kingdom, which shall never be destroyed... and it shall stand for ever* — the everlasting kingdom the Son proclaims at hand.'
  FROM cross_reference_threads t, cross_references x, _mk01_lookup sv, _mk01_lookup tv
 WHERE t.slug='mark-1-forty-days-in-the-wilderness-the-kingdom-at-hand-deut-8-daniel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=1 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=2 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Deuteronomy 30:2 — *And shalt return unto Yahuah Elohayka, and shalt obey his voice... with all thine heart* — the covenant call to return that *repent ye* (Mark 1:15) renews; the turning that gathers the scattered home.'
  FROM cross_reference_threads t, cross_references x, _mk01_lookup sv, _mk01_lookup tv
 WHERE t.slug='mark-1-forty-days-in-the-wilderness-the-kingdom-at-hand-deut-8-daniel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=1 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 14:2 — *This shall be the law of the leper in the day of his cleansing: He shall be brought unto the priest* — the very Torah Yahusha sends the cleansed man to keep (Mark 1:44).'
  FROM cross_reference_threads t, cross_references x, _mk01_lookup sv, _mk01_lookup tv
 WHERE t.slug='mark-1-the-leper-cleansed-sent-to-keep-what-moses-commanded-leviticus-13-14'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=1 AND sv.verse_number=44
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=14 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 13:45 — *the leper... his clothes shall be rent... and shall cry, Unclean, unclean* — the curse the man came out of, dwelling alone without the camp (13:46).'
  FROM cross_reference_threads t, cross_references x, _mk01_lookup sv, _mk01_lookup tv
 WHERE t.slug='mark-1-the-leper-cleansed-sent-to-keep-what-moses-commanded-leviticus-13-14'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=1 AND sv.verse_number=44
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=13 AND tv.verse_number=45
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Kings 5:14 — *his flesh came again like unto the flesh of a little child, and he was clean* — Naaman''s cleansing prefigures the leper''s; the Son is greater than Elisha.'
  FROM cross_reference_threads t, cross_references x, _mk01_lookup sv, _mk01_lookup tv
 WHERE t.slug='mark-1-the-leper-cleansed-sent-to-keep-what-moses-commanded-leviticus-13-14'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=1 AND sv.verse_number=42
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=5 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Numbers 12:13 — *And Moses cried unto Yahuah, saying, Heal her now, O Elohim, I beseech thee* — over leprous Miriam; what Moses could only beseech, the Son does in His own person (Mark 1:41).'
  FROM cross_reference_threads t, cross_references x, _mk01_lookup sv, _mk01_lookup tv
 WHERE t.slug='mark-1-the-leper-cleansed-sent-to-keep-what-moses-commanded-leviticus-13-14'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=1 AND sv.verse_number=41
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=12 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session260 — Mark (depth) cross-references complete.'
