-- ----- fragment: minion_galatians_01.sql (S223 Galatians 1) -----
-- =====================================================================
-- S223 minion — GALATIANS 1 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: GALATIANS 1 (24 verses).  Tag: g01 (temp view _s223_g01_lookup).
-- Sort band: floor 7200, step 3, 25-wide (7200,7203,7206,7209,7212 used; under 7225).
-- Source is ALWAYS the canon Galatians verse; targets span Tanakh + extra-canonical + NT.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (HIGHEST VOICE-RISK BOOK — "The Galatians Lie"; Red Lines #4/#5/#6/#7/#10):
-- Galatians is written to the scattered seed of Yashar'el (Israel) living among the nations with
-- covenant memory dimmed by exile — Paul is bringing them HOME — NOT to pagans who never had
-- Torah. The "other gospel" (1:6-9) Paul curses is the agitators' flesh-credential proselyte
-- gospel (Acts 15:1, become-a-Jew-by-the-knife-and-be-saved), the live circumcision politics the
-- Hebrew library already records (1 Maccabees). It is NOT the Torah. Grace is the means of RETURN
-- to Yahuah (LORD) and his ways, never set against them. Christology: Yahusha (Jesus) is the
-- Formed one drawn from the Formless, who came in flesh — he is Yahuah (LORD) and HAS a Father
-- (1:1 *Elohim (God) the Father, who raised him from the dead*); the Son has a Father, no
-- co-equal-Trinity grammar, no modalist collapse. The 1:13-14 watchpoint is handled below.
--
-- ⚠️ 1:13-14 HANDLING (the contested verse of this chapter): *the Yahudim's (Jews') religion* and
-- *the traditions of my fathers* are NOT the Torah Paul never forsook (Acts 21:24, 24:14, 25:8,
-- 28:17 — he kept it to the end). They are the man-made tradition-SYSTEM of the straitest Pharisee
-- sect — the very *tradition of men* Yahusha (Jesus) rebuked: *laying aside the commandment of
-- Elohim (God), ye hold the tradition of men* (Mark 7:8). Paul's *exceeding* zeal *for the
-- traditions of my fathers* was zeal for THAT system, which drove him to persecute the assembly —
-- not zeal for the righteous instruction of Yahuah (LORD). The cross-references pin the religion/
-- traditions to the man-made system (Mark 7:8-9) and to Paul's own testimony of his Pharisee
-- upbringing (Acts 22:3, 26:5), so the verse can never be read as Torah-was-the-bondage.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1,4   Paul an apostle... by Yahusha and Elohim the Father, who raised him from the dead
--           Tanakh: Psalm 16:10 (thou wilt not suffer thine Holy One to see corruption)
--           Extras: none warranted  NT: Romans 6:4 (raised up from the dead by the glory of the Father)
--   v.2-3,5 grace and peace from the Father; glory for ever  -- standard epistolary opening
--           Tanakh: none warranted  Extras: none warranted  NT: carried in the 1:1 thread (same hand)
--   v.6-9   removed unto another gospel; the troublers who pervert the gospel; let him be accursed
--           Tanakh: none warranted  Extras: 1 Maccabees 1:11 (let us make a covenant with the
--                   heathen), 1:15 (made themselves uncircumcised, forsook the holy covenant),
--                   2:50 (be zealous for the law... the covenant of your fathers) — the live
--                   circumcision politics behind the agitators' gospel  NT: none added (Acts 15:1
--                   carried in prose; same hand)
--   v.10    do I seek to please men? -- servant of Messiah  Tanakh/Extras/NT: none warranted (in 1:6-9 prose)
--   v.11-12 the gospel not after man, neither received of man, but by revelation of Yahusha
--           Tanakh: none warranted  Extras: none warranted  NT: Ephesians 3:3 (by revelation he
--                   made known unto me the mystery), 1 Corinthians 15:3 (I delivered... which I
--                   also received... according to the scriptures), Acts 26:16 (I have appeared...
--                   to make thee a minister and a witness)
--   v.13-14 my conversation in the Yahudim's religion; zealous of the traditions of my fathers
--           Tanakh: none warranted  Extras: none warranted  NT: Mark 7:8 (ye hold the tradition of
--                   men), Mark 7:9 (ye reject the commandment of Elohim, that ye may keep your own
--                   tradition), Acts 22:3 (taught according to the perfect manner of the law of the
--                   fathers, zealous), Acts 26:5 (after the most straitest sect... a Pharisee)
--   v.15-16 separated me from my mother's womb, and called me by his grace, to reveal his Son in me
--           Tanakh: Isaiah 49:1 (Yahuah hath called me from the womb), Isaiah 49:5 (formed me from
--                   the womb to be his servant, to bring Jacob again), Jeremiah 1:5 (before thou
--                   camest forth out of the womb I sanctified thee... a prophet unto the nations)
--           Extras: none warranted  NT: Acts 9:15 (a chosen vessel... to bear my name before the
--                   Gentiles, and kings, and the children of Yashar'el)
--   v.17-24 Arabia, Damascus, Jerusalem; the assemblies of Judaea glorified Elohim in me
--           Tanakh: none warranted  Extras: none warranted  NT: none warranted (biographical)
--
-- THREADS (slug -> target libraries):
--   7200 galatians-1-the-father-who-raised-him-from-the-dead-christology              (Tanakh + NT)
--   7203 galatians-1-the-gospel-not-after-man-but-by-the-revelation-of-yahusha        (NT)
--   7206 galatians-1-the-jews-religion-and-the-traditions-of-my-fathers               (NT)
--   7209 galatians-1-separated-from-my-mothers-womb-the-prophetic-call-isaiah-49      (Tanakh + NT)
--   7212 galatians-1-another-gospel-and-the-agitators-flesh-credential-politics       (Extras)
-- =====================================================================

CREATE TEMP VIEW _s223_g01_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: galatians-1-the-father-who-raised-him-from-the-dead-christology
  ('canon', 'galatians', 1, 1, 'canon', 'romans', 6, 4, 'free', E'*Therefore we are buried with him by baptism into death: that like as Messiah (Christ) was raised up from the dead by the glory of the Father, even so we also should walk in newness of life.* (Romans 6:4). The opening word of the letter already carries the whole Christology: *Paul, an apostle, (not of men, neither by man, but by Yahusha HaMashiach (Jesus Christ), and Elohim (God) the Father, who raised him from the dead;)* (Galatians 1:1). The same hand that raised Messiah (Christ) is named *the Father* — the Son has a Father, and it was *by the glory of the Father* he was raised. The Formed one who came in flesh is not a rival to Yahuah (LORD) but the one Yahuah (LORD) raised and the one who, with the Father, sends Paul.'),
  ('canon', 'galatians', 1, 1, 'canon', 'psalms', 16, 10, 'free', E'*For thou wilt not leave my soul in hell; neither wilt thou suffer thine Holy One to see corruption.* (Psalm 16:10). The Father *who raised him from the dead* (Galatians 1:1) had sworn it long before in the psalm: the Holy One would not be left to corruption. The resurrection that authorises Paul''s apostleship *not of men* is no new thing — it is the keeping of an ancient word of Yahuah (LORD), the Father raising his Holy One as the song foretold.'),
  ('canon', 'galatians', 1, 4, 'canon', 'romans', 6, 4, 'free', E'*Therefore we are buried with him by baptism into death... even so we also should walk in newness of life.* (Romans 6:4). *Who gave himself for our sins, that he might deliver us from this present evil world, according to the will of Elohim (God) and our Father* (Galatians 1:4). The Son gave himself *according to the will of... our Father*; the Father raised him from the dead (1:1); and those joined to that death rise to *walk in newness of life.* Deliverance from *this present evil world* is the Father''s will worked through the Son he raised — grace as the power to walk, not a release from walking.'),
  -- thread: galatians-1-the-gospel-not-after-man-but-by-the-revelation-of-yahusha
  ('canon', 'galatians', 1, 12, 'canon', 'ephesians', 3, 3, 'free', E'*How that by revelation he made known unto me the mystery; (as I wrote afore in few words,* (Ephesians 3:3). *For I neither received it of man, neither was I taught it, but by the revelation of Yahusha HaMashiach (Jesus Christ)* (Galatians 1:12). Paul says the same thing twice across two letters: the gospel he carries came *by revelation,* not handed down through a human chain. The Son who *raised... from the dead* (1:1) is the one who *made known* the mystery directly — Paul''s authority rests on the risen Messiah (Christ), not on the credential-system of any sect of men.'),
  ('canon', 'galatians', 1, 11, 'canon', '1-corinthians', 15, 3, 'free', E'*For I delivered unto you first of all that which I also received, how that Messiah (Christ) died for our sins according to the scriptures;* (1 Corinthians 15:3). *But I certify you, brethren, that the gospel which was preached of me is not after man.* (Galatians 1:11). What Paul *received* he received from the risen Lord, and it was *according to the scriptures* — rooted in the Tanakh, not invented by men. The gospel *not after man* is the gospel the prophets already wrote; revelation and Scripture agree, and neither is the tradition of any sect.'),
  ('canon', 'galatians', 1, 12, 'canon', 'acts', 26, 16, 'free', E'*But rise, and stand upon thy feet: for I have appeared unto thee for this purpose, to make thee a minister and a witness both of these things which thou hast seen, and of those things in the which I will appear unto thee;* (Acts 26:16). *For I neither received it of man... but by the revelation of Yahusha HaMashiach (Jesus Christ)* (Galatians 1:12). The Damascus road is the revelation Paul names: the risen Lord *appeared* and made him *a minister and a witness.* His commission came straight from Yahusha (Jesus), not through Jerusalem or any college of men — exactly the claim Galatians 1 presses.'),
  -- thread: galatians-1-the-jews-religion-and-the-traditions-of-my-fathers
  ('canon', 'galatians', 1, 14, 'canon', 'mark', 7, 8, 'free', E'*For laying aside the commandment of Elohim (God), ye hold the tradition of men, as the washing of pots and cups: and many other such like things ye do.* (Mark 7:8). *And profited in the Yahudim''s (Jews'') religion above many my equals in mine own nation, being more exceedingly zealous of the traditions of my fathers.* (Galatians 1:14). The *traditions of my fathers* Paul was zealous for are the *tradition of men* Yahusha (Jesus) named — the man-made system that is *laid aside the commandment of Elohim (God).* Paul''s zeal was for that human framework, not for the Torah he never forsook; it is precisely the tradition-system that drove him to *persecute the church of Elohim (God)* (Galatians 1:13).'),
  ('canon', 'galatians', 1, 14, 'canon', 'mark', 7, 9, 'free', E'*And he said unto them, Full well ye reject the commandment of Elohim (God), that ye may keep your own tradition.* (Mark 7:9). *being more exceedingly zealous of the traditions of my fathers.* (Galatians 1:14). The accusation is exact: the keeping of *your own tradition* comes at the cost of *the commandment of Elohim (God).* So when Paul names his former zeal for *the traditions of my fathers,* he names the system that sets human tradition over the instruction of Yahuah (LORD) — the very thing he is delivered from, not the righteous Torah itself.'),
  ('canon', 'galatians', 1, 13, 'canon', 'acts', 22, 3, 'free', E'*I am verily a man which am a Yahudi (Jew), born in Tarsus, a city in Cilicia, yet brought up in this city at the feet of Gamaliel, and taught according to the perfect manner of the law of the fathers, and was zealous toward Elohim (God), as ye all are this day.* (Acts 22:3). *For ye have heard of my conversation in time past in the Yahudim''s (Jews'') religion, how that beyond measure I persecuted the church of Elohim (God), and wasted it* (Galatians 1:13). Paul''s own defence fills in what *the Yahudim''s (Jews'') religion* meant for him: schooling *at the feet of Gamaliel* in *the law of the fathers* of the Pharisee party, a zeal so fierce it persecuted the assembly. The *religion* he describes is the sectarian formation, not the covenant of Yahuah (LORD).'),
  ('canon', 'galatians', 1, 13, 'canon', 'acts', 26, 5, 'free', E'*Which knew me from the beginning, if they would testify, that after the most straitest sect of our religion I lived a Pharisee.* (Acts 26:5). *how that beyond measure I persecuted the church of Elohim (God), and wasted it* (Galatians 1:13). Paul names *the most straitest sect* — the Pharisees — as the *religion* of his former life. *The Yahudim''s (Jews'') religion* of Galatians 1:13 is this sect-system, the straitest party with its traditions of the fathers, the engine of his persecuting zeal — never the Torah, which he kept and defended to the end.'),
  -- thread: galatians-1-separated-from-my-mothers-womb-the-prophetic-call-isaiah-49
  ('canon', 'galatians', 1, 15, 'canon', 'isaiah', 49, 1, 'free', E'*Listen, O isles, unto me; and hearken, ye people, from far; Yahuah (LORD) hath called me from the womb; from the bowels of my mother hath he made mention of my name.* (Isaiah 49:1). *But when it pleased Elohim (God), who separated me from my mother''s womb, and called me by his grace* (Galatians 1:15). Paul takes up the servant''s very words: called *from the womb,* named *from the bowels of my mother.* He stands in the line of the prophetic call — set apart before birth, summoned by grace — and like the servant he is sent *to the isles* and *the people from far,* the scattered of Yashar''el (Israel) among the nations.'),
  ('canon', 'galatians', 1, 16, 'canon', 'isaiah', 49, 5, 'free', E'*And now, saith Yahuah (LORD) that formed me from the womb to be his servant, to bring Jacob again to him, Though Yashar''el (Israel) be not gathered, yet shall I be glorious in the eyes of Yahuah (LORD)* (Isaiah 49:5). *To reveal his Son in me, that I might preach him among the heathen* (Galatians 1:16). The servant is *formed from the womb... to bring Jacob again* — to gather the scattered house back home. That is the shape of Paul''s sending: *to reveal his Son in me, that I might preach him among the heathen* — among the very nations where the lost sheep of Yashar''el (Israel) are scattered. The call from the womb is a call to the regathering.'),
  ('canon', 'galatians', 1, 15, 'canon', 'jeremiah', 1, 5, 'free', E'*Before I formed thee in the belly I knew thee; and before thou camest forth out of the womb I sanctified thee, and I ordained thee a prophet unto the nations.* (Jeremiah 1:5). *who separated me from my mother''s womb, and called me by his grace* (Galatians 1:15). The word to Jeremiah is the pattern: known before forming, sanctified before birth, *ordained... a prophet unto the nations.* Paul''s *separated... from my mother''s womb* is the same prophetic appointing — and like Jeremiah he is set *unto the nations,* sent *among the heathen* (Galatians 1:16) where the scattered are to be reached.'),
  ('canon', 'galatians', 1, 16, 'canon', 'acts', 9, 15, 'free', E'*But Yahuah (Lord) said unto him, Go thy way: for he is a chosen vessel unto me, to bear my name before the Gentiles, and kings, and the children of Yashar''el (Israel)* (Acts 9:15). *To reveal his Son in me, that I might preach him among the heathen* (Galatians 1:16). The commission spoken over Paul at Damascus names both ends of his sending: *before the Gentiles, and kings, and the children of Yashar''el (Israel).* His preaching *among the heathen* is never a turning from Yashar''el (Israel) but the carrying of the name out to where the scattered children dwell among the nations — the chosen vessel sent to bring the sheep home.'),
  -- thread: galatians-1-another-gospel-and-the-agitators-flesh-credential-politics
  ('canon', 'galatians', 1, 7, 'apocrypha', '1-maccabees', 1, 11, 'extras', E'*In those days went there out of Yashar''el (Israel) wicked men, who persuaded many, saying, Let us go and make a covenant with the heathen that are round about us: for since we departed from them we have had much sorrow.* (1 Maccabees 1:11). *Which is not another; but there be some that trouble you, and would pervert the gospel of Messiah (Christ).* (Galatians 1:7). The Hebrew library remembers the pattern of *some that trouble you*: men out of Yashar''el (Israel) who *persuaded many* to remake the covenant on the terms of the nations. The agitators of Galatia run the same architecture — persuading the gathered seed to take up a flesh-credential gospel that *perverts* the gospel of Messiah (Christ).'),
  ('canon', 'galatians', 1, 8, 'apocrypha', '1-maccabees', 1, 15, 'extras', E'*And made themselves uncircumcised, and forsook the holy covenant, and joined themselves to the heathen, and were sold to do mischief.* (1 Maccabees 1:15). *But though we, or an angel from heaven, preach any other gospel unto you than that which we have preached unto you, let him be accursed.* (Galatians 1:8). The circumcision politics behind the *other gospel* are old and bitter: in the days of the maccabees apostates *made themselves uncircumcised* and *forsook the holy covenant* to please the nations. The Galatian agitators work the mirror image — pressing the covenant mark as a flesh-credential for salvation — but both pervert the covenant by making the flesh the doorway, and Paul pronounces the *accursed* over the false gospel either way.'),
  ('canon', 'galatians', 1, 6, 'apocrypha', '1-maccabees', 2, 50, 'extras', E'*Now therefore, my sons, be you zealous for the law, and give your lives for the covenant of your fathers.* (1 Maccabees 2:50). *I marvel that ye are so soon removed from him that called you into the grace of Messiah (Christ) unto another gospel* (Galatians 1:6). Mattathias'' charge — *be you zealous for the law... the covenant of your fathers* — shows the true covenant zeal the maccabees died for: faithfulness to Yahuah (LORD) and his instruction. The Galatians are *so soon removed* not from that, but *from him that called* them — drawn by the agitators away from grace into a counterfeit that trades the calling of Yahuah (LORD) for a flesh-performance gospel.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s223_g01_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s223_g01_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'galatians-1-the-father-who-raised-him-from-the-dead-christology',
       E'The Father, who raised him from the dead — the Son who has a Father',
       E'The very first sentence of the letter sets the Christology straight. *Paul, an apostle, (not of men, neither by man, but by Yahusha HaMashiach (Jesus Christ), and Elohim (God) the Father, who raised him from the dead;)* (Galatians 1:1). The risen Son and the Father stand together as the source of Paul''s sending — and the Father is named precisely as the one *who raised him from the dead.* The Son has a Father; the Formed one who came in flesh is Yahuah (LORD) and is not a rival to the Father but the one the Father raised. Paul says it again in writing to Rome: *like as Messiah (Christ) was raised up from the dead by the glory of the Father, even so we also should walk in newness of life* (Romans 6:4) — the raising is *by the glory of the Father,* and it issues in a new walk. And the raising itself was no innovation; it kept an ancient oath of the psalm: *thou wilt not leave my soul in hell; neither wilt thou suffer thine Holy One to see corruption* (Psalm 16:10). The Father had sworn long before that his Holy One would not be left to corruption, and he raised him as the song foretold. The Son *gave himself for our sins, that he might deliver us from this present evil world, according to the will of Elohim (God) and our Father* (Galatians 1:4) — the Father''s will worked through the Son he raised, grace as the power to walk in newness of life, not a release from walking in his ways.',
       sv.verse_id, ev.verse_id, 'free', 7200
  FROM _s223_g01_lookup sv, _s223_g01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=1 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='galatians' AND ev.chapter_number=1 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'galatians-1-the-gospel-not-after-man-but-by-the-revelation-of-yahusha',
       E'The gospel not after man, but by the revelation of Yahusha (Jesus)',
       E'Paul grounds his whole authority not in a human chain of credentials but in the risen Lord who revealed himself. *But I certify you, brethren, that the gospel which was preached of me is not after man. For I neither received it of man, neither was I taught it, but by the revelation of Yahusha HaMashiach (Jesus Christ)* (Galatians 1:11-12). He says the same to Ephesus: *how that by revelation he made known unto me the mystery* (Ephesians 3:3) — the gospel came down by revelation, not handed through any school of men. Yet *not after man* never means cut off from the Scriptures: what Paul received he received as written, *I delivered unto you first of all that which I also received, how that Messiah (Christ) died for our sins according to the scriptures* (1 Corinthians 15:3). Revelation and the Tanakh agree; the gospel *not after man* is the gospel the prophets already wrote. And the revelation has a place and an hour — the Damascus road, where the risen Lord said, *I have appeared unto thee for this purpose, to make thee a minister and a witness both of these things which thou hast seen* (Acts 26:16). Paul''s commission came straight from Yahusha (Jesus), the Son the Father raised — not through Jerusalem, not through the straitest sect, not through the agitators who now trouble the assemblies.',
       sv.verse_id, ev.verse_id, 'free', 7203
  FROM _s223_g01_lookup sv, _s223_g01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=1 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='galatians' AND ev.chapter_number=1 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'galatians-1-the-jews-religion-and-the-traditions-of-my-fathers',
       E'The Yahudim''s (Jews'') religion and the traditions of my fathers — the tradition of men, not the Torah',
       E'This is the verse the inherited reading turns into a charge against the Torah, and the turning misreads what Paul names. *For ye have heard of my conversation in time past in the Yahudim''s (Jews'') religion, how that beyond measure I persecuted the church of Elohim (God), and wasted it: and profited in the Yahudim''s (Jews'') religion above many my equals in mine own nation, being more exceedingly zealous of the traditions of my fathers* (Galatians 1:13-14). The *religion* and the *traditions of my fathers* are not the instruction of Yahuah (LORD); they are the man-made system of the straitest Pharisee sect — the very thing Yahusha (Jesus) rebuked: *for laying aside the commandment of Elohim (God), ye hold the tradition of men* (Mark 7:8), *full well ye reject the commandment of Elohim (God), that ye may keep your own tradition* (Mark 7:9). The tradition-system sets human rules OVER the commandment of Elohim (God); zeal for it does not keep the Torah, it buries it. Paul''s own testimony fills in the picture: *taught according to the perfect manner of the law of the fathers, and was zealous toward Elohim (God)* (Acts 22:3) — schooled at the feet of Gamaliel in the party''s traditions — *that after the most straitest sect of our religion I lived a Pharisee* (Acts 26:5). It was zeal for THAT sect-system, not for the righteous Torah, that drove him *beyond measure* to persecute the assembly. The Paul who was delivered from the tradition of men never forsook the commandment of Elohim (God): to the end he could say he *walkest orderly, and keepest the law* (Acts 21:24), *believing all things which are written in the law and in the prophets* (Acts 24:14). The religion he left was the man-made system; the Torah he kept.',
       sv.verse_id, ev.verse_id, 'free', 7206
  FROM _s223_g01_lookup sv, _s223_g01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=1 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='galatians' AND ev.chapter_number=1 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'galatians-1-separated-from-my-mothers-womb-the-prophetic-call-isaiah-49',
       E'Separated from my mother''s womb, and called by his grace — the prophetic call',
       E'When Paul tells how he was set apart, he reaches for the words of the prophets'' own calling. *But when it pleased Elohim (God), who separated me from my mother''s womb, and called me by his grace, to reveal his Son in me, that I might preach him among the heathen* (Galatians 1:15-16). That is the servant''s language exactly: *Yahuah (LORD) hath called me from the womb; from the bowels of my mother hath he made mention of my name* (Isaiah 49:1), and *saith Yahuah (LORD) that formed me from the womb to be his servant, to bring Jacob again to him, Though Yashar''el (Israel) be not gathered* (Isaiah 49:5). It is Jeremiah''s commission too: *Before I formed thee in the belly I knew thee; and before thou camest forth out of the womb I sanctified thee, and I ordained thee a prophet unto the nations* (Jeremiah 1:5). Set apart before birth, summoned by grace, sent *unto the nations* — Paul stands in this line. And the aim of his sending is the servant''s aim: *to bring Jacob again,* to gather the scattered house home. His preaching *among the heathen* is no turning from Yashar''el (Israel); the Lord said over him at Damascus, *he is a chosen vessel unto me, to bear my name before the Gentiles, and kings, and the children of Yashar''el (Israel)* (Acts 9:15). The call from the womb is a call to the regathering — to carry the name out to the very nations where the lost sheep of Yashar''el (Israel) are scattered, and bring them home by his grace.',
       sv.verse_id, ev.verse_id, 'free', 7209
  FROM _s223_g01_lookup sv, _s223_g01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=1 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='galatians' AND ev.chapter_number=1 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'galatians-1-another-gospel-and-the-agitators-flesh-credential-politics',
       E'Another gospel — the troublers and the old flesh-credential covenant-politics',
       E'Paul marvels that the gathered seed is *so soon removed* from grace, and pronounces a curse on the counterfeit. *I marvel that ye are so soon removed from him that called you into the grace of Messiah (Christ) unto another gospel: which is not another; but there be some that trouble you, and would pervert the gospel of Messiah (Christ)* (Galatians 1:6-7), *let him be accursed* (Galatians 1:8). The *some that trouble you* are not a new thing under the sun; the Hebrew library remembers the architecture. In the days of the maccabees *there went out of Yashar''el (Israel) wicked men, who persuaded many, saying, Let us go and make a covenant with the heathen that are round about us* (1 Maccabees 1:11); they *made themselves uncircumcised, and forsook the holy covenant, and joined themselves to the heathen* (1 Maccabees 1:15) — remaking the covenant on the terms of the nations, making the flesh the doorway. The Galatian agitators run the mirror image: pressing the covenant mark as a flesh-credential gospel of salvation. Both pervert the covenant by making the flesh the gate of standing. Set against both stands the true covenant zeal Mattathias charged his sons: *be you zealous for the law, and give your lives for the covenant of your fathers* (1 Maccabees 2:50) — faithfulness to Yahuah (LORD) and his instruction, the opposite of the counterfeit. The Galatians are *so soon removed* not from the Torah, but *from him that called* them — drawn away from grace into a flesh-performance gospel Paul will not stop short of cursing.',
       sv.verse_id, ev.verse_id, 'extras', 7212
  FROM _s223_g01_lookup sv, _s223_g01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=1 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='galatians' AND ev.chapter_number=1 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: galatians-1-the-father-who-raised-him-from-the-dead-christology
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Romans 6:4 — *Messiah (Christ) was raised up from the dead by the glory of the Father, even so we also should walk in newness of life* the Son has a Father, raised by his glory, issuing in a new walk (Galatians 1:1).'
  FROM cross_reference_threads t, cross_references x, _s223_g01_lookup sv, _s223_g01_lookup tv
 WHERE t.slug='galatians-1-the-father-who-raised-him-from-the-dead-christology'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=1 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=6 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 16:10 — *neither wilt thou suffer thine Holy One to see corruption* the Father''s ancient oath that he would raise his Holy One, kept in the resurrection (Galatians 1:1).'
  FROM cross_reference_threads t, cross_references x, _s223_g01_lookup sv, _s223_g01_lookup tv
 WHERE t.slug='galatians-1-the-father-who-raised-him-from-the-dead-christology'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=1 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=16 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 6:4 — *walk in newness of life* the Son gave himself *according to the will of... our Father* (Galatians 1:4); deliverance from this present evil world is the Father''s will, grace as the power to walk.'
  FROM cross_reference_threads t, cross_references x, _s223_g01_lookup sv, _s223_g01_lookup tv
 WHERE t.slug='galatians-1-the-father-who-raised-him-from-the-dead-christology'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=1 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=6 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: galatians-1-the-gospel-not-after-man-but-by-the-revelation-of-yahusha
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ephesians 3:3 — *by revelation he made known unto me the mystery* Paul says it twice: the gospel came by revelation, not a human chain (Galatians 1:12).'
  FROM cross_reference_threads t, cross_references x, _s223_g01_lookup sv, _s223_g01_lookup tv
 WHERE t.slug='galatians-1-the-gospel-not-after-man-but-by-the-revelation-of-yahusha'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=1 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=3 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Corinthians 15:3 — *which I also received... according to the scriptures* the gospel *not after man* is the gospel the prophets already wrote (Galatians 1:11).'
  FROM cross_reference_threads t, cross_references x, _s223_g01_lookup sv, _s223_g01_lookup tv
 WHERE t.slug='galatians-1-the-gospel-not-after-man-but-by-the-revelation-of-yahusha'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=1 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 26:16 — *I have appeared unto thee... to make thee a minister and a witness* the Damascus-road revelation Paul names, his commission straight from the risen Lord (Galatians 1:12).'
  FROM cross_reference_threads t, cross_references x, _s223_g01_lookup sv, _s223_g01_lookup tv
 WHERE t.slug='galatians-1-the-gospel-not-after-man-but-by-the-revelation-of-yahusha'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=1 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=26 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: galatians-1-the-jews-religion-and-the-traditions-of-my-fathers
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Mark 7:8 — *laying aside the commandment of Elohim (God), ye hold the tradition of men* the *traditions of my fathers* are the tradition of men, not the Torah (Galatians 1:14).'
  FROM cross_reference_threads t, cross_references x, _s223_g01_lookup sv, _s223_g01_lookup tv
 WHERE t.slug='galatians-1-the-jews-religion-and-the-traditions-of-my-fathers'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=1 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=7 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Mark 7:9 — *ye reject the commandment of Elohim (God), that ye may keep your own tradition* the tradition-system sets human rules over the commandment of Elohim (God) (Galatians 1:14).'
  FROM cross_reference_threads t, cross_references x, _s223_g01_lookup sv, _s223_g01_lookup tv
 WHERE t.slug='galatians-1-the-jews-religion-and-the-traditions-of-my-fathers'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=1 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 22:3 — *taught according to the perfect manner of the law of the fathers, and was zealous* Paul''s own account of the sect-formation that was *the Yahudim''s (Jews'') religion* (Galatians 1:13).'
  FROM cross_reference_threads t, cross_references x, _s223_g01_lookup sv, _s223_g01_lookup tv
 WHERE t.slug='galatians-1-the-jews-religion-and-the-traditions-of-my-fathers'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=1 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=22 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Acts 26:5 — *after the most straitest sect of our religion I lived a Pharisee* the *religion* is the sect-system, the straitest party, never the Torah (Galatians 1:13).'
  FROM cross_reference_threads t, cross_references x, _s223_g01_lookup sv, _s223_g01_lookup tv
 WHERE t.slug='galatians-1-the-jews-religion-and-the-traditions-of-my-fathers'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=1 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=26 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: galatians-1-separated-from-my-mothers-womb-the-prophetic-call-isaiah-49
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 49:1 — *Yahuah (LORD) hath called me from the womb; from the bowels of my mother hath he made mention of my name* the servant''s call Paul takes for his own (Galatians 1:15).'
  FROM cross_reference_threads t, cross_references x, _s223_g01_lookup sv, _s223_g01_lookup tv
 WHERE t.slug='galatians-1-separated-from-my-mothers-womb-the-prophetic-call-isaiah-49'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=1 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=49 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 49:5 — *formed me from the womb to be his servant, to bring Jacob again to him* the call from the womb is a call to regather the scattered house, *that I might preach him among the heathen* (Galatians 1:16).'
  FROM cross_reference_threads t, cross_references x, _s223_g01_lookup sv, _s223_g01_lookup tv
 WHERE t.slug='galatians-1-separated-from-my-mothers-womb-the-prophetic-call-isaiah-49'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=1 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=49 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 1:5 — *before thou camest forth out of the womb I sanctified thee, and I ordained thee a prophet unto the nations* the prophetic-call pattern: set apart before birth, sent unto the nations (Galatians 1:15).'
  FROM cross_reference_threads t, cross_references x, _s223_g01_lookup sv, _s223_g01_lookup tv
 WHERE t.slug='galatians-1-separated-from-my-mothers-womb-the-prophetic-call-isaiah-49'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=1 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=1 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Acts 9:15 — *to bear my name before the Gentiles, and kings, and the children of Yashar''el (Israel)* the preaching among the heathen carries the name to where the scattered children dwell (Galatians 1:16).'
  FROM cross_reference_threads t, cross_references x, _s223_g01_lookup sv, _s223_g01_lookup tv
 WHERE t.slug='galatians-1-separated-from-my-mothers-womb-the-prophetic-call-isaiah-49'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=1 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=9 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: galatians-1-another-gospel-and-the-agitators-flesh-credential-politics
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Maccabees 1:11 — *Let us go and make a covenant with the heathen that are round about us* the old architecture of the *some that trouble you*: remaking the covenant on the terms of the nations (Galatians 1:7).'
  FROM cross_reference_threads t, cross_references x, _s223_g01_lookup sv, _s223_g01_lookup tv
 WHERE t.slug='galatians-1-another-gospel-and-the-agitators-flesh-credential-politics'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=1 AND sv.verse_number=7
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=1 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Maccabees 1:15 — *made themselves uncircumcised, and forsook the holy covenant... joined themselves to the heathen* the flesh-as-doorway politics behind the *other gospel* (Galatians 1:8).'
  FROM cross_reference_threads t, cross_references x, _s223_g01_lookup sv, _s223_g01_lookup tv
 WHERE t.slug='galatians-1-another-gospel-and-the-agitators-flesh-credential-politics'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=1 AND sv.verse_number=8
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=1 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Maccabees 2:50 — *be you zealous for the law, and give your lives for the covenant of your fathers* the true covenant zeal set against the counterfeit; the Galatians are removed from him that called, not from the Torah (Galatians 1:6).'
  FROM cross_reference_threads t, cross_references x, _s223_g01_lookup sv, _s223_g01_lookup tv
 WHERE t.slug='galatians-1-another-gospel-and-the-agitators-flesh-credential-politics'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=1 AND sv.verse_number=6
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=2 AND tv.verse_number=50
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
