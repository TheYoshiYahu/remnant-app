-- ----- fragment: minion_ecclesiasticus_47.sql (session253 ecclesiasticus 47) -----
-- Source anchor: apocrypha/ecclesiasticus ch47. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: sir47 (view _session253_sir47_lookup). Sort band base 59450, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_sir47_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: sirach-47-nathan-the-prophet
  ('apocrypha', 'ecclesiasticus', 47, 1, 'canon', '2-samuel', 7, 12, 'free', E'2 Samuel 7:12 — *And when thy days be fulfilled, and thou shalt sleep with thy fathers, I will set up thy seed after thee, which shall proceed out of thy bowels, and I will establish his kingdom.* This is the very promise Nathan carried in the time of David that Sirach 47:1 sets at the head of David''s praise.'),
  ('apocrypha', 'ecclesiasticus', 47, 1, 'canon', '2-samuel', 12, 7, 'free', E'2 Samuel 12:7 — *And Nathan said to David, Thou art the man. Thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel), I anointed thee king over Yashar''el (Israel), and I delivered thee out of the hand of Saul.* The prophet of Sirach 47:1 is the same who held even the anointed king to the covenant.'),
  -- thread: sirach-47-david-slew-the-giant
  ('apocrypha', 'ecclesiasticus', 47, 4, 'canon', '1-samuel', 17, 45, 'free', E'1 Samuel 17:45 — *Then said David to the Philistine, Thou comest to me with a sword, and with a spear, and with a shield: but I come to thee in the name of Yahuah Tseva''ot (LORD of hosts), the Elohim (God) of the armies of Yashar''el (Israel), whom thou hast defied.* The boy who beat down the boasting of Goliath in Sirach 47:4 came not by arms but by the Name.'),
  ('apocrypha', 'ecclesiasticus', 47, 4, 'canon', '1-samuel', 17, 50, 'free', E'1 Samuel 17:50 — *So David prevailed over the Philistine with a sling and with a stone, and smote the Philistine, and slew him; but there was no sword in the hand of David.* This is the stone in the sling and the slain giant that Sirach 47:4 sets at the head of David''s might.'),
  ('apocrypha', 'ecclesiasticus', 47, 5, 'canon', 'hebrews', 11, 32, 'free', E'Hebrews 11:32 — *And what shall I more say? for the time would fail me to tell of Gedeon, and of Barak, and of Samson, and of Jephthae; of David also, and Samuel, and of the prophets:* the same David whom Sirach 47:5 praises for calling upon the Most High is set among the cloud of faithful witnesses.'),
  -- thread: sirach-47-the-singer-and-the-feasts
  ('apocrypha', 'ecclesiasticus', 47, 9, 'canon', '1-chronicles', 16, 4, 'free', E'1 Chronicles 16:4 — *And he appointed certain of the Levites to minister before the ark of Yahuah (LORD), and to record, and to thank and praise Yahuah Elohim (the LORD God) of Yashar''el (Israel):* this is the singing service before the altar that Sirach 47:9 credits to David.'),
  ('apocrypha', 'ecclesiasticus', 47, 10, 'canon', '1-chronicles', 23, 5, 'free', E'1 Chronicles 23:5 — *Moreover four thousand were porters; and four thousand praised Yahuah (LORD) with the instruments which I made, said David, to praise therewith.* The daily melody and ordered solemn times of Sirach 47:9-10 are David''s own appointment for the praise of the holy Name.'),
  -- thread: sirach-47-the-horn-and-throne-for-ever
  ('apocrypha', 'ecclesiasticus', 47, 11, 'canon', '2-samuel', 12, 13, 'free', E'2 Samuel 12:13 — *And David said unto Nathan, I have sinned against Yahuah (LORD). And Nathan said unto David, Yahuah (LORD) also hath put away thy sin; thou shalt not die.* This is the taking-away of David''s sins that Sirach 47:11 names before exalting his horn.'),
  ('apocrypha', 'ecclesiasticus', 47, 11, 'canon', 'psalms', 89, 4, 'free', E'Psalm 89:4 — *Thy seed will I establish for ever, and build up thy throne to all generations. Selah.* The covenant of kings and throne of glory of Sirach 47:11 is the sworn oath to David''s seed for ever.'),
  ('apocrypha', 'ecclesiasticus', 47, 11, 'canon', 'luke', 1, 32, 'free', E'Luke 1:32 — *He shall be great, and shall be called the Son of the Highest: and Yahuah Elohim (the Lord God) shall give unto him the throne of his father David:* the horn exalted for ever in Sirach 47:11 reaches its term in the Son given David''s throne.'),
  -- thread: sirach-47-solomon-the-wise-built-the-house
  ('apocrypha', 'ecclesiasticus', 47, 14, 'canon', '1-kings', 3, 12, 'free', E'1 Kings 3:12 — *Behold, I have done according to thy words: lo, I have given thee a wise and an understanding heart; so that there was none like thee before thee, neither after thee shall any arise like unto thee.* This is the youthful, flooding understanding Sirach 47:14 marvels at in Solomon.'),
  ('apocrypha', 'ecclesiasticus', 47, 13, 'canon', '1-kings', 8, 20, 'free', E'1 Kings 8:20 — *And Yahuah (LORD) hath performed his word that he spake, and I am risen up in the room of David my father, and sit on the throne of Yashar''el (Israel), as Yahuah (LORD) promised, and have built an house for the name of Yahuah Elohim (the LORD God) of Yashar''el (Israel).* The house in Yahuah''s name that Sirach 47:13 says Solomon built is the temple Solomon dedicates here.'),
  ('apocrypha', 'ecclesiasticus', 47, 14, 'apocrypha', 'the-wisdom-of-solomon', 9, 9, 'extras', E'Wisdom of Solomon 9:9 — *And wisdom was with you: which knoweth your works, and was present when you madest the world, and knew what was acceptable in your sight, and right in your commandments.* In the sister book of this same library Solomon confesses the source of the understanding Sirach 47:14 praises — the Wisdom present at the founding of the world.'),
  -- thread: sirach-47-solomon-the-women-turned-him
  ('apocrypha', 'ecclesiasticus', 47, 19, 'canon', '1-kings', 11, 4, 'free', E'1 Kings 11:4 — *For it came to pass, when Solomon was old, that his wives turned away his heart after other gods: and his heart was not perfect with Yahuah Elohav (the LORD his God), as was the heart of David his father.* This is the bowing to women and subjection of body that Sirach 47:19 grieves over in Solomon.'),
  ('apocrypha', 'ecclesiasticus', 47, 20, 'canon', '1-kings', 11, 11, 'free', E'1 Kings 11:11 — *Wherefore Yahuah (LORD) said unto Solomon, Forasmuch as this is done of thee, and thou hast not kept my covenant and my statutes, which I have commanded thee, I will surely rend the kingdom from thee, and will give it to thy servant.* The wrath upon his children that Sirach 47:20 names is the rending of the kingdom for Solomon''s broken covenant.'),
  -- thread: sirach-47-the-kingdom-divided-root-kept
  ('apocrypha', 'ecclesiasticus', 47, 23, 'canon', '1-kings', 11, 31, 'free', E'1 Kings 11:31 — *And he said to Jeroboam, Take thee ten pieces: for thus saith Yahuah (LORD), the Elohim (God) of Yashar''el (Israel), Behold, I will rend the kingdom out of the hand of Solomon, and will give ten tribes to thee:* this is the rebellious kingdom of Ephraim under Jeroboam that Sirach 47:23 names.'),
  ('apocrypha', 'ecclesiasticus', 47, 21, 'canon', '1-kings', 12, 19, 'free', E'1 Kings 12:19 — *So Yashar''el (Israel) rebelled against the house of David unto this day.* This is the dividing of the kingdom out of Ephraim that Sirach 47:21 records.'),
  ('apocrypha', 'ecclesiasticus', 47, 22, 'canon', 'ezekiel', 37, 22, 'free', E'Ezekiel 37:22 — *And I will make them one nation in the land upon the mountains of Yashar''el (Israel); and one king shall be king to them all: and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all:* the remnant and root kept for David in Sirach 47:22 is the sworn rejoining of the two houses the schism tore apart.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_sir47_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_sir47_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-47-nathan-the-prophet',
       E'Nathan rose up in the time of David',
       E'Ben Sira opens the chapter with the prophet who stood at David''s side: *And after him rose up Nathan to prophesy in the time of David* (Sirach 47:1). It was Nathan who carried Yahuah''s word both ways — the everlasting covenant and the searching rebuke. He brought the promise of the seed and the throne: *And when thy days be fulfilled, and thou shalt sleep with thy fathers, I will set up thy seed after thee, which shall proceed out of thy bowels, and I will establish his kingdom* (2 Samuel 7:12). And when David fell, the same prophet did not flatter him but named the sin: *And Nathan said to David, Thou art the man. Thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel), I anointed thee king over Yashar''el (Israel), and I delivered thee out of the hand of Saul* (2 Samuel 12:7). The prophet beside the king is the witness that the throne is held to the covenant, not above it.',
       sv.verse_id, ev.verse_id, 'extras', 59450
  FROM _session253_sir47_lookup sv, _session253_sir47_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=47 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=47 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-47-david-slew-the-giant',
       E'He slew the giant when he was yet young',
       E'Ben Sira remembers the shepherd-boy who feared no beast and no champion: *He played with lions as with kids, and with bears as with lambs* (Sirach 47:3), and *Slew he not a giant, when he was yet but young? and did he not take away reproach from the people, when he lifted up his hand with the stone in the sling, and beat down the boasting of Goliath?* (Sirach 47:4). The Tanakh tells it plainly — David came in no armour but in the Name: *Then said David to the Philistine, Thou comest to me with a sword, and with a spear, and with a shield: but I come to thee in the name of Yahuah Tseva''ot (LORD of hosts), the Elohim (God) of the armies of Yashar''el (Israel), whom thou hast defied* (1 Samuel 17:45), and *So David prevailed over the Philistine with a sling and with a stone, and smote the Philistine, and slew him; but there was no sword in the hand of David* (1 Samuel 17:50). Ben Sira names the reason the boy prevailed: *For he called upon the most high Yahuah (God); and he gave him strength in his right hand to slay that mighty warrior, and set up the horn of his people* (Sirach 47:5). David is named again among the faithful who *subdued kingdoms*: *And what shall I more say? for the time would fail me to tell of Gedeon, and of Barak, and of Samson, and of Jephthae; of David also, and Samuel, and of the prophets* (Hebrews 11:32).',
       sv.verse_id, ev.verse_id, 'extras', 59453
  FROM _session253_sir47_lookup sv, _session253_sir47_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=47 AND sv.verse_number=3
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=47 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-47-the-singer-and-the-feasts',
       E'He set singers before the altar and ordered the feasts',
       E'Ben Sira praises David not only as warrior but as worshipper, the man after Yahuah''s own heart: *In all his works he praised the Holy One most high with words of glory; with his whole heart he sung songs, and loved him that made him* (Sirach 47:8). He set the Levites to their service: *He set singers also before the altar, that by their voices they might make sweet melody, and daily sing praises in their songs* (Sirach 47:9). The Chronicler records the very ordinance: *And he appointed certain of the Levites to minister before the ark of Yahuah (LORD), and to record, and to thank and praise Yahuah Elohim (the LORD God) of Yashar''el (Israel)* (1 Chronicles 16:4). And Ben Sira binds David to the appointed times: *He beautified their feasts, and set in order the solemn times until the end, that they might praise his holy name, and that the temple might sound from morning* (Sirach 47:10) — the moedim Yahuah set, kept and beautified by the king, *praised Yahuah (LORD) with the instruments which I made, said David, to praise therewith* (1 Chronicles 23:5).',
       sv.verse_id, ev.verse_id, 'extras', 59456
  FROM _session253_sir47_lookup sv, _session253_sir47_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=47 AND sv.verse_number=8
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=47 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-47-the-horn-and-throne-for-ever',
       E'His sins forgiven, his horn exalted for ever',
       E'Ben Sira ends David''s praise where the covenant stands: *Yahuah (God) took away his sins, and exalted his horn for ever: he gave him a covenant of kings, and a throne of glory in Yashar''el (Israel)* (Sirach 47:11). When the prophet had named his sin, the word came: *And David said unto Nathan, I have sinned against Yahuah (LORD). And Nathan said unto David, Yahuah (LORD) also hath put away thy sin; thou shalt not die* (2 Samuel 12:13). The covenant of kings is the oath sworn in the psalm: *I have made a covenant with my chosen, I have sworn unto David my servant, Thy seed will I establish for ever, and build up thy throne to all generations. Selah* (Psalm 89:3-4). And the throne of glory in Israel is not closed with David — the everlasting throne reaches to the Son: *He shall be great, and shall be called the Son of the Highest: and Yahuah Elohim (the Lord God) shall give unto him the throne of his father David: And he shall reign over the house of Jacob for ever; and of his kingdom there shall be no end* (Luke 1:32-33). The exalted horn that never fails is the seed of David raised up to reign.',
       sv.verse_id, ev.verse_id, 'extras', 59459
  FROM _session253_sir47_lookup sv, _session253_sir47_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=47 AND sv.verse_number=11
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=47 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-47-solomon-the-wise-built-the-house',
       E'The wise son who built the house',
       E'After David rose his son in peace: *After him rose up a wise son, and for his sake he dwelt at large* (Sirach 47:12), and *Solomon reigned in a peaceable time, and was honoured; for Yahuah (God) made all quiet round about him, that he might build an house in his name, and prepare his sanctuary for ever* (Sirach 47:13). The wisdom Ben Sira marvels at — *How wise were you in your youth and, as a flood, filled with understanding!* (Sirach 47:14) — was the gift Solomon asked and received: *Behold, I have done according to thy words: lo, I have given thee a wise and an understanding heart; so that there was none like thee before thee, neither after thee shall any arise like unto thee* (1 Kings 3:12). The house he built is the temple promised through Nathan: *And Yahuah (LORD) hath performed his word that he spake, and I am risen up in the room of David my father, and sit on the throne of Yashar''el (Israel), as Yahuah (LORD) promised, and have built an house for the name of Yahuah Elohim (the LORD God) of Yashar''el (Israel)* (1 Kings 8:20). Solomon himself confessed whence the wisdom came, in the sister book of this same library: *And wisdom was with you: which knoweth your works, and was present when you madest the world, and knew what was acceptable in your sight, and right in your commandments* (Wisdom of Solomon 9:9).',
       sv.verse_id, ev.verse_id, 'extras', 59462
  FROM _session253_sir47_lookup sv, _session253_sir47_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=47 AND sv.verse_number=12
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=47 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-47-solomon-the-women-turned-him',
       E'Thou didst bow thy loins to women',
       E'Ben Sira will not flatter even the wisest king. After the gold and the songs comes the fall: *You did bow your loins to women, and by your body you were brought into subjection* (Sirach 47:19), and *You did stain your honour, and pollute your seed: so that you broughtest wrath upon your children, and were grieved for your folly* (Sirach 47:20). The Tanakh tells the same grief: *For it came to pass, when Solomon was old, that his wives turned away his heart after other gods: and his heart was not perfect with Yahuah Elohav (the LORD his God), as was the heart of David his father* (1 Kings 11:4). And the wrath upon his children was the rending of the kingdom: *Wherefore Yahuah (LORD) said unto Solomon, Forasmuch as this is done of thee, and thou hast not kept my covenant and my statutes, which I have commanded thee, I will surely rend the kingdom from thee, and will give it to thy servant* (1 Kings 11:11). The wisest man was brought into subjection because his heart turned from the covenant — Torah stands even over Solomon.',
       sv.verse_id, ev.verse_id, 'extras', 59465
  FROM _session253_sir47_lookup sv, _session253_sir47_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=47 AND sv.verse_number=19
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=47 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-47-the-kingdom-divided-root-kept',
       E'The kingdom divided, yet the root kept for David',
       E'Here is the schism, and the mercy that outlasts it. Ben Sira anchors the hope before the rupture: *But Yahuah (God) will never leave off his mercy, neither shall any of his works perish, neither will he abolish the posterity of his elect, and the seed of him that loves him he will not take away: wherefore he gave a remnant to Jacob, and out of him a root to David* (Sirach 47:22). Then comes the tearing: *So the kingdom was divided, and out of Ephraim ruled a rebellious kingdom* (Sirach 47:21), and *There was also Jeroboam the son of Nebat, who caused Yashar''el (Israel) to sin, and shewed Ephraim the way of sin* (Sirach 47:23). The Tanakh names the rending: *And he said to Jeroboam, Take thee ten pieces: for thus saith Yahuah (LORD), the Elohim (God) of Yashar''el (Israel), Behold, I will rend the kingdom out of the hand of Solomon, and will give ten tribes to thee* (1 Kings 11:31), and the ten tribes broke away — *So Yashar''el (Israel) rebelled against the house of David unto this day* (1 Kings 12:19). Yet the rending was never the end: Yahuah held one tribe *for David my servant''s sake* (the root of Sirach 47:22), and the two divided houses are sworn to be rejoined — *And I will make them one nation in the land upon the mountains of Yashar''el (Israel); and one king shall be king to them all: and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all* (Ezekiel 37:22). The gathering reverses the schism Ben Sira mourns.',
       sv.verse_id, ev.verse_id, 'extras', 59468
  FROM _session253_sir47_lookup sv, _session253_sir47_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=47 AND sv.verse_number=21
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=47 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: sirach-47-nathan-the-prophet
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Samuel 7:12 — *And when thy days be fulfilled, and thou shalt sleep with thy fathers, I will set up thy seed after thee, which shall proceed out of thy bowels, and I will establish his kingdom.* This is the very promise Nathan carried in the time of David that Sirach 47:1 sets at the head of David''s praise.'
  FROM cross_reference_threads t, cross_references x, _session253_sir47_lookup sv, _session253_sir47_lookup tv
 WHERE t.slug='sirach-47-nathan-the-prophet'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=47 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=7 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Samuel 12:7 — *And Nathan said to David, Thou art the man. Thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel), I anointed thee king over Yashar''el (Israel), and I delivered thee out of the hand of Saul.* The prophet of Sirach 47:1 is the same who held even the anointed king to the covenant.'
  FROM cross_reference_threads t, cross_references x, _session253_sir47_lookup sv, _session253_sir47_lookup tv
 WHERE t.slug='sirach-47-nathan-the-prophet'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=47 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=12 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-47-david-slew-the-giant
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Samuel 17:45 — *Then said David to the Philistine, Thou comest to me with a sword, and with a spear, and with a shield: but I come to thee in the name of Yahuah Tseva''ot (LORD of hosts), the Elohim (God) of the armies of Yashar''el (Israel), whom thou hast defied.* The boy who beat down the boasting of Goliath in Sirach 47:4 came not by arms but by the Name.'
  FROM cross_reference_threads t, cross_references x, _session253_sir47_lookup sv, _session253_sir47_lookup tv
 WHERE t.slug='sirach-47-david-slew-the-giant'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=47 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=17 AND tv.verse_number=45
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Samuel 17:50 — *So David prevailed over the Philistine with a sling and with a stone, and smote the Philistine, and slew him; but there was no sword in the hand of David.* This is the stone in the sling and the slain giant that Sirach 47:4 sets at the head of David''s might.'
  FROM cross_reference_threads t, cross_references x, _session253_sir47_lookup sv, _session253_sir47_lookup tv
 WHERE t.slug='sirach-47-david-slew-the-giant'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=47 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=17 AND tv.verse_number=50
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 11:32 — *And what shall I more say? for the time would fail me to tell of Gedeon, and of Barak, and of Samson, and of Jephthae; of David also, and Samuel, and of the prophets:* the same David whom Sirach 47:5 praises for calling upon the Most High is set among the cloud of faithful witnesses.'
  FROM cross_reference_threads t, cross_references x, _session253_sir47_lookup sv, _session253_sir47_lookup tv
 WHERE t.slug='sirach-47-david-slew-the-giant'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=47 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-47-the-singer-and-the-feasts
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Chronicles 16:4 — *And he appointed certain of the Levites to minister before the ark of Yahuah (LORD), and to record, and to thank and praise Yahuah Elohim (the LORD God) of Yashar''el (Israel):* this is the singing service before the altar that Sirach 47:9 credits to David.'
  FROM cross_reference_threads t, cross_references x, _session253_sir47_lookup sv, _session253_sir47_lookup tv
 WHERE t.slug='sirach-47-the-singer-and-the-feasts'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=47 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=16 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Chronicles 23:5 — *Moreover four thousand were porters; and four thousand praised Yahuah (LORD) with the instruments which I made, said David, to praise therewith.* The daily melody and ordered solemn times of Sirach 47:9-10 are David''s own appointment for the praise of the holy Name.'
  FROM cross_reference_threads t, cross_references x, _session253_sir47_lookup sv, _session253_sir47_lookup tv
 WHERE t.slug='sirach-47-the-singer-and-the-feasts'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=47 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=23 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-47-the-horn-and-throne-for-ever
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Samuel 12:13 — *And David said unto Nathan, I have sinned against Yahuah (LORD). And Nathan said unto David, Yahuah (LORD) also hath put away thy sin; thou shalt not die.* This is the taking-away of David''s sins that Sirach 47:11 names before exalting his horn.'
  FROM cross_reference_threads t, cross_references x, _session253_sir47_lookup sv, _session253_sir47_lookup tv
 WHERE t.slug='sirach-47-the-horn-and-throne-for-ever'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=47 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=12 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 89:4 — *Thy seed will I establish for ever, and build up thy throne to all generations. Selah.* The covenant of kings and throne of glory of Sirach 47:11 is the sworn oath to David''s seed for ever.'
  FROM cross_reference_threads t, cross_references x, _session253_sir47_lookup sv, _session253_sir47_lookup tv
 WHERE t.slug='sirach-47-the-horn-and-throne-for-ever'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=47 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=89 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Luke 1:32 — *He shall be great, and shall be called the Son of the Highest: and Yahuah Elohim (the Lord God) shall give unto him the throne of his father David:* the horn exalted for ever in Sirach 47:11 reaches its term in the Son given David''s throne.'
  FROM cross_reference_threads t, cross_references x, _session253_sir47_lookup sv, _session253_sir47_lookup tv
 WHERE t.slug='sirach-47-the-horn-and-throne-for-ever'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=47 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-47-solomon-the-wise-built-the-house
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Kings 3:12 — *Behold, I have done according to thy words: lo, I have given thee a wise and an understanding heart; so that there was none like thee before thee, neither after thee shall any arise like unto thee.* This is the youthful, flooding understanding Sirach 47:14 marvels at in Solomon.'
  FROM cross_reference_threads t, cross_references x, _session253_sir47_lookup sv, _session253_sir47_lookup tv
 WHERE t.slug='sirach-47-solomon-the-wise-built-the-house'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=47 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=3 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Kings 8:20 — *And Yahuah (LORD) hath performed his word that he spake, and I am risen up in the room of David my father, and sit on the throne of Yashar''el (Israel), as Yahuah (LORD) promised, and have built an house for the name of Yahuah Elohim (the LORD God) of Yashar''el (Israel).* The house in Yahuah''s name that Sirach 47:13 says Solomon built is the temple Solomon dedicates here.'
  FROM cross_reference_threads t, cross_references x, _session253_sir47_lookup sv, _session253_sir47_lookup tv
 WHERE t.slug='sirach-47-solomon-the-wise-built-the-house'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=47 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=8 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Wisdom of Solomon 9:9 — *And wisdom was with you: which knoweth your works, and was present when you madest the world, and knew what was acceptable in your sight, and right in your commandments.* In the sister book of this same library Solomon confesses the source of the understanding Sirach 47:14 praises — the Wisdom present at the founding of the world.'
  FROM cross_reference_threads t, cross_references x, _session253_sir47_lookup sv, _session253_sir47_lookup tv
 WHERE t.slug='sirach-47-solomon-the-wise-built-the-house'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=47 AND sv.verse_number=14
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=9 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-47-solomon-the-women-turned-him
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Kings 11:4 — *For it came to pass, when Solomon was old, that his wives turned away his heart after other gods: and his heart was not perfect with Yahuah Elohav (the LORD his God), as was the heart of David his father.* This is the bowing to women and subjection of body that Sirach 47:19 grieves over in Solomon.'
  FROM cross_reference_threads t, cross_references x, _session253_sir47_lookup sv, _session253_sir47_lookup tv
 WHERE t.slug='sirach-47-solomon-the-women-turned-him'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=47 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=11 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Kings 11:11 — *Wherefore Yahuah (LORD) said unto Solomon, Forasmuch as this is done of thee, and thou hast not kept my covenant and my statutes, which I have commanded thee, I will surely rend the kingdom from thee, and will give it to thy servant.* The wrath upon his children that Sirach 47:20 names is the rending of the kingdom for Solomon''s broken covenant.'
  FROM cross_reference_threads t, cross_references x, _session253_sir47_lookup sv, _session253_sir47_lookup tv
 WHERE t.slug='sirach-47-solomon-the-women-turned-him'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=47 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=11 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-47-the-kingdom-divided-root-kept
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Kings 11:31 — *And he said to Jeroboam, Take thee ten pieces: for thus saith Yahuah (LORD), the Elohim (God) of Yashar''el (Israel), Behold, I will rend the kingdom out of the hand of Solomon, and will give ten tribes to thee:* this is the rebellious kingdom of Ephraim under Jeroboam that Sirach 47:23 names.'
  FROM cross_reference_threads t, cross_references x, _session253_sir47_lookup sv, _session253_sir47_lookup tv
 WHERE t.slug='sirach-47-the-kingdom-divided-root-kept'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=47 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=11 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Kings 12:19 — *So Yashar''el (Israel) rebelled against the house of David unto this day.* This is the dividing of the kingdom out of Ephraim that Sirach 47:21 records.'
  FROM cross_reference_threads t, cross_references x, _session253_sir47_lookup sv, _session253_sir47_lookup tv
 WHERE t.slug='sirach-47-the-kingdom-divided-root-kept'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=47 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=12 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 37:22 — *And I will make them one nation in the land upon the mountains of Yashar''el (Israel); and one king shall be king to them all: and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all:* the remnant and root kept for David in Sirach 47:22 is the sworn rejoining of the two houses the schism tore apart.'
  FROM cross_reference_threads t, cross_references x, _session253_sir47_lookup sv, _session253_sir47_lookup tv
 WHERE t.slug='sirach-47-the-kingdom-divided-root-kept'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=47 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

