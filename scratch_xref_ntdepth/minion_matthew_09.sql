-- ----- fragment: minion_matthew_09.sql (S260 Matthew depth) -----
-- ============================================================================
-- Matthew 9 — full-library cross-reference threads (NT DEPTH pass)
-- 6 threads. Band 11240+, step +3. Temp-view tag _mt09_lookup.
-- ============================================================================

-- ── 3a. Temp view ──────────────────────────────────────────────────────────
CREATE TEMP VIEW _mt09_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1',
   'pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ── 3b. cross_references rows ──────────────────────────────────────────────
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- Thread 1: thy sins be forgiven / Son of Adam hath power to forgive (9:2,6)
  ('canon','matthew',9,2,'canon','isaiah',43,25, 'free', E'*I, even I, am he that blotteth out thy transgressions for mine own sake, and will not remember thy sins* (Isaiah 43:25). The blotting-out of sin is Yahuah''s own prerogative — and it is exactly this the Formed Son does to the man on the bed.'),
  ('canon','matthew',9,2,'canon','psalms',103,3, 'free', E'*Who forgiveth all thine iniquities; who healeth all thy diseases* (Psalm 103:3). Forgiving and healing stand side by side — so when Yahusha forgives, then bids him rise, he does the one to show the other.'),
  ('canon','matthew',9,6,'canon','exodus',34,6, 'free', E'*Yahuah (LORD), Yahuah Elohim (The LORD God), merciful and gracious, longsuffering, and abundant in goodness and truth* (Exodus 34:6). The Name proclaimed to Moses is the Name made present in the Son.'),
  ('canon','matthew',9,6,'canon','exodus',34,7, 'free', E'*Keeping mercy for thousands, forgiving iniquity and transgression and sin* (Exodus 34:7). The Father who forgives iniquity forgives it here, on earth, through the Formed Son.'),
  ('canon','matthew',9,2,'canon','micah',7,18, 'free', E'*Who is a Elohim (God) like unto thee, that pardoneth iniquity... because he delighteth in mercy* (Micah 7:18).'),
  ('canon','matthew',9,6,'canon','micah',7,19, 'free', E'*he will subdue our iniquities; and thou wilt cast all their sins into the depths of the sea* (Micah 7:19).'),
  ('canon','matthew',9,6,'canon','mark',2,10, 'free', E'*But that ye may know that the Son of Adam hath power on earth to forgive sins* (Mark 2:10) — the same word in the parallel Gospel.'),

  -- Thread 2: call of Matthew / mercy not sacrifice / physician to the sick (9:9-13)
  ('canon','matthew',9,13,'canon','hosea',6,6, 'free', E'*For I desired mercy, and not sacrifice; and the knowledge of Elohim (God) more than burnt offerings* (Hosea 6:6) — the very verse Yahusha sends the scribes to go and learn.'),
  ('canon','matthew',9,13,'canon','1-samuel',15,22, 'free', E'*to obey is better than sacrifice, and to hearken than the fat of rams* (1 Samuel 15:22).'),
  ('canon','matthew',9,13,'canon','proverbs',21,3, 'free', E'*To do justice and judgment is more acceptable to Yahuah (LORD) than sacrifice* (Proverbs 21:3).'),
  ('canon','matthew',9,12,'canon','psalms',51,17, 'free', E'*The sacrifices of Elohim (God) are a broken spirit: a broken and a contrite heart, O Elohim (God), thou wilt not despise* (Psalm 51:17) — the heart the Physician comes for.'),
  ('canon','matthew',9,12,'apocrypha','ecclesiasticus',38,1, 'extras', E'*Honour a physician with the honour due to him... for of the Most High comes healing* (Sirach 38:1-2). They that are sick need a physician — and the true Physician''s remedy is from the Most High.'),
  ('canon','matthew',9,13,'apocrypha','ecclesiasticus',35,1, 'extras', E'*He that keepeth the law brings offerings enough... To depart from wickedness is a thing pleasing to Yahuah* (Sirach 35:1-3) — mercy and obedience ARE the weightier sacrifice, not its abolition.'),

  -- Thread 3: fasting / the bridegroom / new wine new bottles (9:14-17)
  ('canon','matthew',9,15,'canon','joel',2,16, 'free', E'*let the bridegroom go forth of his chamber, and the bride out of her closet* (Joel 2:16) — the Bridegroom is present, so the children of the bridechamber cannot mourn.'),
  ('canon','matthew',9,15,'canon','isaiah',62,5, 'free', E'*as the bridegroom rejoiceth over the bride, so shall thy Elohim (God) rejoice over thee* (Isaiah 62:5).'),
  ('canon','matthew',9,16,'canon','ecclesiastes',3,1, 'free', E'*To every thing there is a season, and a time to every purpose under the heaven* (Ecclesiastes 3:1) — a time to fast and a time to feast; the Bridegroom''s presence sets the season.'),
  ('canon','matthew',9,17,'canon','jeremiah',31,31, 'free', E'*Behold, the days come... that I will make a new covenant with the house of Yashar''el (Israel), and with the house of Yahudah (Judah)* (Jeremiah 31:31) — the renewed covenant, with BOTH houses.'),
  ('canon','matthew',9,17,'canon','jeremiah',31,33, 'free', E'*I will put my law in their inward parts, and write it in their hearts* (Jeremiah 31:33). The new wine is the SAME Torah written deeper — renewal, not a different law.'),

  -- Thread 4: woman with the issue / the hem = the fringe / healing in his wings (9:18-26)
  ('canon','matthew',9,20,'canon','numbers',15,38, 'free', E'*make them fringes in the borders of their garments... a ribband of blue* (Numbers 15:38) — the hem she touched was the commanded tzitzit, the fringe of the Torah itself.'),
  ('canon','matthew',9,20,'canon','numbers',15,39, 'free', E'*that ye may look upon it, and remember all the commandments of Yahuah (LORD), and do them* (Numbers 15:39) — she grasped the very corner that calls Israel to remember and DO.'),
  ('canon','matthew',9,20,'canon','leviticus',15,25, 'free', E'*if a woman have an issue of her blood many days... she shall be unclean* (Leviticus 15:25) — her twelve-year uncleanness; yet at the touch the flow does not defile Him, He heals her.'),
  ('canon','matthew',9,22,'canon','malachi',4,2, 'free', E'*the Sun of righteousness arise with healing in his wings* (Malachi 4:2) — *wings* is kanaph, the same word as the corner/fringe of the garment: healing was in His wings.'),
  ('canon','matthew',9,25,'canon','2-kings',4,34, 'free', E'*he went up, and lay upon the child... and the flesh of the child waxed warm* (2 Kings 4:34) — as Elisha raised the Shunammite''s son, so the Master takes the maid by the hand and she arises.'),

  -- Thread 5: two blind men / thou Son of David (9:27-31)
  ('canon','matthew',9,27,'canon','isaiah',35,5, 'free', E'*Then the eyes of the blind shall be opened, and the ears of the deaf shall be unstopped* (Isaiah 35:5) — the messianic sign, done before their eyes.'),
  ('canon','matthew',9,30,'canon','isaiah',42,7, 'free', E'*To open the blind eyes, to bring out the prisoners from the prison* (Isaiah 42:7) — the work of the chosen Servant.'),
  ('canon','matthew',9,30,'canon','psalms',146,8, 'free', E'*Yahuah (LORD) openeth the eyes of the blind* (Psalm 146:8) — what Yahuah does, the Formed Son does, and the blind men call Him *Son of David*.'),
  ('canon','matthew',9,27,'canon','2-samuel',7,12, 'free', E'*I will set up thy seed after thee... and I will establish his kingdom* (2 Samuel 7:12) — the promise to David, whose Son they cry out to.'),

  -- Thread 6: the dumb healed / harvest plenteous, labourers few / sheep without a shepherd (9:32-38)
  ('canon','matthew',9,36,'canon','numbers',27,17, 'free', E'*that the congregation of Yahuah (LORD) be not as sheep which have no shepherd* (Numbers 27:17) — Moses'' own plea, now the compassion of the true Shepherd.'),
  ('canon','matthew',9,36,'canon','ezekiel',34,5, 'free', E'*And they were scattered, because there is no shepherd... they became meat to all the beasts of the field* (Ezekiel 34:5).'),
  ('canon','matthew',9,36,'canon','ezekiel',34,6, 'free', E'*My sheep wandered through all the mountains... my flock was scattered upon all the face of the earth, and none did search or seek after them* (Ezekiel 34:6) — the scattered two-house flock the Shepherd comes to gather.'),
  ('canon','matthew',9,37,'canon','isaiah',27,12, 'free', E'*ye shall be gathered one by one, O ye children of Yashar''el (Israel)* (Isaiah 27:12) — the harvest is the in-gathering of scattered Israel.'),
  ('canon','matthew',9,38,'canon','joel',3,13, 'free', E'*Put ye in the sickle, for the harvest is ripe* (Joel 3:13) — the labourers sent into the harvest.'),
  ('canon','matthew',9,36,'apocrypha','baruch-with-the-letter-of-jeremiah',5,5, 'extras', E'*Arise, O Jerusalem... behold your children gathered from the west to the east by the word of the Holy One* (Baruch 5:5) — the scattered flock brought home, the harvest named.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _mt09_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _mt09_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ── 3c. Threads ────────────────────────────────────────────────────────────
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-9-thy-sins-be-forgiven-son-of-adam-power-to-forgive-isaiah-43-exodus-34',
       E'Thy sins be forgiven — the Son of Adam hath power on earth to forgive (Isaiah 43; Exodus 34; Micah 7)',
       E'They bring a man sick of the palsy, and before He heals the body Yahusha speaks to the soul: *Son, be of good cheer; thy sins be forgiven thee*. The scribes are right that this is Elohim''s alone — *I, even I, am he that blotteth out thy transgressions for mine own sake, and will not remember thy sins* (Isaiah 43:25). It is Yahuah who *forgiveth all thine iniquities; who healeth all thy diseases* (Psalm 103:3) — both gifts in one hand. The Name proclaimed to Moses on the mountain is the Name now standing in the room: *Yahuah Elohim, merciful and gracious, longsuffering, and abundant in goodness and truth* (Exodus 34:6), *Keeping mercy for thousands, forgiving iniquity and transgression and sin* (Exodus 34:7). And Micah''s wonder is answered: *Who is a Elohim (God) like unto thee, that pardoneth iniquity... because he delighteth in mercy* (Micah 7:18); *he will subdue our iniquities; and thou wilt cast all their sins into the depths of the sea* (Micah 7:19). So when the Son says *the Son of Adam hath power on earth to forgive sins* (also Mark 2:10), He is not claiming a second godhead — He is the Formed Son in whom the one Father exercises His own prerogative, on earth, where men can see it. They rightly *glorified Elohim, which had given such power unto men*.',
       sv.verse_id, ev.verse_id, 'free', 11240
  FROM _mt09_lookup sv, _mt09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=9 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=9 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-9-i-will-have-mercy-and-not-sacrifice-hosea-6-the-physician-to-the-sick',
       E'I will have mercy and not sacrifice — the Physician to the sick (Hosea 6; 1 Samuel 15; Sirach 35, 38)',
       E'Yahusha calls Matthew from the tax-booth and sits to eat with publicans and sinners, and when the Pharisees murmur He answers twice. First the parable: *They that be whole need not a physician, but they that are sick* — and the library knows that Physician: *Honour a physician with the honour due to him... for of the Most High comes healing* (Sirach 38:1-2). The heart He comes for is the one already named in the Psalm: *The sacrifices of Elohim (God) are a broken spirit: a broken and a contrite heart, O Elohim (God), thou wilt not despise* (Psalm 51:17). Then the rebuke, and He sends them to school in their own Scriptures: *go ye and learn what that meaneth, I will have mercy, and not sacrifice* — quoting *For I desired mercy, and not sacrifice; and the knowledge of Elohim (God) more than burnt offerings* (Hosea 6:6). This is the weightier matter of the Torah, not its abolition: *to obey is better than sacrifice, and to hearken than the fat of rams* (1 Samuel 15:22); *To do justice and judgment is more acceptable to Yahuah (LORD) than sacrifice* (Proverbs 21:3). Ben Sira says the same with both hands: *He that keepeth the law brings offerings enough... To depart from wickedness is a thing pleasing to Yahuah* (Sirach 35:1-3). The altar still stands; mercy is what it was always FOR. *I am not come to call the righteous, but sinners to repentance.*',
       sv.verse_id, ev.verse_id, 'extras', 11243
  FROM _mt09_lookup sv, _mt09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=9 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=9 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-9-new-wine-into-new-bottles-the-bridegroom-jeremiah-31-renewed-covenant',
       E'New wine into new bottles — the Bridegroom and the renewed covenant (Joel 2; Isaiah 62; Jeremiah 31)',
       E'John''s disciples ask why Yahusha''s disciples do not fast, and He answers as a wedding: *Can the children of the bridechamber mourn, as long as the bridegroom is with them?* The Bridegroom is no new figure — *let the bridegroom go forth of his chamber, and the bride out of her closet* (Joel 2:16); *as the bridegroom rejoiceth over the bride, so shall thy Elohim (God) rejoice over thee* (Isaiah 62:5). There is *a season, and a time to every purpose under the heaven* (Ecclesiastes 3:1) — His presence sets the season, and the days will come when they fast again. Then the two parables of newness, the new cloth and the new wine: *they put new wine into new bottles, and both are preserved*. This is NOT a different law poured out against the old. It is the very covenant Jeremiah foretold: *Behold, the days come... that I will make a new covenant with the house of Yashar''el (Israel), and with the house of Yahudah (Judah)* (Jeremiah 31:31) — both houses — *I will put my law in their inward parts, and write it in their hearts* (Jeremiah 31:33). The new wine is the SAME Torah, no longer on tablets of stone but in the heart. Renewal, not replacement.',
       sv.verse_id, ev.verse_id, 'free', 11246
  FROM _mt09_lookup sv, _mt09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=9 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=9 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-9-the-hem-of-his-garment-the-fringe-healing-in-his-wings-numbers-15-malachi-4',
       E'The hem of His garment — the fringe of the Torah, healing in His wings (Numbers 15; Leviticus 15; Malachi 4; 2 Kings 4)',
       E'A ruler''s daughter lies dead and a woman has bled twelve years, and both are gathered into one healing. The woman *touched the hem of his garment* — and that hem is not a stray thread but the commanded tzitzit: *make them fringes in the borders of their garments... a ribband of blue* (Numbers 15:38), *that ye may look upon it, and remember all the commandments of Yahuah (LORD), and do them* (Numbers 15:39). She grasped the very corner of the garment that calls Israel to remember and DO the Torah. By the law of the issue she was unclean — *if a woman have an issue of her blood many days... she shall be unclean* (Leviticus 15:25) — yet her touch does not defile Him; His holiness flows the other way and she is made whole. For Malachi had promised exactly this: *the Sun of righteousness arise with healing in his wings* (Malachi 4:2) — and *wings* is kanaph, the same Hebrew word as the corner/fringe of a garment. Healing was, quite literally, in His wings. Then the maid: He puts out the mourners and *took her by the hand, and the maid arose* — as Elisha before him, who *went up, and lay upon the child... and the flesh of the child waxed warm* (2 Kings 4:34). The Formed Son does the Father''s raising work, by the hand.',
       sv.verse_id, ev.verse_id, 'free', 11249
  FROM _mt09_lookup sv, _mt09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=9 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=9 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-9-two-blind-men-thou-son-of-david-isaiah-35-psalm-146-2-samuel-7',
       E'Thou Son of David, have mercy — the eyes of the blind opened (Isaiah 35; Isaiah 42; Psalm 146; 2 Samuel 7)',
       E'Two blind men follow, crying *Thou Son of David, have mercy on us* — and the title is no accident. The promise to David was *I will set up thy seed after thee... and I will establish his kingdom* (2 Samuel 7:12), and the sign that the Seed had come was written by Isaiah: *Then the eyes of the blind shall be opened, and the ears of the deaf shall be unstopped* (Isaiah 35:5). The chosen Servant''s commission was *To open the blind eyes, to bring out the prisoners from the prison* (Isaiah 42:7). And opening blind eyes is Yahuah''s own work — *Yahuah (LORD) openeth the eyes of the blind* (Psalm 146:8) — so when the Son of David does it *according to your faith*, the Father''s work is seen in the Formed Son. He touches their eyes, *and their eyes were opened*: Isaiah''s sign, fulfilled by David''s greater Son.',
       sv.verse_id, ev.verse_id, 'free', 11252
  FROM _mt09_lookup sv, _mt09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=9 AND sv.verse_number=27
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=9 AND ev.verse_number=31
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-9-sheep-having-no-shepherd-the-harvest-plenteous-numbers-27-ezekiel-34-baruch-5',
       E'As sheep having no shepherd — the harvest is plenteous (Numbers 27; Ezekiel 34; Isaiah 27; Joel 3; Baruch 5)',
       E'He goes about all the cities, *teaching... and healing every sickness*, and the sight of the crowds undoes Him: *he was moved with compassion on them, because they fainted, and were scattered abroad, as sheep having no shepherd*. That is Moses'' own prayer for the people — that *the congregation of Yahuah (LORD) be not as sheep which have no shepherd* (Numbers 27:17) — and Ezekiel''s indictment of the false shepherds: *they were scattered, because there is no shepherd... they became meat to all the beasts of the field* (Ezekiel 34:5); *my flock was scattered upon all the face of the earth, and none did search or seek after them* (Ezekiel 34:6). This is the scattered, two-house flock — and the true Shepherd has come to seek it. So He names the work *harvest*: *ye shall be gathered one by one, O ye children of Yashar''el (Israel)* (Isaiah 27:12); *Put ye in the sickle, for the harvest is ripe* (Joel 3:13). And Baruch had sung the home-coming already: *Arise, O Jerusalem... behold your children gathered from the west to the east by the word of the Holy One* (Baruch 5:5). *The harvest truly is plenteous, but the labourers are few; Pray ye therefore Yahuah (LORD) of the harvest, that he will send forth labourers* — to gather the scattered sheep home.',
       sv.verse_id, ev.verse_id, 'extras', 11255
  FROM _mt09_lookup sv, _mt09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=9 AND sv.verse_number=32
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=9 AND ev.verse_number=38
ON CONFLICT (slug) DO NOTHING;

-- ── 3d. Thread members ─────────────────────────────────────────────────────
-- Thread 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 43:25 — *I, even I, am he that blotteth out thy transgressions... and will not remember thy sins* — Yahuah''s own prerogative.'
  FROM cross_reference_threads t, cross_references x, _mt09_lookup sv, _mt09_lookup tv
 WHERE t.slug='matthew-9-thy-sins-be-forgiven-son-of-adam-power-to-forgive-isaiah-43-exodus-34'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=9 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=43 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 103:3 — *Who forgiveth all thine iniquities; who healeth all thy diseases* — forgiving and healing in one hand.'
  FROM cross_reference_threads t, cross_references x, _mt09_lookup sv, _mt09_lookup tv
 WHERE t.slug='matthew-9-thy-sins-be-forgiven-son-of-adam-power-to-forgive-isaiah-43-exodus-34'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=9 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=103 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 34:6 — *Yahuah Elohim, merciful and gracious... abundant in goodness and truth* — the Name made present in the Son.'
  FROM cross_reference_threads t, cross_references x, _mt09_lookup sv, _mt09_lookup tv
 WHERE t.slug='matthew-9-thy-sins-be-forgiven-son-of-adam-power-to-forgive-isaiah-43-exodus-34'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=9 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=34 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Exodus 34:7 — *Keeping mercy for thousands, forgiving iniquity and transgression and sin* — forgiven on earth through the Formed Son.'
  FROM cross_reference_threads t, cross_references x, _mt09_lookup sv, _mt09_lookup tv
 WHERE t.slug='matthew-9-thy-sins-be-forgiven-son-of-adam-power-to-forgive-isaiah-43-exodus-34'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=9 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=34 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Micah 7:18 — *Who is a Elohim (God) like unto thee, that pardoneth iniquity... because he delighteth in mercy*.'
  FROM cross_reference_threads t, cross_references x, _mt09_lookup sv, _mt09_lookup tv
 WHERE t.slug='matthew-9-thy-sins-be-forgiven-son-of-adam-power-to-forgive-isaiah-43-exodus-34'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=9 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=7 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Micah 7:19 — *thou wilt cast all their sins into the depths of the sea*.'
  FROM cross_reference_threads t, cross_references x, _mt09_lookup sv, _mt09_lookup tv
 WHERE t.slug='matthew-9-thy-sins-be-forgiven-son-of-adam-power-to-forgive-isaiah-43-exodus-34'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=9 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=7 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Mark 2:10 — *the Son of Adam hath power on earth to forgive sins* — the parallel Gospel.'
  FROM cross_reference_threads t, cross_references x, _mt09_lookup sv, _mt09_lookup tv
 WHERE t.slug='matthew-9-thy-sins-be-forgiven-son-of-adam-power-to-forgive-isaiah-43-exodus-34'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=9 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=2 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hosea 6:6 — *For I desired mercy, and not sacrifice; and the knowledge of Elohim more than burnt offerings* — the verse He sends them to learn.'
  FROM cross_reference_threads t, cross_references x, _mt09_lookup sv, _mt09_lookup tv
 WHERE t.slug='matthew-9-i-will-have-mercy-and-not-sacrifice-hosea-6-the-physician-to-the-sick'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=9 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=6 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Samuel 15:22 — *to obey is better than sacrifice, and to hearken than the fat of rams*.'
  FROM cross_reference_threads t, cross_references x, _mt09_lookup sv, _mt09_lookup tv
 WHERE t.slug='matthew-9-i-will-have-mercy-and-not-sacrifice-hosea-6-the-physician-to-the-sick'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=9 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=15 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 21:3 — *To do justice and judgment is more acceptable to Yahuah than sacrifice*.'
  FROM cross_reference_threads t, cross_references x, _mt09_lookup sv, _mt09_lookup tv
 WHERE t.slug='matthew-9-i-will-have-mercy-and-not-sacrifice-hosea-6-the-physician-to-the-sick'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=9 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=21 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 51:17 — *a broken and a contrite heart, O Elohim, thou wilt not despise* — the heart the Physician comes for.'
  FROM cross_reference_threads t, cross_references x, _mt09_lookup sv, _mt09_lookup tv
 WHERE t.slug='matthew-9-i-will-have-mercy-and-not-sacrifice-hosea-6-the-physician-to-the-sick'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=9 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=51 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Sirach 38:1-2 — *Honour a physician... for of the Most High comes healing* — the true Physician''s remedy is from the Most High.'
  FROM cross_reference_threads t, cross_references x, _mt09_lookup sv, _mt09_lookup tv
 WHERE t.slug='matthew-9-i-will-have-mercy-and-not-sacrifice-hosea-6-the-physician-to-the-sick'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=9 AND sv.verse_number=12
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=38 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Sirach 35:1-3 — *He that keepeth the law brings offerings enough... To depart from wickedness is a thing pleasing to Yahuah* — mercy IS the weightier sacrifice.'
  FROM cross_reference_threads t, cross_references x, _mt09_lookup sv, _mt09_lookup tv
 WHERE t.slug='matthew-9-i-will-have-mercy-and-not-sacrifice-hosea-6-the-physician-to-the-sick'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=9 AND sv.verse_number=13
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=35 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joel 2:16 — *let the bridegroom go forth of his chamber, and the bride out of her closet* — the Bridegroom present.'
  FROM cross_reference_threads t, cross_references x, _mt09_lookup sv, _mt09_lookup tv
 WHERE t.slug='matthew-9-new-wine-into-new-bottles-the-bridegroom-jeremiah-31-renewed-covenant'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=9 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 62:5 — *as the bridegroom rejoiceth over the bride, so shall thy Elohim rejoice over thee*.'
  FROM cross_reference_threads t, cross_references x, _mt09_lookup sv, _mt09_lookup tv
 WHERE t.slug='matthew-9-new-wine-into-new-bottles-the-bridegroom-jeremiah-31-renewed-covenant'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=9 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=62 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ecclesiastes 3:1 — *To every thing there is a season, and a time to every purpose under the heaven* — a time to fast, a time to feast.'
  FROM cross_reference_threads t, cross_references x, _mt09_lookup sv, _mt09_lookup tv
 WHERE t.slug='matthew-9-new-wine-into-new-bottles-the-bridegroom-jeremiah-31-renewed-covenant'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=9 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=3 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jeremiah 31:31 — *a new covenant with the house of Yashar''el... and with the house of Yahudah* — both houses.'
  FROM cross_reference_threads t, cross_references x, _mt09_lookup sv, _mt09_lookup tv
 WHERE t.slug='matthew-9-new-wine-into-new-bottles-the-bridegroom-jeremiah-31-renewed-covenant'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=9 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jeremiah 31:33 — *I will put my law in their inward parts, and write it in their hearts* — the new wine is the SAME Torah, written deeper.'
  FROM cross_reference_threads t, cross_references x, _mt09_lookup sv, _mt09_lookup tv
 WHERE t.slug='matthew-9-new-wine-into-new-bottles-the-bridegroom-jeremiah-31-renewed-covenant'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=9 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 15:38 — *make them fringes in the borders of their garments... a ribband of blue* — the hem was the commanded tzitzit.'
  FROM cross_reference_threads t, cross_references x, _mt09_lookup sv, _mt09_lookup tv
 WHERE t.slug='matthew-9-the-hem-of-his-garment-the-fringe-healing-in-his-wings-numbers-15-malachi-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=9 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=15 AND tv.verse_number=38
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 15:39 — *remember all the commandments of Yahuah, and do them* — she grasped the corner that calls Israel to DO the Torah.'
  FROM cross_reference_threads t, cross_references x, _mt09_lookup sv, _mt09_lookup tv
 WHERE t.slug='matthew-9-the-hem-of-his-garment-the-fringe-healing-in-his-wings-numbers-15-malachi-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=9 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=15 AND tv.verse_number=39
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 15:25 — *if a woman have an issue of her blood many days... she shall be unclean* — yet her touch did not defile Him; He healed her.'
  FROM cross_reference_threads t, cross_references x, _mt09_lookup sv, _mt09_lookup tv
 WHERE t.slug='matthew-9-the-hem-of-his-garment-the-fringe-healing-in-his-wings-numbers-15-malachi-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=9 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=15 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Malachi 4:2 — *the Sun of righteousness arise with healing in his wings* — *wings* is kanaph, the same word as the corner/fringe.'
  FROM cross_reference_threads t, cross_references x, _mt09_lookup sv, _mt09_lookup tv
 WHERE t.slug='matthew-9-the-hem-of-his-garment-the-fringe-healing-in-his-wings-numbers-15-malachi-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=9 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=4 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'2 Kings 4:34 — *he stretched himself upon the child; and the flesh of the child waxed warm* — as Elisha raised the Shunammite''s son, so the maid arose.'
  FROM cross_reference_threads t, cross_references x, _mt09_lookup sv, _mt09_lookup tv
 WHERE t.slug='matthew-9-the-hem-of-his-garment-the-fringe-healing-in-his-wings-numbers-15-malachi-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=9 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=4 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 5
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 35:5 — *Then the eyes of the blind shall be opened, and the ears of the deaf shall be unstopped* — the messianic sign.'
  FROM cross_reference_threads t, cross_references x, _mt09_lookup sv, _mt09_lookup tv
 WHERE t.slug='matthew-9-two-blind-men-thou-son-of-david-isaiah-35-psalm-146-2-samuel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=9 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=35 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 42:7 — *To open the blind eyes, to bring out the prisoners from the prison* — the work of the chosen Servant.'
  FROM cross_reference_threads t, cross_references x, _mt09_lookup sv, _mt09_lookup tv
 WHERE t.slug='matthew-9-two-blind-men-thou-son-of-david-isaiah-35-psalm-146-2-samuel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=9 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=42 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 146:8 — *Yahuah openeth the eyes of the blind* — what Yahuah does, the Son of David does.'
  FROM cross_reference_threads t, cross_references x, _mt09_lookup sv, _mt09_lookup tv
 WHERE t.slug='matthew-9-two-blind-men-thou-son-of-david-isaiah-35-psalm-146-2-samuel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=9 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=146 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Samuel 7:12 — *I will set up thy seed after thee... and I will establish his kingdom* — the promise to David, whose Son they cry to.'
  FROM cross_reference_threads t, cross_references x, _mt09_lookup sv, _mt09_lookup tv
 WHERE t.slug='matthew-9-two-blind-men-thou-son-of-david-isaiah-35-psalm-146-2-samuel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=9 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=7 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 6
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 27:17 — *that the congregation of Yahuah be not as sheep which have no shepherd* — Moses'' own plea.'
  FROM cross_reference_threads t, cross_references x, _mt09_lookup sv, _mt09_lookup tv
 WHERE t.slug='matthew-9-sheep-having-no-shepherd-the-harvest-plenteous-numbers-27-ezekiel-34-baruch-5'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=9 AND sv.verse_number=36
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=27 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 34:5 — *they were scattered, because there is no shepherd... they became meat to all the beasts of the field*.'
  FROM cross_reference_threads t, cross_references x, _mt09_lookup sv, _mt09_lookup tv
 WHERE t.slug='matthew-9-sheep-having-no-shepherd-the-harvest-plenteous-numbers-27-ezekiel-34-baruch-5'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=9 AND sv.verse_number=36
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=34 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 34:6 — *my flock was scattered upon all the face of the earth, and none did search or seek after them* — the scattered two-house flock.'
  FROM cross_reference_threads t, cross_references x, _mt09_lookup sv, _mt09_lookup tv
 WHERE t.slug='matthew-9-sheep-having-no-shepherd-the-harvest-plenteous-numbers-27-ezekiel-34-baruch-5'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=9 AND sv.verse_number=36
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=34 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 27:12 — *ye shall be gathered one by one, O ye children of Yashar''el* — the harvest is the in-gathering of scattered Israel.'
  FROM cross_reference_threads t, cross_references x, _mt09_lookup sv, _mt09_lookup tv
 WHERE t.slug='matthew-9-sheep-having-no-shepherd-the-harvest-plenteous-numbers-27-ezekiel-34-baruch-5'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=9 AND sv.verse_number=37
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=27 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Joel 3:13 — *Put ye in the sickle, for the harvest is ripe* — the labourers sent into the harvest.'
  FROM cross_reference_threads t, cross_references x, _mt09_lookup sv, _mt09_lookup tv
 WHERE t.slug='matthew-9-sheep-having-no-shepherd-the-harvest-plenteous-numbers-27-ezekiel-34-baruch-5'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=9 AND sv.verse_number=38
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=3 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Baruch 5:5 — *Arise, O Jerusalem... behold your children gathered from the west to the east by the word of the Holy One* — the scattered flock brought home.'
  FROM cross_reference_threads t, cross_references x, _mt09_lookup sv, _mt09_lookup tv
 WHERE t.slug='matthew-9-sheep-having-no-shepherd-the-harvest-plenteous-numbers-27-ezekiel-34-baruch-5'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=9 AND sv.verse_number=36
   AND tv.edition_slug='apocrypha' AND tv.book_slug='baruch-with-the-letter-of-jeremiah' AND tv.chapter_number=5 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
