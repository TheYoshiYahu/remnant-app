-- ----- fragment: minion_acts_25.sql (S217 Acts 25) -----
-- =====================================================================
-- S217 minion — ACTS 25 FULL-LIBRARY cross-references
-- =====================================================================
-- Anchor chapter: ACTS 25.  Tag: a25 (temp view _s217_a25_lookup).  Sort band: 5875-5881.
-- Source is ALWAYS the canon Acts verse; targets span Tanakh + extra-canonical + NT.
-- Tiers per-row: canon target = 'free'; extra-canonical target = 'extras'.
-- (Acts 25 lands all-canon targets — every row 'free', every thread 'free'.)
--
-- Acts 25 is mostly legal-procedural narration: Festus arrives; the Yahudim (Jews) renew the
-- plot (the lying-in-wait of ch. 23 continued); Paul answers that he has offended nothing
-- against the law, the temple, or Caesar; Paul appeals unto Caesar (the providential turn that
-- carries him to Rome as Yahuah (Lord) said he must); Festus lays the cause before Agrippa and
-- reduces the whole charge to "one Yahusha, dead, whom Paul affirmed alive" — the resurrection
-- on trial. The load-bearing weight is thin; "none warranted" is the right answer for the
-- procedural verses. THREE threads curated; the rest recorded as weighed and not added.
--
-- WATCHPOINTS (the dropped-Paul diagnostic, Christology, resurrection):
--  * 25:8 "Neither against the law of the Yahudim (Jews) ... have I offended any thing at all"
--    is the DROPPED-PAUL thread: Paul the Torah-observant Benjamite never abandoned the law —
--    the same man who worshipped the Elohim (God) of the fathers, believing all written in the
--    law and the prophets (24:14), who committed nothing against the customs of the fathers
--    (28:17). The contradiction the inherited reading hangs on Paul is the interpreter's, not
--    Paul's. NEVER let Paul read as anti-Torah.
--  * 25:11-12 "I appeal unto Cæsar ... unto Cæsar shalt thou go" is the providence the Formed
--    himself foretold: Yahuah (Lord) stood by Paul and said *so must thou bear witness also at
--    Rome* (23:11); the storm-angel repeats *thou must be brought before Cæsar* (27:24). The
--    appeal is not Paul escaping but the Lord's word being carried to the nations' capital —
--    the witness brought to Rome as he said it must.
--  * 25:19 the whole charge is "one Yahusha (Jesus), which was dead, whom Paul affirmed to be
--    alive" — the resurrection is the entire question. This is the hope of Yashar'el (Israel)
--    (26:6-8), the awaking of them that sleep in the dust (Daniel 12:2), the Messiah the first
--    to rise (26:23). The Sadducee-and-Roman cannot grasp the risen One; the framework reads
--    the resurrection as the Tanakh hope of the fathers vindicated in the Formed who took on
--    flesh, died, and rose — never a Greek immortal-soul abstraction.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every block):
--  ACTS 25:
--   v.1-5   Festus to Jerusalem; the renewed plot/lying-in-wait
--           Tanakh: none warranted (the conspiracy carried in the ch.23 Acts<->Acts witness)  Extras: none warranted  NT: none added (Acts 23:12-15 weighed — the same plot; carried thematically in the appeal thread, not a separate add)
--   v.6-7   judgment seat; grievous complaints they could not prove
--           Tanakh: Psalm 35:11 weighed (false witnesses rose up; charged what I knew not) — narrative-parallel, framework weight thin, not added  Extras: none warranted  NT: none warranted
--   v.8     "Neither against the law ... have I offended any thing at all"
--           Tanakh: none added (the law-faithfulness carried by the NT Paul-witness targets)  Extras: none warranted  NT: Acts 24:14, Acts 28:17  [DROPPED-PAUL thread]
--   v.9-10  "Wilt thou go up to Jerusalem"; "I stand at Cæsar's judgment seat"
--           Tanakh: none warranted  Extras: none warranted  NT: none added (carried in the appeal thread)
--   v.11-12 "I appeal unto Cæsar ... unto Cæsar shalt thou go"
--           Tanakh: none warranted  Extras: none warranted  NT: Acts 23:11, Acts 27:24  [APPEAL/SENDING-TO-ROME thread]
--   v.13-18 Agrippa and Bernice; Festus rehearses the cause to the king
--           Tanakh: none warranted  Extras: none warranted  NT: none warranted (procedural rehearsal)
--   v.19    "one Yahusha (Jesus), which was dead, whom Paul affirmed to be alive"
--           Tanakh: Daniel 12:2 (they that sleep in the dust shall awake)  Extras: none warranted (2 Maccabees 7 resurrection-hope weighed — carried, not added; the Tanakh + NT witnesses are load-bearing here)  NT: Acts 24:15, Acts 26:8, Acts 26:23  [RESURRECTION-ON-TRIAL thread]
--   v.20-22 Festus doubts; Paul appealed to Augustus; Agrippa "I would also hear the man myself"
--           Tanakh: none warranted  Extras: none warranted  NT: none warranted (procedural)
--   v.23-27 the hearing convened; "no certain thing to write unto my lord"; unreasonable to send a prisoner without crimes
--           Tanakh: none warranted  Extras: none warranted  NT: none warranted (procedural; the no-cause-of-death verdict echoed in 26:31 / 28:18, carried in the appeal thread's prose)
--
-- THREADS (slug -> target libraries):
--   5875 acts-25-i-have-offended-nothing-against-the-law-the-torah-faithful-paul   (NT, Acts<->Acts)
--   5878 acts-25-i-appeal-unto-caesar-so-must-thou-bear-witness-at-rome            (NT, Acts<->Acts)
--   5881 acts-25-one-yahusha-dead-whom-paul-affirmed-alive-the-resurrection-on-trial (Tanakh + NT)
-- =====================================================================

CREATE TEMP VIEW _s217_a25_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: acts-25-i-have-offended-nothing-against-the-law-the-torah-faithful-paul
  ('canon', 'acts', 25, 8, 'canon', 'acts', 24, 14, 'free', E'*But this I confess unto thee, that after the way which they call heresy, so worship I the Elohim (God) of my fathers, believing all things which are written in the law and in the prophets:* (Acts 24:14). Before Festus Paul answers *Neither against the law of the Yahudim (Jews), neither against the temple, nor yet against Cæsar, have I offended any thing at all* (Acts 25:8). The man they accuse is the man who worships the Elohim (God) of the fathers *believing all things which are written in the law and in the prophets* — he has not abandoned the law; he keeps it. The charge that he offended against the law collapses on the witness of his own confession: the way they call heresy is the law and the prophets believed whole.'),
  ('canon', 'acts', 25, 8, 'canon', 'acts', 28, 17, 'free', E'*And it came to pass, that after three days Paul called the chief of the Yahudim (Jews) together: and when they were come together, he said unto them, Men and brethren, though I have committed nothing against the people, or customs of our fathers, yet was I delivered prisoner from Jerusalem into the hands of the Romans.* (Acts 28:17). What Paul pleads before Festus — *neither against the law of the Yahudim (Jews) ... have I offended any thing at all* (Acts 25:8) — he says again at Rome: *I have committed nothing against the people, or customs of our fathers.* The same testimony stands from Cæsarea to Rome: the apostle is the Torah-faithful son of his fathers, not a breaker of the law. The contradiction the accusers hang on him is theirs, not his.'),
  -- thread: acts-25-i-appeal-unto-caesar-so-must-thou-bear-witness-at-rome
  ('canon', 'acts', 25, 11, 'canon', 'acts', 23, 11, 'free', E'*And the night following Yahuah (Lord) stood by him, and said, Be of good cheer, Paul: for as thou hast testified of me in Jerusalem, so must thou bear witness also at Rome.* (Acts 23:11). When Paul cries *I appeal unto Cæsar* (Acts 25:11), it is not a man scrambling to save himself but the Lord''s own word being carried out. Yahuah (Lord) had stood by him in the night and said he *must* bear witness at Rome; the appeal is the road the Formed himself laid — the testimony pressed on to the capital of the nations exactly as he said it must go.'),
  ('canon', 'acts', 25, 11, 'canon', 'acts', 27, 24, 'free', E'*Saying, Fear not, Paul; thou must be brought before Cæsar: and, lo, Elohim (God) hath given thee all them that sail with thee.* (Acts 27:24). The appeal — *I appeal unto Cæsar* (Acts 25:11) — is sealed by the angel in the storm: *thou must be brought before Cæsar.* Even when the ship is breaking and all hope of being saved is taken away, the word holds: Paul *must* stand before Cæsar, because the witness must reach Rome. The appeal is not a wager on Roman justice but the means by which the Lord''s sending is accomplished.'),
  ('canon', 'acts', 25, 12, 'canon', 'acts', 23, 11, 'free', E'*And the night following Yahuah (Lord) stood by him, and said, Be of good cheer, Paul: for as thou hast testified of me in Jerusalem, so must thou bear witness also at Rome.* (Acts 23:11). Festus answers *Hast thou appealed unto Cæsar? unto Cæsar shalt thou go* (Acts 25:12) — and with that the governor unknowingly speaks the Lord''s own purpose. The night Yahuah (Lord) stood by Paul he said *so must thou bear witness also at Rome;* now the Roman verdict sends him there. The plot to kill him in Jerusalem is overruled, and the road to Rome opens through the very appeal the enemy meant to thwart.'),
  -- thread: acts-25-one-yahusha-dead-whom-paul-affirmed-alive-the-resurrection-on-trial
  ('canon', 'acts', 25, 19, 'canon', 'acts', 24, 15, 'free', E'*And have hope toward Elohim (God), which they themselves also allow, that there shall be a resurrection of the dead, both of the just and unjust.* (Acts 24:15). Festus, baffled, reduces the whole case to *certain questions against him of their own superstition, and of one Yahusha (Jesus), which was dead, whom Paul affirmed to be alive* (Acts 25:19). The Roman hears a quarrel over a dead man; Paul had already named the real matter — *hope toward Elohim (God) ... that there shall be a resurrection of the dead.* The resurrection is the whole trial: not a disputed corpse but the living hope that the dead are raised, fixed now on the One Paul affirms is alive.'),
  ('canon', 'acts', 25, 19, 'canon', 'acts', 26, 8, 'free', E'*Why should it be thought a thing incredible with you, that Elohim (God) should raise the dead?* (Acts 26:8). To Festus the charge is *one Yahusha (Jesus), which was dead, whom Paul affirmed to be alive* (Acts 25:19) — a thing the Roman cannot weigh. Paul puts the very question to the hearing: *Why should it be thought a thing incredible with you, that Elohim (God) should raise the dead?* What sounds to Festus like superstition over a dead man is the power of the living Elohim (God) who raises — the resurrection that is the hope of the fathers, not an incredible tale.'),
  ('canon', 'acts', 25, 19, 'canon', 'acts', 26, 23, 'free', E'*That Messiah (Christ) should suffer, and that he should be the first that should rise from the dead, and should shew light unto the people, and to the Gentiles.* (Acts 26:23). Festus names the dispute as being over *one Yahusha (Jesus), which was dead, whom Paul affirmed to be alive* (Acts 25:19); Paul names what it truly is — *that Messiah (Christ) should suffer, and that he should be the first that should rise from the dead.* The prophets and Moses said it should come; the One affirmed alive is the firstfruits of the resurrection, the suffering and risen Messiah (Christ) the whole charge circles without grasping.'),
  ('canon', 'acts', 25, 19, 'canon', 'daniel', 12, 2, 'free', E'*And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* (Daniel 12:2). The charge Festus cannot fathom — *one Yahusha (Jesus), which was dead, whom Paul affirmed to be alive* (Acts 25:19) — is the hope the prophet sealed long before: *many of them that sleep in the dust of the earth shall awake.* The resurrection on trial is no novelty and no Greek immortal-soul tale; it is the awaking of the dust the Tanakh promised, now broken open in the One who died and was affirmed alive — the firstfruits of all who sleep.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s217_a25_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s217_a25_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-25-i-have-offended-nothing-against-the-law-the-torah-faithful-paul',
       E'I have offended nothing against the law — the Torah-faithful Paul',
       E'Standing before Festus, Paul answers the renewed accusation plainly: *Neither against the law of the Yahudim (Jews), neither against the temple, nor yet against Cæsar, have I offended any thing at all* (Acts 25:8). The man on trial as a law-breaker is in fact the law''s faithful son. He had already confessed it to Felix: *after the way which they call heresy, so worship I the Elohim (God) of my fathers, believing all things which are written in the law and in the prophets* (Acts 24:14). And he will say it once more at Rome: *though I have committed nothing against the people, or customs of our fathers, yet was I delivered prisoner from Jerusalem into the hands of the Romans* (Acts 28:17). From Cæsarea to Rome the testimony never shifts — Paul kept the law, worshipped the Elohim (God) of the fathers, held the law and the prophets whole. The contradiction his accusers press on him, and that later readers would hang on him, is theirs and not his: the apostle they call a destroyer of the law is the man who offended nothing against it at all.',
       sv.verse_id, ev.verse_id, 'free', 5875
  FROM _s217_a25_lookup sv, _s217_a25_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=25 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=25 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-25-i-appeal-unto-caesar-so-must-thou-bear-witness-at-rome',
       E'I appeal unto Cæsar — so must thou bear witness at Rome',
       E'When Festus, *willing to do the Yahudim (Jews) a pleasure* (Acts 25:9), asks whether Paul will go up to Jerusalem to be judged — back into the city where more than forty men had bound themselves under a curse to kill him — Paul refuses the trap and speaks the words that turn the whole account: *I appeal unto Cæsar* (Acts 25:11). Festus answers, *Hast thou appealed unto Cæsar? unto Cæsar shalt thou go* (Acts 25:12). It reads like a prisoner''s legal gambit, but it is the Lord''s own word being carried out. The night the plot was first laid, *Yahuah (Lord) stood by him, and said, Be of good cheer, Paul: for as thou hast testified of me in Jerusalem, so must thou bear witness also at Rome* (Acts 23:11). And when the ship that bears him is breaking apart and all hope is taken away, the angel says it yet again: *Fear not, Paul; thou must be brought before Cæsar* (Acts 27:24). The appeal is not Paul escaping death but the testimony being pressed on to the capital of the nations exactly as he was told it must go. The conspiracy to kill him in Jerusalem is overruled, and through the very appeal the enemy could not block, the witness reaches Rome.',
       sv.verse_id, ev.verse_id, 'free', 5878
  FROM _s217_a25_lookup sv, _s217_a25_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=25 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=25 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-25-one-yahusha-dead-whom-paul-affirmed-alive-the-resurrection-on-trial',
       E'One Yahusha (Jesus), dead, whom Paul affirmed alive — the resurrection on trial',
       E'When Festus lays the cause before Agrippa, he cannot make sense of it: the accusers brought no crime he expected, *but had certain questions against him of their own superstition, and of one Yahusha (Jesus), which was dead, whom Paul affirmed to be alive* (Acts 25:19). To the Roman it is a quarrel over a dead man. But that one sentence is the whole trial. Paul had named the real matter to Felix: *have hope toward Elohim (God), which they themselves also allow, that there shall be a resurrection of the dead, both of the just and unjust* (Acts 24:15). And he presses the question on the hearing itself: *Why should it be thought a thing incredible with you, that Elohim (God) should raise the dead?* (Acts 26:8). This hope is no novelty and no Greek tale of an immortal soul — the prophet sealed it long before: *many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt* (Daniel 12:2). What stands now is that the hope has broken open in One: *that Messiah (Christ) should suffer, and that he should be the first that should rise from the dead, and should shew light unto the people, and to the Gentiles* (Acts 26:23). The dead man Festus shrugs at is the firstfruits of the awaking of the dust — the hope of the fathers vindicated in the One Paul affirms is alive.',
       sv.verse_id, ev.verse_id, 'free', 5881
  FROM _s217_a25_lookup sv, _s217_a25_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=25 AND sv.verse_number=19
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=25 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: acts-25-i-have-offended-nothing-against-the-law-the-torah-faithful-paul
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Acts 24:14 — *so worship I the Elohim (God) of my fathers, believing all things which are written in the law and in the prophets* the man accused of offending the law keeps the law and the prophets whole (Acts 25:8).'
  FROM cross_reference_threads t, cross_references x, _s217_a25_lookup sv, _s217_a25_lookup tv
 WHERE t.slug='acts-25-i-have-offended-nothing-against-the-law-the-torah-faithful-paul'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=25 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=24 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Acts 28:17 — *I have committed nothing against the people, or customs of our fathers* the same testimony repeated at Rome; the Torah-faithful son from Cæsarea to the capital (Acts 25:8).'
  FROM cross_reference_threads t, cross_references x, _s217_a25_lookup sv, _s217_a25_lookup tv
 WHERE t.slug='acts-25-i-have-offended-nothing-against-the-law-the-torah-faithful-paul'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=25 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=28 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-25-i-appeal-unto-caesar-so-must-thou-bear-witness-at-rome
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Acts 23:11 — *so must thou bear witness also at Rome* Yahuah (Lord) had already named the road; the appeal is the Lord''s word carried out (Acts 25:11).'
  FROM cross_reference_threads t, cross_references x, _s217_a25_lookup sv, _s217_a25_lookup tv
 WHERE t.slug='acts-25-i-appeal-unto-caesar-so-must-thou-bear-witness-at-rome'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=25 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=23 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Acts 27:24 — *thou must be brought before Cæsar* the storm-angel seals the appeal; even shipwreck cannot break the sending to Rome (Acts 25:11).'
  FROM cross_reference_threads t, cross_references x, _s217_a25_lookup sv, _s217_a25_lookup tv
 WHERE t.slug='acts-25-i-appeal-unto-caesar-so-must-thou-bear-witness-at-rome'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=25 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=27 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 23:11 — *so must thou bear witness also at Rome* Festus'' *unto Cæsar shalt thou go* unknowingly speaks the Lord''s own purpose (Acts 25:12).'
  FROM cross_reference_threads t, cross_references x, _s217_a25_lookup sv, _s217_a25_lookup tv
 WHERE t.slug='acts-25-i-appeal-unto-caesar-so-must-thou-bear-witness-at-rome'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=25 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=23 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-25-one-yahusha-dead-whom-paul-affirmed-alive-the-resurrection-on-trial
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Acts 24:15 — *that there shall be a resurrection of the dead, both of the just and unjust* the hope Festus mistakes for a quarrel over a dead man (Acts 25:19).'
  FROM cross_reference_threads t, cross_references x, _s217_a25_lookup sv, _s217_a25_lookup tv
 WHERE t.slug='acts-25-one-yahusha-dead-whom-paul-affirmed-alive-the-resurrection-on-trial'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=25 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=24 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Acts 26:8 — *Why should it be thought a thing incredible with you, that Elohim (God) should raise the dead?* the very question behind the charge Festus cannot weigh (Acts 25:19).'
  FROM cross_reference_threads t, cross_references x, _s217_a25_lookup sv, _s217_a25_lookup tv
 WHERE t.slug='acts-25-one-yahusha-dead-whom-paul-affirmed-alive-the-resurrection-on-trial'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=25 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=26 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 26:23 — *that he should be the first that should rise from the dead* the One affirmed alive is the firstfruits of the resurrection the prophets foretold (Acts 25:19).'
  FROM cross_reference_threads t, cross_references x, _s217_a25_lookup sv, _s217_a25_lookup tv
 WHERE t.slug='acts-25-one-yahusha-dead-whom-paul-affirmed-alive-the-resurrection-on-trial'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=25 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=26 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Daniel 12:2 — *many of them that sleep in the dust of the earth shall awake* the resurrection on trial is the Tanakh hope of the awaking dust, not a Greek immortal-soul tale (Acts 25:19).'
  FROM cross_reference_threads t, cross_references x, _s217_a25_lookup sv, _s217_a25_lookup tv
 WHERE t.slug='acts-25-one-yahusha-dead-whom-paul-affirmed-alive-the-resurrection-on-trial'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=25 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
