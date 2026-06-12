-- ----- fragment: minion_1maccabees_05.sql (session253 1-maccabees 5) -----
-- Source anchor: apocrypha/1-maccabees ch5. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1mac5 (view _session253_1mac5_lookup). Sort band base 61600, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1mac5_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-maccabees-5-brethren-regathered
  ('apocrypha', '1-maccabees', 5, 45, 'canon', 'deuteronomy', 30, 3, 'free', E'Deuteronomy 30:3 — *That then Yahuah Elohayka (the LORD thy God) will turn thy captivity, and have compassion upon thee, and will return and gather thee from all the nations, whither Yahuah Elohayka (the LORD thy God) hath scattered thee.* Judas gathering the Israelites of Galaad back into Judea is the Torah''s gathering-promise enacted in miniature.'),
  ('apocrypha', '1-maccabees', 5, 45, 'canon', 'deuteronomy', 30, 4, 'free', E'Deuteronomy 30:4 — *If any of thine be driven out unto the outmost parts of heaven, from thence will Yahuah Elohayka (the LORD thy God) gather thee, and from thence will he fetch thee.* The brethren fetched out of Bosora, Maked, and Carnaim answer to the promise that none of His are too far driven to be brought home.'),
  ('apocrypha', '1-maccabees', 5, 23, 'canon', 'jeremiah', 31, 10, 'free', E'Jeremiah 31:10 — *Hear the word of Yahuah (LORD), O ye nations, and declare it in the isles afar off, and say, He that scattered Yashar''el (Israel) will gather him, and keep him, as a shepherd doth his flock.* Simon bringing those of Galilee with their wives and children into Judea with great joy is the Shepherd gathering His flock.'),
  ('apocrypha', '1-maccabees', 5, 9, 'canon', 'ezekiel', 37, 21, 'free', E'Ezekiel 37:21 — *And say unto them, Thus saith Adonai Yahuah (the Lord GOD); Behold, I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side, and bring them into their own land.* The heathen assembling to destroy the Israelites only sets the stage for the LORD''s own promise to take His children from among the heathen.'),
  ('apocrypha', '1-maccabees', 5, 45, 'canon', 'isaiah', 11, 12, 'free', E'Isaiah 11:12 — *And he shall set up an ensign for the nations, and shall assemble the outcasts of Yashar''el (Israel), and gather together the dispersed of Yahudah (Judah) from the four corners of the earth.* The dispersed brethren of Galaad assembled from the least to the greatest foreshadow the assembling of the outcasts from the four corners.'),
  -- thread: 1-maccabees-5-the-battle-is-yahuahs
  ('apocrypha', '1-maccabees', 5, 33, 'canon', '2-chronicles', 20, 15, 'free', E'2 Chronicles 20:15 — *And he said, Hearken ye, all Yahudah (Judah), and ye inhabitants of Jerusalem, and thou king Jehoshaphat, Thus saith Yahuah (LORD) unto you, Be not afraid nor dismayed by reason of this great multitude; for the battle is not yours, but Elohim''s (God''s).* Judas crying with prayer against Timotheus'' great host owns the same truth — the battle belongs to Elohim, not the multitude.'),
  ('apocrypha', '1-maccabees', 5, 33, 'canon', '1-samuel', 17, 47, 'free', E'1 Samuel 17:47 — *And all this assembly shall know that Yahuah (LORD) saveth not with sword and spear: for the battle is the LORD''S, and he will give you into our hands.* The trumpets and prayer of Judas'' three companies confess what David confessed before Goliath: the LORD saveth not by the sword.'),
  ('apocrypha', '1-maccabees', 5, 33, 'canon', 'exodus', 17, 11, 'free', E'Exodus 17:11 — *And it came to pass, when Moses held up his hand, that Yashar''el (Israel) prevailed: and when he let down his hand, Amalek prevailed.* Judas prevailing as he cried with prayer is the lifted hands of Moses over Amalek again — the victory flows from heaven, not the arm.'),
  ('apocrypha', '1-maccabees', 5, 33, 'apocrypha', '1-maccabees', 4, 10, 'extras', E'1 Maccabees 4:10 — *Now therefore let us cry to heaven, if perhaps Yahuah (God) will have mercy upon us, and remember the covenant of our fathers, and destroy this host before our face this day.* The same crying to heaven and pleading the covenant that armed Judas at Emmaus arms him again at Carnaim.'),
  -- thread: 1-maccabees-5-mount-sion-with-joy
  ('apocrypha', '1-maccabees', 5, 54, 'canon', 'jeremiah', 31, 11, 'free', E'Jeremiah 31:11 — *For Yahuah (LORD) hath redeemed Jacob, and ransomed him from the hand of him that was stronger than he.* Going up to Sion with joy, not one slain, is Jacob ransomed from the hand of the stronger — the heathen host that would have consumed them.'),
  ('apocrypha', '1-maccabees', 5, 23, 'canon', 'zechariah', 10, 9, 'free', E'Zechariah 10:9 — *And I will sow them among the people: and they shall remember me in far countries; and they shall live with their children, and turn again.* The brethren of Galilee brought back with their wives and children, turning again to Judea, are the sown remnant remembering and returning.'),
  ('apocrypha', '1-maccabees', 5, 54, 'canon', 'john', 10, 16, 'free', E'John 10:16 — *And other sheep I have, which are not of this fold: them also I must bring, and they shall hear my voice; and there shall be one fold, and one shepherd.* The scattered brethren gathered to mount Sion prefigure the one fold the Shepherd Himself goes out to bring home.'),
  -- thread: 1-maccabees-5-the-appointed-deliverer
  ('apocrypha', '1-maccabees', 5, 62, 'apocrypha', '2-maccabees', 8, 23, 'extras', E'2 Maccabees 8:23 — *Also he appointed Eleazar to read the holy book: and when he had given them this watchword, The help of Yahuah (God); himself leading the first band,* The watchword ''The help of Yahuah'' is exactly what Joseph and Azarias forsook when they went out to get themselves a name rather than wait on the appointed hand.'),
  ('apocrypha', '1-maccabees', 5, 60, 'apocrypha', '2-maccabees', 8, 24, 'extras', E'2 Maccabees 8:24 — *And by the help of the Almighty they slew above nine thousand of their enemies, and wounded and maimed the most part of Nicanor''s host, and so put all to flight;* Where the Almighty''s help is sought there is great slaughter of the enemy; where it is presumed upon, two thousand of Israel fall instead.'),
  ('apocrypha', '1-maccabees', 5, 62, 'apocrypha', '1-maccabees', 4, 30, 'extras', E'1 Maccabees 4:30 — *And when he saw that mighty army, he prayed and said, Blessed art you, O Saviour of Yashar''el (Israel), who did quell the violence of the mighty man by the hand of your servant David, and gavest the host of strangers into the hands of Jonathan the son of Saul, and his armourbearer;* Deliverance comes by the chosen hand — David''s, Jonathan''s, Judas'' — not by men who came not of that seed.'),
  ('apocrypha', '1-maccabees', 5, 61, 'canon', '2-chronicles', 20, 15, 'free', E'2 Chronicles 20:15 — *And he said, Hearken ye, all Yahudah (Judah), and ye inhabitants of Jerusalem, and thou king Jehoshaphat, Thus saith Yahuah (LORD) unto you, Be not afraid nor dismayed by reason of this great multitude; for the battle is not yours, but Elohim''s (God''s).* The overthrow of those who sought a name for themselves underscores that the battle is the LORD''s, won by obedience, not self-willed valour.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1mac5_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1mac5_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-5-brethren-regathered',
       E'Deliver our brethren — the covenant people gathered out of the nations',
       E'Hemmed in among the heathen of Galaad and Galilee, the besieged brethren send to Judas: *Come now therefore, and deliver us from their hands, for many of us are slain* (1 Maccabees 5:12), and he goes out to bring them home — *Then Judas gathered together all the Israelites that were in the country of Galaad, from the least to the greatest, even their wives, and their children, and their stuff, a very great host, to the end they might come into the land of Judea* (1 Maccabees 5:45). This is no new thing under Antiochus'' sword; it is the ancient promise unfolding. Moses had sworn it from the first: *That then Yahuah Elohayka (the LORD thy God) will turn thy captivity, and have compassion upon thee, and will return and gather thee from all the nations, whither Yahuah Elohayka (the LORD thy God) hath scattered thee* (Deuteronomy 30:3), *If any of thine be driven out unto the outmost parts of heaven, from thence will Yahuah Elohayka (the LORD thy God) gather thee, and from thence will he fetch thee* (Deuteronomy 30:4). The prophets carry the same word — *Hear the word of Yahuah (LORD), O ye nations, and declare it in the isles afar off, and say, He that scattered Yashar''el (Israel) will gather him, and keep him, as a shepherd doth his flock* (Jeremiah 31:10); *And he shall set up an ensign for the nations, and shall assemble the outcasts of Yashar''el (Israel), and gather together the dispersed of Yahudah (Judah) from the four corners of the earth* (Isaiah 11:12). The Maccabean rescue is a small, true picture of the great Ingathering — not a church replacing the seed but the very children of Jacob kept: *Behold, I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side, and bring them into their own land* (Ezekiel 37:21).',
       sv.verse_id, ev.verse_id, 'extras', 61600
  FROM _session253_1mac5_lookup sv, _session253_1mac5_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=5 AND sv.verse_number=9
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=5 AND ev.verse_number=54
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-5-the-battle-is-yahuahs',
       E'They cried with prayer — for the battle is the LORD''s',
       E'When the battle was joined Judas did not trust in numbers but in heaven: *So he went forth behind them in three companies, who sounded their trumpets, and cried with prayer* (1 Maccabees 5:33). It is the old way of war in Yashar''el, where the sword is lifted but the victory is owned to Yahuah. So Jehoshaphat was told, *Thus saith Yahuah (LORD) unto you, Be not afraid nor dismayed by reason of this great multitude; for the battle is not yours, but Elohim''s (God''s)* (2 Chronicles 20:15), and the issue was *set yourselves, stand ye still, and see the salvation of Yahuah (LORD) with you* (2 Chronicles 20:17). David said it over Goliath — *And all this assembly shall know that Yahuah (LORD) saveth not with sword and spear: for the battle is the LORD''S, and he will give you into our hands* (1 Samuel 17:47) — and Moses showed it with lifted hands: *And it came to pass, when Moses held up his hand, that Yashar''el (Israel) prevailed: and when he let down his hand, Amalek prevailed* (Exodus 17:11). The Maccabees carry the same testimony in the same chapter: *Now therefore let us cry to heaven, if perhaps Yahuah (God) will have mercy upon us, and remember the covenant of our fathers, and destroy this host before our face this day* (1 Maccabees 4:10).',
       sv.verse_id, ev.verse_id, 'extras', 61603
  FROM _session253_1mac5_lookup sv, _session253_1mac5_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=5 AND sv.verse_number=31
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=5 AND ev.verse_number=34
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-5-mount-sion-with-joy',
       E'Up to mount Sion with joy — the redeemed brought home',
       E'The deliverance ends where every true gathering ends — at the holy mountain, in worship and gladness: *So they went up to mount Sion with joy and gladness, where they offered burnt offerings, because not one of them were slain until they had returned in peace* (1 Maccabees 5:54). Simon''s company likewise *brought them into Judea with great joy* (1 Maccabees 5:23). This is the prophets'' very note — the ransom of Jacob ending in singing on the height of Zion: *For Yahuah (LORD) hath redeemed Jacob, and ransomed him from the hand of him that was stronger than he* (Jeremiah 31:11). The returning are not a fraction lost but the whole flock kept — *I will sow them among the people: and they shall remember me in far countries; and they shall live with their children, and turn again* (Zechariah 10:9) — and the Good Shepherd Himself names the one fold gathered: *And other sheep I have, which are not of this fold: them also I must bring, and they shall hear my voice; and there shall be one fold, and one shepherd* (John 10:16). Not one of the rescued slain is the earnest of that keeping.',
       sv.verse_id, ev.verse_id, 'extras', 61606
  FROM _session253_1mac5_lookup sv, _session253_1mac5_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=5 AND sv.verse_number=23
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=5 AND ev.verse_number=54
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-5-the-appointed-deliverer',
       E'Not of the seed by whose hand deliverance was given',
       E'When Joseph and Azarias, left to keep Judea, presumed to *get us a name* and went to fight unbidden, they were routed: *Thus was there a great overthrow among the children of Yashar''el (Israel), because they were not obedient to Judas and his brothers, but thought to do some valiant act* (1 Maccabees 5:61), *Moreover these men came not of the seed of those, by whose hand deliverance was given to Yashar''el (Israel)* (1 Maccabees 5:62). Deliverance is not seized by zeal-for-self; it comes by the appointed hand and a cry to heaven. The same chapter shows the right way — *And by the help of the Almighty they slew above nine thousand of their enemies* (2 Maccabees 8:24) — for victory is *The help of Yahuah (God)* (2 Maccabees 8:23), the watchword Judas gave. So Judas pleaded the LORD who *did quell the violence of the mighty man by the hand of your servant David* (1 Maccabees 4:30): deliverance flows through the seed and servant Yahuah chooses, and is owed back to His name — *Be not afraid nor dismayed by reason of this great multitude; for the battle is not yours, but Elohim''s (God''s)* (2 Chronicles 20:15).',
       sv.verse_id, ev.verse_id, 'extras', 61609
  FROM _session253_1mac5_lookup sv, _session253_1mac5_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=5 AND sv.verse_number=55
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=5 AND ev.verse_number=62
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-maccabees-5-brethren-regathered
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 30:3 — *That then Yahuah Elohayka (the LORD thy God) will turn thy captivity, and have compassion upon thee, and will return and gather thee from all the nations, whither Yahuah Elohayka (the LORD thy God) hath scattered thee.* Judas gathering the Israelites of Galaad back into Judea is the Torah''s gathering-promise enacted in miniature.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac5_lookup sv, _session253_1mac5_lookup tv
 WHERE t.slug='1-maccabees-5-brethren-regathered'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=5 AND sv.verse_number=45
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 30:4 — *If any of thine be driven out unto the outmost parts of heaven, from thence will Yahuah Elohayka (the LORD thy God) gather thee, and from thence will he fetch thee.* The brethren fetched out of Bosora, Maked, and Carnaim answer to the promise that none of His are too far driven to be brought home.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac5_lookup sv, _session253_1mac5_lookup tv
 WHERE t.slug='1-maccabees-5-brethren-regathered'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=5 AND sv.verse_number=45
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 31:10 — *Hear the word of Yahuah (LORD), O ye nations, and declare it in the isles afar off, and say, He that scattered Yashar''el (Israel) will gather him, and keep him, as a shepherd doth his flock.* Simon bringing those of Galilee with their wives and children into Judea with great joy is the Shepherd gathering His flock.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac5_lookup sv, _session253_1mac5_lookup tv
 WHERE t.slug='1-maccabees-5-brethren-regathered'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=5 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ezekiel 37:21 — *And say unto them, Thus saith Adonai Yahuah (the Lord GOD); Behold, I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side, and bring them into their own land.* The heathen assembling to destroy the Israelites only sets the stage for the LORD''s own promise to take His children from among the heathen.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac5_lookup sv, _session253_1mac5_lookup tv
 WHERE t.slug='1-maccabees-5-brethren-regathered'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=5 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Isaiah 11:12 — *And he shall set up an ensign for the nations, and shall assemble the outcasts of Yashar''el (Israel), and gather together the dispersed of Yahudah (Judah) from the four corners of the earth.* The dispersed brethren of Galaad assembled from the least to the greatest foreshadow the assembling of the outcasts from the four corners.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac5_lookup sv, _session253_1mac5_lookup tv
 WHERE t.slug='1-maccabees-5-brethren-regathered'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=5 AND sv.verse_number=45
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-5-the-battle-is-yahuahs
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Chronicles 20:15 — *And he said, Hearken ye, all Yahudah (Judah), and ye inhabitants of Jerusalem, and thou king Jehoshaphat, Thus saith Yahuah (LORD) unto you, Be not afraid nor dismayed by reason of this great multitude; for the battle is not yours, but Elohim''s (God''s).* Judas crying with prayer against Timotheus'' great host owns the same truth — the battle belongs to Elohim, not the multitude.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac5_lookup sv, _session253_1mac5_lookup tv
 WHERE t.slug='1-maccabees-5-the-battle-is-yahuahs'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=5 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=20 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Samuel 17:47 — *And all this assembly shall know that Yahuah (LORD) saveth not with sword and spear: for the battle is the LORD''S, and he will give you into our hands.* The trumpets and prayer of Judas'' three companies confess what David confessed before Goliath: the LORD saveth not by the sword.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac5_lookup sv, _session253_1mac5_lookup tv
 WHERE t.slug='1-maccabees-5-the-battle-is-yahuahs'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=5 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=17 AND tv.verse_number=47
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 17:11 — *And it came to pass, when Moses held up his hand, that Yashar''el (Israel) prevailed: and when he let down his hand, Amalek prevailed.* Judas prevailing as he cried with prayer is the lifted hands of Moses over Amalek again — the victory flows from heaven, not the arm.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac5_lookup sv, _session253_1mac5_lookup tv
 WHERE t.slug='1-maccabees-5-the-battle-is-yahuahs'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=5 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=17 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Maccabees 4:10 — *Now therefore let us cry to heaven, if perhaps Yahuah (God) will have mercy upon us, and remember the covenant of our fathers, and destroy this host before our face this day.* The same crying to heaven and pleading the covenant that armed Judas at Emmaus arms him again at Carnaim.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac5_lookup sv, _session253_1mac5_lookup tv
 WHERE t.slug='1-maccabees-5-the-battle-is-yahuahs'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=5 AND sv.verse_number=33
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=4 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-5-mount-sion-with-joy
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 31:11 — *For Yahuah (LORD) hath redeemed Jacob, and ransomed him from the hand of him that was stronger than he.* Going up to Sion with joy, not one slain, is Jacob ransomed from the hand of the stronger — the heathen host that would have consumed them.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac5_lookup sv, _session253_1mac5_lookup tv
 WHERE t.slug='1-maccabees-5-mount-sion-with-joy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=5 AND sv.verse_number=54
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Zechariah 10:9 — *And I will sow them among the people: and they shall remember me in far countries; and they shall live with their children, and turn again.* The brethren of Galilee brought back with their wives and children, turning again to Judea, are the sown remnant remembering and returning.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac5_lookup sv, _session253_1mac5_lookup tv
 WHERE t.slug='1-maccabees-5-mount-sion-with-joy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=5 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=10 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 10:16 — *And other sheep I have, which are not of this fold: them also I must bring, and they shall hear my voice; and there shall be one fold, and one shepherd.* The scattered brethren gathered to mount Sion prefigure the one fold the Shepherd Himself goes out to bring home.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac5_lookup sv, _session253_1mac5_lookup tv
 WHERE t.slug='1-maccabees-5-mount-sion-with-joy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=5 AND sv.verse_number=54
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=10 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-5-the-appointed-deliverer
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Maccabees 8:23 — *Also he appointed Eleazar to read the holy book: and when he had given them this watchword, The help of Yahuah (God); himself leading the first band,* The watchword ''The help of Yahuah'' is exactly what Joseph and Azarias forsook when they went out to get themselves a name rather than wait on the appointed hand.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac5_lookup sv, _session253_1mac5_lookup tv
 WHERE t.slug='1-maccabees-5-the-appointed-deliverer'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=5 AND sv.verse_number=62
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=8 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Maccabees 8:24 — *And by the help of the Almighty they slew above nine thousand of their enemies, and wounded and maimed the most part of Nicanor''s host, and so put all to flight;* Where the Almighty''s help is sought there is great slaughter of the enemy; where it is presumed upon, two thousand of Israel fall instead.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac5_lookup sv, _session253_1mac5_lookup tv
 WHERE t.slug='1-maccabees-5-the-appointed-deliverer'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=5 AND sv.verse_number=60
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=8 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Maccabees 4:30 — *And when he saw that mighty army, he prayed and said, Blessed art you, O Saviour of Yashar''el (Israel), who did quell the violence of the mighty man by the hand of your servant David, and gavest the host of strangers into the hands of Jonathan the son of Saul, and his armourbearer;* Deliverance comes by the chosen hand — David''s, Jonathan''s, Judas'' — not by men who came not of that seed.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac5_lookup sv, _session253_1mac5_lookup tv
 WHERE t.slug='1-maccabees-5-the-appointed-deliverer'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=5 AND sv.verse_number=62
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=4 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Chronicles 20:15 — *And he said, Hearken ye, all Yahudah (Judah), and ye inhabitants of Jerusalem, and thou king Jehoshaphat, Thus saith Yahuah (LORD) unto you, Be not afraid nor dismayed by reason of this great multitude; for the battle is not yours, but Elohim''s (God''s).* The overthrow of those who sought a name for themselves underscores that the battle is the LORD''s, won by obedience, not self-willed valour.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac5_lookup sv, _session253_1mac5_lookup tv
 WHERE t.slug='1-maccabees-5-the-appointed-deliverer'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=5 AND sv.verse_number=61
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=20 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

