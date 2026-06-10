-- ----- fragment: minion_acts_21.sql (S217 Acts 21) -----
-- =====================================================================
-- S217 minion — ACTS 21 FULL-LIBRARY cross-references
-- =====================================================================
-- Range:  ACTS 21 (single chapter).  Tag: a21 (temp view _s217_a21_lookup).  Sort band: 5775-5799 (step 3).
-- Source is ALWAYS the canon Acts verse; targets span Tanakh + extra-canonical + NT.
-- Tiers per-row: canon target = 'free'; extra-canonical target = 'extras'.
--
-- ***DROPPED-PAUL / KEEPS-THE-LAW CORRECTION — THE LOAD-BEARING WORK OF THIS CHAPTER***
--  Acts 21 is the chapter that REFUTES the antinomian Paul. The false rumor (21:21) — that Paul
--  teaches the Yahudim (Jews) among the nations *to forsake Moses, saying that they ought not to
--  circumcise their children, neither to walk after the customs* — is named by the elders as a
--  thing *whereof they were informed concerning thee, are nothing* (21:24). James's remedy is not
--  a defense of antinomianism but its opposite: Paul JOINS FOUR MEN UNDER A NAZARITE VOW
--  (Numbers 6), pays their charges, purifies himself in the temple, *that all may know … that thou
--  thyself also walkest orderly, and keepest the law* (21:24). Paul's own temple act denies the
--  rumor. The riot's charge (21:28) — *against the people, and the law, and this place* — is the
--  SAME false charge laid against Stephen by false witnesses (Acts 6:13). Throughout: the Paul who
--  abolished Torah does not exist; he is a Torah-observant Yahudi (Jew) keeping a Nazarite vow in
--  the temple, and the rumor is named as false by the text itself. Voice-care: moderate — frame
--  the vow/purification as Paul KEEPING the law, the false report as false, never let the inherited
--  antinomian reading surface.
--
-- WATCHPOINTS (Red Lines #2/#4/#5/#6, Christology, son-of-Adam, NT-Lord):
--  * Christology of 21:13-14: *the will of Yahuah (Lord) be done* — the same surrender the Master
--    spoke in Gethsemane (*not my will, but thine, be done*). The Formed who prayed in the garden;
--    Paul ready to die *for the name of the Lord Yahusha (Lord Jesus)* — *Lord* here is Yahusha
--    titular, preserved as the pull gives it.
--  * Agabus's girdle-sign (21:11): the enacted-sign prophets — Jeremiah's linen girdle (Jeremiah
--    13), Ezekiel's bands (Ezekiel 4:8) — the prophetic word performed in the body, the Ruach
--    HaKodesh (Holy Spirit) speaking through the sign.
--  * 21:20 *zealous of the law* — read as covenant fidelity (Numbers 6, 1 Maccabees 2:27), the
--    thousands of believing Yahudim who keep Torah; NEVER a flesh-credential works-righteousness.
--
-- PER-VERSE LIBRARY-COVERAGE CHECKLIST (all three weighed for every meaningful block):
--  ACTS 21:
--   v.1-3   the voyage to Tyre          Tanakh: none warranted  Extras: none warranted  NT: none warranted (narrative itinerary)
--   v.4     said through the Spirit not to go up  Tanakh: none warranted (carried in the bound-in-the-spirit NT thread)  Extras: none warranted  NT: none added (Acts 20:22-23 carried under v.11 girdle thread by theme)
--   v.5-9   prayer on the shore / Philip's daughters prophesy  Tanakh: none warranted  Extras: none warranted  NT: none warranted (Joel-2 daughters-prophesy carried in Acts 2 threads, not re-added)
--   v.10-11 Agabus binds his own hands/feet with Paul's girdle  Tanakh: Jeremiah 13:1, Ezekiel 4:8 (enacted-sign prophets)  Extras: none warranted  NT: Acts 20:23 weighed (bonds abide — carried thematically, not added as separate row)
--   v.12-14 the will of the Lord be done  Tanakh: none warranted  Extras: none warranted  NT: Luke 22:42, Matthew 26:39 (Gethsemane surrender)
--   v.15-19 up to Jerusalem; declares what God wrought among the Gentiles  Tanakh: none warranted  Extras: none warranted  NT: none warranted (the gathering carried in Acts 15 threads, not re-added)
--   v.20    thousands of believing Yahudim, zealous of the law  Tanakh: none added (Numbers 6 carried under v.24)  Extras: 1 Maccabees 2:27 (zealous of the law)  NT: none warranted
--   v.21    the FALSE RUMOR — forsake Moses / not circumcise  Tanakh: none warranted  Extras: none warranted  NT: none added (named false at v.24, carried in keeps-the-law thread)
--   v.23-24 the Nazarite-vow remedy — keepeth the law  Tanakh: Numbers 6:2, Numbers 6:18  Extras: none warranted  NT: Acts 24:14, Acts 24:18, Acts 25:8, Acts 28:17 (Paul's own Torah-observant defense)
--   v.25    the believing Gentiles' four-point letter  Tanakh: none added  Extras: none warranted  NT: none warranted (Acts 15 council verdict carried in Acts 15 threads, not re-added)
--   v.26    Paul purifies, enters the temple, the offering  Tanakh: none added (Numbers 6 carried at v.24)  Extras: none warranted  NT: Acts 24:18 (found purified in the temple — carried at v.24 thread)
--   v.27-29 the riot — stirred up, laid hands  Tanakh: none warranted  Extras: none warranted  NT: none added (the false charge carried at v.28)
--   v.28    the false charge — against the people, the law, this place  Tanakh: none warranted  Extras: none warranted  NT: Acts 6:13 (the same false charge against Stephen)
--   v.30-40 seized, bound, the chief captain, Hebrew tongue  Tanakh: none warranted  Extras: none warranted  NT: none warranted (narrative)
--
-- THREADS (slug -> target libraries):
--   5775 acts-21-bound-with-pauls-girdle-the-enacted-sign-of-the-prophets        (Tanakh)
--   5778 acts-21-the-will-of-the-lord-be-done-the-gethsemane-surrender           (NT)
--   5781 acts-21-zealous-of-the-law-the-thousands-who-believe-and-keep-the-covenant (Extras)
--   5784 acts-21-walkest-orderly-and-keepest-the-law-the-nazarite-vow-and-pauls-own-defense (Tanakh + NT, Acts<->Acts)
--   5787 acts-21-against-the-people-and-the-law-and-this-place-the-same-false-charge-as-stephen (NT, Acts<->Acts)
-- =====================================================================

CREATE TEMP VIEW _s217_a21_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: acts-21-bound-with-pauls-girdle-the-enacted-sign-of-the-prophets
  ('canon', 'acts', 21, 11, 'canon', 'jeremiah', 13, 1, 'free', E'*Thus saith Yahuah (LORD) unto me, Go and get thee a linen girdle, and put it upon thy loins, and put it not in water.* (Jeremiah 13:1). When Agabus comes down from Judæa, *he took Paul''s girdle, and bound his own hands and feet, and said, Thus saith the Ruach HaKodesh (Holy Spirit), So shall the Yahudim (Jews) at Jerusalem bind the man that owneth this girdle, and shall deliver him into the hands of the Gentiles* (Acts 21:11). It is the old prophetic manner — the word performed in the body before it is spoken in words. As Yahuah (LORD) sent Jeremiah to take a girdle and enact the marring of Yahudah''s pride, so the Spirit moves Agabus to take Paul''s girdle and bind himself with it, the sign speaking what the words then declare: the man that owneth this girdle will be bound.'),
  ('canon', 'acts', 21, 11, 'canon', 'ezekiel', 4, 8, 'free', E'*And, behold, I will lay bands upon thee, and thou shalt not turn thee from one side to another, till thou hast ended the days of thy siege.* (Ezekiel 4:8). Ezekiel is bound with bands and made to bear the iniquity of the house in his own body — the prophecy enacted, not merely spoken. So Agabus *bound his own hands and feet* with Paul''s girdle (Acts 21:11), the bonds upon the prophet''s own body declaring the bonds to come upon Paul. The Ruach HaKodesh (Holy Spirit) speaks through the sign performed in the flesh, the same manner of prophecy Ezekiel was given.'),
  -- thread: acts-21-the-will-of-the-lord-be-done-the-gethsemane-surrender
  ('canon', 'acts', 21, 14, 'canon', 'luke', 22, 42, 'free', E'*Saying, Father, if thou be willing, remove this cup from me: nevertheless not my will, but thine, be done.* (Luke 22:42). When Paul will not be turned from going up to die, the company ceases, *saying, The will of Yahuah (Lord) be done* (Acts 21:14). It is the very surrender the Master prayed in the garden before his own binding and death — *not my will, but thine, be done.* The disciples who would have held Paul back lay down their will as the Master laid down his; the cup is not removed, and the will of Yahuah (Lord) is done.'),
  ('canon', 'acts', 21, 13, 'canon', 'matthew', 26, 39, 'free', E'*And he went a little further, and fell on his face, and prayed, saying, O my Father, if it be possible, let this cup pass from me: nevertheless not as I will, but as thou wilt.* (Matthew 26:39). Paul answers the weeping company, *I am ready not to be bound only, but also to die at Jerusalem for the name of the Lord Yahusha (Lord Jesus)* (Acts 21:13). He goes up as the Master went up — set toward Jerusalem, ready for the binding and the death, the cup not passing but drunk. *Not as I will, but as thou wilt* is the heart Paul carries into the city that will bind him.'),
  -- thread: acts-21-zealous-of-the-law-the-thousands-who-believe-and-keep-the-covenant
  ('canon', 'acts', 21, 20, 'apocrypha', '1-maccabees', 2, 27, 'extras', E'*And Mattathias cried throughout the city with a loud voice, saying, Whoever is zealous of the law, and maintaineth the covenant, let him follow me.* (1 Maccabees 2:27). When Paul comes to James, the elders glorify Yahuah (Lord) and say, *Thou seest, brother, how many thousands of Yahudim (Jews) there are which believe; and they are all zealous of the law* (Acts 21:20). The believing thousands carry the same zeal Mattathias called for — zealous of the law and maintaining the covenant. To believe in Yahusha (Jesus) and to be zealous of the law are not set against each other here; the thousands who believe are the thousands who keep, the covenant fidelity of the faithful remnant unbroken.'),
  -- thread: acts-21-walkest-orderly-and-keepest-the-law-the-nazarite-vow-and-pauls-own-defense
  ('canon', 'acts', 21, 24, 'canon', 'numbers', 6, 2, 'free', E'*Speak unto the children of Yashar''el (Israel), and say unto them, When either man or woman shall separate themselves to vow a vow of a Nazarite, to separate themselves unto Yahuah (LORD):* (Numbers 6:2). The elders'' remedy for the rumor against Paul is the Nazarite vow of Moses: *We have four men which have a vow on them; Them take, and purify thyself with them, and be at charges with them, that they may shave their heads* (Acts 21:23-24). The vow Yahuah (LORD) gave through Moses, that a man might separate himself unto Yahuah — this is the very Torah the rumor said Paul taught men to forsake, and Paul keeps it openly to prove the rumor false.'),
  ('canon', 'acts', 21, 24, 'canon', 'numbers', 6, 18, 'free', E'*And the Nazarite shall shave the head of his separation at the door of the tabernacle of the congregation, and shall take the hair of the head of his separation, and put it in the fire which is under the sacrifice of the peace offerings.* (Numbers 6:18). The four men are to *shave their heads* (Acts 21:24), and Paul enters the temple *to signify the accomplishment of the days of purification, until that an offering should be offered for every one of them* (Acts 21:26) — exactly the close of the Nazarite vow Moses prescribed: the shaving of the head and the offering at the door of the tabernacle. Paul is not abolishing this Torah; he is paying its charges and keeping it to the letter.'),
  ('canon', 'acts', 21, 24, 'canon', 'acts', 24, 14, 'free', E'*But this I confess unto thee, that after the way which they call heresy, so worship I the Elohim (God) of my fathers, believing all things which are written in the law and in the prophets:* (Acts 24:14). The elders charge Paul to act *that all may know … that thou thyself also walkest orderly, and keepest the law* (Acts 21:24). And before Felix, Paul confesses exactly that: he worships the Elohim (God) of his fathers, *believing all things which are written in the law and in the prophets.* The temple act of Acts 21 and the confession of Acts 24 are one testimony — the Paul who keeps the law, believing all that is written, the rumor of the forsaken Moses named as false by Paul''s own mouth.'),
  ('canon', 'acts', 21, 24, 'canon', 'acts', 24, 18, 'free', E'*Whereupon certain Yahudim (Jews) from Asia found me purified in the temple, neither with multitude, nor with tumult.* (Acts 24:18). The charge was *purify thyself with them … that thou thyself also walkest orderly, and keepest the law* (Acts 21:24); Paul does it — *purifying himself with them entered into the temple* (Acts 21:26). And later he names it as his defense: the Yahudim (Jews) from Asia *found me purified in the temple.* The purification was not a pretense but the truth of the man: he was found doing the very thing the rumor said he taught against — keeping the Torah of purification in the temple of his fathers.'),
  ('canon', 'acts', 21, 24, 'canon', 'acts', 25, 8, 'free', E'*While he answered for himself, Neither against the law of the Yahudim (Jews), neither against the temple, nor yet against Cæsar, have I offended any thing at all.* (Acts 25:8). The elders sought to show *that thou thyself also … keepest the law* (Acts 21:24); Paul stands by it to the end. Before Festus he answers that he has offended nothing *against the law of the Yahudim (Jews), neither against the temple* — the two things the rumor and the riot accused him of forsaking. The man the mob charged as the teacher against the law and the place declares under trial that he has offended neither.'),
  ('canon', 'acts', 21, 24, 'canon', 'acts', 28, 17, 'free', E'*And it came to pass, that after three days Paul called the chief of the Yahudim (Jews) together: and when they were come together, he said unto them, Men and brethren, though I have committed nothing against the people, or customs of our fathers, yet was I delivered prisoner from Jerusalem into the hands of the Romans.* (Acts 28:17). The rumor said Paul taught men *neither to walk after the customs* (Acts 21:21); the elders moved to prove he *keepest the law* (Acts 21:24). At Rome, in chains, Paul''s final word on the matter is the same: he *committed nothing against the people, or customs of our fathers.* From the temple purification to the Roman imprisonment, one testimony holds — the customs of the fathers kept, the rumor false from first to last.'),
  -- thread: acts-21-against-the-people-and-the-law-and-this-place-the-same-false-charge-as-stephen
  ('canon', 'acts', 21, 28, 'canon', 'acts', 6, 13, 'free', E'*And set up false witnesses, which said, This man ceaseth not to speak blasphemous words against this holy place, and the law:* (Acts 6:13). The mob seizes Paul *crying out, Men of Yashar''el (Israel), help: This is the man, that teacheth all men every where against the people, and the law, and this place* (Acts 21:28). It is word for word the charge laid against Stephen by *false witnesses* — *against this holy place, and the law.* The text names the witnesses against Stephen false; the same false charge is now thrown at Paul, who at that very hour was in the temple keeping the law. The accusation is the lie''s old costume: name the Torah-keeper an enemy of the Torah.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s217_a21_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s217_a21_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-21-bound-with-pauls-girdle-the-enacted-sign-of-the-prophets',
       E'Bound with Paul''s girdle — the enacted sign of the prophets',
       E'As Paul tarries at Cæsarea, *there came down from Judæa a certain prophet, named Agabus* (Acts 21:10), and *when he was come unto us, he took Paul''s girdle, and bound his own hands and feet, and said, Thus saith the Ruach HaKodesh (Holy Spirit), So shall the Yahudim (Jews) at Jerusalem bind the man that owneth this girdle, and shall deliver him into the hands of the Gentiles* (Acts 21:11). This is the old prophetic manner — the word of Yahuah (LORD) performed in the body before it is spoken aloud. Yahuah (LORD) sent Jeremiah out the same way: *Go and get thee a linen girdle, and put it upon thy loins, and put it not in water* (Jeremiah 13:1), a girdle taken and enacted to declare the marring of Yahudah''s pride. And Ezekiel was bound to bear the sign in his own flesh — *behold, I will lay bands upon thee, and thou shalt not turn thee from one side to another, till thou hast ended the days of thy siege* (Ezekiel 4:8). Agabus stands in that line: the bonds upon the prophet''s own hands and feet declare the bonds to come upon Paul. The sign is the prophecy; the Spirit speaks it in the body first.',
       sv.verse_id, ev.verse_id, 'free', 5775
  FROM _s217_a21_lookup sv, _s217_a21_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=21 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=21 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-21-the-will-of-the-lord-be-done-the-gethsemane-surrender',
       E'The will of Yahuah (Lord) be done — the Gethsemane surrender',
       E'When the company hears that Paul will be bound, *both we, and they of that place, besought him not to go up to Jerusalem* (Acts 21:12). But Paul answers, *What mean ye to weep and to break mine heart? for I am ready not to be bound only, but also to die at Jerusalem for the name of the Lord Yahusha (Lord Jesus)* (Acts 21:13). And when he will not be persuaded, the company ceases, *saying, The will of Yahuah (Lord) be done* (Acts 21:14). It is the very prayer the Master prayed in the garden, set toward his own binding and death: *O my Father, if it be possible, let this cup pass from me: nevertheless not as I will, but as thou wilt* (Matthew 26:39), and again, *Father, if thou be willing, remove this cup from me: nevertheless not my will, but thine, be done* (Luke 22:42). The Master drank the cup that was not removed; Paul goes up to the city that will bind him, ready to die for the name. The disciples who would have held him back lay down their own will as the Master laid down his — the cup not taken away, the will of Yahuah (Lord) done.',
       sv.verse_id, ev.verse_id, 'free', 5778
  FROM _s217_a21_lookup sv, _s217_a21_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=21 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=21 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-21-zealous-of-the-law-the-thousands-who-believe-and-keep-the-covenant',
       E'Zealous of the law — the thousands who believe and keep the covenant',
       E'When Paul has declared *what things Elohim (God) had wrought among the Gentiles by his ministry* (Acts 21:19), the elders glorify Yahuah (Lord) and say, *Thou seest, brother, how many thousands of Yahudim (Jews) there are which believe; and they are all zealous of the law* (Acts 21:20). The believing thousands are not believers who have left the Torah behind; they are zealous of it. This is the zeal Mattathias called for in the day the covenant was under assault: *Whoever is zealous of the law, and maintaineth the covenant, let him follow me* (1 Maccabees 2:27). To believe in Yahusha (Jesus) and to be zealous of the law stand together, not against each other — the thousands who believe are the thousands who keep, and the covenant fidelity of the faithful remnant is unbroken by their faith. It is precisely because the believing thousands are zealous of the law that the rumor against Paul — that he teaches men to forsake Moses — must be answered, and answered by a Torah-keeping act.',
       sv.verse_id, ev.verse_id, 'extras', 5781
  FROM _s217_a21_lookup sv, _s217_a21_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=21 AND sv.verse_number=20
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=21 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-21-walkest-orderly-and-keepest-the-law-the-nazarite-vow-and-pauls-own-defense',
       E'Walkest orderly, and keepest the law — the Nazarite vow and Paul''s own defense',
       E'This is the chapter that breaks the lie of the law-abolishing Paul. A rumor has run ahead of him: *they are informed of thee, that thou teachest all the Yahudim (Jews) which are among the Gentiles to forsake Moses, saying that they ought not to circumcise their children, neither to walk after the customs* (Acts 21:21). The elders'' remedy is not to defend a Paul against the Torah, but to show the Torah-keeping Paul plainly: *We have four men which have a vow on them; Them take, and purify thyself with them, and be at charges with them, that they may shave their heads: and all may know that those things, whereof they were informed concerning thee, are nothing; but that thou thyself also walkest orderly, and keepest the law* (Acts 21:23-24). The vow is the Nazarite vow of Moses — *when either man or woman shall separate themselves to vow a vow of a Nazarite, to separate themselves unto Yahuah (LORD)* (Numbers 6:2) — and its close is exactly what the four men do: *the Nazarite shall shave the head of his separation at the door of the tabernacle of the congregation … and put it in the fire which is under the sacrifice of the peace offerings* (Numbers 6:18). So *Paul took the men, and the next day purifying himself with them entered into the temple, to signify the accomplishment of the days of purification, until that an offering should be offered for every one of them* (Acts 21:26). He pays the charges; he keeps the vow to the letter. And this is no isolated act — it is the testimony of his whole defense. Before Felix: *after the way which they call heresy, so worship I the Elohim (God) of my fathers, believing all things which are written in the law and in the prophets* (Acts 24:14), and *certain Yahudim (Jews) from Asia found me purified in the temple* (Acts 24:18). Before Festus: *Neither against the law of the Yahudim (Jews), neither against the temple, nor yet against Cæsar, have I offended any thing at all* (Acts 25:8). And at Rome, in chains: *I have committed nothing against the people, or customs of our fathers* (Acts 28:17). The rumor said he forsook Moses; the man kept a Nazarite vow in the temple and went to his death declaring he had offended nothing against the law, the temple, or the customs of the fathers. The Paul who abolished the Torah does not exist. The text itself names the report *nothing,* and Paul''s own act and his own mouth name it false.',
       sv.verse_id, ev.verse_id, 'free', 5784
  FROM _s217_a21_lookup sv, _s217_a21_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=21 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=21 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-21-against-the-people-and-the-law-and-this-place-the-same-false-charge-as-stephen',
       E'Against the people, and the law, and this place — the same false charge as Stephen',
       E'The Yahudim (Jews) of Asia see Paul in the temple — the temple where he is at that very hour keeping the law — and *stirred up all the people, and laid hands on him, Crying out, Men of Yashar''el (Israel), help: This is the man, that teacheth all men every where against the people, and the law, and this place: and further brought Greeks also into the temple, and hath polluted this holy place* (Acts 21:27-28). It is the same charge, almost word for word, that was laid against Stephen — and the text already named the witnesses who brought it: *they set up false witnesses, which said, This man ceaseth not to speak blasphemous words against this holy place, and the law* (Acts 6:13). Against the holy place, against the law: the accusation does not change because the accusation was never true. Stephen''s accusers were false witnesses; Paul''s accusers supposed a thing they had not seen — *for they had seen before with him in the city Trophimus an Ephesian, whom they supposed that Paul had brought into the temple* (Acts 21:29). The lie wears its old costume: take the man who keeps the Torah and call him the enemy of the Torah, take the man purifying himself in the temple and call him the one who polluted it. The same false charge, the same hour of the law-keeper accused of forsaking the law.',
       sv.verse_id, ev.verse_id, 'free', 5787
  FROM _s217_a21_lookup sv, _s217_a21_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=21 AND sv.verse_number=27
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=21 AND ev.verse_number=29
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: acts-21-bound-with-pauls-girdle-the-enacted-sign-of-the-prophets
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 13:1 — *Go and get thee a linen girdle, and put it upon thy loins* the enacted girdle-sign of the prophet; Agabus takes Paul''s girdle in the same manner (Acts 21:11).'
  FROM cross_reference_threads t, cross_references x, _s217_a21_lookup sv, _s217_a21_lookup tv
 WHERE t.slug='acts-21-bound-with-pauls-girdle-the-enacted-sign-of-the-prophets'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=21 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=13 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 4:8 — *I will lay bands upon thee … till thou hast ended the days of thy siege* the prophet bound to bear the sign in his own body, as Agabus binds his own hands and feet (Acts 21:11).'
  FROM cross_reference_threads t, cross_references x, _s217_a21_lookup sv, _s217_a21_lookup tv
 WHERE t.slug='acts-21-bound-with-pauls-girdle-the-enacted-sign-of-the-prophets'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=21 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=4 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-21-the-will-of-the-lord-be-done-the-gethsemane-surrender
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 26:39 — *let this cup pass from me: nevertheless not as I will, but as thou wilt* the Master set toward his binding and death, as Paul is ready to die at Jerusalem (Acts 21:13).'
  FROM cross_reference_threads t, cross_references x, _s217_a21_lookup sv, _s217_a21_lookup tv
 WHERE t.slug='acts-21-the-will-of-the-lord-be-done-the-gethsemane-surrender'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=21 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=26 AND tv.verse_number=39
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Luke 22:42 — *not my will, but thine, be done* the garden surrender the company echoes — *The will of Yahuah (Lord) be done* (Acts 21:14).'
  FROM cross_reference_threads t, cross_references x, _s217_a21_lookup sv, _s217_a21_lookup tv
 WHERE t.slug='acts-21-the-will-of-the-lord-be-done-the-gethsemane-surrender'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=21 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=22 AND tv.verse_number=42
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-21-zealous-of-the-law-the-thousands-who-believe-and-keep-the-covenant
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Maccabees 2:27 — *Whoever is zealous of the law, and maintaineth the covenant, let him follow me* the same zeal the believing thousands carry — *they are all zealous of the law* (Acts 21:20).'
  FROM cross_reference_threads t, cross_references x, _s217_a21_lookup sv, _s217_a21_lookup tv
 WHERE t.slug='acts-21-zealous-of-the-law-the-thousands-who-believe-and-keep-the-covenant'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=21 AND sv.verse_number=20
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=2 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-21-walkest-orderly-and-keepest-the-law-the-nazarite-vow-and-pauls-own-defense
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 6:2 — *to vow a vow of a Nazarite, to separate themselves unto Yahuah (LORD)* the Torah vow the four men carry, that Paul keeps to prove the rumor false (Acts 21:23-24).'
  FROM cross_reference_threads t, cross_references x, _s217_a21_lookup sv, _s217_a21_lookup tv
 WHERE t.slug='acts-21-walkest-orderly-and-keepest-the-law-the-nazarite-vow-and-pauls-own-defense'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=21 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 6:18 — *the Nazarite shall shave the head of his separation at the door of the tabernacle* the close of the vow Paul accomplishes in the temple with the offering (Acts 21:26).'
  FROM cross_reference_threads t, cross_references x, _s217_a21_lookup sv, _s217_a21_lookup tv
 WHERE t.slug='acts-21-walkest-orderly-and-keepest-the-law-the-nazarite-vow-and-pauls-own-defense'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=21 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=6 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 24:14 — *so worship I the Elohim (God) of my fathers, believing all things which are written in the law and in the prophets* Paul''s own confession that he keeps the law (Acts 21:24).'
  FROM cross_reference_threads t, cross_references x, _s217_a21_lookup sv, _s217_a21_lookup tv
 WHERE t.slug='acts-21-walkest-orderly-and-keepest-the-law-the-nazarite-vow-and-pauls-own-defense'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=21 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=24 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Acts 24:18 — *certain Yahudim (Jews) from Asia found me purified in the temple* the purification of Acts 21 named as Paul''s own defense (Acts 21:24,26).'
  FROM cross_reference_threads t, cross_references x, _s217_a21_lookup sv, _s217_a21_lookup tv
 WHERE t.slug='acts-21-walkest-orderly-and-keepest-the-law-the-nazarite-vow-and-pauls-own-defense'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=21 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=24 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Acts 25:8 — *Neither against the law of the Yahudim (Jews), neither against the temple … have I offended* the law-keeper''s defense before Festus (Acts 21:24).'
  FROM cross_reference_threads t, cross_references x, _s217_a21_lookup sv, _s217_a21_lookup tv
 WHERE t.slug='acts-21-walkest-orderly-and-keepest-the-law-the-nazarite-vow-and-pauls-own-defense'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=21 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=25 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Acts 28:17 — *I have committed nothing against the people, or customs of our fathers* Paul''s last word, in chains at Rome, the rumor false to the end (Acts 21:21,24).'
  FROM cross_reference_threads t, cross_references x, _s217_a21_lookup sv, _s217_a21_lookup tv
 WHERE t.slug='acts-21-walkest-orderly-and-keepest-the-law-the-nazarite-vow-and-pauls-own-defense'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=21 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=28 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-21-against-the-people-and-the-law-and-this-place-the-same-false-charge-as-stephen
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Acts 6:13 — *false witnesses, which said, This man ceaseth not to speak … against this holy place, and the law* the same false charge laid against Stephen, now thrown at Paul (Acts 21:28).'
  FROM cross_reference_threads t, cross_references x, _s217_a21_lookup sv, _s217_a21_lookup tv
 WHERE t.slug='acts-21-against-the-people-and-the-law-and-this-place-the-same-false-charge-as-stephen'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=21 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=6 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
