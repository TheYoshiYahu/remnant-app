-- =====================================================================
-- Session 436 — Order of the end: new witnesses for the first resurrection,
-- the remnant kept, the shut-up prison, and the one judgment
-- =====================================================================
-- Adds curated cross-references (source='manual'):
--   1 Thessalonians 4:16 -> Isaiah 26:20, Isaiah 26:14, 2 Esdras 13:49
--   1 Thessalonians 4:15 -> 2 Esdras 13:24
--   Revelation 20:7      -> Isaiah 24:22
--   Revelation 20:4      -> Testament of Judah 25:1   (testaments-xii ch 60)
--   Revelation 11:18     -> Testament of Benjamin 10:8 (testaments-xii ch 140)
--   Revelation 20:12     -> Testament of Benjamin 10:8 (testaments-xii ch 140)
--   2 Esdras 7:30        -> Jeremiah 4:23
-- Already present, not re-added: 1 Thess 4:16 -> Isaiah 26:19 (session233);
--   Revelation 20:3 -> Isaiah 24:22 (session224).
-- Adds one thread (sort 8137, in the 1 Thessalonians 4 band of session233).
-- Tiers per-row: canon target = 'free'; extra-canonical target = 'extras'.
-- Lookup-joined: a missing verse inserts nothing. Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py data-schema/migrations/session436_order_of_end_new_witness_xrefs.sql
-- =====================================================================

\echo 'session436 — order-of-end new witness cross-references starting...'
BEGIN;

