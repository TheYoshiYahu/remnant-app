-- ----- fragment: minion_acts_16.sql (S217 Acts 16) -----
-- =====================================================================
-- S217 minion — ACTS 16 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: ACTS 16.  Tag: a16 (temp view _s217_a16_lookup).  Sort band: 5650-5665 (step 3).
-- Source is ALWAYS the canon Acts verse; targets span Tanakh + extra-canonical + NT.
-- Tiers per-row: canon target = 'free'; extra-canonical target = 'extras'.
--
-- WATCHPOINTS (Red Lines #6/#7/#11, Christology, dropped-Paul, son-of-Adam):
--  * Timothy circumcised (16:1-3): NOT hypocrisy but covenant fidelity. Paul, the Torah-
--    observant Israelite of Benjamin, circumcises Timothy and walks orderly, keeping the law
--    (Acts 21:24) — the dropped-Paul correction. The Paul who abolished Torah does not exist;
--    he keeps Torah for the sake of the gathering among the Yahudim (Jews).
--  * The Spirit forbidding Asia / the Macedonian call (16:6-10): the Ruach HaKodesh (Holy
--    Spirit) governs the path of the gathering as the cloud led Yashar'el (Israel). The word
--    is steered to the dispersed — Yahuah directeth the steps; his ways are higher.
--  * Lydia, heart opened (16:14): the FATHER opens the heart. This is the circumcised heart of
--    Deuteronomy 30:6 and the new heart / indwelling Spirit of Ezekiel 36:26-27 — the Spirit
--    inseparable from the statutes (Red Line #6), the hearing revealing what the Father works,
--    never a self-generated belief that creates covenant.
--  * The spirit of divination silenced (16:16-18): the soothsaying spirit is the watcher-taught
--    enchantment (1 Enoch 8:2; forbidden, Deuteronomy 18:10), silenced as Yahusha (Jesus)
--    silenced the devils who confessed him (Luke 4:41) — a true confession from an unclean
--    mouth is still commanded to hold its peace.
--  * Midnight singing / earthquake / bands loosed (16:25-26): songs in the night (Job 35:10;
--    Psalm 119:62), and Yahuah breaking the bands and the gates of brass (Psalm 107:14,16).
--  * Believe and thy house (16:31-34): the HOUSEHOLD covenant — the Passover house under the
--    blood (Exodus 12:23), Joshua's house (Joshua 24:15), Noah's house in the ark (Genesis 7:1),
--    the promise to you and your children and all afar off (Acts 2:39). The seed of the
--    household gathered in the head of the house; NOT a faith-confession that grafts non-seed,
--    but the covenant running through the house as it always did.
--
-- PER-VERSE LIBRARY-COVERAGE CHECKLIST (all three weighed for every block):
--  v.1-3   Timothy circumcised        Tanakh: none added (Paul-keeps-Torah carried by NT Acts 21 target)  Extras: none warranted  NT: Acts 21:24
--  v.4-5   the decrees delivered       Tanakh: none warranted  Extras: none warranted  NT: none added (Acts 15 council carried in the 13-15 range, not re-added)
--  v.6-10  Spirit forbids Asia / Macedonian call  Tanakh: Exodus 13:21 (cloud leads the way), Proverbs 16:9 (Yahuah directeth his steps)  Extras: none warranted  NT: none added (Isaiah 55:8-9 weighed — higher ways — carried thematically, not added)
--  v.11-13 Philippi / by the riverside sabbath  Tanakh: Isaiah 56:6-7 weighed (sabbath-keeper joined, house of prayer) — carried in the eunuch's Isaiah-56 thread already built; not re-added here  Extras: none warranted  NT: none warranted (narrative)
--  v.14-15 Lydia, heart opened          Tanakh: Deuteronomy 30:6 (circumcise thine heart), Ezekiel 36:26, Ezekiel 36:27 (new heart / Spirit causes to walk in statutes)  Extras: none warranted  NT: none added
--  v.16-18 spirit of divination silenced  Tanakh: Deuteronomy 18:10 (divination forbidden)  Extras: 1 Enoch 8:2 (watcher-taught enchantments)  NT: Luke 4:41 (devils suffered not to speak)
--  v.19-24 dragged, beaten, imprisoned  Tanakh: none added  Extras: none warranted  NT: none warranted (narrative; the praise answer threaded at v.25)
--  v.25-26 midnight singing / earthquake / bands loosed  Tanakh: Job 35:10 (songs in the night), Psalm 119:62 (at midnight I rise to give thanks), Psalm 107:14, Psalm 107:16 (brake their bands, broken the gates of brass)  Extras: none warranted  NT: none warranted
--  v.27-34 the keeper saved / believe and thy house  Tanakh: Exodus 12:23 (Passover house), Joshua 24:15 (me and my house), Genesis 7:1 (Noah's house into the ark)  Extras: none warranted  NT: Acts 2:39 (the promise to you, your children, all afar off)
--  v.35-40 Roman citizenship / released  Tanakh: none warranted  Extras: none warranted  NT: none warranted (narrative)
--
-- THREADS (slug -> target libraries):
--   5650 acts-16-circumcised-him-paul-keeping-torah-for-the-gathering            (NT)
--   5653 acts-16-forbidden-of-the-spirit-the-shepherd-leads-the-path             (Tanakh)
--   5656 acts-16-whose-heart-yahuah-opened-the-circumcised-heart-and-the-new-spirit (Tanakh)
--   5659 acts-16-the-spirit-of-divination-silenced                              (Tanakh + Extras + NT)
--   5662 acts-16-songs-in-the-night-the-bands-loosed-the-gates-of-brass-broken  (Tanakh)
--   5665 acts-16-believe-and-thy-house-the-household-covenant                    (Tanakh + NT)
-- =====================================================================

CREATE TEMP VIEW _s217_a16_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: acts-16-circumcised-him-paul-keeping-torah-for-the-gathering
  ('canon', 'acts', 16, 3, 'canon', 'acts', 21, 24, 'free', E'*Them take, and purify thyself with them, and be at charges with them, that they may shave their heads: and all may know that those things, whereof they were informed concerning thee, are nothing; but that thou thyself also walkest orderly, and keepest the law.* (Acts 21:24). *Him would Paul have to go forth with him; and took and circumcised him because of the Yahudim (Jews) which were in those quarters* (Acts 16:3). This is no hypocrisy and no contradiction: Paul is the Torah-observant Yahudi (Jew) who *walkest orderly, and keepest the law,* and circumcises Timothy for the sake of the gathering among the Yahudim (Jews). The Paul who abolished the Torah does not exist; the same hand that wrote the letters keeps the covenant.'),
  -- thread: acts-16-forbidden-of-the-spirit-the-shepherd-leads-the-path
  ('canon', 'acts', 16, 6, 'canon', 'exodus', 13, 21, 'free', E'*And Yahuah (LORD) went before them by day in a pillar of a cloud, to lead them the way; and by night in a pillar of fire, to give them light; to go by day and night:* (Exodus 13:21). As Yahuah (LORD) went before Yashar''el (Israel) in the cloud to lead the way, so the Spirit now leads the way of the gathering: *they had gone throughout Phrygia and the region of Galatia, and were forbidden of the Ruach HaKodesh (Holy Spirit) to preach the word in Asia* (Acts 16:6), and *the Spirit suffered them not* to go into Bithynia (Acts 16:7). The same hand that led the camp leads the word — every closed door a turning of the pillar.'),
  ('canon', 'acts', 16, 9, 'canon', 'proverbs', 16, 9, 'free', E'*A man''s heart deviseth his way: but Yahuah (LORD) directeth his steps.* (Proverbs 16:9). Paul devised to go into Asia and Bithynia, but the Spirit turned him; then *a vision appeared to Paul in the night; There stood a man of Macedonia, and prayed him, saying, Come over into Macedonia, and help us* (Acts 16:9). The man''s heart devised the way, but Yahuah (LORD) directed the steps — the Macedonian call is the Father steering the word to the dispersed, the path chosen not by the apostle but by the One who gathers.'),
  -- thread: acts-16-whose-heart-yahuah-opened-the-circumcised-heart-and-the-new-spirit
  ('canon', 'acts', 16, 14, 'canon', 'deuteronomy', 30, 6, 'free', E'*And Yahuah Elohayka (the LORD thy God) will circumcise thine heart, and the heart of thy seed, to love Yahuah Elohayka (the LORD thy God) with all thine heart, and with all thy soul, that thou mayest live.* (Deuteronomy 30:6). Lydia *worshipped Elohim (God),* and *whose heart Yahuah (Lord) opened, that she attended unto the things which were spoken of Paul* (Acts 16:14). It is the very work Moses promised: Yahuah (LORD) himself circumcising the heart. The opening is his, not hers — the hearing reveals the heart he opened, the love he put there, never a belief she generated to make herself his.'),
  ('canon', 'acts', 16, 14, 'canon', 'ezekiel', 36, 26, 'free', E'*A new heart also will I give you, and a new spirit will I put within you: and I will take away the stony heart out of your flesh, and I will give you an heart of flesh.* (Ezekiel 36:26). When *Yahuah (Lord) opened* Lydia''s heart (Acts 16:14), this is the promise being kept: the stony heart taken away, the heart of flesh given. The attending to the word is the new heart of flesh responding — the Father doing in her what he swore to do for the gathered.'),
  ('canon', 'acts', 16, 14, 'canon', 'ezekiel', 36, 27, 'free', E'*And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them.* (Ezekiel 36:27). The heart Yahuah (Lord) opens he opens for this end: *I will put my spirit within you, and cause you to walk in my statutes.* The Spirit and the statutes are one motion, never opposed — the heart opened to *the things which were spoken* (Acts 16:14) is the heart made able to walk in his ways. Lydia opens her house straightway; the opened heart bears the obedience the Spirit causes.'),
  -- thread: acts-16-the-spirit-of-divination-silenced
  ('canon', 'acts', 16, 16, 'canon', 'deuteronomy', 18, 10, 'free', E'*There shall not be found among you any one that maketh his son or his daughter to pass through the fire, or that useth divination, or an observer of times, or an enchanter, or a witch,* (Deuteronomy 18:10). *A certain damsel possessed with a spirit of divination met us, which brought her masters much gain by soothsaying* (Acts 16:16). The very thing Moses forbade in the covenant — divination, the soothsayer''s gain — stands now in the marketplace and is cast out: the abomination the Torah named is the thing Paul commands to come out.'),
  ('canon', 'acts', 16, 16, 'enoch', '1-enoch', 8, 2, 'extras', E'*And there arose much godlessness, and they committed fornication, and they were led astray, and became corrupt in all their ways. Semjâzâ taught enchantments, and root-cuttings, Armârôs the resolving of enchantments, Barâqîjâl taught astrology, Kôkabêl the constellations, Ezêqêêl the knowledge of the clouds, Araqiêl the signs of the earth, Shamsiêl the signs of the sun, and Sariêl the course of the moon. And as men perished, they cried, and their cry went up to heaven.* (1 Enoch 8:2). The *spirit of divination* (Acts 16:16) is no neutral gift: enchantment and soothsaying are the watcher-taught corruptions, the arts the fallen ones handed to men. Paul commands the spirit out in the name of Yahusha HaMashiach (Jesus Christ) (Acts 16:18) — the One above the watchers undoing what they taught.'),
  ('canon', 'acts', 16, 17, 'canon', 'luke', 4, 41, 'free', E'*And devils also came out of many, crying out, and saying, Thou art Messiah (Christ) the Son of Elohim (God). And he rebuking them suffered them not to speak: for they knew that he was Messiah (Christ).* (Luke 4:41). The spirit cried after Paul, *These men are the servants of the El Elyon (most high God), which shew unto us the way of salvation* (Acts 16:17) — a true word from an unclean mouth. As Yahusha (Jesus) *suffered them not to speak,* so Paul, grieved, commands it silent (Acts 16:18): the confession of devils is not the witness the Father wants, and the unclean spirit is given no platform even when it speaks truth.'),
  -- thread: acts-16-songs-in-the-night-the-bands-loosed-the-gates-of-brass-broken
  ('canon', 'acts', 16, 25, 'canon', 'job', 35, 10, 'free', E'*But none saith, Where is Elohim (God) my maker, who giveth songs in the night;* (Job 35:10). *And at midnight Paul and Silas prayed, and sang praises unto Elohim (God): and the prisoners heard them* (Acts 16:25). In the inner prison, feet fast in the stocks, they sing — for it is Elohim (God) their maker *who giveth songs in the night.* The song in the darkest place is not their strength but his gift, and the prisoners hear it.'),
  ('canon', 'acts', 16, 25, 'canon', 'psalms', 119, 62, 'free', E'*At midnight I will rise to give thanks unto thee because of thy righteous judgments.* (Psalm 119:62). The psalmist''s vow is fulfilled in the prison: *at midnight Paul and Silas prayed, and sang praises unto Elohim (God)* (Acts 16:25). At the hour of deepest dark they rise to give thanks — the praise of the bound rising before the deliverance comes, thanksgiving rooted in his righteous judgments, not in their circumstance.'),
  ('canon', 'acts', 16, 26, 'canon', 'psalms', 107, 14, 'free', E'*He brought them out of darkness and the shadow of death, and brake their bands in sunder.* (Psalm 107:14). *Suddenly there was a great earthquake, so that the foundations of the prison were shaken: and immediately all the doors were opened, and every one''s bands were loosed* (Acts 16:26). The psalm names the deliverer of the prisoner: Yahuah (LORD) who *brake their bands in sunder.* The loosing of every band in the Philippian jail is his hand doing the very thing the psalm sang — the bound brought out of darkness.'),
  ('canon', 'acts', 16, 26, 'canon', 'psalms', 107, 16, 'free', E'*For he hath broken the gates of brass, and cut the bars of iron in sunder.* (Psalm 107:16). The doors of the prison fly open and the bands fall (Acts 16:26) because it is Yahuah (LORD) who *hath broken the gates of brass, and cut the bars of iron in sunder.* No bar of iron holds against him; the earthquake that opens the inner prison is the same power the psalm declared, the gates of the captor broken by the One who frees.'),
  -- thread: acts-16-believe-and-thy-house-the-household-covenant
  ('canon', 'acts', 16, 31, 'canon', 'exodus', 12, 23, 'free', E'*For Yahuah (LORD) will pass through to smite the Egyptians; and when he seeth the blood upon the lintel, and on the two side posts, Yahuah (LORD) will pass over the door, and will not suffer the destroyer to come in unto your houses to smite you.* (Exodus 12:23). *Believe on the Lord Yahusha HaMashiach (Lord Jesus Christ), and thou shalt be saved, and thy house* (Acts 16:31). The covenant has always run through the house: in Egypt the blood on the door covered all within, the destroyer passing over the whole household. So the keeper believes, *and was baptized, he and all his, straightway* (Acts 16:33) — the head of the house and the seed of the house under one covering.'),
  ('canon', 'acts', 16, 31, 'canon', 'joshua', 24, 15, 'free', E'*And if it seem evil unto you to serve Yahuah (LORD), choose you this day whom ye will serve … but as for me and my house, we will serve Yahuah (LORD).* (Joshua 24:15). *Believe on the Lord Yahusha HaMashiach (Lord Jesus Christ), and thou shalt be saved, and thy house* (Acts 16:31). The keeper''s turning is Joshua''s vow renewed — *me and my house* — for *he set meat before them, and rejoiced, believing in Elohim (God) with all his house* (Acts 16:34). The head of the house turns and the house turns with him; the covenant gathers the household in its head.'),
  ('canon', 'acts', 16, 31, 'canon', 'genesis', 7, 1, 'free', E'*And Yahuah (LORD) said unto Noah, Come thou and all thy house into the ark; for thee have I seen righteous before me in this generation.* (Genesis 7:1). The word *thy house* (Acts 16:31) is the old pattern: Noah and *all thy house* brought into the ark, the household carried through the judgment in the one found righteous. So the keeper and *all his* are washed and saved the same hour (Acts 16:33) — the house gathered into safety in the head of the house, as the household was gathered into the ark.'),
  ('canon', 'acts', 16, 31, 'canon', 'acts', 2, 39, 'free', E'*For the promise is unto you, and to your children, and to all that are afar off, even as many as Yahuah Eloheinu (the Lord our God) shall call.* (Acts 2:39). *Believe on the Lord Yahusha HaMashiach (Lord Jesus Christ), and thou shalt be saved, and thy house* (Acts 16:31). Peter named it at the first: the promise reaches *you, and your children, and all that are afar off* — the dispersed of the house made nigh. The keeper''s household is that promise landing on a house far off, the children included with the father, *as many as Yahuah Eloheinu (the Lord our God) shall call.*')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s217_a16_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s217_a16_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-16-circumcised-him-paul-keeping-torah-for-the-gathering',
       E'Circumcised him — Paul keeping Torah for the gathering',
       E'At Lystra Paul finds Timothy, *the son of a certain woman, which was a Yahudi (Jewess), and believed; but his father was a Greek* (Acts 16:1), and *him would Paul have to go forth with him; and took and circumcised him because of the Yahudim (Jews) which were in those quarters* (Acts 16:3). The inherited reading hears a contradiction here — the Paul who supposedly abolished circumcision now circumcising his companion. There is no contradiction, because that Paul does not exist. This is the Torah-observant Yahudi (Jew) of the tribe of Benjamin who never left the covenant, keeping it for the sake of the gathering. Years later the elders at Jerusalem name him plainly: *that thou thyself also walkest orderly, and keepest the law* (Acts 21:24). The same hand that wrote the letters circumcises Timothy and keeps the Torah; the persecutor-made-vessel carries the name to the scattered without ever forsaking Moses. The circumcision is covenant fidelity, not compromise — Paul walking orderly so the Yahudim (Jews) might receive the word.',
       sv.verse_id, ev.verse_id, 'free', 5650
  FROM _s217_a16_lookup sv, _s217_a16_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=16 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=16 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-16-forbidden-of-the-spirit-the-shepherd-leads-the-path',
       E'Forbidden of the Spirit — the Shepherd leads the path',
       E'The apostles move through Phrygia and Galatia *and were forbidden of the Ruach HaKodesh (Holy Spirit) to preach the word in Asia* (Acts 16:6); they assay to enter Bithynia, *but the Spirit suffered them not* (Acts 16:7). Then in the night a man of Macedonia stands and pleads, *Come over into Macedonia, and help us* (Acts 16:9). This is not the apostles charting their own mission — it is the Spirit steering the path of the gathering, as Yahuah (LORD) once steered the camp: *Yahuah (LORD) went before them by day in a pillar of a cloud, to lead them the way; and by night in a pillar of fire, to give them light* (Exodus 13:21). Every closed door is a turning of the pillar. *A man''s heart deviseth his way: but Yahuah (LORD) directeth his steps* (Proverbs 16:9) — Paul devised Asia and Bithynia, but the One who gathers directed the steps toward Macedonia, toward the dispersed waiting for the word. The path is not the apostle''s; it is the Shepherd''s, leading the word to the lost sheep he means to reach.',
       sv.verse_id, ev.verse_id, 'free', 5653
  FROM _s217_a16_lookup sv, _s217_a16_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=16 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=16 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-16-whose-heart-yahuah-opened-the-circumcised-heart-and-the-new-spirit',
       E'Whose heart Yahuah (Lord) opened — the circumcised heart and the new spirit',
       E'By the riverside on the sabbath, where prayer was wont to be made, a woman named Lydia *which worshipped Elohim (God), heard us: whose heart Yahuah (Lord) opened, that she attended unto the things which were spoken of Paul* (Acts 16:14). The opening is the Father''s work, not hers. It is the promise Moses spoke at the edge of the land: *Yahuah Elohayka (the LORD thy God) will circumcise thine heart, and the heart of thy seed, to love Yahuah Elohayka (the LORD thy God) with all thine heart* (Deuteronomy 30:6). It is the new covenant Ezekiel saw: *a new heart also will I give you, and a new spirit will I put within you: and I will take away the stony heart out of your flesh, and I will give you an heart of flesh* (Ezekiel 36:26). And it does not stop at sentiment — *I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them* (Ezekiel 36:27). The Spirit and the statutes are one motion, never opposed. Lydia''s opened heart attends to the word and at once opens her house; the hearing reveals the heart the Father opened, the love he put there, the obedience the Spirit causes — not a belief she manufactured to make herself his, but the Father doing in her what he swore to do.',
       sv.verse_id, ev.verse_id, 'free', 5656
  FROM _s217_a16_lookup sv, _s217_a16_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=16 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=16 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-16-the-spirit-of-divination-silenced',
       E'The spirit of divination silenced',
       E'A damsel *possessed with a spirit of divination* meets them, *which brought her masters much gain by soothsaying* (Acts 16:16), and follows them crying, *These men are the servants of the El Elyon (most high God), which shew unto us the way of salvation* (Acts 16:17). The words are true, yet Paul, grieved, commands the spirit out in the name of Yahusha HaMashiach (Jesus Christ) (Acts 16:18). Two things stand together here. First, divination is no neutral art: the Torah forbade it within the covenant — *there shall not be found among you … one that useth divination, or an observer of times, or an enchanter* (Deuteronomy 18:10) — and the older witness names its source, the fallen watchers who *taught enchantments, and root-cuttings … astrology … the constellations* (1 Enoch 8:2), corruptions handed to men. Second, a true confession from an unclean mouth is still silenced. As Yahusha (Jesus) cast out devils who cried *Thou art Messiah (Christ) the Son of Elohim (God)* and *rebuking them suffered them not to speak* (Luke 4:41), so Paul gives the divining spirit no platform. The witness the Father wants does not come from the mouth of the watcher-taught spirit; the way of salvation is not proclaimed by the thing that must be cast out.',
       sv.verse_id, ev.verse_id, 'extras', 5659
  FROM _s217_a16_lookup sv, _s217_a16_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=16 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=16 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-16-songs-in-the-night-the-bands-loosed-the-gates-of-brass-broken',
       E'Songs in the night — the bands loosed, the gates of brass broken',
       E'Beaten, thrust into the inner prison, their feet fast in the stocks, *at midnight Paul and Silas prayed, and sang praises unto Elohim (God): and the prisoners heard them* (Acts 16:25). The song in the darkest place is not their strength but a gift — for it is Elohim (God) their maker *who giveth songs in the night* (Job 35:10), and the psalmist''s vow is theirs: *at midnight I will rise to give thanks unto thee because of thy righteous judgments* (Psalm 119:62). Thanksgiving rises before the deliverance comes. Then *suddenly there was a great earthquake, so that the foundations of the prison were shaken: and immediately all the doors were opened, and every one''s bands were loosed* (Acts 16:26). This is the deliverer the psalms sang long before: Yahuah (LORD) who *brought them out of darkness and the shadow of death, and brake their bands in sunder* (Psalm 107:14), who *hath broken the gates of brass, and cut the bars of iron in sunder* (Psalm 107:16). No bar of iron holds against him. The praise of the bound and the breaking of their bands are one story — the One who gives the song in the night is the One who opens the door.',
       sv.verse_id, ev.verse_id, 'free', 5662
  FROM _s217_a16_lookup sv, _s217_a16_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=16 AND sv.verse_number=25
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=16 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-16-believe-and-thy-house-the-household-covenant',
       E'Believe and thy house — the household covenant',
       E'The keeper of the prison, trembling, falls before Paul and Silas and asks, *Sirs, what must I do to be saved?* (Acts 16:30). The answer is *Believe on the Lord Yahusha HaMashiach (Lord Jesus Christ), and thou shalt be saved, and thy house* (Acts 16:31) — and *he was baptized, he and all his, straightway,* and *rejoiced, believing in Elohim (God) with all his house* (Acts 16:33-34). *And thy house* is no afterthought; it is the oldest pattern of the covenant. In Egypt the blood on the door covered everyone within: *when he seeth the blood upon the lintel … Yahuah (LORD) will pass over the door, and will not suffer the destroyer to come in unto your houses to smite you* (Exodus 12:23). Noah and *all thy house* were brought into the ark, carried through the judgment in the one found righteous (Genesis 7:1). Joshua set his vow for the whole household: *as for me and my house, we will serve Yahuah (LORD)* (Joshua 24:15). And Peter had named the reach of the promise at the first: *the promise is unto you, and to your children, and to all that are afar off, even as many as Yahuah Eloheinu (the Lord our God) shall call* (Acts 2:39). The keeper''s household is that promise landing on a house far off — the head of the house turning and the seed of the house gathered with him, the covenant running through the household as it always has.',
       sv.verse_id, ev.verse_id, 'free', 5665
  FROM _s217_a16_lookup sv, _s217_a16_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=16 AND sv.verse_number=30
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=16 AND ev.verse_number=34
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: acts-16-circumcised-him-paul-keeping-torah-for-the-gathering
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Acts 21:24 — *that thou thyself also walkest orderly, and keepest the law* the elders name Paul Torah-keeping; the same hand circumcises Timothy (Acts 16:3).'
  FROM cross_reference_threads t, cross_references x, _s217_a16_lookup sv, _s217_a16_lookup tv
 WHERE t.slug='acts-16-circumcised-him-paul-keeping-torah-for-the-gathering'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=16 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=21 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-16-forbidden-of-the-spirit-the-shepherd-leads-the-path
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 13:21 — *Yahuah (LORD) went before them … in a pillar of a cloud, to lead them the way* the Spirit forbidding Asia is the pillar turning the path of the gathering (Acts 16:6).'
  FROM cross_reference_threads t, cross_references x, _s217_a16_lookup sv, _s217_a16_lookup tv
 WHERE t.slug='acts-16-forbidden-of-the-spirit-the-shepherd-leads-the-path'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=16 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=13 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 16:9 — *A man''s heart deviseth his way: but Yahuah (LORD) directeth his steps* the Macedonian call is the Father steering the steps Paul did not choose (Acts 16:9).'
  FROM cross_reference_threads t, cross_references x, _s217_a16_lookup sv, _s217_a16_lookup tv
 WHERE t.slug='acts-16-forbidden-of-the-spirit-the-shepherd-leads-the-path'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=16 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=16 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-16-whose-heart-yahuah-opened-the-circumcised-heart-and-the-new-spirit
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 30:6 — *Yahuah Elohayka (the LORD thy God) will circumcise thine heart* the heart-opening is the Father''s circumcising work, not Lydia''s own (Acts 16:14).'
  FROM cross_reference_threads t, cross_references x, _s217_a16_lookup sv, _s217_a16_lookup tv
 WHERE t.slug='acts-16-whose-heart-yahuah-opened-the-circumcised-heart-and-the-new-spirit'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=16 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 36:26 — *a new heart … and a new spirit will I put within you … an heart of flesh* the stony heart taken away; Lydia''s opened heart is the promise kept (Acts 16:14).'
  FROM cross_reference_threads t, cross_references x, _s217_a16_lookup sv, _s217_a16_lookup tv
 WHERE t.slug='acts-16-whose-heart-yahuah-opened-the-circumcised-heart-and-the-new-spirit'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=16 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 36:27 — *I will put my spirit within you, and cause you to walk in my statutes* the Spirit and the statutes one motion; the opened heart bears obedience (Acts 16:14-15).'
  FROM cross_reference_threads t, cross_references x, _s217_a16_lookup sv, _s217_a16_lookup tv
 WHERE t.slug='acts-16-whose-heart-yahuah-opened-the-circumcised-heart-and-the-new-spirit'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=16 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-16-the-spirit-of-divination-silenced
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 18:10 — *one that useth divination, or an observer of times, or an enchanter* the very abomination the Torah forbade now cast out of the soothsaying damsel (Acts 16:16).'
  FROM cross_reference_threads t, cross_references x, _s217_a16_lookup sv, _s217_a16_lookup tv
 WHERE t.slug='acts-16-the-spirit-of-divination-silenced'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=16 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=18 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 8:2 — *Semjâzâ taught enchantments, and root-cuttings … Barâqîjâl taught astrology* the watcher-source of the divining art Paul commands out (Acts 16:16,18).'
  FROM cross_reference_threads t, cross_references x, _s217_a16_lookup sv, _s217_a16_lookup tv
 WHERE t.slug='acts-16-the-spirit-of-divination-silenced'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=16 AND sv.verse_number=16
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=8 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Luke 4:41 — *he rebuking them suffered them not to speak* a true confession from an unclean mouth is silenced, as Paul silences the divining spirit (Acts 16:17-18).'
  FROM cross_reference_threads t, cross_references x, _s217_a16_lookup sv, _s217_a16_lookup tv
 WHERE t.slug='acts-16-the-spirit-of-divination-silenced'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=16 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=4 AND tv.verse_number=41
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-16-songs-in-the-night-the-bands-loosed-the-gates-of-brass-broken
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Job 35:10 — *Elohim (God) my maker, who giveth songs in the night* the midnight praise of Paul and Silas is his gift, not their strength (Acts 16:25).'
  FROM cross_reference_threads t, cross_references x, _s217_a16_lookup sv, _s217_a16_lookup tv
 WHERE t.slug='acts-16-songs-in-the-night-the-bands-loosed-the-gates-of-brass-broken'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=16 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=35 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 119:62 — *At midnight I will rise to give thanks unto thee* the psalmist''s vow fulfilled in the prison, thanks before deliverance (Acts 16:25).'
  FROM cross_reference_threads t, cross_references x, _s217_a16_lookup sv, _s217_a16_lookup tv
 WHERE t.slug='acts-16-songs-in-the-night-the-bands-loosed-the-gates-of-brass-broken'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=16 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=119 AND tv.verse_number=62
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 107:14 — *He brought them out of darkness … and brake their bands in sunder* the deliverer of the prisoner; every band loosed in the quake (Acts 16:26).'
  FROM cross_reference_threads t, cross_references x, _s217_a16_lookup sv, _s217_a16_lookup tv
 WHERE t.slug='acts-16-songs-in-the-night-the-bands-loosed-the-gates-of-brass-broken'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=16 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=107 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 107:16 — *he hath broken the gates of brass, and cut the bars of iron in sunder* no bar holds against him; the prison doors fly open (Acts 16:26).'
  FROM cross_reference_threads t, cross_references x, _s217_a16_lookup sv, _s217_a16_lookup tv
 WHERE t.slug='acts-16-songs-in-the-night-the-bands-loosed-the-gates-of-brass-broken'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=16 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=107 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-16-believe-and-thy-house-the-household-covenant
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 12:23 — *Yahuah (LORD) will pass over the door, and will not suffer the destroyer to come in unto your houses* the Passover blood covers the whole house, as the keeper''s house is saved (Acts 16:31,33).'
  FROM cross_reference_threads t, cross_references x, _s217_a16_lookup sv, _s217_a16_lookup tv
 WHERE t.slug='acts-16-believe-and-thy-house-the-household-covenant'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=16 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Joshua 24:15 — *as for me and my house, we will serve Yahuah (LORD)* the head of the house turns and the house turns with him (Acts 16:31,34).'
  FROM cross_reference_threads t, cross_references x, _s217_a16_lookup sv, _s217_a16_lookup tv
 WHERE t.slug='acts-16-believe-and-thy-house-the-household-covenant'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=16 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=24 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 7:1 — *Come thou and all thy house into the ark* the household carried through judgment in the one found righteous (Acts 16:31,33).'
  FROM cross_reference_threads t, cross_references x, _s217_a16_lookup sv, _s217_a16_lookup tv
 WHERE t.slug='acts-16-believe-and-thy-house-the-household-covenant'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=16 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=7 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Acts 2:39 — *the promise is unto you, and to your children, and to all that are afar off* the keeper''s house is the promise landing on a house far off (Acts 16:31).'
  FROM cross_reference_threads t, cross_references x, _s217_a16_lookup sv, _s217_a16_lookup tv
 WHERE t.slug='acts-16-believe-and-thy-house-the-household-covenant'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=16 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=2 AND tv.verse_number=39
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
