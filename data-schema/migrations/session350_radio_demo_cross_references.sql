-- =====================================================================
-- Session 350 — Radio Demo FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py ../data-schema/migrations/session350_radio_demo_cross_references.sql
-- =====================================================================

\echo 'session350 — Radio Demo cross-references starting...'
BEGIN;

-- ----- fragment: minion_radiodemo_luke21.sql (Luke 21 -> Zechariah 14) -----
-- The two Olivet discourses are one picture. On the Mount of Olives the King foretells
-- *Jerusalem shall be trodden down of the Gentiles* (Luke 21:24) and *then shall they see
-- the Son of Adam coming in a cloud with power and great glory* (21:27); standing on that
-- same mountain, Zechariah saw the day of Yahuah from the other side — the nations gathered
-- against Jerusalem (Zech 14:1-3), Yahuah's own feet upon the mount of Olives (14:4), Yahuah
-- King over all the earth, his name one (14:9), and the nations left alive going up to keep
-- the feast of tabernacles (14:16-19). One day, one mountain, one King. The trodden-down has
-- an appointed end — *until the times of the Gentiles be fulfilled* — never a casting-off
-- (Romans 11). The Sukkot of the nations is the feast kept forever in the reign (Lev 23;
-- Isaiah 66:23): the nations' place begins when the King stands on the mountain, not before.
-- Greenfield: the only pre-existing Luke 21 -> Zechariah 14 pair is 21:20 -> 14:2 (a different
-- thread); every pair here is new. Distinct from the cloud-coming (Dan 7 / Joel 2) thread.
-- Tag: luke21demo   Temp view: _s350_luke21_lookup
-- Source of every row: 'canon','luke',21,v ; targets 'canon','zechariah',14,v

