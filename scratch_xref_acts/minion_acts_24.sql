-- ----- fragment: minion_acts_24.sql (S217 Acts 24) -----
-- =====================================================================
-- S217 minion — ACTS 24 FULL-LIBRARY cross-references
-- =====================================================================
-- Anchor chapter: ACTS 24.  Tag: a24 (temp view _s217_a24_lookup).  Sort band: 5850-5874 (step 3).
-- Source is ALWAYS the canon Acts 24 verse; targets span Tanakh + extra-canonical + NT.
-- Tiers per-row: canon target = 'free'; extra-canonical target = 'extras'.
--
-- FRAMING (Red Lines #4/#5/#6, the Dropped-Paul correction, the resurrection hope):
--  * Acts 24:14 is the keystone: Paul EXPLICITLY confesses *that after the way which they call
--    heresy, so worship I the Elohim (God) of my fathers, believing all things which are written
--    in the law and in the prophets* (Acts 24:14). The whole chapter frames Paul as the
--    Torah-and-Prophets-faithful witness; the "heresy"/"sect of the Nazarenes" charge is the
--    false naming of the true Way. The Paul who abolished the Torah does not exist — here he
--    declares he believes ALL that is written in the law and the prophets and has offended
--    nothing *neither against the law of the Yahudim (Jews), neither against the temple* (24:20,
--    cf. 24:12-13,18). Never let the inherited antinomian Paul surface.
--  * The resurrection hope (24:15,21) is the Tanakh hope, not a new doctrine: *there shall be a
--    resurrection of the dead, both of the just and unjust* (24:15) = Daniel 12:2's *many of them
--    that sleep in the dust of the earth shall awake.* It is *the hope of the promise made of
--    Elohim (God) unto our fathers* to which *our twelve tribes* hope to come (Acts 26:6-7) — the
--    twelve-tribe gathering hope, never a graft of a new people. The 2 Maccabees 7 martyrs who
--    die *for his laws* expecting to be *raised up again* bind Torah-faithfulness to the
--    resurrection hope exactly as Paul does here.
--  * Felix trembling at *righteousness, temperance, and judgment to come* (24:25): the judgment
--    is real and operative (Ecclesiastes 12:14; the resurrection of the unjust, Daniel 12:2) —
--    grace does not stand the believer outside the judgment. No sola-fide truncation.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every block):
--  ACTS 24:
--   v.1-9   Tertullus accuses (pestilent fellow / sect of the Nazarenes / profane the temple)
--           Tanakh: none warranted (the false-naming-of-the-Way is carried in the 24:14 Way thread via Acts 9:2 / 22:4)
--           Extras: none warranted   NT: none added here (narrative accusation; the Way thread anchors at 24:14)
--   v.10-13 Paul: twelve days, found me neither in temple disputing nor stirring, cannot prove it
--           Tanakh: none warranted   Extras: none warranted   NT: none added (the offended-nothing point carried at 24:14/24:20 Way thread)
--   v.14    KEYSTONE — the way they call heresy / worship the Elohim (God) of my fathers
--           Tanakh: Isaiah 26:7, Isaiah 26:8 (the way of the just, waiting in the way of thy judgments)
--           Extras: none warranted
--           NT: Acts 9:2, Acts 22:4 (this Way persecuted/named); Luke 24:27, Luke 24:44, Acts 26:22, Acts 28:23 (believing-all-written thread)
--   v.15    a resurrection of the dead, both of the just and unjust
--           Tanakh: Daniel 12:2, Job 19:25, Job 19:26, Isaiah 26:19
--           Extras: 2 Maccabees 7:9, 2 Maccabees 7:14, 2 Maccabees 7:23 (the King of the world shall raise us up — for his laws)
--           NT: Acts 26:6, Acts 26:7, Acts 26:8 (the hope of the promise, the twelve tribes)
--   v.16    a conscience void of offence toward Elohim (God) and toward men
--           Tanakh: none added (carried thematically in the Torah-faithful/the-Way framing)   Extras: none warranted   NT: none warranted
--   v.17-19 came to bring alms to my nation and offerings; found purified in the temple
--           Tanakh: none warranted   Extras: none warranted   NT: Acts 21:24, Acts 21:26 weighed (Paul keeps the law / purifies in the temple / offering) — carried in the believing-all-written thread member at 24:14 prose, not separately added (band economy)
--   v.20-21 let them say what evil; except this one voice — the resurrection
--           Tanakh: (resurrection carried at 24:15)   Extras: (carried at 24:15)   NT: (carried at 24:15)
--   v.22-24 Felix defers; hears Paul concerning the faith in Messiah (Christ)
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted (narrative)
--   v.25    righteousness, temperance, and judgment to come — Felix trembled
--           Tanakh: Ecclesiastes 12:14, Daniel 12:2
--           Extras: none warranted   NT: none warranted
--   v.26-27 Felix hopes for a bribe; leaves Paul bound
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted (narrative)
--
-- THREADS (slug -> target libraries):
--   5850 acts-24-the-way-which-they-call-heresy-the-true-worship-of-the-god-of-the-fathers  (NT, Acts<->Acts + Tanakh)
--   5853 acts-24-believing-all-things-written-the-law-and-the-prophets-faithful-witness     (NT)
--   5856 acts-24-a-resurrection-of-the-just-and-the-unjust-the-tanakh-hope                  (Tanakh + extras + NT)  [tier_required extras]
--   5859 acts-24-righteousness-temperance-and-judgment-to-come-felix-trembled               (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s217_a24_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: acts-24-the-way-which-they-call-heresy-the-true-worship-of-the-god-of-the-fathers
  ('canon', 'acts', 24, 14, 'canon', 'acts', 9, 2, 'free', E'*And desired of him letters to Damascus to the synagogues, that if he found any of this way, whether they were men or women, he might bring them bound unto Jerusalem.* (Acts 9:2). Tertullus brands Paul *a ringleader of the sect of the Nazarenes* (Acts 24:5), but Paul answers by naming it rightly: *after the way which they call heresy, so worship I the Elohim (God) of my fathers* (Acts 24:14). It is *this way* Saul himself once hunted men and women to bind — the very Way he now confesses is the true worship of the Elohim (God) of the fathers. The accusers'' word for it is *heresy;* the thing itself is the faith of Abraham, Isaac, and Jacob.'),
  ('canon', 'acts', 24, 14, 'canon', 'acts', 22, 4, 'free', E'*And I persecuted this way unto the death, binding and delivering into prisons both men and women.* (Acts 22:4). Paul testifies that he once *persecuted this way unto the death* — and now stands accused of belonging to it, *the way which they call heresy* (Acts 24:14). The name *heresy* is the false naming of the true Way; the man who once jailed those who walked it now worships *the Elohim (God) of my fathers* in it, the same covenant faith he was raised in, not a departure from it.'),
  ('canon', 'acts', 24, 14, 'canon', 'isaiah', 26, 7, 'free', E'*The way of the just is uprightness: thou, most upright, dost weigh the path of the just.* (Isaiah 26:7). What Tertullus calls *heresy* Paul calls *the way which they call heresy, so worship I the Elohim (God) of my fathers, believing all things which are written in the law and in the prophets* (Acts 24:14). Isaiah names this Way long before: *the way of the just,* the path the Most Upright himself weighs. The Way is not a new sect breaking from the fathers'' faith; it is the upright path the prophets already mapped.'),
  ('canon', 'acts', 24, 14, 'canon', 'isaiah', 26, 8, 'free', E'*Yea, in the way of thy judgments, O Yahuah (LORD), have we waited for thee; the desire of our soul is to thy name, and to the remembrance of thee.* (Isaiah 26:8). Paul confesses he worships *the Elohim (God) of my fathers* in *the way which they call heresy* (Acts 24:14) — the very posture Isaiah voices for the faithful, waiting on Yahuah (LORD) *in the way of thy judgments.* The Way Paul walks is the waiting-on-Yahuah of the prophets, with the resurrection hope (Acts 24:15) its forward look, not an abandonment of the law and the prophets he names in the same breath.'),
  -- thread: acts-24-believing-all-things-written-the-law-and-the-prophets-faithful-witness
  ('canon', 'acts', 24, 14, 'canon', 'luke', 24, 27, 'free', E'*And beginning at Moses and all the prophets, he expounded unto them in all the scriptures the things concerning himself.* (Luke 24:27). Paul stakes his whole defense on *believing all things which are written in the law and in the prophets* (Acts 24:14) — the very scriptures the risen Messiah (Christ) opened on the Emmaus road, *beginning at Moses and all the prophets.* Paul believes nothing the Master did not first unfold from Moses and the prophets; the faith they call heresy is the law and the prophets read whole.'),
  ('canon', 'acts', 24, 14, 'canon', 'luke', 24, 44, 'free', E'*And he said unto them, These are the words which I spake unto you, while I was yet with you, that all things must be fulfilled, which were written in the law of Moses, and in the prophets, and in the psalms, concerning me.* (Luke 24:44). When Paul says he is *believing all things which are written in the law and in the prophets* (Acts 24:14), he believes exactly what the Master named must be fulfilled — *all things … written in the law of Moses, and in the prophets, and in the psalms.* The accusation of *heresy* falls against a man whose only confession is the whole of Moses and the prophets, fulfilled.'),
  ('canon', 'acts', 24, 14, 'canon', 'acts', 26, 22, 'free', E'*Having therefore obtained help of Elohim (God), I continue unto this day, witnessing both to small and great, saying none other things than those which the prophets and Moses did say should come:* (Acts 26:22). Before Felix Paul confesses he believes *all things which are written in the law and in the prophets* (Acts 24:14); before Agrippa he says he witnesses *none other things than those which the prophets and Moses did say should come.* The same testimony twice over: Paul adds nothing to Moses and the prophets, and takes nothing from them — the Torah-and-Prophets-faithful witness, not a teacher against them.'),
  ('canon', 'acts', 24, 14, 'canon', 'acts', 28, 23, 'free', E'*And when they had appointed him a day, there came many to him into his lodging; to whom he expounded and testified the kingdom of Elohim (God), persuading them concerning Yahusha (Jesus), both out of the law of Moses, and out of the prophets, from morning till evening.* (Acts 28:23). Paul''s confession before Felix — *believing all things which are written in the law and in the prophets* (Acts 24:14) — is the same well he draws from to the end: in Rome he persuades concerning Yahusha (Jesus) *both out of the law of Moses, and out of the prophets, from morning till evening.* The Way they call heresy is Moses and the prophets opened, never set aside.'),
  -- thread: acts-24-a-resurrection-of-the-just-and-the-unjust-the-tanakh-hope
  ('canon', 'acts', 24, 15, 'canon', 'daniel', 12, 2, 'free', E'*And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* (Daniel 12:2). Paul''s hope is no new doctrine: *that there shall be a resurrection of the dead, both of the just and unjust* (Acts 24:15). Daniel saw it first — those who sleep in the dust awakened, *some to everlasting life, and some to shame and everlasting contempt.* The just and the unjust both raised: the resurrection Paul holds is the hope the prophets already spoke, the Tanakh''s own.'),
  ('canon', 'acts', 24, 15, 'canon', 'job', 19, 25, 'free', E'*For I know that my redeemer liveth, and that he shall stand at the latter day upon the earth:* (Job 19:25). Long before Paul stood before Felix declaring *hope toward Elohim (God) … that there shall be a resurrection of the dead* (Acts 24:15), Job confessed it from the ash-heap: *my redeemer liveth, and … he shall stand at the latter day upon the earth.* The resurrection hope runs back to the oldest words of the fathers; Paul holds what Job held.'),
  ('canon', 'acts', 24, 15, 'canon', 'job', 19, 26, 'free', E'*And though after my skin worms destroy this body, yet in my flesh shall I see Elohim (God):* (Job 19:26). Paul''s *resurrection of the dead, both of the just and unjust* (Acts 24:15) is the very thing Job awaited in his flesh: *though after my skin worms destroy this body, yet in my flesh shall I see Elohim (God).* Bodily resurrection — the dead raised to see Elohim (God) — is the ancient hope of the covenant, not a thing Paul invented to defend himself.'),
  ('canon', 'acts', 24, 15, 'canon', 'isaiah', 26, 19, 'free', E'*Thy dead men shall live, together with my dead body shall they arise. Awake and sing, ye that dwell in dust: for thy dew is as the dew of herbs, and the earth shall cast out the dead.* (Isaiah 26:19). When Paul names *a resurrection of the dead* (Acts 24:15) he names what Isaiah sang: *thy dead men shall live … awake and sing, ye that dwell in dust … the earth shall cast out the dead.* The prophets summoned the dust to wake; Paul''s hope is their song, the rising of the dead the Tanakh already promised.'),
  ('canon', 'acts', 24, 15, 'apocrypha', '2-maccabees', 7, 9, 'extras', E'*And when he was at the last gasp, he said, You like a fury takest us out of this present life, but the King of the world shall raise us up, who have died for his laws, to everlasting life.* (2 Maccabees 7:9). Paul holds *that there shall be a resurrection of the dead, both of the just and unjust* (Acts 24:15) — the same hope that braced the brothers who died under Antiochus: *the King of the world shall raise us up, who have died for his laws, to everlasting life.* The resurrection hope and faithfulness to the law stand together in their mouths as in Paul''s: those who keep his laws look to be raised.'),
  ('canon', 'acts', 24, 15, 'apocrypha', '2-maccabees', 7, 14, 'extras', E'*So when he was ready to die he said thus, It is good, being put to death by men, to look for hope from Yahuah (God) to be raised up again by him: as for you, you shall have no resurrection to life.* (2 Maccabees 7:14). Paul''s *resurrection of the dead, both of the just and unjust* (Acts 24:15) is voiced exactly here: *to look for hope from Yahuah (God) to be raised up again by him* for the faithful, while to the persecutor *you shall have no resurrection to life.* The just raised to life and the unjust to judgment — the two-fold resurrection Paul confesses was already the hope of those who died for the laws of the fathers.'),
  ('canon', 'acts', 24, 15, 'apocrypha', '2-maccabees', 7, 23, 'extras', E'*But doubtless the Creator of the world, who formed the generation of man, and found out the beginning of all things, will also of his own mercy give you breath and life again, as you now regard not your own selves for his laws'' sake.* (2 Maccabees 7:23). The mother''s charge to her sons frames Paul''s hope of *a resurrection of the dead* (Acts 24:15): the Creator *will also of his own mercy give you breath and life again,* to those who *regard not your own selves for his laws'' sake.* The resurrection is the Creator''s mercy upon the law-faithful — the very hope toward Elohim (God) Paul says his accusers *themselves also allow* (Acts 24:15).'),
  ('canon', 'acts', 24, 15, 'canon', 'acts', 26, 6, 'free', E'*And now I stand and am judged for the hope of the promise made of Elohim (God) unto our fathers:* (Acts 26:6). Paul''s *hope toward Elohim (God) … that there shall be a resurrection of the dead* (Acts 24:15) he names before Agrippa as *the hope of the promise made of Elohim (God) unto our fathers.* It is the fathers'' own promise he is on trial for — the resurrection hope is covenant hope, the inheritance of Abraham, Isaac, and Jacob, not a charge he need apologize for.'),
  ('canon', 'acts', 24, 15, 'canon', 'acts', 26, 7, 'free', E'*Unto which promise our twelve tribes, instantly serving Elohim (God) day and night, hope to come. For which hope''s sake, king Agrippa, I am accused of the Yahudim (Jews).* (Acts 26:7). The resurrection hope Paul confesses before Felix (Acts 24:15) belongs to *our twelve tribes,* who *instantly serving Elohim (God) day and night, hope to come* unto the promise. The hope is the twelve-tribe hope — all Yashar''el (Israel), serving and waiting to come into the promise of the fathers — and Paul is *accused of the Yahudim (Jews)* for holding it.'),
  ('canon', 'acts', 24, 15, 'canon', 'acts', 26, 8, 'free', E'*Why should it be thought a thing incredible with you, that Elohim (God) should raise the dead?* (Acts 26:8). The same question stands under Paul''s defense before Felix, where his one confessed offence is *the hope … that there shall be a resurrection of the dead, both of the just and unjust* (Acts 24:15). Before Agrippa he presses it plainly: *Why should it be thought a thing incredible with you, that Elohim (God) should raise the dead?* The God of the fathers who formed man can raise him — the resurrection is no incredible thing but the covenant''s own hope.'),
  -- thread: acts-24-righteousness-temperance-and-judgment-to-come-felix-trembled
  ('canon', 'acts', 24, 25, 'canon', 'ecclesiastes', 12, 14, 'free', E'*For Elohim (God) shall bring every work into judgment, with every secret thing, whether it be good, or whether it be evil.* (Ecclesiastes 12:14). As Paul *reasoned of righteousness, temperance, and judgment to come, Felix trembled* (Acts 24:25). The trembling is right, for *Elohim (God) shall bring every work into judgment, with every secret thing.* The judgment to come is no abstraction the believer stands outside of; it weighs every work, good and evil — the same reckoning the whole duty of man is ordered toward: *Fear Elohim (God), and keep his commandments* (Ecclesiastes 12:13).'),
  ('canon', 'acts', 24, 25, 'canon', 'daniel', 12, 2, 'free', E'*And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* (Daniel 12:2). When Paul reasons *of righteousness, temperance, and judgment to come,* and *Felix trembled* (Acts 24:25), the judgment he presses is the one Daniel saw: the dust awakened, *some to everlasting life, and some to shame and everlasting contempt.* The resurrection of the unjust that Paul confessed (Acts 24:15) is the ground of the judgment to come that makes a governor tremble — the same two-fold waking, to life or to contempt.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s217_a24_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s217_a24_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-24-the-way-which-they-call-heresy-the-true-worship-of-the-god-of-the-fathers',
       E'The way which they call heresy — the true worship of the Elohim (God) of the fathers',
       E'Tertullus stands before Felix and brands Paul *a pestilent fellow, and a mover of sedition among all the Yahudim (Jews) throughout the world, and a ringleader of the sect of the Nazarenes* (Acts 24:5). Paul answers not by denying the Way but by naming it rightly: *But this I confess unto thee, that after the way which they call heresy, so worship I the Elohim (God) of my fathers, believing all things which are written in the law and in the prophets* (Acts 24:14). The accusers'' word is *heresy;* the thing itself is the worship of the Elohim (God) of the fathers — the faith of Abraham, Isaac, and Jacob, not a sect breaking from it. It is *this way* (Acts 9:2) that Saul himself once hunted, *I persecuted this way unto the death, binding and delivering into prisons both men and women* (Acts 22:4) — and the man who jailed those who walked it now confesses it is the true Way. The prophets mapped it long before: *The way of the just is uprightness: thou, most upright, dost weigh the path of the just* (Isaiah 26:7), and the faithful walk it waiting on Yahuah (LORD) — *in the way of thy judgments, O Yahuah (LORD), have we waited for thee; the desire of our soul is to thy name* (Isaiah 26:8). The Way they call heresy is the upright path the prophets already named; Paul has not left the law and the prophets but kept them whole, *neither against the law of the Yahudim (Jews), neither against the temple, nor yet against Cæsar* having offended (Acts 24:20, cf. 24:12-13).',
       sv.verse_id, ev.verse_id, 'free', 5850
  FROM _s217_a24_lookup sv, _s217_a24_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=24 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=24 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-24-believing-all-things-written-the-law-and-the-prophets-faithful-witness',
       E'Believing all things written in the law and the prophets — the faithful witness',
       E'The keystone of Paul''s whole defense is one clause: *so worship I the Elohim (God) of my fathers, believing all things which are written in the law and in the prophets* (Acts 24:14). This is the man the systems would later remake into a teacher against the Torah — yet here, under oath before a governor, his confession is that he believes *all things which are written in the law and in the prophets.* Nothing subtracted, nothing set aside. It is the very scripture the risen Messiah (Christ) opened on the Emmaus road: *beginning at Moses and all the prophets, he expounded unto them in all the scriptures the things concerning himself* (Luke 24:27), and again *all things must be fulfilled, which were written in the law of Moses, and in the prophets, and in the psalms, concerning me* (Luke 24:44). Paul believes exactly what the Master named must be fulfilled. He says the same before Agrippa — *witnessing both to small and great, saying none other things than those which the prophets and Moses did say should come* (Acts 26:22) — and to the end in Rome he is found *persuading them concerning Yahusha (Jesus), both out of the law of Moses, and out of the prophets, from morning till evening* (Acts 28:23). The charge of *heresy* falls against a man whose only confession is the whole of Moses and the prophets, read whole and fulfilled. This is the Torah-and-Prophets-faithful witness, not a departure from the covenant he was raised in.',
       sv.verse_id, ev.verse_id, 'free', 5853
  FROM _s217_a24_lookup sv, _s217_a24_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=24 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=24 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-24-a-resurrection-of-the-just-and-the-unjust-the-tanakh-hope',
       E'A resurrection of the just and the unjust — the Tanakh hope',
       E'In the same breath as his confession of the law and the prophets, Paul names his hope: *And have hope toward Elohim (God), which they themselves also allow, that there shall be a resurrection of the dead, both of the just and unjust* (Acts 24:15) — the one charge he will own, *Touching the resurrection of the dead I am called in question by you this day* (Acts 24:21). This is no new doctrine but the oldest hope of the fathers. Daniel saw it: *many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt* (Daniel 12:2) — the just and the unjust both raised. Job confessed it from the ash-heap: *I know that my redeemer liveth, and that he shall stand at the latter day upon the earth* (Job 19:25), *and though after my skin worms destroy this body, yet in my flesh shall I see Elohim (God)* (Job 19:26). Isaiah sang it: *Thy dead men shall live … Awake and sing, ye that dwell in dust … and the earth shall cast out the dead* (Isaiah 26:19). And in the days of Antiochus the brothers who *died for his laws* held the same hope to the last gasp — *the King of the world shall raise us up, who have died for his laws, to everlasting life* (2 Maccabees 7:9), *to look for hope from Yahuah (God) to be raised up again by him* while the persecutor has *no resurrection to life* (2 Maccabees 7:14); their mother charging them that the Creator *will also of his own mercy give you breath and life again* for his laws'' sake (2 Maccabees 7:23). The resurrection hope and faithfulness to the law stand together in their mouths as in Paul''s. And before Agrippa Paul names whose hope it is: *the hope of the promise made of Elohim (God) unto our fathers* (Acts 26:6), *unto which promise our twelve tribes, instantly serving Elohim (God) day and night, hope to come* (Acts 26:7) — *Why should it be thought a thing incredible with you, that Elohim (God) should raise the dead?* (Acts 26:8). The resurrection is the twelve-tribe hope, the inheritance of all Yashar''el (Israel), not a charge to apologize for.',
       sv.verse_id, ev.verse_id, 'extras', 5856
  FROM _s217_a24_lookup sv, _s217_a24_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=24 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=24 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-24-righteousness-temperance-and-judgment-to-come-felix-trembled',
       E'Righteousness, temperance, and judgment to come — Felix trembled',
       E'When Felix sends for Paul and hears him *concerning the faith in Messiah (Christ)* (Acts 24:24), Paul does not flatter him: *And as he reasoned of righteousness, temperance, and judgment to come, Felix trembled, and answered, Go thy way for this time; when I have a convenient season, I will call for thee* (Acts 24:25). The trembling is right, for the judgment to come is real and weighs every life. The conclusion of the whole matter the wise man named ends here: *Fear Elohim (God), and keep his commandments: for this is the whole duty of man. For Elohim (God) shall bring every work into judgment, with every secret thing, whether it be good, or whether it be evil* (Ecclesiastes 12:13-14). And the judgment is no abstraction — it is the two-fold waking Daniel saw, *many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt* (Daniel 12:2). The resurrection of the unjust that Paul had already confessed (Acts 24:15) is the very ground of the judgment to come that makes a governor tremble. There is no standing outside it; righteousness and temperance are weighed, every secret thing is brought into judgment, and a man does well to tremble and turn — though Felix, hoping rather for a bribe (Acts 24:26), put off the convenient season and left Paul bound.',
       sv.verse_id, ev.verse_id, 'free', 5859
  FROM _s217_a24_lookup sv, _s217_a24_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=24 AND sv.verse_number=25
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=24 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: acts-24-the-way-which-they-call-heresy-the-true-worship-of-the-god-of-the-fathers
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Acts 9:2 — *if he found any of this way … he might bring them bound unto Jerusalem* the Way Saul once hunted is the Way he now confesses (Acts 24:14).'
  FROM cross_reference_threads t, cross_references x, _s217_a24_lookup sv, _s217_a24_lookup tv
 WHERE t.slug='acts-24-the-way-which-they-call-heresy-the-true-worship-of-the-god-of-the-fathers'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=24 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=9 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Acts 22:4 — *I persecuted this way unto the death* the name *heresy* is the false naming of the true Way Paul once jailed men for (Acts 24:14).'
  FROM cross_reference_threads t, cross_references x, _s217_a24_lookup sv, _s217_a24_lookup tv
 WHERE t.slug='acts-24-the-way-which-they-call-heresy-the-true-worship-of-the-god-of-the-fathers'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=24 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=22 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 26:7 — *The way of the just is uprightness* the prophets mapped this Way long before the accusers called it heresy (Acts 24:14).'
  FROM cross_reference_threads t, cross_references x, _s217_a24_lookup sv, _s217_a24_lookup tv
 WHERE t.slug='acts-24-the-way-which-they-call-heresy-the-true-worship-of-the-god-of-the-fathers'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=24 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=26 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 26:8 — *in the way of thy judgments, O Yahuah (LORD), have we waited for thee* the Way Paul walks is the prophets'' waiting on Yahuah (Acts 24:14).'
  FROM cross_reference_threads t, cross_references x, _s217_a24_lookup sv, _s217_a24_lookup tv
 WHERE t.slug='acts-24-the-way-which-they-call-heresy-the-true-worship-of-the-god-of-the-fathers'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=24 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=26 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-24-believing-all-things-written-the-law-and-the-prophets-faithful-witness
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Luke 24:27 — *beginning at Moses and all the prophets, he expounded … the things concerning himself* the scriptures Paul believes are the ones the risen Master opened (Acts 24:14).'
  FROM cross_reference_threads t, cross_references x, _s217_a24_lookup sv, _s217_a24_lookup tv
 WHERE t.slug='acts-24-believing-all-things-written-the-law-and-the-prophets-faithful-witness'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=24 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=24 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Luke 24:44 — *all things … written in the law of Moses, and in the prophets, and in the psalms, concerning me* Paul believes exactly what the Master named must be fulfilled (Acts 24:14).'
  FROM cross_reference_threads t, cross_references x, _s217_a24_lookup sv, _s217_a24_lookup tv
 WHERE t.slug='acts-24-believing-all-things-written-the-law-and-the-prophets-faithful-witness'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=24 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=24 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 26:22 — *saying none other things than those which the prophets and Moses did say should come* the same Torah-and-Prophets witness before Agrippa (Acts 24:14).'
  FROM cross_reference_threads t, cross_references x, _s217_a24_lookup sv, _s217_a24_lookup tv
 WHERE t.slug='acts-24-believing-all-things-written-the-law-and-the-prophets-faithful-witness'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=24 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=26 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Acts 28:23 — *persuading them concerning Yahusha (Jesus), both out of the law of Moses, and out of the prophets* the same well drawn from to the end in Rome (Acts 24:14).'
  FROM cross_reference_threads t, cross_references x, _s217_a24_lookup sv, _s217_a24_lookup tv
 WHERE t.slug='acts-24-believing-all-things-written-the-law-and-the-prophets-faithful-witness'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=24 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=28 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-24-a-resurrection-of-the-just-and-the-unjust-the-tanakh-hope
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 12:2 — *many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame* the just and unjust both raised, the prophet''s own hope (Acts 24:15).'
  FROM cross_reference_threads t, cross_references x, _s217_a24_lookup sv, _s217_a24_lookup tv
 WHERE t.slug='acts-24-a-resurrection-of-the-just-and-the-unjust-the-tanakh-hope'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=24 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Job 19:25 — *I know that my redeemer liveth, and … he shall stand at the latter day upon the earth* the resurrection hope from the oldest words of the fathers (Acts 24:15).'
  FROM cross_reference_threads t, cross_references x, _s217_a24_lookup sv, _s217_a24_lookup tv
 WHERE t.slug='acts-24-a-resurrection-of-the-just-and-the-unjust-the-tanakh-hope'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=24 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=19 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Job 19:26 — *yet in my flesh shall I see Elohim (God)* bodily resurrection, the dead raised to see Elohim (God) (Acts 24:15).'
  FROM cross_reference_threads t, cross_references x, _s217_a24_lookup sv, _s217_a24_lookup tv
 WHERE t.slug='acts-24-a-resurrection-of-the-just-and-the-unjust-the-tanakh-hope'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=24 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=19 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 26:19 — *Thy dead men shall live … Awake and sing, ye that dwell in dust* the prophets summoned the dust to wake; Paul''s hope is their song (Acts 24:15).'
  FROM cross_reference_threads t, cross_references x, _s217_a24_lookup sv, _s217_a24_lookup tv
 WHERE t.slug='acts-24-a-resurrection-of-the-just-and-the-unjust-the-tanakh-hope'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=24 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=26 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'2 Maccabees 7:9 — *the King of the world shall raise us up, who have died for his laws, to everlasting life* resurrection hope and faithfulness to the law together, as in Paul (Acts 24:15).'
  FROM cross_reference_threads t, cross_references x, _s217_a24_lookup sv, _s217_a24_lookup tv
 WHERE t.slug='acts-24-a-resurrection-of-the-just-and-the-unjust-the-tanakh-hope'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=24 AND sv.verse_number=15
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'2 Maccabees 7:14 — *to look for hope from Yahuah (God) to be raised up again by him: as for you, you shall have no resurrection to life* the just raised, the unjust not — Paul''s two-fold hope (Acts 24:15).'
  FROM cross_reference_threads t, cross_references x, _s217_a24_lookup sv, _s217_a24_lookup tv
 WHERE t.slug='acts-24-a-resurrection-of-the-just-and-the-unjust-the-tanakh-hope'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=24 AND sv.verse_number=15
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=7 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'2 Maccabees 7:23 — *the Creator … will also of his own mercy give you breath and life again … for his laws'' sake* the resurrection as the Creator''s mercy upon the law-faithful (Acts 24:15).'
  FROM cross_reference_threads t, cross_references x, _s217_a24_lookup sv, _s217_a24_lookup tv
 WHERE t.slug='acts-24-a-resurrection-of-the-just-and-the-unjust-the-tanakh-hope'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=24 AND sv.verse_number=15
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=7 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 8, E'Acts 26:6 — *the hope of the promise made of Elohim (God) unto our fathers* the resurrection is the fathers'' own promise (Acts 24:15).'
  FROM cross_reference_threads t, cross_references x, _s217_a24_lookup sv, _s217_a24_lookup tv
 WHERE t.slug='acts-24-a-resurrection-of-the-just-and-the-unjust-the-tanakh-hope'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=24 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=26 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 9, E'Acts 26:7 — *unto which promise our twelve tribes, instantly serving Elohim (God) day and night, hope to come* the resurrection is the twelve-tribe hope of all Yashar''el (Israel) (Acts 24:15).'
  FROM cross_reference_threads t, cross_references x, _s217_a24_lookup sv, _s217_a24_lookup tv
 WHERE t.slug='acts-24-a-resurrection-of-the-just-and-the-unjust-the-tanakh-hope'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=24 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=26 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 10, E'Acts 26:8 — *Why should it be thought a thing incredible with you, that Elohim (God) should raise the dead?* the God of the fathers who formed man can raise him (Acts 24:15).'
  FROM cross_reference_threads t, cross_references x, _s217_a24_lookup sv, _s217_a24_lookup tv
 WHERE t.slug='acts-24-a-resurrection-of-the-just-and-the-unjust-the-tanakh-hope'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=24 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=26 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-24-righteousness-temperance-and-judgment-to-come-felix-trembled
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ecclesiastes 12:14 — *Elohim (God) shall bring every work into judgment, with every secret thing* the judgment to come weighs every work; Felix does well to tremble (Acts 24:25).'
  FROM cross_reference_threads t, cross_references x, _s217_a24_lookup sv, _s217_a24_lookup tv
 WHERE t.slug='acts-24-righteousness-temperance-and-judgment-to-come-felix-trembled'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=24 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=12 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 12:2 — *some to everlasting life, and some to shame and everlasting contempt* the resurrection of the unjust is the ground of the judgment that makes a governor tremble (Acts 24:25, cf. 24:15).'
  FROM cross_reference_threads t, cross_references x, _s217_a24_lookup sv, _s217_a24_lookup tv
 WHERE t.slug='acts-24-righteousness-temperance-and-judgment-to-come-felix-trembled'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=24 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
