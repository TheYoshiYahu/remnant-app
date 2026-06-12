-- ----- fragment: minion_judith_14.sql (session253 judith 14) -----
-- Source anchor: apocrypha/judith ch14. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: jdt14 (view _session253_jdt14_lookup). Sort band base 60325, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_jdt14_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: judith-14-stranger-joined
  ('apocrypha', 'judith', 14, 10, 'canon', 'exodus', 12, 48, 'free', E'Exodus 12:48 — *And when a stranger shall sojourn with thee, and will keep the passover to Yahuah (LORD), let all his males be circumcised, and then let him come near and keep it; and he shall be as one that is born in the land: for no uncircumcised person shall eat thereof.* Achior''s circumcision and joining to the house of Israel in Judith 14:10 is exactly the Torah''s door for the sojourner into the covenant.'),
  ('apocrypha', 'judith', 14, 10, 'canon', 'exodus', 12, 49, 'free', E'Exodus 12:49 — *One law shall be to him that is homeborn, and unto the stranger that sojourneth among you.* The Ammonite joined to Israel in Judith 14:10 stands under the one law that knows no second tier for the grafted-in.'),
  ('apocrypha', 'judith', 14, 10, 'canon', 'isaiah', 56, 6, 'free', E'Isaiah 56:6 — *Also the sons of the stranger, that join themselves to Yahuah (LORD), to serve him, and to love the name of Yahuah (LORD), to be his servants, every one that keepeth the sabbath from polluting it, and taketh hold of my covenant;* Achior believing greatly and joining the house of Israel in Judith 14:10 is the foreigner Isaiah says Yahuah will bring to His holy mountain.'),
  ('apocrypha', 'judith', 14, 10, 'canon', 'ruth', 1, 16, 'free', E'Ruth 1:16 — *And Ruth said, Intreat me not to leave thee, or to return from following after thee: for whither thou goest, I will go; and where thou lodgest, I will lodge: thy people shall be my people, and thy Elohim (God) my Elohim (God):* As Ruth the Moabitess cast her lot with Israel''s people and Israel''s Elohim, so Achior in Judith 14:10 makes the stranger''s covenant confession his own.'),
  -- thread: judith-14-host-routed
  ('apocrypha', 'judith', 14, 3, 'canon', '2-kings', 19, 35, 'free', E'2 Kings 19:35 — *And it came to pass that night, that the angel of Yahuah (LORD) went out, and smote in the camp of the Assyrians an hundred fourscore and five thousand: and when they arose early in the morning, behold, they were all dead corpses.* The Assyrians who run to the tent only to find death and flee in Judith 14:3 reprise Sennacherib''s host, struck and scattered by Yahuah''s hand alone.'),
  ('apocrypha', 'judith', 14, 3, 'canon', 'exodus', 14, 24, 'free', E'Exodus 14:24 — *And it came to pass, that in the morning watch Yahuah (LORD) looked unto the host of the Egyptians through the pillar of fire and of the cloud, and troubled the host of the Egyptians,* The morning panic that falls on the Assyrians in Judith 14:3 is the same morning-watch terror Yahuah loosed upon the host that pursued His people.'),
  ('apocrypha', 'judith', 14, 4, 'canon', 'exodus', 14, 25, 'free', E'Exodus 14:25 — *And took off their chariot wheels, that they drave them heavily: so that the Egyptians said, Let us flee from the face of Yashar''el (Israel); for Yahuah (LORD) fighteth for them against the Egyptians.* Israel pursuing and overthrowing the fleeing host in Judith 14:4 is Yahuah fighting for them, as the Egyptians confessed when they fled the face of Israel.'),
  -- thread: judith-14-womans-hand
  ('apocrypha', 'judith', 14, 18, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The headless tyrant shamed by one woman of the Hebrews in Judith 14:18 echoes the enmity by which the woman''s seed bruises the head of the serpent''s kingdom.'),
  ('apocrypha', 'judith', 14, 18, 'canon', 'judges', 4, 21, 'free', E'Judges 4:21 — *Then Jael Heber’s wife took a nail of the tent, and took an hammer in her hand, and went softly unto him, and smote the nail into his temples, and fastened it into the ground: for he was fast asleep and weary. So he died.* Holofernes lying headless on the ground in Judith 14:18 is Sisera in Jael''s tent, the enemy captain slain by a woman''s hand.'),
  ('apocrypha', 'judith', 14, 18, 'canon', 'judges', 4, 9, 'free', E'Judges 4:9 — *And she said, I will surely go with thee: notwithstanding the journey that thou takest shall not be for thine honour; for Yahuah (LORD) shall sell Sisera into the hand of a woman. And Deborah arose, and went with Barak to Kedesh.* The shame brought on Nabuchodonosor''s house by one woman in Judith 14:18 fulfills the same word: Yahuah sells the proud captain into the hand of a woman.'),
  -- thread: judith-14-blessed-among-women
  ('apocrypha', 'judith', 14, 7, 'canon', 'luke', 1, 42, 'free', E'Luke 1:42 — *And she spake out with a loud voice, and said, Blessed art thou among women, and blessed is the fruit of thy womb.* Achior''s loud blessing of Judith in all the tabernacles of Juda in Judith 14:7 is the same benediction Elisabeth lifts over the lowly woman of Israel.'),
  ('apocrypha', 'judith', 14, 7, 'canon', 'luke', 1, 51, 'free', E'Luke 1:51 — *He hath shewed strength with his arm; he hath scattered the proud in the imagination of their hearts.* The astonishment of all nations at Judith''s name in Judith 14:7 belongs to the Magnificat''s theme: Yahuah scatters the proud and exalts His weak ones.'),
  ('apocrypha', 'judith', 14, 9, 'canon', 'luke', 1, 52, 'free', E'Luke 1:52 — *He hath put down the mighty from their seats, and exalted them of low degree.* The people''s joyful shout in their city in Judith 14:9 rejoices over the very reversal Mary sings — the mighty cast down, the lowly raised up.'),
  -- thread: judith-14-no-gods-deliver
  ('apocrypha', 'judith', 14, 5, 'canon', '2-kings', 19, 18, 'free', E'2 Kings 19:18 — *And have cast their gods into the fire: for they were no gods, but the work of men’s hands, wood and stone: therefore they have destroyed them.* Holofernes, who despised the house of Israel in Judith 14:5, is the same Assyrian conceit that counts Yahuah among the burned idols of conquered nations.'),
  ('apocrypha', 'judith', 14, 5, 'canon', '2-kings', 19, 19, 'free', E'2 Kings 19:19 — *Now therefore, O Yahuah (LORD) our Elohim (God), I beseech thee, save thou us out of his hand, that all the kingdoms of the earth may know that thou art Yahuah Elohim (the LORD God), even thou only.* The deliverance from the tyrant who despised Israel in Judith 14:5 vindicates Hezekiah''s plea that Yahuah alone be known God over all the kingdoms of earth.'),
  ('apocrypha', 'judith', 14, 5, 'canon', '2-kings', 19, 21, 'free', E'2 Kings 19:21 — *This is the word that Yahuah (LORD) hath spoken concerning him; The virgin the daughter of Zion hath despised thee, and laughed thee to scorn; the daughter of Jerusalem hath shaken her head at thee.* The one who sent Achior to his death for despising Israel in Judith 14:5 is himself scorned, as Zion''s daughter laughs the Assyrian boaster to scorn.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_jdt14_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_jdt14_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-14-stranger-joined',
       E'Achior Believes and Is Joined to Israel',
       E'When Achior the Ammonite sees the head of Holofernes and hears all that Yahuah of Yashar''el had done, he believes and is brought into the covenant: *And when Achior had seen all that Yahuah (God) of Yashar''el (Israel) had done, he believed in Yahuah (God) greatly, and circumcised the flesh of his foreskin, and was joined to the house of Yashar''el (Israel) to this day.* (Judith 14:10). This is no church replacing Israel but a stranger grafted into the one covenant on the Torah''s own terms — *And when a stranger shall sojourn with thee, and will keep the passover to Yahuah (LORD), let all his males be circumcised, and then let him come near and keep it; and he shall be as one that is born in the land: for no uncircumcised person shall eat thereof.* (Exodus 12:48), under *One law shall be to him that is homeborn, and unto the stranger that sojourneth among you.* (Exodus 12:49). It is the very thing the prophets foretold — *Also the sons of the stranger, that join themselves to Yahuah (LORD), to serve him, and to love the name of Yahuah (LORD), to be his servants, every one that keepeth the sabbath from polluting it, and taketh hold of my covenant;* (Isaiah 56:6). Achior speaks Ruth''s confession with his life: *Intreat me not to leave thee, or to return from following after thee: for whither thou goest, I will go; and where thou lodgest, I will lodge: thy people shall be my people, and thy Elohim (God) my Elohim (God):* (Ruth 1:16). It ain''t new: the foreigner who sees what Yahuah has done and joins himself is the same witness from Sinai to Zion.',
       sv.verse_id, ev.verse_id, 'extras', 60325
  FROM _session253_jdt14_lookup sv, _session253_jdt14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=14 AND sv.verse_number=5
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=14 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-14-host-routed',
       E'The Assyrian Camp Routed When the Captain Is Found Dead',
       E'Judith bids the men hang the head on the wall and sally out, that the Assyrians may rush to rouse their lord and find him slain: *Then they shall take their armour, and shall go into their camp, and raise up the captains of the army of Assur, and shall run to the tent of Holofernes, but shall not find him: then fear shall fall upon them, and they shall flee before your face.* (Judith 14:3). This is the LORD''s own pattern of routing the Assyrian host in a night — *And it came to pass that night, that the angel of Yahuah (LORD) went out, and smote in the camp of the Assyrians an hundred fourscore and five thousand: and when they arose early in the morning, behold, they were all dead corpses.* (2 Kings 19:35). It is the Red Sea undoing of the pursuer — *And it came to pass, that in the morning watch Yahuah (LORD) looked unto the host of the Egyptians through the pillar of fire and of the cloud, and troubled the host of the Egyptians,* (Exodus 14:24), so that *the Egyptians said, Let us flee from the face of Yashar''el (Israel); for Yahuah (LORD) fighteth for them against the Egyptians.* (Exodus 14:25). The deliverance is Yahuah''s by election, not Israel''s by arms.',
       sv.verse_id, ev.verse_id, 'extras', 60328
  FROM _session253_jdt14_lookup sv, _session253_jdt14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=14 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=14 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-14-womans-hand',
       E'Shame by the Hand of a Woman',
       E'Bagoas runs out and cries the disgrace of the kingdom of man: *These slaves have dealt treacherously; one woman of the Hebrews has brought shame upon the house of king Nabuchodonosor: for, behold, Holofernes lieth upon the ground without a head.* (Judith 14:18). The tyrant who demanded worship is undone not by an army but by a woman''s hand — the ancient sentence on the serpent — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* (Genesis 3:15). It is Jael over Sisera, the captain delivered into a woman''s hand — *Then Jael Heber’s wife took a nail of the tent, and took an hammer in her hand, and went softly unto him, and smote the nail into his temples, and fastened it into the ground: for he was fast asleep and weary. So he died.* (Judges 4:21) — for Deborah had said *Yahuah (LORD) shall sell Sisera into the hand of a woman.* (Judges 4:9). The weak confound the mighty; the bruised head is the kingdom-of-man''s, not the Messiah''s allegory forced onto Judith.',
       sv.verse_id, ev.verse_id, 'extras', 60331
  FROM _session253_jdt14_lookup sv, _session253_jdt14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=14 AND sv.verse_number=15
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=14 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-14-blessed-among-women',
       E'Blessed Art Thou Among Women',
       E'Achior falls at Judith''s feet and blesses her: *Blessed art you in all the tabernacles of Juda, and in all nations, which hearing your name shall be astonished.* (Judith 14:7), and the people shout for joy: *And when she had left off speaking, the people shouted with a loud voice, and made a joyful noise in their city.* (Judith 14:9). The blessing of the lowly woman by whom the proud are cast down sings forward into the Magnificat — *And she spake out with a loud voice, and said, Blessed art thou among women, and blessed is the fruit of thy womb.* (Luke 1:42) — and into Mary''s song of the kingdom-of-man overturned: *He hath shewed strength with his arm; he hath scattered the proud in the imagination of their hearts.* (Luke 1:51), *He hath put down the mighty from their seats, and exalted them of low degree.* (Luke 1:52). The pattern is one: the haughty tyrant brought low, the humble of Israel lifted up, and the name of the deliverer blessed among the nations.',
       sv.verse_id, ev.verse_id, 'extras', 60334
  FROM _session253_jdt14_lookup sv, _session253_jdt14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=14 AND sv.verse_number=7
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=14 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-14-no-gods-deliver',
       E'The Tyrant Who Reproached the House of Israel',
       E'Judith names the offence that called for judgment: *call me Achior the Ammonite, that he may see and know him that despised the house of Yashar''el (Israel), and that sent him to us as it were to his death.* (Judith 14:5). Holofernes serving Nebuchadnezzar is the kingdom-of-man tyrant who reproaches the living Elohim and reckons Israel''s God no different from the idols he has burned — *And have cast their gods into the fire: for they were no gods, but the work of men’s hands, wood and stone: therefore they have destroyed them.* (2 Kings 19:18) — but Hezekiah''s prayer is Israel''s true weapon: *Now therefore, O Yahuah (LORD) our Elohim (God), I beseech thee, save thou us out of his hand, that all the kingdoms of the earth may know that thou art Yahuah Elohim (the LORD God), even thou only.* (2 Kings 19:19). The despiser of the house of Israel is answered as every Assyrian boast is answered — *The virgin the daughter of Zion hath despised thee, and laughed thee to scorn; the daughter of Jerusalem hath shaken her head at thee.* (2 Kings 19:21). Dismantle the system; the living Elohim alone reigns.',
       sv.verse_id, ev.verse_id, 'extras', 60337
  FROM _session253_jdt14_lookup sv, _session253_jdt14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=14 AND sv.verse_number=5
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=14 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: judith-14-stranger-joined
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 12:48 — *And when a stranger shall sojourn with thee, and will keep the passover to Yahuah (LORD), let all his males be circumcised, and then let him come near and keep it; and he shall be as one that is born in the land: for no uncircumcised person shall eat thereof.* Achior''s circumcision and joining to the house of Israel in Judith 14:10 is exactly the Torah''s door for the sojourner into the covenant.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt14_lookup sv, _session253_jdt14_lookup tv
 WHERE t.slug='judith-14-stranger-joined'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=14 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=48
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 12:49 — *One law shall be to him that is homeborn, and unto the stranger that sojourneth among you.* The Ammonite joined to Israel in Judith 14:10 stands under the one law that knows no second tier for the grafted-in.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt14_lookup sv, _session253_jdt14_lookup tv
 WHERE t.slug='judith-14-stranger-joined'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=14 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=49
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 56:6 — *Also the sons of the stranger, that join themselves to Yahuah (LORD), to serve him, and to love the name of Yahuah (LORD), to be his servants, every one that keepeth the sabbath from polluting it, and taketh hold of my covenant;* Achior believing greatly and joining the house of Israel in Judith 14:10 is the foreigner Isaiah says Yahuah will bring to His holy mountain.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt14_lookup sv, _session253_jdt14_lookup tv
 WHERE t.slug='judith-14-stranger-joined'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=14 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=56 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ruth 1:16 — *And Ruth said, Intreat me not to leave thee, or to return from following after thee: for whither thou goest, I will go; and where thou lodgest, I will lodge: thy people shall be my people, and thy Elohim (God) my Elohim (God):* As Ruth the Moabitess cast her lot with Israel''s people and Israel''s Elohim, so Achior in Judith 14:10 makes the stranger''s covenant confession his own.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt14_lookup sv, _session253_jdt14_lookup tv
 WHERE t.slug='judith-14-stranger-joined'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=14 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='ruth' AND tv.chapter_number=1 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-14-host-routed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Kings 19:35 — *And it came to pass that night, that the angel of Yahuah (LORD) went out, and smote in the camp of the Assyrians an hundred fourscore and five thousand: and when they arose early in the morning, behold, they were all dead corpses.* The Assyrians who run to the tent only to find death and flee in Judith 14:3 reprise Sennacherib''s host, struck and scattered by Yahuah''s hand alone.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt14_lookup sv, _session253_jdt14_lookup tv
 WHERE t.slug='judith-14-host-routed'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=14 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=19 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 14:24 — *And it came to pass, that in the morning watch Yahuah (LORD) looked unto the host of the Egyptians through the pillar of fire and of the cloud, and troubled the host of the Egyptians,* The morning panic that falls on the Assyrians in Judith 14:3 is the same morning-watch terror Yahuah loosed upon the host that pursued His people.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt14_lookup sv, _session253_jdt14_lookup tv
 WHERE t.slug='judith-14-host-routed'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=14 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=14 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 14:25 — *And took off their chariot wheels, that they drave them heavily: so that the Egyptians said, Let us flee from the face of Yashar''el (Israel); for Yahuah (LORD) fighteth for them against the Egyptians.* Israel pursuing and overthrowing the fleeing host in Judith 14:4 is Yahuah fighting for them, as the Egyptians confessed when they fled the face of Israel.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt14_lookup sv, _session253_jdt14_lookup tv
 WHERE t.slug='judith-14-host-routed'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=14 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=14 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-14-womans-hand
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The headless tyrant shamed by one woman of the Hebrews in Judith 14:18 echoes the enmity by which the woman''s seed bruises the head of the serpent''s kingdom.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt14_lookup sv, _session253_jdt14_lookup tv
 WHERE t.slug='judith-14-womans-hand'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=14 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Judges 4:21 — *Then Jael Heber’s wife took a nail of the tent, and took an hammer in her hand, and went softly unto him, and smote the nail into his temples, and fastened it into the ground: for he was fast asleep and weary. So he died.* Holofernes lying headless on the ground in Judith 14:18 is Sisera in Jael''s tent, the enemy captain slain by a woman''s hand.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt14_lookup sv, _session253_jdt14_lookup tv
 WHERE t.slug='judith-14-womans-hand'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=14 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=4 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Judges 4:9 — *And she said, I will surely go with thee: notwithstanding the journey that thou takest shall not be for thine honour; for Yahuah (LORD) shall sell Sisera into the hand of a woman. And Deborah arose, and went with Barak to Kedesh.* The shame brought on Nabuchodonosor''s house by one woman in Judith 14:18 fulfills the same word: Yahuah sells the proud captain into the hand of a woman.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt14_lookup sv, _session253_jdt14_lookup tv
 WHERE t.slug='judith-14-womans-hand'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=14 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=4 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-14-blessed-among-women
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Luke 1:42 — *And she spake out with a loud voice, and said, Blessed art thou among women, and blessed is the fruit of thy womb.* Achior''s loud blessing of Judith in all the tabernacles of Juda in Judith 14:7 is the same benediction Elisabeth lifts over the lowly woman of Israel.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt14_lookup sv, _session253_jdt14_lookup tv
 WHERE t.slug='judith-14-blessed-among-women'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=14 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=42
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Luke 1:51 — *He hath shewed strength with his arm; he hath scattered the proud in the imagination of their hearts.* The astonishment of all nations at Judith''s name in Judith 14:7 belongs to the Magnificat''s theme: Yahuah scatters the proud and exalts His weak ones.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt14_lookup sv, _session253_jdt14_lookup tv
 WHERE t.slug='judith-14-blessed-among-women'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=14 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=51
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Luke 1:52 — *He hath put down the mighty from their seats, and exalted them of low degree.* The people''s joyful shout in their city in Judith 14:9 rejoices over the very reversal Mary sings — the mighty cast down, the lowly raised up.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt14_lookup sv, _session253_jdt14_lookup tv
 WHERE t.slug='judith-14-blessed-among-women'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=14 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=52
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-14-no-gods-deliver
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Kings 19:18 — *And have cast their gods into the fire: for they were no gods, but the work of men’s hands, wood and stone: therefore they have destroyed them.* Holofernes, who despised the house of Israel in Judith 14:5, is the same Assyrian conceit that counts Yahuah among the burned idols of conquered nations.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt14_lookup sv, _session253_jdt14_lookup tv
 WHERE t.slug='judith-14-no-gods-deliver'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=14 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=19 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Kings 19:19 — *Now therefore, O Yahuah (LORD) our Elohim (God), I beseech thee, save thou us out of his hand, that all the kingdoms of the earth may know that thou art Yahuah Elohim (the LORD God), even thou only.* The deliverance from the tyrant who despised Israel in Judith 14:5 vindicates Hezekiah''s plea that Yahuah alone be known God over all the kingdoms of earth.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt14_lookup sv, _session253_jdt14_lookup tv
 WHERE t.slug='judith-14-no-gods-deliver'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=14 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=19 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Kings 19:21 — *This is the word that Yahuah (LORD) hath spoken concerning him; The virgin the daughter of Zion hath despised thee, and laughed thee to scorn; the daughter of Jerusalem hath shaken her head at thee.* The one who sent Achior to his death for despising Israel in Judith 14:5 is himself scorned, as Zion''s daughter laughs the Assyrian boaster to scorn.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt14_lookup sv, _session253_jdt14_lookup tv
 WHERE t.slug='judith-14-no-gods-deliver'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=14 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=19 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

