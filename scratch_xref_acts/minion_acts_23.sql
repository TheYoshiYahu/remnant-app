-- ----- fragment: minion_acts_23.sql (S217 Acts 23) -----
-- =====================================================================
-- S217 minion — ACTS 23 FULL-LIBRARY cross-references
-- =====================================================================
-- Anchor chapter: ACTS 23.  Tag: a23 (temp view _s217_a23_lookup).  Sort band: 5825-5849.
-- Source is ALWAYS the canon Acts verse; targets span Tanakh + extra-canonical + NT.
-- Tiers per-row: canon target = 'free'; extra-canonical target = 'extras'.
-- (All targets in this fragment are canon — every thread is tier_required='free'.)
--
-- WATCHPOINTS (Red Lines #4/#5, the dropped-Paul note, Christology, son-of-Adam):
--  * Whited wall (v.3): Paul invokes the Torah against the high priest — *commandest me to be
--    smitten contrary to the law?* The wall daubed with untempered mortar is Ezekiel's image of
--    the false-peace builders who seduce the people; the law Paul appeals to is Leviticus 19:15,
--    righteous judgment. This is Torah honored, never Torah set against grace (Red Line #4).
--  * Speak not evil of the ruler (v.5): Paul corrects himself by Torah — *it is written* — the
--    bodily refutation of the dropped-Paul accusation that he taught against Mosheh (Moses). The
--    Torah-observant Yashar'elite submits to the written word even mid-rebuke (Red Line #5).
--  * The resurrection hope (v.6): *of the hope and resurrection of the dead I am called in
--    question* is the Tanakh hope — Daniel's awaking from the dust, Job's living redeemer, Isaiah's
--    dead men shall live. NOT a novel doctrine; the prophets' own promise of the gathering and the
--    first resurrection. The Pharisee/Sadducee split is over whether the prophets are believed.
--  * The Master stands by (v.11): *Yahuah (Lord) stood by him* — the Formed himself, who is
--    Yahuah and came in the flesh as Yahusha (Jesus), keeps the I-am-with-thee promise he made to
--    Yehoshua (Joshua) and Jeremiah, and sends Paul on to bear witness at Rome. The keeper and the
--    sender are one; the same voice stood by at Corinth (Acts 18) and stands by again here.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every block):
--  ACTS 23:
--   v.1     good conscience before Elohim   Tanakh: none warranted  Extras: none warranted  NT: none warranted (narrative; the testimony carried in the resurrection-hope thread)
--   v.2-3   whited wall / smitten contrary to law  Tanakh: Ezekiel 13:10, Ezekiel 13:14, Ezekiel 13:15 (untempered mortar / the false-peace wall); Leviticus 19:15 (judge in righteousness — the law Paul invokes)  Extras: none warranted  NT: Matthew 23:27 weighed (whited sepulchres — verbal echo, different image/target; not added, the wall is Ezekiel's)
--   v.4-5   speak not evil of the ruler      Tanakh: Exodus 22:28  Extras: none warranted  NT: none warranted
--   v.6     hope and resurrection of the dead  Tanakh: Daniel 12:2, Job 19:25, Job 19:26, Isaiah 26:19  Extras: none warranted (2 Maccabees 7 weighed — the resurrection confession of the martyrs; the Tanakh witnesses carry it cleaner, not added)  NT: none added (the hope carried in the Tanakh prophets)
--   v.7-8   Pharisees / Sadducees / resurrection, angel, spirit  Tanakh: none added (carried in the resurrection-hope thread)  Extras: none warranted  NT: none warranted (narrative)
--   v.9     if a spirit or an angel hath spoken  Tanakh: none warranted  Extras: none warranted  NT: none warranted (narrative)
--   v.10    chief captain rescues Paul       Tanakh: none warranted  Extras: none warranted  NT: none warranted (narrative)
--   v.11    Yahuah stood by him — witness at Rome  Tanakh: Joshua 1:5, Joshua 1:9, Jeremiah 1:8, Jeremiah 1:19, Isaiah 41:10  Extras: none warranted  NT: Acts 18:9, Acts 18:10, Acts 27:23, Acts 27:24
--   v.12-15 the forty under a curse           Tanakh: none warranted (Psalm-37-wait-on-the-wicked weighed; thin, not added)  Extras: none warranted  NT: none warranted (narrative; the plot foiled is the keeping promise of v.11 made visible)
--   v.16-22 Paul's nephew warns               Tanakh: none warranted  Extras: none warranted  NT: none warranted (narrative)
--   v.23-35 night march to Caesarea / letter / Felix  Tanakh: none warranted  Extras: none warranted  NT: none warranted (narrative; the safe arrival is the keeping promise of v.11 carried out)
--
-- THREADS (slug -> target libraries):
--   5825 acts-23-thou-whited-wall-the-untempered-morter-and-righteous-judgment  (Tanakh)
--   5828 acts-23-thou-shalt-not-speak-evil-of-the-ruler-paul-corrected-by-torah (Tanakh)
--   5831 acts-23-the-hope-and-resurrection-of-the-dead-the-tanakh-hope          (Tanakh)
--   5834 acts-23-yahuah-stood-by-him-the-master-keeps-and-sends-to-rome         (Tanakh + NT, Acts<->Acts)
-- =====================================================================

CREATE TEMP VIEW _s217_a23_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: acts-23-thou-whited-wall-the-untempered-morter-and-righteous-judgment
  ('canon', 'acts', 23, 3, 'canon', 'ezekiel', 13, 10, 'free', E'*Because, even because they have seduced my people, saying, Peace; and there was no peace; and one built up a wall, and, lo, others daubed it with untempered morter:* (Ezekiel 13:10). When the high priest commands him struck, Paul answers, *Elohim (God) shall smite thee, thou whited wall* (Acts 23:3). The image is Ezekiel''s: a wall built and daubed over with untempered mortar to hide its weakness — the false-peace builders who seduce the people with a covering that cannot stand. The whitewashed wall looks sound and is not; the one who sits to judge by the law and breaks the law to do it is that wall.'),
  ('canon', 'acts', 23, 3, 'canon', 'ezekiel', 13, 14, 'free', E'*So will I break down the wall that ye have daubed with untempered morter, and bring it down to the ground, so that the foundation thereof shall be discovered, and it shall fall, and ye shall be consumed in the midst thereof: and ye shall know that I am Yahuah (LORD).* (Ezekiel 13:14). *Elohim (God) shall smite thee, thou whited wall* (Acts 23:3) — Paul speaks the very sentence Ezekiel spoke over the daubed wall: it shall be smitten, broken down, its hidden foundation laid bare. The smiting Paul names is not his own vengeance but the verdict the prophet already pronounced on the wall that wears a fair covering over rot.'),
  ('canon', 'acts', 23, 3, 'canon', 'ezekiel', 13, 15, 'free', E'*Thus will I accomplish my wrath upon the wall, and upon them that have daubed it with untempered morter, and will say unto you, The wall is no more, neither they that daubed it;* (Ezekiel 13:15). The whited wall and they that daubed it both come to nothing under the wrath Ezekiel names. Paul, struck on the mouth contrary to the law, names the high priest the whited wall (Acts 23:3) — the daubed covering that cannot save the daubers; the fair front falls with those who built it.'),
  ('canon', 'acts', 23, 3, 'canon', 'leviticus', 19, 15, 'free', E'*Ye shall do no unrighteousness in judgment: thou shalt not respect the person of the poor, nor honour the person of the mighty: but in righteousness shalt thou judge thy neighbour.* (Leviticus 19:15). Paul''s charge is precise: *sittest thou to judge me after the law, and commandest me to be smitten contrary to the law?* (Acts 23:3). The very Torah the high priest sits to administer forbids him this: judgment is to be done in righteousness, not by striking the accused before the cause is heard. Paul appeals not against the law but to it — the law honored against the one who breaks it from the judgment seat.'),
  -- thread: acts-23-thou-shalt-not-speak-evil-of-the-ruler-paul-corrected-by-torah
  ('canon', 'acts', 23, 5, 'canon', 'exodus', 22, 28, 'free', E'*Thou shalt not revile the gods, nor curse the ruler of thy people.* (Exodus 22:28). When told he had reviled Elohim''s (God''s) high priest, Paul yields at once: *I wist not, brethren, that he was the high priest: for it is written, Thou shalt not speak evil of the ruler of thy people* (Acts 23:5). He does not defend his words; he submits to the written Torah the moment it is brought to bear. The man accused of teaching against Mosheh (Moses) corrects himself by Mosheh''s own book — the Torah-keeping Yashar''elite bound by the word even in the heat of rebuke.'),
  -- thread: acts-23-the-hope-and-resurrection-of-the-dead-the-tanakh-hope
  ('canon', 'acts', 23, 6, 'canon', 'daniel', 12, 2, 'free', E'*And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* (Daniel 12:2). Paul cries in the council, *of the hope and resurrection of the dead I am called in question* (Acts 23:6). The hope is no novelty: Daniel saw the sleepers in the dust awake, some to everlasting life. The resurrection Paul is tried for is the prophets'' own promise — the awaking of those who sleep, which the Sadducees deny and the Pharisees confess (Acts 23:8).'),
  ('canon', 'acts', 23, 6, 'canon', 'job', 19, 25, 'free', E'*For I know that my redeemer liveth, and that he shall stand at the latter day upon the earth:* (Job 19:25). The hope Paul is called in question for (Acts 23:6) is the hope Job confessed out of his ash heap: a living Redeemer who shall stand at the latter day upon the earth. The resurrection of the dead is bound up in a Redeemer who lives — the Formed one who would stand upon the earth, in whom the dust-sleepers'' awaking is sure.'),
  ('canon', 'acts', 23, 6, 'canon', 'job', 19, 26, 'free', E'*And though after my skin worms destroy this body, yet in my flesh shall I see Elohim (God):* (Job 19:26). *Of the hope and resurrection of the dead I am called in question* (Acts 23:6). Job names the substance of that hope: though the body be destroyed, *in my flesh shall I see Elohim (God)* — the resurrection of the very flesh, not a flight from it. The hope Paul stands trial for is this hope: the dead raised bodily to see Elohim (God) with their own eyes.'),
  ('canon', 'acts', 23, 6, 'canon', 'isaiah', 26, 19, 'free', E'*Thy dead men shall live, together with my dead body shall they arise. Awake and sing, ye that dwell in dust: for thy dew is as the dew of herbs, and the earth shall cast out the dead.* (Isaiah 26:19). The resurrection Paul is tried for (Acts 23:6) is the song Isaiah set in the mouth of the dust-dwellers: *Thy dead men shall live … Awake and sing, ye that dwell in dust.* This is the prophets'' hope of the gathering — the earth casting out its dead, the sleepers raised; the very thing the Sadducees say cannot be (Acts 23:8).'),
  -- thread: acts-23-yahuah-stood-by-him-the-master-keeps-and-sends-to-rome
  ('canon', 'acts', 23, 11, 'canon', 'joshua', 1, 5, 'free', E'*There shall not any man be able to stand before thee all the days of thy life: as I was with Mosheh (Moses), so I will be with thee: I will not fail thee, nor forsake thee.* (Joshua 1:5). *And the night following Yahuah (Lord) stood by him, and said, Be of good cheer, Paul* (Acts 23:11). The One who stood by Paul in the night is the One who stood by Yehoshua (Joshua): *I will not fail thee, nor forsake thee.* The Formed who went with Mosheh (Moses) and Yehoshua keeps the same word now — he stands by, he does not forsake.'),
  ('canon', 'acts', 23, 11, 'canon', 'joshua', 1, 9, 'free', E'*Have not I commanded thee? Be strong and of a good courage; be not afraid, neither be thou dismayed: for Yahuah Elohayka (the LORD thy God) is with thee whithersoever thou goest.* (Joshua 1:9). *Be of good cheer, Paul: for as thou hast testified of me in Jerusalem, so must thou bear witness also at Rome* (Acts 23:11). The charge to Yehoshua (Joshua) — *be strong … be not afraid … for Yahuah Elohayka (the LORD thy God) is with thee whithersoever thou goest* — is the charge now to Paul: be of good cheer, for the One with thee will carry thee whithersoever thou goest, even unto Rome.'),
  ('canon', 'acts', 23, 11, 'canon', 'jeremiah', 1, 8, 'free', E'*Be not afraid of their faces: for I am with thee to deliver thee, saith Yahuah (LORD).* (Jeremiah 1:8). To the council that would tear Paul in pieces, the word of the night is *Be of good cheer* (Acts 23:11) — the same word Yahuah (LORD) spoke to Jeremiah when the faces around him were set against him: *I am with thee to deliver thee.* The Master who sent the prophet stands by his witness and delivers him to finish the testimony appointed.'),
  ('canon', 'acts', 23, 11, 'canon', 'jeremiah', 1, 19, 'free', E'*And they shall fight against thee; but they shall not prevail against thee; for I am with thee, saith Yahuah (LORD), to deliver thee.* (Jeremiah 1:19). The forty bind themselves under a curse to kill Paul (Acts 23:12-13), yet the word already stood: *Be of good cheer … so must thou bear witness also at Rome* (Acts 23:11). As Yahuah (LORD) told Jeremiah, *they shall fight against thee; but they shall not prevail against thee; for I am with thee … to deliver thee* — the plot cannot break what the Master has appointed; the witness must reach Rome.'),
  ('canon', 'acts', 23, 11, 'canon', 'isaiah', 41, 10, 'free', E'*Fear thou not; for I am with thee: be not dismayed; for I am thy Elohim (God): I will strengthen thee; yea, I will help thee; yea, I will uphold thee with the right hand of my righteousness.* (Isaiah 41:10). *Be of good cheer, Paul* (Acts 23:11) is the same comfort Isaiah carries: *Fear thou not; for I am with thee … I will uphold thee with the right hand of my righteousness.* The Master who stands by in the night is the upholding right hand; the witness is held up, not by his own strength, but by the One who is with him.'),
  ('canon', 'acts', 23, 11, 'canon', 'acts', 18, 9, 'free', E'*Then spake Yahuah (Lord) to Paul in the night by a vision, Be not afraid, but speak, and hold not thy peace:* (Acts 18:9). This is not the first night the Master has stood by. At Corinth, *Yahuah (Lord)* spoke to Paul *in the night by a vision, Be not afraid, but speak;* now again *the night following Yahuah (Lord) stood by him, and said, Be of good cheer, Paul* (Acts 23:11). The same voice, the same keeping — the Master who told him to speak at Corinth tells him here he will yet speak at Rome.'),
  ('canon', 'acts', 23, 11, 'canon', 'acts', 18, 10, 'free', E'*For I am with thee, and no man shall set on thee to hurt thee: for I have much people in this city.* (Acts 18:10). At Corinth the Master''s word was *I am with thee, and no man shall set on thee to hurt thee* (Acts 18:10); now the forty lie in wait to kill Paul, yet the night word stands — *as thou hast testified of me in Jerusalem, so must thou bear witness also at Rome* (Acts 23:11). The One who shielded him at Corinth shields him still: no man shall set on him to stop the testimony appointed for Rome.'),
  ('canon', 'acts', 23, 11, 'canon', 'acts', 27, 23, 'free', E'*For there stood by me this night the angel of Elohim (God), whose I am, and whom I serve,* (Acts 27:23). The promise of the night in Jerusalem — *so must thou bear witness also at Rome* (Acts 23:11) — holds through the storm at sea: *there stood by me this night the angel of Elohim (God), whose I am, and whom I serve.* The Master who stood by him in the castle stands by him again on the foundering ship; the witness will not be lost to the deep, for he must yet stand at Rome.'),
  ('canon', 'acts', 23, 11, 'canon', 'acts', 27, 24, 'free', E'*Saying, Fear not, Paul; thou must be brought before Cæsar: and, lo, Elohim (God) hath given thee all them that sail with thee.* (Acts 27:24). The word at Jerusalem, *bear witness also at Rome* (Acts 23:11), is sealed in the storm: *Fear not, Paul; thou must be brought before Cæsar.* What the Master appointed in the night by the council he carries to its end through shipwreck — Paul *must* be brought before Cæsar, and the keeping reaches even to the lives of all who sail with him.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s217_a23_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s217_a23_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-23-thou-whited-wall-the-untempered-morter-and-righteous-judgment',
       E'Thou whited wall — the untempered morter and righteous judgment',
       E'Brought before the council, Paul says *I have lived in all good conscience before Elohim (God) until this day* (Acts 23:1), and the high priest Ananias commands him struck on the mouth. Paul answers, *Elohim (God) shall smite thee, thou whited wall: for sittest thou to judge me after the law, and commandest me to be smitten contrary to the law?* (Acts 23:3). The whited wall is Ezekiel''s image of the false-peace builders: *they have seduced my people, saying, Peace; and there was no peace; and one built up a wall, and, lo, others daubed it with untempered morter* (Ezekiel 13:10) — a wall whitewashed over to hide that it cannot stand. The verdict on that wall is the verdict Paul speaks: *So will I break down the wall that ye have daubed with untempered morter … and ye shall know that I am Yahuah (LORD)* (Ezekiel 13:14), *Thus will I accomplish my wrath upon the wall, and upon them that have daubed it with untempered morter* (Ezekiel 13:15). And the law Paul appeals to is no abolished thing — it is the standing Torah of righteous judgment: *Ye shall do no unrighteousness in judgment … but in righteousness shalt thou judge thy neighbour* (Leviticus 19:15). The high priest sits to judge by the law and breaks the law to do it; Paul does not despise the Torah but holds it up against the one who breaks it from the judgment seat.',
       sv.verse_id, ev.verse_id, 'free', 5825
  FROM _s217_a23_lookup sv, _s217_a23_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=23 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=23 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-23-thou-shalt-not-speak-evil-of-the-ruler-paul-corrected-by-torah',
       E'Thou shalt not speak evil of the ruler — Paul corrected by Torah',
       E'When the bystanders rebuke him — *Revilest thou Elohim''s (God''s) high priest?* (Acts 23:4) — Paul does not stand on his words. He yields at once: *I wist not, brethren, that he was the high priest: for it is written, Thou shalt not speak evil of the ruler of thy people* (Acts 23:5). The word he submits to is Mosheh''s (Moses'') own: *Thou shalt not revile the gods, nor curse the ruler of thy people* (Exodus 22:28). This is the bodily refutation of the slander that Paul taught the people to forsake the Torah. The man accused of teaching against Mosheh (Moses) corrects himself, mid-rebuke, by Mosheh''s book — *for it is written.* The Torah-keeping Yashar''elite is bound by the written word the instant it is brought to bear, and bows to it before the council that hates him. Paul does not weaponize the law selectively; he is governed by it, even against his own outburst.',
       sv.verse_id, ev.verse_id, 'free', 5828
  FROM _s217_a23_lookup sv, _s217_a23_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=23 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=23 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-23-the-hope-and-resurrection-of-the-dead-the-tanakh-hope',
       E'The hope and resurrection of the dead — the Tanakh hope',
       E'Perceiving the council split, Paul cries, *Men and brethren, I am a Pharisee, the son of a Pharisee: of the hope and resurrection of the dead I am called in question* (Acts 23:6) — *for the Sadducees say that there is no resurrection, neither angel, nor spirit: but the Pharisees confess both* (Acts 23:8). The hope Paul is tried for is not a new doctrine but the prophets'' own promise. Daniel saw it: *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt* (Daniel 12:2). Job confessed it out of his suffering: *For I know that my redeemer liveth, and that he shall stand at the latter day upon the earth* (Job 19:25), *And though after my skin worms destroy this body, yet in my flesh shall I see Elohim (God)* (Job 19:26) — the very flesh raised to see Elohim (God), not a flight from the body. Isaiah set the song in the mouth of the dust-dwellers: *Thy dead men shall live, together with my dead body shall they arise. Awake and sing, ye that dwell in dust … and the earth shall cast out the dead* (Isaiah 26:19). This is the hope of the gathering — the sleepers raised, the living Redeemer standing upon the earth, the first resurrection of the worthy of the seed. The Sadducees deny what the prophets promised; Paul stands trial for believing them.',
       sv.verse_id, ev.verse_id, 'free', 5831
  FROM _s217_a23_lookup sv, _s217_a23_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=23 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=23 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-23-yahuah-stood-by-him-the-master-keeps-and-sends-to-rome',
       E'Yahuah (Lord) stood by him — the Master keeps and sends to Rome',
       E'After the council is torn with dissension and Paul is taken by force into the castle, the night comes: *And the night following Yahuah (Lord) stood by him, and said, Be of good cheer, Paul: for as thou hast testified of me in Jerusalem, so must thou bear witness also at Rome* (Acts 23:11). The One who stood by him is the Formed himself — he who is Yahuah and came in the flesh as Yahusha (Jesus) — keeping the promise he has made to his witnesses from the beginning. To Yehoshua (Joshua) he said *as I was with Mosheh (Moses), so I will be with thee: I will not fail thee, nor forsake thee* (Joshua 1:5), *be not afraid, neither be thou dismayed: for Yahuah Elohayka (the LORD thy God) is with thee whithersoever thou goest* (Joshua 1:9). To Jeremiah, with the faces set against him, *Be not afraid of their faces: for I am with thee to deliver thee, saith Yahuah (LORD)* (Jeremiah 1:8), *they shall fight against thee; but they shall not prevail against thee; for I am with thee … to deliver thee* (Jeremiah 1:19). And through Isaiah, *Fear thou not; for I am with thee … I will uphold thee with the right hand of my righteousness* (Isaiah 41:10). The same voice had already stood by Paul at Corinth — *Be not afraid, but speak, and hold not thy peace: For I am with thee, and no man shall set on thee to hurt thee* (Acts 18:9-10) — and would stand by him again in the storm at sea: *Fear not, Paul; thou must be brought before Cæsar* (Acts 27:24). So when more than forty bind themselves under a curse to kill him (Acts 23:12-13), the plot is already broken: the Master who keeps is also the Master who sends, and the witness appointed for Rome cannot be stopped short of it.',
       sv.verse_id, ev.verse_id, 'free', 5834
  FROM _s217_a23_lookup sv, _s217_a23_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=23 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=23 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: acts-23-thou-whited-wall-the-untempered-morter-and-righteous-judgment
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 13:10 — *one built up a wall, and, lo, others daubed it with untempered morter* the false-peace wall whitewashed over its weakness; the whited wall Paul names (Acts 23:3).'
  FROM cross_reference_threads t, cross_references x, _s217_a23_lookup sv, _s217_a23_lookup tv
 WHERE t.slug='acts-23-thou-whited-wall-the-untempered-morter-and-righteous-judgment'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=23 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=13 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 13:14 — *So will I break down the wall that ye have daubed with untempered morter … and ye shall know that I am Yahuah (LORD)* the verdict Paul speaks over the whited wall (Acts 23:3).'
  FROM cross_reference_threads t, cross_references x, _s217_a23_lookup sv, _s217_a23_lookup tv
 WHERE t.slug='acts-23-thou-whited-wall-the-untempered-morter-and-righteous-judgment'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=23 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=13 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 13:15 — *Thus will I accomplish my wrath upon the wall, and upon them that have daubed it* the fair front falls with those who built it (Acts 23:3).'
  FROM cross_reference_threads t, cross_references x, _s217_a23_lookup sv, _s217_a23_lookup tv
 WHERE t.slug='acts-23-thou-whited-wall-the-untempered-morter-and-righteous-judgment'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=23 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=13 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Leviticus 19:15 — *in righteousness shalt thou judge thy neighbour* the standing Torah of righteous judgment Paul appeals to against the high priest (Acts 23:3).'
  FROM cross_reference_threads t, cross_references x, _s217_a23_lookup sv, _s217_a23_lookup tv
 WHERE t.slug='acts-23-thou-whited-wall-the-untempered-morter-and-righteous-judgment'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=23 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-23-thou-shalt-not-speak-evil-of-the-ruler-paul-corrected-by-torah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 22:28 — *Thou shalt not revile the gods, nor curse the ruler of thy people* the written word Paul submits to mid-rebuke; the Torah-keeper governed by the book (Acts 23:5).'
  FROM cross_reference_threads t, cross_references x, _s217_a23_lookup sv, _s217_a23_lookup tv
 WHERE t.slug='acts-23-thou-shalt-not-speak-evil-of-the-ruler-paul-corrected-by-torah'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=23 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=22 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-23-the-hope-and-resurrection-of-the-dead-the-tanakh-hope
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 12:2 — *many of them that sleep in the dust of the earth shall awake, some to everlasting life* the prophets'' own resurrection hope Paul is tried for (Acts 23:6).'
  FROM cross_reference_threads t, cross_references x, _s217_a23_lookup sv, _s217_a23_lookup tv
 WHERE t.slug='acts-23-the-hope-and-resurrection-of-the-dead-the-tanakh-hope'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=23 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Job 19:25 — *I know that my redeemer liveth, and that he shall stand at the latter day upon the earth* the living Redeemer in whom the dust-sleepers'' awaking is sure (Acts 23:6).'
  FROM cross_reference_threads t, cross_references x, _s217_a23_lookup sv, _s217_a23_lookup tv
 WHERE t.slug='acts-23-the-hope-and-resurrection-of-the-dead-the-tanakh-hope'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=23 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=19 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Job 19:26 — *in my flesh shall I see Elohim (God)* the very flesh raised to see Elohim (God), not a flight from the body (Acts 23:6).'
  FROM cross_reference_threads t, cross_references x, _s217_a23_lookup sv, _s217_a23_lookup tv
 WHERE t.slug='acts-23-the-hope-and-resurrection-of-the-dead-the-tanakh-hope'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=23 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=19 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 26:19 — *Thy dead men shall live … Awake and sing, ye that dwell in dust … the earth shall cast out the dead* the gathering hope the Sadducees deny (Acts 23:6,8).'
  FROM cross_reference_threads t, cross_references x, _s217_a23_lookup sv, _s217_a23_lookup tv
 WHERE t.slug='acts-23-the-hope-and-resurrection-of-the-dead-the-tanakh-hope'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=23 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=26 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-23-yahuah-stood-by-him-the-master-keeps-and-sends-to-rome
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joshua 1:5 — *as I was with Mosheh (Moses), so I will be with thee: I will not fail thee, nor forsake thee* the Formed who went with Yehoshua (Joshua) stands by Paul (Acts 23:11).'
  FROM cross_reference_threads t, cross_references x, _s217_a23_lookup sv, _s217_a23_lookup tv
 WHERE t.slug='acts-23-yahuah-stood-by-him-the-master-keeps-and-sends-to-rome'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=23 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=1 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Joshua 1:9 — *be not afraid … for Yahuah Elohayka (the LORD thy God) is with thee whithersoever thou goest* the charge to Yehoshua (Joshua) now carried to Paul, even unto Rome (Acts 23:11).'
  FROM cross_reference_threads t, cross_references x, _s217_a23_lookup sv, _s217_a23_lookup tv
 WHERE t.slug='acts-23-yahuah-stood-by-him-the-master-keeps-and-sends-to-rome'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=23 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=1 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 1:8 — *Be not afraid of their faces: for I am with thee to deliver thee, saith Yahuah (LORD)* the word to the prophet now the word to Paul before the council (Acts 23:11).'
  FROM cross_reference_threads t, cross_references x, _s217_a23_lookup sv, _s217_a23_lookup tv
 WHERE t.slug='acts-23-yahuah-stood-by-him-the-master-keeps-and-sends-to-rome'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=23 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=1 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jeremiah 1:19 — *they shall fight against thee; but they shall not prevail against thee; for I am with thee … to deliver thee* the forty''s plot cannot break what the Master appointed (Acts 23:11-13).'
  FROM cross_reference_threads t, cross_references x, _s217_a23_lookup sv, _s217_a23_lookup tv
 WHERE t.slug='acts-23-yahuah-stood-by-him-the-master-keeps-and-sends-to-rome'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=23 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=1 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Isaiah 41:10 — *Fear thou not; for I am with thee … I will uphold thee with the right hand of my righteousness* the upholding hand that holds the witness up (Acts 23:11).'
  FROM cross_reference_threads t, cross_references x, _s217_a23_lookup sv, _s217_a23_lookup tv
 WHERE t.slug='acts-23-yahuah-stood-by-him-the-master-keeps-and-sends-to-rome'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=23 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=41 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Acts 18:9 — *Be not afraid, but speak, and hold not thy peace* the same voice stood by at Corinth; told to speak there, told he will speak at Rome (Acts 23:11).'
  FROM cross_reference_threads t, cross_references x, _s217_a23_lookup sv, _s217_a23_lookup tv
 WHERE t.slug='acts-23-yahuah-stood-by-him-the-master-keeps-and-sends-to-rome'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=23 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=18 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Acts 18:10 — *I am with thee, and no man shall set on thee to hurt thee* the One who shielded him at Corinth shields him from the forty (Acts 23:11).'
  FROM cross_reference_threads t, cross_references x, _s217_a23_lookup sv, _s217_a23_lookup tv
 WHERE t.slug='acts-23-yahuah-stood-by-him-the-master-keeps-and-sends-to-rome'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=23 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=18 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 8, E'Acts 27:23 — *there stood by me this night the angel of Elohim (God), whose I am, and whom I serve* the Master stands by again in the storm at sea (Acts 23:11).'
  FROM cross_reference_threads t, cross_references x, _s217_a23_lookup sv, _s217_a23_lookup tv
 WHERE t.slug='acts-23-yahuah-stood-by-him-the-master-keeps-and-sends-to-rome'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=23 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=27 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 9, E'Acts 27:24 — *Fear not, Paul; thou must be brought before Cæsar* the Jerusalem promise sealed in the storm; the witness must reach Rome (Acts 23:11).'
  FROM cross_reference_threads t, cross_references x, _s217_a23_lookup sv, _s217_a23_lookup tv
 WHERE t.slug='acts-23-yahuah-stood-by-him-the-master-keeps-and-sends-to-rome'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=23 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=27 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