CREATE TEMP VIEW _s350_luke21_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Luke 21:24 (trodden down / led captive into all nations) <-> Zech 14:1-3 (the day of Yahuah, nations gathered)
    ('canon','luke',21,24,'canon','zechariah',14,1,'free',
      E'*Behold, the day of Yahuah (LORD) comes, and your spoil shall be divided in the midst of you* (Zechariah 14:1). When the King says *they shall fall by the edge of the sword, and shall be led away captive into all nations: and Jerusalem shall be trodden down of the Gentiles, until the times of the Gentiles be fulfilled* (Luke 21:24), he is opening the very day Zechariah named from the Mount of Olives — *the day of Yahuah*. The trampling is not the end of the story; it is the threshold of the day, and that day has an appointed limit (*until the times of the Gentiles be fulfilled*).'),
    ('canon','luke',21,24,'canon','zechariah',14,2,'free',
      E'*For I will gather all nations against Jerusalem to battle; and the city shall be taken, and the houses rifled, and the women ravished; and half of the city shall go forth into captivity, and the residue of the people shall not be cut off from the city* (Zechariah 14:2). This is the same trampling Yahusha (Jesus) foretold — *led away captive into all nations: and Jerusalem shall be trodden down of the Gentiles* (Luke 21:24). Mark the mercy folded into the judgment: *the residue of the people shall not be cut off* — a remnant always stands. *Hath Elohim (God) cast away his people? Elohim (God) forbid* (Romans 11:1).'),
    ('canon','luke',21,24,'canon','zechariah',14,3,'free',
      E'*Then shall Yahuah (LORD) go forth, and fight against those nations, as when he fought in the day of battle* (Zechariah 14:3). The same nations that tread Jerusalem down (Luke 21:24) are met by Yahuah himself — *then shall Yahuah (LORD) go forth, and fight*. The treading-down has a terminus: when the times of the Gentiles are fulfilled, the One who was trodden against goes forth in battle. The captive city is not abandoned; it is contended for by her King.'),
    -- Luke 21:27 (the Son of Adam coming in a cloud, power and great glory) <-> Zech 14:4 (feet on Olivet), 14:9 (King over all the earth)
    ('canon','luke',21,27,'canon','zechariah',14,4,'free',
      E'*And his feet shall stand in that day upon the mount of Olives, which is before Jerusalem on the east, and the mount of Olives shall cleave in the midst thereof* (Zechariah 14:4). *Then shall they see the Son of Adam coming in a cloud with power and great glory* (Luke 21:27) — and where do those feet come to rest? Upon the very mountain where he sat to speak these words. He foretold his coming from the Mount of Olives; Zechariah saw him arrive upon it. The two visions meet on one summit.'),
    ('canon','luke',21,27,'canon','zechariah',14,9,'free',
      E'*And Yahuah (LORD) shall be king over all the earth: in that day shall there be one Yahuah (LORD), and his name one* (Zechariah 14:9). The *power and great glory* of the Son of Adam coming in the cloud (Luke 21:27) is this kingship — *Yahuah (LORD) shall be king over all the earth*. The One enthroned is the Formed Son, who is Yahuah and yet has a Father; *his name one* is the Shema''s own unity (Deuteronomy 6:4) — the Formed and the Formless, one Name, not a parting of co-equal persons nor a collapse of the two.'),
    -- Luke 21:28 (redemption draws nigh; lift up your heads) <-> Zech 14:16-19 (the nations keep the feast of tabernacles)
    ('canon','luke',21,28,'canon','zechariah',14,16,'free',
      E'*And it shall come to pass, that every one that is left of all the nations which came against Jerusalem shall even go up from year to year to worship the King, Yahuah Tseva''ot (LORD of hosts), and to keep the feast of tabernacles* (Zechariah 14:16). When *your redemption draws nigh* (Luke 21:28), the day ends not in ruin but in worship: the nations left alive after the day go up to keep Sukkot. The appointed feast is not abolished — it is kept *from year to year* in the reign, by the very nations once gathered for war.'),
    ('canon','luke',21,28,'canon','zechariah',14,17,'free',
      E'*And it shall be, that whoso will not come up of all the families of the earth unto Jerusalem to worship the King, Yahuah Tseva''ot (LORD of hosts), even upon them shall be no rain* (Zechariah 14:17). The redemption Yahusha (Jesus) bids his own to look up for (Luke 21:28) arrives as a kingdom with a kept feast at its center. Sukkot stands as the test of the nations in the age to come — *whoso will not come up... even upon them shall be no rain*. The feasts of Yahuah are not shadows discarded; they are the worship of the world made new.'),
    ('canon','luke',21,28,'canon','zechariah',14,18,'free',
      E'*And if the family of Egypt go not up, and come not, that have no rain; there shall be the plague, wherewith Yahuah (LORD) will smite the heathen that come not up to keep the feast of tabernacles* (Zechariah 14:18). The same redemption that lifts up the heads of the watching (Luke 21:28) sets Sukkot as the standard for every family of the earth. The feast the pulpit called abolished is, in the reign, the very thing the nations are summoned to keep — *to keep the feast of tabernacles*.'),
    ('canon','luke',21,28,'canon','zechariah',14,19,'free',
      E'*This shall be the punishment of Egypt, and the punishment of all nations that come not up to keep the feast of tabernacles* (Zechariah 14:19). The day the King foretold from Olivet (Luke 21:27-28) closes here: the nations'' relationship to the King is measured by Sukkot. This is the place of the nations in the millennial reign — gathered to learn the feasts of Yahuah from the King and his gathered remnant. Their part begins when his feet stand on the mountain, and it is framed, to the end, by the appointed feast.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s350_luke21_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s350_luke21_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'luke-21-jerusalem-trodden-down-and-the-day-of-yahuah-zechariah-14',
       E'Jerusalem trodden down and the day of Yahuah — the two Olivet discourses are one picture (Zechariah 14)',
       E'On the Mount of Olives, Yahusha (Jesus) opens the day of Yahuah: *And they shall fall by the edge of the sword, and shall be led away captive into all nations: and Jerusalem shall be trodden down of the Gentiles, until the times of the Gentiles be fulfilled* (Luke 21:24); *and then shall they see the Son of Adam coming in a cloud with power and great glory. And when these things begin to come to pass, then look up, and lift up your heads; for your redemption draws nigh* (Luke 21:27-28). Centuries earlier, standing on that same mountain, Zechariah was shown the other side of the one day. The trampling: *Behold, the day of Yahuah (LORD) comes... For I will gather all nations against Jerusalem to battle; and the city shall be taken... and half of the city shall go forth into captivity, and the residue of the people shall not be cut off* (Zechariah 14:1-2). The turning: *Then shall Yahuah (LORD) go forth, and fight against those nations* (14:3). The arrival, on the very summit of the discourse: *And his feet shall stand in that day upon the mount of Olives, which is before Jerusalem on the east* (14:4). The kingship: *And Yahuah (LORD) shall be king over all the earth: in that day shall there be one Yahuah (LORD), and his name one* (14:9) — the Formed Son reigning, who is Yahuah and has a Father, *his name one* the Shema''s own unity. And the end of the day is not ash but a kept feast: *every one that is left of all the nations which came against Jerusalem shall even go up from year to year to worship the King, Yahuah Tseva''ot (LORD of hosts), and to keep the feast of tabernacles* (14:16), with judgment on any nation that *come not up to keep the feast of tabernacles* (14:18-19). Read the two discourses as one: the treading-down has an appointed limit, never a casting-off — *Hath Elohim (God) cast away his people? Elohim (God) forbid* (Romans 11:1) — and the day closes with the nations summoned to Sukkot, the appointed feast that was never abolished but kept forever in the reign of the King.',
       sv.verse_id, ev.verse_id, 'free', 14604
  FROM _s350_luke21_lookup sv, _s350_luke21_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=21 AND sv.verse_number=24
   AND ev.edition_slug='canon' AND ev.book_slug='luke' AND ev.chapter_number=21 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Behold, the day of Yahuah (LORD) comes, and your spoil shall be divided in the midst of you* (Zechariah 14:1) — the *trodden down of the Gentiles* of Luke 21:24 is the threshold of the day of Yahuah Zechariah saw from this same mountain.'
  FROM cross_reference_threads t
  JOIN _s350_luke21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=21 AND sv.verse_number=24
  JOIN _s350_luke21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=14 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='luke-21-jerusalem-trodden-down-and-the-day-of-yahuah-zechariah-14'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *I will gather all nations against Jerusalem to battle; and the city shall be taken... and half of the city shall go forth into captivity, and the residue of the people shall not be cut off* (Zechariah 14:2) — the same captivity of Luke 21:24, with a remnant never cut off (Romans 11:1).'
  FROM cross_reference_threads t
  JOIN _s350_luke21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=21 AND sv.verse_number=24
  JOIN _s350_luke21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=14 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='luke-21-jerusalem-trodden-down-and-the-day-of-yahuah-zechariah-14'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Then shall Yahuah (LORD) go forth, and fight against those nations, as when he fought in the day of battle* (Zechariah 14:3) — the treading-down (Luke 21:24) ends when Yahuah goes forth; the trampled city is contended for by her King.'
  FROM cross_reference_threads t
  JOIN _s350_luke21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=21 AND sv.verse_number=24
  JOIN _s350_luke21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=14 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='luke-21-jerusalem-trodden-down-and-the-day-of-yahuah-zechariah-14'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★★ *And his feet shall stand in that day upon the mount of Olives, which is before Jerusalem on the east* (Zechariah 14:4) — the *Son of Adam coming in a cloud with power and great glory* (Luke 21:27) lands his feet on the very mountain of the discourse.'
  FROM cross_reference_threads t
  JOIN _s350_luke21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=21 AND sv.verse_number=27
  JOIN _s350_luke21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=14 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='luke-21-jerusalem-trodden-down-and-the-day-of-yahuah-zechariah-14'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★★★ *And Yahuah (LORD) shall be king over all the earth: in that day shall there be one Yahuah (LORD), and his name one* (Zechariah 14:9) — the *power and great glory* of Luke 21:27 is this kingship; the Formed Son reigning, *his name one* (the Shema, Deuteronomy 6:4), who is Yahuah and has a Father.'
  FROM cross_reference_threads t
  JOIN _s350_luke21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=21 AND sv.verse_number=27
  JOIN _s350_luke21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=14 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='luke-21-jerusalem-trodden-down-and-the-day-of-yahuah-zechariah-14'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★★ *every one that is left of all the nations which came against Jerusalem shall even go up from year to year to worship the King, Yahuah Tseva''ot (LORD of hosts), and to keep the feast of tabernacles* (Zechariah 14:16) — when *your redemption draws nigh* (Luke 21:28), the day ends in kept Sukkot, not in abolished feasts.'
  FROM cross_reference_threads t
  JOIN _s350_luke21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=21 AND sv.verse_number=28
  JOIN _s350_luke21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=14 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='luke-21-jerusalem-trodden-down-and-the-day-of-yahuah-zechariah-14'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*whoso will not come up of all the families of the earth unto Jerusalem to worship the King, Yahuah Tseva''ot (LORD of hosts), even upon them shall be no rain* (Zechariah 14:17) — the redemption looked for in Luke 21:28 arrives as a kingdom with the appointed feast at its center.'
  FROM cross_reference_threads t
  JOIN _s350_luke21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=21 AND sv.verse_number=28
  JOIN _s350_luke21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=14 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='luke-21-jerusalem-trodden-down-and-the-day-of-yahuah-zechariah-14'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*there shall be the plague, wherewith Yahuah (LORD) will smite the heathen that come not up to keep the feast of tabernacles* (Zechariah 14:18) — in the reign, Sukkot is the standard set before every family of the earth.'
  FROM cross_reference_threads t
  JOIN _s350_luke21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=21 AND sv.verse_number=28
  JOIN _s350_luke21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=14 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='luke-21-jerusalem-trodden-down-and-the-day-of-yahuah-zechariah-14'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'*This shall be the punishment of Egypt, and the punishment of all nations that come not up to keep the feast of tabernacles* (Zechariah 14:19) — the nations'' place in the reign is framed, to the end, by the appointed feast; their part begins when his feet stand on the mountain.'
  FROM cross_reference_threads t
  JOIN _s350_luke21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=21 AND sv.verse_number=28
  JOIN _s350_luke21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=14 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='luke-21-jerusalem-trodden-down-and-the-day-of-yahuah-zechariah-14'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_radiodemo_fishers.sql (Matthew 4:19 + Mark 1:17 -> Jer 16 / Ezek 47 / Amos 4 / Hab 1) -----
-- "I will make you fishers of men" is not the start of generic evangelism — it is the
-- inauguration of the second exodus the prophets foretold: the regathering of scattered
-- Yashar'el. Jeremiah promises a day named not by the first exodus but by the regathering
-- *from the land of the north, and from all the lands whither he had driven them* (16:15),
-- and the means: *I will send for many fishers... and they shall fish them; and after will I
-- send for many hunters* (16:16). The hooks that dragged Israel OUT into exile (Amos 4:2) and
-- the conqueror's net that caught them (Habakkuk 1:14-15) are answered by the fishers Yahuah
-- sends to bring them HOME, and by the river of life on whose banks the fishers stand spreading
-- their nets (Ezekiel 47:9-10). The apostles are the first of those fishers; the catch is the
-- lost sheep of the house of Yashar'el scattered among the nations. This is two-house
-- restoration, NOT the grafting of the nations by faith-confession, and NOT a casting-off:
-- *Hath Elohim cast away his people? Elohim forbid* (Romans 11:1-2).
-- Greenfield: pairs 4:19->Jer16:16, 4:19->Jer16:14, 1:17->Jer16:16 already exist in other
-- threads (the keystone 16:16 is quoted IN FULL here in prose to avoid doubling those members);
-- every member pair below is NEW. Two threads so it surfaces on BOTH Matthew 4 and Mark 1.
-- Tag: fishersdemo   Temp view: _s350_fishers_lookup
-- Source rows: 'canon','matthew',4,19 and 'canon','mark',1,17

CREATE TEMP VIEW _s350_fishers_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- ===== MATTHEW 4:19 =====
    ('canon','matthew',4,19,'canon','jeremiah',16,13,'free',
      E'*Therefore will I cast you out of this land into a land that you know not, neither you nor your fathers; and there shall you serve other gods day and night; where I will not shew you favour* (Jeremiah 16:13). This is the scattering the fishers are sent to reverse. *Follow me, and I will make you fishers of men* (Matthew 4:19) is spoken to a people *cast out... into a land that you know not* — the lost sheep of the house of Yashar''el (Israel) among the nations. The casting-out of 16:13 is answered by the fishing-back of 16:16.'),
    ('canon','matthew',4,19,'canon','jeremiah',16,15,'free',
      E'*But, Yahuah (LORD) lives, that brought up the children of Yashar''el (Israel) from the land of the north, and from all the lands whither he had driven them: and I will bring them again into their land that I gave unto their fathers* (Jeremiah 16:15). The day Jeremiah names is the regathering — a deliverance so great it eclipses the first exodus, *from the land of the north, and from all the lands*. *I will make you fishers of men* (Matthew 4:19) begins that ingathering: the apostles sent first to gather the scattered seed home.'),
    ('canon','matthew',4,19,'canon','ezekiel',47,9,'free',
      E'*And it shall come to pass, that every thing that lives, which moves, whithersoever the rivers shall come, shall live... for they shall be healed; and every thing shall live whither the river comes* (Ezekiel 47:9). The river of life from the temple makes the catch a gathering unto life. The *fishers of men* (Matthew 4:19) labor on the very waters Ezekiel saw — *every thing shall live whither the river comes* — drawing the scattered into healing, not merely into a net.'),
    ('canon','matthew',4,19,'canon','ezekiel',47,10,'free',
      E'*And it shall come to pass, that the fishers shall stand upon it from En-gedi even unto En-eglaim; they shall be a place to spread forth nets; their fish shall be according to their kinds, as the fish of the great sea, exceeding many* (Ezekiel 47:10). Here are the fishers by name, standing on the banks of the river of life *to spread forth nets*. *I will make you fishers of men* (Matthew 4:19) puts the apostles on Ezekiel''s riverbank — the catch *exceeding many*, the gathering of the restored.'),
    ('canon','matthew',4,19,'canon','amos',4,2,'free',
      E'*Adonai Yahuah (The Lord GOD) has sworn by his holiness... that he will take you away with hooks, and your posterity with fishhooks* (Amos 4:2). The same fishing-image first marks the judgment that dragged Yashar''el OUT — *taken away with hooks*. The fishers of *Follow me, and I will make you fishers of men* (Matthew 4:19) reverse the hooks of exile: the people once hooked away into scattering are now fished home.'),
    ('canon','matthew',4,19,'canon','habakkuk',1,14,'free',
      E'*And make men as the fishes of the sea, as the creeping things, that have no ruler over them?* (Habakkuk 1:14). The prophet sees men made *as the fishes of the sea* — caught and carried off by the conqueror. *I will make you fishers of men* (Matthew 4:19) answers that scattering: the men taken as fish in judgment are sought out as the catch of the regathering.'),
    ('canon','matthew',4,19,'canon','habakkuk',1,15,'free',
      E'*They take up all of them with the angle, they catch them in their net, and gather them in their drag: therefore they rejoice and are glad* (Habakkuk 1:15). The conqueror''s net that caught Yashar''el for exile is turned: the fishers Yahuah sends *catch them in their net* to bring them home. *Fishers of men* (Matthew 4:19) is the net of the ingathering, not of the captor.'),
    -- ===== MARK 1:17 =====
    ('canon','mark',1,17,'canon','jeremiah',16,13,'free',
      E'*Therefore will I cast you out of this land into a land that you know not, neither you nor your fathers; and there shall you serve other gods day and night; where I will not shew you favour* (Jeremiah 16:13). The scattering of 16:13 is the very condition the fishers are sent into. *Come you after me, and I will make you to become fishers of men* (Mark 1:17) sends the apostles to a people *cast out... into a land that you know not* — the lost sheep of Yashar''el (Israel) among the nations.'),
    ('canon','mark',1,17,'canon','jeremiah',16,15,'free',
      E'*But, Yahuah (LORD) lives, that brought up the children of Yashar''el (Israel) from the land of the north, and from all the lands whither he had driven them: and I will bring them again into their land that I gave unto their fathers* (Jeremiah 16:15). The regathering eclipses the first exodus. *I will make you to become fishers of men* (Mark 1:17) inaugurates that ingathering — the scattered seed brought again *from all the lands whither he had driven them*.'),
    ('canon','mark',1,17,'canon','ezekiel',47,9,'free',
      E'*And it shall come to pass, that every thing that lives, which moves, whithersoever the rivers shall come, shall live... for they shall be healed; and every thing shall live whither the river comes* (Ezekiel 47:9). The fishers of *Come you after me* (Mark 1:17) work the river of life Ezekiel saw — the catch is a gathering unto healing, *every thing shall live whither the river comes*.'),
    ('canon','mark',1,17,'canon','ezekiel',47,10,'free',
      E'*And it shall come to pass, that the fishers shall stand upon it from En-gedi even unto En-eglaim; they shall be a place to spread forth nets; their fish shall be according to their kinds, as the fish of the great sea, exceeding many* (Ezekiel 47:10). Ezekiel names the fishers standing on the river of life *to spread forth nets*. *I will make you to become fishers of men* (Mark 1:17) sets the apostles on that bank — the catch *exceeding many*.'),
    ('canon','mark',1,17,'canon','amos',4,2,'free',
      E'*Adonai Yahuah (The Lord GOD) has sworn by his holiness... that he will take you away with hooks, and your posterity with fishhooks* (Amos 4:2). The hooks first dragged Yashar''el OUT in judgment. *Come you after me, and I will make you to become fishers of men* (Mark 1:17) reverses them: the people hooked away into exile are now fished home.'),
    ('canon','mark',1,17,'canon','habakkuk',1,14,'free',
      E'*And make men as the fishes of the sea, as the creeping things, that have no ruler over them?* (Habakkuk 1:14). Men made *as the fishes of the sea* — scattered, carried off, masterless. *I will make you to become fishers of men* (Mark 1:17) seeks out exactly these as the catch of the regathering.'),
    ('canon','mark',1,17,'canon','habakkuk',1,15,'free',
      E'*They take up all of them with the angle, they catch them in their net, and gather them in their drag: therefore they rejoice and are glad* (Habakkuk 1:15). The captor''s net is turned into the net of the ingathering. *Fishers of men* (Mark 1:17) gather the scattered home, *catch them in their net* unto restoration, not exile.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s350_fishers_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s350_fishers_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD A — Matthew 4:19
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-4-19-fishers-of-men-the-regathering-of-scattered-yashar-el-jeremiah-16',
       E'Fishers of men — the beginning of the regathering of scattered Yashar''el (Israel) (Jeremiah 16, Ezekiel 47, Amos 4, Habakkuk 1)',
       E'*And he says unto them, Follow me, and I will make you fishers of men* (Matthew 4:19). This is not the launch of generic evangelism; it is the first stroke of the second exodus the prophets foretold — the regathering of scattered Yashar''el (Israel). Jeremiah names a coming day defined not by the first exodus but by the ingathering: *Therefore, behold, the days come, says Yahuah (LORD), that it shall no more be said, Yahuah (LORD) lives, that brought up the children of Yashar''el (Israel) out of the land of Egypt; But, Yahuah (LORD) lives, that brought up the children of Yashar''el (Israel) from the land of the north, and from all the lands whither he had driven them* (Jeremiah 16:14-15). And he names the means: *Behold, I will send for many fishers, says Yahuah (LORD), and they shall fish them; and after will I send for many hunters, and they shall hunt them from every mountain, and from every hill, and out of the holes of the rocks* (Jeremiah 16:16). The apostles are the first of those fishers. The fishing-image runs the length of the prophets: the hooks that dragged Yashar''el OUT in judgment — *he will take you away with hooks, and your posterity with fishhooks* (Amos 4:2) — and the conqueror''s net that caught them — *they catch them in their net, and gather them in their drag* (Habakkuk 1:15), men made *as the fishes of the sea* (Habakkuk 1:14) — are reversed by the fishers Yahuah sends to bring them home, standing on the banks of the river of life: *the fishers shall stand upon it from En-gedi even unto En-eglaim; they shall be a place to spread forth nets... as the fish of the great sea, exceeding many* (Ezekiel 47:10), where *every thing shall live whither the river comes* (47:9). The catch is the lost sheep of the house of Yashar''el scattered among the nations (Matthew 10:6; 15:24) — a two-house restoration, NOT the grafting of the nations by faith-confession, and never a casting-off of his people: *Hath Elohim (God) cast away his people? Elohim (God) forbid... Elohim (God) hath not cast away his people which he foreknew* (Romans 11:1-2).',
       sv.verse_id, sv.verse_id, 'free', 11103
  FROM _s350_fishers_lookup sv
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=4 AND sv.verse_number=19
ON CONFLICT (slug) DO NOTHING;

-- THREAD B — Mark 1:17
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'mark-1-17-fishers-of-men-the-regathering-of-scattered-yashar-el-jeremiah-16',
       E'Fishers of men — the beginning of the regathering of scattered Yashar''el (Israel) (Jeremiah 16, Ezekiel 47, Amos 4, Habakkuk 1)',
       E'*And Yahusha (Jesus) said unto them, Come you after me, and I will make you to become fishers of men* (Mark 1:17). The call is the first stroke of the second exodus the prophets foretold — the regathering of scattered Yashar''el (Israel), not the launch of generic evangelism. Jeremiah names the coming day by the ingathering itself: *it shall no more be said, Yahuah (LORD) lives, that brought up the children of Yashar''el (Israel) out of the land of Egypt; But, Yahuah (LORD) lives, that brought up the children of Yashar''el (Israel) from the land of the north, and from all the lands whither he had driven them* (Jeremiah 16:14-15) — and the means: *Behold, I will send for many fishers, says Yahuah (LORD), and they shall fish them; and after will I send for many hunters* (Jeremiah 16:16). The apostles are the first of those fishers. The prophets'' fishing-image is first judgment — *he will take you away with hooks, and your posterity with fishhooks* (Amos 4:2); men made *as the fishes of the sea* (Habakkuk 1:14), *they catch them in their net, and gather them in their drag* (Habakkuk 1:15) — the hooks and net that dragged Yashar''el OUT into exile. The fishers Yahuah sends reverse them, standing on the river of life: *the fishers shall stand upon it from En-gedi even unto En-eglaim; they shall be a place to spread forth nets... exceeding many* (Ezekiel 47:10), where *every thing shall live whither the river comes* (47:9). The catch is the lost sheep of the house of Yashar''el scattered among the nations (Matthew 10:6; 15:24) — two-house restoration, NOT the nations grafted by faith-confession, and never a casting-off: *Hath Elohim (God) cast away his people? Elohim (God) forbid... Elohim (God) hath not cast away his people which he foreknew* (Romans 11:1-2).',
       sv.verse_id, sv.verse_id, 'free', 13007
  FROM _s350_fishers_lookup sv
 WHERE sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=1 AND sv.verse_number=17
ON CONFLICT (slug) DO NOTHING;

-- THREAD A members (Matthew 4:19)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Therefore will I cast you out of this land into a land that you know not* (Jeremiah 16:13) — the scattering the fishers of Matthew 4:19 are sent to reverse; the lost sheep among the nations.'
  FROM cross_reference_threads t
  JOIN _s350_fishers_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=4 AND sv.verse_number=19
  JOIN _s350_fishers_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=16 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='matthew-4-19-fishers-of-men-the-regathering-of-scattered-yashar-el-jeremiah-16'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★★ *Yahuah (LORD) lives, that brought up the children of Yashar''el (Israel) from the land of the north, and from all the lands whither he had driven them* (Jeremiah 16:15) — the second exodus; *I will make you fishers of men* (Matthew 4:19) begins this ingathering of the scattered seed.'
  FROM cross_reference_threads t
  JOIN _s350_fishers_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=4 AND sv.verse_number=19
  JOIN _s350_fishers_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=16 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='matthew-4-19-fishers-of-men-the-regathering-of-scattered-yashar-el-jeremiah-16'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*every thing shall live whither the river comes* (Ezekiel 47:9) — the river of life makes the catch a gathering unto healing, not merely into a net.'
  FROM cross_reference_threads t
  JOIN _s350_fishers_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=4 AND sv.verse_number=19
  JOIN _s350_fishers_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=47 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='matthew-4-19-fishers-of-men-the-regathering-of-scattered-yashar-el-jeremiah-16'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *the fishers shall stand upon it from En-gedi even unto En-eglaim; they shall be a place to spread forth nets... exceeding many* (Ezekiel 47:10) — the apostles on Ezekiel''s riverbank, the catch of the regathering.'
  FROM cross_reference_threads t
  JOIN _s350_fishers_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=4 AND sv.verse_number=19
  JOIN _s350_fishers_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=47 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='matthew-4-19-fishers-of-men-the-regathering-of-scattered-yashar-el-jeremiah-16'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*he will take you away with hooks, and your posterity with fishhooks* (Amos 4:2) — the hooks that dragged Yashar''el OUT in judgment; the fishers of Matthew 4:19 reverse them, fishing the scattered home.'
  FROM cross_reference_threads t
  JOIN _s350_fishers_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=4 AND sv.verse_number=19
  JOIN _s350_fishers_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=4 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='matthew-4-19-fishers-of-men-the-regathering-of-scattered-yashar-el-jeremiah-16'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*And make men as the fishes of the sea... that have no ruler over them* (Habakkuk 1:14) — men scattered and masterless; the fishers of men seek out exactly these.'
  FROM cross_reference_threads t
  JOIN _s350_fishers_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=4 AND sv.verse_number=19
  JOIN _s350_fishers_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='habakkuk' AND tv.chapter_number=1 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='matthew-4-19-fishers-of-men-the-regathering-of-scattered-yashar-el-jeremiah-16'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*they catch them in their net, and gather them in their drag* (Habakkuk 1:15) — the captor''s net turned into the net of the ingathering.'
  FROM cross_reference_threads t
  JOIN _s350_fishers_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=4 AND sv.verse_number=19
  JOIN _s350_fishers_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='habakkuk' AND tv.chapter_number=1 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='matthew-4-19-fishers-of-men-the-regathering-of-scattered-yashar-el-jeremiah-16'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD B members (Mark 1:17)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Therefore will I cast you out of this land into a land that you know not* (Jeremiah 16:13) — the scattering into which *Come you after me... fishers of men* (Mark 1:17) sends the apostles; the lost sheep among the nations.'
  FROM cross_reference_threads t
  JOIN _s350_fishers_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=1 AND sv.verse_number=17
  JOIN _s350_fishers_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=16 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='mark-1-17-fishers-of-men-the-regathering-of-scattered-yashar-el-jeremiah-16'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★★ *Yahuah (LORD) lives, that brought up the children of Yashar''el (Israel) from the land of the north, and from all the lands whither he had driven them* (Jeremiah 16:15) — the second exodus; *I will make you to become fishers of men* (Mark 1:17) inaugurates this ingathering.'
  FROM cross_reference_threads t
  JOIN _s350_fishers_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=1 AND sv.verse_number=17
  JOIN _s350_fishers_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=16 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='mark-1-17-fishers-of-men-the-regathering-of-scattered-yashar-el-jeremiah-16'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*every thing shall live whither the river comes* (Ezekiel 47:9) — the river of life; the catch is a gathering unto healing.'
  FROM cross_reference_threads t
  JOIN _s350_fishers_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=1 AND sv.verse_number=17
  JOIN _s350_fishers_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=47 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='mark-1-17-fishers-of-men-the-regathering-of-scattered-yashar-el-jeremiah-16'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *the fishers shall stand upon it from En-gedi even unto En-eglaim; they shall be a place to spread forth nets... exceeding many* (Ezekiel 47:10) — the apostles on Ezekiel''s riverbank, the catch of the regathering.'
  FROM cross_reference_threads t
  JOIN _s350_fishers_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=1 AND sv.verse_number=17
  JOIN _s350_fishers_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=47 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='mark-1-17-fishers-of-men-the-regathering-of-scattered-yashar-el-jeremiah-16'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*he will take you away with hooks, and your posterity with fishhooks* (Amos 4:2) — the hooks that dragged Yashar''el OUT in judgment, reversed by the fishers of Mark 1:17.'
  FROM cross_reference_threads t
  JOIN _s350_fishers_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=1 AND sv.verse_number=17
  JOIN _s350_fishers_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=4 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='mark-1-17-fishers-of-men-the-regathering-of-scattered-yashar-el-jeremiah-16'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*And make men as the fishes of the sea... that have no ruler over them* (Habakkuk 1:14) — men scattered and masterless; the very catch the fishers of men seek.'
  FROM cross_reference_threads t
  JOIN _s350_fishers_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=1 AND sv.verse_number=17
  JOIN _s350_fishers_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='habakkuk' AND tv.chapter_number=1 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='mark-1-17-fishers-of-men-the-regathering-of-scattered-yashar-el-jeremiah-16'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*they catch them in their net, and gather them in their drag* (Habakkuk 1:15) — the captor''s net turned into the net of the ingathering of scattered Yashar''el.'
  FROM cross_reference_threads t
  JOIN _s350_fishers_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=1 AND sv.verse_number=17
  JOIN _s350_fishers_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='habakkuk' AND tv.chapter_number=1 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='mark-1-17-fishers-of-men-the-regathering-of-scattered-yashar-el-jeremiah-16'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session350 — Radio Demo cross-references complete.'
