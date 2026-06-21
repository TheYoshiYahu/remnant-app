-- =====================================================================
-- Session 260 — Mark (depth) FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py /tmp/nt-depth-wt/data-schema/migrations/session260_mark_depth_cross_references.sql
-- =====================================================================

\echo 'session260 — Mark (depth) cross-references starting...'
BEGIN;

-- ----- fragment: minion_mark_02.sql -----
-- ============================================================================
-- Mark 2 — full-library Come-and-See cross-reference threads (NT DEPTH pass)
-- EMPTY/greenfield chapter. 4 threads.
-- band base 13030, step +3.
-- ============================================================================

-- 3a. Temp view -------------------------------------------------------------
CREATE TEMP VIEW _mk02_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1',
   'pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- 3b. cross_references rows -------------------------------------------------
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- Thread 1: 2:10 — the Son of Adam hath power on earth to forgive sins
  ('canon','mark',2,10,'canon','isaiah',43,25, 'free', E'*I, even I, am he that blotteth out thy transgressions for mine own sake, and will not remember thy sins.* (Isaiah 43:25). The scribes reasoned rightly that none can forgive sins but Elohim — and here is the Formed Son doing the very thing the Father claimed as his own prerogative.'),
  ('canon','mark',2,10,'canon','psalms',103,3, 'free', E'*Who forgiveth all thine iniquities; who healeth all thy diseases;* (Psalm 103:3). Forgiveness and healing are one motion in Yahuah — and one motion here in the Son: he speaks the pardon, then proves it by raising the palsied man up.'),
  ('canon','mark',2,10,'canon','exodus',34,7, 'free', E'*Keeping mercy for thousands, forgiving iniquity and transgression and sin...* (Exodus 34:7). The name Yahuah proclaimed to Mosheh is the name of a forgiving Elohim; the Son of Adam exercises that same forgiving on earth.'),
  ('canon','mark',2,10,'canon','micah',7,18, 'free', E'*Who is a Elohim (God) like unto thee, that pardoneth iniquity, and passeth by the transgression of the remnant of his heritage?...* (Micah 7:18). The pardon of the remnant is Yahuah''s glory — and the Son works it before their eyes.'),
  ('canon','mark',2,10,'canon','daniel',7,13, 'free', E'*I saw in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days...* (Daniel 7:13). The title he claims — Son of Adam — is the figure Daniyel saw given dominion; the kaph stands, he is *like* the Son of Adam, the Formed One who took on flesh.'),
  ('canon','mark',2,10,'canon','matthew',9,6, 'free', E'*But that ye may know that the Son of Adam hath power on earth to forgive sins...* (Matthew 9:6). Mattityahu records the same word; the witness of two gospels stands.'),

  -- Thread 2: 2:17 — I came not to call the righteous, but sinners
  ('canon','mark',2,17,'canon','hosea',6,6, 'free', E'*For I desired mercy, and not sacrifice; and the knowledge of Elohim (God) more than burnt offerings.* (Hosea 6:6). The eating with publicans is not lawlessness but the weightier matter of the Torah — mercy — sought out and worked.'),
  ('canon','mark',2,17,'canon','ezekiel',34,16, 'free', E'*I will seek that which was lost, and bring again that which was driven away, and will bind up that which was broken, and will strengthen that which was sick...* (Ezekiel 34:16). The Shepherd of Yashar''el seeks the sick and the scattered; the physician comes for them that are sick.'),
  ('canon','mark',2,17,'canon','psalms',51,17, 'free', E'*The sacrifices of Elohim (God) are a broken spirit: a broken and a contrite heart, O Elohim (God), thou wilt not despise.* (Psalm 51:17). He calls sinners to repentance — and the broken heart is the sacrifice he will not despise.'),
  ('canon','mark',2,17,'apocrypha','ecclesiasticus',18,13, 'extras', E'*The mercy of man is toward his neighbour; but the mercy of Yahuah (God) is upon all flesh: he reproveth, and nurtureth, and teaches and brings again, as a shepherd his flock.* (Sirach 18:13). The library''s own wisdom names it: Yahuah''s mercy reaches all flesh, bringing the sick and the strayed again as a shepherd brings his flock.'),
  ('canon','mark',2,17,'canon','matthew',9,13, 'free', E'*But go ye and learn what that meaneth, I will have mercy, and not sacrifice: for I am not come to call the righteous, but sinners to repentance.* (Matthew 9:13). Mattityahu has him quote Hosea by name over this very table.'),

  -- Thread 3: 2:21-22 — new wine / new garment = the renewed covenant
  ('canon','mark',2,22,'canon','jeremiah',31,31, 'free', E'*Behold, the days come, saith Yahuah (LORD), that I will make a new covenant with the house of Yashar''el (Israel), and with the house of Yahudah (Judah):* (Jeremiah 31:31). The new wine is the renewed covenant — promised to BOTH houses, the two sticks gathered into one.'),
  ('canon','mark',2,22,'canon','jeremiah',31,33, 'free', E'*...I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people.* (Jeremiah 31:33). The renewed covenant is the SAME Torah — moved from tablets of stone into the heart. New wine, not a new law.'),
  ('canon','mark',2,19,'canon','joel',2,16, 'free', E'*Gather the people, sanctify the congregation... let the bridegroom go forth of his chamber, and the bride out of her closet.* (Joel 2:16). He names himself the bridegroom; the children of the bridechamber cannot fast while he is with them.'),
  ('canon','mark',2,19,'canon','isaiah',62,5, 'free', E'*...as the bridegroom rejoiceth over the bride, so shall thy Elohim (God) rejoice over thee.* (Isaiah 62:5). The bridegroom''s joy is Yahuah''s joy over restored Yashar''el — the marriage the prophets foretold.'),
  ('canon','mark',2,19,'canon','isaiah',54,5, 'free', E'*For thy Maker is thine husband; Yahuah Tseva''ot (LORD of hosts) is his name; and thy Redeemer the Holy One of Yashar''el (Israel)...* (Isaiah 54:5). The husband of Yashar''el is her Maker and Redeemer — the bridegroom standing among them.'),

  -- Thread 4 (KEYSTONE): 2:27-28 — the sabbath made for man, the Son of Adam Lord of it
  ('canon','mark',2,27,'canon','genesis',2,3, 'free', E'*And Elohim (God) blessed the seventh day, and sanctified it: because that in it he had rested from all his work which Elohim (God) created and made.* (Genesis 2:3). "Made for man" reaches back to creation: the Sabbath was blessed and sanctified for mankind before Sinai, the Maker''s gift to Adam''s race.'),
  ('canon','mark',2,27,'canon','exodus',20,11, 'free', E'*For in six days Yahuah (LORD) made heaven and earth... and rested the seventh day: wherefore Yahuah (LORD) blessed the sabbath day, and hallowed it.* (Exodus 20:11). The fourth word grounds the Sabbath in creation itself — hallowed by Yahuah, kept by man.'),
  ('canon','mark',2,27,'canon','deuteronomy',5,14, 'free', E'*But the seventh day is the sabbath of Yahuah Elohayka (the LORD thy God)... that thy manservant and thy maidservant may rest as well as thou.* (Deuteronomy 5:14). The Sabbath was GIVEN as rest and mercy for man — "made for man" is exactly the heart of the commandment, never its abolition.'),
  ('canon','mark',2,27,'jubilees','jubilees',2,19, 'extras', E'*And He said to us: "Behold, I will separate to Myself a people from among all the peoples, and these will keep the Sabbath day, and I will sanctify them to Myself as My people..."* (Jubilees 2:19). The library''s witness: the Sabbath is the sign of the sanctified people — given, not taken away.'),
  ('canon','mark',2,28,'canon','deuteronomy',23,25, 'free', E'*When thou comest into the standing corn of thy neighbour, then thou mayest pluck the ears with thine hand; but thou shalt not move a sickle...* (Deuteronomy 23:25). The plucking was itself LAWFUL by the Torah; the Pharisees'' charge fails on the Torah''s own word.'),
  ('canon','mark',2,28,'canon','1-samuel',21,6, 'free', E'*So the priest gave him hallowed bread: for there was no bread there but the shewbread, that was taken from before Yahuah (LORD)...* (1 Samuel 21:6). David and his men ate the shewbread in need; mercy and need are read INTO the Torah, not against it.'),
  ('canon','mark',2,28,'canon','leviticus',24,8, 'free', E'*Every sabbath he shall set it in order before Yahuah (LORD) continually, being taken from the children of Yashar''el (Israel) by an everlasting covenant.* (Leviticus 24:8). The shewbread David ate was the Sabbath bread of the everlasting covenant — the Lord of the Sabbath reads his own ordinance rightly.'),
  ('canon','mark',2,28,'jubilees','jubilees',2,20, 'extras', E'*And I have chosen the seed of Jacob from amongst all... and have sanctified him to Myself for ever and ever; and I will teach them the Sabbath day, that they may keep Sabbath thereon from all work.* (Jubilees 2:20). The Sabbath is taught to be kept for ever — the Son of Adam is its right Lord and Interpreter, not its abolisher.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _mk02_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _mk02_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- 3c. Threads ---------------------------------------------------------------
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'mark-2-the-son-of-adam-hath-power-on-earth-to-forgive-sins-isaiah-43-micah-7',
       E'The Son of Adam hath power on earth to forgive sins (Isaiah 43; Micah 7)',
       E'The scribes reasoned in their hearts, *Why doth this man thus speak blasphemies? who can forgive sins but Elohim (God) only?* (Mark 2:7) — and they were right that the pardon of sins belongs to Yahuah alone. *I, even I, am he that blotteth out thy transgressions for mine own sake, and will not remember thy sins.* (Isaiah 43:25). *Who forgiveth all thine iniquities; who healeth all thy diseases;* (Psalm 103:3) — forgiving and healing are one motion in him. The name proclaimed to Mosheh is the name of this Elohim: *Keeping mercy for thousands, forgiving iniquity and transgression and sin...* (Exodus 34:7). *Who is a Elohim (God) like unto thee, that pardoneth iniquity, and passeth by the transgression of the remnant of his heritage? he retaineth not his anger for ever, because he delighteth in mercy.* (Micah 7:18). So when the Formed Son says, *Son, thy sins be forgiven thee,* he is not robbing the Father — he is the Father''s own prerogative made visible, the One through whom Yahuah forgives. And the title he takes is no accident: *I saw in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days...* (Daniel 7:13) — *that ye may know that the Son of Adam hath power on earth to forgive sins* (Mark 2:10). The kaph stands; he is *like* the Son of Adam, the Formed One who took on Adam''s flesh and was given dominion by the Ancient of days. Mattityahu sets down the same word — *that ye may know that the Son of Adam hath power on earth to forgive sins* (Matthew 9:6) — and the two witnesses agree.',
       sv.verse_id, sv.verse_id, 'free', 13030
  FROM _mk02_lookup sv
 WHERE sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=2 AND sv.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'mark-2-i-came-not-to-call-the-righteous-but-sinners-hosea-6-ezekiel-34-sirach-18',
       E'I came not to call the righteous, but sinners — mercy and not sacrifice (Hosea 6; Ezekiel 34; Sirach 18)',
       E'When the scribes and Pharisees ask why he eats with publicans and sinners, he answers, *They that are whole have no need of the physician, but they that are sick: I came not to call the righteous, but sinners to repentance.* (Mark 2:17). This is not the Torah loosened but the Torah''s own weightier matter sought out: *For I desired mercy, and not sacrifice; and the knowledge of Elohim (God) more than burnt offerings.* (Hosea 6:6). The physician goes after the sick because the Shepherd goes after the strayed: *I will seek that which was lost, and bring again that which was driven away, and will bind up that which was broken, and will strengthen that which was sick...* (Ezekiel 34:16). And the repentance he calls them to is the broken heart Yahuah never despises: *The sacrifices of Elohim (God) are a broken spirit: a broken and a contrite heart, O Elohim (God), thou wilt not despise.* (Psalm 51:17). The library''s wisdom had already named the heart of it: *The mercy of man is toward his neighbour; but the mercy of Yahuah (God) is upon all flesh: he reproveth, and nurtureth, and teaches and brings again, as a shepherd his flock.* (Sirach 18:13). Over this very table Mattityahu has him quote the prophet by name — *But go ye and learn what that meaneth, I will have mercy, and not sacrifice: for I am not come to call the righteous, but sinners to repentance.* (Matthew 9:13). Mercy is the Torah weightily kept, not the Torah set aside.',
       sv.verse_id, sv.verse_id, 'extras', 13033
  FROM _mk02_lookup sv
 WHERE sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=2 AND sv.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'mark-2-new-wine-new-garment-the-bridegroom-and-the-renewed-covenant-jeremiah-31-isaiah-54',
       E'New wine, new garment — the bridegroom and the renewed covenant (Jeremiah 31; Isaiah 54)',
       E'*Can the children of the bridechamber fast, while the bridegroom is with them?* (Mark 2:19). He names himself the bridegroom, and the prophets had already set the wedding: *Gather the people, sanctify the congregation... let the bridegroom go forth of his chamber, and the bride out of her closet.* (Joel 2:16). *...as the bridegroom rejoiceth over the bride, so shall thy Elohim (God) rejoice over thee.* (Isaiah 62:5). The bride is restored Yashar''el and the husband is her Maker: *For thy Maker is thine husband; Yahuah Tseva''ot (LORD of hosts) is his name; and thy Redeemer the Holy One of Yashar''el (Israel)...* (Isaiah 54:5). Then he speaks of new cloth and new wine: *And no man putteth new wine into old bottles... but new wine must be put into new bottles.* (Mark 2:22). The new wine is not a different law but the renewed covenant the prophet promised: *Behold, the days come, saith Yahuah (LORD), that I will make a new covenant with the house of Yashar''el (Israel), and with the house of Yahudah (Judah):* (Jeremiah 31:31) — promised to BOTH houses, the two sticks gathered into one. And what is renewed in it? *...I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people.* (Jeremiah 31:33). The SAME Torah, moved from tablets of stone into the heart. New wine, new garment — renewal, never replacement.',
       sv.verse_id, ev.verse_id, 'free', 13036
  FROM _mk02_lookup sv, _mk02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=2 AND sv.verse_number=19
   AND ev.edition_slug='canon' AND ev.book_slug='mark' AND ev.chapter_number=2 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'mark-2-the-sabbath-was-made-for-man-the-son-of-adam-lord-of-the-sabbath-genesis-2-exodus-20-jubilees-2',
       E'The sabbath was made for man — the Son of Adam Lord of the sabbath (Genesis 2; Exodus 20; Jubilees 2)',
       E'This is the banner of the chapter, and it does NOT say what the pulpit claims. The disciples pluck the ears of corn on the Sabbath, the Pharisees charge them — and the Lord of the Sabbath answers first from the Torah''s own word, for the plucking was lawful: *When thou comest into the standing corn of thy neighbour, then thou mayest pluck the ears with thine hand; but thou shalt not move a sickle unto thy neighbour''s standing corn.* (Deuteronomy 23:25). Then he reminds them of David: *So the priest gave him hallowed bread: for there was no bread there but the shewbread, that was taken from before Yahuah (LORD)...* (1 Samuel 21:6) — the very Sabbath bread of the everlasting covenant: *Every sabbath he shall set it in order before Yahuah (LORD) continually, being taken from the children of Yashar''el (Israel) by an everlasting covenant.* (Leviticus 24:8). Mercy and need are read INTO the Torah, not against it. Then comes the word men twist to abolish the day: *The sabbath was made for man, and not man for the sabbath: Therefore the Son of Adam is Yahuah (Lord) also of the sabbath.* (Mark 2:27-28). "Made for man" reaches back to creation, before ever there was a Sinai: *And Elohim (God) blessed the seventh day, and sanctified it: because that in it he had rested from all his work which Elohim (God) created and made.* (Genesis 2:3). The fourth word grounds it there: *For in six days Yahuah (LORD) made heaven and earth... and rested the seventh day: wherefore Yahuah (LORD) blessed the sabbath day, and hallowed it.* (Exodus 20:11). And the commandment itself names it a mercy and a rest FOR man: *But the seventh day is the sabbath of Yahuah Elohayka (the LORD thy God)... that thy manservant and thy maidservant may rest as well as thou.* (Deuteronomy 5:14). The library knew it too: *...I will separate to Myself a people from among all the peoples, and these will keep the Sabbath day, and I will sanctify them to Myself as My people...* (Jubilees 2:19); *...and I will teach them the Sabbath day, that they may keep Sabbath thereon from all work.* (Jubilees 2:20). "Made for man" is the Sabbath UPHELD — the Maker''s gift to Adam''s race — and the Son of Adam is its right Lord and Interpreter, the One who keeps it rightly with mercy, NOT the One who breaks or abolishes it.',
       sv.verse_id, ev.verse_id, 'extras', 13039
  FROM _mk02_lookup sv, _mk02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=2 AND sv.verse_number=27
   AND ev.edition_slug='canon' AND ev.book_slug='mark' AND ev.chapter_number=2 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

-- 3d. Thread members --------------------------------------------------------
-- Thread 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 43:25 — *I, even I, am he that blotteth out thy transgressions for mine own sake, and will not remember thy sins.* The Father''s own prerogative — pardon — exercised in the Formed Son.'
  FROM cross_reference_threads t, cross_references x, _mk02_lookup sv, _mk02_lookup tv
 WHERE t.slug='mark-2-the-son-of-adam-hath-power-on-earth-to-forgive-sins-isaiah-43-micah-7'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=2 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=43 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 103:3 — *Who forgiveth all thine iniquities; who healeth all thy diseases;* Forgiving and healing are one motion — and one motion here in the Son.'
  FROM cross_reference_threads t, cross_references x, _mk02_lookup sv, _mk02_lookup tv
 WHERE t.slug='mark-2-the-son-of-adam-hath-power-on-earth-to-forgive-sins-isaiah-43-micah-7'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=2 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=103 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 34:7 — *Keeping mercy for thousands, forgiving iniquity and transgression and sin...* The name Yahuah proclaimed to Mosheh is the name of a forgiving Elohim.'
  FROM cross_reference_threads t, cross_references x, _mk02_lookup sv, _mk02_lookup tv
 WHERE t.slug='mark-2-the-son-of-adam-hath-power-on-earth-to-forgive-sins-isaiah-43-micah-7'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=2 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=34 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Micah 7:18 — *Who is a Elohim (God) like unto thee, that pardoneth iniquity, and passeth by the transgression of the remnant of his heritage?...* The pardon of the remnant is Yahuah''s glory.'
  FROM cross_reference_threads t, cross_references x, _mk02_lookup sv, _mk02_lookup tv
 WHERE t.slug='mark-2-the-son-of-adam-hath-power-on-earth-to-forgive-sins-isaiah-43-micah-7'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=2 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=7 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Daniel 7:13 — *...one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days...* The title he claims is the figure given dominion; the kaph stands — *like* the Son of Adam, the Formed One in flesh.'
  FROM cross_reference_threads t, cross_references x, _mk02_lookup sv, _mk02_lookup tv
 WHERE t.slug='mark-2-the-son-of-adam-hath-power-on-earth-to-forgive-sins-isaiah-43-micah-7'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=2 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Matthew 9:6 — *But that ye may know that the Son of Adam hath power on earth to forgive sins...* The same word in Mattityahu; two witnesses agree.'
  FROM cross_reference_threads t, cross_references x, _mk02_lookup sv, _mk02_lookup tv
 WHERE t.slug='mark-2-the-son-of-adam-hath-power-on-earth-to-forgive-sins-isaiah-43-micah-7'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=2 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=9 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hosea 6:6 — *For I desired mercy, and not sacrifice; and the knowledge of Elohim (God) more than burnt offerings.* Eating with sinners is the weightier matter of the Torah — mercy — not its loosening.'
  FROM cross_reference_threads t, cross_references x, _mk02_lookup sv, _mk02_lookup tv
 WHERE t.slug='mark-2-i-came-not-to-call-the-righteous-but-sinners-hosea-6-ezekiel-34-sirach-18'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=2 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=6 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 34:16 — *I will seek that which was lost, and bring again that which was driven away, and will bind up that which was broken, and will strengthen that which was sick...* The Shepherd seeks the sick and scattered; the physician comes for them.'
  FROM cross_reference_threads t, cross_references x, _mk02_lookup sv, _mk02_lookup tv
 WHERE t.slug='mark-2-i-came-not-to-call-the-righteous-but-sinners-hosea-6-ezekiel-34-sirach-18'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=2 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=34 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 51:17 — *The sacrifices of Elohim (God) are a broken spirit: a broken and a contrite heart, O Elohim (God), thou wilt not despise.* The repentance he calls sinners to is the broken heart Yahuah will not despise.'
  FROM cross_reference_threads t, cross_references x, _mk02_lookup sv, _mk02_lookup tv
 WHERE t.slug='mark-2-i-came-not-to-call-the-righteous-but-sinners-hosea-6-ezekiel-34-sirach-18'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=2 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=51 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Sirach 18:13 — *...the mercy of Yahuah (God) is upon all flesh: he reproveth, and nurtureth, and teaches and brings again, as a shepherd his flock.* The library''s wisdom: Yahuah''s mercy reaches all flesh, bringing the strayed again as a shepherd.'
  FROM cross_reference_threads t, cross_references x, _mk02_lookup sv, _mk02_lookup tv
 WHERE t.slug='mark-2-i-came-not-to-call-the-righteous-but-sinners-hosea-6-ezekiel-34-sirach-18'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=2 AND sv.verse_number=17
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=18 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Matthew 9:13 — *...I will have mercy, and not sacrifice: for I am not come to call the righteous, but sinners to repentance.* Mattityahu has him quote Hosea by name over this very table.'
  FROM cross_reference_threads t, cross_references x, _mk02_lookup sv, _mk02_lookup tv
 WHERE t.slug='mark-2-i-came-not-to-call-the-righteous-but-sinners-hosea-6-ezekiel-34-sirach-18'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=2 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=9 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joel 2:16 — *...let the bridegroom go forth of his chamber, and the bride out of her closet.* He names himself the bridegroom; the children of the bridechamber cannot fast while he is with them.'
  FROM cross_reference_threads t, cross_references x, _mk02_lookup sv, _mk02_lookup tv
 WHERE t.slug='mark-2-new-wine-new-garment-the-bridegroom-and-the-renewed-covenant-jeremiah-31-isaiah-54'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=2 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 62:5 — *...as the bridegroom rejoiceth over the bride, so shall thy Elohim (God) rejoice over thee.* The bridegroom''s joy is Yahuah''s joy over restored Yashar''el.'
  FROM cross_reference_threads t, cross_references x, _mk02_lookup sv, _mk02_lookup tv
 WHERE t.slug='mark-2-new-wine-new-garment-the-bridegroom-and-the-renewed-covenant-jeremiah-31-isaiah-54'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=2 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=62 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 54:5 — *For thy Maker is thine husband; Yahuah Tseva''ot (LORD of hosts) is his name; and thy Redeemer the Holy One of Yashar''el (Israel)...* The husband of Yashar''el is her Maker and Redeemer — the bridegroom among them.'
  FROM cross_reference_threads t, cross_references x, _mk02_lookup sv, _mk02_lookup tv
 WHERE t.slug='mark-2-new-wine-new-garment-the-bridegroom-and-the-renewed-covenant-jeremiah-31-isaiah-54'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=2 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=54 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jeremiah 31:31 — *...I will make a new covenant with the house of Yashar''el (Israel), and with the house of Yahudah (Judah):* The new wine is the renewed covenant — promised to BOTH houses, the two sticks gathered into one.'
  FROM cross_reference_threads t, cross_references x, _mk02_lookup sv, _mk02_lookup tv
 WHERE t.slug='mark-2-new-wine-new-garment-the-bridegroom-and-the-renewed-covenant-jeremiah-31-isaiah-54'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=2 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jeremiah 31:33 — *...I will put my law in their inward parts, and write it in their hearts...* The renewed covenant is the SAME Torah, moved into the heart. New wine, not a new law.'
  FROM cross_reference_threads t, cross_references x, _mk02_lookup sv, _mk02_lookup tv
 WHERE t.slug='mark-2-new-wine-new-garment-the-bridegroom-and-the-renewed-covenant-jeremiah-31-isaiah-54'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=2 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4 members (keystone)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 2:3 — *And Elohim (God) blessed the seventh day, and sanctified it...* "Made for man" reaches back to creation: the Sabbath blessed and sanctified for mankind before ever there was a Sinai.'
  FROM cross_reference_threads t, cross_references x, _mk02_lookup sv, _mk02_lookup tv
 WHERE t.slug='mark-2-the-sabbath-was-made-for-man-the-son-of-adam-lord-of-the-sabbath-genesis-2-exodus-20-jubilees-2'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=2 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 20:11 — *For in six days Yahuah (LORD) made heaven and earth... and rested the seventh day: wherefore Yahuah (LORD) blessed the sabbath day, and hallowed it.* The fourth word grounds the Sabbath in creation — hallowed by Yahuah, kept by man.'
  FROM cross_reference_threads t, cross_references x, _mk02_lookup sv, _mk02_lookup tv
 WHERE t.slug='mark-2-the-sabbath-was-made-for-man-the-son-of-adam-lord-of-the-sabbath-genesis-2-exodus-20-jubilees-2'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=2 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 5:14 — *...that thy manservant and thy maidservant may rest as well as thou.* The Sabbath was GIVEN as rest and mercy for man — "made for man" is the heart of the commandment, never its abolition.'
  FROM cross_reference_threads t, cross_references x, _mk02_lookup sv, _mk02_lookup tv
 WHERE t.slug='mark-2-the-sabbath-was-made-for-man-the-son-of-adam-lord-of-the-sabbath-genesis-2-exodus-20-jubilees-2'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=2 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=5 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 2:19 — *...these will keep the Sabbath day, and I will sanctify them to Myself as My people...* The library''s witness: the Sabbath is the sign of the sanctified people — given, not taken away.'
  FROM cross_reference_threads t, cross_references x, _mk02_lookup sv, _mk02_lookup tv
 WHERE t.slug='mark-2-the-sabbath-was-made-for-man-the-son-of-adam-lord-of-the-sabbath-genesis-2-exodus-20-jubilees-2'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=2 AND sv.verse_number=27
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=2 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Deuteronomy 23:25 — *...then thou mayest pluck the ears with thine hand; but thou shalt not move a sickle...* The plucking was itself LAWFUL by the Torah; the Pharisees'' charge fails on the Torah''s own word.'
  FROM cross_reference_threads t, cross_references x, _mk02_lookup sv, _mk02_lookup tv
 WHERE t.slug='mark-2-the-sabbath-was-made-for-man-the-son-of-adam-lord-of-the-sabbath-genesis-2-exodus-20-jubilees-2'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=2 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=23 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'1 Samuel 21:6 — *So the priest gave him hallowed bread...the shewbread, that was taken from before Yahuah (LORD)...* David and his men ate the shewbread in need; mercy and need are read INTO the Torah, not against it.'
  FROM cross_reference_threads t, cross_references x, _mk02_lookup sv, _mk02_lookup tv
 WHERE t.slug='mark-2-the-sabbath-was-made-for-man-the-son-of-adam-lord-of-the-sabbath-genesis-2-exodus-20-jubilees-2'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=2 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=21 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Leviticus 24:8 — *Every sabbath he shall set it in order before Yahuah (LORD) continually... by an everlasting covenant.* The shewbread David ate was the Sabbath bread of the everlasting covenant — its right Lord reads his own ordinance.'
  FROM cross_reference_threads t, cross_references x, _mk02_lookup sv, _mk02_lookup tv
 WHERE t.slug='mark-2-the-sabbath-was-made-for-man-the-son-of-adam-lord-of-the-sabbath-genesis-2-exodus-20-jubilees-2'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=2 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=24 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 8, E'Jubilees 2:20 — *...and I will teach them the Sabbath day, that they may keep Sabbath thereon from all work.* The Sabbath is taught to be kept for ever — the Son of Adam is its right Lord and Interpreter, not its abolisher.'
  FROM cross_reference_threads t, cross_references x, _mk02_lookup sv, _mk02_lookup tv
 WHERE t.slug='mark-2-the-sabbath-was-made-for-man-the-son-of-adam-lord-of-the-sabbath-genesis-2-exodus-20-jubilees-2'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=2 AND sv.verse_number=28
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=2 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_mark_06.sql -----
-- =====================================================================
-- minion_mark_06.sql  —  Mark 6 full-library Come-and-See cross-references
-- EMPTY/greenfield chapter. 6 threads. Band base 13150, step +3.
-- =====================================================================

-- 3a. Temp view -------------------------------------------------------
CREATE TEMP VIEW _mk06_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1',
   'pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- 3b. cross_references rows ------------------------------------------
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- THREAD 1: a prophet not without honour / unbelief (6:4)
  ('canon','mark',6,4,'canon','1-samuel',8,7, 'free', E'*And Yahuah (LORD) said unto Samuel, Hearken unto the voice of the people in all that they say unto thee: for they have not rejected thee, but they have rejected me, that I should not reign over them.* (1 Samuel 8:7). When Yashar''el (Israel) refused the one Yahuah (LORD) sent, the rejection ran past the messenger to the One who sent him. So it is at Nazareth: the offence is not against a carpenter only, but against the Father who sent the Son.'),
  ('canon','mark',6,4,'canon','jeremiah',11,21, 'free', E'*Therefore thus saith Yahuah (LORD) of the men of Anathoth, that seek thy life, saying, Prophesy not in the name of Yahuah (LORD), that thou die not by our hand:* (Jeremiah 11:21). The prophet''s own townsmen — the men of his own country — sought his life. The pattern is old: the sent one rejected first by his own kin.'),
  ('canon','mark',6,4,'canon','ezekiel',2,3, 'free', E'*And he said unto me, Son of Adam, I send thee to the children of Yashar''el (Israel), to a rebellious nation that hath rebelled against me: they and their fathers have transgressed against me, even unto this very day.* (Ezekiel 2:3). Yahuah (LORD) addresses the prophet as *son of Adam* and sends him to a people who will not hear — yet still He sends. The unbelief of some is never the casting-off of the people (Romans 11:1-2).'),
  ('canon','mark',6,4,'canon','isaiah',53,3, 'free', E'*He is despised and rejected of men; a man of sorrows, and acquainted with grief: and we hid as it were our faces from him; he was despised, and we esteemed him not.* (Isaiah 53:3). The despising at Nazareth is the first taste of the servant despised and rejected of his own.'),
  -- THREAD 2: sent by two and two / power over unclean spirits (6:7)
  ('canon','mark',6,7,'canon','numbers',11,16, 'free', E'*And Yahuah (LORD) said unto Moses, Gather unto me seventy men of the elders of Yashar''el (Israel), whom thou knowest to be the elders of the people, and officers over them; and bring them unto the tabernacle of the congregation, that they may stand there with thee.* (Numbers 11:16). The Son does what Yahuah (LORD) did through Moses — He gathers and sends out delegates to bear the work, the Spirit upon them.'),
  ('canon','mark',6,7,'canon','numbers',11,17, 'free', E'*And I will come down and talk with thee there: and I will take of the spirit which is upon thee, and will put it upon them; and they shall bear the burden of the people with thee, that thou bear it not thyself alone.* (Numbers 11:17). The Spirit that was on Moses was put upon the seventy; the authority that is on the Son is put upon the twelve He sends.'),
  ('canon','mark',6,7,'canon','deuteronomy',19,15, 'free', E'*One witness shall not rise up against a man for any iniquity, or for any sin, in any sin that he sinneth: at the mouth of two witnesses, or at the mouth of three witnesses, shall the matter be established.* (Deuteronomy 19:15). He sends them *by two and two* — the Torah''s own rule of two witnesses, that the testimony to every city be established in the mouth of two.'),
  ('canon','mark',6,7,'enoch','1-enoch',15,9, 'extras', E'*And the spirits of the giants afflict, oppress, destroy, attack, do battle, and work destruction on the earth, and cause trouble: they take no food, but nevertheless hunger and thirst, and cause offences.* (1 Enoch 15:9). The *unclean spirits* the twelve are given power over are named here — the spirits gone out from the slain giants, the offspring of the Watchers. The library tells you what they are; the Son gives His sent ones authority over them.'),
  ('canon','mark',6,7,'enoch','1-enoch',15,11, 'extras', E'*From the days of the slaughter and destruction and death of the giants, from the souls of whose flesh the spirits, having gone forth, shall destroy without incurring judgement—thus shall they destroy until the day of the consummation, the great judgement in which the age shall be consummated, over the Watchers and the godless, yea, shall be wholly consummated.* (1 Enoch 15:11). They destroy *until the day of the consummation* — but the Son, before that day, already hands their conquest to twelve men with nothing but a staff.'),
  -- THREAD 3: Herod / John beheaded / Herodias / the oath (6:14-29)
  ('canon','mark',6,18,'canon','leviticus',18,16, 'free', E'*Thou shalt not uncover the nakedness of thy brother''s wife: it is thy brother''s nakedness.* (Leviticus 18:16). John told Herod *It is not lawful for thee to have thy brother''s wife* — and here is the law he stood on. The forerunner died for a Torah word he would not soften.'),
  ('canon','mark',6,18,'canon','leviticus',20,21, 'free', E'*And if a man shall take his brother''s wife, it is an unclean thing: he hath uncovered his brother''s nakedness; they shall be childless.* (Leviticus 20:21). The same statute, with its sentence. John did not invent a private rule; he held up the unchanging instruction of Yahuah (LORD), and Herodias hated him for it.'),
  ('canon','mark',6,17,'canon','1-kings',19,2, 'free', E'*Then Jezebel sent a messenger unto Elijah, saying, So let the gods do to me, and more also, if I make not thy life as the life of one of them by to morrow about this time.* (1 Kings 19:2). The wife of the wicked king hunts the prophet''s life. Herodias is Jezebel''s shadow, and John walks Elijah''s road — for Yahusha (Jesus) calls him the Elijah who was to come.'),
  ('canon','mark',6,19,'canon','1-kings',19,10, 'free', E'*And he said, I have been very jealous for Yahuah Elohim (the LORD God) of hosts: for the children of Yashar''el (Israel) have forsaken thy covenant, thrown down thine altars, and slain thy prophets with the sword; and I, even I only, am left; and they seek my life, to take it away.* (1 Kings 19:10). *They have slain thy prophets... and they seek my life* — Elijah''s lament is the forerunner''s grave. The hunt for the prophet runs the length of scripture.'),
  ('canon','mark',6,22,'canon','proverbs',29,10, 'free', E'*The bloodthirsty hate the upright: but the just seek his soul.* (Proverbs 29:10). Herod knew John *was a just man and an holy*, yet the bloodthirsty at his table hated the upright — and an oath sworn over a dance cost a righteous man his head.'),
  ('canon','mark',6,22,'apocrypha','ecclesiasticus',9,8, 'extras', E'*Turn away your eye from a beautiful woman, and look not upon another''s beauty; for many have been deceived by the beauty of a woman; for herewith love is kindled as a fire.* (Sirach 9:8). The wise word names the snare that took Herod: the dance pleased the king, and his eye, kindled, swore away half a kingdom — and a prophet''s life.'),
  -- THREAD 4: feeding the five thousand / sheep without a shepherd (6:34-44)
  ('canon','mark',6,34,'canon','numbers',27,17, 'free', E'*Which may go out before them, and which may go in before them, and which may lead them out, and which may bring them in; that the congregation of Yahuah (LORD) be not as sheep which have no shepherd.* (Numbers 27:17). Moses prayed Yahuah (LORD) would set a shepherd over the flock. Here that Shepherd stands in the wilderness, moved with compassion, *because they were as sheep not having a shepherd.*'),
  ('canon','mark',6,34,'canon','ezekiel',34,5, 'free', E'*And they were scattered, because there is no shepherd: and they became meat to all the beasts of the field, when they were scattered.* (Ezekiel 34:5). The scattered flock of Yashar''el (Israel) — both houses driven and lost — is the very crowd He looks upon. The gathering has begun.'),
  ('canon','mark',6,34,'canon','ezekiel',34,23, 'free', E'*And I will set up one shepherd over them, and he shall feed them, even my servant David; he shall feed them, and he shall be their shepherd.* (Ezekiel 34:23). The *one shepherd* of David''s line — promised to gather the two sticks into one flock — is the One who now feeds them on the green grass.'),
  ('canon','mark',6,37,'canon','2-kings',4,43, 'free', E'*And his servitor said, What, should I set this before an hundred men? He said again, Give the people, that they may eat: for thus saith Yahuah (LORD), They shall eat, and shall leave thereof.* (2 Kings 4:43). Elisha fed a hundred from twenty loaves and there was left over. A greater than Elisha feeds five thousand from five, and twelve baskets remain.'),
  ('canon','mark',6,42,'canon','2-kings',4,44, 'free', E'*So he set it before them, and they did eat, and left thereof, according to the word of Yahuah (LORD).* (2 Kings 4:44). *They did eat, and left thereof* — the very sign Mark records: *they did all eat, and were filled,* and twelve baskets of fragments taken up.'),
  ('canon','mark',6,41,'canon','psalms',78,24, 'free', E'*And had rained down manna upon them to eat, and had given them of the corn of heaven.* (Psalm 78:24). The Shepherd who fed Yashar''el (Israel) bread from heaven in the first wilderness spreads a table again in this one — the same hand, the same provision.'),
  ('canon','mark',6,39,'canon','psalms',23,2, 'free', E'*He maketh me to lie down in green pastures: he leadeth me beside the still waters.* (Psalm 23:2). He *commanded them to make all sit down by companies upon the green grass* — David''s psalm walked off the page. Yahuah Ra''ah (The LORD is my shepherd) is laying His sheep down in green pastures with His own hands.'),
  -- THREAD 5: walking on the sea / it is I, be not afraid (6:45-52)
  ('canon','mark',6,48,'canon','job',9,8, 'free', E'*Which alone spreadeth out the heavens, and treadeth upon the waves of the sea.* (Job 9:8). Job names the One who *alone... treadeth upon the waves of the sea* — and in the fourth watch the disciples see Him do it. The Creator''s own work is wrought through the Formed Son.'),
  ('canon','mark',6,50,'canon','exodus',3,14, 'free', E'*And Elohim (God) said unto Moses, Ehyeh asher Ehyeh (I AM THAT I AM): and he said, Thus shalt thou say unto the children of Yashar''el (Israel), I AM hath sent me unto you.* (Exodus 3:14). *It is I; be not afraid* — the very *I AM* that spoke from the bush, now voiced through the Son who walks the water. The Father''s self-naming sounds in the Formed Son''s mouth.'),
  ('canon','mark',6,48,'canon','exodus',33,22, 'free', E'*And it shall come to pass, while my glory passeth by, that I will put thee in a clift of the rock, and will cover thee with my hand while I pass by:* (Exodus 33:22). *He would have passed by them* — the same passing-by of glory Yahuah (LORD) showed Moses on the rock. This is no chance crossing; it is a theophany on the deep.'),
  ('canon','mark',6,48,'canon','psalms',77,19, 'free', E'*Thy way is in the sea, and thy path in the great waters, and thy footsteps are not known.* (Psalm 77:19). The psalm sang of the One whose *way is in the sea* — and the disciples watch those footsteps the world cannot find pressed into the waves before them.'),
  ('canon','mark',6,51,'canon','psalms',107,29, 'free', E'*He maketh the storm a calm, so that the waves thereof are still.* (Psalm 107:29). *He went up unto them into the ship; and the wind ceased.* The One the psalm credits with stilling the storm steps aboard, and the contrary wind dies.'),
  -- THREAD 6: the border of his garment / the healing fringe (6:56)
  ('canon','mark',6,56,'canon','numbers',15,38, 'free', E'*Speak unto the children of Yashar''el (Israel), and bid them that they make them fringes in the borders of their garments throughout their generations, and that they put upon the fringe of the borders a ribband of blue:* (Numbers 15:38). The *border of his garment* the sick reached for is the tzitzit the Torah commanded — Yahusha (Jesus) wore the fringe Yahuah (LORD) appointed, and healing flowed from it.'),
  ('canon','mark',6,56,'canon','numbers',15,39, 'free', E'*And it shall be unto you for a fringe, that ye may look upon it, and remember all the commandments of Yahuah (LORD), and do them; and that ye seek not after your own heart and your own eyes, after which ye use to go a whoring:* (Numbers 15:39). The fringe was given to *remember all the commandments of Yahuah (LORD), and do them.* The very token of remembered Torah becomes the point of touch where the sick are made whole.'),
  ('canon','mark',6,56,'canon','malachi',4,2, 'free', E'*But unto you that fear my name shall the Sun of righteousness arise with healing in his wings; and ye shall go forth, and grow up as calves of the stall.* (Malachi 4:2). *Healing in his wings* — the *kanaph*, the corner of the garment where the fringe hangs. Malachi foretold the healing in the very hem the crowds pressed to touch.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _mk06_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _mk06_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- 3c. Threads ---------------------------------------------------------
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'mark-6-a-prophet-not-without-honour-rejected-by-his-own-1-samuel-8-jeremiah-11-isaiah-53',
       E'A prophet is not without honour, but in his own country — rejected by his own (1 Samuel 8; Jeremiah 11; Isaiah 53)',
       E'Yahusha (Jesus) comes home to Nazareth, and *they were offended at him* — so much that *he could there do no mighty work... because of their unbelief.* He answers with a word as old as the prophets: *A prophet is not without honour, but in his own country, and among his own kin, and in his own house* (Mark 6:4).\n\nThe rejection is not new. When Yashar''el (Israel) refused the one sent to lead them, Yahuah (LORD) said the offence ran past the messenger: *they have not rejected thee, but they have rejected me, that I should not reign over them* (1 Samuel 8:7). Jeremiah''s own townsmen turned on him — *thus saith Yahuah (LORD) of the men of Anathoth, that seek thy life, saying, Prophesy not in the name of Yahuah (LORD)* (Jeremiah 11:21). And Ezekiel was sent, eyes open, to a people who would not hear: *Son of Adam, I send thee to the children of Yashar''el (Israel), to a rebellious nation* (Ezekiel 2:3) — yet still Yahuah (LORD) sent him. The unbelief of some is never the casting-off of the people; Elohim (God) hath not cast away His own.\n\nIsaiah named where this road ends: *He is despised and rejected of men; a man of sorrows, and acquainted with grief... he was despised, and we esteemed him not* (Isaiah 53:3). The hometown door slammed at Nazareth is the first turn of the servant''s long despising. Come and see — the One they could not honour is the One the whole book foretold they would not.',
       sv.verse_id, sv.verse_id, 'free', 13150
  FROM _mk06_lookup sv
 WHERE sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=6 AND sv.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'mark-6-sent-by-two-and-two-power-over-unclean-spirits-numbers-11-deuteronomy-19-1-enoch-15',
       E'Sent forth by two and two, with power over unclean spirits (Numbers 11; Deuteronomy 19; 1 Enoch 15)',
       E'*And he called unto him the twelve, and began to send them forth by two and two; and gave them power over unclean spirits* (Mark 6:7). Every piece of this sending is rooted in the library.\n\nThe Son does what Yahuah (LORD) did through Moses: *Gather unto me seventy men of the elders of Yashar''el (Israel)... that they may stand there with thee* (Numbers 11:16), and *I will take of the spirit which is upon thee, and will put it upon them; and they shall bear the burden of the people with thee* (Numbers 11:17). The authority on the Son is laid on the twelve He sends, just as the Spirit on Moses was put on the seventy.\n\nHe sends them *by two and two* — the Torah''s own rule of testimony: *at the mouth of two witnesses, or at the mouth of three witnesses, shall the matter be established* (Deuteronomy 19:15). Every city receives a witness the Torah itself would count valid.\n\nAnd what are the *unclean spirits* they are given power over? The library names them. They are the spirits gone out from the slain giants, the offspring of the Watchers: *the spirits of the giants afflict, oppress, destroy, attack, do battle, and work destruction on the earth... they take no food, but nevertheless hunger and thirst, and cause offences* (1 Enoch 15:9). They were sentenced to *destroy until the day of the consummation, the great judgement... over the Watchers and the godless* (1 Enoch 15:11) — yet before that day the Son hands their conquest to twelve men carrying nothing but a staff. Come and see how old the enemy is, and how easily the Sent One overrules him.',
       sv.verse_id, sv.verse_id, 'extras', 13153
  FROM _mk06_lookup sv
 WHERE sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=6 AND sv.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'mark-6-john-beheaded-the-forerunner-slain-leviticus-18-1-kings-19-sirach-9',
       E'John the Baptist beheaded — the forerunner slain as Elijah was hunted (Leviticus 18; 1 Kings 19; Sirach 9)',
       E'John told Herod plainly: *It is not lawful for thee to have thy brother''s wife* (Mark 6:18). He stood on the Torah and would not move. The statute is written: *Thou shalt not uncover the nakedness of thy brother''s wife: it is thy brother''s nakedness* (Leviticus 18:16), and with its sentence, *if a man shall take his brother''s wife, it is an unclean thing... they shall be childless* (Leviticus 20:21). John invented no private rule; he held up the unchanging word, and Herodias hated him for it.\n\nThe pattern is Elijah''s. The wicked king''s wife hunts the prophet: *Jezebel sent a messenger unto Elijah, saying, So let the gods do to me, and more also, if I make not thy life as the life of one of them* (1 Kings 19:2). Elijah''s lament is the forerunner''s grave: *the children of Yashar''el (Israel) have forsaken thy covenant... and slain thy prophets with the sword... and they seek my life* (1 Kings 19:10). Herodias is Jezebel''s shadow, and John walks Elijah''s road — for Yahusha (Jesus) named him the Elijah who was to come.\n\nHerod knew it. He held John *a just man and an holy* — and the wise word warns where men like Herod fall: *Turn away your eye from a beautiful woman... for many have been deceived by the beauty of a woman; for herewith love is kindled as a fire* (Sirach 9:8). The dance pleased the king, his oath was sworn, and *the bloodthirsty hate the upright* (Proverbs 29:10) cost a righteous man his head. The forerunner dies the prophet''s death; the One he announced will walk the same road.',
       sv.verse_id, ev.verse_id, 'extras', 13156
  FROM _mk06_lookup sv, _mk06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=6 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='mark' AND ev.chapter_number=6 AND ev.verse_number=29
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'mark-6-feeding-the-five-thousand-sheep-without-a-shepherd-numbers-27-ezekiel-34-2-kings-4',
       E'Feeding the five thousand — the Shepherd of Yashar''el feeds the scattered flock (Numbers 27; Ezekiel 34; 2 Kings 4)',
       E'*Yahusha (Jesus), when he came out, saw much people, and was moved with compassion toward them, because they were as sheep not having a shepherd* (Mark 6:34). That phrase is Moses'' own prayer: that Yahuah (LORD) would set a man over the congregation, *that the congregation of Yahuah (LORD) be not as sheep which have no shepherd* (Numbers 27:17). The Shepherd Moses prayed for now stands in the wilderness.\n\nWhom does He look upon? The scattered flock of Yashar''el (Israel): *they were scattered, because there is no shepherd... when they were scattered* (Ezekiel 34:5). And the promise over that scattering: *I will set up one shepherd over them... even my servant David; he shall feed them, and he shall be their shepherd* (Ezekiel 34:23). The one shepherd of David''s line, sent to gather the two sticks into one flock, is feeding His sheep here.\n\nHe feeds them as Elisha did, only greater. The prophet fed a hundred from twenty loaves: *they shall eat, and shall leave thereof* (2 Kings 4:43), and *they did eat, and left thereof, according to the word of Yahuah (LORD)* (2 Kings 4:44). The Son feeds five thousand from five, and twelve baskets remain. And He lays them down as David sang: *He maketh me to lie down in green pastures* (Psalm 23:2) — *upon the green grass* Mark says — while the bread of heaven comes down again, for Yahuah (LORD) *had rained down manna upon them to eat, and had given them of the corn of heaven* (Psalm 78:24). Come and see the Shepherd gathering and feeding the lost sheep of the house of Yashar''el (Israel).',
       sv.verse_id, ev.verse_id, 'free', 13159
  FROM _mk06_lookup sv, _mk06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=6 AND sv.verse_number=34
   AND ev.edition_slug='canon' AND ev.book_slug='mark' AND ev.chapter_number=6 AND ev.verse_number=44
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'mark-6-walking-upon-the-sea-it-is-i-the-i-am-job-9-exodus-3-psalm-77',
       E'Walking upon the sea — *it is I; be not afraid*, the Father''s I AM voiced through the Son (Job 9; Exodus 3; Psalm 77)',
       E'In the fourth watch the disciples see Him *walking upon the sea, and would have passed by them* (Mark 6:48), and when they cry out He answers, *Be of good cheer: it is I; be not afraid* (Mark 6:50). Every line is a theophany.\n\nJob named the One who does this: *which alone spreadeth out the heavens, and treadeth upon the waves of the sea* (Job 9:8). The Creator''s own footwork, wrought through the Formed Son. The psalm sang it too: *Thy way is in the sea, and thy path in the great waters, and thy footsteps are not known* (Psalm 77:19) — and now those untraceable footsteps are pressed into the waves before their eyes.\n\n*He would have passed by them* is not an aimless crossing. It is the passing-by of glory Yahuah (LORD) showed Moses on the rock: *while my glory passeth by... I will cover thee with my hand while I pass by* (Exodus 33:22). And *it is I* — in the Greek, *I AM* — is the very Name from the bush: *Ehyeh asher Ehyeh (I AM THAT I AM)... I AM hath sent me unto you* (Exodus 3:14). The Father''s self-naming sounds in the mouth of the Son who walks the deep. He is the Formed One who has a Father, and He speaks the Father''s own *I AM*.\n\nThen *he went up unto them into the ship; and the wind ceased* (Mark 6:51) — for *he maketh the storm a calm, so that the waves thereof are still* (Psalm 107:29). The One the psalms credit with stilling the sea steps aboard, and the contrary wind dies. Come and see who walks the water.',
       sv.verse_id, ev.verse_id, 'free', 13162
  FROM _mk06_lookup sv, _mk06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=6 AND sv.verse_number=45
   AND ev.edition_slug='canon' AND ev.book_slug='mark' AND ev.chapter_number=6 AND ev.verse_number=52
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'mark-6-the-border-of-his-garment-healing-in-the-fringe-numbers-15-malachi-4',
       E'They touched the border of his garment — healing in the fringe of the Torah (Numbers 15; Malachi 4)',
       E'Wherever He went, *they laid the sick in the streets, and besought him that they might touch if it were but the border of his garment: and as many as touched him were made whole* (Mark 6:56). That *border* is no ordinary hem. It is the tzitzit, the fringe Yahuah (LORD) commanded: *bid them that they make them fringes in the borders of their garments throughout their generations, and that they put upon the fringe of the borders a ribband of blue* (Numbers 15:38). Yahusha (Jesus) wore the fringe the Torah appointed — He kept the very commandment, and power went out from it.\n\nThe fringe was given for remembrance: *that ye may look upon it, and remember all the commandments of Yahuah (LORD), and do them* (Numbers 15:39). The token of remembered Torah becomes the point where the sick are made whole — the commandment is not a burden but a place of healing.\n\nAnd Malachi foretold it: *unto you that fear my name shall the Sun of righteousness arise with healing in his wings* (Malachi 4:2). The word for *wings* is *kanaph* — the corner of the garment, where the fringe hangs. The healing in His wings is the healing in the hem the crowds reached for. Come and see: the Torah they were told was abolished is the very garment His healing flows through.',
       sv.verse_id, sv.verse_id, 'free', 13165
  FROM _mk06_lookup sv
 WHERE sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=6 AND sv.verse_number=56
ON CONFLICT (slug) DO NOTHING;

-- 3d. Thread members --------------------------------------------------
-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Samuel 8:7 — *they have not rejected thee, but they have rejected me* — the rejection of the sent one runs to the One who sent him.'
  FROM cross_reference_threads t, cross_references x, _mk06_lookup sv, _mk06_lookup tv
 WHERE t.slug='mark-6-a-prophet-not-without-honour-rejected-by-his-own-1-samuel-8-jeremiah-11-isaiah-53'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=6 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=8 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 11:21 — *the men of Anathoth, that seek thy life* — the prophet hated first by his own townsmen.'
  FROM cross_reference_threads t, cross_references x, _mk06_lookup sv, _mk06_lookup tv
 WHERE t.slug='mark-6-a-prophet-not-without-honour-rejected-by-his-own-1-samuel-8-jeremiah-11-isaiah-53'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=6 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=11 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 2:3 — *Son of Adam, I send thee... to a rebellious nation* — sent to those who will not hear, yet sent; Romans 11:1-2 guard, not casting-off.'
  FROM cross_reference_threads t, cross_references x, _mk06_lookup sv, _mk06_lookup tv
 WHERE t.slug='mark-6-a-prophet-not-without-honour-rejected-by-his-own-1-samuel-8-jeremiah-11-isaiah-53'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=6 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=2 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 53:3 — *despised and rejected of men* — the hometown rejection is the first taste of the servant despised.'
  FROM cross_reference_threads t, cross_references x, _mk06_lookup sv, _mk06_lookup tv
 WHERE t.slug='mark-6-a-prophet-not-without-honour-rejected-by-his-own-1-samuel-8-jeremiah-11-isaiah-53'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=6 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 11:16 — *Gather unto me seventy men of the elders* — the Son delegates and sends as Yahuah (LORD) did through Moses.'
  FROM cross_reference_threads t, cross_references x, _mk06_lookup sv, _mk06_lookup tv
 WHERE t.slug='mark-6-sent-by-two-and-two-power-over-unclean-spirits-numbers-11-deuteronomy-19-1-enoch-15'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=6 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=11 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 11:17 — *I will take of the spirit which is upon thee, and will put it upon them* — the authority on the Son laid on the twelve.'
  FROM cross_reference_threads t, cross_references x, _mk06_lookup sv, _mk06_lookup tv
 WHERE t.slug='mark-6-sent-by-two-and-two-power-over-unclean-spirits-numbers-11-deuteronomy-19-1-enoch-15'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=6 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=11 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 19:15 — *at the mouth of two witnesses... shall the matter be established* — sent *by two and two*, the Torah''s rule of testimony.'
  FROM cross_reference_threads t, cross_references x, _mk06_lookup sv, _mk06_lookup tv
 WHERE t.slug='mark-6-sent-by-two-and-two-power-over-unclean-spirits-numbers-11-deuteronomy-19-1-enoch-15'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=6 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=19 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 15:9 — *the spirits of the giants afflict, oppress, destroy* — the library names the unclean spirits: the offspring of the Watchers.'
  FROM cross_reference_threads t, cross_references x, _mk06_lookup sv, _mk06_lookup tv
 WHERE t.slug='mark-6-sent-by-two-and-two-power-over-unclean-spirits-numbers-11-deuteronomy-19-1-enoch-15'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=6 AND sv.verse_number=7
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=15 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Enoch 15:11 — they destroy *until the day of the consummation* — yet the Son hands their conquest to twelve men with a staff before that day.'
  FROM cross_reference_threads t, cross_references x, _mk06_lookup sv, _mk06_lookup tv
 WHERE t.slug='mark-6-sent-by-two-and-two-power-over-unclean-spirits-numbers-11-deuteronomy-19-1-enoch-15'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=6 AND sv.verse_number=7
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=15 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 18:16 — *the nakedness of thy brother''s wife* — the Torah word John stood on, unsoftened.'
  FROM cross_reference_threads t, cross_references x, _mk06_lookup sv, _mk06_lookup tv
 WHERE t.slug='mark-6-john-beheaded-the-forerunner-slain-leviticus-18-1-kings-19-sirach-9'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=6 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=18 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 20:21 — *if a man shall take his brother''s wife, it is an unclean thing* — the same statute with its sentence.'
  FROM cross_reference_threads t, cross_references x, _mk06_lookup sv, _mk06_lookup tv
 WHERE t.slug='mark-6-john-beheaded-the-forerunner-slain-leviticus-18-1-kings-19-sirach-9'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=6 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=20 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Kings 19:2 — Jezebel hunts Elijah''s life — Herodias is her shadow; John walks Elijah''s road.'
  FROM cross_reference_threads t, cross_references x, _mk06_lookup sv, _mk06_lookup tv
 WHERE t.slug='mark-6-john-beheaded-the-forerunner-slain-leviticus-18-1-kings-19-sirach-9'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=6 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=19 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Kings 19:10 — *they... slain thy prophets... and they seek my life* — Elijah''s lament is the forerunner''s grave.'
  FROM cross_reference_threads t, cross_references x, _mk06_lookup sv, _mk06_lookup tv
 WHERE t.slug='mark-6-john-beheaded-the-forerunner-slain-leviticus-18-1-kings-19-sirach-9'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=6 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=19 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Proverbs 29:10 — *The bloodthirsty hate the upright* — the just man held holy by Herod, hated by the table.'
  FROM cross_reference_threads t, cross_references x, _mk06_lookup sv, _mk06_lookup tv
 WHERE t.slug='mark-6-john-beheaded-the-forerunner-slain-leviticus-18-1-kings-19-sirach-9'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=6 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=29 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Sirach 9:8 — *many have been deceived by the beauty of a woman* — the snare that took Herod: the dance, the kindled oath.'
  FROM cross_reference_threads t, cross_references x, _mk06_lookup sv, _mk06_lookup tv
 WHERE t.slug='mark-6-john-beheaded-the-forerunner-slain-leviticus-18-1-kings-19-sirach-9'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=6 AND sv.verse_number=22
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=9 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 27:17 — *that the congregation... be not as sheep which have no shepherd* — Moses'' prayer answered in the Son.'
  FROM cross_reference_threads t, cross_references x, _mk06_lookup sv, _mk06_lookup tv
 WHERE t.slug='mark-6-feeding-the-five-thousand-sheep-without-a-shepherd-numbers-27-ezekiel-34-2-kings-4'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=6 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=27 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 34:5 — *they were scattered, because there is no shepherd* — the scattered flock of Yashar''el (Israel) is the very crowd.'
  FROM cross_reference_threads t, cross_references x, _mk06_lookup sv, _mk06_lookup tv
 WHERE t.slug='mark-6-feeding-the-five-thousand-sheep-without-a-shepherd-numbers-27-ezekiel-34-2-kings-4'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=6 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=34 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 34:23 — *I will set up one shepherd... even my servant David* — the one shepherd gathering the two sticks into one flock.'
  FROM cross_reference_threads t, cross_references x, _mk06_lookup sv, _mk06_lookup tv
 WHERE t.slug='mark-6-feeding-the-five-thousand-sheep-without-a-shepherd-numbers-27-ezekiel-34-2-kings-4'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=6 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=34 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Kings 4:43 — *They shall eat, and shall leave thereof* — Elisha feeds a hundred from twenty; a greater feeds five thousand.'
  FROM cross_reference_threads t, cross_references x, _mk06_lookup sv, _mk06_lookup tv
 WHERE t.slug='mark-6-feeding-the-five-thousand-sheep-without-a-shepherd-numbers-27-ezekiel-34-2-kings-4'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=6 AND sv.verse_number=37
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=4 AND tv.verse_number=43
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'2 Kings 4:44 — *they did eat, and left thereof* — the very sign Mark records: filled, with twelve baskets over.'
  FROM cross_reference_threads t, cross_references x, _mk06_lookup sv, _mk06_lookup tv
 WHERE t.slug='mark-6-feeding-the-five-thousand-sheep-without-a-shepherd-numbers-27-ezekiel-34-2-kings-4'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=6 AND sv.verse_number=42
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=4 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Psalm 78:24 — *rained down manna... the corn of heaven* — the Shepherd who fed Yashar''el (Israel) once spreads a table again.'
  FROM cross_reference_threads t, cross_references x, _mk06_lookup sv, _mk06_lookup tv
 WHERE t.slug='mark-6-feeding-the-five-thousand-sheep-without-a-shepherd-numbers-27-ezekiel-34-2-kings-4'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=6 AND sv.verse_number=41
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=78 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Psalm 23:2 — *He maketh me to lie down in green pastures* — *upon the green grass* (Mark 6:39); David''s psalm walked off the page.'
  FROM cross_reference_threads t, cross_references x, _mk06_lookup sv, _mk06_lookup tv
 WHERE t.slug='mark-6-feeding-the-five-thousand-sheep-without-a-shepherd-numbers-27-ezekiel-34-2-kings-4'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=6 AND sv.verse_number=39
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=23 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Job 9:8 — *treadeth upon the waves of the sea* — the Creator''s own work, wrought through the Formed Son.'
  FROM cross_reference_threads t, cross_references x, _mk06_lookup sv, _mk06_lookup tv
 WHERE t.slug='mark-6-walking-upon-the-sea-it-is-i-the-i-am-job-9-exodus-3-psalm-77'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=6 AND sv.verse_number=48
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=9 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 3:14 — *Ehyeh asher Ehyeh (I AM THAT I AM)* — *it is I* is the Name from the bush, the Father''s I AM voiced through the Son.'
  FROM cross_reference_threads t, cross_references x, _mk06_lookup sv, _mk06_lookup tv
 WHERE t.slug='mark-6-walking-upon-the-sea-it-is-i-the-i-am-job-9-exodus-3-psalm-77'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=6 AND sv.verse_number=50
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=3 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 33:22 — *while my glory passeth by... I pass by* — *he would have passed by them* is the passing-by of glory shown Moses.'
  FROM cross_reference_threads t, cross_references x, _mk06_lookup sv, _mk06_lookup tv
 WHERE t.slug='mark-6-walking-upon-the-sea-it-is-i-the-i-am-job-9-exodus-3-psalm-77'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=6 AND sv.verse_number=48
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=33 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 77:19 — *Thy way is in the sea... thy footsteps are not known* — those untraceable footsteps pressed into the waves before them.'
  FROM cross_reference_threads t, cross_references x, _mk06_lookup sv, _mk06_lookup tv
 WHERE t.slug='mark-6-walking-upon-the-sea-it-is-i-the-i-am-job-9-exodus-3-psalm-77'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=6 AND sv.verse_number=48
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=77 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Psalm 107:29 — *He maketh the storm a calm* — He steps aboard and the contrary wind ceases.'
  FROM cross_reference_threads t, cross_references x, _mk06_lookup sv, _mk06_lookup tv
 WHERE t.slug='mark-6-walking-upon-the-sea-it-is-i-the-i-am-job-9-exodus-3-psalm-77'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=6 AND sv.verse_number=51
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=107 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 6 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 15:38 — *make them fringes in the borders of their garments... a ribband of blue* — the *border* the sick touched is the tzitzit Yahuah (LORD) commanded.'
  FROM cross_reference_threads t, cross_references x, _mk06_lookup sv, _mk06_lookup tv
 WHERE t.slug='mark-6-the-border-of-his-garment-healing-in-the-fringe-numbers-15-malachi-4'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=6 AND sv.verse_number=56
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=15 AND tv.verse_number=38
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 15:39 — *remember all the commandments of Yahuah (LORD), and do them* — the token of remembered Torah is the point of healing-touch.'
  FROM cross_reference_threads t, cross_references x, _mk06_lookup sv, _mk06_lookup tv
 WHERE t.slug='mark-6-the-border-of-his-garment-healing-in-the-fringe-numbers-15-malachi-4'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=6 AND sv.verse_number=56
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=15 AND tv.verse_number=39
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Malachi 4:2 — *healing in his wings* — *kanaph*, the corner where the fringe hangs; the healing foretold in the very hem the crowds reached for.'
  FROM cross_reference_threads t, cross_references x, _mk06_lookup sv, _mk06_lookup tv
 WHERE t.slug='mark-6-the-border-of-his-garment-healing-in-the-fringe-numbers-15-malachi-4'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=6 AND sv.verse_number=56
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=4 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_mark_09.sql -----
-- minion_mark_09.sql — Mark 9 (NT DEPTH pass, THIN-ADD)
-- 5 NEW threads. DOES NOT touch 9:43-48 (existing worm-dieth-not thread).
-- Blocks: 9:2-8 Transfiguration / 9:9-13 Elias-restores / 9:14-29 deaf-dumb spirit /
--         9:33-37 who-is-greatest / 9:49-50 salt-of-the-covenant.

-- 3a. Temp view
CREATE TEMP VIEW _mk09_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1',
   'pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- 3b. cross_references rows
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- ===== 9:2-8 Transfiguration =====
  ('canon','mark',9,2,'canon','exodus',34,29, 'free', E'*And it came to pass, when Moses came down from mount Sinai with the two tables of testimony in Moses'' hand, when he came down from the mount, that Moses wist not that the skin of his face shone while he talked with him.* (Exodus 34:29). Moses'' face shone with a borrowed glory after he had been with Yahuah (LORD); on the mount the Formed Son'' s own raiment *became shining, exceeding white as snow* — the glory is his own, not reflected.'),
  ('canon','mark',9,2,'canon','deuteronomy',18,15, 'free', E'*Yahuah Elohayka (The LORD thy God) will raise up unto thee a Prophet from the midst of thee, of thy brethren, like unto me; unto him ye shall hearken.* (Deuteronomy 18:15). The Father'' s word from the cloud — *hear him* — is Moses'' own promise spoken back: the Prophet like Moses has come, and the command is to hearken to him.'),
  ('canon','mark',9,4,'canon','malachi',4,4, 'free', E'*Remember ye the law of Moses my servant, which I commanded unto him in Horeb for all Yashar''el (Israel), with the statutes and judgments.* (Malachi 4:4). Moses (the Torah) stands on the mount — the Law is not abolished but honoured, talking with the Son.'),
  ('canon','mark',9,4,'canon','malachi',4,5, 'free', E'*Behold, I will send you Elijah the prophet before the coming of the great and dreadful day of Yahuah (LORD).* (Malachi 4:5). Elias (the Prophets) stands beside Moses — Law and Prophets together testify to the Formed Son.'),
  ('canon','mark',9,7,'canon','psalms',2,7, 'free', E'*I will declare the decree: Yahuah (LORD) hath said unto me, Thou art my Son; this day have I begotten thee.* (Psalm 2:7). *This is my beloved Son* is the Father owning the begotten Son — not three co-equal persons, but the Source declaring the One he sent.'),
  ('canon','mark',9,3,'canon','daniel',7,9, 'free', E'*I beheld till the thrones were cast down, and the Ancient of days did sit, whose garment was white as snow, and the hair of his head like the pure wool.* (Daniel 7:9). The raiment *white as snow* on the mount is the glory Daniel saw in heaven — the Formed Son bears the brightness of the throne.'),
  ('canon','mark',9,7,'canon','matthew',17,5, 'free', E'*While he yet spake, behold, a bright cloud overshadowed them: and behold a voice out of the cloud, which said, This is my beloved Son, in whom I am well pleased; hear ye him.* (Matthew 17:5). Matthew records the same voice from the same cloud — the Father bearing witness to the Son he loves.'),

  -- ===== 9:9-13 Elias must first come and restore all things =====
  ('canon','mark',9,12,'canon','malachi',4,5, 'free', E'*Behold, I will send you Elijah the prophet before the coming of the great and dreadful day of Yahuah (LORD).* (Malachi 4:5). The scribes read the promise rightly — *Elias verily cometh first, and restoreth all things* — but missed that *Elias is indeed come* already in the forerunner.'),
  ('canon','mark',9,12,'canon','malachi',4,6, 'free', E'*And he shall turn the heart of the fathers to the children, and the heart of the children to their fathers, lest I come and smite the earth with a curse.* (Malachi 4:6). The Elijah-work is restoration — hearts turned home — the very mending of the scattered house.'),
  ('canon','mark',9,12,'apocrypha','ecclesiasticus',48,10, 'extras', E'*Who were ordained for reproofs in their times, to pacify the wrath of the judgment of Yahuah (God), before it brake forth into fury, and to turn the heart of the father to the son, and to restore the tribes of Jacob.* (Sirach 48:10). The second-Temple readers already knew the Elijah-mission by name: *to restore the tribes of Jacob* — the two-house ingathering, the very *restore all things* the Son speaks of.'),
  ('canon','mark',9,12,'canon','matthew',17,11, 'free', E'*And Yahusha (Jesus) answered and said unto them, Elias truly shall first come, and restore all things.* (Matthew 17:11). Matthew preserves the same word — the forerunner comes first, the restoring is real, and the Son must yet *suffer many things, and be set at nought*.'),

  -- ===== 9:14-29 the dumb and deaf spirit =====
  ('canon','mark',9,24,'canon','psalms',34,18, 'free', E'*Yahuah (LORD) is nigh unto them that are of a broken heart; and saveth such as be of a contrite spirit.* (Psalm 34:18). The father cries *with tears, Yahuah (Lord), I believe; help thou mine unbelief* — and the broken, contrite cry is exactly the cry Yahuah draws near to.'),
  ('canon','mark',9,25,'canon','isaiah',35,5, 'free', E'*Then the eyes of the blind shall be opened, and the ears of the deaf shall be unstopped.* (Isaiah 35:5). The *dumb and deaf spirit* is cast out — the prophet'' s sign of the coming of Elohim is fulfilled in the Son'' s hand.'),
  ('canon','mark',9,25,'canon','isaiah',35,6, 'free', E'*Then shall the lame man leap as an hart, and the tongue of the dumb sing: for in the wilderness shall waters break out, and streams in the desert.* (Isaiah 35:6). *The tongue of the dumb sing* — the deliverance of the dumb child is the very wilderness-healing Isaiah promised.'),
  ('canon','mark',9,25,'enoch','1-enoch',15,9, 'extras', E'*And the spirits of the giants afflict, oppress, destroy, attack, do battle, and work destruction on the earth, and cause trouble.* (1 Enoch 15:9). The library names the foul spirits the Son rebukes — the unclean spirits that *afflict* are the souls gone forth from the slain giants, born of the Watchers'' rebellion.'),
  ('canon','mark',9,25,'enoch','1-enoch',15,11, 'extras', E'*From the days of the slaughter and destruction and death of the giants, from the souls of whose flesh the spirits, having gone forth, shall destroy without incurring judgement—thus shall they destroy until the day of the consummation, the great judgement.* (1 Enoch 15:11). These spirits *destroy until the day of the consummation* — but the Formed Son, with a word, charges this one to *come out of him, and enter no more*: a foretaste of the consummating judgement.'),

  -- ===== 9:33-37 who should be the greatest =====
  ('canon','mark',9,35,'canon','proverbs',15,33, 'free', E'*The fear of Yahuah (LORD) is the instruction of wisdom; and before honour is humility.* (Proverbs 15:33). *If any man desire to be first, the same shall be last of all* — the Son teaches no new law but the Torah of lowliness: *before honour is humility*.'),
  ('canon','mark',9,35,'canon','proverbs',18,12, 'free', E'*Before destruction the heart of man is haughty, and before honour is humility.* (Proverbs 18:12). The disciples disputed *who should be the greatest*; the proverb already warned that the haughty heart goes before destruction, and humility before honour.'),
  ('canon','mark',9,36,'canon','isaiah',57,15, 'free', E'*For thus saith the high and lofty One that inhabiteth eternity, whose name is Holy; I dwell in the high and holy place, with him also that is of a contrite and humble spirit, to revive the spirit of the humble.* (Isaiah 57:15). The High One dwells *with him... that is of a contrite and humble spirit* — and so the Son sets *a little child* in their midst: greatness is measured downward, where Yahuah Himself stoops to dwell.'),

  -- ===== 9:49-50 salted with fire / have salt in yourselves =====
  ('canon','mark',9,49,'canon','leviticus',2,13, 'extras', E'*And every oblation of thy meat offering shalt thou season with salt; neither shalt thou suffer the salt of the covenant of thy Elohim (God) to be lacking from thy meat offering: with all thine offerings thou shalt offer salt.* (Leviticus 2:13). *Every sacrifice shall be salted with salt* is the Torah quoted plain — the salt of the covenant, the seasoning that must never be lacking. The Son speaks from the altar-law, not against it.'),
  ('canon','mark',9,49,'canon','numbers',18,19, 'free', E'*All the heave offerings of the holy things, which the children of Yashar''el (Israel) offer unto Yahuah (LORD), have I given thee, and thy sons and thy daughters with thee, by a statute for ever: it is a covenant of salt for ever before Yahuah (LORD).* (Numbers 18:19). Salt is the sign of a covenant that does not spoil — *a covenant of salt for ever* — so to be *salted with fire* is to be made an enduring, faithful offering.'),
  ('canon','mark',9,50,'canon','2-chronicles',13,5, 'free', E'*Ought ye not to know that Yahuah Elohim (the LORD God) of Yashar''el (Israel) gave the kingdom over Yashar''el (Israel) to David for ever, even to him and to his sons by a covenant of salt?* (2 Chronicles 13:5). The throne of David itself stands by *a covenant of salt* — unbreakable fidelity. *Have salt in yourselves, and have peace one with another* is the same enduring covenant-loyalty asked of his own.'),
  ('canon','mark',9,50,'canon','matthew',5,13, 'free', E'*Ye are the salt of the earth: but if the salt have lost his savour, wherewith shall it be salted?* (Matthew 5:13). *If the salt have lost his saltness, wherewith will ye season it?* — the same warning: covenant savour, once let go, cannot be restored from elsewhere; it must be kept.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _mk09_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _mk09_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- 3c. threads
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'mark-9-transfiguration-moses-and-elijah-hear-him-the-fathers-voice-deut-18-malachi-4-daniel-7',
       E'The Transfiguration — Moses and Elijah, and the Father''s voice, This is my beloved Son: hear him (Deuteronomy 18; Malachi 4; Daniel 7)',
       E'On the high mountain the Formed Son is unveiled: *his raiment became shining, exceeding white as snow; so as no fuller on earth can white them* (Mark 9:3). Moses came down from Sinai with a borrowed shine — *Moses wist not that the skin of his face shone while he talked with him* (Exodus 34:29) — but here the glory is the Son''s own, the brightness Daniel saw at the throne: *the Ancient of days did sit, whose garment was white as snow* (Daniel 7:9).

And there appear *Elias with Moses* (Mark 9:4) — the Prophets and the Torah, standing together to testify. Malachi had bound the two: *Remember ye the law of Moses my servant... in Horeb for all Yashar''el (Israel)* (Malachi 4:4) and *Behold, I will send you Elijah the prophet before the coming of the great and dreadful day of Yahuah (LORD)* (Malachi 4:5). The Law is not abolished on this mount; it is honoured, talking face to face with the Son.

Then *a voice came out of the cloud, saying, This is my beloved Son: hear him* (Mark 9:7). This is the Father — the Source — owning the One he begot: *Thou art my Son; this day have I begotten thee* (Psalm 2:7). It is not three co-equal persons crowded on a mountain; it is the invisible Father bearing witness to the Formed Son he sent. And the command *hear him* is Moses'' own promise spoken back: *Yahuah Elohayka (The LORD thy God) will raise up unto thee a Prophet from the midst of thee, of thy brethren, like unto me; unto him ye shall hearken* (Deuteronomy 18:15). The Prophet like Moses has come; hearken to him. Matthew records the very same voice: *This is my beloved Son, in whom I am well pleased; hear ye him* (Matthew 17:5).',
       sv.verse_id, ev.verse_id, 'free', 13240
  FROM _mk09_lookup sv, _mk09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=9 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='mark' AND ev.chapter_number=9 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'mark-9-elias-must-first-come-and-restore-all-things-restore-the-tribes-of-jacob-malachi-4-sirach-48',
       E'Elias must first come and restore all things — to restore the tribes of Jacob (Malachi 4; Sirach 48)',
       E'Coming down from the mount, the disciples ask, *Why say the scribes that Elias must first come?* And he answers, *Elias verily cometh first, and restoreth all things; and how it is written of the Son of Adam, that he must suffer many things, and be set at nought* (Mark 9:11-12).

The scribes had read the last word of the prophets rightly: *Behold, I will send you Elijah the prophet before the coming of the great and dreadful day of Yahuah (LORD)* (Malachi 4:5). And they knew the work of that mission — *he shall turn the heart of the fathers to the children, and the heart of the children to their fathers, lest I come and smite the earth with a curse* (Malachi 4:6). The Elijah-work is restoration: hearts turned home, the broken house mended.

The library names that restoration plainer still. Of Elijah the wise scribe wrote that he was *ordained for reproofs in their times... and to turn the heart of the father to the son, and to restore the tribes of Jacob* (Sirach 48:10). *To restore the tribes of Jacob* — the two-house ingathering, Judah and the scattered seed of Ephraim gathered into one. That is *restore all things*. But the Son adds the word the scribes had not weighed: before that day, *the Son of Adam... must suffer many things, and be set at nought* — *as it is written of him* (Mark 9:13). Matthew keeps the same teaching: *Elias truly shall first come, and restore all things* (Matthew 17:11).',
       sv.verse_id, ev.verse_id, 'extras', 13243
  FROM _mk09_lookup sv, _mk09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=9 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='mark' AND ev.chapter_number=9 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'mark-9-the-dumb-and-deaf-spirit-cast-out-help-thou-mine-unbelief-isaiah-35-1-enoch-15',
       E'The dumb and deaf spirit cast out — Lord, I believe; help thou mine unbelief (Isaiah 35; 1 Enoch 15)',
       E'A father brings his son *which hath a dumb spirit* that throws him into fire and water, and the disciples could not cast it out (Mark 9:17-18). The Son says, *If thou canst believe, all things are possible to him that believeth.* And the father cries *out, and said with tears, Yahuah (Lord), I believe; help thou mine unbelief* (Mark 9:23-24). It is the broken, honest cry — and *Yahuah (LORD) is nigh unto them that are of a broken heart; and saveth such as be of a contrite spirit* (Psalm 34:18).

What follows is the very sign Isaiah hung on the coming of Elohim. The Son *rebuked the foul spirit, saying unto him, Thou dumb and deaf spirit, I charge thee, come out of him* (Mark 9:25) — and *the eyes of the blind shall be opened, and the ears of the deaf shall be unstopped* (Isaiah 35:5), *the tongue of the dumb sing: for in the wilderness shall waters break out* (Isaiah 35:6).

The whole library knows what this foul spirit is. *The spirits of the giants afflict, oppress, destroy, attack, do battle, and work destruction on the earth, and cause trouble* (1 Enoch 15:9) — the unclean spirits are the souls gone forth from the slain giants, born of the Watchers'' rebellion. And they *destroy without incurring judgement—thus shall they destroy until the day of the consummation, the great judgement in which the age shall be consummated* (1 Enoch 15:11). They roam until the consummation — yet the Formed Son, with one word, charges this one to *come out of him, and enter no more into him* (Mark 9:25). The power that lays hold of the Father is the power that ends their reign; the deliverance of one dumb child is a foretaste of the great judgement to come.',
       sv.verse_id, ev.verse_id, 'extras', 13246
  FROM _mk09_lookup sv, _mk09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=9 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='mark' AND ev.chapter_number=9 AND ev.verse_number=29
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'mark-9-who-should-be-the-greatest-the-last-of-all-and-the-little-child-proverbs-15-isaiah-57',
       E'Who should be the greatest — the last of all, and a little child set in the midst (Proverbs 15; Isaiah 57)',
       E'By the way the disciples *had disputed among themselves, who should be the greatest* (Mark 9:34). The Son sits down, calls the twelve, and overturns the whole ladder: *If any man desire to be first, the same shall be last of all, and servant of all* (Mark 9:35).

This is no new commandment — it is the Torah of lowliness the wisdom-books had always taught. *The fear of Yahuah (LORD) is the instruction of wisdom; and before honour is humility* (Proverbs 15:33). *Before destruction the heart of man is haughty, and before honour is humility* (Proverbs 18:12). The disciples reached for first place; the proverb had already warned that the haughty heart runs ahead of its own ruin, and that humility, not striving, is the road to honour.

Then *he took a child, and set him in the midst of them* and took the child *in his arms* (Mark 9:36) — the one with no rank at all becomes the measure of greatness. For the High One Himself measures this way: *thus saith the high and lofty One that inhabiteth eternity, whose name is Holy; I dwell in the high and holy place, with him also that is of a contrite and humble spirit, to revive the spirit of the humble* (Isaiah 57:15). Greatness in the kingdom is measured downward, to the very place where Yahuah stoops to dwell.',
       sv.verse_id, ev.verse_id, 'free', 13249
  FROM _mk09_lookup sv, _mk09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=9 AND sv.verse_number=33
   AND ev.edition_slug='canon' AND ev.book_slug='mark' AND ev.chapter_number=9 AND ev.verse_number=37
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'mark-9-every-sacrifice-salted-with-salt-the-salt-of-the-covenant-leviticus-2-numbers-18',
       E'Every sacrifice salted with salt — have salt in yourselves: the salt of the covenant (Leviticus 2; Numbers 18)',
       E'The Son closes with a hard saying drawn straight from the altar: *For every one shall be salted with fire, and every sacrifice shall be salted with salt* (Mark 9:49). This is the Torah quoted plain, not set aside: *every oblation of thy meat offering shalt thou season with salt; neither shalt thou suffer the salt of the covenant of thy Elohim (God) to be lacking from thy meat offering: with all thine offerings thou shalt offer salt* (Leviticus 2:13). Salt was the one seasoning that could never be missing from an offering — the salt of the covenant.

And salt meant a covenant that does not spoil. The priests'' portion was given *by a statute for ever: it is a covenant of salt for ever before Yahuah (LORD)* (Numbers 18:19). Even David''s throne stands on it: *Yahuah Elohim (the LORD God) of Yashar''el (Israel) gave the kingdom over Yashar''el (Israel) to David for ever... by a covenant of salt* (2 Chronicles 13:5). To be *salted with fire* is to be made an enduring, faithful offering — covenant-loyalty that the testing fire only proves.

So when he says, *Salt is good: but if the salt have lost his saltness, wherewith will ye season it? Have salt in yourselves, and have peace one with another* (Mark 9:50), the warning is the same one he gave on the mountain: *Ye are the salt of the earth: but if the salt have lost his savour, wherewith shall it be salted?* (Matthew 5:13). The covenant savour, once let go, cannot be borrowed back from somewhere else. It must be kept — and kept, his own are at peace one with another.',
       sv.verse_id, ev.verse_id, 'extras', 13252
  FROM _mk09_lookup sv, _mk09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=9 AND sv.verse_number=49
   AND ev.edition_slug='canon' AND ev.book_slug='mark' AND ev.chapter_number=9 AND ev.verse_number=50
ON CONFLICT (slug) DO NOTHING;

-- 3d. thread_members
-- Thread 1: Transfiguration
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 34:29 — *And it came to pass, when Moses came down from mount Sinai with the two tables of testimony in Moses'' hand... that Moses wist not that the skin of his face shone while he talked with him.* Moses'' shine was borrowed; the Son''s glory is his own.'
  FROM cross_reference_threads t, cross_references x, _mk09_lookup sv, _mk09_lookup tv
 WHERE t.slug='mark-9-transfiguration-moses-and-elijah-hear-him-the-fathers-voice-deut-18-malachi-4-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=9 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=34 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 7:9 — *the Ancient of days did sit, whose garment was white as snow, and the hair of his head like the pure wool.* The throne-brightness of heaven shines on the mount in the Son''s raiment.'
  FROM cross_reference_threads t, cross_references x, _mk09_lookup sv, _mk09_lookup tv
 WHERE t.slug='mark-9-transfiguration-moses-and-elijah-hear-him-the-fathers-voice-deut-18-malachi-4-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=9 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Malachi 4:4 — *Remember ye the law of Moses my servant, which I commanded unto him in Horeb for all Yashar''el (Israel).* Moses on the mount = the Torah honoured, not abolished.'
  FROM cross_reference_threads t, cross_references x, _mk09_lookup sv, _mk09_lookup tv
 WHERE t.slug='mark-9-transfiguration-moses-and-elijah-hear-him-the-fathers-voice-deut-18-malachi-4-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=9 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Malachi 4:5 — *Behold, I will send you Elijah the prophet before the coming of the great and dreadful day of Yahuah (LORD).* Elias beside Moses = the Prophets joined to the Law, witnessing the Son.'
  FROM cross_reference_threads t, cross_references x, _mk09_lookup sv, _mk09_lookup tv
 WHERE t.slug='mark-9-transfiguration-moses-and-elijah-hear-him-the-fathers-voice-deut-18-malachi-4-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=9 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=4 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Deuteronomy 18:15 — *Yahuah Elohayka (The LORD thy God) will raise up unto thee a Prophet from the midst of thee... unto him ye shall hearken.* The Father''s *hear him* is Moses'' own promise fulfilled.'
  FROM cross_reference_threads t, cross_references x, _mk09_lookup sv, _mk09_lookup tv
 WHERE t.slug='mark-9-transfiguration-moses-and-elijah-hear-him-the-fathers-voice-deut-18-malachi-4-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=9 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=18 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Psalm 2:7 — *Yahuah (LORD) hath said unto me, Thou art my Son; this day have I begotten thee.* *This is my beloved Son* = the Father owning the begotten Formed Son, not three co-equal persons.'
  FROM cross_reference_threads t, cross_references x, _mk09_lookup sv, _mk09_lookup tv
 WHERE t.slug='mark-9-transfiguration-moses-and-elijah-hear-him-the-fathers-voice-deut-18-malachi-4-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=9 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Matthew 17:5 — *behold a voice out of the cloud, which said, This is my beloved Son, in whom I am well pleased; hear ye him.* The same voice from the same cloud, the Father witnessing the Son.'
  FROM cross_reference_threads t, cross_references x, _mk09_lookup sv, _mk09_lookup tv
 WHERE t.slug='mark-9-transfiguration-moses-and-elijah-hear-him-the-fathers-voice-deut-18-malachi-4-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=9 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=17 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2: Elias restore
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Malachi 4:5 — *Behold, I will send you Elijah the prophet before the coming of the great and dreadful day of Yahuah (LORD).* The scribes read the promise rightly; Elias *is indeed come* already.'
  FROM cross_reference_threads t, cross_references x, _mk09_lookup sv, _mk09_lookup tv
 WHERE t.slug='mark-9-elias-must-first-come-and-restore-all-things-restore-the-tribes-of-jacob-malachi-4-sirach-48'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=9 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=4 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Malachi 4:6 — *And he shall turn the heart of the fathers to the children, and the heart of the children to their fathers.* The Elijah-work is restoration — hearts turned home, the scattered house mended.'
  FROM cross_reference_threads t, cross_references x, _mk09_lookup sv, _mk09_lookup tv
 WHERE t.slug='mark-9-elias-must-first-come-and-restore-all-things-restore-the-tribes-of-jacob-malachi-4-sirach-48'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=9 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=4 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Sirach 48:10 — *...to turn the heart of the father to the son, and to restore the tribes of Jacob.* The second-Temple readers named the Elijah-mission as the two-house ingathering — *restore all things*.'
  FROM cross_reference_threads t, cross_references x, _mk09_lookup sv, _mk09_lookup tv
 WHERE t.slug='mark-9-elias-must-first-come-and-restore-all-things-restore-the-tribes-of-jacob-malachi-4-sirach-48'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=9 AND sv.verse_number=12
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=48 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 17:11 — *Elias truly shall first come, and restore all things.* Matthew keeps the same teaching: the forerunner first, the restoring real, the Son yet to suffer.'
  FROM cross_reference_threads t, cross_references x, _mk09_lookup sv, _mk09_lookup tv
 WHERE t.slug='mark-9-elias-must-first-come-and-restore-all-things-restore-the-tribes-of-jacob-malachi-4-sirach-48'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=9 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=17 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3: deaf-dumb spirit
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 34:18 — *Yahuah (LORD) is nigh unto them that are of a broken heart; and saveth such as be of a contrite spirit.* The father''s *help thou mine unbelief* is exactly the broken cry Yahuah draws near to.'
  FROM cross_reference_threads t, cross_references x, _mk09_lookup sv, _mk09_lookup tv
 WHERE t.slug='mark-9-the-dumb-and-deaf-spirit-cast-out-help-thou-mine-unbelief-isaiah-35-1-enoch-15'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=9 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=34 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 35:5 — *Then the eyes of the blind shall be opened, and the ears of the deaf shall be unstopped.* The casting-out of the *dumb and deaf spirit* fulfils the prophet''s sign of the coming of Elohim.'
  FROM cross_reference_threads t, cross_references x, _mk09_lookup sv, _mk09_lookup tv
 WHERE t.slug='mark-9-the-dumb-and-deaf-spirit-cast-out-help-thou-mine-unbelief-isaiah-35-1-enoch-15'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=9 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=35 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 35:6 — *the tongue of the dumb sing: for in the wilderness shall waters break out.* The dumb child loosed = the wilderness-healing Isaiah promised.'
  FROM cross_reference_threads t, cross_references x, _mk09_lookup sv, _mk09_lookup tv
 WHERE t.slug='mark-9-the-dumb-and-deaf-spirit-cast-out-help-thou-mine-unbelief-isaiah-35-1-enoch-15'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=9 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=35 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 15:9 — *the spirits of the giants afflict, oppress, destroy, attack, do battle, and work destruction on the earth.* The library names the foul spirits the Son rebukes — souls gone forth from the slain giants.'
  FROM cross_reference_threads t, cross_references x, _mk09_lookup sv, _mk09_lookup tv
 WHERE t.slug='mark-9-the-dumb-and-deaf-spirit-cast-out-help-thou-mine-unbelief-isaiah-35-1-enoch-15'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=9 AND sv.verse_number=25
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=15 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Enoch 15:11 — *...thus shall they destroy until the day of the consummation, the great judgement.* They roam until the consummation; the Son''s *enter no more into him* is a foretaste of that judgement.'
  FROM cross_reference_threads t, cross_references x, _mk09_lookup sv, _mk09_lookup tv
 WHERE t.slug='mark-9-the-dumb-and-deaf-spirit-cast-out-help-thou-mine-unbelief-isaiah-35-1-enoch-15'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=9 AND sv.verse_number=25
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=15 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4: who is greatest
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 15:33 — *The fear of Yahuah (LORD) is the instruction of wisdom; and before honour is humility.* *The same shall be last of all* is no new law but the Torah of lowliness.'
  FROM cross_reference_threads t, cross_references x, _mk09_lookup sv, _mk09_lookup tv
 WHERE t.slug='mark-9-who-should-be-the-greatest-the-last-of-all-and-the-little-child-proverbs-15-isaiah-57'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=9 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=15 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 18:12 — *Before destruction the heart of man is haughty, and before honour is humility.* The disciples reached for first place; the proverb had already warned where the haughty heart runs.'
  FROM cross_reference_threads t, cross_references x, _mk09_lookup sv, _mk09_lookup tv
 WHERE t.slug='mark-9-who-should-be-the-greatest-the-last-of-all-and-the-little-child-proverbs-15-isaiah-57'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=9 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=18 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 57:15 — *the high and lofty One... I dwell in the high and holy place, with him also that is of a contrite and humble spirit.* The child set in the midst = greatness measured downward, where Yahuah stoops to dwell.'
  FROM cross_reference_threads t, cross_references x, _mk09_lookup sv, _mk09_lookup tv
 WHERE t.slug='mark-9-who-should-be-the-greatest-the-last-of-all-and-the-little-child-proverbs-15-isaiah-57'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=9 AND sv.verse_number=36
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=57 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 5: salt of the covenant
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 2:13 — *...neither shalt thou suffer the salt of the covenant of thy Elohim (God) to be lacking from thy meat offering: with all thine offerings thou shalt offer salt.* *Every sacrifice shall be salted with salt* is the Torah quoted plain — the salt of the covenant.'
  FROM cross_reference_threads t, cross_references x, _mk09_lookup sv, _mk09_lookup tv
 WHERE t.slug='mark-9-every-sacrifice-salted-with-salt-the-salt-of-the-covenant-leviticus-2-numbers-18'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=9 AND sv.verse_number=49
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=2 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 18:19 — *it is a covenant of salt for ever before Yahuah (LORD) unto thee and to thy seed with thee.* Salt = a covenant that does not spoil; *salted with fire* = made an enduring, faithful offering.'
  FROM cross_reference_threads t, cross_references x, _mk09_lookup sv, _mk09_lookup tv
 WHERE t.slug='mark-9-every-sacrifice-salted-with-salt-the-salt-of-the-covenant-leviticus-2-numbers-18'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=9 AND sv.verse_number=49
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=18 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Chronicles 13:5 — *...gave the kingdom over Yashar''el (Israel) to David for ever... by a covenant of salt?* Even David''s throne stands on unbreakable salt-fidelity — the loyalty asked of his own.'
  FROM cross_reference_threads t, cross_references x, _mk09_lookup sv, _mk09_lookup tv
 WHERE t.slug='mark-9-every-sacrifice-salted-with-salt-the-salt-of-the-covenant-leviticus-2-numbers-18'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=9 AND sv.verse_number=50
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=13 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 5:13 — *Ye are the salt of the earth: but if the salt have lost his savour, wherewith shall it be salted?* The same warning: covenant savour, once let go, cannot be borrowed back — it must be kept.'
  FROM cross_reference_threads t, cross_references x, _mk09_lookup sv, _mk09_lookup tv
 WHERE t.slug='mark-9-every-sacrifice-salted-with-salt-the-salt-of-the-covenant-leviticus-2-numbers-18'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=9 AND sv.verse_number=50
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_mark_11.sql -----
-- ============================================================================
-- minion_mark_11.sql  —  Come-and-See full-library cross-references for MARK 11
-- 4 threads: triumphal entry / fig tree-faith-forgiveness / cleansing the temple / authority
-- band base 13300 step +3
-- ============================================================================

CREATE TEMP VIEW _mk11_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1',
   'pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================================================================
-- 3b. cross_references rows
-- ============================================================================
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES

  -- THREAD 1 — triumphal entry (anchor 11:1-11) -----------------------------
  ('canon','mark',11,9,'canon','zechariah',9,9, 'free', E'*Rejoice greatly, O daughter of Zion; shout, O daughter of Jerusalem: behold, thy King cometh unto thee: he is just, and having salvation; lowly, and riding upon an ass, and upon a colt the foal of an ass.* (Zechariah 9:9) — the colt whereon never man sat is the lowly King of Zion arriving exactly as the prophet drew him.'),
  ('canon','mark',11,9,'canon','psalms',118,25, 'free', E'*Save now, I beseech thee, O Yahuah (LORD): O Yahuah (LORD), I beseech thee, send now prosperity.* (Psalm 118:25) — *Hosanna* is this very cry, *Save now,* lifted to the King in the gate.'),
  ('canon','mark',11,9,'canon','psalms',118,26, 'free', E'*Blessed be he that cometh in the name of Yahuah (LORD): we have blessed you out of the house of Yahuah (LORD).* (Psalm 118:26) — the crowd quotes the pilgrim-blessing back to the One who comes in the Name.'),
  ('canon','mark',11,10,'canon','genesis',49,10, 'free', E'*The sceptre shall not depart from Yahudah (Judah), nor a lawgiver from between his feet, until Shiloh come; and unto him shall the gathering of the people be.* (Genesis 49:10) — *the kingdom of our father David* riding in is the sceptre of Yahudah, and the gathering of the people to Shiloh.'),
  ('canon','mark',11,10,'canon','genesis',49,11, 'free', E'*Binding his foal unto the vine, and his ass''s colt unto the choice vine; he washed his garments in wine, and his clothes in the blood of grapes:* (Genesis 49:11) — Jacob foresaw Shiloh''s colt; Mark records its loosing.'),
  ('canon','mark',11,9,'canon','matthew',21,9, 'free', E'*And the multitudes that went before, and that followed, cried, saying, Hosanna to the Son of David: Blessed is he that cometh in the name of Yahuah (Lord); Hosanna in the highest.* (Matthew 21:9) — Matthew names him *the Son of David,* sealing the Zechariah-and-Genesis weight of the moment.'),

  -- THREAD 2 — fig tree / faith / forgiveness (anchor 11:12-26) --------------
  ('canon','mark',11,13,'canon','jeremiah',8,13, 'free', E'*I will surely consume them, saith Yahuah (LORD): there shall be no grapes on the vine, nor figs on the fig tree, and the leaf shall fade; and the things that I have given them shall pass away from them.* (Jeremiah 8:13) — the barren fig tree is the prophet''s own sign of fruitless covenant-people met with leaves and no figs.'),
  ('canon','mark',11,14,'canon','hosea',9,10, 'free', E'*I found Yashar''el (Israel) like grapes in the wilderness; I saw your fathers as the firstripe in the fig tree at her first time: but they went to Baal-peor, and separated themselves unto that shame; and their abominations were according as they loved.* (Hosea 9:10) — Yashar''el was meant to be the firstripe fig; the withered tree is the verdict on fruitless religion, not on the people Elohim has not cast away.'),
  ('canon','mark',11,24,'canon','psalms',37,4, 'free', E'*Delight thyself also in Yahuah (LORD); and he shall give thee the desires of thine heart.* (Psalm 37:4) — *what things soever ye desire, when ye pray, believe* is the same delight-and-receive the psalm teaches: the desires of a heart set on Yahuah.'),
  ('canon','mark',11,25,'apocrypha','ecclesiasticus',28,2, 'extras', E'*Forgive your neighbour the hurt that he has done to you, so shall your sins also be forgiven when you prayest.* (Sirach 28:2) — the library already joined forgiveness to answered prayer; the Son repeats the wisdom: forgive before you stand praying.'),
  ('canon','mark',11,25,'apocrypha','ecclesiasticus',28,6, 'extras', E'*Remember your end, and let enmity cease; remember corruption and death, and abide in the commandments.* (Sirach 28:6) — forgiveness and abiding in the commandments stand together; mercy is the weightier matter of the Torah, never its undoing.'),

  -- THREAD 3 — cleansing the temple (anchor 11:15-19) -----------------------
  ('canon','mark',11,17,'canon','isaiah',56,7, 'free', E'*Even them will I bring to my holy mountain, and make them joyful in my house of prayer: their burnt offerings and their sacrifices shall be accepted upon mine altar; for mine house shall be called an house of prayer for all people.* (Isaiah 56:7) — he quotes it word for word; *for all nations* is the gathering of the outcasts of Yashar''el and the stranger joined to Yahuah, not the abolishing of the house.'),
  ('canon','mark',11,17,'canon','isaiah',56,8, 'free', E'*Adonai Yahuah (The Lord GOD) which gathereth the outcasts of Yashar''el (Israel) saith, Yet will I gather others to him, beside those that are gathered unto him.* (Isaiah 56:8) — the next breath of the passage he quotes names the two-house ingathering: the scattered of Yashar''el and yet others gathered beside.'),
  ('canon','mark',11,17,'canon','jeremiah',7,11, 'free', E'*Is this house, which is called by my name, become a den of robbers in your eyes? Behold, even I have seen it, saith Yahuah (LORD).* (Jeremiah 7:11) — *a den of thieves* is the second quotation; the traffickers turned the house of the Name into the den Jeremiah saw and judged.'),
  ('canon','mark',11,15,'canon','malachi',3,1, 'free', E'*Behold, I will send my messenger, and he shall prepare the way before me: and Yahuah (Lord), whom ye seek, shall suddenly come to his temple, even the messenger of the covenant, whom ye delight in: behold, he shall come, saith Yahuah Tseva''ot (LORD of hosts).* (Malachi 3:1) — the Lord suddenly come to his temple is this overturning of tables; the messenger of the covenant comes to purify, not to dismantle.'),
  ('canon','mark',11,15,'canon','malachi',3,3, 'free', E'*And he shall sit as a refiner and purifier of silver: and he shall purify the sons of Levi, and purge them as gold and silver, that they may offer unto Yahuah (LORD) an offering in righteousness.* (Malachi 3:3) — the cleansing is refiner''s work aimed at an offering in righteousness restored, the worship purged and kept.'),
  ('canon','mark',11,17,'canon','zechariah',14,21, 'free', E'*Yea, every pot in Jerusalem and in Yahudah (Judah) shall be holiness unto Yahuah Tseva''ot (LORD of hosts): and all they that sacrifice shall come and take of them, and seethe therein: and in that day there shall be no more the Canaanite in the house of Yahuah Tseva''ot (LORD of hosts).* (Zechariah 14:21) — the trafficker driven from the house is the very promise of the day when there is *no more the Canaanite* in it.'),
  ('canon','mark',11,17,'canon','matthew',21,13, 'free', E'*And said unto them, It is written, My house shall be called the house of prayer; but ye have made it a den of thieves.* (Matthew 21:13) — Matthew sets the two quotations side by side as Mark does, Isaiah''s house of prayer against Jeremiah''s den of thieves.'),

  -- THREAD 4 — by what authority (anchor 11:27-33) --------------------------
  ('canon','mark',11,28,'canon','exodus',2,14, 'free', E'*And he said, Who made thee a prince and a judge over us? intendest thou to kill me, as thou killedst the Egyptian? And Moses feared, and said, Surely this thing is known.* (Exodus 2:14) — *by what authority?* is the same challenge flung at Moses; the sent one is met by *who made thee* in every generation.'),
  ('canon','mark',11,28,'canon','numbers',16,3, 'free', E'*And they gathered themselves together against Moses and against Aaron, and said unto them, Ye take too much upon you, seeing all the congregation are holy, every one of them, and Yahuah (LORD) is among them: wherefore then lift ye up yourselves above the congregation of Yahuah (LORD)?* (Numbers 16:3) — Korah''s rebellion is the pattern: the ordained authority of the sent one questioned by men who would not own heaven''s call.'),
  ('canon','mark',11,30,'canon','malachi',3,1, 'free', E'*Behold, I will send my messenger, and he shall prepare the way before me...* (Malachi 3:1) — *the baptism of John, was it from heaven, or of men?* turns on this: John is the messenger who prepared the way, so to deny him is to deny the heaven that sent the One after him.')

)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _mk11_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _mk11_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================================================================
-- 3c. threads
-- ============================================================================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'mark-11-thy-king-cometh-lowly-the-colt-and-the-sceptre-of-judah-zechariah-9-psalm-118-genesis-49',
       E'Thy King cometh, lowly — the colt and the sceptre of Yahudah (Zechariah 9; Psalm 118; Genesis 49)',
       E'When Yahusha (Jesus) sends for *a colt tied, whereon never man sat* (Mark 11:2) and rides into Jerusalem, the prophets are not surprised — they drew the scene centuries before. *Rejoice greatly, O daughter of Zion; shout, O daughter of Jerusalem: behold, thy King cometh unto thee: he is just, and having salvation; lowly, and riding upon an ass, and upon a colt the foal of an ass.* (Zechariah 9:9) Not a war-horse — a colt. Not a conqueror''s pomp — *lowly.* The crowd answers in the words of the pilgrim psalm: *Save now, I beseech thee, O Yahuah (LORD): O Yahuah (LORD), I beseech thee, send now prosperity.* (Psalm 118:25) — that cry is *Hosanna* itself — and *Blessed be he that cometh in the name of Yahuah (LORD): we have blessed you out of the house of Yahuah (LORD).* (Psalm 118:26). When they bless *the kingdom of our father David,* they are naming the sceptre Jacob saw on his deathbed: *The sceptre shall not depart from Yahudah (Judah), nor a lawgiver from between his feet, until Shiloh come; and unto him shall the gathering of the people be.* (Genesis 49:10) — and the very next line foretold the colt: *Binding his foal unto the vine, and his ass''s colt unto the choice vine* (Genesis 49:11). Matthew names what the prophets named: *And the multitudes that went before, and that followed, cried, saying, Hosanna to the Son of David: Blessed is he that cometh in the name of Yahuah (Lord); Hosanna in the highest.* (Matthew 21:9) The lowly King of Zion, the sceptre of Yahudah, the gathering of the people to Shiloh — all of it rides in on one borrowed colt.',
       sv.verse_id, ev.verse_id, 'free', 13300
  FROM _mk11_lookup sv, _mk11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=11 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='mark' AND ev.chapter_number=11 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'mark-11-the-barren-fig-tree-and-the-forgiveness-that-frees-prayer-jeremiah-8-hosea-9-sirach-28',
       E'The barren fig tree and the forgiveness that frees prayer (Jeremiah 8; Hosea 9; Sirach 28)',
       E'The fig tree *having leaves* but *nothing but leaves* (Mark 11:13) is a living parable, and the prophets have already spoken its language. *I will surely consume them, saith Yahuah (LORD): there shall be no grapes on the vine, nor figs on the fig tree, and the leaf shall fade; and the things that I have given them shall pass away from them.* (Jeremiah 8:13) — leaves without figs is the prophet''s own sign of a covenant-people all show and no fruit. Hosea remembers what Yashar''el was made to be: *I found Yashar''el (Israel) like grapes in the wilderness; I saw your fathers as the firstripe in the fig tree at her first time: but they went to Baal-peor* (Hosea 9:10). The withering is a verdict on fruitless religion — never on the people Elohim has not cast away, for he still seeks fruit. Then the Son turns the lesson toward the disciples: *Have faith in Elohim (God)* (Mark 11:22), *believe that ye receive them, and ye shall have them* (Mark 11:24) — the very promise of the psalm, *Delight thyself also in Yahuah (LORD); and he shall give thee the desires of thine heart.* (Psalm 37:4). And he binds prayer to mercy: *when ye stand praying, forgive* (Mark 11:25). The library had already joined them: *Forgive your neighbour the hurt that he has done to you, so shall your sins also be forgiven when you prayest.* (Sirach 28:2) — and lest forgiveness be mistaken for lawlessness, the same wisdom adds, *Remember your end, and let enmity cease; remember corruption and death, and abide in the commandments.* (Sirach 28:6). Forgiveness and abiding in the commandments stand together. Bear fruit; have faith; forgive — and then stand praying.',
       sv.verse_id, ev.verse_id, 'extras', 13303
  FROM _mk11_lookup sv, _mk11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=11 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='mark' AND ev.chapter_number=11 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'mark-11-a-house-of-prayer-for-all-nations-not-a-den-of-thieves-isaiah-56-jeremiah-7-malachi-3-zechariah-14',
       E'A house of prayer for all nations, not a den of thieves (Isaiah 56; Jeremiah 7; Malachi 3; Zechariah 14)',
       E'When Yahusha (Jesus) overturns the tables and drives out the traffickers, he does not invent a charge — he reads two prophets aloud. *Is it not written, My house shall be called of all nations the house of prayer? but ye have made it a den of thieves.* (Mark 11:17) The first half is Isaiah, quoted whole: *Even them will I bring to my holy mountain, and make them joyful in my house of prayer: their burnt offerings and their sacrifices shall be accepted upon mine altar; for mine house shall be called an house of prayer for all people.* (Isaiah 56:7). And *for all nations* is no erasing of Yashar''el — the very next verse names the gathering: *Adonai Yahuah (The Lord GOD) which gathereth the outcasts of Yashar''el (Israel) saith, Yet will I gather others to him, beside those that are gathered unto him.* (Isaiah 56:8) — the scattered of the house brought home, and yet others gathered beside. The second half is Jeremiah, quoted whole: *Is this house, which is called by my name, become a den of robbers in your eyes? Behold, even I have seen it, saith Yahuah (LORD).* (Jeremiah 7:11). This is the temple cleansed, not the temple abolished — exactly what Malachi promised: *Yahuah (Lord), whom ye seek, shall suddenly come to his temple, even the messenger of the covenant... behold, he shall come* (Malachi 3:1), and *he shall sit as a refiner and purifier of silver: and he shall purify the sons of Levi... that they may offer unto Yahuah (LORD) an offering in righteousness.* (Malachi 3:3). The refiner purges so the worship may stand pure. Zechariah saw the same day: *every pot in Jerusalem and in Yahudah (Judah) shall be holiness unto Yahuah Tseva''ot (LORD of hosts)... and in that day there shall be no more the Canaanite in the house of Yahuah Tseva''ot (LORD of hosts).* (Zechariah 14:21) — the trafficker cast out is the promise kept. Matthew records the same double quotation: *It is written, My house shall be called the house of prayer; but ye have made it a den of thieves.* (Matthew 21:13). The Son purified his Father''s house to make it what the prophets always said it would be — a house of prayer for the gathered of all nations.',
       sv.verse_id, ev.verse_id, 'free', 13306
  FROM _mk11_lookup sv, _mk11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=11 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='mark' AND ev.chapter_number=11 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'mark-11-by-what-authority-the-sent-one-challenged-as-moses-was-exodus-2-numbers-16-malachi-3',
       E'By what authority — the sent one challenged as Moses was (Exodus 2; Numbers 16; Malachi 3)',
       E'The chief priests and scribes meet Yahusha (Jesus) with the oldest question rebellion knows: *By what authority doest thou these things? and who gave thee this authority to do these things?* (Mark 11:28) It is the very word flung at Moses the day he stood for his brother: *Who made thee a prince and a judge over us? intendest thou to kill me, as thou killedst the Egyptian?* (Exodus 2:14) — *who made thee* is what men always ask of the one heaven has sent. It is Korah''s charge too: *And they gathered themselves together against Moses and against Aaron, and said unto them, Ye take too much upon you, seeing all the congregation are holy, every one of them, and Yahuah (LORD) is among them: wherefore then lift ye up yourselves above the congregation of Yahuah (LORD)?* (Numbers 16:3) — the ordained authority of the sent one questioned by men who would not own the call of heaven. So the Son answers with a question that exposes them: *The baptism of John, was it from heaven, or of men?* (Mark 11:30). For John is the messenger of whom Malachi spoke — *Behold, I will send my messenger, and he shall prepare the way before me* (Malachi 3:1) — and to deny the forerunner is to deny the heaven that sent the One who came after. They will not answer, because the answer would judge them. The authority of the Formed Son, who does only the will of the Father who sent him, stands unshaken before rulers who dare not name where it came from.',
       sv.verse_id, ev.verse_id, 'free', 13309
  FROM _mk11_lookup sv, _mk11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=11 AND sv.verse_number=27
   AND ev.edition_slug='canon' AND ev.book_slug='mark' AND ev.chapter_number=11 AND ev.verse_number=33
ON CONFLICT (slug) DO NOTHING;

-- ============================================================================
-- 3d. thread_members
-- ============================================================================

-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Zechariah 9:9 — *behold, thy King cometh unto thee: he is just, and having salvation; lowly, and riding upon an ass, and upon a colt the foal of an ass.* The lowly King of Zion drawn centuries in advance.'
  FROM cross_reference_threads t, cross_references x, _mk11_lookup sv, _mk11_lookup tv
 WHERE t.slug='mark-11-thy-king-cometh-lowly-the-colt-and-the-sceptre-of-judah-zechariah-9-psalm-118-genesis-49'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=11 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=9 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 118:25 — *Save now, I beseech thee, O Yahuah (LORD).* The cry *Hosanna* is this pilgrim plea, *Save now.*'
  FROM cross_reference_threads t, cross_references x, _mk11_lookup sv, _mk11_lookup tv
 WHERE t.slug='mark-11-thy-king-cometh-lowly-the-colt-and-the-sceptre-of-judah-zechariah-9-psalm-118-genesis-49'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=11 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=118 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 118:26 — *Blessed be he that cometh in the name of Yahuah (LORD).* The crowd quotes the pilgrim-blessing to the One who comes in the Name.'
  FROM cross_reference_threads t, cross_references x, _mk11_lookup sv, _mk11_lookup tv
 WHERE t.slug='mark-11-thy-king-cometh-lowly-the-colt-and-the-sceptre-of-judah-zechariah-9-psalm-118-genesis-49'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=11 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=118 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 49:10 — *The sceptre shall not depart from Yahudah (Judah)... until Shiloh come; and unto him shall the gathering of the people be.* The kingdom of David riding in is the sceptre of Yahudah.'
  FROM cross_reference_threads t, cross_references x, _mk11_lookup sv, _mk11_lookup tv
 WHERE t.slug='mark-11-thy-king-cometh-lowly-the-colt-and-the-sceptre-of-judah-zechariah-9-psalm-118-genesis-49'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=11 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Genesis 49:11 — *Binding his foal unto the vine, and his ass''s colt unto the choice vine.* Jacob foresaw Shiloh''s colt; Mark records its loosing.'
  FROM cross_reference_threads t, cross_references x, _mk11_lookup sv, _mk11_lookup tv
 WHERE t.slug='mark-11-thy-king-cometh-lowly-the-colt-and-the-sceptre-of-judah-zechariah-9-psalm-118-genesis-49'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=11 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Matthew 21:9 — *Hosanna to the Son of David: Blessed is he that cometh in the name of Yahuah (Lord).* Matthew names him the Son of David, sealing the moment.'
  FROM cross_reference_threads t, cross_references x, _mk11_lookup sv, _mk11_lookup tv
 WHERE t.slug='mark-11-thy-king-cometh-lowly-the-colt-and-the-sceptre-of-judah-zechariah-9-psalm-118-genesis-49'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=11 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=21 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 8:13 — *there shall be no grapes on the vine, nor figs on the fig tree, and the leaf shall fade.* The prophet''s own sign of a covenant-people all leaves and no fruit.'
  FROM cross_reference_threads t, cross_references x, _mk11_lookup sv, _mk11_lookup tv
 WHERE t.slug='mark-11-the-barren-fig-tree-and-the-forgiveness-that-frees-prayer-jeremiah-8-hosea-9-sirach-28'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=11 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=8 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hosea 9:10 — *I saw your fathers as the firstripe in the fig tree at her first time.* Yashar''el was meant to be the firstripe fig; the withering judges fruitless religion, not the people Elohim has not cast away.'
  FROM cross_reference_threads t, cross_references x, _mk11_lookup sv, _mk11_lookup tv
 WHERE t.slug='mark-11-the-barren-fig-tree-and-the-forgiveness-that-frees-prayer-jeremiah-8-hosea-9-sirach-28'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=11 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=9 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 37:4 — *Delight thyself also in Yahuah (LORD); and he shall give thee the desires of thine heart.* The same delight-and-receive behind *believe that ye receive them.*'
  FROM cross_reference_threads t, cross_references x, _mk11_lookup sv, _mk11_lookup tv
 WHERE t.slug='mark-11-the-barren-fig-tree-and-the-forgiveness-that-frees-prayer-jeremiah-8-hosea-9-sirach-28'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=11 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=37 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Sirach 28:2 — *Forgive your neighbour the hurt that he has done to you, so shall your sins also be forgiven when you prayest.* The library already joined forgiveness to answered prayer.'
  FROM cross_reference_threads t, cross_references x, _mk11_lookup sv, _mk11_lookup tv
 WHERE t.slug='mark-11-the-barren-fig-tree-and-the-forgiveness-that-frees-prayer-jeremiah-8-hosea-9-sirach-28'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=11 AND sv.verse_number=25
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=28 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Sirach 28:6 — *let enmity cease... and abide in the commandments.* Forgiveness and abiding in the commandments stand together; mercy is the weightier matter of the Torah, not its undoing.'
  FROM cross_reference_threads t, cross_references x, _mk11_lookup sv, _mk11_lookup tv
 WHERE t.slug='mark-11-the-barren-fig-tree-and-the-forgiveness-that-frees-prayer-jeremiah-8-hosea-9-sirach-28'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=11 AND sv.verse_number=25
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=28 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 56:7 — *mine house shall be called an house of prayer for all people.* He quotes it whole; *for all nations* is the gathering, not the abolishing, of the house.'
  FROM cross_reference_threads t, cross_references x, _mk11_lookup sv, _mk11_lookup tv
 WHERE t.slug='mark-11-a-house-of-prayer-for-all-nations-not-a-den-of-thieves-isaiah-56-jeremiah-7-malachi-3-zechariah-14'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=11 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=56 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 56:8 — *which gathereth the outcasts of Yashar''el (Israel)... Yet will I gather others to him.* The two-house ingathering: the scattered of the house, and yet others gathered beside.'
  FROM cross_reference_threads t, cross_references x, _mk11_lookup sv, _mk11_lookup tv
 WHERE t.slug='mark-11-a-house-of-prayer-for-all-nations-not-a-den-of-thieves-isaiah-56-jeremiah-7-malachi-3-zechariah-14'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=11 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=56 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 7:11 — *Is this house, which is called by my name, become a den of robbers in your eyes?* The second quotation; the den Jeremiah saw and judged.'
  FROM cross_reference_threads t, cross_references x, _mk11_lookup sv, _mk11_lookup tv
 WHERE t.slug='mark-11-a-house-of-prayer-for-all-nations-not-a-den-of-thieves-isaiah-56-jeremiah-7-malachi-3-zechariah-14'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=11 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=7 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Malachi 3:1 — *Yahuah (Lord), whom ye seek, shall suddenly come to his temple, even the messenger of the covenant.* The Lord come to his temple to purify, not to dismantle.'
  FROM cross_reference_threads t, cross_references x, _mk11_lookup sv, _mk11_lookup tv
 WHERE t.slug='mark-11-a-house-of-prayer-for-all-nations-not-a-den-of-thieves-isaiah-56-jeremiah-7-malachi-3-zechariah-14'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=11 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=3 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Malachi 3:3 — *he shall sit as a refiner and purifier of silver... that they may offer unto Yahuah (LORD) an offering in righteousness.* The cleansing aims at worship purged and kept.'
  FROM cross_reference_threads t, cross_references x, _mk11_lookup sv, _mk11_lookup tv
 WHERE t.slug='mark-11-a-house-of-prayer-for-all-nations-not-a-den-of-thieves-isaiah-56-jeremiah-7-malachi-3-zechariah-14'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=11 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=3 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Zechariah 14:21 — *in that day there shall be no more the Canaanite in the house of Yahuah Tseva''ot (LORD of hosts).* The trafficker driven out is the very promise kept.'
  FROM cross_reference_threads t, cross_references x, _mk11_lookup sv, _mk11_lookup tv
 WHERE t.slug='mark-11-a-house-of-prayer-for-all-nations-not-a-den-of-thieves-isaiah-56-jeremiah-7-malachi-3-zechariah-14'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=11 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=14 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Matthew 21:13 — *My house shall be called the house of prayer; but ye have made it a den of thieves.* Matthew sets the same two quotations side by side.'
  FROM cross_reference_threads t, cross_references x, _mk11_lookup sv, _mk11_lookup tv
 WHERE t.slug='mark-11-a-house-of-prayer-for-all-nations-not-a-den-of-thieves-isaiah-56-jeremiah-7-malachi-3-zechariah-14'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=11 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=21 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 2:14 — *Who made thee a prince and a judge over us?* The same challenge flung at Moses; *who made thee* is what men ask of the one heaven sends.'
  FROM cross_reference_threads t, cross_references x, _mk11_lookup sv, _mk11_lookup tv
 WHERE t.slug='mark-11-by-what-authority-the-sent-one-challenged-as-moses-was-exodus-2-numbers-16-malachi-3'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=11 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=2 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 16:3 — *Ye take too much upon you... wherefore then lift ye up yourselves above the congregation of Yahuah (LORD)?* Korah''s rebellion: ordained authority questioned by men who would not own heaven''s call.'
  FROM cross_reference_threads t, cross_references x, _mk11_lookup sv, _mk11_lookup tv
 WHERE t.slug='mark-11-by-what-authority-the-sent-one-challenged-as-moses-was-exodus-2-numbers-16-malachi-3'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=11 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=16 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Malachi 3:1 — *Behold, I will send my messenger, and he shall prepare the way before me.* John is the messenger; to deny the forerunner is to deny the heaven that sent the One after him.'
  FROM cross_reference_threads t, cross_references x, _mk11_lookup sv, _mk11_lookup tv
 WHERE t.slug='mark-11-by-what-authority-the-sent-one-challenged-as-moses-was-exodus-2-numbers-16-malachi-3'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=11 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=3 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_mark_16.sql -----
-- ============================================================================
-- Mark 16 — NT DEPTH pass — THIN-ADD (3 NEW threads)
-- Existing thread on 16:9 (the-longer-ending... disputed-textual-witness) NOT touched.
-- ============================================================================

-- 3a. Temp view ------------------------------------------------------------
CREATE TEMP VIEW _mk16_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1',
   'pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- 3b. cross_references rows ------------------------------------------------
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- THREAD 1 — 16:1-8 resurrection morning
  ('canon','mark',16,6,'canon','hosea',6,2, 'free', E'*After two days will he revive us: in the third day he will raise us up, and we shall live in his sight.* (Hosea 6:2). The angel''s *he is risen* on the first day of the week is the very rising Hosea sang centuries before — the third-day raising of Yahuah''s people, of which the Risen One is the firstfruits.'),
  ('canon','mark',16,6,'canon','psalms',16,10, 'free', E'*For thou wilt not leave my soul in hell; neither wilt thou suffer thine Holy One to see corruption.* (Psalm 16:10). The empty tomb is this verse made visible — the flesh of the Holy One did not see corruption; the Father raised him.'),
  ('canon','mark',16,6,'canon','isaiah',26,19, 'free', E'*Thy dead men shall live, together with my dead body shall they arise. Awake and sing, ye that dwell in dust: for thy dew is as the dew of herbs, and the earth shall cast out the dead.* (Isaiah 26:19). The earth casts out its dead — the stone rolled away is that promise opened.'),
  ('canon','mark',16,6,'canon','hosea',6,3, 'free', E'*his going forth is prepared as the morning; and he shall come unto us as the rain, as the latter and former rain unto the earth.* (Hosea 6:3). *Very early in the morning the first day of the week, they came unto the sepulchre at the rising of the sun* (Mark 16:2) — his going forth prepared as the morning, the dawn the prophet named.'),

  -- THREAD 2 — 16:15-18 go into all the world
  ('canon','mark',16,15,'canon','psalms',22,27, 'free', E'*All the ends of the world shall remember and turn unto Yahuah (LORD): and all the kindreds of the nations shall worship before thee.* (Psalm 22:27). *Go ye into all the world* is the commission to gather what this psalm promised — the ends of the world turning home.'),
  ('canon','mark',16,15,'canon','isaiah',52,7, 'free', E'*How beautiful upon the mountains are the feet of him that bringeth good tidings, that publisheth peace; that bringeth good tidings of good, that publisheth salvation; that saith unto Zion, Thy Elohim (God) reigneth!* (Isaiah 52:7). The feet sent into all the world are the beautiful feet Isaiah saw publishing the good tidings.'),
  ('canon','mark',16,15,'canon','joel',2,32, 'free', E'*And it shall come to pass, that whosoever shall call on the name of Yahuah (LORD) shall be delivered: for in mount Zion and in Jerusalem shall be deliverance, as Yahuah (LORD) hath said, and in the remnant whom Yahuah (LORD) shall call.* (Joel 2:32). *He that believeth and is baptized shall be saved* — the gospel preached to every creature is the calling-out of the remnant Joel named.'),
  ('canon','mark',16,15,'canon','isaiah',52,10, 'free', E'*Yahuah (LORD) hath made bare his holy arm in the eyes of all the nations; and all the ends of the earth shall see the salvation of our Elohim (God).* (Isaiah 52:10). *Every creature* in *all the world* — the ends of the earth seeing the salvation, scattered Yashar''el (Israel) gathered and the stranger drawn in.'),

  -- THREAD 3 — 16:19-20 received up, sat at the right hand
  ('canon','mark',16,19,'canon','psalms',110,1, 'free', E'*Yahuah (LORD) said unto my Lord, Sit thou at my right hand, until I make thine enemies thy footstool.* (Psalm 110:1). *He was received up into heaven, and sat on the right hand of Elohim (God)* — the enthronement David saw, the Son seated at the Father''s right hand, exalted BY the Father.'),
  ('canon','mark',16,19,'canon','daniel',7,13, 'free', E'*I saw in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him.* (Daniel 7:13). The ascent is the approach of the *one like the Son of Adam* to the Ancient of days — brought near to receive the kingdom.'),
  ('canon','mark',16,19,'canon','daniel',7,14, 'free', E'*And there was given him dominion, and glory, and a kingdom, that all people, nations, and languages, should serve him: his dominion is an everlasting dominion, which shall not pass away, and his kingdom that which shall not be destroyed.* (Daniel 7:14). The dominion is GIVEN him — the Formed Son receives the everlasting kingdom FROM the Father; he does not seize it as a co-equal by nature.'),
  ('canon','mark',16,19,'canon','2-kings',2,11, 'free', E'*there appeared a chariot of fire, and horses of fire, and parted them both asunder; and Elijah went up by a whirlwind into heaven.* (2 Kings 2:11). Elijah''s taking-up is the shadow; the Son''s receiving-up is the substance — not snatched away to a mountain, but seated at the right hand of Elohim (God).'),
  ('canon','mark',16,20,'canon','isaiah',52,7, 'free', E'*How beautiful upon the mountains are the feet of him that bringeth good tidings... that saith unto Zion, Thy Elohim (God) reigneth!* (Isaiah 52:7). *They went forth, and preached every where, Yahuah (Lord) working with them* — the enthroned Son reigns and confirms the word, the good tidings Isaiah saw now carried out.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _mk16_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _mk16_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- 3c. threads --------------------------------------------------------------
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'mark-16-he-is-risen-the-resurrection-morning-hosea-6-psalm-16-isaiah-26',
       E'He is risen — the resurrection morning the Tanakh foretold (Hosea 6; Psalm 16; Isaiah 26)',
       E'The women come *very early in the morning the first day of the week... at the rising of the sun* (Mark 16:2), and the young man in the white garment tells them, *Ye seek Yahusha (Jesus) of Nazareth, which was crucified: he is risen; he is not here* (Mark 16:6). The empty tomb is not a new thing — it is the Tanakh''s own promise opened.\n\nHosea sang it: *After two days will he revive us: in the third day he will raise us up, and we shall live in his sight* (Hosea 6:2). The third-day raising of Yahuah (LORD)''s people stands fulfilled in the Risen One, the firstfruits of that rising. And the prophet had already named the hour: *his going forth is prepared as the morning; and he shall come unto us as the rain* (Hosea 6:3) — his going forth prepared as the morning, the dawn the women walked into.\n\nDavid saw the body that would not decay: *For thou wilt not leave my soul in hell; neither wilt thou suffer thine Holy One to see corruption* (Psalm 16:10). The Father did not abandon his Holy One to the grave. And Isaiah saw the dust give up its sleepers: *Thy dead men shall live, together with my dead body shall they arise. Awake and sing, ye that dwell in dust... and the earth shall cast out the dead* (Isaiah 26:19). The stone *rolled away* (Mark 16:4) is that word made visible — the earth casting out its dead, the resurrection the prophets sang long before the morning came.',
       sv.verse_id, ev.verse_id, 'free', 13450
  FROM _mk16_lookup sv, _mk16_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=16 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='mark' AND ev.chapter_number=16 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'mark-16-go-ye-into-all-the-world-the-gathering-psalm-22-isaiah-52-joel-2',
       E'Go ye into all the world — the gathering the prophets promised (Psalm 22; Isaiah 52; Joel 2)',
       E'*Go ye into all the world, and preach the gospel to every creature* (Mark 16:15). The commission is not an interruption of the prophets but the carrying-out of what they saw. The good news goes to all the world because the citizens of the kingdom are scattered through all the world — the lost sheep of the house of Yashar''el (Israel) and the stranger drawn in among them.\n\nDavid saw the harvest: *All the ends of the world shall remember and turn unto Yahuah (LORD): and all the kindreds of the nations shall worship before thee* (Psalm 22:27). Isaiah saw the messengers sent: *How beautiful upon the mountains are the feet of him that bringeth good tidings, that publisheth peace... that saith unto Zion, Thy Elohim (God) reigneth!* (Isaiah 52:7) — and he saw the reach of it: *Yahuah (LORD) hath made bare his holy arm in the eyes of all the nations; and all the ends of the earth shall see the salvation of our Elohim (God)* (Isaiah 52:10).\n\nAnd Joel named the calling-out: *whosoever shall call on the name of Yahuah (LORD) shall be delivered: for in mount Zion and in Jerusalem shall be deliverance, as Yahuah (LORD) hath said, and in the remnant whom Yahuah (LORD) shall call* (Joel 2:32). *He that believeth and is baptized shall be saved* (Mark 16:16) — this is that calling-out of the remnant, proclaimed broadly because the sheep are scattered and the sheep hear his voice. Elohim (God) has not cast away his people; he is gathering them home.',
       sv.verse_id, ev.verse_id, 'free', 13453
  FROM _mk16_lookup sv, _mk16_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=16 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='mark' AND ev.chapter_number=16 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'mark-16-received-up-sat-on-the-right-hand-psalm-110-daniel-7',
       E'Received up — sat on the right hand of Elohim (Psalm 110; Daniel 7; 2 Kings 2)',
       E'*So then after Yahuah (Lord) had spoken unto them, he was received up into heaven, and sat on the right hand of Elohim (God)* (Mark 16:19). The ascension is the enthronement the Tanakh laid down — and it shows the order of the Father and the Son with perfect clarity.\n\nDavid heard the word spoken: *Yahuah (LORD) said unto my Lord, Sit thou at my right hand, until I make thine enemies thy footstool* (Psalm 110:1). The Father seats the Son at his right hand. Daniel saw the same scene in the night visions: *one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him* (Daniel 7:13) — the kaph preserved, *one LIKE the Son of Adam*, brought near to the Ancient of days. And then: *there was given him dominion, and glory, and a kingdom... his dominion is an everlasting dominion, which shall not pass away* (Daniel 7:14). The dominion is GIVEN — the Formed Son receives the everlasting kingdom from the Father. He is not a co-equal who seizes it by nature, nor a made creature; he is the Son who has a Father, exalted and enthroned BY him.\n\nElijah''s taking-up is the shadow that points to it: *there appeared a chariot of fire, and horses of fire... and Elijah went up by a whirlwind into heaven* (2 Kings 2:11). Elijah was snatched to a mountain (the sons of the prophets searched the hills); the Son was received up to the throne. And from that throne he reigns: *they went forth, and preached every where, Yahuah (Lord) working with them, and confirming the word with signs following* (Mark 16:20) — the enthroned Son working with his sent ones, the beautiful feet of Isaiah 52:7 now carried into all the world.',
       sv.verse_id, ev.verse_id, 'free', 13456
  FROM _mk16_lookup sv, _mk16_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=16 AND sv.verse_number=19
   AND ev.edition_slug='canon' AND ev.book_slug='mark' AND ev.chapter_number=16 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

-- 3d. thread_members -------------------------------------------------------
-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hosea 6:2 — *After two days will he revive us: in the third day he will raise us up, and we shall live in his sight.* The third-day raising the prophet sang, fulfilled in the Risen One.'
  FROM cross_reference_threads t, cross_references x, _mk16_lookup sv, _mk16_lookup tv
 WHERE t.slug='mark-16-he-is-risen-the-resurrection-morning-hosea-6-psalm-16-isaiah-26'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=16 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 16:10 — *For thou wilt not leave my soul in hell; neither wilt thou suffer thine Holy One to see corruption.* The flesh of the Holy One did not decay; the Father raised him.'
  FROM cross_reference_threads t, cross_references x, _mk16_lookup sv, _mk16_lookup tv
 WHERE t.slug='mark-16-he-is-risen-the-resurrection-morning-hosea-6-psalm-16-isaiah-26'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=16 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=16 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 26:19 — *Thy dead men shall live... Awake and sing, ye that dwell in dust... and the earth shall cast out the dead.* The stone rolled away is the earth casting out its dead.'
  FROM cross_reference_threads t, cross_references x, _mk16_lookup sv, _mk16_lookup tv
 WHERE t.slug='mark-16-he-is-risen-the-resurrection-morning-hosea-6-psalm-16-isaiah-26'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=16 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=26 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Hosea 6:3 — *his going forth is prepared as the morning; and he shall come unto us as the rain.* The dawn the women walked into; his going forth prepared as the morning.'
  FROM cross_reference_threads t, cross_references x, _mk16_lookup sv, _mk16_lookup tv
 WHERE t.slug='mark-16-he-is-risen-the-resurrection-morning-hosea-6-psalm-16-isaiah-26'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=16 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=6 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 22:27 — *All the ends of the world shall remember and turn unto Yahuah (LORD): and all the kindreds of the nations shall worship before thee.* The harvest *into all the world* promised in the psalm.'
  FROM cross_reference_threads t, cross_references x, _mk16_lookup sv, _mk16_lookup tv
 WHERE t.slug='mark-16-go-ye-into-all-the-world-the-gathering-psalm-22-isaiah-52-joel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=16 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=22 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 52:7 — *How beautiful upon the mountains are the feet of him that bringeth good tidings... that saith unto Zion, Thy Elohim (God) reigneth!* The beautiful feet sent into all the world.'
  FROM cross_reference_threads t, cross_references x, _mk16_lookup sv, _mk16_lookup tv
 WHERE t.slug='mark-16-go-ye-into-all-the-world-the-gathering-psalm-22-isaiah-52-joel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=16 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=52 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Joel 2:32 — *whosoever shall call on the name of Yahuah (LORD) shall be delivered... in the remnant whom Yahuah (LORD) shall call.* *He that believeth and is baptized shall be saved* = the calling-out of the remnant.'
  FROM cross_reference_threads t, cross_references x, _mk16_lookup sv, _mk16_lookup tv
 WHERE t.slug='mark-16-go-ye-into-all-the-world-the-gathering-psalm-22-isaiah-52-joel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=16 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 52:10 — *Yahuah (LORD) hath made bare his holy arm in the eyes of all the nations; and all the ends of the earth shall see the salvation of our Elohim (God).* *Every creature* — the ends of the earth seeing the salvation, scattered Yashar''el (Israel) gathered.'
  FROM cross_reference_threads t, cross_references x, _mk16_lookup sv, _mk16_lookup tv
 WHERE t.slug='mark-16-go-ye-into-all-the-world-the-gathering-psalm-22-isaiah-52-joel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=16 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=52 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 110:1 — *Yahuah (LORD) said unto my Lord, Sit thou at my right hand, until I make thine enemies thy footstool.* The Father seats the Son at his right hand — the enthronement David heard.'
  FROM cross_reference_threads t, cross_references x, _mk16_lookup sv, _mk16_lookup tv
 WHERE t.slug='mark-16-received-up-sat-on-the-right-hand-psalm-110-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=16 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=110 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 7:13 — *one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him.* The kaph preserved: *one LIKE the Son of Adam*, brought near to the Father.'
  FROM cross_reference_threads t, cross_references x, _mk16_lookup sv, _mk16_lookup tv
 WHERE t.slug='mark-16-received-up-sat-on-the-right-hand-psalm-110-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=16 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 7:14 — *there was given him dominion, and glory, and a kingdom... his dominion is an everlasting dominion, which shall not pass away.* The dominion is GIVEN — the Formed Son receives the kingdom from the Father, not seized as a co-equal by nature.'
  FROM cross_reference_threads t, cross_references x, _mk16_lookup sv, _mk16_lookup tv
 WHERE t.slug='mark-16-received-up-sat-on-the-right-hand-psalm-110-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=16 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Kings 2:11 — *there appeared a chariot of fire, and horses of fire... and Elijah went up by a whirlwind into heaven.* Elijah snatched to a mountain is the shadow; the Son received up to the throne is the substance.'
  FROM cross_reference_threads t, cross_references x, _mk16_lookup sv, _mk16_lookup tv
 WHERE t.slug='mark-16-received-up-sat-on-the-right-hand-psalm-110-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=16 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=2 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Isaiah 52:7 — *How beautiful upon the mountains are the feet of him that bringeth good tidings... that saith unto Zion, Thy Elohim (God) reigneth!* *They went forth, and preached every where, Yahuah (Lord) working with them* — the enthroned Son reigning and confirming the word.'
  FROM cross_reference_threads t, cross_references x, _mk16_lookup sv, _mk16_lookup tv
 WHERE t.slug='mark-16-received-up-sat-on-the-right-hand-psalm-110-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=16 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=52 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session260 — Mark (depth) cross-references complete.'
