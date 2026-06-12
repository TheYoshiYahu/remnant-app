-- ----- fragment: minion_1maccabees_11.sql (session253 1-maccabees 11) -----
-- Source anchor: apocrypha/1-maccabees ch11. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1mac11 (view _session253_1mac11_lookup). Sort band base 61750, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1mac11_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-maccabees-11-shifting-crowns
  ('apocrypha', '1-maccabees', 11, 13, 'canon', 'daniel', 11, 6, 'free', E'Daniel 11:6 — *And in the end of years they shall join themselves together; for the king’s daughter of the south shall come to the king of the north to make an agreement: but she shall not retain the power of the arm; neither shall he stand, nor his arm: but she shall be given up, and they that brought her, and he that begat her, and he that strengthened her in these times.* Daniel had already mapped this very marriage-alliance of the Ptolemaic daughter and the seizing of two crowns in 1 Maccabees 11:13.'),
  ('apocrypha', '1-maccabees', 11, 18, 'canon', 'psalms', 146, 4, 'free', E'Psalm 146:4 — *His breath goeth forth, he returneth to his earth; in that very day his thoughts perish.* Ptolemee crowns himself king of two realms and dies the third day after (1 Maccabees 11:18), his thoughts perishing exactly as the psalm warns of every son of Adam.'),
  ('apocrypha', '1-maccabees', 11, 17, 'canon', 'job', 12, 21, 'free', E'Job 12:21 — *He poureth contempt upon princes, and weakeneth the strength of the mighty.* Alexander’s head sent to Ptolemee and Ptolemee’s own swift fall (1 Maccabees 11:17) are Yahuah’s hand emptying the mighty of their strength.'),
  ('apocrypha', '1-maccabees', 11, 12, 'canon', 'proverbs', 21, 1, 'free', E'Proverbs 21:1 — *The king’s heart is in the hand of Yahuah (LORD), as the rivers of water: he turneth it whithersoever he will.* Ptolemee’s taking back his daughter and forsaking Alexander (1 Maccabees 11:12) only enacts a turning of kings’ hearts already held in Yahuah’s hand.'),
  -- thread: 1-maccabees-11-covenant-kept
  ('apocrypha', '1-maccabees', 11, 33, 'canon', 'proverbs', 21, 1, 'free', E'Proverbs 21:1 — *The king’s heart is in the hand of Yahuah (LORD), as the rivers of water: he turneth it whithersoever he will.* Demetrius is moved to do good and confirm the covenant-keeping Yahudim (1 Maccabees 11:33) because the heathen king’s heart is itself a river in Yahuah’s hand.'),
  ('apocrypha', '1-maccabees', 11, 27, 'canon', 'numbers', 25, 13, 'free', E'Numbers 25:13 — *And he shall have it, and his seed after him, even the covenant of an everlasting priesthood; because he was zealous for his Elohim (God), and made an atonement for the children of Yashar’el (Israel).* The priesthood confirmed to Jonathan (1 Maccabees 11:27) descends from the everlasting priesthood Yahuah covenanted to zealous Phinehas, the same zeal the Maccabean house carries.'),
  ('apocrypha', '1-maccabees', 11, 37, 'canon', 'deuteronomy', 27, 8, 'free', E'Deuteronomy 27:8 — *And thou shalt write upon the stones all the words of this law very plainly.* Setting the confirming decree upon the holy mount in a conspicuous place (1 Maccabees 11:37) echoes Israel’s command to publish the covenant words plainly upon the mountain stones.'),
  -- thread: 1-maccabees-11-faithful-deliver-the-king
  ('apocrypha', '1-maccabees', 11, 47, 'canon', 'joshua', 23, 10, 'free', E'Joshua 23:10 — *One man of you shall chase a thousand: for Yahuah Elohaychem (the LORD your God), he it is that fighteth for you, as he hath promised you.* The three thousand Yahudim routing the great city (1 Maccabees 11:47) enact the promise that the LORD multiplies the kept seed, one chasing a thousand.'),
  ('apocrypha', '1-maccabees', 11, 44, 'canon', '1-samuel', 14, 6, 'free', E'1 Samuel 14:6 — *And Jonathan said to the young man that bare his armour, Come, and let us go over unto the garrison of these uncircumcised: it may be that Yahuah (LORD) will work for us: for there is no restraint to Yahuah (LORD) to save by many or by few.* Jonathan sending only three thousand strong men to Antioch (1 Maccabees 11:44) trusts the same truth his namesake spoke, that Yahuah saves by few as easily as by many.'),
  ('apocrypha', '1-maccabees', 11, 48, 'canon', 'job', 12, 18, 'free', E'Job 12:18 — *He looseth the bond of kings, and girdeth their loins with a girdle.* The faithful delivering and re-establishing the king (1 Maccabees 11:48) is Yahuah’s own loosing and girding of kings worked through His covenant people.'),
  -- thread: 1-maccabees-11-rent-clothes-and-prayed
  ('apocrypha', '1-maccabees', 11, 71, 'canon', 'joshua', 7, 6, 'free', E'Joshua 7:6 — *And Joshua rent his clothes, and fell to the earth upon his face before the ark of Yahuah (LORD) until the eventide, he and the elders of Yashar’el (Israel), and put dust upon their heads.* Jonathan rending his clothes and casting earth on his head when the battle failed (1 Maccabees 11:71) is the very mourning-before-Yahuah of Joshua at Ai.'),
  ('apocrypha', '1-maccabees', 11, 71, 'canon', '1-samuel', 7, 8, 'free', E'1 Samuel 7:8 — *And the children of Yashar’el (Israel) said to Samuel, Cease not to cry unto Yahuah Eloheinu (the LORD our God) for us, that he will save us out of the hand of the Philistines.* Jonathan’s prayer in the dust (1 Maccabees 11:71) follows Israel’s pattern: deliverance comes through the cry to Yahuah, not the strength of the host.'),
  ('apocrypha', '1-maccabees', 11, 72, 'canon', 'exodus', 17, 11, 'free', E'Exodus 17:11 — *And it came to pass, when Moses held up his hand, that Yashar’el (Israel) prevailed: and when he let down his hand, Amalek prevailed.* That Jonathan prevails only after he prays (1 Maccabees 11:72) echoes Amalek’s defeat hanging on uplifted hands of intercession rather than the sword alone.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1mac11_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1mac11_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-11-shifting-crowns',
       E'Two crowns upon one head — the kings of the north and the south',
       E'The chapter opens with Ptolemee marching north through deceit, *And the king of Egypt gathered together a great host, like the sand that lieth upon the sea shore, and many ships, and went about through deceit to get Alexander’s kingdom, and join it to his own* (1 Maccabees 11:1), until *Then Ptolemee entered into Antioch, where he set two crowns upon his head, the crown of Asia, and of Egypt* (1 Maccabees 11:13) — yet within days Alexander is beheaded and Ptolemee himself dies: *King Ptolemee also died the third day after, and they that were in the strong holds were slain one of another* (1 Maccabees 11:18). This is the very wrestle Daniel foresaw two centuries before, the king of the south and the king of the north grinding against each other, *And in the end of years they shall join themselves together; for the king’s daughter of the south shall come to the king of the north to make an agreement: but she shall not retain the power of the arm; neither shall he stand, nor his arm: but she shall be given up, and they that brought her, and he that begat her, and he that strengthened her in these times* (Daniel 11:6) — for here the daughter is taken from Alexander and given to Demetrius. It ain’t new: the kingdom-of-man rises and topples on schedule, and it is Yahuah who governs the turning. *He poureth contempt upon princes, and weakeneth the strength of the mighty* (Job 12:21), and *His breath goeth forth, he returneth to his earth; in that very day his thoughts perish* (Psalm 146:4). The crowns change heads while the King of the world keeps His covenant.',
       sv.verse_id, ev.verse_id, 'extras', 61750
  FROM _session253_1mac11_lookup sv, _session253_1mac11_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=11 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=11 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-11-covenant-kept',
       E'Because they keep covenants with us — the priesthood confirmed',
       E'Demetrius writes to ratify the standing of the remnant, *We are determined to do good to the people of the Yahudim (Jews), who are our friends, and keep covenants with us, because of their good will toward us* (1 Maccabees 11:33), and the king *confirmed him in the high priesthood, and in all the honours that he had before, and gave him preeminence among his chief friends* (1 Maccabees 11:27), even ordering that the decree be *set upon the holy mount in a conspicuous place* (1 Maccabees 11:37). Note the witness the heathen king bears: this people *keep covenants*. That is the whole testimony of the seed Yahuah preserves — the covenant people kept, not a new people replacing them. It ain’t new: the high priesthood confirmed here descends from the everlasting priesthood Yahuah swore at Peor, *And he shall have it, and his seed after him, even the covenant of an everlasting priesthood; because he was zealous for his Elohim (God), and made an atonement for the children of Yashar’el (Israel)* (Numbers 25:13) — the zeal of Phinehas, the zeal of the Maccabean house. And the publishing of the decree on the holy mount is the old command, *And thou shalt write upon the stones all the words of this law very plainly* (Deuteronomy 27:8). The honours rest on the same covenant Yahuah swore to Israel, and the document stands as a perpetual witness, *And nothing of this shall be revoked from this time forth for ever* (1 Maccabees 11:36).',
       sv.verse_id, ev.verse_id, 'extras', 61753
  FROM _session253_1mac11_lookup sv, _session253_1mac11_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=11 AND sv.verse_number=27
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=11 AND ev.verse_number=37
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-11-faithful-deliver-the-king',
       E'The Yahudim came at once and delivered the king',
       E'When Antioch rose against Demetrius, *the king called to the Yahudim (Jews) for help, who came to him all at once, and dispersing themselves through the city slew that day in the city to the number of an hundred thousand* (1 Maccabees 11:47), so that *Also they set fire on the city, and got many spoils that day, and delivered the king* (1 Maccabees 11:48). Three thousand of the faithful (1 Maccabees 11:44) overcome a city of a hundred and twenty thousand — the few against the many, as always with the remnant. It ain’t new: this is the old confidence of Jonathan son of Saul, *Come, and let us go over unto the garrison of these uncircumcised: it may be that Yahuah (LORD) will work for us: for there is no restraint to Yahuah (LORD) to save by many or by few* (1 Samuel 14:6). The deliverance is not the strength of three thousand swords but the covenant promise, *One man of you shall chase a thousand: for Yahuah Elohaychem (the LORD your God), he it is that fighteth for you, as he hath promised you* (Joshua 23:10). And the loosing and re-establishing of the king is itself the LORD’s work, *He looseth the bond of kings, and girdeth their loins with a girdle* (Job 12:18).',
       sv.verse_id, ev.verse_id, 'extras', 61756
  FROM _session253_1mac11_lookup sv, _session253_1mac11_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=11 AND sv.verse_number=44
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=11 AND ev.verse_number=51
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-11-rent-clothes-and-prayed',
       E'He rent his clothes, cast earth on his head, and prayed',
       E'At the plain of Nasor the ambush breaks Jonathan’s host so that *Insomuch as there was not one of them left, except Mattathias the son of Absalom, and Judas the son of Calphi, the captains of the host* (1 Maccabees 11:70) — and then the decisive act: *Then Jonathan rent his clothes, and cast earth upon his head, and prayed* (1 Maccabees 11:71). Only after the prayer does the tide turn, *Afterwards turning again to battle, he put them to flight, and so they ran away* (1 Maccabees 11:72). This is the posture of the man of the covenant in the dust before Yahuah, the very image of Joshua before the ark, *And Joshua rent his clothes, and fell to the earth upon his face before the ark of Yahuah (LORD) until the eventide, he and the elders of Yashar’el (Israel), and put dust upon their heads* (Joshua 7:6). It ain’t new: Israel’s victory was never in the sword but in the cry, *And the children of Yashar’el (Israel) said to Samuel, Cease not to cry unto Yahuah Eloheinu (the LORD our God) for us, that he will save us out of the hand of the Philistines* (1 Samuel 7:8). Jonathan prays, and the rout becomes a pursuit, *So there were slain of the heathen that day about three thousand men: but Jonathan returned to Jerusalem* (1 Maccabees 11:74) — the captain back at the holy city by the hand of Yahuah, not his own arm.',
       sv.verse_id, ev.verse_id, 'extras', 61759
  FROM _session253_1mac11_lookup sv, _session253_1mac11_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=11 AND sv.verse_number=70
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=11 AND ev.verse_number=74
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-maccabees-11-shifting-crowns
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 11:6 — *And in the end of years they shall join themselves together; for the king’s daughter of the south shall come to the king of the north to make an agreement: but she shall not retain the power of the arm; neither shall he stand, nor his arm: but she shall be given up, and they that brought her, and he that begat her, and he that strengthened her in these times.* Daniel had already mapped this very marriage-alliance of the Ptolemaic daughter and the seizing of two crowns in 1 Maccabees 11:13.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac11_lookup sv, _session253_1mac11_lookup tv
 WHERE t.slug='1-maccabees-11-shifting-crowns'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=11 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=11 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 146:4 — *His breath goeth forth, he returneth to his earth; in that very day his thoughts perish.* Ptolemee crowns himself king of two realms and dies the third day after (1 Maccabees 11:18), his thoughts perishing exactly as the psalm warns of every son of Adam.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac11_lookup sv, _session253_1mac11_lookup tv
 WHERE t.slug='1-maccabees-11-shifting-crowns'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=11 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=146 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Job 12:21 — *He poureth contempt upon princes, and weakeneth the strength of the mighty.* Alexander’s head sent to Ptolemee and Ptolemee’s own swift fall (1 Maccabees 11:17) are Yahuah’s hand emptying the mighty of their strength.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac11_lookup sv, _session253_1mac11_lookup tv
 WHERE t.slug='1-maccabees-11-shifting-crowns'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=11 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=12 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Proverbs 21:1 — *The king’s heart is in the hand of Yahuah (LORD), as the rivers of water: he turneth it whithersoever he will.* Ptolemee’s taking back his daughter and forsaking Alexander (1 Maccabees 11:12) only enacts a turning of kings’ hearts already held in Yahuah’s hand.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac11_lookup sv, _session253_1mac11_lookup tv
 WHERE t.slug='1-maccabees-11-shifting-crowns'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=11 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=21 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-11-covenant-kept
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 21:1 — *The king’s heart is in the hand of Yahuah (LORD), as the rivers of water: he turneth it whithersoever he will.* Demetrius is moved to do good and confirm the covenant-keeping Yahudim (1 Maccabees 11:33) because the heathen king’s heart is itself a river in Yahuah’s hand.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac11_lookup sv, _session253_1mac11_lookup tv
 WHERE t.slug='1-maccabees-11-covenant-kept'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=11 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=21 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 25:13 — *And he shall have it, and his seed after him, even the covenant of an everlasting priesthood; because he was zealous for his Elohim (God), and made an atonement for the children of Yashar’el (Israel).* The priesthood confirmed to Jonathan (1 Maccabees 11:27) descends from the everlasting priesthood Yahuah covenanted to zealous Phinehas, the same zeal the Maccabean house carries.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac11_lookup sv, _session253_1mac11_lookup tv
 WHERE t.slug='1-maccabees-11-covenant-kept'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=11 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=25 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 27:8 — *And thou shalt write upon the stones all the words of this law very plainly.* Setting the confirming decree upon the holy mount in a conspicuous place (1 Maccabees 11:37) echoes Israel’s command to publish the covenant words plainly upon the mountain stones.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac11_lookup sv, _session253_1mac11_lookup tv
 WHERE t.slug='1-maccabees-11-covenant-kept'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=11 AND sv.verse_number=37
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=27 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-11-faithful-deliver-the-king
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joshua 23:10 — *One man of you shall chase a thousand: for Yahuah Elohaychem (the LORD your God), he it is that fighteth for you, as he hath promised you.* The three thousand Yahudim routing the great city (1 Maccabees 11:47) enact the promise that the LORD multiplies the kept seed, one chasing a thousand.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac11_lookup sv, _session253_1mac11_lookup tv
 WHERE t.slug='1-maccabees-11-faithful-deliver-the-king'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=11 AND sv.verse_number=47
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=23 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Samuel 14:6 — *And Jonathan said to the young man that bare his armour, Come, and let us go over unto the garrison of these uncircumcised: it may be that Yahuah (LORD) will work for us: for there is no restraint to Yahuah (LORD) to save by many or by few.* Jonathan sending only three thousand strong men to Antioch (1 Maccabees 11:44) trusts the same truth his namesake spoke, that Yahuah saves by few as easily as by many.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac11_lookup sv, _session253_1mac11_lookup tv
 WHERE t.slug='1-maccabees-11-faithful-deliver-the-king'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=11 AND sv.verse_number=44
   AND tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=14 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Job 12:18 — *He looseth the bond of kings, and girdeth their loins with a girdle.* The faithful delivering and re-establishing the king (1 Maccabees 11:48) is Yahuah’s own loosing and girding of kings worked through His covenant people.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac11_lookup sv, _session253_1mac11_lookup tv
 WHERE t.slug='1-maccabees-11-faithful-deliver-the-king'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=11 AND sv.verse_number=48
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=12 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-11-rent-clothes-and-prayed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joshua 7:6 — *And Joshua rent his clothes, and fell to the earth upon his face before the ark of Yahuah (LORD) until the eventide, he and the elders of Yashar’el (Israel), and put dust upon their heads.* Jonathan rending his clothes and casting earth on his head when the battle failed (1 Maccabees 11:71) is the very mourning-before-Yahuah of Joshua at Ai.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac11_lookup sv, _session253_1mac11_lookup tv
 WHERE t.slug='1-maccabees-11-rent-clothes-and-prayed'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=11 AND sv.verse_number=71
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=7 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Samuel 7:8 — *And the children of Yashar’el (Israel) said to Samuel, Cease not to cry unto Yahuah Eloheinu (the LORD our God) for us, that he will save us out of the hand of the Philistines.* Jonathan’s prayer in the dust (1 Maccabees 11:71) follows Israel’s pattern: deliverance comes through the cry to Yahuah, not the strength of the host.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac11_lookup sv, _session253_1mac11_lookup tv
 WHERE t.slug='1-maccabees-11-rent-clothes-and-prayed'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=11 AND sv.verse_number=71
   AND tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=7 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 17:11 — *And it came to pass, when Moses held up his hand, that Yashar’el (Israel) prevailed: and when he let down his hand, Amalek prevailed.* That Jonathan prevails only after he prays (1 Maccabees 11:72) echoes Amalek’s defeat hanging on uplifted hands of intercession rather than the sword alone.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac11_lookup sv, _session253_1mac11_lookup tv
 WHERE t.slug='1-maccabees-11-rent-clothes-and-prayed'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=11 AND sv.verse_number=72
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=17 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

