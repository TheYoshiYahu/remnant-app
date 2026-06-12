-- ----- fragment: minion_ecclesiasticus_49.sql (session253 ecclesiasticus 49) -----
-- Source anchor: apocrypha/ecclesiasticus ch49. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: sir49 (view _session253_sir49_lookup). Sort band base 59500, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_sir49_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: sirach-49-josiah-passover-whole-heart
  ('apocrypha', 'ecclesiasticus', 49, 1, 'canon', '2-chronicles', 35, 1, 'free', E'2 Chronicles 35:1 — *Moreover Josiah kept a passover unto Yahuah (LORD) in Jerusalem: and they killed the passover on the fourteenth day of the first month.* The sweet remembrance Sirach 49:1 sings is the passover Josiah restored on its appointed day.'),
  ('apocrypha', 'ecclesiasticus', 49, 2, 'canon', '2-kings', 23, 21, 'free', E'2 Kings 23:21 — *And the king commanded all the people, saying, Keep the passover unto Yahuah Elohaychem (the LORD your God), as it is written in the book of this covenant.* Josiah''s taking away the abominations of iniquity in Sirach 49:2 is his command to keep the covenant-feast as it is written.'),
  ('apocrypha', 'ecclesiasticus', 49, 3, 'canon', '2-kings', 23, 25, 'free', E'2 Kings 23:25 — *And like unto him was there no king before him, that turned to Yahuah (LORD) with all his heart, and with all his soul, and with all his might, according to all the law of Moses; neither after him arose there any like him.* Sirach 49:3''s king who directed his heart to Yahuah is the one who turned with all his heart according to all the law of Moses.'),
  -- thread: sirach-49-jeremiah-sanctified-in-the-womb
  ('apocrypha', 'ecclesiasticus', 49, 7, 'canon', 'jeremiah', 1, 5, 'free', E'Jeremiah 1:5 — *Before I formed thee in the belly I knew thee; and before thou camest forth out of the womb I sanctified thee, and I ordained thee a prophet unto the nations.* Sirach 49:7''s prophet sanctified in his mother''s womb is Jeremiah, known and set apart before birth.'),
  ('apocrypha', 'ecclesiasticus', 49, 7, 'canon', 'jeremiah', 1, 10, 'free', E'Jeremiah 1:10 — *See, I have this day set thee over the nations and over the kingdoms, to root out, and to pull down, and to destroy, and to throw down, to build, and to plant.* Sirach 49:7''s charge to root out, afflict, destroy, build and plant is Jeremiah''s own commission quoted almost exactly.'),
  ('apocrypha', 'ecclesiasticus', 49, 6, 'canon', 'jeremiah', 1, 2, 'free', E'Jeremiah 1:2 — *To whom the word of Yahuah (LORD) came in the days of Josiah the son of Amon king of Yahudah (Judah), in the thirteenth year of his reign.* The prophet by whose word Sirach 49:6 says the city was burnt began to prophesy under Josiah, binding this thread to the praise of Josiah just before.'),
  -- thread: sirach-49-ezekiel-glory-chariot-cherubim
  ('apocrypha', 'ecclesiasticus', 49, 8, 'canon', 'ezekiel', 1, 4, 'free', E'Ezekiel 1:4 — *And I looked, and, behold, a whirlwind came out of the north, a great cloud, and a fire infolding itself, and a brightness was about it, and out of the midst thereof as the colour of amber, out of the midst of the fire.* This is the opening of the glorious vision Sirach 49:8 says Ezekiel saw.'),
  ('apocrypha', 'ecclesiasticus', 49, 8, 'canon', 'ezekiel', 1, 16, 'free', E'Ezekiel 1:16 — *The appearance of the wheels and their work was like unto the colour of a beryl: and they four had one likeness: and their appearance and their work was as it were a wheel in the middle of a wheel.* The chariot of the cherubim in Sirach 49:8 is this wheel within a wheel beneath the living creatures.'),
  ('apocrypha', 'ecclesiasticus', 49, 8, 'canon', 'ezekiel', 1, 28, 'free', E'Ezekiel 1:28 — *As the appearance of the bow that is in the cloud in the day of rain, so was the appearance of the brightness round about. This was the appearance of the likeness of the glory of Yahuah (LORD). And when I saw it, I fell upon my face, and I heard a voice of one that spake.* The glorious vision Ezekiel saw in Sirach 49:8 is the very likeness of the glory of Yahuah enthroned above the chariot.'),
  -- thread: sirach-49-twelve-prophets-comforted-jacob
  ('apocrypha', 'ecclesiasticus', 49, 10, 'canon', 'hosea', 1, 1, 'free', E'Hosea 1:1 — *The word of Yahuah (LORD) that came unto Hosea, the son of Beeri, in the days of Uzziah, Jotham, Ahaz, and Hezekiah, kings of Yahudah (Judah), and in the days of Jeroboam the son of Joash, king of Yashar''el (Israel).* Hosea heads the twelve prophets Sirach 49:10 blesses, the first of the company sent to comfort and regather scattered Jacob.'),
  ('apocrypha', 'ecclesiasticus', 49, 10, 'canon', 'zechariah', 1, 3, 'free', E'Zechariah 1:3 — *Therefore say thou unto them, Thus saith Yahuah Tseva''ot (LORD of hosts); Turn ye unto me, saith Yahuah Tseva''ot (LORD of hosts), and I will turn unto you, saith Yahuah Tseva''ot (LORD of hosts).* The twelve who comforted Jacob in Sirach 49:10 spoke this turning-and-return that is the heart of the gathering.'),
  ('apocrypha', 'ecclesiasticus', 49, 10, 'canon', 'zechariah', 1, 17, 'free', E'Zechariah 1:17 — *Cry yet, saying, Thus saith Yahuah Tseva''ot (LORD of hosts); My cities through prosperity shall yet be spread abroad; and Yahuah (LORD) shall yet comfort Zion, and shall yet choose Jerusalem.* The assured hope by which the twelve delivered Jacob in Sirach 49:10 is this promise that Yahuah will yet comfort Zion and choose Jerusalem.'),
  -- thread: sirach-49-builders-zerubbabel-jeshua-nehemiah
  ('apocrypha', 'ecclesiasticus', 49, 11, 'canon', 'haggai', 2, 23, 'free', E'Haggai 2:23 — *In that day, saith Yahuah Tseva''ot (LORD of hosts), will I take thee, O Zerubbabel, my servant, the son of Shealtiel, saith Yahuah (LORD), and will make thee as a signet: for I have chosen thee, saith Yahuah Tseva''ot (LORD of hosts).* Sirach 49:11''s Zerubbabel "as a signet on the right hand" quotes Yahuah''s own word making him a signet.'),
  ('apocrypha', 'ecclesiasticus', 49, 12, 'canon', 'zechariah', 4, 9, 'free', E'Zechariah 4:9 — *The hands of Zerubbabel have laid the foundation of this house; his hands shall also finish it; and thou shalt know that Yahuah Tseva''ot (LORD of hosts) hath sent me unto you.* The house builded in Sirach 49:12 by Zerubbabel and Jeshua is this temple whose foundation and finishing Zechariah foretold.'),
  ('apocrypha', 'ecclesiasticus', 49, 12, 'canon', 'ezra', 3, 8, 'free', E'Ezra 3:8 — *Now in the second year of their coming unto the house of Elohim (God) at Jerusalem, in the second month, began Zerubbabel the son of Shealtiel, and Jeshua the son of Jozadak, and the remnant of their brethren the priests and the Levites, and all they that were come out of the captivity unto Jerusalem; and appointed the Levites, from twenty years old and upward, to set forward the work of the house of Yahuah (LORD).* The "Jesus the son of Josedec" of Sirach 49:12 is Jeshua son of Jozadak the high priest here — not the Messiah — who with Zerubbabel began the house.'),
  ('apocrypha', 'ecclesiasticus', 49, 13, 'canon', 'nehemiah', 2, 17, 'free', E'Nehemiah 2:17 — *Then said I unto them, Ye see the distress that we are in, how Jerusalem lieth waste, and the gates thereof are burned with fire: come, and let us build up the wall of Jerusalem, that we be no more a reproach.* Nehemiah, who in Sirach 49:13 raised up the fallen walls and set up the gates, calls Israel to rebuild Jerusalem''s wall and gates.'),
  -- thread: sirach-49-enoch-translated-from-the-earth
  ('apocrypha', 'ecclesiasticus', 49, 14, 'canon', 'genesis', 5, 24, 'free', E'Genesis 5:24 — *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him.* This is the taking from the earth Sirach 49:14 says no other man was like.'),
  ('apocrypha', 'ecclesiasticus', 49, 14, 'enoch', '1-enoch', 71, 5, 'extras', E'1 Enoch 71:5 — *And he translated my spirit into the heaven of heavens, And I saw there a structure built of crystals, And between those crystals tongues of living fire.* Enoch''s own book unfolds the translation Sirach 49:14 remembers, his spirit carried up to the heaven of heavens.'),
  ('apocrypha', 'ecclesiasticus', 49, 14, 'jubilees', 'jubilees', 4, 23, 'extras', E'Jubilees 4:23 — *And he was taken from amongst the children of men, and we conducted him into the Garden of Eden in majesty and honour, and behold there he writes down the condemnation and judgment of the world, and all the wickedness of the children of men.* Jubilees tells where Enoch went when, as Sirach 49:14 says, he was taken from the earth — into Eden in majesty and honour.'),
  -- thread: sirach-49-joseph-shem-seth-adam-the-seed
  ('apocrypha', 'ecclesiasticus', 49, 15, 'canon', 'genesis', 50, 25, 'free', E'Genesis 50:25 — *And Joseph took an oath of the children of Yashar''el (Israel), saying, Elohim (God) will surely visit you, and ye shall carry up my bones from hence.* Joseph''s bones were regarded of Yahuah in Sirach 49:15 because of this dying oath laid on Israel.'),
  ('apocrypha', 'ecclesiasticus', 49, 15, 'canon', 'exodus', 13, 19, 'free', E'Exodus 13:19 — *And Moses took the bones of Joseph with him: for he had straitly sworn the children of Yashar''el (Israel), saying, Elohim (God) will surely visit you; and ye shall carry up my bones away hence with you.* The bones Sirach 49:15 says were regarded of Yahuah were carried up at the Exodus exactly as Joseph had sworn.'),
  ('apocrypha', 'ecclesiasticus', 49, 15, 'jubilees', 'jubilees', 46, 5, 'extras', E'Jubilees 46:5 — *And he commanded the children of Yashar''el (Israel) before he died that they should carry his bones with them when they went forth from the land of Egypt.* Jubilees carries the same charge regarding Joseph''s bones that Sirach 49:15 honours.'),
  ('apocrypha', 'ecclesiasticus', 49, 16, 'canon', 'genesis', 4, 25, 'free', E'Genesis 4:25 — *And Adam knew his wife again; and she bare a son, and called his name Seth: For Elohim (God), said she, hath appointed me another seed instead of Abel, whom Cain slew.* Seth, honoured among men in Sirach 49:16, is the appointed seed through whom the line was kept.'),
  ('apocrypha', 'ecclesiasticus', 49, 16, 'jubilees', 'jubilees', 4, 29, 'extras', E'Jubilees 4:29 — *And at the close of the nineteenth jubilee, in the seventh week in the sixth year thereof, Adam died, and all his sons buried him in the land of his creation, and he was the first to be buried in the earth.* Adam, set above every living thing in creation in Sirach 49:16, is here the first father of all, buried in the land of his own creation.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_sir49_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_sir49_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-49-josiah-passover-whole-heart',
       E'Josiah — who kept the passover and turned with all his heart',
       E'Ben Sira crowns the praise of the fathers with the last good king: *The remembrance of Josias is like the composition of the perfume that is made by the art of the apothecary: it is sweet as honey in all mouths, and as musick at a banquet of wine* (Sirach 49:1), for *He behaved himself uprightly in the conversion of the people, and took away the abominations of iniquity* (Sirach 49:2) and *He directed his heart to Yahuah (God), and in the time of the ungodly he established the worship of Yahuah (God)* (Sirach 49:3). The Tanakh tells the same story: the king who *commanded all the people, saying, Keep the passover unto Yahuah Elohaychem (the LORD your God), as it is written in the book of this covenant* (2 Kings 23:21), of whom it is written *And like unto him was there no king before him, that turned to Yahuah (LORD) with all his heart, and with all his soul, and with all his might, according to all the law of Moses; neither after him arose there any like him* (2 Kings 23:25). The Chronicler records the feast itself: *Moreover Josiah kept a passover unto Yahuah (LORD) in Jerusalem: and they killed the passover on the fourteenth day of the first month* (2 Chronicles 35:1). Torah stands, the feast is kept, and a heart turned wholly to Yahuah is the sweetest memorial of all.',
       sv.verse_id, ev.verse_id, 'extras', 59500
  FROM _session253_sir49_lookup sv, _session253_sir49_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=49 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=49 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-49-jeremiah-sanctified-in-the-womb',
       E'Jeremiah — sanctified in his mother''s womb to root out and to plant',
       E'Of the prophet who saw the holy city burn, Ben Sira writes: *They burnt the chosen city of the sanctuary, and made the streets desolate, according to the prophecy of Jeremias* (Sirach 49:6), *For they entreated him evil, who nevertheless was a prophet, sanctified in his mother''s womb, that he might root out, and afflict, and destroy; and that he might build up also, and plant* (Sirach 49:7). This is no embellishment — it is Jeremiah''s own commissioning, word for word in substance: *Before I formed thee in the belly I knew thee; and before thou camest forth out of the womb I sanctified thee, and I ordained thee a prophet unto the nations* (Jeremiah 1:5), and the very fourfold charge Sirach echoes: *See, I have this day set thee over the nations and over the kingdoms, to root out, and to pull down, and to destroy, and to throw down, to build, and to plant* (Jeremiah 1:10). The deuterocanon carries the same prophetic witness it received from the Tanakh.',
       sv.verse_id, ev.verse_id, 'extras', 59503
  FROM _session253_sir49_lookup sv, _session253_sir49_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=49 AND sv.verse_number=6
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=49 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-49-ezekiel-glory-chariot-cherubim',
       E'Ezekiel — who saw the glory upon the chariot of the cherubim',
       E'*It was Ezekiel who saw the glorious vision, which was shewed him upon the chariot of the cherubims* (Sirach 49:8). Ben Sira points straight to the opening of Ezekiel''s book — the whirlwind, the living creatures, and the wheel within the wheel: *And I looked, and, behold, a whirlwind came out of the north, a great cloud, and a fire infolding itself, and a brightness was about it, and out of the midst thereof as the colour of amber, out of the midst of the fire* (Ezekiel 1:4); the four-faced living creatures whose *appearance and their work was as it were a wheel in the middle of a wheel* (Ezekiel 1:16); and over it all the throne and the glory: *As the appearance of the bow that is in the cloud in the day of rain, so was the appearance of the brightness round about. This was the appearance of the likeness of the glory of Yahuah (LORD). And when I saw it, I fell upon my face, and I heard a voice of one that spake* (Ezekiel 1:28). The glory upon the cherubim that the prophet beheld is the same glory the apocrypha remembers.',
       sv.verse_id, ev.verse_id, 'extras', 59506
  FROM _session253_sir49_lookup sv, _session253_sir49_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=49 AND sv.verse_number=8
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=49 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-49-twelve-prophets-comforted-jacob',
       E'The twelve prophets — whose bones flourish, who comforted Jacob',
       E'*And of the twelve prophets let the memorial be blessed, and let their bones flourish again out of their place: for they comforted Jacob, and delivered them by assured hope* (Sirach 49:10). The minor prophets are remembered as one company whose word is comfort and whose hope is resurrection. Their books open exactly so: *The word of Yahuah (LORD) that came unto Hosea, the son of Beeri, in the days of Uzziah, Jotham, Ahaz, and Hezekiah, kings of Yahudah (Judah), and in the days of Jeroboam the son of Joash, king of Yashar''el (Israel)* (Hosea 1:1) — the prophet sent to a scattered house; and Zechariah''s first word is the turning that comforts Jacob: *Therefore say thou unto them, Thus saith Yahuah Tseva''ot (LORD of hosts); Turn ye unto me, saith Yahuah Tseva''ot (LORD of hosts), and I will turn unto you, saith Yahuah Tseva''ot (LORD of hosts)* (Zechariah 1:3), with the promise *and Yahuah (LORD) shall yet comfort Zion, and shall yet choose Jerusalem* (Zechariah 1:17). The comfort of Jacob and the flourishing of dead bones is the gathering hope — never a church supplanting Israel, but Jacob restored.',
       sv.verse_id, ev.verse_id, 'extras', 59509
  FROM _session253_sir49_lookup sv, _session253_sir49_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=49 AND sv.verse_number=10
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=49 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-49-builders-zerubbabel-jeshua-nehemiah',
       E'The builders — Zerubbabel the signet, Jeshua the high priest, Nehemiah of the walls',
       E'After exile, Ben Sira honours those who rebuilt: *How shall we magnify Zorobabel? even he was as a signet on the right hand* (Sirach 49:11); *So was Jesus the son of Josedec: who in their time builded the house, and set up an holy temple to Yahuah (God), which was prepared for everlasting glory* (Sirach 49:12) — and this *Jesus the son of Josedec* is Jeshua the high priest, NOT the Messiah; *And among the elect was Neemias, whose renown is great, who raised up for us the walls that were fallen, and set up the gates and the bars, and raised up our ruins again* (Sirach 49:13). The Tanakh names each: Zerubbabel the signet — *In that day, saith Yahuah Tseva''ot (LORD of hosts), will I take thee, O Zerubbabel, my servant, the son of Shealtiel, saith Yahuah (LORD), and will make thee as a signet: for I have chosen thee, saith Yahuah Tseva''ot (LORD of hosts)* (Haggai 2:23), who laid and finished the house — *The hands of Zerubbabel have laid the foundation of this house; his hands shall also finish it; and thou shalt know that Yahuah Tseva''ot (LORD of hosts) hath sent me unto you* (Zechariah 4:9); Jeshua at his side — *Now in the second year of their coming unto the house of Elohim (God) at Jerusalem... began Zerubbabel the son of Shealtiel, and Jeshua the son of Jozadak, and the remnant of their brethren the priests and the Levites* (Ezra 3:8); and Nehemiah of the walls — *Then said I unto them, Ye see the distress that we are in, how Jerusalem lieth waste, and the gates thereof are burned with fire: come, and let us build up the wall of Jerusalem, that we be no more a reproach* (Nehemiah 2:17).',
       sv.verse_id, ev.verse_id, 'extras', 59512
  FROM _session253_sir49_lookup sv, _session253_sir49_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=49 AND sv.verse_number=11
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=49 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-49-enoch-translated-from-the-earth',
       E'Enoch — than whom no man on earth was created like, taken from the earth',
       E'Ben Sira reaches back past the prophets to the first fathers: *But upon the earth was no man created like Enoch; for he was taken from the earth* (Sirach 49:14). Genesis says it in a breath: *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him* (Genesis 5:24). The now-restored books unfold the same translation: in his own vision Enoch testifies, *And he translated my spirit into the heaven of heavens, And I saw there a structure built of crystals, And between those crystals tongues of living fire* (1 Enoch 71:5), where *there I saw the first fathers and the righteous who from the beginning of the world Dwell in that place* (1 Enoch 71:7); and Jubilees records, *And he was taken from amongst the children of men, and we conducted him into the Garden of Eden in majesty and honour, and behold there he writes down the condemnation and judgment of the world, and all the wickedness of the children of men* (Jubilees 4:23). The one taken from the earth is no new idea — the whole library bears the same witness.',
       sv.verse_id, ev.verse_id, 'extras', 59515
  FROM _session253_sir49_lookup sv, _session253_sir49_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=49 AND sv.verse_number=14
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=49 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-49-joseph-shem-seth-adam-the-seed',
       E'Joseph''s bones — and Shem, Seth, Adam, the honoured seed-line',
       E'The praise of the fathers closes where the seed-line began: *Neither was there a young man born like Joseph, a governor of his brothers, a stay of the people, whose bones were regarded of Yahuah (God)* (Sirach 49:15), and *Sem and Seth were in great honour among men, and so was Adam above every living thing in creation* (Sirach 49:16). Joseph''s bones were regarded because he bound Israel by oath: *And Joseph took an oath of the children of Yashar''el (Israel), saying, Elohim (God) will surely visit you, and ye shall carry up my bones from hence* (Genesis 50:25) — an oath kept at the Exodus: *And Moses took the bones of Joseph with him: for he had straitly sworn the children of Yashar''el (Israel), saying, Elohim (God) will surely visit you; and ye shall carry up my bones away hence with you* (Exodus 13:19); and Jubilees preserves the same charge: *And he commanded the children of Yashar''el (Israel) before he died that they should carry his bones with them when they went forth from the land of Egypt* (Jubilees 46:5). And the seed-line Sirach honours runs back through Seth: *And Adam knew his wife again; and she bare a son, and called his name Seth: For Elohim (God), said she, hath appointed me another seed instead of Abel, whom Cain slew* (Genesis 4:25) — Adam, above every living thing in creation, the first father of them all (Jubilees 4:29).',
       sv.verse_id, ev.verse_id, 'extras', 59518
  FROM _session253_sir49_lookup sv, _session253_sir49_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=49 AND sv.verse_number=15
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=49 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: sirach-49-josiah-passover-whole-heart
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Chronicles 35:1 — *Moreover Josiah kept a passover unto Yahuah (LORD) in Jerusalem: and they killed the passover on the fourteenth day of the first month.* The sweet remembrance Sirach 49:1 sings is the passover Josiah restored on its appointed day.'
  FROM cross_reference_threads t, cross_references x, _session253_sir49_lookup sv, _session253_sir49_lookup tv
 WHERE t.slug='sirach-49-josiah-passover-whole-heart'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=49 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=35 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Kings 23:21 — *And the king commanded all the people, saying, Keep the passover unto Yahuah Elohaychem (the LORD your God), as it is written in the book of this covenant.* Josiah''s taking away the abominations of iniquity in Sirach 49:2 is his command to keep the covenant-feast as it is written.'
  FROM cross_reference_threads t, cross_references x, _session253_sir49_lookup sv, _session253_sir49_lookup tv
 WHERE t.slug='sirach-49-josiah-passover-whole-heart'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=49 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=23 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Kings 23:25 — *And like unto him was there no king before him, that turned to Yahuah (LORD) with all his heart, and with all his soul, and with all his might, according to all the law of Moses; neither after him arose there any like him.* Sirach 49:3''s king who directed his heart to Yahuah is the one who turned with all his heart according to all the law of Moses.'
  FROM cross_reference_threads t, cross_references x, _session253_sir49_lookup sv, _session253_sir49_lookup tv
 WHERE t.slug='sirach-49-josiah-passover-whole-heart'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=49 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=23 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-49-jeremiah-sanctified-in-the-womb
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 1:5 — *Before I formed thee in the belly I knew thee; and before thou camest forth out of the womb I sanctified thee, and I ordained thee a prophet unto the nations.* Sirach 49:7''s prophet sanctified in his mother''s womb is Jeremiah, known and set apart before birth.'
  FROM cross_reference_threads t, cross_references x, _session253_sir49_lookup sv, _session253_sir49_lookup tv
 WHERE t.slug='sirach-49-jeremiah-sanctified-in-the-womb'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=49 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=1 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 1:10 — *See, I have this day set thee over the nations and over the kingdoms, to root out, and to pull down, and to destroy, and to throw down, to build, and to plant.* Sirach 49:7''s charge to root out, afflict, destroy, build and plant is Jeremiah''s own commission quoted almost exactly.'
  FROM cross_reference_threads t, cross_references x, _session253_sir49_lookup sv, _session253_sir49_lookup tv
 WHERE t.slug='sirach-49-jeremiah-sanctified-in-the-womb'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=49 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=1 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 1:2 — *To whom the word of Yahuah (LORD) came in the days of Josiah the son of Amon king of Yahudah (Judah), in the thirteenth year of his reign.* The prophet by whose word Sirach 49:6 says the city was burnt began to prophesy under Josiah, binding this thread to the praise of Josiah just before.'
  FROM cross_reference_threads t, cross_references x, _session253_sir49_lookup sv, _session253_sir49_lookup tv
 WHERE t.slug='sirach-49-jeremiah-sanctified-in-the-womb'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=49 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=1 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-49-ezekiel-glory-chariot-cherubim
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 1:4 — *And I looked, and, behold, a whirlwind came out of the north, a great cloud, and a fire infolding itself, and a brightness was about it, and out of the midst thereof as the colour of amber, out of the midst of the fire.* This is the opening of the glorious vision Sirach 49:8 says Ezekiel saw.'
  FROM cross_reference_threads t, cross_references x, _session253_sir49_lookup sv, _session253_sir49_lookup tv
 WHERE t.slug='sirach-49-ezekiel-glory-chariot-cherubim'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=49 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=1 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 1:16 — *The appearance of the wheels and their work was like unto the colour of a beryl: and they four had one likeness: and their appearance and their work was as it were a wheel in the middle of a wheel.* The chariot of the cherubim in Sirach 49:8 is this wheel within a wheel beneath the living creatures.'
  FROM cross_reference_threads t, cross_references x, _session253_sir49_lookup sv, _session253_sir49_lookup tv
 WHERE t.slug='sirach-49-ezekiel-glory-chariot-cherubim'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=49 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=1 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 1:28 — *As the appearance of the bow that is in the cloud in the day of rain, so was the appearance of the brightness round about. This was the appearance of the likeness of the glory of Yahuah (LORD). And when I saw it, I fell upon my face, and I heard a voice of one that spake.* The glorious vision Ezekiel saw in Sirach 49:8 is the very likeness of the glory of Yahuah enthroned above the chariot.'
  FROM cross_reference_threads t, cross_references x, _session253_sir49_lookup sv, _session253_sir49_lookup tv
 WHERE t.slug='sirach-49-ezekiel-glory-chariot-cherubim'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=49 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=1 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-49-twelve-prophets-comforted-jacob
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hosea 1:1 — *The word of Yahuah (LORD) that came unto Hosea, the son of Beeri, in the days of Uzziah, Jotham, Ahaz, and Hezekiah, kings of Yahudah (Judah), and in the days of Jeroboam the son of Joash, king of Yashar''el (Israel).* Hosea heads the twelve prophets Sirach 49:10 blesses, the first of the company sent to comfort and regather scattered Jacob.'
  FROM cross_reference_threads t, cross_references x, _session253_sir49_lookup sv, _session253_sir49_lookup tv
 WHERE t.slug='sirach-49-twelve-prophets-comforted-jacob'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=49 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Zechariah 1:3 — *Therefore say thou unto them, Thus saith Yahuah Tseva''ot (LORD of hosts); Turn ye unto me, saith Yahuah Tseva''ot (LORD of hosts), and I will turn unto you, saith Yahuah Tseva''ot (LORD of hosts).* The twelve who comforted Jacob in Sirach 49:10 spoke this turning-and-return that is the heart of the gathering.'
  FROM cross_reference_threads t, cross_references x, _session253_sir49_lookup sv, _session253_sir49_lookup tv
 WHERE t.slug='sirach-49-twelve-prophets-comforted-jacob'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=49 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Zechariah 1:17 — *Cry yet, saying, Thus saith Yahuah Tseva''ot (LORD of hosts); My cities through prosperity shall yet be spread abroad; and Yahuah (LORD) shall yet comfort Zion, and shall yet choose Jerusalem.* The assured hope by which the twelve delivered Jacob in Sirach 49:10 is this promise that Yahuah will yet comfort Zion and choose Jerusalem.'
  FROM cross_reference_threads t, cross_references x, _session253_sir49_lookup sv, _session253_sir49_lookup tv
 WHERE t.slug='sirach-49-twelve-prophets-comforted-jacob'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=49 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=1 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-49-builders-zerubbabel-jeshua-nehemiah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Haggai 2:23 — *In that day, saith Yahuah Tseva''ot (LORD of hosts), will I take thee, O Zerubbabel, my servant, the son of Shealtiel, saith Yahuah (LORD), and will make thee as a signet: for I have chosen thee, saith Yahuah Tseva''ot (LORD of hosts).* Sirach 49:11''s Zerubbabel "as a signet on the right hand" quotes Yahuah''s own word making him a signet.'
  FROM cross_reference_threads t, cross_references x, _session253_sir49_lookup sv, _session253_sir49_lookup tv
 WHERE t.slug='sirach-49-builders-zerubbabel-jeshua-nehemiah'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=49 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='haggai' AND tv.chapter_number=2 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Zechariah 4:9 — *The hands of Zerubbabel have laid the foundation of this house; his hands shall also finish it; and thou shalt know that Yahuah Tseva''ot (LORD of hosts) hath sent me unto you.* The house builded in Sirach 49:12 by Zerubbabel and Jeshua is this temple whose foundation and finishing Zechariah foretold.'
  FROM cross_reference_threads t, cross_references x, _session253_sir49_lookup sv, _session253_sir49_lookup tv
 WHERE t.slug='sirach-49-builders-zerubbabel-jeshua-nehemiah'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=49 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=4 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezra 3:8 — *Now in the second year of their coming unto the house of Elohim (God) at Jerusalem, in the second month, began Zerubbabel the son of Shealtiel, and Jeshua the son of Jozadak, and the remnant of their brethren the priests and the Levites, and all they that were come out of the captivity unto Jerusalem; and appointed the Levites, from twenty years old and upward, to set forward the work of the house of Yahuah (LORD).* The "Jesus the son of Josedec" of Sirach 49:12 is Jeshua son of Jozadak the high priest here — not the Messiah — who with Zerubbabel began the house.'
  FROM cross_reference_threads t, cross_references x, _session253_sir49_lookup sv, _session253_sir49_lookup tv
 WHERE t.slug='sirach-49-builders-zerubbabel-jeshua-nehemiah'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=49 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Nehemiah 2:17 — *Then said I unto them, Ye see the distress that we are in, how Jerusalem lieth waste, and the gates thereof are burned with fire: come, and let us build up the wall of Jerusalem, that we be no more a reproach.* Nehemiah, who in Sirach 49:13 raised up the fallen walls and set up the gates, calls Israel to rebuild Jerusalem''s wall and gates.'
  FROM cross_reference_threads t, cross_references x, _session253_sir49_lookup sv, _session253_sir49_lookup tv
 WHERE t.slug='sirach-49-builders-zerubbabel-jeshua-nehemiah'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=49 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=2 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-49-enoch-translated-from-the-earth
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 5:24 — *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him.* This is the taking from the earth Sirach 49:14 says no other man was like.'
  FROM cross_reference_threads t, cross_references x, _session253_sir49_lookup sv, _session253_sir49_lookup tv
 WHERE t.slug='sirach-49-enoch-translated-from-the-earth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=49 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 71:5 — *And he translated my spirit into the heaven of heavens, And I saw there a structure built of crystals, And between those crystals tongues of living fire.* Enoch''s own book unfolds the translation Sirach 49:14 remembers, his spirit carried up to the heaven of heavens.'
  FROM cross_reference_threads t, cross_references x, _session253_sir49_lookup sv, _session253_sir49_lookup tv
 WHERE t.slug='sirach-49-enoch-translated-from-the-earth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=49 AND sv.verse_number=14
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=71 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 4:23 — *And he was taken from amongst the children of men, and we conducted him into the Garden of Eden in majesty and honour, and behold there he writes down the condemnation and judgment of the world, and all the wickedness of the children of men.* Jubilees tells where Enoch went when, as Sirach 49:14 says, he was taken from the earth — into Eden in majesty and honour.'
  FROM cross_reference_threads t, cross_references x, _session253_sir49_lookup sv, _session253_sir49_lookup tv
 WHERE t.slug='sirach-49-enoch-translated-from-the-earth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=49 AND sv.verse_number=14
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-49-joseph-shem-seth-adam-the-seed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 50:25 — *And Joseph took an oath of the children of Yashar''el (Israel), saying, Elohim (God) will surely visit you, and ye shall carry up my bones from hence.* Joseph''s bones were regarded of Yahuah in Sirach 49:15 because of this dying oath laid on Israel.'
  FROM cross_reference_threads t, cross_references x, _session253_sir49_lookup sv, _session253_sir49_lookup tv
 WHERE t.slug='sirach-49-joseph-shem-seth-adam-the-seed'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=49 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=50 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 13:19 — *And Moses took the bones of Joseph with him: for he had straitly sworn the children of Yashar''el (Israel), saying, Elohim (God) will surely visit you; and ye shall carry up my bones away hence with you.* The bones Sirach 49:15 says were regarded of Yahuah were carried up at the Exodus exactly as Joseph had sworn.'
  FROM cross_reference_threads t, cross_references x, _session253_sir49_lookup sv, _session253_sir49_lookup tv
 WHERE t.slug='sirach-49-joseph-shem-seth-adam-the-seed'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=49 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=13 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 46:5 — *And he commanded the children of Yashar''el (Israel) before he died that they should carry his bones with them when they went forth from the land of Egypt.* Jubilees carries the same charge regarding Joseph''s bones that Sirach 49:15 honours.'
  FROM cross_reference_threads t, cross_references x, _session253_sir49_lookup sv, _session253_sir49_lookup tv
 WHERE t.slug='sirach-49-joseph-shem-seth-adam-the-seed'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=49 AND sv.verse_number=15
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=46 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 4:25 — *And Adam knew his wife again; and she bare a son, and called his name Seth: For Elohim (God), said she, hath appointed me another seed instead of Abel, whom Cain slew.* Seth, honoured among men in Sirach 49:16, is the appointed seed through whom the line was kept.'
  FROM cross_reference_threads t, cross_references x, _session253_sir49_lookup sv, _session253_sir49_lookup tv
 WHERE t.slug='sirach-49-joseph-shem-seth-adam-the-seed'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=49 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 4:29 — *And at the close of the nineteenth jubilee, in the seventh week in the sixth year thereof, Adam died, and all his sons buried him in the land of his creation, and he was the first to be buried in the earth.* Adam, set above every living thing in creation in Sirach 49:16, is here the first father of all, buried in the land of his own creation.'
  FROM cross_reference_threads t, cross_references x, _session253_sir49_lookup sv, _session253_sir49_lookup tv
 WHERE t.slug='sirach-49-joseph-shem-seth-adam-the-seed'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=49 AND sv.verse_number=16
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

