-- ----- fragment: minion_acts_13.sql (S217 Acts 13) -----
-- =====================================================================
-- S217 minion — ACTS 13 FULL-LIBRARY cross-references
-- =====================================================================
-- Range:  ACTS 13 (Antioch of Pisidia; Paul's synagogue sermon reciting the covenant history
--         and proclaiming the risen Messiah; the turn to the nations at the end).
-- Tag: a13 (temp view _s217_a13_lookup).  Sort band: 5500-5599.
-- Source is ALWAYS the canon Acts verse; targets span Tanakh + extra-canonical + NT.
-- Tiers per-row: canon target = 'free'; extra-canonical target = 'extras'.
--
-- WATCHPOINT (Red Lines #7/#11, the light-to-the-nations risk): Paul's *we turn to the Gentiles*
-- (Acts 13:46) and *I have set thee to be a light of the Gentiles* (Acts 13:47, quoting Isaiah
-- 49:6) are read as the proclamation going out to where the scattered seed live among the
-- nations — the dispersed of Yashar'el (Israel) reached, the lost sheep gathered. NOT the
-- false-inclusion of the nations-as-such into the covenant by faith-confession. Isaiah 49:6 in
-- its own context pairs the light-to-the-nations with *to raise up the tribes of Jacob, and to
-- restore the preserved of Yashar'el (Israel)* — the restoration framing governs the thread, and
-- Simeon's Luke 2:32 holds the same pairing (*a light to lighten the Gentiles, and the glory of
-- thy people Yashar'el*). Framed accordingly in thread acts-13-light-to-the-nations.
--
-- WATCHPOINT (Red Line #10 + Christology): Acts 13:33's *Thou art my Son, this day have I
-- begotten thee* (Psalm 2:7) is the begetting = the resurrection / right-hand enthronement of
-- the Formed — NO Trinitarian co-equal-persons grammar, NO modalist collapse. Yahusha (Jesus)
-- is the Formed drawn from the Formless, who is God and has a Father. Acts 13:38-39's
-- justification language is left as narration (no standalone sola-fide formula authored into a
-- note). Framed accordingly in thread acts-13-the-begetting.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every block):
--  ACTS 13:
--   v.1-12  Antioch sending / Cyprus / Elymas  Tanakh: none warranted (narrative)  Extras: none warranted  NT: none warranted
--   v.16-22 recital: fathers, exodus, judges, Saul, David  Tanakh: 1 Samuel 13:14, Psalm 89:20 (2 Samuel 7:12 weighed -> carried in begetting/Saviour beat)  Extras: 1 Maccabees 2 weighed; faith-recital of patriarchs, not the national history Paul recites -> none added  NT: none warranted
--   v.23-25 the Saviour of David's seed / John's witness  Tanakh: none added  Extras: none warranted  NT: Luke 3:16, John 1:27
--   v.26-31 condemned, slain, taken from the tree, raised  Tanakh: none added (Acts 2 carried Psalm 16)  Extras: none warranted  NT: none warranted (carried in resurrection threads)
--   v.32-33 the begetting / Psalm 2:7  Tanakh: Psalm 2:7  Extras: none warranted  NT: Hebrews 1:5, Hebrews 5:5
--   v.34-37 the sure mercies of David / the Holy One not to see corruption  Tanakh: Isaiah 55:3, Psalm 16:10  Extras: none warranted  NT: Acts 2:27 (Acts<->Acts re-walk)
--   v.38-39 forgiveness / justified  Tanakh: none warranted  Extras: none warranted  NT: none warranted (left as narration; no sola-fide formula authored)
--   v.40-41 beware the despisers / Habakkuk  Tanakh: Habakkuk 1:5  Extras: none warranted  NT: none warranted
--   v.42-45 the next sabbath / envy  Tanakh: none warranted  Extras: none warranted  NT: none warranted
--   v.46-47 we turn to the nations / a light of the nations  Tanakh: Isaiah 49:6  Extras: none warranted  NT: Luke 2:32
--   v.48-50 ordained to life believed / persecution  Tanakh: none warranted  Extras: none warranted  NT: none warranted
--   v.51-52 shook off the dust  Tanakh: none warranted  Extras: none warranted  NT: Matthew 10:14, Luke 9:5
--
-- THREADS (slug -> target libraries):
--   5500 acts-13-the-god-of-yasharel-chose-the-fathers-and-raised-up-david       (Tanakh)
--   5510 acts-13-johns-witness-i-am-not-he-there-cometh-one-after-me             (NT)
--   5520 acts-13-the-begetting-thou-art-my-son-the-raising-up-of-the-formed      (Tanakh + NT)
--   5530 acts-13-the-sure-mercies-of-david-the-holy-one-not-to-see-corruption    (Tanakh + NT)
--   5540 acts-13-beware-ye-despisers-i-work-a-work-in-your-days                  (Tanakh)
--   5550 acts-13-a-light-to-the-nations-and-the-restoration-of-the-tribes        (Tanakh + NT)
--   5560 acts-13-they-shook-off-the-dust-of-their-feet                          (NT)
-- =====================================================================

CREATE TEMP VIEW _s217_a13_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: acts-13-the-god-of-yasharel-chose-the-fathers-and-raised-up-david
  ('canon', 'acts', 13, 22, 'canon', '1-samuel', 13, 14, 'free', E'*But now thy kingdom shall not continue: Yahuah (LORD) hath sought him a man after his own heart, and Yahuah (LORD) hath commanded him to be captain over his people, because thou hast not kept that which Yahuah (LORD) commanded thee.* (1 Samuel 13:14). When Paul says *he raised up unto them David to be their king; to whom also he gave testimony, and said, I have found David the son of Jesse, a man after mine own heart, which shall fulfil all my will* (Acts 13:22), he is reaching back to the word Samuel spoke when Saul''s kingdom was torn away — *Yahuah (LORD) hath sought him a man after his own heart.* The throne passes from the king the people desired to the king Yahuah (LORD) chose.'),
  ('canon', 'acts', 13, 22, 'canon', 'psalms', 89, 20, 'free', E'*I have found David my servant; with my holy oil have I anointed him:* (Psalm 89:20). Paul''s *I have found David the son of Jesse, a man after mine own heart* (Acts 13:22) is the very language of the covenant-song — *I have found David my servant.* The David whom Yahuah (LORD) found and anointed is the head of the line through whom the sworn mercy runs to the Saviour Paul is about to name.'),
  -- thread: acts-13-johns-witness-i-am-not-he-there-cometh-one-after-me
  ('canon', 'acts', 13, 25, 'canon', 'luke', 3, 16, 'free', E'*John answered, saying unto them all, I indeed baptize you with water; but one mightier than I cometh, the latchet of whose shoes I am not worthy to unloose: he shall baptize you with the Ruach HaKodesh (Holy Spirit) and with fire:* (Luke 3:16). Paul rehearses John''s own confession — *as John fulfilled his course, he said, Whom think ye that I am? I am not he. But, behold, there cometh one after me, whose shoes of his feet I am not worthy to loose* (Acts 13:25). The forerunner steps aside for the One he prepared the way for, the same testimony Luke records from John''s mouth.'),
  ('canon', 'acts', 13, 25, 'canon', 'john', 1, 27, 'free', E'*He it is, who coming after me is preferred before me, whose shoe''s latchet I am not worthy to unloose.* (John 1:27). The phrase Paul puts in John''s mouth — *whose shoes of his feet I am not worthy to loose* (Acts 13:25) — is John''s own word at the Jordan: *whose shoe''s latchet I am not worthy to unloose.* The witness who came before disowns the title and points past himself to the One who comes after.'),
  -- thread: acts-13-the-begetting-thou-art-my-son-the-raising-up-of-the-formed
  ('canon', 'acts', 13, 33, 'canon', 'psalms', 2, 7, 'free', E'*I will declare the decree: Yahuah (LORD) hath said unto me, Thou art my Son; this day have I begotten thee.* (Psalm 2:7). Paul reads the resurrection out of the second psalm — *Elohim (God) hath fulfilled the same unto us their children, in that he hath raised up Yahusha (Jesus) again; as it is also written in the second psalm, Thou art my Son, this day have I begotten thee* (Acts 13:33). The *this day* is the day of the raising-up — the enthronement of the Formed, declared Son in power by the rising from the dead. He who is the Son begotten of the Father is set on the throne; the begetting names the day he was raised, not a beginning of his being.'),
  ('canon', 'acts', 13, 33, 'canon', 'hebrews', 1, 5, 'free', E'*For unto which of the angels said he at any time, Thou art my Son, this day have I begotten thee? And again, I will be to him a Father, and he shall be to me a Son?* (Hebrews 1:5). The same decree Paul preaches at Antioch is the word Hebrews sets above the angels — *Thou art my Son, this day have I begotten thee.* It is spoken to the Son alone, the heir of all things, raised and seated *on the right hand of the Majesty on high;* he is Son to a Father, and the throne is his.'),
  ('canon', 'acts', 13, 33, 'canon', 'hebrews', 5, 5, 'free', E'*So also Messiah (Christ) glorified not himself to be made an high priest; but he that said unto him, Thou art my Son, to day have I begotten thee.* (Hebrews 5:5). The begetting Paul ties to the resurrection (Acts 13:33) Hebrews ties to the glorifying of the Messiah (Christ) as high priest — *he that said unto him, Thou art my Son, to day have I begotten thee.* The Son does not seize the honour; the Father confers it, raising and enthroning the One he calls Son.'),
  -- thread: acts-13-the-sure-mercies-of-david-the-holy-one-not-to-see-corruption
  ('canon', 'acts', 13, 34, 'canon', 'isaiah', 55, 3, 'free', E'*Incline your ear, and come unto me: hear, and your soul shall live; and I will make an everlasting covenant with you, even the sure mercies of David.* (Isaiah 55:3). Paul grounds the resurrection-*no more to return to corruption* in the prophet''s pledge — *I will give you the sure mercies of David* (Acts 13:34). The mercies sworn to David are *sure* — they cannot fail — and they are made sure precisely because the One of David''s seed is raised never to see corruption again; the everlasting covenant stands on a living head.'),
  ('canon', 'acts', 13, 35, 'canon', 'psalms', 16, 10, 'free', E'*For thou wilt not leave my soul in hell; neither wilt thou suffer thine Holy One to see corruption.* (Psalm 16:10). Paul says *he saith also in another psalm, Thou shalt not suffer thine Holy One to see corruption* (Acts 13:35), then makes the argument plain: *David … fell on sleep … and saw corruption: But he, whom Elohim (God) raised again, saw no corruption* (Acts 13:36-37). The psalm could not be of David, who lies in his tomb; it is of the Holy One whom Elohim (God) raised, whose flesh saw no decay.'),
  ('canon', 'acts', 13, 35, 'canon', 'acts', 2, 27, 'free', E'*Because thou wilt not leave my soul in hell, neither wilt thou suffer thine Holy One to see corruption.* (Acts 2:27). At Pentecost Peter had already opened the same psalm to the same end — *thou wilt not … suffer thine Holy One to see corruption* — and reasoned that David *is both dead and buried* while the Holy One was raised. Paul at Antioch re-walks the very argument: *Thou shalt not suffer thine Holy One to see corruption* (Acts 13:35), David saw corruption, but the One Elohim (God) raised saw none. Two witnesses, one psalm, one risen Holy One.'),
  -- thread: acts-13-beware-ye-despisers-i-work-a-work-in-your-days
  ('canon', 'acts', 13, 41, 'canon', 'habakkuk', 1, 5, 'free', E'*Behold ye among the heathen, and regard, and wonder marvellously: for I will work a work in your days, which ye will not believe, though it be told you.* (Habakkuk 1:5). Paul closes the sermon with the prophet''s warning — *Behold, ye despisers, and wonder, and perish: for I work a work in your days, a work which ye shall in no wise believe, though a man declare it unto you* (Acts 13:41). The work Yahuah (LORD) declared through Habakkuk that the hearers would not believe is set before this generation again: the raising-up of the Saviour, declared and disbelieved, the same hardness the prophet foretold.'),
  -- thread: acts-13-a-light-to-the-nations-and-the-restoration-of-the-tribes
  ('canon', 'acts', 13, 47, 'canon', 'isaiah', 49, 6, 'free', E'*And he said, It is a light thing that thou shouldest be my servant to raise up the tribes of Jacob, and to restore the preserved of Yashar''el (Israel): I will also give thee for a light to the Gentiles, that thou mayest be my salvation unto the end of the earth.* (Isaiah 49:6). Paul takes his commission from this verse — *I have set thee to be a light of the Gentiles, that thou shouldest be for salvation unto the ends of the earth* (Acts 13:47). The prophet binds the two together in one breath: the light that goes to the nations is the same servant''s work that raises up *the tribes of Jacob* and restores *the preserved of Yashar''el (Israel).* The light goes out among the nations because that is where the scattered of the house are dispersed — the salvation reaching to the ends of the earth is the gathering of the lost sheep, not a new people put in their place.'),
  ('canon', 'acts', 13, 47, 'canon', 'luke', 2, 32, 'free', E'*A light to lighten the Gentiles, and the glory of thy people Yashar''el (Israel).* (Luke 2:32). When Paul calls himself *a light of the Gentiles* (Acts 13:47), he speaks the word Simeon spoke over the child in the temple — and Simeon holds both halves together: the light that lightens the nations is *the glory of thy people Yashar''el (Israel).* The light among the nations and the glory of the people are one salvation; the proclamation reaches the dispersed of the house wherever they are scattered.'),
  -- thread: acts-13-they-shook-off-the-dust-of-their-feet
  ('canon', 'acts', 13, 51, 'canon', 'matthew', 10, 14, 'free', E'*And whosoever shall not receive you, nor hear your words, when ye depart out of that house or city, shake off the dust of your feet.* (Matthew 10:14). When Paul and Barnabas *shook off the dust of their feet against them, and came unto Iconium* (Acts 13:51), they do exactly what the Master charged the sent ones to do where the word is refused — *shake off the dust of your feet.* The pursuit ends where the rejection lands; the messengers move on to where the word will be heard.'),
  ('canon', 'acts', 13, 51, 'canon', 'luke', 9, 5, 'free', E'*And whosoever will not receive you, when ye go out of that city, shake off the very dust from your feet for a testimony against them.* (Luke 9:5). The act of Acts 13:51 — *they shook off the dust of their feet against them* — is the Master''s own instruction to the twelve: *shake off the very dust from your feet for a testimony against them.* It is not vengeance but witness; the dust left behind testifies that the word was brought and refused.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s217_a13_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s217_a13_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-13-the-god-of-yasharel-chose-the-fathers-and-raised-up-david',
       E'The Elohim (God) of Yashar''el (Israel) chose the fathers and raised up David',
       E'Standing in the synagogue at Antioch, Paul recites the covenant history of one people: *The Elohim (God) of this people of Yashar''el (Israel) chose our fathers, and exalted the people when they dwelt as strangers in the land of Egypt … and with an high arm brought he them out of it* (Acts 13:17), through the wilderness, the conquest, the judges, *until Samuel the prophet* (Acts 13:20). When they desired a king, Elohim (God) gave them Saul of the tribe of Benjamin; *and when he had removed him, he raised up unto them David to be their king; to whom also he gave testimony, and said, I have found David the son of Jesse, a man after mine own heart, which shall fulfil all my will* (Acts 13:22). The testimony is Samuel''s own word when Saul''s kingdom was torn away: *Yahuah (LORD) hath sought him a man after his own heart, and Yahuah (LORD) hath commanded him to be captain over his people* (1 Samuel 13:14), and the covenant-song confirms it: *I have found David my servant; with my holy oil have I anointed him* (Psalm 89:20). The throne passes to the king Yahuah (LORD) found and anointed — the head of the line through whom the sworn mercy will run to the Saviour Paul is about to name.',
       sv.verse_id, ev.verse_id, 'free', 5500
  FROM _s217_a13_lookup sv, _s217_a13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=13 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=13 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-13-johns-witness-i-am-not-he-there-cometh-one-after-me',
       E'John''s witness — I am not he; there cometh one after me',
       E'Before he reaches the cross and the empty tomb, Paul names the forerunner: *When John had first preached before his coming the baptism of repentance to all the people of Yashar''el (Israel)* (Acts 13:24). And he gives John''s own confession: *as John fulfilled his course, he said, Whom think ye that I am? I am not he. But, behold, there cometh one after me, whose shoes of his feet I am not worthy to loose* (Acts 13:25). It is the word John spoke at the Jordan — *one mightier than I cometh, the latchet of whose shoes I am not worthy to unloose: he shall baptize you with the Ruach HaKodesh (Holy Spirit) and with fire* (Luke 3:16), *He it is, who coming after me is preferred before me, whose shoe''s latchet I am not worthy to unloose* (John 1:27). The witness who came first disowns the title the people pressed on him and points past himself to the One who comes after. The preparer of the way steps aside for the Saviour of David''s seed.',
       sv.verse_id, ev.verse_id, 'free', 5510
  FROM _s217_a13_lookup sv, _s217_a13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=13 AND sv.verse_number=24
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=13 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-13-the-begetting-thou-art-my-son-the-raising-up-of-the-formed',
       E'The begetting — Thou art my Son; the raising-up of the Formed',
       E'Paul brings the recital to its center: *we declare unto you glad tidings, how that the promise which was made unto the fathers, Elohim (God) hath fulfilled the same unto us their children, in that he hath raised up Yahusha (Jesus) again; as it is also written in the second psalm, Thou art my Son, this day have I begotten thee* (Acts 13:32-33). The decree he quotes is *I will declare the decree: Yahuah (LORD) hath said unto me, Thou art my Son; this day have I begotten thee* (Psalm 2:7). The *this day* is the day of the raising-up — the resurrection that declares the Son in power, the enthronement of the Formed at the right hand. He who is Son to a Father is set upon the throne; the begetting names the day he was raised and seated, not a beginning of his being. Hebrews sets the same decree above the angels — *unto which of the angels said he at any time, Thou art my Son, this day have I begotten thee?* (Hebrews 1:5) — and ties it to his glorifying as high priest — *Messiah (Christ) glorified not himself … but he that said unto him, Thou art my Son, to day have I begotten thee* (Hebrews 5:5). The Son does not seize the honour; the Father confers it, raising and enthroning the One he calls Son.',
       sv.verse_id, ev.verse_id, 'free', 5520
  FROM _s217_a13_lookup sv, _s217_a13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=13 AND sv.verse_number=32
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=13 AND ev.verse_number=33
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-13-the-sure-mercies-of-david-the-holy-one-not-to-see-corruption',
       E'The sure mercies of David — the Holy One not to see corruption',
       E'The resurrection is *no more to return to corruption,* and Paul anchors it in two psalms and the prophet. *I will give you the sure mercies of David* (Acts 13:34) is Isaiah''s everlasting-covenant pledge — *Incline your ear, and come unto me: hear, and your soul shall live; and I will make an everlasting covenant with you, even the sure mercies of David* (Isaiah 55:3). The mercies are *sure* — they cannot fail — because the One of David''s seed is raised never to decay again; the everlasting covenant stands on a living head. Then Paul opens the sixteenth psalm: *Thou shalt not suffer thine Holy One to see corruption* (Acts 13:35), which is *thou wilt not … suffer thine Holy One to see corruption* (Psalm 16:10), and he reasons it cannot be of David: *David, after he had served his own generation … fell on sleep … and saw corruption: But he, whom Elohim (God) raised again, saw no corruption* (Acts 13:36-37). At Pentecost Peter had already opened the same psalm to the same end — *thou wilt not leave my soul in hell, neither wilt thou suffer thine Holy One to see corruption* (Acts 2:27) — David is dead and buried, but the Holy One was raised. Two witnesses, one psalm, one risen Holy One whose flesh saw no decay.',
       sv.verse_id, ev.verse_id, 'free', 5530
  FROM _s217_a13_lookup sv, _s217_a13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=13 AND sv.verse_number=34
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=13 AND ev.verse_number=37
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-13-beware-ye-despisers-i-work-a-work-in-your-days',
       E'Beware, ye despisers — I work a work in your days',
       E'Paul closes the synagogue sermon not with comfort but with the prophet''s warning: *Beware therefore, lest that come upon you, which is spoken of in the prophets; Behold, ye despisers, and wonder, and perish: for I work a work in your days, a work which ye shall in no wise believe, though a man declare it unto you* (Acts 13:40-41). It is Habakkuk''s word — *Behold ye among the heathen, and regard, and wonder marvellously: for I will work a work in your days, which ye will not believe, though it be told you* (Habakkuk 1:5). The work Yahuah (LORD) declared through the prophet, that the hearers would marvel at and refuse, is set before this generation again: the raising-up of the Saviour, declared and disbelieved. The warning is mercy held out before the door closes — wonder at the work, but do not perish despising it.',
       sv.verse_id, ev.verse_id, 'free', 5540
  FROM _s217_a13_lookup sv, _s217_a13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=13 AND sv.verse_number=40
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=13 AND ev.verse_number=41
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-13-a-light-to-the-nations-and-the-restoration-of-the-tribes',
       E'A light to the nations — and the restoration of the tribes',
       E'When the leaders contradict and blaspheme, Paul and Barnabas wax bold: *It was necessary that the word of Elohim (God) should first have been spoken to you: but seeing ye put it from you … lo, we turn to the Gentiles. For so hath Yahuah (Lord) commanded us, saying, I have set thee to be a light of the Gentiles, that thou shouldest be for salvation unto the ends of the earth* (Acts 13:46-47). The verse they take their commission from is Isaiah''s, and the prophet binds two works into one breath: *It is a light thing that thou shouldest be my servant to raise up the tribes of Jacob, and to restore the preserved of Yashar''el (Israel): I will also give thee for a light to the Gentiles, that thou mayest be my salvation unto the end of the earth* (Isaiah 49:6). The light goes out to the nations because that is where the scattered of the house are dispersed; the salvation reaching to the ends of the earth is the raising-up of the tribes of Jacob and the restoring of the preserved of Yashar''el (Israel) — the lost sheep gathered from where they were sown, not a new people set in their place. Simeon held the same two halves together over the child in the temple: *A light to lighten the Gentiles, and the glory of thy people Yashar''el (Israel)* (Luke 2:32). The light among the nations and the glory of the people are one salvation; the proclamation reaches the dispersed of the house wherever they are scattered, and *as many as were ordained to eternal life believed* (Acts 13:48) — the hearing revealing those who were already his.',
       sv.verse_id, ev.verse_id, 'free', 5550
  FROM _s217_a13_lookup sv, _s217_a13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=13 AND sv.verse_number=46
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=13 AND ev.verse_number=48
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-13-they-shook-off-the-dust-of-their-feet',
       E'They shook off the dust of their feet',
       E'When persecution is stirred up and they are expelled from the coasts, the messengers do what the Master charged: *they shook off the dust of their feet against them, and came unto Iconium. And the disciples were filled with joy, and with the Ruach HaKodesh (Holy Spirit)* (Acts 13:51-52). Yahusha (Jesus) had given the instruction to the sent ones: *whosoever shall not receive you, nor hear your words, when ye depart out of that house or city, shake off the dust of your feet* (Matthew 10:14), *shake off the very dust from your feet for a testimony against them* (Luke 9:5). It is not vengeance but witness — the dust left behind testifies that the word was brought and refused. The pursuit ends where the rejection lands; the messengers move on, *filled with joy,* to where the word will be heard. The sheep hear the Shepherd''s voice; where it is put away, the dust is shaken off and the proclamation goes forward.',
       sv.verse_id, ev.verse_id, 'free', 5560
  FROM _s217_a13_lookup sv, _s217_a13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=13 AND sv.verse_number=51
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=13 AND ev.verse_number=52
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: acts-13-the-god-of-yasharel-chose-the-fathers-and-raised-up-david
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Samuel 13:14 — *Yahuah (LORD) hath sought him a man after his own heart* Samuel''s word when Saul''s kingdom was torn away, which Paul quotes of David (Acts 13:22).'
  FROM cross_reference_threads t, cross_references x, _s217_a13_lookup sv, _s217_a13_lookup tv
 WHERE t.slug='acts-13-the-god-of-yasharel-chose-the-fathers-and-raised-up-david'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=13 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=13 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 89:20 — *I have found David my servant; with my holy oil have I anointed him* the covenant-song''s found-and-anointed David, the head of the line of the sworn mercy (Acts 13:22).'
  FROM cross_reference_threads t, cross_references x, _s217_a13_lookup sv, _s217_a13_lookup tv
 WHERE t.slug='acts-13-the-god-of-yasharel-chose-the-fathers-and-raised-up-david'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=13 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=89 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-13-johns-witness-i-am-not-he-there-cometh-one-after-me
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Luke 3:16 — *one mightier than I cometh, the latchet of whose shoes I am not worthy to unloose* John''s confession at the Jordan, which Paul rehearses (Acts 13:25).'
  FROM cross_reference_threads t, cross_references x, _s217_a13_lookup sv, _s217_a13_lookup tv
 WHERE t.slug='acts-13-johns-witness-i-am-not-he-there-cometh-one-after-me'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=13 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=3 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 1:27 — *whose shoe''s latchet I am not worthy to unloose* John''s own word, the very phrase Paul puts in his mouth (Acts 13:25).'
  FROM cross_reference_threads t, cross_references x, _s217_a13_lookup sv, _s217_a13_lookup tv
 WHERE t.slug='acts-13-johns-witness-i-am-not-he-there-cometh-one-after-me'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=13 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-13-the-begetting-thou-art-my-son-the-raising-up-of-the-formed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 2:7 — *Thou art my Son; this day have I begotten thee* the decree Paul reads of the resurrection; the *this day* is the day of the raising-up and enthronement (Acts 13:33).'
  FROM cross_reference_threads t, cross_references x, _s217_a13_lookup sv, _s217_a13_lookup tv
 WHERE t.slug='acts-13-the-begetting-thou-art-my-son-the-raising-up-of-the-formed'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=13 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 1:5 — *Thou art my Son, this day have I begotten thee* the same decree spoken to the Son alone, set above the angels (Acts 13:33).'
  FROM cross_reference_threads t, cross_references x, _s217_a13_lookup sv, _s217_a13_lookup tv
 WHERE t.slug='acts-13-the-begetting-thou-art-my-son-the-raising-up-of-the-formed'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=13 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 5:5 — *he that said unto him, Thou art my Son, to day have I begotten thee* the begetting tied to the Father glorifying the Son as high priest (Acts 13:33).'
  FROM cross_reference_threads t, cross_references x, _s217_a13_lookup sv, _s217_a13_lookup tv
 WHERE t.slug='acts-13-the-begetting-thou-art-my-son-the-raising-up-of-the-formed'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=13 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=5 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-13-the-sure-mercies-of-david-the-holy-one-not-to-see-corruption
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 55:3 — *I will make an everlasting covenant with you, even the sure mercies of David* the pledge Paul ties to the resurrection-no-more-to-corruption (Acts 13:34).'
  FROM cross_reference_threads t, cross_references x, _s217_a13_lookup sv, _s217_a13_lookup tv
 WHERE t.slug='acts-13-the-sure-mercies-of-david-the-holy-one-not-to-see-corruption'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=13 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=55 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 16:10 — *neither wilt thou suffer thine Holy One to see corruption* the psalm Paul shows cannot be of David, who saw corruption, but of the One raised (Acts 13:35-37).'
  FROM cross_reference_threads t, cross_references x, _s217_a13_lookup sv, _s217_a13_lookup tv
 WHERE t.slug='acts-13-the-sure-mercies-of-david-the-holy-one-not-to-see-corruption'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=13 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=16 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 2:27 — *neither wilt thou suffer thine Holy One to see corruption* Peter at Pentecost opened the same psalm to the same end; Paul re-walks the argument (Acts 13:35).'
  FROM cross_reference_threads t, cross_references x, _s217_a13_lookup sv, _s217_a13_lookup tv
 WHERE t.slug='acts-13-the-sure-mercies-of-david-the-holy-one-not-to-see-corruption'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=13 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=2 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-13-beware-ye-despisers-i-work-a-work-in-your-days
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Habakkuk 1:5 — *I will work a work in your days, which ye will not believe, though it be told you* the prophet''s warning Paul sets before this generation (Acts 13:41).'
  FROM cross_reference_threads t, cross_references x, _s217_a13_lookup sv, _s217_a13_lookup tv
 WHERE t.slug='acts-13-beware-ye-despisers-i-work-a-work-in-your-days'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=13 AND sv.verse_number=41
   AND tv.edition_slug='canon' AND tv.book_slug='habakkuk' AND tv.chapter_number=1 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-13-a-light-to-the-nations-and-the-restoration-of-the-tribes
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 49:6 — *to raise up the tribes of Jacob, and to restore the preserved of Yashar''el (Israel): I will also give thee for a light to the Gentiles* the prophet binds the light-to-the-nations to the restoration of the tribes in one breath (Acts 13:47).'
  FROM cross_reference_threads t, cross_references x, _s217_a13_lookup sv, _s217_a13_lookup tv
 WHERE t.slug='acts-13-a-light-to-the-nations-and-the-restoration-of-the-tribes'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=13 AND sv.verse_number=47
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=49 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Luke 2:32 — *A light to lighten the Gentiles, and the glory of thy people Yashar''el (Israel)* Simeon holds the light-to-the-nations and the glory of the people together as one salvation (Acts 13:47).'
  FROM cross_reference_threads t, cross_references x, _s217_a13_lookup sv, _s217_a13_lookup tv
 WHERE t.slug='acts-13-a-light-to-the-nations-and-the-restoration-of-the-tribes'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=13 AND sv.verse_number=47
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=2 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-13-they-shook-off-the-dust-of-their-feet
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 10:14 — *when ye depart out of that house or city, shake off the dust of your feet* the Master''s charge to the sent ones, done at Antioch (Acts 13:51).'
  FROM cross_reference_threads t, cross_references x, _s217_a13_lookup sv, _s217_a13_lookup tv
 WHERE t.slug='acts-13-they-shook-off-the-dust-of-their-feet'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=13 AND sv.verse_number=51
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=10 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Luke 9:5 — *shake off the very dust from your feet for a testimony against them* the same charge to the twelve; not vengeance but witness (Acts 13:51).'
  FROM cross_reference_threads t, cross_references x, _s217_a13_lookup sv, _s217_a13_lookup tv
 WHERE t.slug='acts-13-they-shook-off-the-dust-of-their-feet'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=13 AND sv.verse_number=51
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=9 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
