-- ----- fragment: minion_1maccabees_07.sql (session253 1-maccabees 7) -----
-- Source anchor: apocrypha/1-maccabees ch7. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1mac7 (view _session253_1mac7_lookup). Sort band base 61650, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1mac7_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-maccabees-7-spread-the-blasphemy
  ('apocrypha', '1-maccabees', 7, 37, 'canon', '2-kings', 19, 14, 'free', E'2 Kings 19:14 — *And Hezekiah received the letter of the hand of the messengers, and read it: and Hezekiah went up into the house of Yahuah (LORD), and spread it before Yahuah (LORD).* As the priests carry Nicanor''s threat to the altar, so Hezekiah carries the blasphemer''s letter into the same house and lays it open before Yahuah.'),
  ('apocrypha', '1-maccabees', 7, 38, 'canon', '2-kings', 19, 19, 'free', E'2 Kings 19:19 — *Now therefore, O Yahuah (LORD) our Elohim (God), I beseech thee, save thou us out of his hand, that all the kingdoms of the earth may know that thou art Yahuah Elohim (the LORD God), even thou only.* Hezekiah''s plea that Yahuah avenge His own name is the very plea the priests pray when they ask Him to remember Nicanor''s blasphemies.'),
  ('apocrypha', '1-maccabees', 7, 37, 'canon', 'psalms', 79, 1, 'free', E'Psalm 79:1 — *O Elohim (God), the heathen are come into thine inheritance; thy holy temple have they defiled; they have laid Jerusalem on heaps.* Asaph''s lament over the profaned house is the same grief that drives the priests to plead for the house called by Yahuah''s name.'),
  -- thread: 1-maccabees-7-thy-angel-went-out
  ('apocrypha', '1-maccabees', 7, 41, 'canon', '2-kings', 19, 35, 'free', E'2 Kings 19:35 — *And it came to pass that night, that the angel of Yahuah (LORD) went out, and smote in the camp of the Assyrians an hundred fourscore and five thousand: and when they arose early in the morning, behold, they were all dead corpses.* Judas quotes this deliverance almost word for word, pleading the same angel and the same number against Nicanor.'),
  ('apocrypha', '1-maccabees', 7, 42, 'canon', 'psalms', 79, 6, 'free', E'Psalm 79:6 — *Pour out thy wrath upon the heathen that have not known thee, and upon the kingdoms that have not called upon thy name.* Judas'' cry to destroy the blaspheming host echoes Asaph''s prayer that Yahuah''s wrath fall on the nations that defy His name.'),
  ('apocrypha', '1-maccabees', 7, 42, 'canon', 'psalms', 79, 10, 'free', E'Psalm 79:10 — *Wherefore should the heathen say, Where is their Elohim (God)? let him be known among the heathen in our sight by the revenging of the blood of thy servants which is shed.* Judas asks Yahuah to make Himself known by judging Nicanor, the very vindication Asaph sought for the blood of the servants.'),
  -- thread: 1-maccabees-7-pit-he-digged
  ('apocrypha', '1-maccabees', 7, 47, 'canon', 'psalms', 7, 15, 'free', E'Psalm 7:15 — *He made a pit, and digged it, and is fallen into the ditch which he made.* Nicanor, who dug the snare for Judas and threatened the temple, is himself first slain and his proud hand hung up — fallen into his own ditch.'),
  ('apocrypha', '1-maccabees', 7, 47, 'canon', 'psalms', 7, 16, 'free', E'Psalm 7:16 — *His mischief shall return upon his own head, and his violent dealing shall come down upon his own pate.* The head and right hand Nicanor stretched out so proudly are struck off and hung toward Jerusalem — his violent dealing come down upon his own pate.'),
  ('apocrypha', '1-maccabees', 7, 47, 'canon', 'proverbs', 26, 27, 'free', E'Proverbs 26:27 — *Whoso diggeth a pit shall fall therein: and he that rolleth a stone, it will return upon him.* The proverb''s law of the pit-digger is enacted exactly in Nicanor, who plotted Judas'' ruin and met his own.'),
  ('apocrypha', '1-maccabees', 7, 43, 'canon', 'esther', 9, 25, 'free', E'Esther 9:25 — *But when Esther came before the king, he commanded by letters that his wicked device, which he devised against the Yahudim (Jews), should return upon his own head, and that he and his sons should be hanged on the gallows.* As Haman''s device returned on his own head and he was hanged up, so Nicanor''s host is broken on the thirteenth of Adar and his hand hung up toward Jerusalem.'),
  -- thread: 1-maccabees-7-day-of-gladness-ordained
  ('apocrypha', '1-maccabees', 7, 49, 'canon', 'esther', 9, 27, 'free', E'Esther 9:27 — *The Yahudim (Jews) ordained, and took upon them, and upon their seed, and upon all such as joined themselves unto them, so as it should not fail, that they would keep these two days according to their writing, and according to their appointed time every year.* As Purim was ordained yearly for the deliverance from Haman, so the thirteenth of Adar is ordained yearly for the deliverance from Nicanor — the same covenant memory.'),
  ('apocrypha', '1-maccabees', 7, 48, 'canon', 'john', 10, 22, 'free', E'John 10:22 — *And it was at Jerusalem the feast of the dedication, and it was winter.* The memorial days the Maccabees ordained were kept down to the Messiah''s own day, who walked the temple at the dedication the brethren established.'),
  -- thread: 1-maccabees-7-blood-of-the-saints
  ('apocrypha', '1-maccabees', 7, 17, 'canon', 'psalms', 79, 2, 'free', E'Psalm 79:2 — *The dead bodies of thy servants have they given to be meat unto the fowls of the heaven, the flesh of thy saints unto the beasts of the earth.* The cry over the slain Assideans, the flesh of the saints cast out, is drawn straight from Asaph''s lament over the bodies of Yahuah''s servants.'),
  ('apocrypha', '1-maccabees', 7, 17, 'canon', 'psalms', 79, 3, 'free', E'Psalm 79:3 — *Their blood have they shed like water round about Jerusalem; and there was none to bury them.* The chapter''s words — blood shed round about Jerusalem with none to bury them — are Psalm 79''s words exactly, the same desolation a covenant age later.'),
  ('apocrypha', '1-maccabees', 7, 18, 'canon', 'daniel', 11, 30, 'free', E'Daniel 11:30 — *For the ships of Chittim shall come against him: therefore he shall be grieved, and return, and have indignation against the holy covenant: so shall he do; he shall even return, and have intelligence with them that forsake the holy covenant.* Daniel names the very players of this chapter: the system that rages against the holy covenant working through Israelites like Alcimus who forsake it.'),
  ('apocrypha', '1-maccabees', 7, 17, 'canon', 'matthew', 23, 35, 'free', E'Matthew 23:35 — *That upon you may come all the righteous blood shed upon the earth, from the blood of righteous Abel unto the blood of Zacharias son of Barachias, whom ye slew between the temple and the altar.* The Messiah gathers all such shed righteous blood — the Assideans'' among it — into one reckoning that Yahuah will avenge.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1mac7_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1mac7_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-7-spread-the-blasphemy',
       E'The blasphemy spread before Yahuah',
       E'When Nicanor swears in his wrath, *Unless Judas and his host be now delivered into my hands, if ever I come again in safety, I will burn up this house: and with that he went out in a great rage* (1 Maccabees 7:35), the priests do not arm — they stand before the altar and lay the threat at the feet of the One whose name the house bears: *You, O Yahuah (God), did choose this house to be called by your name, and to be a house of prayer and petition for your people* (1 Maccabees 7:37), *Be avenged of this man and his host, and let them fall by the sword: remember their blasphemies, and suffer them not to continue any longer* (1 Maccabees 7:38). It ain''t new. When the Assyrian sent his blasphemy in a letter, Hezekiah did the same — *And Hezekiah received the letter of the hand of the messengers, and read it: and Hezekiah went up into the house of Yahuah (LORD), and spread it before Yahuah (LORD)* (2 Kings 19:14) — and prayed, *Now therefore, O Yahuah (LORD) our Elohim (God), I beseech thee, save thou us out of his hand, that all the kingdoms of the earth may know that thou art Yahuah Elohim (the LORD God), even thou only* (2 Kings 19:19). And Asaph had cried over a temple already defiled, *O Elohim (God), the heathen are come into thine inheritance; thy holy temple have they defiled; they have laid Jerusalem on heaps* (Psalm 79:1). The covenant people do not match blasphemy with blasphemy; they bring it before the Name and let Him answer for His own house.',
       sv.verse_id, ev.verse_id, 'extras', 61650
  FROM _session253_1mac7_lookup sv, _session253_1mac7_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=7 AND sv.verse_number=35
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=7 AND ev.verse_number=38
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-7-thy-angel-went-out',
       E'Thy angel that smote the Assyrians',
       E'Before the battle Judas pitches at Adasa and prays, reaching back across the centuries to the great deliverance: *O Yahuah (God), when they that were sent from the king of the Assyrians blasphemed, your angel went out, and struck an hundred fourscore and five thousand of them* (1 Maccabees 7:41), *Even so destroy you this host before us this day, that the rest may know that he has spoken blasphemously against your sanctuary, and judge you him according to his wickedness* (1 Maccabees 7:42). The number is no flourish — it is quoted straight out of the Tanakh: *And it came to pass that night, that the angel of Yahuah (LORD) went out, and smote in the camp of the Assyrians an hundred fourscore and five thousand: and when they arose early in the morning, behold, they were all dead corpses* (2 Kings 19:35). Judas prays the precedent: the same Yahuah who answered blasphemy then will answer it now. And Asaph framed the verdict Judas asks for — *Pour out thy wrath upon the heathen that have not known thee, and upon the kingdoms that have not called upon thy name* (Psalm 79:6), *let him be known among the heathen in our sight by the revenging of the blood of thy servants which is shed* (Psalm 79:10). It ain''t new: deliverance is asked on the ground of what He has already done.',
       sv.verse_id, ev.verse_id, 'extras', 61653
  FROM _session253_1mac7_lookup sv, _session253_1mac7_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=7 AND sv.verse_number=40
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=7 AND ev.verse_number=42
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-7-pit-he-digged',
       E'His mischief returned on his own head',
       E'Nicanor, who had laughed at the priests and *spoke proudly* (1 Maccabees 7:34) and stretched out his hand against the sanctuary, is the first to fall: *So the thirteenth day of the month Adar the hosts joined battle: but Nicanor''s host was discomfited, and he himself was first slain in the battle* (1 Maccabees 7:43), and then *they took the spoils, and the prey, and struck off Nicanors head, and his right hand, which he stretched out so proudly, and brought them away, and hanged them up toward Jerusalem* (1 Maccabees 7:47). This is the oldest law of the wicked man''s end. David sang it: *He made a pit, and digged it, and is fallen into the ditch which he made* (Psalm 7:15), *His mischief shall return upon his own head, and his violent dealing shall come down upon his own pate* (Psalm 7:16). Wisdom said it plainly — *Whoso diggeth a pit shall fall therein: and he that rolleth a stone, it will return upon him* (Proverbs 26:27). And the same Adar gallows had already swallowed another enemy of the covenant people: *he commanded by letters that his wicked device, which he devised against the Yahudim (Jews), should return upon his own head, and that he and his sons should be hanged on the gallows* (Esther 9:25). The proud right hand stretched against Yahuah''s house is the hand hung up before it.',
       sv.verse_id, ev.verse_id, 'extras', 61656
  FROM _session253_1mac7_lookup sv, _session253_1mac7_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=7 AND sv.verse_number=43
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=7 AND ev.verse_number=47
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-7-day-of-gladness-ordained',
       E'Ordained yearly: a day of great gladness',
       E'The deliverance is not let slip but written into the calendar of the covenant people: *For this cause the people rejoiced greatly, and they kept that day a day of great gladness* (1 Maccabees 7:48), *Moreover they ordained to keep yearly this day, being the thirteenth of Adar* (1 Maccabees 7:49). It ain''t new — this is how Yashar''el remembers what Yahuah does: *The Yahudim (Jews) ordained, and took upon them, and upon their seed, and upon all such as joined themselves unto them, so as it should not fail, that they would keep these two days according to their writing, and according to their appointed time every year* (Esther 9:27). Adar''s deliverance from Haman and Adar''s deliverance from Nicanor stand side by side, both made a yearly remembrance. And the Maccabean memorials were no dead custom: the Messiah Himself walked the temple at the feast the brethren ordained — *And it was at Jerusalem the feast of the dedication, and it was winter* (John 10:22). The appointed days of this very deliverance the covenant people kept, and the Son of Yahuah kept them too.',
       sv.verse_id, ev.verse_id, 'extras', 61659
  FROM _session253_1mac7_lookup sv, _session253_1mac7_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=7 AND sv.verse_number=48
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=7 AND ev.verse_number=49
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-7-blood-of-the-saints',
       E'The blood of the saints, none to bury them',
       E'Alcimus the false priest, having sworn peace, slaughters the Assideans who trusted his priestly oath: *Whereupon they believed him: howbeit he took of them threescore men, and slew them in one day, according to the words which he wrote* (1 Maccabees 7:16), so that the people cry, *The flesh of your saints have they cast out, and their blood have they shed round about Jerusalem, and there was none to bury them* (1 Maccabees 7:17), *for they have broken the covenant and oath that they made* (1 Maccabees 7:18). The lament is lifted almost verbatim from Asaph over an earlier desolation: *The dead bodies of thy servants have they given to be meat unto the fowls of the heaven, the flesh of thy saints unto the beasts of the earth* (Psalm 79:2), *Their blood have they shed like water round about Jerusalem; and there was none to bury them* (Psalm 79:3). This is the work of the abomination Daniel foresaw, the kingdom of man that wars on the covenant — *he shall even return, and have intelligence with them that forsake the holy covenant* (Daniel 11:30) — the same spirit the Messiah charged on the murderers of the prophets, *That upon you may come all the righteous blood shed upon the earth, from the blood of righteous Abel unto the blood of Zacharias son of Barachias, whom ye slew between the temple and the altar* (Matthew 23:35). The covenant-keepers die at the hand of the covenant-breakers, and Yahuah remembers their blood.',
       sv.verse_id, ev.verse_id, 'extras', 61662
  FROM _session253_1mac7_lookup sv, _session253_1mac7_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=7 AND sv.verse_number=16
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=7 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-maccabees-7-spread-the-blasphemy
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Kings 19:14 — *And Hezekiah received the letter of the hand of the messengers, and read it: and Hezekiah went up into the house of Yahuah (LORD), and spread it before Yahuah (LORD).* As the priests carry Nicanor''s threat to the altar, so Hezekiah carries the blasphemer''s letter into the same house and lays it open before Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac7_lookup sv, _session253_1mac7_lookup tv
 WHERE t.slug='1-maccabees-7-spread-the-blasphemy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=7 AND sv.verse_number=37
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=19 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Kings 19:19 — *Now therefore, O Yahuah (LORD) our Elohim (God), I beseech thee, save thou us out of his hand, that all the kingdoms of the earth may know that thou art Yahuah Elohim (the LORD God), even thou only.* Hezekiah''s plea that Yahuah avenge His own name is the very plea the priests pray when they ask Him to remember Nicanor''s blasphemies.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac7_lookup sv, _session253_1mac7_lookup tv
 WHERE t.slug='1-maccabees-7-spread-the-blasphemy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=7 AND sv.verse_number=38
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=19 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 79:1 — *O Elohim (God), the heathen are come into thine inheritance; thy holy temple have they defiled; they have laid Jerusalem on heaps.* Asaph''s lament over the profaned house is the same grief that drives the priests to plead for the house called by Yahuah''s name.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac7_lookup sv, _session253_1mac7_lookup tv
 WHERE t.slug='1-maccabees-7-spread-the-blasphemy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=7 AND sv.verse_number=37
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=79 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-7-thy-angel-went-out
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Kings 19:35 — *And it came to pass that night, that the angel of Yahuah (LORD) went out, and smote in the camp of the Assyrians an hundred fourscore and five thousand: and when they arose early in the morning, behold, they were all dead corpses.* Judas quotes this deliverance almost word for word, pleading the same angel and the same number against Nicanor.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac7_lookup sv, _session253_1mac7_lookup tv
 WHERE t.slug='1-maccabees-7-thy-angel-went-out'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=7 AND sv.verse_number=41
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=19 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 79:6 — *Pour out thy wrath upon the heathen that have not known thee, and upon the kingdoms that have not called upon thy name.* Judas'' cry to destroy the blaspheming host echoes Asaph''s prayer that Yahuah''s wrath fall on the nations that defy His name.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac7_lookup sv, _session253_1mac7_lookup tv
 WHERE t.slug='1-maccabees-7-thy-angel-went-out'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=7 AND sv.verse_number=42
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=79 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 79:10 — *Wherefore should the heathen say, Where is their Elohim (God)? let him be known among the heathen in our sight by the revenging of the blood of thy servants which is shed.* Judas asks Yahuah to make Himself known by judging Nicanor, the very vindication Asaph sought for the blood of the servants.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac7_lookup sv, _session253_1mac7_lookup tv
 WHERE t.slug='1-maccabees-7-thy-angel-went-out'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=7 AND sv.verse_number=42
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=79 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-7-pit-he-digged
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 7:15 — *He made a pit, and digged it, and is fallen into the ditch which he made.* Nicanor, who dug the snare for Judas and threatened the temple, is himself first slain and his proud hand hung up — fallen into his own ditch.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac7_lookup sv, _session253_1mac7_lookup tv
 WHERE t.slug='1-maccabees-7-pit-he-digged'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=7 AND sv.verse_number=47
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=7 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 7:16 — *His mischief shall return upon his own head, and his violent dealing shall come down upon his own pate.* The head and right hand Nicanor stretched out so proudly are struck off and hung toward Jerusalem — his violent dealing come down upon his own pate.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac7_lookup sv, _session253_1mac7_lookup tv
 WHERE t.slug='1-maccabees-7-pit-he-digged'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=7 AND sv.verse_number=47
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=7 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 26:27 — *Whoso diggeth a pit shall fall therein: and he that rolleth a stone, it will return upon him.* The proverb''s law of the pit-digger is enacted exactly in Nicanor, who plotted Judas'' ruin and met his own.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac7_lookup sv, _session253_1mac7_lookup tv
 WHERE t.slug='1-maccabees-7-pit-he-digged'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=7 AND sv.verse_number=47
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=26 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Esther 9:25 — *But when Esther came before the king, he commanded by letters that his wicked device, which he devised against the Yahudim (Jews), should return upon his own head, and that he and his sons should be hanged on the gallows.* As Haman''s device returned on his own head and he was hanged up, so Nicanor''s host is broken on the thirteenth of Adar and his hand hung up toward Jerusalem.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac7_lookup sv, _session253_1mac7_lookup tv
 WHERE t.slug='1-maccabees-7-pit-he-digged'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=7 AND sv.verse_number=43
   AND tv.edition_slug='canon' AND tv.book_slug='esther' AND tv.chapter_number=9 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-7-day-of-gladness-ordained
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Esther 9:27 — *The Yahudim (Jews) ordained, and took upon them, and upon their seed, and upon all such as joined themselves unto them, so as it should not fail, that they would keep these two days according to their writing, and according to their appointed time every year.* As Purim was ordained yearly for the deliverance from Haman, so the thirteenth of Adar is ordained yearly for the deliverance from Nicanor — the same covenant memory.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac7_lookup sv, _session253_1mac7_lookup tv
 WHERE t.slug='1-maccabees-7-day-of-gladness-ordained'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=7 AND sv.verse_number=49
   AND tv.edition_slug='canon' AND tv.book_slug='esther' AND tv.chapter_number=9 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 10:22 — *And it was at Jerusalem the feast of the dedication, and it was winter.* The memorial days the Maccabees ordained were kept down to the Messiah''s own day, who walked the temple at the dedication the brethren established.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac7_lookup sv, _session253_1mac7_lookup tv
 WHERE t.slug='1-maccabees-7-day-of-gladness-ordained'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=7 AND sv.verse_number=48
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=10 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-7-blood-of-the-saints
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 79:2 — *The dead bodies of thy servants have they given to be meat unto the fowls of the heaven, the flesh of thy saints unto the beasts of the earth.* The cry over the slain Assideans, the flesh of the saints cast out, is drawn straight from Asaph''s lament over the bodies of Yahuah''s servants.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac7_lookup sv, _session253_1mac7_lookup tv
 WHERE t.slug='1-maccabees-7-blood-of-the-saints'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=7 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=79 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 79:3 — *Their blood have they shed like water round about Jerusalem; and there was none to bury them.* The chapter''s words — blood shed round about Jerusalem with none to bury them — are Psalm 79''s words exactly, the same desolation a covenant age later.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac7_lookup sv, _session253_1mac7_lookup tv
 WHERE t.slug='1-maccabees-7-blood-of-the-saints'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=7 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=79 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 11:30 — *For the ships of Chittim shall come against him: therefore he shall be grieved, and return, and have indignation against the holy covenant: so shall he do; he shall even return, and have intelligence with them that forsake the holy covenant.* Daniel names the very players of this chapter: the system that rages against the holy covenant working through Israelites like Alcimus who forsake it.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac7_lookup sv, _session253_1mac7_lookup tv
 WHERE t.slug='1-maccabees-7-blood-of-the-saints'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=7 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=11 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 23:35 — *That upon you may come all the righteous blood shed upon the earth, from the blood of righteous Abel unto the blood of Zacharias son of Barachias, whom ye slew between the temple and the altar.* The Messiah gathers all such shed righteous blood — the Assideans'' among it — into one reckoning that Yahuah will avenge.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac7_lookup sv, _session253_1mac7_lookup tv
 WHERE t.slug='1-maccabees-7-blood-of-the-saints'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=7 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=23 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