CREATE TEMP VIEW _s436_lu AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ----- cross_references -----
WITH input(src_edition, src_slug, src_ch, src_v, tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  ('canon','1-thessalonians',4,16, 'canon','isaiah',26,20, 'free', E'*Thy dead men shall live, together with my dead body shall they arise. Awake and sing, ye that dwell in dust: for thy dew is as the dew of herbs, and the earth shall cast out the dead. Come, my people, enter thou into thy chambers, and shut thy doors about thee: hide thyself as it were for a little moment, until the indignation be overpast. For, behold, Yahuah (LORD) cometh out of his place to punish the inhabitants of the earth for their iniquity: the earth also shall disclose her blood, and shall no more cover her slain.* (Isaiah 26:19-21). Isaiah sets the raising of the dead and the hiding of the living in one breath, and both inside the hour when *Yahuah (LORD) cometh out of his place to punish the inhabitants of the earth*. So Paul: *Yahusha (Lord) himself shall descend from heaven with a shout... and the dead in Messiah (Christ) shall rise first* (1 Thessalonians 4:16). While the indignation falls on the earth, his people are shut in their chambers *until the indignation be overpast* — the remnant kept through the wrath and saved out of it.'),
  ('canon','1-thessalonians',4,16, 'canon','isaiah',26,14, 'free', E'*O Yahuah (LORD) our Elohim (God), other lords beside thee have had dominion over us: but by thee only will we make mention of thy name. They are dead, they shall not live; they are deceased, they shall not rise: therefore hast thou visited and destroyed them, and made all their memory to perish.* (Isaiah 26:13-14). The same song that sings *Thy dead men shall live* (Isaiah 26:19) says of the other lords who ruled over the people, *they are deceased, they shall not rise*. Two companies of the dead stand in one chapter: his dead, who arise, and those who are not raised with them. So when *the dead in Messiah (Christ) shall rise first* (1 Thessalonians 4:16), the rising is of his own, the righteous of the seed, and not of all who sleep; *the rest of the dead lived not again until the thousand years were finished* (Revelation 20:5).'),
  ('canon','1-thessalonians',4,15, 'apocrypha','2-esdras',13,24, 'extras', E'*Whereas you have spoken of them that are left behind, this is the interpretation: He that shall endure the peril in that time has kept himself: they that be fallen into danger are such as have works, and faith toward the Almighty. Know this therefore, that they which be left behind are more blessed than they that be dead.* (2 Esdras 13:22-24). Paul speaks of the same company: *we which are alive and remain unto the coming of Yahusha (Lord)* (1 Thessalonians 4:15). Esdras is told that those *left behind* in that time are the ones who endured the peril and kept themselves, a people with *works, and faith toward the Almighty,* and that they *are more blessed than they that be dead.* To remain is not to be left out: the living remnant who endure to his coming are kept through the peril and gathered.'),
  ('canon','1-thessalonians',4,16, 'apocrypha','2-esdras',13,49, 'extras', E'*But those that be left behind of your people are they that are found within my borders. Now when he destroys the multitude of the nations that are gathered together, he shall defend his people that remain. And then shall he shew them great wonders.* (2 Esdras 13:48-50). The vision sets the wrath and the keeping in one hour: *he destroys the multitude of the nations that are gathered together,* and in that same hour *he shall defend his people that remain.* So *Yahusha (Lord) himself shall descend from heaven with a shout* (1 Thessalonians 4:16) into the day of wrath on the gathered nations: the dead in Messiah (Christ) raised, and the living remnant defended while the wrath falls.'),
  ('canon','revelation',20,7, 'canon','isaiah',24,22, 'free', E'*And it shall come to pass in that day, that Yahuah (LORD) shall punish the host of the high ones that are on high, and the kings of the earth upon the earth. And they shall be gathered together, as prisoners are gathered in the pit, and shall be shut up in the prison, and after many days shall they be visited. Then the moon shall be confounded, and the sun ashamed, when Yahuah Tseva''ot (LORD of hosts) shall reign in mount Zion, and in Jerusalem, and before his ancients gloriously.* (Isaiah 24:21-23). Isaiah saw the host on high *gathered in the pit* and *shut up in the prison,* while *Yahuah Tseva''ot (LORD of hosts) shall reign in mount Zion*. The shutting up is not the end of them: *after many days shall they be visited.* John sees the prison opened when the many days of the reign are done: *when the thousand years are expired, Satan shall be loosed out of his prison* (Revelation 20:7) — the little season, before the last judgment.'),
  ('canon','revelation',20,4, 'pseudepigrapha','testaments-xii',60,1, 'extras', E'*And after these things shall Abraham and Isaac and Jacob arise unto life, and I and my brethren shall be chiefs of the tribes ''of Israel'': Levi first, I the second, Joseph third, Benjamin fourth, Simeon fifth, Issachar sixth, and so all in order... And ye shall be the people of Yahuah (Lord), and have one tongue; And there shall be there no spirit of deceit of ''Beliar'', For he shall be cast into the fire for ever. And they who have died in grief shall arise ''in joy'', ''And they who were poor for Yahuah''s (Lord''s) sake shall be made rich,'' And they who are put to death for Yahuah''s (Lord''s) sake shall awake ''to life''.* (Testament of Judah 25:1, 3-4). John sees *the souls of them that were beheaded for the witness of Yahusha (Jesus)... and they lived and reigned with Messiah (Christ) a thousand years* (Revelation 20:4). Judah''s testament holds the same rising: the fathers *arise unto life,* the sons stand as *chiefs of the tribes* *all in order,* and *they who are put to death for Yahuah''s (Lord''s) sake shall awake ''to life''.* The first resurrection raises the fathers and the faithful slain into an ordered kingdom of the tribes, and the deceiver has no place among them, as John sees him shut in the pit *that he should deceive the nations no more* (Revelation 20:3), until his end in the fire.'),
  ('canon','revelation',11,18, 'pseudepigrapha','testaments-xii',140,8, 'extras', E'*''And'' then shall ye see Enoch, Noah, and Shem, and Abraham, and Isaac, and Jacob, rising on the right hand in gladness. Then shall we also rise, each one over our tribe, worshipping the King of heaven... Then also all men shall rise, some unto glory and some unto shame. And Yahuah (Lord) shall judge Yashar''el (Israel) first, for their unrighteousness... And then shall He judge all the Gentiles...* (Testament of Benjamin 10:6-9). Benjamin sets the rising in order: the fathers first, then the sons each over his tribe, and last *all men shall rise, some unto glory and some unto shame,* and then the judging. Revelation names that last hour: *the time of the dead, that they should be judged* (Revelation 11:18). The fathers and the tribes rise before; the rising of all men, to glory or to shame, comes at the time of the dead, when the one judgment is set.'),
  ('canon','revelation',20,12, 'pseudepigrapha','testaments-xii',140,8, 'extras', E'*''And'' then shall ye see Enoch, Noah, and Shem, and Abraham, and Isaac, and Jacob, rising on the right hand in gladness. Then shall we also rise, each one over our tribe, worshipping the King of heaven... Then also all men shall rise, some unto glory and some unto shame. And Yahuah (Lord) shall judge Yashar''el (Israel) first, for their unrighteousness... And then shall He judge all the Gentiles...* (Testament of Benjamin 10:6-9). John sees *the dead, small and great, stand before Elohim (God)... and the dead were judged out of those things which were written in the books, according to their works* (Revelation 20:12). Benjamin''s *all men shall rise, some unto glory and some unto shame* is that standing of small and great: the rising first, then the judging.'),
  ('apocrypha','2-esdras',7,30, 'canon','jeremiah',4,23, 'free', E'*I beheld the earth, and, lo, it was without form, and void; and the heavens, and they had no light. I beheld the mountains, and, lo, they trembled, and all the hills moved lightly. I beheld, and, lo, there was no man, and all the birds of the heavens were fled. I beheld, and, lo, the fruitful place was a wilderness, and all the cities thereof were broken down at the presence of Yahuah (LORD), and by his fierce anger.* (Jeremiah 4:23-26). Esdras is told that *the world shall be turned into the old silence seven days, like as in the former judgments: so that no man shall remain* (2 Esdras 7:30). Jeremiah was shown the like: the earth *without form, and void,* the heavens without light, and *lo, there was no man*. These are the words of the earth before the first day, when *the earth was without form, and void; and darkness was upon the face of the deep* (Genesis 1:2); the old silence is the earth returned to that first stillness, no man remaining, before *the earth shall restore those that are asleep in her* (2 Esdras 7:32).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s436_lu sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s436_lu tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- thread -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-thessalonians-4-the-first-resurrection-of-the-righteous-and-the-remnant-kept-isaiah-26-2-esdras-13',
       E'The first resurrection of the righteous and the remnant kept through the indignation (Isaiah 26, 2 Esdras 13)',
       E'*For this we say unto you by the word of Yahusha (Lord), that we which are alive and remain unto the coming of Yahusha (Lord) shall not prevent them which are asleep. For Yahusha (Lord) himself shall descend from heaven with a shout, with the voice of the archangel, and with the trump of Elohim (God): and the dead in Messiah (Christ) shall rise first:* (1 Thessalonians 4:15-16)\n\nIsaiah''s song sets this hour out in full. There are two companies of the dead: *Thy dead men shall live* (Isaiah 26:19), and of the other lords, *they are deceased, they shall not rise* (Isaiah 26:14). The first resurrection is of his own, the righteous of the seed. And the living are hidden through the wrath, not spared the hour of it: *Come, my people, enter thou into thy chambers, and shut thy doors about thee: hide thyself as it were for a little moment, until the indignation be overpast* (Isaiah 26:20), in the very hour *Yahuah (LORD) cometh out of his place to punish the inhabitants of the earth* (Isaiah 26:21).\n\nThe restored library holds the same pair. Esdras is told that *they which be left behind are more blessed than they that be dead* (2 Esdras 13:24), and that *when he destroys the multitude of the nations that are gathered together, he shall defend his people that remain* (2 Esdras 13:49). The coming of verse 16 falls while the wrath falls: the righteous dead raised, the living remnant kept, defended, and gathered home. The catching-up of the next verse, *Then we which are alive and remain shall be caught up together with them in the clouds* (1 Thessalonians 4:17), is another hour, after the reign.',
       sv.verse_id, ev.verse_id, 'extras', 8137
  FROM _s436_lu sv, _s436_lu ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=4 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='1-thessalonians' AND ev.chapter_number=4 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 26:19 — *Thy dead men shall live, together with my dead body shall they arise* his dead rise at his coming; *the dead in Messiah (Christ) shall rise first* (1 Thessalonians 4:16).'
  FROM cross_reference_threads t, cross_references x, _s436_lu sv, _s436_lu tv
 WHERE t.slug='1-thessalonians-4-the-first-resurrection-of-the-righteous-and-the-remnant-kept-isaiah-26-2-esdras-13'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=4 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=26 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 26:14 — *they are deceased, they shall not rise* the other lords not raised with them; the first resurrection is of the righteous only (1 Thessalonians 4:16).'
  FROM cross_reference_threads t, cross_references x, _s436_lu sv, _s436_lu tv
 WHERE t.slug='1-thessalonians-4-the-first-resurrection-of-the-righteous-and-the-remnant-kept-isaiah-26-2-esdras-13'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=4 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=26 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 26:20 — *hide thyself as it were for a little moment, until the indignation be overpast* the remnant kept through the wrath while he comes (1 Thessalonians 4:16).'
  FROM cross_reference_threads t, cross_references x, _s436_lu sv, _s436_lu tv
 WHERE t.slug='1-thessalonians-4-the-first-resurrection-of-the-righteous-and-the-remnant-kept-isaiah-26-2-esdras-13'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=4 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=26 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Esdras 13:24 — *they which be left behind are more blessed than they that be dead* the living who remain to his coming, kept through the peril (1 Thessalonians 4:15).'
  FROM cross_reference_threads t, cross_references x, _s436_lu sv, _s436_lu tv
 WHERE t.slug='1-thessalonians-4-the-first-resurrection-of-the-righteous-and-the-remnant-kept-isaiah-26-2-esdras-13'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=4 AND sv.verse_number=15
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=13 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'2 Esdras 13:49 — *when he destroys the multitude of the nations that are gathered together, he shall defend his people that remain* the wrath and the keeping in one hour (1 Thessalonians 4:16).'
  FROM cross_reference_threads t, cross_references x, _s436_lu sv, _s436_lu tv
 WHERE t.slug='1-thessalonians-4-the-first-resurrection-of-the-righteous-and-the-remnant-kept-isaiah-26-2-esdras-13'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=4 AND sv.verse_number=16
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=13 AND tv.verse_number=49
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

COMMIT;
\echo 'session436 — order-of-end new witness cross-references complete.'
