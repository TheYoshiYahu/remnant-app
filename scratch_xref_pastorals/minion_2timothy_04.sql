-- ----- fragment: minion_2timothy_04.sql (S236 2 Timothy 4) -----
-- =====================================================================
-- S236 minion — 2 TIMOTHY 4 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 2 TIMOTHY 4 (22 verses) — THE FINAL CHARGE: preach the word, the crown
-- of righteousness, I have finished my course. Paul's last words as he faces death.
-- Tag: t236c4 (temp view _s236_t236c4_lookup).
-- Sort band: floor 8625, 25-wide (8625, 8626, 8627, 8628 used; under 8650).
-- Source is ALWAYS the canon 2 Timothy verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (2 Timothy = the charge to endure; the deposit, the sound words, the inspired
-- Tanakh, and the crown of righteousness belong to the one olive tree. No replacement theology,
-- no two-covenant split, no law-vs-grace antithesis. Christology = the Formed: the Father judges
-- and rewards through the Formed Son, *the Lord, the righteous judge, shall give me at that day*.)
-- Chapter 4 opens the charge before the appearing and the judgment (4:1), commands Timothy to
-- *preach the word* against the coming itching-ears apostasy that *will not endure sound doctrine*
-- and is *turned unto fables* (4:2-4) — the very turning the prophets named, who told the seers
-- *prophesy not unto us right things, speak unto us smooth things* (Isaiah 30:10) and warned that
-- *my people love to have it so* (Jeremiah 5:31). Then Paul, *ready to be offered,* reckons the
-- finished course: *Henceforth there is laid up for me a crown of righteousness, which Yahuah
-- (Lord), the righteous judge, shall give me at that day* (4:8) — the judgment-throne of Daniel 7,
-- the reward of the righteous the Hebrew library beheld (*a beautiful crown from the hand of
-- Yahuah,* Wisdom 5:16), the prize and incorruptible crown and crown of life the NT names. The
-- judge who renders the crown is the One who *reward[s] him according to his works* (4:14) — the
-- Tanakh's settled rule, *thou renderest to every man according to his work* (Psalm 62:12). And the
-- One who *stood with me... and I was delivered out of the mouth of the lion* (4:17) is the deliverer
-- of Psalm 22 and the God who *shut the lions' mouths* for Daniel (Daniel 6:22). No co-equal-persons
-- grammar: the Father judges, rewards, and delivers through the Formed Son.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1     I charge thee before Elohim... who shall judge the quick and the dead at his appearing
--           Tanakh: Daniel 7:9-10 (carried in the crown thread, the judgment set and the books opened)
--           Extras: none warranted   NT: none warranted (the appearing/judgment carried at v.8)
--   v.2-4   preach the word; they will not endure sound doctrine; itching ears; turned unto fables
--           Tanakh: Isaiah 30:9-11 (lying children... speak unto us smooth things, prophesy deceits),
--                   Jeremiah 5:31 (the prophets prophesy falsely... my people love to have it so)
--           Extras: none warranted (the prophetic root carries the weight; no clean extras add)
--           NT: none warranted (the watchman/preach-the-word weight rests on the Tanakh prophets)
--   v.5-6   do the work of an evangelist; I am now ready to be offered
--           Tanakh: none warranted (drink-offering imagery carried in prose, no single load-bearing verse)
--           Extras: none warranted   NT: none warranted
--   v.7-8   I have fought a good fight... a crown of righteousness, which Yahuah the righteous judge
--           shall give me at that day; unto all them also that love his appearing
--           Tanakh: Daniel 7:9-10 (the Ancient of days, the judgment set, the books opened)
--           Extras: Wisdom of Solomon 5:15-16 (the righteous live for evermore; their reward is with
--                   Yahuah; a glorious kingdom, and a beautiful crown from the hand of Yahuah)
--           NT: Philippians 3:14 (the prize of the high calling), 1 Corinthians 9:25 (the
--                   incorruptible crown), Revelation 2:10 (be faithful unto death, a crown of life)
--   v.9-13  Demas forsook me; only Luke; bring Mark, the cloke, the books and parchments
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted (personal narrative)
--   v.14-15 Alexander the coppersmith... Yahuah reward him according to his works
--           Tanakh: Psalm 62:12 (thou renderest to every man according to his work),
--                   Proverbs 24:12 (shall not he render to every man according to his works?)
--           Extras: none warranted   NT: Romans 2:6 (who will render to every man according to his deeds)
--   v.16-18 the Lord stood with me... I was delivered out of the mouth of the lion
--           Tanakh: Psalm 22:21 (save me from the lion's mouth), Daniel 6:22 (hath shut the lions'
--                   mouths, that they have not hurt me)
--           Extras: none warranted   NT: none warranted (the deliverance root is the Tanakh)
--   v.19-22 salutations; Grace be with you
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted
--
-- THREADS (slug -> target libraries):
--   8625 2-timothy-4-preach-the-word-against-itching-ears-turned-unto-fables-isaiah-30-jeremiah-5  (Tanakh)
--   8626 2-timothy-4-the-crown-of-righteousness-the-righteous-judge-at-that-day-daniel-7  (Tanakh + Extras + NT)
--   8627 2-timothy-4-reward-him-according-to-his-works-psalm-62-proverbs-24  (Tanakh + NT)
--   8628 2-timothy-4-delivered-out-of-the-mouth-of-the-lion-psalm-22-daniel-6  (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s236_t236c4_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-timothy-4-preach-the-word-against-itching-ears-turned-unto-fables-isaiah-30-jeremiah-5
  ('canon', '2-timothy', 4, 3, 'canon', 'isaiah', 30, 10, 'free', E'*Which say to the seers, See not; and to the prophets, Prophesy not unto us right things, speak unto us smooth things, prophesy deceits:* (Isaiah 30:10). Isaiah names the rebellion that *will not hear the law of Yahuah (LORD)* (Isaiah 30:9) — a people who demand *smooth things* from the prophets and refuse the right word. Paul foresees the same turning: *the time will come when they will not endure sound doctrine; but after their own lusts shall they heap to themselves teachers, having itching ears* (2 Timothy 4:3). The itching ears that crave smooth things are the lying children of Isaiah''s day; the apostasy Paul charges Timothy to preach against is no new thing but the old refusal of the word of Yahuah (LORD).'),
  ('canon', '2-timothy', 4, 4, 'canon', 'jeremiah', 5, 31, 'free', E'*The prophets prophesy falsely, and the priests bear rule by their means; and my people love to have it so: and what will ye do in the end thereof?* (Jeremiah 5:31). Jeremiah sees a people who *love to have it so* — who welcome the false word because it flatters. Paul writes that the itching-eared *shall turn away their ears from the truth, and shall be turned unto fables* (2 Timothy 4:4). The fables Paul names are the false prophesying Jeremiah condemned; against this Timothy is charged, *Preach the word; be instant in season, out of season* (2 Timothy 4:2) — the watchman''s charge to speak the truth though the people love the lie, and to ask with Jeremiah, *what will ye do in the end thereof?*'),
  -- thread: 2-timothy-4-the-crown-of-righteousness-the-righteous-judge-at-that-day-daniel-7
  ('canon', '2-timothy', 4, 1, 'canon', 'daniel', 7, 9, 'free', E'*I beheld till the thrones were cast down, and the Ancient of days did sit, whose garment was white as snow, and the hair of his head like the pure wool: his throne was like the fiery flame, and his wheels as burning fire.* (Daniel 7:9). Paul charges Timothy *before Elohim (God), and the Lord Yahusha HaMashiach (Lord Jesus Christ), who shall judge the quick and the dead at his appearing and his kingdom* (2 Timothy 4:1). Daniel saw that very court convened: the Ancient of days seated on the throne of fire, and *one like the Son of Adam* brought near to receive the kingdom. The judgment-throne behind Paul''s charge is the throne of Daniel''s vision — the Father seated, the Formed Son given the kingdom, judging the quick and the dead at his appearing.'),
  ('canon', '2-timothy', 4, 8, 'canon', 'daniel', 7, 10, 'free', E'*A fiery stream issued and came forth from before him: thousand thousands ministered unto him, and ten thousand times ten thousand stood before him: the judgment was set, and the books were opened.* (Daniel 7:10). When Paul reckons *a crown of righteousness, which Yahuah (Lord), the righteous judge, shall give me at that day* (2 Timothy 4:8), the day he means is the day Daniel saw: *the judgment was set, and the books were opened.* The righteous judge who lays up the crown is the One enthroned in that fiery court; the *that day* of Paul''s hope is the day of the opened books, when the reward of the righteous is given from the throne.'),
  ('canon', '2-timothy', 4, 8, 'apocrypha', 'the-wisdom-of-solomon', 5, 15, 'extras', E'*But the righteous live for evermore; their reward also is with Yahuah (God), and the care of them is with the Most High.* (Wisdom of Solomon 5:15). The Hebrew library held the same hope Paul reckons: the righteous do not perish but *live for evermore,* and *their reward also is with Yahuah (God).* Paul, ready to be offered, says *Henceforth there is laid up for me a crown of righteousness* (2 Timothy 4:8) — the reward laid up with Yahuah, kept against that day for the one who *fought a good fight... kept the faith* (2 Timothy 4:7). The reward of the righteous Wisdom names is the crown Paul awaits.'),
  ('canon', '2-timothy', 4, 8, 'apocrypha', 'the-wisdom-of-solomon', 5, 16, 'extras', E'*Therefore shall they receive a glorious kingdom, and a beautiful crown from the hand of Yahuah (God): for with his right hand shall he cover them, and with his arm shall he protect them.* (Wisdom of Solomon 5:16). The restored library makes the crown explicit: the righteous *receive a glorious kingdom, and a beautiful crown from the hand of Yahuah (God).* This is the very gift Paul awaits — *a crown of righteousness, which Yahuah (Lord), the righteous judge, shall give me at that day* (2 Timothy 4:8). The crown given *from the hand of Yahuah* is the crown the righteous judge lays up; the same hope, the same hand, the same day, spoken in the Hebrew library before Paul reckoned his course finished.'),
  ('canon', '2-timothy', 4, 8, 'canon', 'philippians', 3, 14, 'free', E'*I press toward the mark for the prize of the high calling of Elohim (God) in HaMashiach Yahusha (Christ Jesus).* (Philippians 3:14). Paul pressed *toward the mark for the prize of the high calling.* Now at the end he reckons the prize attained: *I have fought a good fight, I have finished my course... Henceforth there is laid up for me a crown of righteousness* (2 Timothy 4:7-8). The race he ran toward the prize in Philippians is the course now finished in 2 Timothy; the prize of the high calling is the crown of righteousness laid up at that day.'),
  ('canon', '2-timothy', 4, 8, 'canon', '1-corinthians', 9, 25, 'free', E'*And every man that striveth for the mastery is temperate in all things. Now they do it to obtain a corruptible crown; but we an incorruptible.* (1 Corinthians 9:25). Paul set the runner''s corruptible crown against the believer''s *incorruptible.* That incorruptible crown is the one he names at the last: *a crown of righteousness, which Yahuah (Lord), the righteous judge, shall give me at that day* (2 Timothy 4:8). The temperate striving of the race in 1 Corinthians is the *good fight* finished in 2 Timothy; the incorruptible crown is the crown of righteousness, given not to Paul only *but unto all them also that love his appearing.*'),
  ('canon', '2-timothy', 4, 8, 'canon', 'revelation', 2, 10, 'free', E'*Fear none of those things which thou shalt suffer: behold, the devil shall cast some of you into prison, that ye may be tried; and ye shall have tribulation ten days: be thou faithful unto death, and I will give thee a crown of life.* (Revelation 2:10). The promise to the faithful is a crown: *be thou faithful unto death, and I will give thee a crown of life.* Paul, faithful unto his own death-offering, says *I have kept the faith: Henceforth there is laid up for me a crown of righteousness* (2 Timothy 4:7-8). The crown of life given to the faithful unto death is the crown of righteousness laid up for the one who kept the faith to the end — given to all *that love his appearing.*'),
  -- thread: 2-timothy-4-reward-him-according-to-his-works-psalm-62-proverbs-24
  ('canon', '2-timothy', 4, 14, 'canon', 'psalms', 62, 12, 'free', E'*Also unto thee, O Yahuah (Lord), belongeth mercy: for thou renderest to every man according to his work.* (Psalm 62:12). When Paul says of the one who did him much evil, *Yahuah (Lord) reward him according to his works* (2 Timothy 4:14), he does not curse but commits the matter to the settled rule of the Tanakh: *thou renderest to every man according to his work.* Paul leaves the recompense to Yahuah (Lord), to whom both *mercy* and just rendering belong; the apostle does not avenge himself but trusts the righteous judge who renders to every man.'),
  ('canon', '2-timothy', 4, 14, 'canon', 'proverbs', 24, 12, 'free', E'*If thou sayest, Behold, we knew it not; doth not he that pondereth the heart consider it? and he that keepeth thy soul, doth not he know it? and shall not he render to every man according to his works?* (Proverbs 24:12). Proverbs asks whether the One who *pondereth the heart* will not *render to every man according to his works.* Paul answers it of Alexander: *Yahuah (Lord) reward him according to his works* (2 Timothy 4:14). The heart-pondering God who knows and renders is the One Paul appeals to; vengeance is not the apostle''s but Yahuah''s, who renders justly according to the works he alone sees.'),
  ('canon', '2-timothy', 4, 14, 'canon', 'romans', 2, 6, 'free', E'*Who will render to every man according to his deeds:* (Romans 2:6). Paul had already written the rule into Romans: Elohim (God) *will render to every man according to his deeds.* He now applies it as he hands the matter over: *Yahuah (Lord) reward him according to his works* (2 Timothy 4:14). The God who renders according to deeds in Romans is the righteous judge of 2 Timothy 4:8 — the same One who lays up the crown of righteousness for those who love his appearing renders justly to those who resist the word.'),
  -- thread: 2-timothy-4-delivered-out-of-the-mouth-of-the-lion-psalm-22-daniel-6
  ('canon', '2-timothy', 4, 17, 'canon', 'psalms', 22, 21, 'free', E'*Save me from the lion''s mouth: for thou hast heard me from the horns of the unicorns.* (Psalm 22:21). The psalm of the afflicted righteous cries *Save me from the lion''s mouth,* and is answered — *thou hast heard me.* Paul takes up the same deliverance: *Notwithstanding Yahuah (Lord) stood with me, and strengthened me... and I was delivered out of the mouth of the lion* (2 Timothy 4:17). The lion''s mouth from which the psalmist was saved is the lion''s mouth from which Paul is delivered; the One who heard the afflicted of Psalm 22 stood with Paul and strengthened him.'),
  ('canon', '2-timothy', 4, 17, 'canon', 'daniel', 6, 22, 'free', E'*My Elohim (God) hath sent his angel, and hath shut the lions'' mouths, that they have not hurt me: forasmuch as before him innocency was found in me; and also before thee, O king, have I done no hurt.* (Daniel 6:22). Daniel, cast into the den, testifies that *my Elohim (God) hath sent his angel, and hath shut the lions'' mouths.* Paul, at his first answer forsaken by all, testifies the same deliverance: *I was delivered out of the mouth of the lion* (2 Timothy 4:17). The God who shut the lions'' mouths for the innocent Daniel is the One who stood with Paul and *shall deliver me from every evil work, and will preserve me unto his heavenly kingdom* (2 Timothy 4:18).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s236_t236c4_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s236_t236c4_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-timothy-4-preach-the-word-against-itching-ears-turned-unto-fables-isaiah-30-jeremiah-5',
       E'Preach the word against itching ears turned unto fables (Isaiah 30, Jeremiah 5)',
       E'Paul''s charge is urgent: *Preach the word; be instant in season, out of season; reprove, rebuke, exhort with all longsuffering and doctrine* (2 Timothy 4:2). And he gives the reason: *For the time will come when they will not endure sound doctrine; but after their own lusts shall they heap to themselves teachers, having itching ears; And they shall turn away their ears from the truth, and shall be turned unto fables* (2 Timothy 4:3-4). This is no new corruption but the old refusal the prophets named. Isaiah saw *a rebellious people, lying children, children that will not hear the law of Yahuah (LORD)* (Isaiah 30:9) — a people who say *to the prophets, Prophesy not unto us right things, speak unto us smooth things, prophesy deceits* (Isaiah 30:10). The itching ears that crave smooth things are Isaiah''s lying children; the truth they turn from is the law of Yahuah (LORD) they would not hear. Jeremiah saw the same: *The prophets prophesy falsely, and the priests bear rule by their means; and my people love to have it so: and what will ye do in the end thereof?* (Jeremiah 5:31). The fables Paul warns of are the false prophesying Jeremiah condemned, welcomed because the people *love to have it so.* Against this stands the watchman''s charge — preach the word in season and out, though the people love the lie; for the truth refused is the word of Yahuah (LORD), and the question still presses, *what will ye do in the end thereof?*',
       sv.verse_id, ev.verse_id, 'free', 8625
  FROM _s236_t236c4_lookup sv, _s236_t236c4_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=4 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='2-timothy' AND ev.chapter_number=4 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-timothy-4-the-crown-of-righteousness-the-righteous-judge-at-that-day-daniel-7',
       E'The crown of righteousness the righteous judge shall give at that day (Daniel 7; Wisdom 5)',
       E'Paul charges Timothy *before Elohim (God), and the Lord Yahusha HaMashiach (Lord Jesus Christ), who shall judge the quick and the dead at his appearing and his kingdom* (2 Timothy 4:1), and then, ready to be offered, reckons his finished course: *I have fought a good fight, I have finished my course, I have kept the faith: Henceforth there is laid up for me a crown of righteousness, which Yahuah (Lord), the righteous judge, shall give me at that day: and not to me only, but unto all them also that love his appearing* (2 Timothy 4:7-8). The day he means is the day Daniel saw: *I beheld till the thrones were cast down, and the Ancient of days did sit, whose garment was white as snow... his throne was like the fiery flame* (Daniel 7:9), and *the judgment was set, and the books were opened* (Daniel 7:10). The righteous judge who lays up the crown is the One enthroned in that fiery court — the Father seated, the Formed Son given the kingdom to judge the quick and the dead at his appearing. The crown itself the Hebrew library beheld: *the righteous live for evermore; their reward also is with Yahuah (God), and the care of them is with the Most High* (Wisdom of Solomon 5:15); *Therefore shall they receive a glorious kingdom, and a beautiful crown from the hand of Yahuah (God)* (Wisdom of Solomon 5:16) — the reward laid up with Yahuah, the crown given from his own hand. And the New Testament names this same prize: the *prize of the high calling of Elohim (God)* Paul pressed toward (Philippians 3:14); the *incorruptible* crown set against the runner''s corruptible one (1 Corinthians 9:25); the *crown of life* promised to the one *faithful unto death* (Revelation 2:10). The race run, the faith kept, the offering poured out — the crown of righteousness is the incorruptible crown, the crown of life, the reward of the righteous given from the hand of Yahuah at the day of the opened books, to all that love his appearing. The Father judges and rewards through the Formed Son, the righteous judge of that day.',
       sv.verse_id, ev.verse_id, 'extras', 8626
  FROM _s236_t236c4_lookup sv, _s236_t236c4_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=4 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='2-timothy' AND ev.chapter_number=4 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-timothy-4-reward-him-according-to-his-works-psalm-62-proverbs-24',
       E'Yahuah reward him according to his works (Psalm 62, Proverbs 24, Romans 2)',
       E'Of the man who did him much evil, Paul does not curse but commits the matter to Yahuah: *Alexander the coppersmith did me much evil: Yahuah (Lord) reward him according to his works* (2 Timothy 4:14). The words are the settled rule of the Tanakh. The psalmist sang, *Also unto thee, O Yahuah (Lord), belongeth mercy: for thou renderest to every man according to his work* (Psalm 62:12) — to Yahuah belong both mercy and just rendering. Proverbs presses it as a question no man escapes: *doth not he that pondereth the heart consider it? and he that keepeth thy soul, doth not he know it? and shall not he render to every man according to his works?* (Proverbs 24:12). And Paul had already written the rule into the gospel: Elohim (God) *will render to every man according to his deeds* (Romans 2:6). So the apostle does not avenge himself; he hands the matter to the righteous judge who *pondereth the heart* and renders justly. The same One who lays up *a crown of righteousness... at that day* (2 Timothy 4:8) for those who love his appearing will render to the one who resisted the word — recompense and reward both belong to Yahuah, who renders to every man according to his works.',
       sv.verse_id, ev.verse_id, 'free', 8627
  FROM _s236_t236c4_lookup sv, _s236_t236c4_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=4 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='2-timothy' AND ev.chapter_number=4 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-timothy-4-delivered-out-of-the-mouth-of-the-lion-psalm-22-daniel-6',
       E'Delivered out of the mouth of the lion (Psalm 22, Daniel 6)',
       E'Forsaken by all at his first answer, Paul testifies that he was not alone: *Notwithstanding Yahuah (Lord) stood with me, and strengthened me; that by me the preaching might be fully known, and that all the Gentiles might hear: and I was delivered out of the mouth of the lion* (2 Timothy 4:17). The lion''s mouth is the deliverance the Tanakh sings and shows. The afflicted righteous of the psalm cried, *Save me from the lion''s mouth: for thou hast heard me from the horns of the unicorns* (Psalm 22:21) — and was heard. Daniel, cast into the den, testified, *My Elohim (God) hath sent his angel, and hath shut the lions'' mouths, that they have not hurt me: forasmuch as before him innocency was found in me* (Daniel 6:22). The God who heard the afflicted of Psalm 22 and shut the lions'' mouths for the innocent Daniel is the One who stood with Paul and strengthened him. And Paul reaches past every present rescue to the last one: *And Yahuah (Lord) shall deliver me from every evil work, and will preserve me unto his heavenly kingdom: to whom be glory for ever and ever. Amen* (2 Timothy 4:18) — the same deliverer who shut the lions'' mouths will bring him safe into the kingdom.',
       sv.verse_id, ev.verse_id, 'free', 8628
  FROM _s236_t236c4_lookup sv, _s236_t236c4_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=4 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='2-timothy' AND ev.chapter_number=4 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-timothy-4-preach-the-word-against-itching-ears-turned-unto-fables-isaiah-30-jeremiah-5
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 30:10 — *speak unto us smooth things, prophesy deceits* the lying children who will not hear the law of Yahuah (LORD); the itching ears that *will not endure sound doctrine* (2 Timothy 4:3).'
  FROM cross_reference_threads t, cross_references x, _s236_t236c4_lookup sv, _s236_t236c4_lookup tv
 WHERE t.slug='2-timothy-4-preach-the-word-against-itching-ears-turned-unto-fables-isaiah-30-jeremiah-5'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=4 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=30 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 5:31 — *the prophets prophesy falsely... and my people love to have it so* the welcomed lie; those who *shall turn away their ears from the truth, and shall be turned unto fables* (2 Timothy 4:4).'
  FROM cross_reference_threads t, cross_references x, _s236_t236c4_lookup sv, _s236_t236c4_lookup tv
 WHERE t.slug='2-timothy-4-preach-the-word-against-itching-ears-turned-unto-fables-isaiah-30-jeremiah-5'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=4 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=5 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-timothy-4-the-crown-of-righteousness-the-righteous-judge-at-that-day-daniel-7
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 7:9 — *the Ancient of days did sit... his throne was like the fiery flame* the judgment-throne behind Paul''s charge *before Elohim... who shall judge the quick and the dead at his appearing* (2 Timothy 4:1).'
  FROM cross_reference_threads t, cross_references x, _s236_t236c4_lookup sv, _s236_t236c4_lookup tv
 WHERE t.slug='2-timothy-4-the-crown-of-righteousness-the-righteous-judge-at-that-day-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=4 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 7:10 — *the judgment was set, and the books were opened* the day Paul means; *which Yahuah (Lord), the righteous judge, shall give me at that day* (2 Timothy 4:8).'
  FROM cross_reference_threads t, cross_references x, _s236_t236c4_lookup sv, _s236_t236c4_lookup tv
 WHERE t.slug='2-timothy-4-the-crown-of-righteousness-the-righteous-judge-at-that-day-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=4 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Wisdom of Solomon 5:15 — *the righteous live for evermore; their reward also is with Yahuah (God)* the reward laid up with Yahuah; *there is laid up for me a crown of righteousness* (2 Timothy 4:8).'
  FROM cross_reference_threads t, cross_references x, _s236_t236c4_lookup sv, _s236_t236c4_lookup tv
 WHERE t.slug='2-timothy-4-the-crown-of-righteousness-the-righteous-judge-at-that-day-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=4 AND sv.verse_number=8
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=5 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Wisdom of Solomon 5:16 — *a glorious kingdom, and a beautiful crown from the hand of Yahuah (God)* the crown made explicit; *a crown of righteousness, which Yahuah (Lord), the righteous judge, shall give me* (2 Timothy 4:8).'
  FROM cross_reference_threads t, cross_references x, _s236_t236c4_lookup sv, _s236_t236c4_lookup tv
 WHERE t.slug='2-timothy-4-the-crown-of-righteousness-the-righteous-judge-at-that-day-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=4 AND sv.verse_number=8
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=5 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Philippians 3:14 — *the prize of the high calling of Elohim (God)* the mark Paul pressed toward; the course now *finished* and the crown laid up (2 Timothy 4:7-8).'
  FROM cross_reference_threads t, cross_references x, _s236_t236c4_lookup sv, _s236_t236c4_lookup tv
 WHERE t.slug='2-timothy-4-the-crown-of-righteousness-the-righteous-judge-at-that-day-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=4 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=3 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'1 Corinthians 9:25 — *they do it to obtain a corruptible crown; but we an incorruptible* the incorruptible crown of the race; the crown of righteousness of the finished course (2 Timothy 4:7-8).'
  FROM cross_reference_threads t, cross_references x, _s236_t236c4_lookup sv, _s236_t236c4_lookup tv
 WHERE t.slug='2-timothy-4-the-crown-of-righteousness-the-righteous-judge-at-that-day-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=4 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=9 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Revelation 2:10 — *be thou faithful unto death, and I will give thee a crown of life* the crown for the faithful unto death; the crown of righteousness for the one who *kept the faith* (2 Timothy 4:7-8).'
  FROM cross_reference_threads t, cross_references x, _s236_t236c4_lookup sv, _s236_t236c4_lookup tv
 WHERE t.slug='2-timothy-4-the-crown-of-righteousness-the-righteous-judge-at-that-day-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=4 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=2 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-timothy-4-reward-him-according-to-his-works-psalm-62-proverbs-24
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 62:12 — *thou renderest to every man according to his work* the settled rule, mercy and just rendering both Yahuah''s; *Yahuah (Lord) reward him according to his works* (2 Timothy 4:14).'
  FROM cross_reference_threads t, cross_references x, _s236_t236c4_lookup sv, _s236_t236c4_lookup tv
 WHERE t.slug='2-timothy-4-reward-him-according-to-his-works-psalm-62-proverbs-24'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=4 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=62 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 24:12 — *shall not he render to every man according to his works?* the heart-pondering God who knows; the recompense Paul leaves to Yahuah (2 Timothy 4:14).'
  FROM cross_reference_threads t, cross_references x, _s236_t236c4_lookup sv, _s236_t236c4_lookup tv
 WHERE t.slug='2-timothy-4-reward-him-according-to-his-works-psalm-62-proverbs-24'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=4 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=24 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 2:6 — *who will render to every man according to his deeds* the rule Paul wrote into the gospel; the righteous judge who renders justly (2 Timothy 4:14, cf. 4:8).'
  FROM cross_reference_threads t, cross_references x, _s236_t236c4_lookup sv, _s236_t236c4_lookup tv
 WHERE t.slug='2-timothy-4-reward-him-according-to-his-works-psalm-62-proverbs-24'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=4 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=2 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-timothy-4-delivered-out-of-the-mouth-of-the-lion-psalm-22-daniel-6
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 22:21 — *Save me from the lion''s mouth: for thou hast heard me* the afflicted righteous heard and saved; *I was delivered out of the mouth of the lion* (2 Timothy 4:17).'
  FROM cross_reference_threads t, cross_references x, _s236_t236c4_lookup sv, _s236_t236c4_lookup tv
 WHERE t.slug='2-timothy-4-delivered-out-of-the-mouth-of-the-lion-psalm-22-daniel-6'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=4 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=22 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 6:22 — *my Elohim (God)... hath shut the lions'' mouths, that they have not hurt me* the den-deliverance of the innocent Daniel; the God who stood with Paul and delivered him (2 Timothy 4:17).'
  FROM cross_reference_threads t, cross_references x, _s236_t236c4_lookup sv, _s236_t236c4_lookup tv
 WHERE t.slug='2-timothy-4-delivered-out-of-the-mouth-of-the-lion-psalm-22-daniel-6'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=4 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=6 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
