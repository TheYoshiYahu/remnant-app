-- =====================================================================
-- Session 223 — Galatians FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py data-schema/migrations/session223_galatians_cross_references.sql
-- =====================================================================

\echo 'session223 — Galatians cross-references starting...'
BEGIN;

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

-- ----- fragment: minion_galatians_02.sql (S223 Galatians 2) -----
-- =====================================================================
-- S223 minion — GALATIANS 2 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: GALATIANS 2 (21 verses).  Tag: g02 (temp view _s223_g02_lookup).
-- Sort band: floor 7225, step 3 (7225, 7228, 7231, 7234, 7237 used; ceiling < 7250).
-- Source is ALWAYS the canon Galatians verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (HIGHEST VOICE-RISK BOOK — "The Galatians Lie"; Red Lines #4/#5/#6/#7/#10):
-- Galatians 2 is the Jerusalem-meeting and Antioch chapter, and the inherited reading turns it
-- into the charter of a Torah-against-faith gospel. It is no such thing. The Galatians are the
-- scattered seed of Yashar'el (Israel) coming home, not pagans grafted in by confession. The fight
-- is over ONE lie — *Except ye be circumcised after the manner of Moses, ye cannot be saved*
-- (Acts 15:1): the Pharisee proselyte gospel that made a flesh-credential the DOORWAY to covenant
-- standing. That is what Paul refuses. Titus *was not compelled to be circumcised* (2:3) because
-- the flesh-rite was being demanded AS the entry-price, not because circumcision is abolished —
-- the same Paul circumcised Timothy (Acts 16:3). The *false brethren... brought in to spy out our
-- liberty... that they might bring us into bondage* (2:4) are the agitators, the heirs of the
-- apostates who *made themselves uncircumcised, and forsook the holy covenant* to please the
-- nations (1 Maccabees 1:15). Peter's withdrawal at Antioch (2:11-13) is a TABLE-FELLOWSHIP
-- HIERARCHY of the circumcision party — refusing to eat with the gathered-from-the-nations as
-- though they were second-class — NOT the dietary law; Peter himself had testified that Yah *put
-- no difference between us and them, purifying their hearts by faith* (Acts 15:9). And 2:16 —
-- *a man is not justified by the works of the law, but by the faith of Yahusha HaMashiach* — is
-- NOT faith-against-Torah. "Works of the law" (erga nomou) is the flesh-credential performance-
-- SYSTEM of the circumcision party for establishing covenant standing, NEVER a synonym for Torah-
-- keeping. Justification was always by faith/promise (Genesis 15:6, *he believed in Yahuah... and
-- he counted it to him for righteousness* — Genesis 15 before Genesis 17), and *in thy sight shall
-- no man living be justified* (Psalm 143:2) was true under the Torah itself; the same Paul who
-- writes 2:16 writes *Do we then make void the law through faith? God forbid: yea, we establish
-- the law* (Romans 3:31). *I through the law am dead to the law, that I might live unto Elohim
-- (God)* (2:19) — the Torah's own verdict drove him out of self-justification into the crucified-
-- and-risen life of Messiah; and *I do not frustrate the grace of Elohim (God)* (2:21), for grace
-- is the means of RETURN to him and his ways, never their cancellation. Christology: *the Son of
-- Elohim (God), who loved me, and gave himself for me* (2:20) — the Formed one who has a Father.
-- The default trained reading — grace-against-law, Torah-abolished, the-Gentiles-are-pagans — is
-- the antichrist reading this apparatus exists to dismantle and is held out at every line.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for each verse-block):
--   v.1-2   went up by revelation, communicated the gospel preached among the nations
--           Tanakh: none warranted  Extras: none warranted  NT: none warranted (Acts 15 carried at
--                   v.3-5; same Jerusalem meeting, same hand)
--   v.3-5   Titus not compelled to be circumcised; false brethren spying out the liberty; bondage
--           Tanakh: Genesis 17:10-11,13 (the covenant mark Yah himself gave — circumcision is not
--                   the enemy; the flesh-credential-as-doorway is)  Extras: 1 Maccabees 1:11-13,15
--                   (apostates who undid the mark to please the nations — the live circumcision
--                   politics)  NT: Acts 15:1 (the agitators' very words), Acts 16:3 (Paul
--                   circumcised Timothy — proof the rite is not abolished)
--   v.6-10  the pillars added nothing; right hands of fellowship; remember the poor
--           Tanakh: none warranted  Extras: none warranted  NT: none warranted (the Jerusalem
--                   accord is Acts 15, carried in prose)
--   v.11-14 Peter withdrew from the table at Antioch; the circumcision party's hierarchy
--           Tanakh: none warranted  Extras: none warranted  NT: Acts 15:9 (*put no difference...
--                   purifying their hearts by faith*), Acts 15:10 (the yoke our fathers could not
--                   bear) — Peter's own testimony against the hierarchy he then enacted
--   v.15-16 a man is not justified by the works of the law, but by the faith of Messiah (CONTESTED)
--           Tanakh: Genesis 15:6 (Abraham believed, counted for righteousness — before Genesis 17),
--                   Habakkuk 2:4 (the just shall live by his faith), Psalm 143:2 (in thy sight shall
--                   no man living be justified), Leviticus 18:5 (which if a man do, he shall live in
--                   them — the standing pair, not the enemy)  Extras: Sirach/Ecclesiasticus
--                   44:19-20 (Abraham kept the law... and was found faithful — faith IS
--                   faithfulness), 1 Maccabees 2:52 (found faithful... imputed to him for
--                   righteousness)  NT: Romans 3:20 (by the deeds of the law no flesh justified),
--                   Romans 3:28 (justified by faith without the deeds of the law), Romans 3:31 (we
--                   establish the law — the two-pass anchor)
--   v.17-18 if we seek to be justified by Messiah and are found sinners; if I build again
--           Tanakh: none warranted  Extras: none warranted  NT: none warranted (gathered into the
--                   2:16 thread; same argument)
--   v.19-20 I through the law am dead to the law, that I might live unto God; crucified with Messiah
--           Tanakh: Leviticus 18:5 (he shall live IN them — the Torah's life-aim, reached through
--                   death-and-life in Messiah)  Extras: none warranted  NT: Romans 7:4 (dead to the
--                   law by the body of Messiah, married to him that is raised), Romans 6:6 (our old
--                   man crucified with him)
--   v.21    I do not frustrate the grace of God; if righteousness come by the law, Messiah died
--           in vain
--           Tanakh: Genesis 15:6 (righteousness reckoned by faith/promise — carried at v.16)
--           Extras: none warranted  NT: Romans 4:4-5 (the reward of grace not reckoned of debt) —
--                   grace as the means of return, not the cancelling of his ways
--
-- THREADS (slug -> target libraries):
--   7225 galatians-2-titus-not-compelled-to-be-circumcised-the-flesh-credential-refused-genesis-17  (Tanakh + Extras + NT)
--   7228 galatians-2-i-withstood-peter-the-table-fellowship-hierarchy-at-antioch-acts-15            (NT)
--   7231 galatians-2-justified-by-the-faith-of-messiah-not-the-works-of-the-law                     (Tanakh + Extras + NT)
--   7234 galatians-2-i-through-the-law-am-dead-to-the-law-that-i-might-live-unto-god                 (Tanakh + NT)
--   7237 galatians-2-i-do-not-frustrate-the-grace-of-god-righteousness-not-by-the-law               (Tanakh + NT)
-- =====================================================================

CREATE TEMP VIEW _s223_g02_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: galatians-2-titus-not-compelled-to-be-circumcised-the-flesh-credential-refused-genesis-17
  ('canon', 'galatians', 2, 3, 'canon', 'genesis', 17, 10, 'free', E'*This is my covenant, which ye shall keep, between me and you and thy seed after thee; Every man child among you shall be circumcised.* (Genesis 17:10). *But neither Titus, who was with me, being a Greek, was compelled to be circumcised* (Galatians 2:3). The mark itself was given by Yahuah (LORD) and is no enemy — the same Paul would circumcise Timothy (Acts 16:3). What Paul refuses is the agitators'' demand of the flesh-rite *as the doorway* to covenant standing; that is the *compelled* he will not yield to, not the covenant Yah cut with Abraham.'),
  ('canon', 'galatians', 2, 3, 'canon', 'genesis', 17, 11, 'free', E'*And ye shall circumcise the flesh of your foreskin; and it shall be a token of the covenant betwixt me and you.* (Genesis 17:11). Circumcision is a *token of the covenant* — a sign, never the price of admission. So when Titus *was not compelled to be circumcised* (Galatians 2:3), the sign is not abolished; the lie that the sign earns the standing is what falls. The token points to the covenant; it does not purchase it.'),
  ('canon', 'galatians', 2, 4, 'canon', 'acts', 15, 1, 'free', E'*And certain men which came down from Judæa taught the brethren, and said, Except ye be circumcised after the manner of Moses, ye cannot be saved.* (Acts 15:1). Here are the *false brethren unawares brought in, who came in privily to spy out our liberty* (Galatians 2:4) in their own words: be-circumcised-or-you-cannot-be-saved, the flesh-credential made the doorway to salvation. That is the *bondage* Paul will not give place to — not the Torah, but the proselyte gospel that sells covenant standing through a rite.'),
  ('canon', 'galatians', 2, 3, 'canon', 'acts', 16, 3, 'free', E'*Him would Paul have to go forth with him; and took and circumcised him because of the Yahudim (Jews) which were in those quarters: for they knew all that his father was a Greek.* (Acts 16:3). The same hand that would not let Titus *be compelled to be circumcised* (Galatians 2:3) freely circumcised Timothy. The difference is everything: circumcision freely done is no sin, but circumcision *compelled as the doorway to salvation* is the lie. Paul opposes the credential-system, never the covenant mark itself.'),
  ('canon', 'galatians', 2, 4, 'apocrypha', '1-maccabees', 1, 11, 'extras', E'*In those days went there out of Yashar''el (Israel) wicked men, who persuaded many, saying, Let us go and make a covenant with the heathen that are round about us: for since we departed from them we have had much sorrow.* (1 Maccabees 1:11). The agitators who *came in privily to spy out our liberty... that they might bring us into bondage* (Galatians 2:4) stand in a long line. Here the apostate party sells the covenant to be at peace with the nations — the same flesh-politics of standing-by-conformity that Paul confronts, only run from the other direction.'),
  ('canon', 'galatians', 2, 4, 'apocrypha', '1-maccabees', 1, 15, 'extras', E'*And made themselves uncircumcised, and forsook the holy covenant, and joined themselves to the heathen, and were sold to do mischief.* (1 Maccabees 1:15). The covenant mark had become a counter in the politics of belonging — undone here to please the nations, demanded by the agitators there as the price of inclusion. Against both, Paul holds *the truth of the gospel* (Galatians 2:5): standing is by the promise, and the *liberty which we have in HaMashiach Yahusha (Christ Jesus)* (Galatians 2:4) is not for sale through the flesh.'),
  -- thread: galatians-2-i-withstood-peter-the-table-fellowship-hierarchy-at-antioch-acts-15
  ('canon', 'galatians', 2, 12, 'canon', 'acts', 15, 9, 'free', E'*And put no difference between us and them, purifying their hearts by faith.* (Acts 15:9). Peter himself had testified that Yahuah (LORD) *put no difference* between the Yahudim (Jews) and the gathered-from-the-nations — yet at Antioch *when they were come, he withdrew and separated himself, fearing them which were of the circumcision* (Galatians 2:12). The withdrawal from the common table re-erected the very hierarchy of access Peter had renounced; it is the circumcision party''s ranking, not the dietary law, that Paul withstands.'),
  ('canon', 'galatians', 2, 14, 'canon', 'acts', 15, 10, 'free', E'*Now therefore why tempt ye Elohim (God), to put a yoke upon the neck of the disciples, which neither our fathers nor we were able to bear?* (Acts 15:10). The *yoke* is the proselyte-conversion credential-system the agitators pressed, not the Torah their fathers walked in. So when Peter''s conduct *compellest thou the Gentiles to live as do the Yahudim (Jews)* (Galatians 2:14) — pressing the gathered toward the circumcision party''s standing-by-conversion — Paul confronts him *before them all,* the same lie Peter himself had named a yoke none could bear.'),
  -- thread: galatians-2-justified-by-the-faith-of-messiah-not-the-works-of-the-law
  ('canon', 'galatians', 2, 16, 'canon', 'genesis', 15, 6, 'free', E'*And he believed in Yahuah (LORD); and he counted it to him for righteousness.* (Genesis 15:6). Abraham was reckoned righteous by faith in Genesis 15 — before the covenant of circumcision in Genesis 17. So *a man is not justified by the works of the law, but by the faith of Yahusha HaMashiach (Jesus Christ)* (Galatians 2:16) says nothing new and nothing against Torah: justification was always by the promise believed, never by the flesh-credential performance-system. The father of the faithful proves it.'),
  ('canon', 'galatians', 2, 16, 'canon', 'habakkuk', 2, 4, 'free', E'*Behold, his soul which is lifted up is not upright in him: but the just shall live by his faith.* (Habakkuk 2:4). The prophet set the lifted-up soul against the just one who *live[s] by his faith* — faithfulness, not flesh-earning. *Even we have believed in Yahusha HaMashiach (Jesus Christ), that we might be justified by the faith of Messiah (Christ)* (Galatians 2:16). Paul is reading Habakkuk: the righteous have always lived by trusting faithfulness, never by the credential-system of the circumcision party.'),
  ('canon', 'galatians', 2, 16, 'canon', 'psalms', 143, 2, 'free', E'*And enter not into judgment with thy servant: for in thy sight shall no man living be justified.* (Psalm 143:2). Long before Galatians, under the Torah itself, the psalmist knew *no man living* could stand justified by his own performance in judgment. *For by the works of the law shall no flesh be justified* (Galatians 2:16) is the same confession — not a verdict against the Torah, but the Torah-keeper''s own knowledge that standing before Yahuah (LORD) rests on his mercy and the promise, not on flesh.'),
  ('canon', 'galatians', 2, 16, 'canon', 'leviticus', 18, 5, 'free', E'*Ye shall therefore keep my statutes, and my judgments: which if a man do, he shall live in them: I am Yahuah (LORD).* (Leviticus 18:5). The Torah''s own promise of life-in-the-doing and the promise believed by faith are not enemies but companions: one names the walk of the redeemed, the other the ground of their standing. *We... have believed in Yahusha HaMashiach (Jesus Christ), that we might be justified by the faith of Messiah* (Galatians 2:16) — justified by faith, then living in his statutes by the Spirit; the two questions never compete.'),
  ('canon', 'galatians', 2, 16, 'canon', 'romans', 3, 20, 'free', E'*Therefore by the deeds of the law there shall no flesh be justified in his sight: for by the law is the knowledge of sin.* (Romans 3:20). The same Paul says the same thing elsewhere: *the deeds of the law* cannot justify because the law''s office is to give *the knowledge of sin,* not to be the flesh-credential that purchases standing. *For by the works of the law shall no flesh be justified* (Galatians 2:16) — erga nomou, the performance-system, never the righteous instruction it cannot replace.'),
  ('canon', 'galatians', 2, 16, 'canon', 'romans', 3, 28, 'free', E'*Therefore we conclude that a man is justified by faith without the deeds of the law.* (Romans 3:28). Romans states the Galatians verse in other words — justified by faith, apart from the credential-deeds — and then guards it from the very misreading the inherited tradition forces: see the next breath. *Knowing that a man is not justified by the works of the law, but by the faith of Yahusha HaMashiach (Jesus Christ)* (Galatians 2:16). The justifying is by faith; the law is not thereby abolished.'),
  ('canon', 'galatians', 2, 16, 'canon', 'romans', 3, 31, 'free', E'*Do we then make void the law through faith? God forbid: yea, we establish the law.* (Romans 3:31). This is the seal on 2:16 against the lie. Having just said a man is justified by faith without the deeds of the law, Paul immediately forbids the conclusion that faith voids the Torah — *yea, we establish the law.* So *justified by the faith of Messiah (Christ), and not by the works of the law* (Galatians 2:16) cannot mean Torah-abolished; it means the flesh-credential system is undone and the law is established.'),
  ('canon', 'galatians', 2, 16, 'apocrypha', 'ecclesiasticus', 44, 19, 'extras', E'*Abraham was a great father of many people: in glory was there none like to him* (Ecclesiasticus 44:19). The Second-Temple memory of Abraham frames what *the faith of Yahusha HaMashiach (Jesus Christ)* (Galatians 2:16) means. The next lines tell how this father was reckoned: kept the law of the Most High and was found faithful when proved — faith and faithfulness as one cloth, the opposite of the agitators'' flesh-credential.'),
  ('canon', 'galatians', 2, 16, 'apocrypha', 'ecclesiasticus', 44, 20, 'extras', E'*Who kept the law of the Most High, and was in covenant with him: he established the covenant in his flesh; and when he was proved, he was found faithful.* (Ecclesiasticus 44:20). The Hebrew library reads Abraham''s righteousness as faithfulness: he *kept the law of the Most High* and *was found faithful.* This is exactly why *justified by the faith of Messiah* (Galatians 2:16) is no charter against Torah — the faith that justifies is the trusting faithfulness that walks in the covenant, never the flesh-performance-system the agitators sold.'),
  ('canon', 'galatians', 2, 16, 'apocrypha', '1-maccabees', 2, 52, 'extras', E'*Was not Abraham found faithful in temptation, and it was imputed to him for righteousness?* (1 Maccabees 2:52). The very phrase Genesis and Paul use — *imputed to him for righteousness* — is here joined to *found faithful in temptation.* The imputing of righteousness is bound to faithfulness under trial, not to a credential. So *that we might be justified by the faith of Messiah (Christ)* (Galatians 2:16) names the same reckoning Abraham received: faith proved faithful, counted righteous.'),
  -- thread: galatians-2-i-through-the-law-am-dead-to-the-law-that-i-might-live-unto-god
  ('canon', 'galatians', 2, 19, 'canon', 'leviticus', 18, 5, 'free', E'*Ye shall therefore keep my statutes, and my judgments: which if a man do, he shall live in them: I am Yahuah (LORD).* (Leviticus 18:5). The Torah held out *life in them* — and its very holiness exposed Paul''s death in self-justification, so that *I through the law am dead to the law, that I might live unto Elohim (God)* (Galatians 2:19). The law itself drove him through death to the life it always pointed toward; he does not die to righteousness but to the flesh that could never reach the life the statutes promised.'),
  ('canon', 'galatians', 2, 19, 'canon', 'romans', 7, 4, 'free', E'*Wherefore, my brethren, ye also are become dead to the law by the body of Messiah (Christ); that ye should be married to another, even to him who is raised from the dead, that we should bring forth fruit unto Elohim (God).* (Romans 7:4). Paul says it the same way elsewhere: dead to the law''s condemning claim *by the body of Messiah,* in order to *bring forth fruit unto Elohim (God).* So *I through the law am dead to the law, that I might live unto Elohim (God)* (Galatians 2:19) ends not in lawlessness but in fruit-bearing life unto Yahuah (LORD) — the death is to self-justification, the harvest is righteousness.'),
  ('canon', 'galatians', 2, 20, 'canon', 'romans', 6, 6, 'free', E'*Knowing this, that our old man is crucified with him, that the body of sin might be destroyed, that henceforth we should not serve sin.* (Romans 6:6). *I am crucified with Messiah (Christ): nevertheless I live; yet not I, but Messiah (Christ) liveth in me* (Galatians 2:20). The crucifixion with Messiah is the death of *the old man* so that sin is no longer served — the new life is *Messiah liveth in me,* the Son of Elohim (God) *who loved me, and gave himself for me,* the Formed one with a Father living his risen life in the believer.'),
  -- thread: galatians-2-i-do-not-frustrate-the-grace-of-god-righteousness-not-by-the-law
  ('canon', 'galatians', 2, 21, 'canon', 'genesis', 15, 6, 'free', E'*And he believed in Yahuah (LORD); and he counted it to him for righteousness.* (Genesis 15:6). Righteousness was reckoned to Abraham by faith in the promise — so if *righteousness come by the law, then Messiah (Christ) is dead in vain* (Galatians 2:21) only restates what Genesis already settled: the ground of righteousness was always the promise believed. To make the flesh-credential the ground is to *frustrate the grace of Elohim (God)* and empty the cross of its purpose.'),
  ('canon', 'galatians', 2, 21, 'canon', 'romans', 4, 4, 'free', E'*Now to him that worketh is the reward not reckoned of grace, but of debt.* (Romans 4:4). To make righteousness a wage owed for flesh-performance turns grace into debt — and so *frustrate[s] the grace of Elohim (God)* (Galatians 2:21). Grace is not the cancelling of his ways but the unearned means of return to them: reckoned, not owed. *If righteousness come by the law, then Messiah (Christ) is dead in vain* — the cross stands precisely because standing is by grace through faith, not by the credential.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s223_g02_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s223_g02_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'galatians-2-titus-not-compelled-to-be-circumcised-the-flesh-credential-refused-genesis-17',
       E'Titus not compelled to be circumcised — the flesh-credential refused, not the covenant',
       E'The inherited reading hears Galatians 2 say circumcision is abolished. It says no such thing. *But neither Titus, who was with me, being a Greek, was compelled to be circumcised* (Galatians 2:3) — and the load-bearing word is *compelled.* The covenant mark was given by Yahuah (LORD) himself: *This is my covenant, which ye shall keep... Every man child among you shall be circumcised* (Genesis 17:10), *and it shall be a token of the covenant betwixt me and you* (Genesis 17:11) — a sign, not a price of admission. The same Paul who would not let Titus be *compelled* freely circumcised Timothy a little later: *took and circumcised him because of the Yahudim (Jews)* (Acts 16:3). The difference is the whole gospel. What Paul refuses is the agitators'' demand in their own words — *Except ye be circumcised after the manner of Moses, ye cannot be saved* (Acts 15:1) — the flesh-credential made the DOORWAY to salvation. Those are the *false brethren unawares brought in, who came in privily to spy out our liberty which we have in HaMashiach Yahusha (Christ Jesus), that they might bring us into bondage* (Galatians 2:4). The covenant mark had long been a counter in the politics of belonging: apostate Yashar''el once *made themselves uncircumcised, and forsook the holy covenant, and joined themselves to the heathen* (1 Maccabees 1:15) to be at peace with the nations — *Let us go and make a covenant with the heathen that are round about us* (1 Maccabees 1:11). The agitators run the same flesh-politics from the other side, demanding the rite as the entry-price. Against both, Paul gives place *no, not for an hour; that the truth of the gospel might continue with you* (Galatians 2:5). Standing is by the promise; the *liberty... in HaMashiach Yahusha (Christ Jesus)* is not for sale through the flesh.',
       sv.verse_id, ev.verse_id, 'extras', 7225
  FROM _s223_g02_lookup sv, _s223_g02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=2 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='galatians' AND ev.chapter_number=2 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'galatians-2-i-withstood-peter-the-table-fellowship-hierarchy-at-antioch-acts-15',
       E'I withstood Peter to the face — the table-fellowship hierarchy at Antioch, not the dietary law',
       E'The Antioch confrontation is read as Paul abolishing the food laws. It is nothing of the kind. *But when Peter was come to Antioch, I withstood him to the face, because he was to be blamed. For before that certain came from James, he did eat with the Gentiles: but when they were come, he withdrew and separated himself, fearing them which were of the circumcision* (Galatians 2:11-12). The sin is not what was on the table but who was excluded from it — Peter pulled back from sharing the common meal with the gathered-from-the-nations, treating them as second-class until they took the circumcision party''s credential. And Peter of all men knew better: he had stood in Jerusalem and testified that Yahuah (LORD) *put no difference between us and them, purifying their hearts by faith* (Acts 15:9). His withdrawal re-erected the very hierarchy of access he had renounced — so *the other Yahudim (Jews) dissembled likewise with him; insomuch that Barnabas also was carried away with their dissimulation* (Galatians 2:13). Paul saw *that they walked not uprightly according to the truth of the gospel* and said to Peter *before them all, If thou, being a Yahudi (Jew), livest after the manner of Gentiles, and not as do the Yahudim (Jews), why compellest thou the Gentiles to live as do the Yahudim (Jews)?* (Galatians 2:14) — that is, why press them toward standing-by-conversion, the proselyte credential? It is the same *yoke* Peter himself had named in Jerusalem: *why tempt ye Elohim (God), to put a yoke upon the neck of the disciples, which neither our fathers nor we were able to bear?* (Acts 15:10) — the conversion-credential-system, never the Torah their fathers walked in. The gospel''s truth is that the gathered seed sit at one table, no rank of flesh between them.',
       sv.verse_id, ev.verse_id, 'free', 7228
  FROM _s223_g02_lookup sv, _s223_g02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=2 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='galatians' AND ev.chapter_number=2 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'galatians-2-justified-by-the-faith-of-messiah-not-the-works-of-the-law',
       E'Justified by the faith of Messiah, not by the works of the law — the credential undone, the law established',
       E'This is the verse the inherited reading turns into the charter of faith-against-Torah, and the turning is the lie this whole apparatus exists to dismantle. *Knowing that a man is not justified by the works of the law, but by the faith of Yahusha HaMashiach (Jesus Christ)... that we might be justified by the faith of Messiah (Christ), and not by the works of the law: for by the works of the law shall no flesh be justified* (Galatians 2:16). "Works of the law" — erga nomou — is the circumcision party''s flesh-credential PERFORMANCE-SYSTEM for establishing covenant standing, never a synonym for Torah-keeping. Read it first against Galatians'' own roots in the Tanakh. Justification was always by the promise believed: *and he believed in Yahuah (LORD); and he counted it to him for righteousness* (Genesis 15:6) — reckoned in Genesis 15, before the covenant of circumcision in Genesis 17. The prophet said the same: *the just shall live by his faith* (Habakkuk 2:4). And the impossibility of self-justification was known under the Torah itself: *enter not into judgment with thy servant: for in thy sight shall no man living be justified* (Psalm 143:2). The Torah''s promise of *life in them* — *which if a man do, he shall live in them: I am Yahuah (LORD)* (Leviticus 18:5) — is no enemy of faith but its companion: faith is the ground of standing, the statutes the walk of the redeemed; the two questions never compete. Then follow Paul where he says it again and guards it from the misreading: *by the deeds of the law there shall no flesh be justified in his sight: for by the law is the knowledge of sin* (Romans 3:20); *a man is justified by faith without the deeds of the law* (Romans 3:28); and immediately, lest anyone hear Torah-abolished — *Do we then make void the law through faith? God forbid: yea, we establish the law* (Romans 3:31). The Hebrew library reads Abraham''s righteousness as faithfulness itself: he *kept the law of the Most High, and was in covenant with him... and when he was proved, he was found faithful* (Ecclesiasticus 44:20), *Abraham was a great father of many people: in glory was there none like to him* (Ecclesiasticus 44:19); and the very phrase Genesis uses is sounded again — *Was not Abraham found faithful in temptation, and it was imputed to him for righteousness?* (1 Maccabees 2:52). Faith and faithfulness are one cloth. So *justified by the faith of Messiah, and not by the works of the law* means the flesh-credential is undone and the law is established — grace the unearned means of return to him and his ways, never their cancellation.',
       sv.verse_id, ev.verse_id, 'extras', 7231
  FROM _s223_g02_lookup sv, _s223_g02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=2 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='galatians' AND ev.chapter_number=2 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'galatians-2-i-through-the-law-am-dead-to-the-law-that-i-might-live-unto-god',
       E'I through the law am dead to the law, that I might live unto God — crucified with Messiah',
       E'*For I through the law am dead to the law, that I might live unto Elohim (God)* (Galatians 2:19). The inherited reading hears a man walking away from Torah; the verse says the opposite of lawlessness. It was *through the law* — by its holy verdict exposing his death in self-justification — that Paul died *to the law* as a system of flesh-earning, in order to *live unto Elohim (God).* The Torah itself held out *life in them* — *which if a man do, he shall live in them: I am Yahuah (LORD)* (Leviticus 18:5) — and drove him through death to the very life it pointed toward. Paul says it the same way elsewhere: *ye also are become dead to the law by the body of Messiah (Christ); that ye should be married to another, even to him who is raised from the dead, that we should bring forth fruit unto Elohim (God)* (Romans 7:4) — dead to the condemning claim, alive to bear fruit. The death is real and total: *I am crucified with Messiah (Christ): nevertheless I live; yet not I, but Messiah (Christ) liveth in me: and the life which I now live in the flesh I live by the faith of the Son of Elohim (God), who loved me, and gave himself for me* (Galatians 2:20). This is *our old man... crucified with him, that the body of sin might be destroyed, that henceforth we should not serve sin* (Romans 6:6). The end is not freedom from righteousness but *Messiah liveth in me* — the Son of Elohim (God), the Formed one who has a Father, living his risen life in the believer, who now walks unto Yahuah (LORD).',
       sv.verse_id, ev.verse_id, 'free', 7234
  FROM _s223_g02_lookup sv, _s223_g02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=2 AND sv.verse_number=19
   AND ev.edition_slug='canon' AND ev.book_slug='galatians' AND ev.chapter_number=2 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'galatians-2-i-do-not-frustrate-the-grace-of-god-righteousness-not-by-the-law',
       E'I do not frustrate the grace of God — righteousness by the promise, not the credential',
       E'*I do not frustrate the grace of Elohim (God): for if righteousness come by the law, then Messiah (Christ) is dead in vain* (Galatians 2:21). To make the flesh-credential the ground of righteousness is to empty the cross and *frustrate the grace of Elohim (God)* — and to deny what the Tanakh already settled. Righteousness was reckoned to Abraham by faith in the promise: *and he believed in Yahuah (LORD); and he counted it to him for righteousness* (Genesis 15:6). So *if righteousness come by the law* — by the credential-system, as the agitators preach — *then Messiah (Christ) is dead in vain,* for the ground of standing was always the promise believed. Paul guards the same truth elsewhere: *now to him that worketh is the reward not reckoned of grace, but of debt* (Romans 4:4) — to make righteousness a wage owed for flesh-performance turns grace into debt and frustrates it. Grace is not the cancelling of his ways; it is the unearned means of RETURN to them — reckoned, not owed, the very thing that makes the cross stand rather than be *dead in vain.*',
       sv.verse_id, ev.verse_id, 'free', 7237
  FROM _s223_g02_lookup sv, _s223_g02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=2 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='galatians' AND ev.chapter_number=2 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: galatians-2-titus-not-compelled-to-be-circumcised-the-flesh-credential-refused-genesis-17
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 17:10 — *Every man child among you shall be circumcised* the covenant mark Yahuah (LORD) himself gave; *neither Titus... was compelled to be circumcised* refuses the doorway-demand, not the covenant (Galatians 2:3).'
  FROM cross_reference_threads t, cross_references x, _s223_g02_lookup sv, _s223_g02_lookup tv
 WHERE t.slug='galatians-2-titus-not-compelled-to-be-circumcised-the-flesh-credential-refused-genesis-17'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=2 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 17:11 — *it shall be a token of the covenant betwixt me and you* a sign, never the price of admission; the sign is not abolished when Titus is not *compelled* (Galatians 2:3).'
  FROM cross_reference_threads t, cross_references x, _s223_g02_lookup sv, _s223_g02_lookup tv
 WHERE t.slug='galatians-2-titus-not-compelled-to-be-circumcised-the-flesh-credential-refused-genesis-17'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=2 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 15:1 — *Except ye be circumcised after the manner of Moses, ye cannot be saved* the agitators'' lie in their own words, the *bondage* Paul refuses (Galatians 2:4).'
  FROM cross_reference_threads t, cross_references x, _s223_g02_lookup sv, _s223_g02_lookup tv
 WHERE t.slug='galatians-2-titus-not-compelled-to-be-circumcised-the-flesh-credential-refused-genesis-17'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=2 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=15 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Acts 16:3 — *took and circumcised him because of the Yahudim (Jews)* the same Paul circumcised Timothy freely; the issue is the credential-as-doorway, not the mark (Galatians 2:3).'
  FROM cross_reference_threads t, cross_references x, _s223_g02_lookup sv, _s223_g02_lookup tv
 WHERE t.slug='galatians-2-titus-not-compelled-to-be-circumcised-the-flesh-credential-refused-genesis-17'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=2 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=16 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Maccabees 1:11 — *Let us go and make a covenant with the heathen that are round about us* the flesh-politics of belonging, the line the agitators stand in (Galatians 2:4).'
  FROM cross_reference_threads t, cross_references x, _s223_g02_lookup sv, _s223_g02_lookup tv
 WHERE t.slug='galatians-2-titus-not-compelled-to-be-circumcised-the-flesh-credential-refused-genesis-17'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=2 AND sv.verse_number=4
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=1 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'1 Maccabees 1:15 — *made themselves uncircumcised, and forsook the holy covenant* the mark as a counter in the politics of belonging, undone there, demanded here; both refused (Galatians 2:4).'
  FROM cross_reference_threads t, cross_references x, _s223_g02_lookup sv, _s223_g02_lookup tv
 WHERE t.slug='galatians-2-titus-not-compelled-to-be-circumcised-the-flesh-credential-refused-genesis-17'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=2 AND sv.verse_number=4
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=1 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: galatians-2-i-withstood-peter-the-table-fellowship-hierarchy-at-antioch-acts-15
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Acts 15:9 — *put no difference between us and them, purifying their hearts by faith* Peter''s own testimony against the hierarchy he then re-erected by withdrawing from the table (Galatians 2:12).'
  FROM cross_reference_threads t, cross_references x, _s223_g02_lookup sv, _s223_g02_lookup tv
 WHERE t.slug='galatians-2-i-withstood-peter-the-table-fellowship-hierarchy-at-antioch-acts-15'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=2 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=15 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Acts 15:10 — *a yoke upon the neck of the disciples, which neither our fathers nor we were able to bear* the conversion-credential, not the Torah; the lie Peter''s conduct *compellest* on the Gentiles (Galatians 2:14).'
  FROM cross_reference_threads t, cross_references x, _s223_g02_lookup sv, _s223_g02_lookup tv
 WHERE t.slug='galatians-2-i-withstood-peter-the-table-fellowship-hierarchy-at-antioch-acts-15'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=2 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=15 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: galatians-2-justified-by-the-faith-of-messiah-not-the-works-of-the-law
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 15:6 — *he believed in Yahuah (LORD); and he counted it to him for righteousness* reckoned by faith in Genesis 15, before the circumcision of Genesis 17; justification was never by the credential (Galatians 2:16).'
  FROM cross_reference_threads t, cross_references x, _s223_g02_lookup sv, _s223_g02_lookup tv
 WHERE t.slug='galatians-2-justified-by-the-faith-of-messiah-not-the-works-of-the-law'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=2 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Habakkuk 2:4 — *the just shall live by his faith* the righteous have always lived by trusting faithfulness, never by flesh-earning (Galatians 2:16).'
  FROM cross_reference_threads t, cross_references x, _s223_g02_lookup sv, _s223_g02_lookup tv
 WHERE t.slug='galatians-2-justified-by-the-faith-of-messiah-not-the-works-of-the-law'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=2 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='habakkuk' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 143:2 — *in thy sight shall no man living be justified* the Torah-keeper''s own confession that standing rests on mercy and promise, not flesh (Galatians 2:16).'
  FROM cross_reference_threads t, cross_references x, _s223_g02_lookup sv, _s223_g02_lookup tv
 WHERE t.slug='galatians-2-justified-by-the-faith-of-messiah-not-the-works-of-the-law'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=2 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=143 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Leviticus 18:5 — *which if a man do, he shall live in them: I am Yahuah (LORD)* the Torah''s life-in-the-doing is faith''s companion, not its enemy; standing by faith, walk in the statutes (Galatians 2:16).'
  FROM cross_reference_threads t, cross_references x, _s223_g02_lookup sv, _s223_g02_lookup tv
 WHERE t.slug='galatians-2-justified-by-the-faith-of-messiah-not-the-works-of-the-law'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=2 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=18 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Romans 3:20 — *by the deeds of the law there shall no flesh be justified... for by the law is the knowledge of sin* the same Paul: the law''s office is to expose sin, not to be the credential that purchases standing (Galatians 2:16).'
  FROM cross_reference_threads t, cross_references x, _s223_g02_lookup sv, _s223_g02_lookup tv
 WHERE t.slug='galatians-2-justified-by-the-faith-of-messiah-not-the-works-of-the-law'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=2 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=3 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Romans 3:28 — *a man is justified by faith without the deeds of the law* the Galatians verse restated; justified by faith, the law not thereby abolished (Galatians 2:16).'
  FROM cross_reference_threads t, cross_references x, _s223_g02_lookup sv, _s223_g02_lookup tv
 WHERE t.slug='galatians-2-justified-by-the-faith-of-messiah-not-the-works-of-the-law'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=2 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=3 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Romans 3:31 — *Do we then make void the law through faith? God forbid: yea, we establish the law* the seal on 2:16 against the lie; faith does not void the Torah, it establishes it (Galatians 2:16).'
  FROM cross_reference_threads t, cross_references x, _s223_g02_lookup sv, _s223_g02_lookup tv
 WHERE t.slug='galatians-2-justified-by-the-faith-of-messiah-not-the-works-of-the-law'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=2 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=3 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 8, E'Ecclesiasticus 44:19 — *Abraham was a great father of many people: in glory was there none like to him* the Second-Temple memory framing the faith that justifies (Galatians 2:16).'
  FROM cross_reference_threads t, cross_references x, _s223_g02_lookup sv, _s223_g02_lookup tv
 WHERE t.slug='galatians-2-justified-by-the-faith-of-messiah-not-the-works-of-the-law'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=2 AND sv.verse_number=16
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=44 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 9, E'Ecclesiasticus 44:20 — *Who kept the law of the Most High... and when he was proved, he was found faithful* faith and faithfulness one cloth; why *justified by the faith of Messiah* is no charter against Torah (Galatians 2:16).'
  FROM cross_reference_threads t, cross_references x, _s223_g02_lookup sv, _s223_g02_lookup tv
 WHERE t.slug='galatians-2-justified-by-the-faith-of-messiah-not-the-works-of-the-law'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=2 AND sv.verse_number=16
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=44 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 10, E'1 Maccabees 2:52 — *Was not Abraham found faithful in temptation, and it was imputed to him for righteousness?* the imputing bound to faithfulness under trial, the reckoning Abraham received (Galatians 2:16).'
  FROM cross_reference_threads t, cross_references x, _s223_g02_lookup sv, _s223_g02_lookup tv
 WHERE t.slug='galatians-2-justified-by-the-faith-of-messiah-not-the-works-of-the-law'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=2 AND sv.verse_number=16
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=2 AND tv.verse_number=52
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: galatians-2-i-through-the-law-am-dead-to-the-law-that-i-might-live-unto-god
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 18:5 — *which if a man do, he shall live in them: I am Yahuah (LORD)* the Torah''s life-aim, reached through death-and-life in Messiah; *dead to the law, that I might live unto Elohim (God)* (Galatians 2:19).'
  FROM cross_reference_threads t, cross_references x, _s223_g02_lookup sv, _s223_g02_lookup tv
 WHERE t.slug='galatians-2-i-through-the-law-am-dead-to-the-law-that-i-might-live-unto-god'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=2 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=18 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 7:4 — *become dead to the law by the body of Messiah (Christ)... that we should bring forth fruit unto Elohim (God)* dead to the condemning claim, alive to bear fruit, not lawless (Galatians 2:19).'
  FROM cross_reference_threads t, cross_references x, _s223_g02_lookup sv, _s223_g02_lookup tv
 WHERE t.slug='galatians-2-i-through-the-law-am-dead-to-the-law-that-i-might-live-unto-god'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=2 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=7 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 6:6 — *our old man is crucified with him, that the body of sin might be destroyed* the death of the old man, that we *should not serve sin*; *I am crucified with Messiah* (Galatians 2:20).'
  FROM cross_reference_threads t, cross_references x, _s223_g02_lookup sv, _s223_g02_lookup tv
 WHERE t.slug='galatians-2-i-through-the-law-am-dead-to-the-law-that-i-might-live-unto-god'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=2 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=6 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: galatians-2-i-do-not-frustrate-the-grace-of-god-righteousness-not-by-the-law
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 15:6 — *he believed in Yahuah (LORD); and he counted it to him for righteousness* righteousness by the promise believed; *if righteousness come by the law, then Messiah is dead in vain* (Galatians 2:21).'
  FROM cross_reference_threads t, cross_references x, _s223_g02_lookup sv, _s223_g02_lookup tv
 WHERE t.slug='galatians-2-i-do-not-frustrate-the-grace-of-god-righteousness-not-by-the-law'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=2 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 4:4 — *to him that worketh is the reward not reckoned of grace, but of debt* to make righteousness a wage owed for flesh turns grace into debt and frustrates it (Galatians 2:21).'
  FROM cross_reference_threads t, cross_references x, _s223_g02_lookup sv, _s223_g02_lookup tv
 WHERE t.slug='galatians-2-i-do-not-frustrate-the-grace-of-god-righteousness-not-by-the-law'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=2 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_galatians_03.sql (S223 Galatians 3) -----
-- =====================================================================
-- S223 minion — GALATIANS 3 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: GALATIANS 3 (29 verses) — THE LOAD-BEARING CONTESTED CHAPTER of the whole book.
-- Tag: g03 (temp view _s223_g03_lookup).
-- Sort band: floor 7250, step 3 (7250, 7253, 7256, 7259, 7262, 7265, 7268 used; under 7275).
-- Source is ALWAYS the canon Galatians verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (HIGHEST VOICE-RISK CHAPTER IN THE HIGHEST VOICE-RISK BOOK — "The Galatians Lie"
-- terrain; Red Lines #4/#5/#6/#7/#10 all live):
-- The Galatians are the SCATTERED LOST SHEEP of Yashar'el (Israel) — covenant seed living among the
-- nations, memory dimmed by exile — whom Paul is bringing HOME, NOT pagans who never had Torah. The
-- agitators preached the Pharisee proselyte gospel (*Except ye be circumcised after the manner of
-- Moses, ye cannot be saved*, Acts 15:1): become-a-Jew-through-flesh-ritual-and-be-saved. "Works of
-- the law" (erga nomou) = that flesh-credential covenant-standing system, NEVER Torah-keeping. The
-- whole chapter answers THAT lie. Justification is by faith/promise (Genesis 15:6 before Genesis 17);
-- covenant LIFE is Spirit-empowered Torah (Ezekiel 36:27). Two questions; they never compete. The
-- key re-readings applied verse by verse:
--   * 3:6 *Abraham believed Elohim, and it was accounted to him for righteousness* — the faith that
--     WAS faithfulness (emunah): Sirach 44:20 (Abraham *kept the law of the Most High... was found
--     faithful*), 1 Maccabees 2:52 (*found faithful in temptation, and it was imputed to him for
--     righteousness*). Faith and faithfulness are one act.
--   * 3:10-13 the CURSE = the Deuteronomy 27-28 EXILE judgment for covenant-BREAKING, NEVER the
--     Torah itself (Red Line #4). 3:13 *redeemed us from the curse of the law, being made a curse
--     for us* (Deuteronomy 21:23, *cursed... that hangeth on a tree*) = Messiah redeemed the
--     scattered sheep from the curse of EXILE and opened the door home THROUGH it; he did not
--     abolish the covenant they were exiled for breaking.
--   * 3:11 *the just shall live by faith* (Habakkuk 2:4) and 3:12 *the man that doeth them shall
--     live in them* (Leviticus 18:5) STAND TOGETHER — faith is never pitted against Torah (RL #5).
--   * 3:16 the seed = Messiah (Genesis 22:18); 3:17 the law 430 years after does NOT disannul the
--     promise = HIDDEN TORAH-AFFIRMING (law and promise are not enemies).
--   * 3:19-21 *Is the law then against the promises of Elohim? Elohim forbid* = HIDDEN
--     TORAH-AFFIRMING — featured.
--   * 3:24-25 the schoolmaster/paidagogos = household guardian-escort *to bring us unto Messiah*;
--     exiting it = entering FULL SONSHIP, NOT graduating out of Torah — the inheritance INCLUDES it.
--   * 3:28 *neither Yahudi nor Greek* = removes the circumcision party's HIERARCHY OF ACCESS; does
--     NOT erase tribal identity or the seed-distinction (RL #7). 3:29 *Abraham's seed, and heirs
--     according to the promise*.
-- Christology: Yahusha is the Formed drawn from the Formless, who has a Father — preserved as the
-- pull gives. The inherited grace-against-law / Torah-abolished reading is the antichrist reading
-- this apparatus exists to dismantle; it surfaces nowhere.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-5   Spirit by the hearing of faith, not the works of the law
--           Tanakh: none warranted (the argument turns to Abraham at v.6; root carried there)
--           Extras: none warranted   NT: none warranted (carried into the Abraham thread)
--   v.6-9   Abraham believed Elohim, counted for righteousness; the nations blessed in him
--           Tanakh: Genesis 15:6 (believed, counted for righteousness), Genesis 12:3 (in thee shall
--                   all families be blessed), Genesis 18:18 (all nations blessed in him)
--           Extras: Sirach 44:20 (kept the law, found faithful), 44:21 (the oath to bless the
--                   nations in his seed), 1 Maccabees 2:52 (found faithful, imputed for righteousness)
--           NT: Romans 4:3 (Abraham believed Elohim, counted for righteousness — the two-pass echo)
--   v.10-14 the curse of the law = the EXILE judgment; redeemed by being made a curse on the tree
--           Tanakh: Deuteronomy 27:26 (cursed that confirmeth not the words of this law to do them),
--                   Deuteronomy 28:15 (the curses of covenant-breaking), Deuteronomy 28:64 (scattered
--                   among all people), Deuteronomy 21:23 (he that is hanged is accursed of Elohim)
--           Extras: 1 Maccabees 2:21 (forbid that we should forsake the law — the covenant the curse
--                   guards)   NT: none added (the blessing of Abraham to the Gentiles carried at v.8)
--   v.11-12 the just shall live by faith / the doer shall live in them — standing together
--           Tanakh: Habakkuk 2:4 (the just shall live by his faith), Leviticus 18:5 (which if a man
--                   do, he shall live in them)
--           Extras: none warranted   NT: Romans 10:5 (Moses: the man which doeth those things shall
--                   live by them — Paul citing Leviticus 18:5 himself, not against it)
--   v.15-18 to Abraham and his seed the promises; the seed which is Messiah; the law disannuls nothing
--           Tanakh: Genesis 22:18 (in thy seed shall all the nations be blessed), Genesis 13:15 /
--                   17:8 carried via 22:18; Genesis 12:7 (unto thy seed will I give this land)
--           Extras: none warranted   NT: none warranted
--   v.19-21 is the law against the promises? Elohim forbid — HIDDEN TORAH-AFFIRMING
--           Tanakh: none warranted (the affirmation is internal to Galatians; weave the two-pass)
--           Extras: none warranted   NT: Romans 3:31 (do we make void the law? we establish the law)
--   v.22-26 the law our guardian to bring us unto Messiah; full sonship by faith
--           Tanakh: none warranted   Extras: none warranted
--           NT: Romans 10:4 (Messiah the goal of the law for righteousness — the escort delivers us
--               to him, the telos, not away from the covenant)
--   v.27-29 neither Yahudi nor Greek, all one; Abraham's seed, heirs according to the promise
--           Tanakh: Genesis 17:7 (the everlasting covenant to the seed) carried in prose
--           Extras: none warranted   NT: Romans 10:12 (no difference between the Yahudi and the
--                   Greek, the same Yahuah rich unto all), 1 Corinthians 7:19 (circumcision is
--                   nothing... but the keeping of the commandments of Elohim)
--
-- THREADS (slug -> target libraries):
--   7250 galatians-3-abraham-believed-god-counted-for-righteousness-the-faith-that-was-faithfulness-genesis-15  (Tanakh + Extras + NT)
--   7253 galatians-3-christ-redeemed-us-from-the-curse-of-exile-deuteronomy-21-and-27                            (Tanakh + Extras)
--   7256 galatians-3-the-just-shall-live-by-faith-and-the-doer-shall-live-habakkuk-2-leviticus-18                (Tanakh + NT)
--   7259 galatians-3-to-thy-seed-which-is-christ-the-promise-confirmed-genesis-22                                (Tanakh)
--   7262 galatians-3-is-the-law-against-the-promises-of-god-god-forbid                                           (NT)
--   7265 galatians-3-the-law-our-guardian-to-bring-us-unto-christ-and-full-sonship                               (NT)
--   7268 galatians-3-neither-jew-nor-greek-all-one-abrahams-seed-heirs-of-the-promise                            (Tanakh + NT)
-- =====================================================================

CREATE TEMP VIEW _s223_g03_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: galatians-3-abraham-believed-god-counted-for-righteousness-the-faith-that-was-faithfulness-genesis-15
  ('canon', 'galatians', 3, 6, 'canon', 'genesis', 15, 6, 'free', E'*And he believed in Yahuah (LORD); and he counted it to him for righteousness.* (Genesis 15:6). This is the verse Paul reaches back to: *Even as Abraham believed Elohim (God), and it was accounted to him for righteousness* (Galatians 3:6). And mark where it stands — Genesis 15, before the circumcision of Genesis 17. Abraham was reckoned righteous as he trusted the promise, before ever the covenant sign was given in his flesh; so the scattered seed are brought home by the same trust, not by the agitators'' flesh-credential. The promise comes first; the walk follows.'),
  ('canon', 'galatians', 3, 7, 'apocrypha', 'ecclesiasticus', 44, 20, 'extras', E'*Who kept the law of the Most High, and was in covenant with him: he established the covenant in his flesh; and when he was proved, he was found faithful.* (Sirach 44:20). The Hebrew library remembers the same Abraham Paul names — and it tells what his believing looked like: *he was found faithful.* *Know ye therefore that they which are of faith, the same are the children of Abraham* (Galatians 3:7). The faith reckoned to him was no bare assent; it was the trust that kept covenant when proved — emunah, faith that is faithfulness. The children of Abraham are those who trust as he trusted and walk as he walked.'),
  ('canon', 'galatians', 3, 6, 'apocrypha', '1-maccabees', 2, 52, 'extras', E'*Was not Abraham found faithful in temptation, and it was imputed to him for righteousness?* (1 Maccabees 2:52). The second-temple house read Genesis 15:6 exactly as Paul does — and named the binding of Isaac, the testing, as the proving of that faith. *Even as Abraham believed Elohim (God), and it was accounted to him for righteousness* (Galatians 3:6). To *believe* and to be *found faithful in temptation* are one act, not two: the faith imputed to him for righteousness was the faithfulness that held when he was tried. Paul stands inside this tradition, not against it.'),
  ('canon', 'galatians', 3, 8, 'canon', 'genesis', 12, 3, 'free', E'*And I will bless them that bless thee, and curse him that curseth thee: and in thee shall all families of the earth be blessed.* (Genesis 12:3). This is the *scripture, foreseeing that Elohim (God) would justify the heathen through faith,* that *preached before the gospel unto Abraham, saying, In thee shall all nations be blessed* (Galatians 3:8). The gospel was no afterthought; it was spoken to Abraham at the first call. The nations gathered home were promised in the same breath that promised him a great name — the scattered families of the earth blessed in the father of the faithful.'),
  ('canon', 'galatians', 3, 8, 'canon', 'genesis', 18, 18, 'free', E'*Seeing that Abraham shall surely become a great and mighty nation, and all the nations of the earth shall be blessed in him?* (Genesis 18:18). Yahuah (LORD) repeats the promise as he goes down toward Sodom: *all the nations of the earth shall be blessed in him.* *In thee shall all nations be blessed* (Galatians 3:8). The blessing on the nations is the settled word of Yahuah (LORD), spoken and spoken again to Abraham — and it is *through faith* that it comes to pass, *that the blessing of Abraham might come on the Gentiles* (Galatians 3:14).'),
  ('canon', 'galatians', 3, 9, 'canon', 'genesis', 15, 6, 'free', E'*And he believed in Yahuah (LORD); and he counted it to him for righteousness.* (Genesis 15:6). *So then they which be of faith are blessed with faithful Abraham* (Galatians 3:9). Paul calls him *faithful Abraham* — the very thing Genesis records and the Hebrew library underscores. To be *blessed with faithful Abraham* is to be counted among those who trust as he trusted; the blessing rests on the seed who share his faithfulness, the scattered children coming home along the road he walked.'),
  ('canon', 'galatians', 3, 6, 'canon', 'romans', 4, 3, 'free', E'*For what saith the scripture? Abraham believed Elohim (God), and it was counted unto him for righteousness.* (Romans 4:3). Paul cites the same Genesis verse in Romans to make the same point: *Even as Abraham believed Elohim (God), and it was accounted to him for righteousness* (Galatians 3:6). And in Romans he is careful that this never voids the Torah — *Do we then make void the law through faith? Elohim (God) forbid: yea, we establish the law* (Romans 3:31). The faith counted to Abraham and the upholding of the law are one teaching in Paul''s hand, not two.'),
  -- thread: galatians-3-christ-redeemed-us-from-the-curse-of-exile-deuteronomy-21-and-27
  ('canon', 'galatians', 3, 10, 'canon', 'deuteronomy', 27, 26, 'free', E'*Cursed be he that confirmeth not all the words of this law to do them. And all the people shall say, Amen.* (Deuteronomy 27:26). This is the very curse Paul quotes: *Cursed is every one that continueth not in all things which are written in the book of the law to do them* (Galatians 3:10). The curse is the sanction the covenant itself pronounced upon covenant-BREAKING — not a verdict against the Torah, but the Torah''s own word against forsaking it. They who sought standing by the flesh-credential system stood instead under this sentence, the exile-judgment for breaking the covenant they had agreed to keep, every man answering *Amen.*'),
  ('canon', 'galatians', 3, 10, 'canon', 'deuteronomy', 28, 15, 'free', E'*But it shall come to pass, if thou wilt not hearken unto the voice of Yahuah Elohayka (the LORD thy God), to observe to do all his commandments and his statutes which I command thee this day; that all these curses shall come upon thee, and overtake thee* (Deuteronomy 28:15). The curse Paul names is the whole catalogue of covenant-sanctions Moses set out — *as many as are of the works of the law are under the curse* (Galatians 3:10). The curse falls on the breaking, not the keeping; it is the consequence-system that pursued the people who would not hearken, the very judgment that scattered the seed among the nations.'),
  ('canon', 'galatians', 3, 13, 'canon', 'deuteronomy', 28, 64, 'free', E'*And Yahuah (LORD) shall scatter thee among all people, from the one end of the earth even unto the other; and there thou shalt serve other gods, which neither thou nor thy fathers have known, even wood and stone.* (Deuteronomy 28:64). This is the curse in its sharpest form — the EXILE, the scattering of the seed among the nations. *Messiah (Christ) hath redeemed us from the curse of the law, being made a curse for us* (Galatians 3:13). The Galatians are those scattered ones; the curse they are redeemed from is this exile-judgment, and Messiah opened the door home through it — not by cancelling the covenant they were scattered for breaking, but by bearing its sentence himself.'),
  ('canon', 'galatians', 3, 13, 'canon', 'deuteronomy', 21, 23, 'free', E'*His body shall not remain all night upon the tree, but thou shalt in any wise bury him that day; (for he that is hanged is accursed of Elohim (God);) that thy land be not defiled, which Yahuah Elohayka (the LORD thy God) giveth thee for an inheritance.* (Deuteronomy 21:23). Paul reaches for this exact word: *for it is written, Cursed is every one that hangeth on a tree* (Galatians 3:13). The one *made a curse for us* took the place of the accursed — *he that is hanged is accursed of Elohim (God)* — bearing on the tree the exile-curse the scattered sheep had earned, that the inheritance might not stay defiled but be restored to them.'),
  ('canon', 'galatians', 3, 10, 'apocrypha', '1-maccabees', 2, 21, 'extras', E'*Yahuah (God) forbid that we should forsake the law and the ordinances.* (1 Maccabees 2:21). The faithful in the Maccabean days knew which way the curse ran: to *forsake the law* was the betrayal, and they would die rather than do it. *As many as are of the works of the law are under the curse* (Galatians 3:10) — for the agitators'' flesh-credential system was itself a forsaking, an attempt to win standing by ritual performance apart from the covenant''s trust. The Torah is never the curse; abandoning the covenant is what the curse answers.'),
  -- thread: galatians-3-the-just-shall-live-by-faith-and-the-doer-shall-live-habakkuk-2-leviticus-18
  ('canon', 'galatians', 3, 11, 'canon', 'habakkuk', 2, 4, 'free', E'*Behold, his soul which is lifted up is not upright in him: but the just shall live by his faith.* (Habakkuk 2:4). Paul quotes the prophet: *But that no man is justified by the law in the sight of Elohim (God), it is evident: for, The just shall live by faith* (Galatians 3:11). Justification — being reckoned righteous before Elohim (God) — has always been by faith, the trust of the upright soul in the faithful word of Yahuah (LORD). This is the question of how a man is counted just, and the prophet answered it long before the agitators raised their flesh-credential gospel.'),
  ('canon', 'galatians', 3, 12, 'canon', 'leviticus', 18, 5, 'free', E'*Ye shall therefore keep my statutes, and my judgments: which if a man do, he shall live in them: I am Yahuah (LORD).* (Leviticus 18:5). Paul sets this beside Habakkuk: *And the law is not of faith: but, The man that doeth them shall live in them* (Galatians 3:12). The two do not war. Habakkuk answers how a man is justified — by faith; Leviticus answers how the covenant people LIVE — walking in the statutes of Yahuah (LORD), and finding life in them. One speaks of being reckoned righteous, the other of the life of the righteous; the apparatus that pits them against each other has confused the two questions Paul keeps distinct.'),
  ('canon', 'galatians', 3, 12, 'canon', 'romans', 10, 5, 'free', E'*For Moses describeth the righteousness which is of the law, That the man which doeth those things shall live by them.* (Romans 10:5). Paul cites Leviticus 18:5 himself in Romans, in his own voice — *The man that doeth them shall live in them* (Galatians 3:12). He does not throw the verse away; he names it as Moses'' own true description of the life of the righteous. The doer lives in them; the Torah-life is the life of the covenant people, set beside, not against, the faith by which a man is justified.'),
  -- thread: galatians-3-to-thy-seed-which-is-christ-the-promise-confirmed-genesis-22
  ('canon', 'galatians', 3, 16, 'canon', 'genesis', 22, 18, 'free', E'*And in thy seed shall all the nations of the earth be blessed; because thou hast obeyed my voice.* (Genesis 22:18). Paul reads the singular: *Now to Abraham and his seed were the promises made. He saith not, And to seeds, as of many; but as of one, And to thy seed, which is Messiah (Christ)* (Galatians 3:16). The promise sworn on Moriah, after Abraham *obeyed my voice* in the binding of Isaac, narrows down through the generations to one Seed in whom all the nations are blessed — the Messiah, in whom the scattered families of the earth are gathered home.'),
  ('canon', 'galatians', 3, 16, 'canon', 'genesis', 12, 7, 'free', E'*And Yahuah (LORD) appeared unto Abram, and said, Unto thy seed will I give this land: and there builded he an altar unto Yahuah (LORD), who appeared unto him.* (Genesis 12:7). The promise was *to thy seed* from the first appearing — *to Abraham and his seed were the promises made... And to thy seed, which is Messiah (Christ)* (Galatians 3:16). The inheritance of the land, the blessing of the nations, all of it runs to the Seed; and *the covenant, that was confirmed before of Elohim (God) in Messiah (Christ), the law, which was four hundred and thirty years after, cannot disannul* it (Galatians 3:17). The promise and the law are not rivals — the later does not cancel the earlier.'),
  ('canon', 'galatians', 3, 18, 'canon', 'genesis', 15, 6, 'free', E'*And he believed in Yahuah (LORD); and he counted it to him for righteousness.* (Genesis 15:6). The inheritance came to Abraham as a gift received by trust: *For if the inheritance be of the law, it is no more of promise: but Elohim (God) gave it to Abraham by promise* (Galatians 3:18). It was while he *believed in Yahuah (LORD)* that the promise of seed and land was sealed to him — given, not earned by the flesh-credential the agitators pressed. The inheritance is of promise, received as Abraham received it, by faith.'),
  -- thread: galatians-3-is-the-law-against-the-promises-of-god-god-forbid
  ('canon', 'galatians', 3, 21, 'canon', 'romans', 3, 31, 'free', E'*Do we then make void the law through faith? Elohim (God) forbid: yea, we establish the law.* (Romans 3:31). The question Paul answers in Galatians is the same he answers in Romans, with the same flat denial: *Is the law then against the promises of Elohim (God)? Elohim (God) forbid* (Galatians 3:21). Faith does not abolish the Torah; it *establishes* it. The law and the promise are not enemies — the law cannot give life (that was never its office, *for if there had been a law given which could have given life, verily righteousness should have been by the law*), but it is no rival to the promise that does.'),
  -- thread: galatians-3-the-law-our-guardian-to-bring-us-unto-christ-and-full-sonship
  ('canon', 'galatians', 3, 24, 'canon', 'romans', 10, 4, 'free', E'*For Messiah (Christ) is the end of the law for righteousness to every one that believeth.* (Romans 10:4). The schoolmaster — the paidagogos, the household guardian who escorts the child — has one errand: *Wherefore the law was our schoolmaster to bring us unto Messiah (Christ), that we might be justified by faith* (Galatians 3:24). Messiah is the goal the escort delivers us to, the aim and crown of the law for righteousness, not a door out of the covenant. To reach him is to enter full sonship — *for ye are all the children of Elohim (God) by faith in HaMashiach Yahusha (Christ Jesus)* (Galatians 3:26) — the heir grown up into his inheritance, which includes the Torah, no longer a child under the guardian''s daily charge.'),
  -- thread: galatians-3-neither-jew-nor-greek-all-one-abrahams-seed-heirs-of-the-promise
  ('canon', 'galatians', 3, 28, 'canon', 'romans', 10, 12, 'free', E'*For there is no difference between the Yahudi (Jew) and the Greek: for the same Yahuah (Lord) over all is rich unto all that call upon him.* (Romans 10:12). Paul says the same thing in Romans that he says here: *There is neither Yahudi (Jew) nor Greek... for ye are all one in HaMashiach Yahusha (Christ Jesus)* (Galatians 3:28). What is levelled is the hierarchy of access the circumcision party built — circumcised-above-uncircumcised — for *the same Yahuah (Lord) over all is rich unto all.* It is not tribe or seed that is erased, but the wall of preference; the scattered Yashar''elite and the Yahudi stand on one ground before the promise.'),
  ('canon', 'galatians', 3, 28, 'canon', '1-corinthians', 7, 19, 'free', E'*Circumcision is nothing, and uncircumcision is nothing, but the keeping of the commandments of Elohim (God).* (1 Corinthians 7:19). Here is Paul''s own measure of what *neither Yahudi (Jew) nor Greek* means: the flesh-mark that the agitators made the doorway is *nothing* either way — what abides is *the keeping of the commandments of Elohim (God).* *There is neither Yahudi (Jew) nor Greek... for ye are all one in HaMashiach Yahusha (Christ Jesus)* (Galatians 3:28). The access-hierarchy falls; the commandments stand. Oneness in Messiah is never the abolition of the Torah but the removal of the flesh-credential that barred the scattered from their own inheritance.'),
  ('canon', 'galatians', 3, 29, 'canon', 'genesis', 22, 18, 'free', E'*And in thy seed shall all the nations of the earth be blessed; because thou hast obeyed my voice.* (Genesis 22:18). The chapter ends where the promise began: *And if ye be Messiah''s (Christ''s), then are ye Abraham''s seed, and heirs according to the promise* (Galatians 3:29). To belong to the Seed is to be reckoned among Abraham''s seed and brought into the inheritance sworn on Moriah — *in thy seed shall all the nations of the earth be blessed.* The scattered children of the nations are not outsiders grafted in by a bare confession; they are the seed of Abraham coming home to the promise that was always theirs.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s223_g03_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s223_g03_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'galatians-3-abraham-believed-god-counted-for-righteousness-the-faith-that-was-faithfulness-genesis-15',
       E'Abraham believed Elohim (God), and it was counted for righteousness — the faith that was faithfulness (Genesis 15)',
       E'Paul anchors the whole argument in one verse of Genesis: *Even as Abraham believed Elohim (God), and it was accounted to him for righteousness* (Galatians 3:6), quoting *And he believed in Yahuah (LORD); and he counted it to him for righteousness* (Genesis 15:6). Mark where it stands — Genesis 15, before the circumcision of Genesis 17. Abraham was reckoned righteous as he trusted the promise, before the covenant sign was ever set in his flesh; so the scattered seed are brought home by that same trust, not by the agitators'' flesh-credential. And the Hebrew library tells what his believing looked like in life: *Who kept the law of the Most High, and was in covenant with him: he established the covenant in his flesh; and when he was proved, he was found faithful* (Sirach 44:20); *Was not Abraham found faithful in temptation, and it was imputed to him for righteousness?* (1 Maccabees 2:52). The faith counted to him was no bare assent — it was emunah, the trust that holds when it is proved, faith that is faithfulness. To *believe* and to be *found faithful in temptation* are one act, not two. So *they which are of faith, the same are the children of Abraham* (Galatians 3:7), and the promise spoken to him reaches the nations: *In thee shall all nations be blessed* (Galatians 3:8), the word Yahuah (LORD) gave him at the first — *in thee shall all families of the earth be blessed* (Genesis 12:3) — and said again toward Sodom — *all the nations of the earth shall be blessed in him* (Genesis 18:18). *So then they which be of faith are blessed with faithful Abraham* (Galatians 3:9). Paul stands inside this Abraham, not against him; in Romans he cites the same Genesis verse — *Abraham believed Elohim (God), and it was counted unto him for righteousness* (Romans 4:3) — and guards it from ever voiding the Torah: *we establish the law* (Romans 3:31). The children of Abraham are those who trust as he trusted and walk as he walked.',
       sv.verse_id, ev.verse_id, 'extras', 7250
  FROM _s223_g03_lookup sv, _s223_g03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=3 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='galatians' AND ev.chapter_number=3 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'galatians-3-christ-redeemed-us-from-the-curse-of-exile-deuteronomy-21-and-27',
       E'Messiah (Christ) redeemed us from the curse of exile, being made a curse on the tree (Deuteronomy 21 and 27)',
       E'This is the verse the inherited reading turns into a weapon against the Torah, and the turning misreads what the curse is. *For as many as are of the works of the law are under the curse: for it is written, Cursed is every one that continueth not in all things which are written in the book of the law to do them* (Galatians 3:10). Paul is quoting the covenant''s own sanction: *Cursed be he that confirmeth not all the words of this law to do them. And all the people shall say, Amen* (Deuteronomy 27:26), the curse pronounced upon covenant-BREAKING — not a verdict against the Torah, but the Torah''s own word against forsaking it. It is the whole catalogue of sanctions Moses set out: *if thou wilt not hearken... that all these curses shall come upon thee, and overtake thee* (Deuteronomy 28:15). And the sharpest curse is the EXILE itself — *And Yahuah (LORD) shall scatter thee among all people, from the one end of the earth even unto the other* (Deuteronomy 28:64). The Galatians are those scattered ones, the lost sheep among the nations. So when Paul writes *Messiah (Christ) hath redeemed us from the curse of the law, being made a curse for us: for it is written, Cursed is every one that hangeth on a tree* (Galatians 3:13), he reaches for *he that is hanged is accursed of Elohim (God)* (Deuteronomy 21:23): the one made a curse took the place of the accursed, bearing on the tree the exile-judgment the scattered sheep had earned, *that the blessing of Abraham might come on the Gentiles* (Galatians 3:14) and the door home be opened — not by cancelling the covenant they were scattered for breaking, but by bearing its sentence himself. The faithful always knew which way the curse ran: *Yahuah (God) forbid that we should forsake the law and the ordinances* (1 Maccabees 2:21). To forsake the law was the betrayal the curse answered; the agitators'' flesh-credential gospel was itself a forsaking. The Torah is never the curse. Messiah redeemed his people from the curse of exile and brought them home through it.',
       sv.verse_id, ev.verse_id, 'extras', 7253
  FROM _s223_g03_lookup sv, _s223_g03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=3 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='galatians' AND ev.chapter_number=3 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'galatians-3-the-just-shall-live-by-faith-and-the-doer-shall-live-habakkuk-2-leviticus-18',
       E'The just shall live by faith, and the doer shall live in them — standing together (Habakkuk 2, Leviticus 18)',
       E'Two Tanakh witnesses stand side by side in these verses, and the inherited reading sets them at war; Paul does not. *But that no man is justified by the law in the sight of Elohim (God), it is evident: for, The just shall live by faith* (Galatians 3:11) — the prophet''s word, *the just shall live by his faith* (Habakkuk 2:4). *And the law is not of faith: but, The man that doeth them shall live in them* (Galatians 3:12) — Moses'' word, *which if a man do, he shall live in them: I am Yahuah (LORD)* (Leviticus 18:5). These answer two different questions and never contradict. Habakkuk answers how a man is JUSTIFIED — reckoned righteous before Elohim (God): by faith, the trust of the upright soul in the faithful word of Yahuah (LORD). Leviticus answers how the covenant people LIVE — walking in the statutes of Yahuah (LORD) and finding life in them. One speaks of being counted righteous; the other of the life of the righteous. And Paul honours the Leviticus word even as he distinguishes it: in Romans he cites it in his own voice — *For Moses describeth the righteousness which is of the law, That the man which doeth those things shall live by them* (Romans 10:5) — naming it Moses'' own true description of the covenant life, not casting it away. The apparatus that pits *the just shall live by faith* against *the man that doeth them shall live in them* has confused the two questions Paul keeps clear: a man is justified by faith, and the justified walk in the way of Yahuah (LORD) and live.',
       sv.verse_id, ev.verse_id, 'free', 7256
  FROM _s223_g03_lookup sv, _s223_g03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=3 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='galatians' AND ev.chapter_number=3 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'galatians-3-to-thy-seed-which-is-christ-the-promise-confirmed-genesis-22',
       E'To thy seed, which is Messiah (Christ) — the promise the law cannot disannul (Genesis 22)',
       E'Paul reads the promise down to its single point: *Now to Abraham and his seed were the promises made. He saith not, And to seeds, as of many; but as of one, And to thy seed, which is Messiah (Christ)* (Galatians 3:16). The word was *to thy seed* from the first appearing — *Unto thy seed will I give this land* (Genesis 12:7) — and it was sworn on Moriah, after the binding of Isaac, when Abraham *obeyed my voice*: *And in thy seed shall all the nations of the earth be blessed; because thou hast obeyed my voice* (Genesis 22:18). The promise narrows through the generations to one Seed, the Messiah, in whom the scattered families of the earth are gathered home. And the later giving of the law does not undo this: *the covenant, that was confirmed before of Elohim (God) in Messiah (Christ), the law, which was four hundred and thirty years after, cannot disannul, that it should make the promise of none effect* (Galatians 3:17). The inheritance came to Abraham as a gift received by trust — *For if the inheritance be of the law, it is no more of promise: but Elohim (God) gave it to Abraham by promise* (Galatians 3:18) — sealed to him while *he believed in Yahuah (LORD); and he counted it to him for righteousness* (Genesis 15:6). The promise and the law are not rivals: the promise was given first and stands sure, and the law that came after takes nothing from it. The inheritance is of promise, received as Abraham received it, and it runs to the Seed and to all who are his.',
       sv.verse_id, ev.verse_id, 'free', 7259
  FROM _s223_g03_lookup sv, _s223_g03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=3 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='galatians' AND ev.chapter_number=3 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'galatians-3-is-the-law-against-the-promises-of-god-god-forbid',
       E'Is the law against the promises of Elohim (God)? Elohim (God) forbid',
       E'Here Paul says outright what the whole apparatus must hold: the law and the promise are not enemies. *Wherefore then serveth the law? It was added because of transgressions, till the seed should come to whom the promise was made* (Galatians 3:19). And then the question, and the flat denial: *Is the law then against the promises of Elohim (God)? Elohim (God) forbid: for if there had been a law given which could have given life, verily righteousness should have been by the law* (Galatians 3:21). The law was never given to be the source of life or the ground of justification — that was never its office — so it cannot be a rival to the promise that does give life. To say the law opposes the promise is the thing Paul expressly forbids. He answers the same question the same way in Romans: *Do we then make void the law through faith? Elohim (God) forbid: yea, we establish the law* (Romans 3:31). Faith does not abolish the Torah; it establishes it. The scripture *concluded all under sin, that the promise by faith of Yahusha HaMashiach (Jesus Christ) might be given to them that believe* (Galatians 3:22) — the law exposing the need that the promise fills, the two working one work, never at war.',
       sv.verse_id, ev.verse_id, 'free', 7262
  FROM _s223_g03_lookup sv, _s223_g03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=3 AND sv.verse_number=19
   AND ev.edition_slug='canon' AND ev.book_slug='galatians' AND ev.chapter_number=3 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'galatians-3-the-law-our-guardian-to-bring-us-unto-christ-and-full-sonship',
       E'The law our guardian to bring us unto Messiah (Christ), and full sonship',
       E'The inherited reading hears *we are no longer under a schoolmaster* as graduation out of the Torah; the figure says otherwise. *Wherefore the law was our schoolmaster to bring us unto Messiah (Christ), that we might be justified by faith. But after that faith is come, we are no longer under a schoolmaster* (Galatians 3:24-25). The schoolmaster is the paidagogos — not a teacher you outgrow, but the household guardian who escorts the child, keeping and conducting him until he comes of age. Its one errand is to deliver the child TO someone: *to bring us unto Messiah (Christ).* And Messiah is the goal the escort hands us to — *For Messiah (Christ) is the end of the law for righteousness to every one that believeth* (Romans 10:4): the aim and crown of the law, not a door out of the covenant. To reach him is not to leave the inheritance but to enter it in full: *For ye are all the children of Elohim (God) by faith in HaMashiach Yahusha (Christ Jesus)* (Galatians 3:26). The heir who is *no longer under a schoolmaster* is the son grown up into his estate — no longer a child under the guardian''s daily charge, but a full son, and the inheritance into which he enters INCLUDES the Torah. Exiting the guardianship is entering sonship, never graduating out of the Father''s ways.',
       sv.verse_id, ev.verse_id, 'free', 7265
  FROM _s223_g03_lookup sv, _s223_g03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=3 AND sv.verse_number=23
   AND ev.edition_slug='canon' AND ev.book_slug='galatians' AND ev.chapter_number=3 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'galatians-3-neither-jew-nor-greek-all-one-abrahams-seed-heirs-of-the-promise',
       E'Neither Yahudi (Jew) nor Greek, all one — Abraham''s seed, heirs of the promise',
       E'*There is neither Yahudi (Jew) nor Greek, there is neither bond nor free, there is neither male nor female: for ye are all one in HaMashiach Yahusha (Christ Jesus)* (Galatians 3:28). What this levels is the hierarchy of ACCESS the circumcision party built — circumcised-above-uncircumcised, the wall that barred the scattered from their own inheritance — not tribe, not seed, not the distinctions of the covenant household. Paul says the same in Romans: *For there is no difference between the Yahudi (Jew) and the Greek: for the same Yahuah (Lord) over all is rich unto all that call upon him* (Romans 10:12) — one Yahuah (Lord), rich unto all, no preference of flesh. And his own measure of what the levelling means leaves the commandments standing: *Circumcision is nothing, and uncircumcision is nothing, but the keeping of the commandments of Elohim (God)* (1 Corinthians 7:19). The flesh-mark the agitators made the doorway is nothing either way; what abides is the keeping of the commandments. Oneness in Messiah is never the abolition of the Torah but the removal of the flesh-credential. So the chapter ends where the promise began: *And if ye be Messiah''s (Christ''s), then are ye Abraham''s seed, and heirs according to the promise* (Galatians 3:29) — the promise sworn on Moriah, *in thy seed shall all the nations of the earth be blessed* (Genesis 22:18). The scattered children of the nations are not outsiders grafted in by a bare confession; they are the seed of Abraham coming home to the promise that was always theirs.',
       sv.verse_id, ev.verse_id, 'free', 7268
  FROM _s223_g03_lookup sv, _s223_g03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=3 AND sv.verse_number=28
   AND ev.edition_slug='canon' AND ev.book_slug='galatians' AND ev.chapter_number=3 AND ev.verse_number=29
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: galatians-3-abraham-believed-god-counted-for-righteousness-the-faith-that-was-faithfulness-genesis-15
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 15:6 — *And he believed in Yahuah (LORD); and he counted it to him for righteousness* the verse Paul quotes, standing before the circumcision of Genesis 17; Abraham reckoned righteous by trust (Galatians 3:6).'
  FROM cross_reference_threads t, cross_references x, _s223_g03_lookup sv, _s223_g03_lookup tv
 WHERE t.slug='galatians-3-abraham-believed-god-counted-for-righteousness-the-faith-that-was-faithfulness-genesis-15'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=3 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Sirach 44:20 — *Who kept the law of the Most High... and when he was proved, he was found faithful* the Hebrew library names Abraham''s believing as faithfulness, emunah; the children of Abraham trust as he trusted (Galatians 3:7).'
  FROM cross_reference_threads t, cross_references x, _s223_g03_lookup sv, _s223_g03_lookup tv
 WHERE t.slug='galatians-3-abraham-believed-god-counted-for-righteousness-the-faith-that-was-faithfulness-genesis-15'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=3 AND sv.verse_number=7
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=44 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Maccabees 2:52 — *Was not Abraham found faithful in temptation, and it was imputed to him for righteousness?* the second-temple house read Genesis 15:6 as Paul does; to believe and to be found faithful are one act (Galatians 3:6).'
  FROM cross_reference_threads t, cross_references x, _s223_g03_lookup sv, _s223_g03_lookup tv
 WHERE t.slug='galatians-3-abraham-believed-god-counted-for-righteousness-the-faith-that-was-faithfulness-genesis-15'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=3 AND sv.verse_number=6
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=2 AND tv.verse_number=52
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 12:3 — *in thee shall all families of the earth be blessed* the gospel preached to Abraham at the first call, the scattered families blessed in him (Galatians 3:8).'
  FROM cross_reference_threads t, cross_references x, _s223_g03_lookup sv, _s223_g03_lookup tv
 WHERE t.slug='galatians-3-abraham-believed-god-counted-for-righteousness-the-faith-that-was-faithfulness-genesis-15'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=3 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Genesis 18:18 — *all the nations of the earth shall be blessed in him* the settled word repeated to Abraham, the blessing on the nations coming through faith (Galatians 3:8).'
  FROM cross_reference_threads t, cross_references x, _s223_g03_lookup sv, _s223_g03_lookup tv
 WHERE t.slug='galatians-3-abraham-believed-god-counted-for-righteousness-the-faith-that-was-faithfulness-genesis-15'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=3 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=18 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Genesis 15:6 — *he believed in Yahuah (LORD); and he counted it to him for righteousness* Paul calls him *faithful Abraham*; the blessing rests on those who share his faithfulness (Galatians 3:9).'
  FROM cross_reference_threads t, cross_references x, _s223_g03_lookup sv, _s223_g03_lookup tv
 WHERE t.slug='galatians-3-abraham-believed-god-counted-for-righteousness-the-faith-that-was-faithfulness-genesis-15'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=3 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Romans 4:3 — *Abraham believed Elohim (God), and it was counted unto him for righteousness* Paul''s two-pass echo, the same Genesis verse, guarded from voiding the Torah, *we establish the law* (Galatians 3:6).'
  FROM cross_reference_threads t, cross_references x, _s223_g03_lookup sv, _s223_g03_lookup tv
 WHERE t.slug='galatians-3-abraham-believed-god-counted-for-righteousness-the-faith-that-was-faithfulness-genesis-15'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=3 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=4 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: galatians-3-christ-redeemed-us-from-the-curse-of-exile-deuteronomy-21-and-27
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 27:26 — *Cursed be he that confirmeth not all the words of this law to do them* the covenant''s own sanction on covenant-BREAKING, which Paul quotes; the curse is the Torah''s word against forsaking it (Galatians 3:10).'
  FROM cross_reference_threads t, cross_references x, _s223_g03_lookup sv, _s223_g03_lookup tv
 WHERE t.slug='galatians-3-christ-redeemed-us-from-the-curse-of-exile-deuteronomy-21-and-27'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=3 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=27 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 28:15 — *if thou wilt not hearken... all these curses shall come upon thee* the catalogue of covenant-sanctions; the curse falls on the breaking, not the keeping (Galatians 3:10).'
  FROM cross_reference_threads t, cross_references x, _s223_g03_lookup sv, _s223_g03_lookup tv
 WHERE t.slug='galatians-3-christ-redeemed-us-from-the-curse-of-exile-deuteronomy-21-and-27'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=3 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 28:64 — *Yahuah (LORD) shall scatter thee among all people* the curse in its sharpest form, the EXILE; the Galatians are the scattered ones redeemed from it (Galatians 3:13).'
  FROM cross_reference_threads t, cross_references x, _s223_g03_lookup sv, _s223_g03_lookup tv
 WHERE t.slug='galatians-3-christ-redeemed-us-from-the-curse-of-exile-deuteronomy-21-and-27'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=3 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=64
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Deuteronomy 21:23 — *he that is hanged is accursed of Elohim (God)* the word Paul quotes; the one made a curse on the tree bore the exile-curse the scattered sheep had earned (Galatians 3:13).'
  FROM cross_reference_threads t, cross_references x, _s223_g03_lookup sv, _s223_g03_lookup tv
 WHERE t.slug='galatians-3-christ-redeemed-us-from-the-curse-of-exile-deuteronomy-21-and-27'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=3 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=21 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Maccabees 2:21 — *Yahuah (God) forbid that we should forsake the law and the ordinances* the faithful knew the curse answered forsaking the covenant, not keeping it; the agitators'' flesh-credential was the forsaking (Galatians 3:10).'
  FROM cross_reference_threads t, cross_references x, _s223_g03_lookup sv, _s223_g03_lookup tv
 WHERE t.slug='galatians-3-christ-redeemed-us-from-the-curse-of-exile-deuteronomy-21-and-27'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=3 AND sv.verse_number=10
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=2 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: galatians-3-the-just-shall-live-by-faith-and-the-doer-shall-live-habakkuk-2-leviticus-18
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Habakkuk 2:4 — *the just shall live by his faith* the prophet''s answer to how a man is JUSTIFIED, reckoned righteous before Elohim (God) by trust (Galatians 3:11).'
  FROM cross_reference_threads t, cross_references x, _s223_g03_lookup sv, _s223_g03_lookup tv
 WHERE t.slug='galatians-3-the-just-shall-live-by-faith-and-the-doer-shall-live-habakkuk-2-leviticus-18'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=3 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='habakkuk' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 18:5 — *which if a man do, he shall live in them: I am Yahuah (LORD)* Moses'' answer to how the covenant people LIVE, walking in the statutes; set beside, not against, the faith that justifies (Galatians 3:12).'
  FROM cross_reference_threads t, cross_references x, _s223_g03_lookup sv, _s223_g03_lookup tv
 WHERE t.slug='galatians-3-the-just-shall-live-by-faith-and-the-doer-shall-live-habakkuk-2-leviticus-18'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=3 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=18 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 10:5 — *the man which doeth those things shall live by them* Paul cites Leviticus 18:5 in his own voice, naming it Moses'' true description of the covenant life, not casting it away (Galatians 3:12).'
  FROM cross_reference_threads t, cross_references x, _s223_g03_lookup sv, _s223_g03_lookup tv
 WHERE t.slug='galatians-3-the-just-shall-live-by-faith-and-the-doer-shall-live-habakkuk-2-leviticus-18'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=3 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=10 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: galatians-3-to-thy-seed-which-is-christ-the-promise-confirmed-genesis-22
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 22:18 — *in thy seed shall all the nations of the earth be blessed; because thou hast obeyed my voice* the promise sworn on Moriah, narrowing to the one Seed which is Messiah (Galatians 3:16).'
  FROM cross_reference_threads t, cross_references x, _s223_g03_lookup sv, _s223_g03_lookup tv
 WHERE t.slug='galatians-3-to-thy-seed-which-is-christ-the-promise-confirmed-genesis-22'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=3 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 12:7 — *Unto thy seed will I give this land* the promise was *to thy seed* from the first appearing; the later law cannot disannul it (Galatians 3:16-17).'
  FROM cross_reference_threads t, cross_references x, _s223_g03_lookup sv, _s223_g03_lookup tv
 WHERE t.slug='galatians-3-to-thy-seed-which-is-christ-the-promise-confirmed-genesis-22'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=3 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 15:6 — *he believed in Yahuah (LORD); and he counted it to him for righteousness* the inheritance sealed to Abraham while he believed, given by promise, not earned by flesh (Galatians 3:18).'
  FROM cross_reference_threads t, cross_references x, _s223_g03_lookup sv, _s223_g03_lookup tv
 WHERE t.slug='galatians-3-to-thy-seed-which-is-christ-the-promise-confirmed-genesis-22'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=3 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: galatians-3-is-the-law-against-the-promises-of-god-god-forbid
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Romans 3:31 — *Do we then make void the law through faith? Elohim (God) forbid: yea, we establish the law* Paul answers the same question the same way; faith establishes the Torah, the law and promise are no enemies (Galatians 3:21).'
  FROM cross_reference_threads t, cross_references x, _s223_g03_lookup sv, _s223_g03_lookup tv
 WHERE t.slug='galatians-3-is-the-law-against-the-promises-of-god-god-forbid'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=3 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=3 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: galatians-3-the-law-our-guardian-to-bring-us-unto-christ-and-full-sonship
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Romans 10:4 — *Messiah (Christ) is the end of the law for righteousness to every one that believeth* Messiah is the GOAL the paidagogos delivers us to, the aim and crown of the law, not a door out of the covenant (Galatians 3:24).'
  FROM cross_reference_threads t, cross_references x, _s223_g03_lookup sv, _s223_g03_lookup tv
 WHERE t.slug='galatians-3-the-law-our-guardian-to-bring-us-unto-christ-and-full-sonship'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=3 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=10 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: galatians-3-neither-jew-nor-greek-all-one-abrahams-seed-heirs-of-the-promise
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Romans 10:12 — *there is no difference between the Yahudi (Jew) and the Greek: for the same Yahuah (Lord) over all is rich unto all* the same levelling, the hierarchy of access removed, one Yahuah rich unto all (Galatians 3:28).'
  FROM cross_reference_threads t, cross_references x, _s223_g03_lookup sv, _s223_g03_lookup tv
 WHERE t.slug='galatians-3-neither-jew-nor-greek-all-one-abrahams-seed-heirs-of-the-promise'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=3 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=10 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Corinthians 7:19 — *Circumcision is nothing... but the keeping of the commandments of Elohim (God)* Paul''s own measure of the levelling: the flesh-mark is nothing, the commandments stand (Galatians 3:28).'
  FROM cross_reference_threads t, cross_references x, _s223_g03_lookup sv, _s223_g03_lookup tv
 WHERE t.slug='galatians-3-neither-jew-nor-greek-all-one-abrahams-seed-heirs-of-the-promise'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=3 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=7 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 22:18 — *in thy seed shall all the nations of the earth be blessed* the chapter ends at the Moriah promise; the scattered are Abraham''s seed coming home, not outsiders grafted in by bare confession (Galatians 3:29).'
  FROM cross_reference_threads t, cross_references x, _s223_g03_lookup sv, _s223_g03_lookup tv
 WHERE t.slug='galatians-3-neither-jew-nor-greek-all-one-abrahams-seed-heirs-of-the-promise'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=3 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_galatians_04.sql (S223 Galatians 4) -----
-- =====================================================================
-- S223 minion — GALATIANS 4 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: GALATIANS 4 (31 verses).  Tag: g04 (temp view _s223_g04_lookup).
-- Sort band: floor 7275, step 3 (7275, 7278, 7281, 7284 — under 7300).
-- Source is ALWAYS the canon Galatians verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (HIGHEST VOICE-RISK BOOK — "The Galatians Lie"; Red Lines #4/#5/#6/#7/#10):
-- The Galatians are scattered seed of Yashar'el (Israel) coming HOME, not pagans grafted in by a
-- bare faith-confession. Galatians 4 is read accordingly, verse by verse:
--   4:4  *in the fulness of the time Elohim (God) sent forth his Son... made under the law* —
--        Christology (the Formed Son HAS a Father who sent him; he came in flesh, *made of a
--        woman*) AND the Messiah HIMSELF kept Torah (*made under the law*). The fulness of the
--        time is the APPOINTED time — Shiloh come, the sign of Immanuel given.
--   4:5  *to redeem them that were under the law, that we might receive the adoption of sons* =
--        the RE-adoption of the exiled, scattered seed into their OWN inheritance — never the
--        adoption of outsiders who never had a covenant. The adoption ALREADY belonged to
--        Yashar'el (Israel) (Romans 9:4 — *to whom pertaineth the adoption... and the giving of
--        the law*). Israel was always *my son, even my firstborn* (Exodus 4:22).
--   4:6  *Abba, Father* — the Spirit of the Son, the Spirit of adoption (Romans 8:15).
--   4:8-10 the *weak and beggarly elements* and *days, and months, and times, and years* — HIGH
--        CARE: this is the turning BACK to the pagan-elements BONDAGE they came out of (4:8 *ye
--        did service unto them which by nature are no gods*) — the opposite direction from coming
--        home. It is NEVER a dismissal of Yahuah's (the LORD's) appointed feasts, which are HIS
--        (*the feasts of Yahuah (LORD)... even these are my feasts*, Leviticus 23:2) and which the
--        nations keep in the millennial reign (*to keep the feast of tabernacles*, Zechariah
--        14:16). The danger named is reversion to the no-gods, not obedience to the Most High.
--   4:21-31 HAGAR and SARAH: Hagar = flesh-based earning / the present Jerusalem in bondage (the
--        agitators' flesh-credential system); Sarah = promise-based sonship / the Jerusalem above.
--        *Cast out the bondwoman and her son* (4:30 / Genesis 21:10) = expel the spirit of
--        flesh-earning, NOT Torah. The allegory does NOT condemn Torah; it is rooted IN the Torah
--        narrative it cites (Genesis 16/17/21) and in Isaiah's word to the barren (54:1) — the
--        desolate bearing more children = the scattered restored, the gathering.
-- The default trained reading — grace-against-law, Torah-abolished, days-and-feasts-cancelled,
-- the-Gentiles-grafted-in-as-pagans — is the antichrist reading this apparatus exists to dismantle
-- and surfaces in not one sentence below.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every meaningful verse-block):
--   v.1-3   the heir a child under tutors; in bondage under the elements of the world
--           Tanakh: none warranted (figure carried in prose; the bondage is unpacked at 4:8-10)
--           Extras: none warranted   NT: none warranted (Galatians 3:24-25 same hand)
--   v.4     in the fulness of the time Elohim sent forth his Son, made of a woman, made under the law
--           Tanakh: Genesis 49:10 (Shiloh come, the gathering — the appointed time), Isaiah 7:14
--                   (a virgin shall conceive... Immanuel — made of a woman)   Extras: none warranted
--           NT: none added (the Christology re-walked across the library; same hand)
--   v.5-6   to redeem them under the law, the adoption of sons; the Spirit of his Son, Abba Father
--           Tanakh: Exodus 4:22 (Israel my son, my firstborn), Hosea 11:1 (called my son out of
--                   Egypt), Jeremiah 31:9 (a father to Israel, Ephraim my firstborn)
--           Extras: none warranted   NT: Romans 9:4 (to whom pertaineth the adoption... and the
--                   giving of the law), Romans 8:15 (the Spirit of adoption, whereby we cry Abba)
--   v.7     no more a servant, but a son and an heir   Tanakh/Extras/NT: carried at v.5-6 (same hand)
--   v.8-10  ye did service unto them which by nature are no gods; turning back to the weak and
--           beggarly elements; ye observe days, and months, and times, and years
--           Tanakh: Jeremiah 16:19 (our fathers have inherited lies... no profit), Jeremiah 16:20
--                   (shall a man make gods... and they are no gods?), Deuteronomy 32:17 (gods whom
--                   they knew not), Leviticus 23:2 (the feasts of Yahuah... even these are MY feasts
--                   — the counterweight: HIS appointed times are not the bondage), Zechariah 14:16
--                   (to keep the feast of tabernacles — the feasts kept in the reign)
--           Extras: none warranted   NT: none warranted (Galatians 4:8-9 self-glossing)
--   v.11-20 Paul's appeal; Christ formed in you (4:19)
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted (pastoral; no
--                   load-bearing single-verse root — the formation theme carried in prose)
--   v.21-31 Hagar and Sarah; the two covenants; cast out the bondwoman; Rejoice thou barren
--           Tanakh: Genesis 16:15 (Hagar bare Ishmael — born after the flesh), Genesis 17:19
--                   (Sarah shall bear thee a son indeed... by promise), Genesis 21:1-2 (Yahuah
--                   visited Sarah at the set time), Genesis 21:9-10 (cast out this bondwoman),
--                   Genesis 21:12 (in Isaac shall thy seed be called), Isaiah 54:1 (Rejoice thou
--                   barren... more are the children of the desolate)
--           Extras: Jubilees 16:12 (Isaac born at the set time, on the festival of the first-fruits
--                   — the promise comes at the APPOINTED time), Jubilees 17:4 (Cast out this
--                   bondwoman and her son), Jasher 21:15 (Cast out this bondwoman and her son)
--           NT: Isaiah 54:1 quoted at 4:27 carried in the Tanakh weave; no further NT warranted
--
-- THREADS (slug -> target libraries):
--   7275 galatians-4-in-the-fulness-of-the-time-god-sent-forth-his-son-made-under-the-law          (Tanakh)
--   7278 galatians-4-the-adoption-of-sons-israel-my-firstborn-re-gathered                          (Tanakh + NT)
--   7281 galatians-4-the-weak-and-beggarly-elements-turning-back-to-the-no-gods                    (Tanakh)
--   7284 galatians-4-hagar-and-sarah-cast-out-the-bondwoman-the-barren-rejoicing                   (Tanakh + Extras)
-- =====================================================================

CREATE TEMP VIEW _s223_g04_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: galatians-4-in-the-fulness-of-the-time-god-sent-forth-his-son-made-under-the-law
  ('canon', 'galatians', 4, 4, 'canon', 'genesis', 49, 10, 'free', E'*The sceptre shall not depart from Yahudah (Judah), nor a lawgiver from between his feet, until Shiloh come; and unto him shall the gathering of the people be.* (Genesis 49:10). *But when the fulness of the time was come, Elohim (God) sent forth his Son* (Galatians 4:4). The *fulness of the time* is the appointed hour the dying Yaaqob (Jacob) foresaw: the sceptre held in Yahudah (Judah) *until Shiloh come* — and at his coming, *unto him shall the gathering of the people be.* The Son sent in the fulness of time is the one to whom the scattered are gathered; his arrival and the homecoming of the people are the same event.'),
  ('canon', 'galatians', 4, 4, 'canon', 'isaiah', 7, 14, 'free', E'*Therefore Yahuah (Lord) himself shall give you a sign; Behold, a virgin shall conceive, and bear a son, and shall call his name Immanuel.* (Isaiah 7:14). *Elohim (God) sent forth his Son, made of a woman, made under the law* (Galatians 4:4). The Son *made of a woman* is the sign Yahuah (Lord) himself gave: *a virgin shall conceive, and bear a son.* The Formed one, drawn from the Formless, comes in true flesh through a woman of Yashar''el (Israel) — *Immanuel,* Elohim (God) with us, who has a Father that sent him and who is *made under the law,* keeping the very Torah he gave at Sinai.'),
  -- thread: galatians-4-the-adoption-of-sons-israel-my-firstborn-re-gathered
  ('canon', 'galatians', 4, 5, 'canon', 'exodus', 4, 22, 'free', E'*And thou shalt say unto Pharaoh, Thus saith Yahuah (LORD), Yashar''el (Israel) is my son, even my firstborn:* (Exodus 4:22). *To redeem them that were under the law, that we might receive the adoption of sons* (Galatians 4:5). The adoption is no new thing offered to strangers: Yashar''el (Israel) was named *my son, even my firstborn* before ever they left Egypt. The redemption *of them that were under the law* brings the scattered firstborn back into the sonship that was always theirs — a RE-adoption of the exiled seed into their own inheritance, not the taking-in of outsiders who never had a father.'),
  ('canon', 'galatians', 4, 5, 'canon', 'hosea', 11, 1, 'free', E'*When Yashar''el (Israel) was a child, then I loved him, and called my son out of Egypt.* (Hosea 11:1). *That we might receive the adoption of sons* (Galatians 4:5). The sonship Yahuah (LORD) speaks of is Yashar''el''s (Israel''s) from of old — *when Yashar''el (Israel) was a child, then I loved him, and called my son out of Egypt.* The adoption received in Messiah (Christ) is the gathering home of that same son, long scattered among the nations, never the manufacture of a son where there was none.'),
  ('canon', 'galatians', 4, 5, 'canon', 'jeremiah', 31, 9, 'free', E'*They shall come with weeping, and with supplications will I lead them: I will cause them to walk by the rivers of waters in a straight way, wherein they shall not stumble: for I am a father to Yashar''el (Israel), and Ephraim is my firstborn.* (Jeremiah 31:9). *That we might receive the adoption of sons* (Galatians 4:5). The promise of return names the Father and the firstborn: *I am a father to Yashar''el (Israel), and Ephraim is my firstborn.* Ephraim — the scattered northern house lost among the nations — is the firstborn led home with weeping and supplication. The adoption of sons is exactly this homecoming of the firstborn, gathered by the rivers of water in a straight way.'),
  ('canon', 'galatians', 4, 5, 'canon', 'romans', 9, 4, 'free', E'*Who are Israelites; to whom pertaineth the adoption, and the glory, and the covenants, and the giving of the law, and the service of Elohim (God), and the promises;* (Romans 9:4). *That we might receive the adoption of sons* (Galatians 4:5). The same hand that wrote Galatians names plainly whose the adoption is: it *pertaineth* to the Israelites — and stands in one breath with *the giving of the law,* the covenants, and the promises. The adoption and the Torah belong to the same people and are never set against each other; to be re-adopted is to be brought home to the giving of the law, not away from it.'),
  ('canon', 'galatians', 4, 6, 'canon', 'romans', 8, 15, 'free', E'*For ye have not received the spirit of bondage again to fear; but ye have received the Spirit of adoption, whereby we cry, Abba, Father.* (Romans 8:15). *And because ye are sons, Elohim (God) hath sent forth the Spirit of his Son into your hearts, crying, Abba, Father.* (Galatians 4:6). The Spirit of the Son and the Spirit of adoption are one and the same, and they raise one cry: *Abba, Father.* This is the opposite of the *spirit of bondage again to fear* — the very bondage to the no-gods that 4:8-10 warns them not to return to. The sons cry to a Father; the servants of the elements cried to that which by nature is no god.'),
  -- thread: galatians-4-the-weak-and-beggarly-elements-turning-back-to-the-no-gods
  ('canon', 'galatians', 4, 8, 'canon', 'jeremiah', 16, 19, 'free', E'*O Yahuah (LORD), my strength, and my fortress, and my refuge in the day of affliction, the Gentiles shall come unto thee from the ends of the earth, and shall say, Surely our fathers have inherited lies, vanity, and things wherein there is no profit.* (Jeremiah 16:19). *Howbeit then, when ye knew not Elohim (God), ye did service unto them which by nature are no gods.* (Galatians 4:8). The prophet foresaw this very confession from the scattered coming home from the ends of the earth: *our fathers have inherited lies, vanity, and things wherein there is no profit.* That inherited vanity is the service rendered *unto them which by nature are no gods* — the bondage of exile among idols, which Paul will not let them turn back to.'),
  ('canon', 'galatians', 4, 8, 'canon', 'jeremiah', 16, 20, 'free', E'*Shall a man make gods unto himself, and they are no gods?* (Jeremiah 16:20). *Ye did service unto them which by nature are no gods.* (Galatians 4:8). Paul''s words echo the prophet''s exact charge: the man-made idols *are no gods.* The service the Galatians once gave was to these — *the weak and beggarly elements* (Galatians 4:9) of the nations — and to turn *again* to them is to make oneself a servant of nothing once more.'),
  ('canon', 'galatians', 4, 9, 'canon', 'deuteronomy', 32, 17, 'free', E'*They sacrificed unto devils, not to Elohim (God); to gods whom they knew not, to new gods that came newly up, whom your fathers feared not.* (Deuteronomy 32:17). *How turn ye again to the weak and beggarly elements, whereunto ye desire again to be in bondage?* (Galatians 4:9). The song of Mosheh (Moses) named the bondage the Galatians are drifting back toward: sacrifice *to gods whom they knew not.* To *turn again* to the weak and beggarly elements is to return to those new gods and devils — a backward step into exile-bondage, the opposite direction from the homecoming Paul preached.'),
  ('canon', 'galatians', 4, 10, 'canon', 'leviticus', 23, 2, 'free', E'*Speak unto the children of Yashar''el (Israel), and say unto them, Concerning the feasts of Yahuah (LORD), which ye shall proclaim to be holy convocations, even these are my feasts.* (Leviticus 23:2). *Ye observe days, and months, and times, and years.* (Galatians 4:10). The appointed times are Yahuah''s (the LORD''s) own — *the feasts of Yahuah (LORD)... even these are my feasts* — given to the children of Yashar''el (Israel) as holy convocations. The *days, and months, and times, and years* Paul rebukes are not these; they are the calendar of the elements they came out of, or the agitators'' keeping-as-flesh-credential. The Father''s feasts remain his, and to keep them is to keep his word, not to be in bondage to the no-gods.'),
  ('canon', 'galatians', 4, 10, 'canon', 'zechariah', 14, 16, 'free', E'*And it shall come to pass, that every one that is left of all the nations which came against Jerusalem shall even go up from year to year to worship the King, Yahuah Tseva''ot (LORD of hosts), and to keep the feast of tabernacles.* (Zechariah 14:16). *Ye observe days, and months, and times, and years.* (Galatians 4:10). The end of the matter settles which observance is bondage and which is life: in the reign of the King, *every one that is left of all the nations* goes up *from year to year... to keep the feast of tabernacles.* The appointed feast of Yahuah (LORD) is kept by the very nations, world without end. What Paul warns against is therefore not the Father''s feasts but the return to the elements of the no-gods.'),
  -- thread: galatians-4-hagar-and-sarah-cast-out-the-bondwoman-the-barren-rejoicing
  ('canon', 'galatians', 4, 22, 'canon', 'genesis', 16, 15, 'free', E'*And Hagar bare Abram a son: and Abram called his son''s name, which Hagar bare, Ishmael.* (Genesis 16:15). *For it is written, that Abraham had two sons, the one by a bondmaid, the other by a freewoman.* (Galatians 4:22). Paul sends them straight to the written record: the son of the bondmaid is Ishmael, *whom Hagar bare* to Abram. *He who was of the bondwoman was born after the flesh* (Galatians 4:23) — the son begotten by Abraham''s and Sarai''s own contriving, the flesh-effort to secure the promise rather than wait for it.'),
  ('canon', 'galatians', 4, 23, 'canon', 'genesis', 17, 19, 'free', E'*And Elohim (God) said, Sarah thy wife shall bear thee a son indeed; and thou shalt call his name Isaac: and I will establish my covenant with him for an everlasting covenant, and with his seed after him.* (Genesis 17:19). *But he of the freewoman was by promise.* (Galatians 4:23). The son of the freewoman is the son of the sworn word: *Sarah thy wife shall bear thee a son indeed.* Isaac is *by promise,* and with him Elohim (God) establishes *an everlasting covenant.* The two sons are the two ways — the flesh-effort of Hagar against the promise-given Isaac — and the covenant is established with the child of promise.'),
  ('canon', 'galatians', 4, 23, 'canon', 'genesis', 21, 2, 'free', E'*For Sarah conceived, and bare Abraham a son in his old age, at the set time of which Elohim (God) had spoken to him.* (Genesis 21:2). *But he of the freewoman was by promise.* (Galatians 4:23). The promise kept its own clock: Sarah bore the son *at the set time of which Elohim (God) had spoken.* The child of promise comes at the appointed time, not by the flesh''s hastening — the same pattern as the Son sent *in the fulness of the time* (Galatians 4:4). Promise and appointed time belong together.'),
  ('canon', 'galatians', 4, 27, 'canon', 'isaiah', 54, 1, 'free', E'*Sing, O barren, thou that didst not bear; break forth into singing, and cry aloud, thou that didst not travail with child: for more are the children of the desolate than the children of the married wife, saith Yahuah (LORD).* (Isaiah 54:1). *For it is written, Rejoice, thou barren that bearest not; break forth and cry, thou that travailest not: for the desolate hath many more children than she which hath an husband.* (Galatians 4:27). Paul quotes the prophet word for word. The barren who *bearest not* is bidden to *rejoice,* for *the desolate hath many more children* — the very promise of restoration: the scattered, who seemed cut off and childless in exile, brought home in a multitude that outnumbers them that never wandered.'),
  ('canon', 'galatians', 4, 30, 'canon', 'genesis', 21, 10, 'free', E'*Wherefore she said unto Abraham, Cast out this bondwoman and her son: for the son of this bondwoman shall not be heir with my son, even with Isaac.* (Genesis 21:10). *Nevertheless what saith the scripture? Cast out the bondwoman and her son: for the son of the bondwoman shall not be heir with the son of the freewoman.* (Galatians 4:30). Paul cites Sarah''s words exactly. The casting-out is the expelling of the flesh-earning that contends against the promise — the spirit of the bondwoman, the flesh-credential system of the agitators — never the casting-out of the Torah, which is the inheritance the freewoman''s son comes into. The son of the flesh *shall not be heir* alongside the son of promise.'),
  ('canon', 'galatians', 4, 30, 'canon', 'genesis', 21, 12, 'free', E'*And Elohim (God) said unto Abraham, Let it not be grievous in thy sight because of the lad, and because of thy bondwoman; in all that Sarah hath said unto thee, hearken unto her voice; for in Isaac shall thy seed be called.* (Genesis 21:12). *For the son of the bondwoman shall not be heir with the son of the freewoman.* (Galatians 4:30). Elohim (God) himself ratified the casting-out: *in Isaac shall thy seed be called.* The line of inheritance runs through the child of promise, not the child of flesh-effort. The expelling is divine, and it marks which sonship inherits — the promise-born, into whose inheritance the whole word of Yahuah (LORD) belongs.'),
  ('canon', 'galatians', 4, 23, 'jubilees', 'jubilees', 16, 12, 'extras', E'*And in the middle of the sixth month Yahuah (God) visited Sarah and did to her as He had spoken, and she conceived. And she bare a son in the third month, and in the middle of the month, at the time of which Yahuah (God) had spoken to Abraham, on the festival of the first-fruits of the harvest, Isaac was born.* (Jubilees 16:12). *But he of the freewoman was by promise.* (Galatians 4:23). The Hebrew library marks the promise-child born to the appointed calendar of Yahuah (God): Isaac came *at the time of which Yahuah (God) had spoken... on the festival of the first-fruits of the harvest.* The son of promise is born on a feast of the Most High — the very appointed times the no-gods'' calendar (Galatians 4:10) counterfeits. Promise keeps the Father''s set time.'),
  ('canon', 'galatians', 4, 30, 'jubilees', 'jubilees', 17, 4, 'extras', E'*And Sarah saw Ishmael playing and dancing and Abraham rejoicing with great joy, and she became jealous of Ishmael and said to Abraham, "Cast out this bondwoman and her son; for the son of this bondwoman will not be heir with my son, Isaac."* (Jubilees 17:4). *Cast out the bondwoman and her son: for the son of the bondwoman shall not be heir with the son of the freewoman.* (Galatians 4:30). The Hebrew record carries Sarah''s words almost as Paul cites them: *Cast out this bondwoman and her son; for the son of this bondwoman will not be heir with my son, Isaac.* The casting-out of the flesh-born is no late allegory but the remembered act of the patriarch''s house — the promise-son alone is heir.'),
  ('canon', 'galatians', 4, 30, 'jasher', 'jasher', 21, 15, 'extras', E'*And Sarah saw the act which Ishmael desired to do to her son Isaac, and it grieved her exceedingly on account of her son, and she sent for Abraham, and said to him, Cast out this bondwoman and her son, for her son shall not be heir with my son, for thus did he seek to do to him this day.* (Jasher 21:15). *But as then he that was born after the flesh persecuted him that was born after the Spirit, even so it is now.* (Galatians 4:29). Jasher remembers the persecution Paul names: Ishmael *desired to do* harm to Isaac, *for thus did he seek to do to him this day.* The flesh-born persecutes the promise-born — and Sarah''s answer is the casting-out, *Cast out this bondwoman and her son, for her son shall not be heir with my son.* The flesh-credential system still persecutes the children of promise, and the answer is unchanged.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s223_g04_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s223_g04_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'galatians-4-in-the-fulness-of-the-time-god-sent-forth-his-son-made-under-the-law',
       E'In the fulness of the time Elohim (God) sent forth his Son, made under the law',
       E'The fulness of the time is the appointed time. *But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law* (Galatians 4:4). Dying Yaaqob (Jacob) had set the clock: *The sceptre shall not depart from Yahudah (Judah), nor a lawgiver from between his feet, until Shiloh come; and unto him shall the gathering of the people be* (Genesis 49:10) — the Son sent in the fulness of time is Shiloh come, and his arrival IS the gathering of the scattered people. The manner of his coming was the sign Yahuah (Lord) himself gave: *Behold, a virgin shall conceive, and bear a son, and shall call his name Immanuel* (Isaiah 7:14). *Made of a woman,* the Formed one drawn from the Formless takes true flesh through a daughter of Yashar''el (Israel); *Immanuel,* Elohim (God) with us, the one who is Yahuah (LORD) and yet has a Father that *sent him forth.* And he is *made under the law* — the Messiah (Christ) himself born into the Torah and keeping it, the lawgiver from between Yahudah''s (Judah''s) feet submitting to the very instruction he gave at Sinai. The Son does not come to abolish the law he was made under; he comes in its fulness, at its appointed time, to redeem and to gather.',
       sv.verse_id, ev.verse_id, 'free', 7275
  FROM _s223_g04_lookup sv, _s223_g04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=4 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='galatians' AND ev.chapter_number=4 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'galatians-4-the-adoption-of-sons-israel-my-firstborn-re-gathered',
       E'The adoption of sons — Yashar''el (Israel) my firstborn, re-gathered',
       E'The adoption is not the taking-in of strangers; it is the bringing-home of a son who was always a son. *To redeem them that were under the law, that we might receive the adoption of sons. And because ye are sons, Elohim (God) hath sent forth the Spirit of his Son into your hearts, crying, Abba, Father* (Galatians 4:5-6). Yashar''el (Israel) bore this name from the beginning: *Thus saith Yahuah (LORD), Yashar''el (Israel) is my son, even my firstborn* (Exodus 4:22); *When Yashar''el (Israel) was a child, then I loved him, and called my son out of Egypt* (Hosea 11:1). And the promise of return names the same Father and the same firstborn — the scattered northern house: *I am a father to Yashar''el (Israel), and Ephraim is my firstborn* (Jeremiah 31:9), led home *with weeping, and with supplications.* The same hand that wrote Galatians says plainly whose the adoption is, and what it stands beside: *to whom pertaineth the adoption, and the glory, and the covenants, and the giving of the law, and the service of Elohim (God), and the promises* (Romans 9:4) — the adoption and the giving of the law in one breath, never set against each other. To be re-adopted is to be brought home to the covenants and the Torah, not away from them. And the seal of the sonship is the Spirit''s own cry: *ye have received the Spirit of adoption, whereby we cry, Abba, Father* (Romans 8:15) — the opposite of *the spirit of bondage again to fear,* the very bondage to the no-gods the next verses warn against. The servant becomes the son he always was; the firstborn comes home.',
       sv.verse_id, ev.verse_id, 'free', 7278
  FROM _s223_g04_lookup sv, _s223_g04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=4 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='galatians' AND ev.chapter_number=4 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'galatians-4-the-weak-and-beggarly-elements-turning-back-to-the-no-gods',
       E'The weak and beggarly elements — turning back to the no-gods, not the feasts of Yahuah (LORD)',
       E'Read the rebuke in its own direction: it is about turning BACK, not about the Father''s appointed times. *Howbeit then, when ye knew not Elohim (God), ye did service unto them which by nature are no gods. But now, after that ye have known Elohim (God)... how turn ye again to the weak and beggarly elements, whereunto ye desire again to be in bondage? Ye observe days, and months, and times, and years* (Galatians 4:8-10). The danger named is reversion — *turn ye again,* *bondage again* — to *them which by nature are no gods.* The prophets gave that bondage its name. *Surely our fathers have inherited lies, vanity, and things wherein there is no profit* (Jeremiah 16:19) is the very confession of the scattered coming home from the ends of the earth; *Shall a man make gods unto himself, and they are no gods?* (Jeremiah 16:20); and the song of Mosheh (Moses): *They sacrificed unto devils, not to Elohim (God); to gods whom they knew not, to new gods that came newly up* (Deuteronomy 32:17). The *weak and beggarly elements* are these — the calendar and service of the no-gods of the nations the Galatians once served, and which the agitators would dress up as flesh-credential. They are NOT the feasts of Yahuah (LORD). Those belong to him: *Concerning the feasts of Yahuah (LORD), which ye shall proclaim to be holy convocations, even these are my feasts* (Leviticus 23:2). And the end of the matter proves they are no bondage but life, for the nations keep them in the reign of the King: *every one that is left of all the nations... shall even go up from year to year to worship the King, Yahuah Tseva''ot (LORD of hosts), and to keep the feast of tabernacles* (Zechariah 14:16). The Father''s appointed times draw the world home; the elements of the no-gods drag the freed back into bondage. Paul forbids the second; he never forbids the first.',
       sv.verse_id, ev.verse_id, 'free', 7281
  FROM _s223_g04_lookup sv, _s223_g04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=4 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='galatians' AND ev.chapter_number=4 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'galatians-4-hagar-and-sarah-cast-out-the-bondwoman-the-barren-rejoicing',
       E'Hagar and Sarah — cast out the bondwoman, and the barren rejoicing (Genesis 16/17/21, Isaiah 54)',
       E'The allegory is built on the Torah and Isaiah, and it expels flesh-earning, not the Torah. *For it is written, that Abraham had two sons, the one by a bondmaid, the other by a freewoman. But he who was of the bondwoman was born after the flesh; but he of the freewoman was by promise* (Galatians 4:22-23). Paul sends them to the written record: *Hagar bare Abram a son... Ishmael* (Genesis 16:15) — the flesh-effort to secure the promise; and *Sarah thy wife shall bear thee a son indeed... and I will establish my covenant with him for an everlasting covenant* (Genesis 17:19) — the child of the sworn word. The promise kept the Father''s clock: *Sarah conceived, and bare Abraham a son in his old age, at the set time of which Elohim (God) had spoken to him* (Genesis 21:2); the Hebrew library marks it an appointed feast — *at the time of which Yahuah (God) had spoken... on the festival of the first-fruits of the harvest, Isaac was born* (Jubilees 16:12) — the same pattern as the Son sent *in the fulness of the time.* Hagar Paul reads as *Jerusalem which now is... in bondage with her children* (Galatians 4:25): the flesh-credential system of the agitators, earning standing by the works of the flesh. Sarah is *Jerusalem which is above... free, which is the mother of us all* (Galatians 4:26), and she is the barren woman of Isaiah''s song: *Rejoice, thou barren that bearest not... for the desolate hath many more children than she which hath an husband* (Galatians 4:27, quoting Isaiah 54:1) — the scattered seed, who seemed cut off and childless in exile, brought home in a multitude. As Ishmael persecuted Isaac (*he that was born after the flesh persecuted him that was born after the Spirit,* Galatians 4:29 — remembered too in the Hebrew record, *Cast out this bondwoman and her son, for her son shall not be heir with my son,* Jasher 21:15), so the flesh-system persecutes the children of promise now. And the answer is Sarah''s, ratified by Elohim (God) himself: *Cast out this bondwoman and her son: for the son of the bondwoman shall not be heir with the son of the freewoman* (Galatians 4:30, citing Genesis 21:10) — for *in Isaac shall thy seed be called* (Genesis 21:12), and the Hebrew library carries the same command, *Cast out this bondwoman and her son; for the son of this bondwoman will not be heir with my son, Isaac* (Jubilees 17:4). What is cast out is the spirit of flesh-earning, the bondwoman''s seed — never the Torah, which is the inheritance the freewoman''s son comes into. *So then, brethren, we are not children of the bondwoman, but of the free* (Galatians 4:31).',
       sv.verse_id, ev.verse_id, 'extras', 7284
  FROM _s223_g04_lookup sv, _s223_g04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=4 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='galatians' AND ev.chapter_number=4 AND ev.verse_number=31
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: galatians-4-in-the-fulness-of-the-time-god-sent-forth-his-son-made-under-the-law
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 49:10 — *the sceptre shall not depart from Yahudah (Judah)... until Shiloh come; and unto him shall the gathering of the people be* the fulness of time is Shiloh come, and his coming is the gathering (Galatians 4:4).'
  FROM cross_reference_threads t, cross_references x, _s223_g04_lookup sv, _s223_g04_lookup tv
 WHERE t.slug='galatians-4-in-the-fulness-of-the-time-god-sent-forth-his-son-made-under-the-law'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=4 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 7:14 — *a virgin shall conceive, and bear a son, and shall call his name Immanuel* the sign Yahuah (Lord) gave; the Son *made of a woman,* Elohim (God) with us, who has a Father and is made under the law (Galatians 4:4).'
  FROM cross_reference_threads t, cross_references x, _s223_g04_lookup sv, _s223_g04_lookup tv
 WHERE t.slug='galatians-4-in-the-fulness-of-the-time-god-sent-forth-his-son-made-under-the-law'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=4 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=7 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: galatians-4-the-adoption-of-sons-israel-my-firstborn-re-gathered
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 4:22 — *Yashar''el (Israel) is my son, even my firstborn* the adoption is the homecoming of the firstborn who was always a son, not the taking-in of strangers (Galatians 4:5).'
  FROM cross_reference_threads t, cross_references x, _s223_g04_lookup sv, _s223_g04_lookup tv
 WHERE t.slug='galatians-4-the-adoption-of-sons-israel-my-firstborn-re-gathered'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=4 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=4 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hosea 11:1 — *When Yashar''el (Israel) was a child, then I loved him, and called my son out of Egypt* the sonship is Yashar''el''s (Israel''s) from of old; the adoption gathers that same son home (Galatians 4:5).'
  FROM cross_reference_threads t, cross_references x, _s223_g04_lookup sv, _s223_g04_lookup tv
 WHERE t.slug='galatians-4-the-adoption-of-sons-israel-my-firstborn-re-gathered'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=4 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=11 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 31:9 — *I am a father to Yashar''el (Israel), and Ephraim is my firstborn* the scattered northern house, the firstborn, led home with weeping — the adoption is this return (Galatians 4:5).'
  FROM cross_reference_threads t, cross_references x, _s223_g04_lookup sv, _s223_g04_lookup tv
 WHERE t.slug='galatians-4-the-adoption-of-sons-israel-my-firstborn-re-gathered'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=4 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 9:4 — *to whom pertaineth the adoption... and the giving of the law* the same hand names whose the adoption is, and sets it beside the Torah, never against it (Galatians 4:5).'
  FROM cross_reference_threads t, cross_references x, _s223_g04_lookup sv, _s223_g04_lookup tv
 WHERE t.slug='galatians-4-the-adoption-of-sons-israel-my-firstborn-re-gathered'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=4 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=9 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Romans 8:15 — *ye have received the Spirit of adoption, whereby we cry, Abba, Father* the Spirit of the Son, the opposite of the spirit of bondage to the no-gods (Galatians 4:6).'
  FROM cross_reference_threads t, cross_references x, _s223_g04_lookup sv, _s223_g04_lookup tv
 WHERE t.slug='galatians-4-the-adoption-of-sons-israel-my-firstborn-re-gathered'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=4 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=8 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: galatians-4-the-weak-and-beggarly-elements-turning-back-to-the-no-gods
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 16:19 — *our fathers have inherited lies, vanity, and things wherein there is no profit* the confession of the scattered coming home; the inherited vanity is the service to the no-gods (Galatians 4:8).'
  FROM cross_reference_threads t, cross_references x, _s223_g04_lookup sv, _s223_g04_lookup tv
 WHERE t.slug='galatians-4-the-weak-and-beggarly-elements-turning-back-to-the-no-gods'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=4 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=16 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 16:20 — *Shall a man make gods unto himself, and they are no gods?* Paul''s exact charge: the elements served are no gods, and turning again to them is servitude to nothing (Galatians 4:8).'
  FROM cross_reference_threads t, cross_references x, _s223_g04_lookup sv, _s223_g04_lookup tv
 WHERE t.slug='galatians-4-the-weak-and-beggarly-elements-turning-back-to-the-no-gods'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=4 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=16 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 32:17 — *to gods whom they knew not, to new gods that came newly up* the song of Mosheh (Moses) names the bondage; to turn again to the elements is to return to those gods (Galatians 4:9).'
  FROM cross_reference_threads t, cross_references x, _s223_g04_lookup sv, _s223_g04_lookup tv
 WHERE t.slug='galatians-4-the-weak-and-beggarly-elements-turning-back-to-the-no-gods'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=4 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Leviticus 23:2 — *the feasts of Yahuah (LORD)... even these are my feasts* the counterweight: the appointed times are HIS, not the bondage; the days-and-months rebuked are the elements of the no-gods (Galatians 4:10).'
  FROM cross_reference_threads t, cross_references x, _s223_g04_lookup sv, _s223_g04_lookup tv
 WHERE t.slug='galatians-4-the-weak-and-beggarly-elements-turning-back-to-the-no-gods'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=4 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Zechariah 14:16 — *every one... of all the nations... shall even go up from year to year... to keep the feast of tabernacles* the appointed feast is kept by the nations in the reign — no bondage, but life (Galatians 4:10).'
  FROM cross_reference_threads t, cross_references x, _s223_g04_lookup sv, _s223_g04_lookup tv
 WHERE t.slug='galatians-4-the-weak-and-beggarly-elements-turning-back-to-the-no-gods'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=4 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=14 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: galatians-4-hagar-and-sarah-cast-out-the-bondwoman-the-barren-rejoicing
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 16:15 — *Hagar bare Abram a son... Ishmael* the son of the bondmaid, born after the flesh — the flesh-effort to secure the promise (Galatians 4:22-23).'
  FROM cross_reference_threads t, cross_references x, _s223_g04_lookup sv, _s223_g04_lookup tv
 WHERE t.slug='galatians-4-hagar-and-sarah-cast-out-the-bondwoman-the-barren-rejoicing'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=4 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=16 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 17:19 — *Sarah thy wife shall bear thee a son indeed... an everlasting covenant* the son of the freewoman by promise; the covenant established with the child of promise (Galatians 4:23).'
  FROM cross_reference_threads t, cross_references x, _s223_g04_lookup sv, _s223_g04_lookup tv
 WHERE t.slug='galatians-4-hagar-and-sarah-cast-out-the-bondwoman-the-barren-rejoicing'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=4 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 21:2 — *Sarah... bare Abraham a son... at the set time of which Elohim (God) had spoken* the promise keeps the appointed clock, as the Son came in the fulness of the time (Galatians 4:23).'
  FROM cross_reference_threads t, cross_references x, _s223_g04_lookup sv, _s223_g04_lookup tv
 WHERE t.slug='galatians-4-hagar-and-sarah-cast-out-the-bondwoman-the-barren-rejoicing'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=4 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=21 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 16:12 — *at the time of which Yahuah (God) had spoken... on the festival of the first-fruits of the harvest, Isaac was born* the promise-child born on an appointed feast of the Most High (Galatians 4:23).'
  FROM cross_reference_threads t, cross_references x, _s223_g04_lookup sv, _s223_g04_lookup tv
 WHERE t.slug='galatians-4-hagar-and-sarah-cast-out-the-bondwoman-the-barren-rejoicing'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=4 AND sv.verse_number=23
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=16 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Isaiah 54:1 — *Rejoice... thou that didst not bear... more are the children of the desolate* the free Jerusalem above is the barren rejoicing; the desolate''s many children are the scattered restored (Galatians 4:26-27).'
  FROM cross_reference_threads t, cross_references x, _s223_g04_lookup sv, _s223_g04_lookup tv
 WHERE t.slug='galatians-4-hagar-and-sarah-cast-out-the-bondwoman-the-barren-rejoicing'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=4 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=54 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Jasher 21:15 — *Cast out this bondwoman and her son, for her son shall not be heir with my son* the Hebrew record of the persecution and the casting-out Paul names (Galatians 4:29-30).'
  FROM cross_reference_threads t, cross_references x, _s223_g04_lookup sv, _s223_g04_lookup tv
 WHERE t.slug='galatians-4-hagar-and-sarah-cast-out-the-bondwoman-the-barren-rejoicing'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=4 AND sv.verse_number=30
   AND tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=21 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Genesis 21:10 — *Cast out this bondwoman and her son: for the son of this bondwoman shall not be heir... with Isaac* Paul cites Sarah''s words exactly; the flesh-earning is expelled, never the Torah (Galatians 4:30).'
  FROM cross_reference_threads t, cross_references x, _s223_g04_lookup sv, _s223_g04_lookup tv
 WHERE t.slug='galatians-4-hagar-and-sarah-cast-out-the-bondwoman-the-barren-rejoicing'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=4 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=21 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 8, E'Genesis 21:12 — *in Isaac shall thy seed be called* Elohim (God) himself ratifies the casting-out; the inheritance runs through the child of promise (Galatians 4:30).'
  FROM cross_reference_threads t, cross_references x, _s223_g04_lookup sv, _s223_g04_lookup tv
 WHERE t.slug='galatians-4-hagar-and-sarah-cast-out-the-bondwoman-the-barren-rejoicing'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=4 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=21 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 9, E'Jubilees 17:4 — *Cast out this bondwoman and her son; for the son of this bondwoman will not be heir with my son, Isaac* the Hebrew library carries the command almost as Paul cites it (Galatians 4:30).'
  FROM cross_reference_threads t, cross_references x, _s223_g04_lookup sv, _s223_g04_lookup tv
 WHERE t.slug='galatians-4-hagar-and-sarah-cast-out-the-bondwoman-the-barren-rejoicing'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=4 AND sv.verse_number=30
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=17 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_galatians_05.sql (S223 Galatians 5) -----
-- =====================================================================
-- S223 minion — GALATIANS 5 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: GALATIANS 5 (26 verses).  Tag: g05 (temp view _s223_g05_lookup).
-- Sort band: floor 7300, step 3 (7300, 7303, 7306, 7309, 7312 used; under 7325).
-- Source is ALWAYS the canon Galatians verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (THE SINGLE HIGHEST VOICE-RISK BOOK — "The Galatians Lie" terrain;
-- Red Lines #4/#5/#6/#7/#10 all live):
-- The Galatians are the SCATTERED LOST SHEEP of Yashar'el (Israel) — covenant seed living among the
-- nations, memory dimmed by exile — whom Paul is bringing HOME, NOT pagans who never had Torah. The
-- agitators preached the Pharisee proselyte gospel (*Except ye be circumcised after the manner of
-- Moses, ye cannot be saved*, Acts 15:1): become-a-Jew-through-flesh-ritual-and-be-saved. The whole
-- chapter answers THAT lie — not Torah, not circumcision-as-such (Paul circumcised Timothy, Acts
-- 16:3), but flesh-credential-as-the-doorway. Grace and Torah stand together: the same Ruach
-- (Spirit) who leads is the Spirit who spoke at Sinai and writes Torah on the heart (Ezekiel 36:27,
-- Jeremiah 31:33). The HIDDEN TORAH-AFFIRMING verses, handled exactly to the frame:
--   * 5:1 *Stand fast therefore in the liberty wherewith Messiah hath made us free* — liberty =
--     freedom from the curse of exile and the flesh-credential bondage, NOT freedom from Torah; the
--     *yoke of bondage* is the agitators' earn-your-standing system, not the covenant.
--   * 5:3 *a debtor to do the whole law* = HIDDEN TORAH-AFFIRMING. The issue is taking circumcision
--     AS the flesh-credential ENTRY into the agitators' performance-system — which would bind a man
--     to earn standing by that whole system — NOT Torah-as-life. The live circumcision politics are
--     the 1 Maccabees apostasy (men who *made themselves uncircumcised* to please the nations, then
--     the forced re-circumcision) — the flesh-mark wielded as a covenant-standing credential.
--   * 5:4 *whosoever of you are justified by the law; ye are fallen from grace* = those seeking the
--     flesh-credential justification have fallen from the grace that brings them home — NOT a
--     warning against Torah-keeping. Justification is by faith/promise; covenant life is Torah.
--   * 5:6 *faith which worketh by love* — faith expressed in love IS the Torah-life (the love-command).
--   * 5:9 *a little leaven leaveneth the whole lump* — the agitators' doctrine as leaven; pair the
--     unleavened-bread command (Exodus 12:15) and 1 Corinthians 5:6-8 (*keep the feast... with the
--     unleavened bread of sincerity and truth*) — the festival kept, not abolished.
--   * 5:13-14 *by love serve one another. For all the law is fulfilled in one word... Thou shalt
--     love thy neighbour as thyself* (Leviticus 19:18) = HIDDEN TORAH-AFFIRMING — Paul CITES the
--     Torah command; fulfil (pleroo) = fill full, uphold, NOT abolish. Pair Deuteronomy 6:5,
--     Matthew 22:37-40, Romans 13:8-10.
--   * 5:18 *if ye be led of the Spirit, ye are not under the law* = not under the law's
--     CONDEMNATION / curse-sentence; the Spirit who leads is the Spirit who wrote Torah on the heart
--     (Ezekiel 36:27, Jeremiah 31:33) — NEVER freedom from Torah. The very next breath lists the
--     works of the flesh (5:19-21 = Torah's OWN prohibitions) and the fruit of the Spirit.
--   * 5:23 *against such there is no law* = HIDDEN TORAH-AFFIRMING — the fruit of the Spirit IS the
--     Torah-life; no law of Yahuah (LORD) stands against love, joy, peace, longsuffering.
-- The default trained reading — grace-against-law, Torah-abolished, freedom-from-the-commandments —
-- is the antichrist reading this apparatus exists to dismantle; it surfaces nowhere below.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every meaningful verse-block):
--   v.1     Stand fast in the liberty; the yoke of bondage
--           Tanakh: Ezekiel 36:27 (the Spirit causing the walk in the statutes — the liberty that
--                   returns home)  Extras: 1 Maccabees 1:11-15 (the apostate covenant with the
--                   heathen — the bondage from which liberty frees) NT: none added (carried in prose)
--   v.2-4   circumcision-as-credential; a debtor to do the whole law; fallen from grace
--           Tanakh: Exodus 12:48 (the circumcised stranger keeping passover — circumcision as
--                   covenant entry, NOT credential)  Extras: 1 Maccabees 1:15 (made themselves
--                   uncircumcised, forsook the covenant), 1:48 (leave children uncircumcised /
--                   forget the law), 2:46 (forced re-circumcision) — the flesh-mark as politics
--           NT: none warranted separately (Galatians 5:6 carried at v.6-9 thread)
--   v.5-6   wait for the hope of righteousness by faith; faith which worketh by love
--           Tanakh: (love-command carried at v.13-14)  Extras: none warranted
--           NT: none warranted separately (the working-by-love is the love-command thread)
--   v.7-12  ye did run well; a little leaven leaveneth the whole lump; he that troubleth you
--           Tanakh: Exodus 12:15 (put away leaven / cut off — the unleavened command)
--           Extras: none warranted  NT: 1 Corinthians 5:6 (the same proverb), 5:7 (purge the old
--                   leaven, Messiah our passover), 5:8 (keep the feast with unleavened sincerity)
--   v.13-14 by love serve one another; all the law fulfilled in one word — love thy neighbour
--           Tanakh: Leviticus 19:18 (*love thy neighbour as thyself*), Deuteronomy 6:5 (love Yahuah
--                   with all the heart)  Extras: none warranted  NT: Matthew 22:37-40 (the two
--                   commandments on which hang all the law and the prophets), Romans 13:8 (he that
--                   loveth hath fulfilled the law), Romans 13:9 (comprehended in this saying),
--                   Romans 13:10 (love is the fulfilling of the law)
--   v.15-17 bite and devour; walk in the Spirit; flesh against Spirit
--           Tanakh: (the Spirit-walk carried at v.18-23)  Extras: none warranted  NT: none warranted
--   v.18-23 led of the Spirit, not under the law; the works of the flesh; the fruit of the Spirit;
--           against such there is no law
--           Tanakh: Ezekiel 36:27 (the Spirit causing the walk in the statutes), Jeremiah 31:33
--                   (Torah written on the heart) — the Spirit who leads is the Spirit who wrote
--                   Torah; Leviticus 19:18 (the love that is the fruit, against which no law stands)
--           Extras: none warranted  NT: none warranted (Romans 13 carried at v.13-14)
--   v.24-26 crucified the flesh; live in the Spirit, walk in the Spirit
--           Tanakh: none warranted (gathered into the Spirit-walk thread)  Extras/NT: none warranted
--
-- THREADS (slug -> target libraries):
--   7300 galatians-5-stand-fast-in-the-liberty-and-be-not-entangled-with-the-yoke-of-bondage-ezekiel-36 (Tanakh + Extras)
--   7303 galatians-5-a-debtor-to-do-the-whole-law-circumcision-as-the-flesh-credential-doorway          (Tanakh + Extras)
--   7306 galatians-5-a-little-leaven-leaveneth-the-whole-lump-purge-out-the-old-leaven-1-corinthians-5   (Tanakh + NT)
--   7309 galatians-5-all-the-law-is-fulfilled-in-one-word-thou-shalt-love-thy-neighbour-leviticus-19     (Tanakh + NT)
--   7312 galatians-5-led-of-the-spirit-the-fruit-against-which-there-is-no-law-ezekiel-36-jeremiah-31    (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s223_g05_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: galatians-5-stand-fast-in-the-liberty-and-be-not-entangled-with-the-yoke-of-bondage-ezekiel-36
  ('canon', 'galatians', 5, 1, 'canon', 'ezekiel', 36, 27, 'free', E'*And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them.* (Ezekiel 36:27). The liberty into which Messiah (Christ) sets the scattered seed free is the very freedom Yahuah (LORD) promised through the prophet — not freedom from his statutes, but the Ruach HaKodesh (Holy Spirit) placed within so they can at last *walk in my statutes* and *keep my judgments, and do them.* *Stand fast therefore in the liberty wherewith Messiah (Christ) hath made us free, and be not entangled again with the yoke of bondage* (Galatians 5:1): the liberty is the homecoming, the Spirit-enabled life of obedience, not its undoing.'),
  ('canon', 'galatians', 5, 1, 'apocrypha', '1-maccabees', 1, 15, 'extras', E'*And made themselves uncircumcised, and forsook the holy covenant, and joined themselves to the heathen, and were sold to do mischief.* (1 Maccabees 1:15). The Hebrew record names the *yoke of bondage* exactly: apostate men of Yashar''el (Israel) who undid the covenant mark to please the nations, *forsook the holy covenant,* and *were sold to do mischief* — the flesh wielded as a credential of standing, sold into servitude to the spirit of the age. *Be not entangled again with the yoke of bondage* (Galatians 5:1): Paul will not have the returning sheep handle the covenant the way the apostates handled it — as flesh-politics rather than the way home.'),
  -- thread: galatians-5-a-debtor-to-do-the-whole-law-circumcision-as-the-flesh-credential-doorway
  ('canon', 'galatians', 5, 3, 'apocrypha', '1-maccabees', 1, 48, 'extras', E'*That they should also leave their children uncircumcised, and make their souls abominable with all manner of uncleanness and profanation:* (1 Maccabees 1:48). The decree of Antiochus joined two things at once — *leave their children uncircumcised* and, in the next breath, *to the end they might forget the law, and change all the ordinances* (1 Maccabees 1:49). Circumcision in that war was never a bare surgery; it was the doorway-mark of the whole covenant life. *For I testify again to every man that is circumcised, that he is a debtor to do the whole law* (Galatians 5:3): taking the mark as the agitators preach it — as the flesh-credential by which a man earns covenant standing — would bind him to that entire performance-system, the very trap Paul is sparing the returning seed.'),
  ('canon', 'galatians', 5, 3, 'apocrypha', '1-maccabees', 2, 46, 'extras', E'*And what children soever they found within the coast of Yashar''el (Israel) uncircumcised, those they circumcised valiantly.* (1 Maccabees 2:46). The zealots of Mattathias went through the land forcing the covenant mark by the sword — circumcision turned into a weapon of party-loyalty and standing. This is the live politics behind the agitators. *That he is a debtor to do the whole law* (Galatians 5:3): when the flesh-mark is made the doorway-credential a man takes ON to be counted in, he is bound to the whole earn-your-place system — and that, not Torah-as-life, is what Paul resists.'),
  ('canon', 'galatians', 5, 4, 'apocrypha', '1-maccabees', 1, 11, 'extras', E'*In those days went there out of Yashar''el (Israel) wicked men, who persuaded many, saying, Let us go and make a covenant with the heathen that are round about us: for since we departed from them we have had much sorrow.* (1 Maccabees 1:11). Here is the pattern of falling from grace: men who sought their standing by a flesh-arrangement of their own devising — *let us go and make a covenant with the heathen* — and so departed from the grace that had kept them. *Messiah (Christ) is become of no effect unto you, whosoever of you are justified by the law; ye are fallen from grace* (Galatians 5:4): those who seek to be *justified by the law* as the agitators mean it — the flesh-credential justification — let go the grace that was bringing them home, just as the apostates did.'),
  ('canon', 'galatians', 5, 6, 'canon', 'exodus', 12, 48, 'free', E'*And when a stranger shall sojourn with thee, and will keep the passover to Yahuah (LORD), let all his males be circumcised, and then let him come near and keep it; and he shall be as one that is born in the land: for no uncircumcised person shall eat thereof.* (Exodus 12:48). Circumcision in Torah was the door of covenant belonging — the sojourner circumcised *shall be as one that is born in the land.* It was never the credential by which a man earns righteousness, only the sign of the home he has entered. *In Yahusha HaMashiach (Jesus Christ) neither circumcision availeth any thing, nor uncircumcision; but faith which worketh by love* (Galatians 5:6): the mark cannot purchase standing on either side of it — what avails is the faith that lives itself out in the love-command.'),
  -- thread: galatians-5-a-little-leaven-leaveneth-the-whole-lump-purge-out-the-old-leaven-1-corinthians-5
  ('canon', 'galatians', 5, 9, 'canon', 'exodus', 12, 15, 'free', E'*Seven days shall ye eat unleavened bread; even the first day ye shall put away leaven out of your houses: for whosoever eateth leavened bread from the first day until the seventh day, that soul shall be cut off from Yashar''el (Israel).* (Exodus 12:15). The proverb draws its force straight from the feast Yahuah (LORD) commanded: leaven, once in the lump, works through the whole, so it must be *put away* utterly. *A little leaven leaveneth the whole lump* (Galatians 5:9): the agitators'' doctrine is the leaven — a small false teaching that, left in, sours the entire gathering, exactly as the smallest crumb of leaven would the unleavened house.'),
  ('canon', 'galatians', 5, 9, 'canon', '1-corinthians', 5, 6, 'free', E'*Your glorying is not good. Know ye not that a little leaven leaveneth the whole lump?* (1 Corinthians 5:6). Paul uses the same proverb to the same end in both letters — a single corrupting thing spreads through the whole body. *A little leaven leaveneth the whole lump* (Galatians 5:9): the figure is one and the same, and in Corinth he completes it with the feast itself.'),
  ('canon', 'galatians', 5, 9, 'canon', '1-corinthians', 5, 7, 'free', E'*Purge out therefore the old leaven, that ye may be a new lump, as ye are unleavened. For even Messiah (Christ) our passover is sacrificed for us:* (1 Corinthians 5:7). The answer to leaven is to *purge it out* — and the ground of the purging is that *Messiah (Christ) our passover is sacrificed for us.* *A little leaven leaveneth the whole lump* (Galatians 5:9): the same hand that names the leaven in Galatia tells the Corinthians how to be rid of it, and roots the whole figure in the passover lamb.'),
  ('canon', 'galatians', 5, 9, 'canon', '1-corinthians', 5, 8, 'free', E'*Therefore let us keep the feast, not with old leaven, neither with the leaven of malice and wickedness; but with the unleavened bread of sincerity and truth.* (1 Corinthians 5:8). The feast is not abolished but kept — *let us keep the feast* — only purged of the leaven of malice and false doctrine. *A little leaven leaveneth the whole lump* (Galatians 5:9): the leaven Paul warns against in Galatia is the same leaven of *malice and wickedness* he bids the Corinthians sweep out, that the appointed feast may be kept *with the unleavened bread of sincerity and truth.*'),
  -- thread: galatians-5-all-the-law-is-fulfilled-in-one-word-thou-shalt-love-thy-neighbour-leviticus-19
  ('canon', 'galatians', 5, 14, 'canon', 'leviticus', 19, 18, 'free', E'*Thou shalt not avenge, nor bear any grudge against the children of thy people, but thou shalt love thy neighbour as thyself: I am Yahuah (LORD).* (Leviticus 19:18). Paul does not set the love-command against the Torah — he quotes the Torah, word for word. *For all the law is fulfilled in one word, even in this; Thou shalt love thy neighbour as thyself* (Galatians 5:14): the *one word* in which all the law is fulfilled is itself a verse of the law, sealed *I am Yahuah (LORD).* To fulfil the law is to fill it full in love, not to do away with it.'),
  ('canon', 'galatians', 5, 13, 'canon', 'deuteronomy', 6, 5, 'free', E'*And thou shalt love Yahuah Elohayka (the LORD thy God) with all thine heart, and with all thy soul, and with all thy might.* (Deuteronomy 6:5). The love that serves is no novelty; it is the first and great command of the Shema. *By love serve one another* (Galatians 5:13): the liberty into which the seed is called is not licence — *only use not liberty for an occasion to the flesh* — but the freedom to do the very thing Torah commands, to love Yahuah (LORD) wholly and one''s neighbour as oneself.'),
  ('canon', 'galatians', 5, 14, 'canon', 'matthew', 22, 39, 'free', E'*And the second is like unto it, Thou shalt love thy neighbour as thyself.* (Matthew 22:39). Yahusha (Jesus) had already named this very verse the second great commandment, joined to the first — *On these two commandments hang all the law and the prophets* (Matthew 22:40). *For all the law is fulfilled in one word, even in this; Thou shalt love thy neighbour as thyself* (Galatians 5:14): Paul stands exactly where his Master stood. The whole law hangs on love, and love does not loose the law but holds it up.'),
  ('canon', 'galatians', 5, 14, 'canon', 'romans', 13, 8, 'free', E'*Owe no man any thing, but to love one another: for he that loveth another hath fulfilled the law.* (Romans 13:8). The same apostle teaches the same thing elsewhere: love is not the abolishing of the law but the fulfilling of it — *he that loveth another hath fulfilled the law.* *For all the law is fulfilled in one word, even in this; Thou shalt love thy neighbour as thyself* (Galatians 5:14): Galatians and Romans speak with one voice, and neither lets *fulfilled* mean *finished and discarded.*'),
  ('canon', 'galatians', 5, 14, 'canon', 'romans', 13, 9, 'free', E'*For this, Thou shalt not commit adultery, Thou shalt not kill, Thou shalt not steal, Thou shalt not bear false witness, Thou shalt not covet; and if there be any other commandment, it is briefly comprehended in this saying, namely, Thou shalt love thy neighbour as thyself.* (Romans 13:9). Paul lists the commandments of the second table and gathers them up — not cancelled, but *briefly comprehended* — in the same verse he cites in Galatia. *For all the law is fulfilled in one word, even in this; Thou shalt love thy neighbour as thyself* (Galatians 5:14): the commandments are upheld and summed in love, every one of them still standing within the *one word.*'),
  ('canon', 'galatians', 5, 14, 'canon', 'romans', 13, 10, 'free', E'*Love worketh no ill to his neighbour: therefore love is the fulfilling of the law.* (Romans 13:10). The conclusion is plain in both letters: *love is the fulfilling of the law.* *For all the law is fulfilled in one word, even in this; Thou shalt love thy neighbour as thyself* (Galatians 5:14): love does the law''s own work, *worketh no ill,* and so fills full what the law requires — the fulfilling of the law, never the ending of it.'),
  -- thread: galatians-5-led-of-the-spirit-the-fruit-against-which-there-is-no-law-ezekiel-36-jeremiah-31
  ('canon', 'galatians', 5, 18, 'canon', 'ezekiel', 36, 27, 'free', E'*And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them.* (Ezekiel 36:27). The Ruach (Spirit) who leads is the very Spirit Yahuah (LORD) promised to put within his people — and the express purpose of that Spirit is to *cause you to walk in my statutes... and do them.* *But if ye be led of the Spirit, ye are not under the law* (Galatians 5:18): to be led of this Spirit is not to be loosed from Torah but to be carried into it; *not under the law* means no longer under its condemnation and curse, walking instead in the Spirit who wrote the statutes on the heart.'),
  ('canon', 'galatians', 5, 18, 'canon', 'jeremiah', 31, 33, 'free', E'*But this shall be the covenant that I will make with the house of Yashar''el (Israel); After those days, saith Yahuah (LORD), I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people.* (Jeremiah 31:33). The new covenant is not a covenant without Torah but Torah moved inward — *I will put my law in their inward parts, and write it in their hearts.* *But if ye be led of the Spirit, ye are not under the law* (Galatians 5:18): the Spirit''s leading is the writing of the law on the heart, so that the one led of the Spirit keeps it from within, not the one set free from it.'),
  ('canon', 'galatians', 5, 23, 'canon', 'leviticus', 19, 18, 'free', E'*Thou shalt not avenge, nor bear any grudge against the children of thy people, but thou shalt love thy neighbour as thyself: I am Yahuah (LORD).* (Leviticus 19:18). The fruit of the Spirit — *love, joy, peace, longsuffering* — is the very life the law commands; the law of Yahuah (LORD) nowhere forbids love of neighbour, but commands it. *Against such there is no law* (Galatians 5:23): no commandment of the Torah stands against the fruit of the Spirit, because the fruit of the Spirit IS the Torah-life borne out — the love the law itself enjoins.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s223_g05_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s223_g05_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'galatians-5-stand-fast-in-the-liberty-and-be-not-entangled-with-the-yoke-of-bondage-ezekiel-36',
       E'Stand fast in the liberty — and be not entangled with the yoke of bondage (Ezekiel 36)',
       E'The chapter opens on a word that the inherited reading turns into freedom-from-the-commandments, and the turning misses what the liberty is and what the bondage is. *Stand fast therefore in the liberty wherewith Messiah (Christ) hath made us free, and be not entangled again with the yoke of bondage* (Galatians 5:1). The liberty is the homecoming of the scattered seed — freedom from the curse of exile and from the flesh-credential trap of the agitators — and it is the very freedom Yahuah (LORD) promised through the prophet: *I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them* (Ezekiel 36:27). The Spirit-given liberty is the power to walk in the statutes at last, not a release from them. And the *yoke of bondage* is no description of the Torah; it is the way the apostates handled the covenant — as flesh-politics. The Hebrew record names it: *In those days went there out of Yashar''el (Israel) wicked men, who persuaded many, saying, Let us go and make a covenant with the heathen that are round about us* (1 Maccabees 1:11), who *made themselves uncircumcised, and forsook the holy covenant, and joined themselves to the heathen, and were sold to do mischief* (1 Maccabees 1:15). That is bondage — the flesh wielded as a credential of standing, the covenant traded for the favour of the nations. Paul will not have the returning sheep entangled in it again. The liberty stands them upright to walk; the yoke they are to refuse is the earn-your-place system, never the way home.',
       sv.verse_id, ev.verse_id, 'extras', 7300
  FROM _s223_g05_lookup sv, _s223_g05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=5 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='galatians' AND ev.chapter_number=5 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'galatians-5-a-debtor-to-do-the-whole-law-circumcision-as-the-flesh-credential-doorway',
       E'A debtor to do the whole law — circumcision as the flesh-credential doorway',
       E'These are the verses the inherited reading hears as Paul against the covenant mark and against the law, and the hearing misses what is actually in dispute. *Behold, I Paul say unto you, that if ye be circumcised, Messiah (Christ) shall profit you nothing* (Galatians 5:2). *For I testify again to every man that is circumcised, that he is a debtor to do the whole law* (Galatians 5:3). *Messiah (Christ) is become of no effect unto you, whosoever of you are justified by the law; ye are fallen from grace* (Galatians 5:4). The man Paul has in view is the one taking circumcision the way the agitators preach it — as the flesh-credential ENTRY into their performance-system, the doorway by which a man earns covenant standing (*Except ye be circumcised after the manner of Moses, ye cannot be saved*, Acts 15:1). To take the mark on those terms is to make oneself *a debtor to do the whole law* as a system of earning — bound to purchase standing by performance, with Messiah (Christ) profiting nothing, because standing was never bought, only received. This is not Paul against Torah; he circumcised Timothy (Acts 16:3). It is Paul against the mark-as-credential. The live politics are plain in the Hebrew record: the apostates who *made themselves uncircumcised, and forsook the holy covenant* (1 Maccabees 1:15); the decree that they *leave their children uncircumcised* to the end that *they might forget the law* (1 Maccabees 1:48-49); and the counter-zeal that *what children soever they found... uncircumcised, those they circumcised valiantly* (1 Maccabees 2:46) — the flesh-mark made a weapon of party-standing. And *fallen from grace* (5:4) follows the same shape as those who *make a covenant with the heathen* of their own devising (1 Maccabees 1:11): to seek justification by the flesh-credential is to let go the grace that was bringing the seed home. Torah-as-life is not in the dock here — only Torah turned into a doorway-credential for earning a place.',
       sv.verse_id, ev.verse_id, 'extras', 7303
  FROM _s223_g05_lookup sv, _s223_g05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=5 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='galatians' AND ev.chapter_number=5 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'galatians-5-a-little-leaven-leaveneth-the-whole-lump-purge-out-the-old-leaven-1-corinthians-5',
       E'A little leaven leaveneth the whole lump — purge out the old leaven (1 Corinthians 5)',
       E'The proverb is one Paul uses in two letters, and both times he draws it straight from the feast Yahuah (LORD) commanded. *A little leaven leaveneth the whole lump* (Galatians 5:9): the agitators'' doctrine is the leaven — a small false teaching that, left in, works through the whole gathering. The figure is the unleavened-bread command itself: *Seven days shall ye eat unleavened bread; even the first day ye shall put away leaven out of your houses: for whosoever eateth leavened bread... that soul shall be cut off from Yashar''el (Israel)* (Exodus 12:15) — leaven once in the lump spreads through it all, so it must be put away utterly. To the Corinthians Paul speaks the very same proverb and completes it: *Know ye not that a little leaven leaveneth the whole lump?* (1 Corinthians 5:6); *Purge out therefore the old leaven, that ye may be a new lump, as ye are unleavened. For even Messiah (Christ) our passover is sacrificed for us* (1 Corinthians 5:7); *Therefore let us keep the feast, not with old leaven, neither with the leaven of malice and wickedness; but with the unleavened bread of sincerity and truth* (1 Corinthians 5:8). Mark what he does not say — he does not say the feast is abolished. He says *let us keep the feast,* only purged of the leaven of false doctrine and malice. The same leaven Paul warns against in Galatia is the leaven the Corinthians are to sweep out, that the appointed feast may be kept with sincerity and truth, the passover lamb its ground.',
       sv.verse_id, ev.verse_id, 'free', 7306
  FROM _s223_g05_lookup sv, _s223_g05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=5 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='galatians' AND ev.chapter_number=5 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'galatians-5-all-the-law-is-fulfilled-in-one-word-thou-shalt-love-thy-neighbour-leviticus-19',
       E'All the law is fulfilled in one word — Thou shalt love thy neighbour as thyself (Leviticus 19)',
       E'Here is one of the hidden Torah-affirming verses of the whole letter, and it is hidden in plain sight: Paul upholds the law by quoting it. *For, brethren, ye have been called unto liberty; only use not liberty for an occasion to the flesh, but by love serve one another* (Galatians 5:13). *For all the law is fulfilled in one word, even in this; Thou shalt love thy neighbour as thyself* (Galatians 5:14). The *one word* in which all the law is fulfilled is itself a verse of the law: *thou shalt love thy neighbour as thyself: I am Yahuah (LORD)* (Leviticus 19:18). And the love that serves is no novelty either — it is the first command of the Shema, *thou shalt love Yahuah Elohayka (the LORD thy God) with all thine heart, and with all thy soul, and with all thy might* (Deuteronomy 6:5). To *fulfil* the law (pleroo) is to fill it full, to bring it to its fullness in love — never to abolish it. Paul stands exactly where his Master stood: Yahusha (Jesus) named this very verse the second great commandment, *Thou shalt love thy neighbour as thyself* (Matthew 22:39), and *On these two commandments hang all the law and the prophets* (Matthew 22:40). And the same apostle teaches the same thing in Romans: *he that loveth another hath fulfilled the law* (Romans 13:8); the commandments *Thou shalt not commit adultery, Thou shalt not kill, Thou shalt not steal...* are *briefly comprehended in this saying, namely, Thou shalt love thy neighbour as thyself* (Romans 13:9); *love is the fulfilling of the law* (Romans 13:10). Not one of these lets *fulfilled* mean *finished and discarded.* Love does the law''s own work, works no ill to the neighbour, and so fills full everything the law requires. The liberty into which the seed is called is freedom to do the very thing Torah commands.',
       sv.verse_id, ev.verse_id, 'free', 7309
  FROM _s223_g05_lookup sv, _s223_g05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=5 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='galatians' AND ev.chapter_number=5 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'galatians-5-led-of-the-spirit-the-fruit-against-which-there-is-no-law-ezekiel-36-jeremiah-31',
       E'Led of the Spirit, not under the law — the fruit against which there is no law (Ezekiel 36, Jeremiah 31)',
       E'This is among the most wrested verses in the letter, and the wresting turns the Spirit against the Torah the Spirit himself gave. *But if ye be led of the Spirit, ye are not under the law* (Galatians 5:18). The Ruach (Spirit) who leads is no stranger to the commandments — he is the very Spirit Yahuah (LORD) promised to put within his people, *and cause you to walk in my statutes, and ye shall keep my judgments, and do them* (Ezekiel 36:27). His express work is to carry the heart INTO the statutes, not away from them. He is the Spirit of the new covenant, in which Torah is not removed but moved inward: *I will put my law in their inward parts, and write it in their hearts* (Jeremiah 31:33). So *not under the law* cannot mean loosed from Torah; it means no longer under the law''s condemnation and curse-sentence, walking instead in the Spirit who wrote the law on the heart. And the very next breath proves it, for what Paul lists as *the works of the flesh* — *Adultery, fornication, uncleanness... Idolatry, witchcraft, hatred... murders, drunkenness* (Galatians 5:19-21) — are Torah''s own prohibitions, the things the commandments forbid. Then comes the fruit of the Spirit: *love, joy, peace, longsuffering, gentleness, goodness, faith, Meekness, temperance: against such there is no law* (Galatians 5:22-23). That closing line is itself a hidden Torah-affirming word — *against such there is no law.* No commandment of Yahuah (LORD) stands against love or joy or peace, because the fruit of the Spirit IS the Torah-life borne out; the love that crowns the fruit is the very thing the law commands, *thou shalt love thy neighbour as thyself: I am Yahuah (LORD)* (Leviticus 19:18). The Spirit who leads, the heart on which the law is written, the fruit against which no law stands — all one. To walk in the Spirit is to live the law from within.',
       sv.verse_id, ev.verse_id, 'free', 7312
  FROM _s223_g05_lookup sv, _s223_g05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=5 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='galatians' AND ev.chapter_number=5 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: galatians-5-stand-fast-in-the-liberty-and-be-not-entangled-with-the-yoke-of-bondage-ezekiel-36
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 36:27 — *I will put my spirit within you, and cause you to walk in my statutes* the liberty Messiah gives is the Spirit-enabled walk in the statutes, the homecoming, not freedom from them (Galatians 5:1).'
  FROM cross_reference_threads t, cross_references x, _s223_g05_lookup sv, _s223_g05_lookup tv
 WHERE t.slug='galatians-5-stand-fast-in-the-liberty-and-be-not-entangled-with-the-yoke-of-bondage-ezekiel-36'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=5 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Maccabees 1:15 — *made themselves uncircumcised, and forsook the holy covenant... and were sold to do mischief* the *yoke of bondage* named: the covenant traded for the favour of the nations, the flesh as credential (Galatians 5:1).'
  FROM cross_reference_threads t, cross_references x, _s223_g05_lookup sv, _s223_g05_lookup tv
 WHERE t.slug='galatians-5-stand-fast-in-the-liberty-and-be-not-entangled-with-the-yoke-of-bondage-ezekiel-36'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=5 AND sv.verse_number=1
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=1 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: galatians-5-a-debtor-to-do-the-whole-law-circumcision-as-the-flesh-credential-doorway
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Maccabees 1:48 — *leave their children uncircumcised... to the end they might forget the law* circumcision and the whole covenant life were one; the mark as doorway to all the ordinances (Galatians 5:3).'
  FROM cross_reference_threads t, cross_references x, _s223_g05_lookup sv, _s223_g05_lookup tv
 WHERE t.slug='galatians-5-a-debtor-to-do-the-whole-law-circumcision-as-the-flesh-credential-doorway'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=5 AND sv.verse_number=3
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=1 AND tv.verse_number=48
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Maccabees 2:46 — *what children soever they found... uncircumcised, those they circumcised valiantly* the flesh-mark made a weapon of party-standing — the live politics behind *a debtor to do the whole law* (Galatians 5:3).'
  FROM cross_reference_threads t, cross_references x, _s223_g05_lookup sv, _s223_g05_lookup tv
 WHERE t.slug='galatians-5-a-debtor-to-do-the-whole-law-circumcision-as-the-flesh-credential-doorway'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=5 AND sv.verse_number=3
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=2 AND tv.verse_number=46
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Maccabees 1:11 — *Let us go and make a covenant with the heathen* the shape of falling from grace: seeking standing by a flesh-arrangement, letting go the grace that kept them (Galatians 5:4).'
  FROM cross_reference_threads t, cross_references x, _s223_g05_lookup sv, _s223_g05_lookup tv
 WHERE t.slug='galatians-5-a-debtor-to-do-the-whole-law-circumcision-as-the-flesh-credential-doorway'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=5 AND sv.verse_number=4
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=1 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Exodus 12:48 — *let all his males be circumcised... and he shall be as one that is born in the land* circumcision as the door of covenant belonging, never the credential that purchases standing (Galatians 5:6).'
  FROM cross_reference_threads t, cross_references x, _s223_g05_lookup sv, _s223_g05_lookup tv
 WHERE t.slug='galatians-5-a-debtor-to-do-the-whole-law-circumcision-as-the-flesh-credential-doorway'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=5 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=48
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: galatians-5-a-little-leaven-leaveneth-the-whole-lump-purge-out-the-old-leaven-1-corinthians-5
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 12:15 — *ye shall put away leaven out of your houses... cut off from Yashar''el (Israel)* the unleavened command the proverb draws from: leaven once in the lump works through it all (Galatians 5:9).'
  FROM cross_reference_threads t, cross_references x, _s223_g05_lookup sv, _s223_g05_lookup tv
 WHERE t.slug='galatians-5-a-little-leaven-leaveneth-the-whole-lump-purge-out-the-old-leaven-1-corinthians-5'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=5 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Corinthians 5:6 — *Know ye not that a little leaven leaveneth the whole lump?* the same proverb in Paul''s hand, a single corrupting thing spreading through the whole body (Galatians 5:9).'
  FROM cross_reference_threads t, cross_references x, _s223_g05_lookup sv, _s223_g05_lookup tv
 WHERE t.slug='galatians-5-a-little-leaven-leaveneth-the-whole-lump-purge-out-the-old-leaven-1-corinthians-5'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=5 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=5 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Corinthians 5:7 — *Purge out therefore the old leaven... Messiah (Christ) our passover is sacrificed for us* the answer to leaven, rooted in the passover lamb (Galatians 5:9).'
  FROM cross_reference_threads t, cross_references x, _s223_g05_lookup sv, _s223_g05_lookup tv
 WHERE t.slug='galatians-5-a-little-leaven-leaveneth-the-whole-lump-purge-out-the-old-leaven-1-corinthians-5'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=5 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=5 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Corinthians 5:8 — *let us keep the feast... with the unleavened bread of sincerity and truth* the feast kept, not abolished, only purged of the leaven of false doctrine (Galatians 5:9).'
  FROM cross_reference_threads t, cross_references x, _s223_g05_lookup sv, _s223_g05_lookup tv
 WHERE t.slug='galatians-5-a-little-leaven-leaveneth-the-whole-lump-purge-out-the-old-leaven-1-corinthians-5'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=5 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: galatians-5-all-the-law-is-fulfilled-in-one-word-thou-shalt-love-thy-neighbour-leviticus-19
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 19:18 — *thou shalt love thy neighbour as thyself: I am Yahuah (LORD)* the *one word* in which all the law is fulfilled is itself a verse of the law (Galatians 5:14).'
  FROM cross_reference_threads t, cross_references x, _s223_g05_lookup sv, _s223_g05_lookup tv
 WHERE t.slug='galatians-5-all-the-law-is-fulfilled-in-one-word-thou-shalt-love-thy-neighbour-leviticus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=5 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 6:5 — *thou shalt love Yahuah Elohayka (the LORD thy God) with all thine heart* the love that serves is the first command of the Shema, not a novelty (Galatians 5:13).'
  FROM cross_reference_threads t, cross_references x, _s223_g05_lookup sv, _s223_g05_lookup tv
 WHERE t.slug='galatians-5-all-the-law-is-fulfilled-in-one-word-thou-shalt-love-thy-neighbour-leviticus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=5 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 22:39 — *Thou shalt love thy neighbour as thyself* Yahusha named this same verse the second great commandment, on which *hang all the law and the prophets* (Galatians 5:14).'
  FROM cross_reference_threads t, cross_references x, _s223_g05_lookup sv, _s223_g05_lookup tv
 WHERE t.slug='galatians-5-all-the-law-is-fulfilled-in-one-word-thou-shalt-love-thy-neighbour-leviticus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=5 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=22 AND tv.verse_number=39
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 13:8 — *he that loveth another hath fulfilled the law* the same apostle elsewhere: love fulfils the law, does not abolish it (Galatians 5:14).'
  FROM cross_reference_threads t, cross_references x, _s223_g05_lookup sv, _s223_g05_lookup tv
 WHERE t.slug='galatians-5-all-the-law-is-fulfilled-in-one-word-thou-shalt-love-thy-neighbour-leviticus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=5 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=13 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Romans 13:9 — the commandments *briefly comprehended in this saying... Thou shalt love thy neighbour as thyself* the second-table commands upheld and summed in love, not cancelled (Galatians 5:14).'
  FROM cross_reference_threads t, cross_references x, _s223_g05_lookup sv, _s223_g05_lookup tv
 WHERE t.slug='galatians-5-all-the-law-is-fulfilled-in-one-word-thou-shalt-love-thy-neighbour-leviticus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=5 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=13 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Romans 13:10 — *love is the fulfilling of the law* the conclusion in both letters: love does the law''s own work, fills full what it requires (Galatians 5:14).'
  FROM cross_reference_threads t, cross_references x, _s223_g05_lookup sv, _s223_g05_lookup tv
 WHERE t.slug='galatians-5-all-the-law-is-fulfilled-in-one-word-thou-shalt-love-thy-neighbour-leviticus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=5 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=13 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: galatians-5-led-of-the-spirit-the-fruit-against-which-there-is-no-law-ezekiel-36-jeremiah-31
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 36:27 — *I will put my spirit within you, and cause you to walk in my statutes* the Spirit who leads is the Spirit whose express work is to carry the heart into the statutes (Galatians 5:18).'
  FROM cross_reference_threads t, cross_references x, _s223_g05_lookup sv, _s223_g05_lookup tv
 WHERE t.slug='galatians-5-led-of-the-spirit-the-fruit-against-which-there-is-no-law-ezekiel-36-jeremiah-31'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=5 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 31:33 — *I will put my law in their inward parts, and write it in their hearts* the new covenant is Torah moved inward, not Torah removed; so *not under the law* cannot mean loosed from it (Galatians 5:18).'
  FROM cross_reference_threads t, cross_references x, _s223_g05_lookup sv, _s223_g05_lookup tv
 WHERE t.slug='galatians-5-led-of-the-spirit-the-fruit-against-which-there-is-no-law-ezekiel-36-jeremiah-31'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=5 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 19:18 — *thou shalt love thy neighbour as thyself: I am Yahuah (LORD)* the love that crowns the fruit is the very thing the law commands; *against such there is no law* (Galatians 5:23).'
  FROM cross_reference_threads t, cross_references x, _s223_g05_lookup sv, _s223_g05_lookup tv
 WHERE t.slug='galatians-5-led-of-the-spirit-the-fruit-against-which-there-is-no-law-ezekiel-36-jeremiah-31'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=5 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_galatians_06.sql (S223 Galatians 6) -----
-- =====================================================================
-- S223 minion — GALATIANS 6 FULL-LIBRARY cross-references (closing chapter)
-- =====================================================================
-- Chapter: GALATIANS 6 (18 verses).  Tag: g06 (temp view _s223_g06_lookup).
-- Sort band: floor 7325, step 3 (7325, 7328, 7331, 7334, 7337 used; under 7350).
-- Source is ALWAYS the canon Galatians verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (HIGHEST VOICE-RISK BOOK — "The Galatians Lie"; Red Lines #4/#5/#6/#7/#10):
-- Galatians is written to the scattered seed of Yashar'el (Israel) living among the nations with
-- covenant memory dimmed by exile — NOT pagans who never had Torah. Paul answers the agitators'
-- proselyte gospel (*Except ye be circumcised after the manner of Moses, ye cannot be saved*,
-- Acts 15:1): flesh-credential-as-doorway, NOT Torah-as-such. The closing chapter UPHOLDS Torah
-- at every contested turn. *Bear ye one another's burdens, and so fulfil the law of Messiah*
-- (6:2) — *the law of Messiah* is the Torah lived out in love, the Leviticus 19:18 command Paul
-- already cited at 5:14; fulfil ≠ abolish (HIDDEN TORAH-AFFIRMING). *Be not deceived; Elohim
-- (God) is not mocked: for whatsoever a man soweth, that shall he also reap* (6:7) — the
-- sowing-and-reaping consequence-system is STILL OPERATIVE; grace opened the door home but did not
-- cancel consequence (complete-the-sentence frame). *Neither circumcision availeth any thing, nor
-- uncircumcision, but a new creature* (6:15) is the same teaching as 1 Corinthians 7:19 (*but the
-- keeping of the commandments of Elohim (God)*) — the flesh-mark is nothing, the new heart that
-- keeps the commandments is everything (Ezekiel 36:26). *The Yashar'el (Israel) of Elohim (God)*
-- (6:16) is the covenant people, the gathered seed of Yashar'el coming home — NOT a new or
-- replacement people superseding Yashar'el (the Psalms close every blessing with *peace upon
-- Yashar'el (Israel)*). The mark Paul bears in his body (6:17) is the true mark over against the
-- agitators' circumcision-mark. Christology: Yahusha is the Formed drawn from the Formless, who is
-- Yahuah (Lord) and has a Father. The default trained reading — grace-against-law, Torah-abolished,
-- the-Israel-of-God-is-the-church-replacing-Israel — is the antichrist reading this apparatus exists
-- to dismantle and must surface nowhere.
--
-- PER-VERSE LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1     restore in the spirit of meekness; considering thyself lest thou also be tempted
--           Tanakh: none warranted (the restoration-of-the-erring root is carried by the NT pair)
--           Extras: none warranted   NT: Matthew 18:15 (go and tell him his fault... gain thy
--                   brother), James 5:19-20 (convert him from the error of his way, save a soul)
--   v.2-3   bear one another's burdens, and so fulfil the law of Messiah (HIDDEN TORAH-AFFIRMING)
--           Tanakh: Leviticus 19:18 (love thy neighbour as thyself) — the very command Paul names
--           Extras: none warranted (the Torah root + NT echoes carry it cleanly)
--           NT: John 13:34 (a new commandment, love one another), Romans 15:1 (bear the infirmities
--                   of the weak)
--   v.4-5   prove his own work; every man shall bear his own burden — carried in prose at v.7-8
--           (the personal-accountability axis of the sowing-and-reaping thread)
--   v.6     communicate to him that teacheth — none warranted (no load-bearing weave)
--   v.7-8   God is not mocked; whatsoever a man soweth, that shall he also reap (consequence-system)
--           Tanakh: Job 4:8 (they that plow iniquity... reap the same), Proverbs 22:8 (he that
--                   soweth iniquity shall reap vanity), Hosea 8:7 (sown the wind, reap the
--                   whirlwind), Hosea 10:12 (sow in righteousness, reap in mercy), Deuteronomy 30:19
--                   (I have set before you life and death... therefore choose life)
--           Extras: none warranted   NT: none warranted (Paul is himself the NT voice here)
--   v.9-10  in due season we shall reap, if we faint not — carried in prose at v.7-8 thread
--   v.11-14 large letter; constrain you to be circumcised; God forbid that I should glory save in
--           the cross — the agitators' flesh-show; carried in prose at v.15 thread (anti-flesh-credential)
--   v.15    neither circumcision nor uncircumcision, but a new creature
--           Tanakh: Ezekiel 36:26 (a new heart... a new spirit) — the new-creature root
--           Extras: none warranted   NT: 1 Corinthians 7:19 (circumcision is nothing... but the
--                   keeping of the commandments of Elohim (God)), 2 Corinthians 5:17 (in Messiah...
--                   a new creature)
--   v.16    the Yashar'el (Israel) of Elohim (God) — the gathered covenant seed, NOT a replacement
--           Tanakh: Psalm 125:5 (peace shall be upon Yashar'el (Israel)), Psalm 128:6 (peace upon
--                   Yashar'el (Israel)) — the benediction Paul echoes
--           Extras: none warranted   NT: none warranted (Galatians 6:16 is itself the NT witness)
--   v.17-18 the marks of the Lord Yahusha; the grace... be with your spirit — none warranted
--           (the true-mark contrast is carried in prose at v.15; no load-bearing external weave)
--
-- THREADS (slug -> target libraries):
--   7325 galatians-6-restore-in-the-spirit-of-meekness-matthew-18-james-5                    (NT)
--   7328 galatians-6-bear-one-anothers-burdens-and-fulfil-the-law-of-messiah-leviticus-19-john-13  (Tanakh + NT)
--   7331 galatians-6-whatsoever-a-man-soweth-that-shall-he-reap-job-4-proverbs-22-hosea-8     (Tanakh)
--   7334 galatians-6-neither-circumcision-nor-uncircumcision-but-a-new-creature-1-corinthians-7-ezekiel-36 (Tanakh + NT)
--   7337 galatians-6-the-israel-of-god-the-gathered-seed-not-a-replacement-people-psalm-125-128 (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s223_g06_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: galatians-6-restore-in-the-spirit-of-meekness-matthew-18-james-5
  ('canon', 'galatians', 6, 1, 'canon', 'matthew', 18, 15, 'free', E'*Moreover if thy brother shall trespass against thee, go and tell him his fault between thee and him alone: if he shall hear thee, thou hast gained thy brother.* (Matthew 18:15). *Brethren, if a man be overtaken in a fault, ye which are spiritual, restore such an one in the spirit of meekness* (Galatians 6:1). Paul writes nothing new but the way of his Master: the fallen brother is not cast off but sought and gained, the fault answered face to face and *in the spirit of meekness.* The aim of the rebuke is restoration, *that thou mayest gain thy brother.*'),
  ('canon', 'galatians', 6, 1, 'canon', 'james', 5, 19, 'free', E'*Brethren, if any of you do err from the truth, and one convert him* (James 5:19). *Restore such an one in the spirit of meekness; considering thyself, lest thou also be tempted* (Galatians 6:1). The brother who has strayed from the truth is not abandoned but turned back; the one who *restores* him does the work of love. The same household charge runs through both letters: to go after the one who has erred and bring him home.'),
  ('canon', 'galatians', 6, 1, 'canon', 'james', 5, 20, 'free', E'*Let him know, that he which converteth the sinner from the error of his way shall save a soul from death, and shall hide a multitude of sins.* (James 5:20). *Ye which are spiritual, restore such an one in the spirit of meekness* (Galatians 6:1). To restore the one overtaken in a fault is no small thing — it *saves a soul from death.* This is why it must be done gently, *considering thyself, lest thou also be tempted,* for the restorer stands in the same need of mercy as the restored.'),
  -- thread: galatians-6-bear-one-anothers-burdens-and-fulfil-the-law-of-messiah-leviticus-19-john-13
  ('canon', 'galatians', 6, 2, 'canon', 'leviticus', 19, 18, 'free', E'*Thou shalt not avenge, nor bear any grudge against the children of thy people, but thou shalt love thy neighbour as thyself: I am Yahuah (LORD).* (Leviticus 19:18). *Bear ye one another''s burdens, and so fulfil the law of Messiah (Christ)* (Galatians 6:2). *The law of Messiah* is no new law set against the old: it is the Torah command *love thy neighbour as thyself* — the very word Paul named at *all the law is fulfilled in one word... Thou shalt love thy neighbour as thyself* (Galatians 5:14). To bear one another''s burdens IS to keep this commandment; to fulfil it is to do it, never to abolish it.'),
  ('canon', 'galatians', 6, 2, 'canon', 'john', 13, 34, 'free', E'*A new commandment I give unto you, That ye love one another; as I have loved you, that ye also love one another.* (John 13:34). *Bear ye one another''s burdens, and so fulfil the law of Messiah (Christ)* (Galatians 6:2). The *law of Messiah* is the Master''s own commandment, *that ye love one another* — new not because it overturns Leviticus 19:18 but because it is now measured by his own love, *as I have loved you.* The Torah command is lifted up and lived out, not laid aside.'),
  ('canon', 'galatians', 6, 2, 'canon', 'romans', 15, 1, 'free', E'*We then that are strong ought to bear the infirmities of the weak, and not to please ourselves.* (Romans 15:1). *Bear ye one another''s burdens, and so fulfil the law of Messiah (Christ)* (Galatians 6:2). Paul teaches the same in both letters: the strong carry the weak. The burden-bearing love that fulfils *the law of Messiah* is not a feeling but a doing — to take up the infirmity of another and *not to please ourselves.*'),
  -- thread: galatians-6-whatsoever-a-man-soweth-that-shall-he-reap-job-4-proverbs-22-hosea-8
  ('canon', 'galatians', 6, 7, 'canon', 'job', 4, 8, 'free', E'*Even as I have seen, they that plow iniquity, and sow wickedness, reap the same.* (Job 4:8). *Be not deceived; Elohim (God) is not mocked: for whatsoever a man soweth, that shall he also reap.* (Galatians 6:7). The law of the harvest stood before Paul ever wrote it: *they that plow iniquity... reap the same.* Grace opened the door home, but it did not unmake this — the sowing-and-reaping is real because the Way is real, and *Elohim (God) is not mocked.*'),
  ('canon', 'galatians', 6, 7, 'canon', 'proverbs', 22, 8, 'free', E'*He that soweth iniquity shall reap vanity: and the rod of his anger shall fail.* (Proverbs 22:8). *Whatsoever a man soweth, that shall he also reap* (Galatians 6:7). The proverb names the same harvest: *he that soweth iniquity shall reap vanity.* What a man plants in the field of his life he gathers back; the consequence is woven into the order Yahuah (LORD) made, and no man mocks it.'),
  ('canon', 'galatians', 6, 7, 'canon', 'hosea', 8, 7, 'free', E'*For they have sown the wind, and they shall reap the whirlwind: it hath no stalk: the bud shall yield no meal* (Hosea 8:7). *For he that soweth to his flesh shall of the flesh reap corruption; but he that soweth to the Spirit shall of the Spirit reap life everlasting.* (Galatians 6:8). Hosea spoke this judgment over scattered Yashar''el (Israel) — they *sown the wind* and *reap the whirlwind.* Paul presses the same law on the same people now coming home: to sow to the flesh is to *reap corruption,* and grace did not cancel the reaping but opened the way to sow instead *to the Spirit* and reap *life everlasting.*'),
  ('canon', 'galatians', 6, 8, 'canon', 'hosea', 10, 12, 'free', E'*Sow to yourselves in righteousness, reap in mercy; break up your fallow ground: for it is time to seek Yahuah (LORD), till he come and rain righteousness upon you.* (Hosea 10:12). *He that soweth to the Spirit shall of the Spirit reap life everlasting.* (Galatians 6:8). The prophet''s call is the door the consequence-system leaves open: *sow to yourselves in righteousness, reap in mercy.* The same hand that warns of the whirlwind calls Yashar''el (Israel) to break up the fallow ground and seek Yahuah (LORD) — to sow to the Spirit and reap the life he rains down.'),
  ('canon', 'galatians', 6, 8, 'canon', 'deuteronomy', 30, 19, 'free', E'*I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live* (Deuteronomy 30:19). *He that soweth to his flesh shall of the flesh reap corruption; but he that soweth to the Spirit shall of the Spirit reap life everlasting.* (Galatians 6:8). Moses set the same two harvests before the same people: *life and death, blessing and cursing... therefore choose life.* The sowing-and-reaping of Galatians is the covenant''s ancient either/or — the consequence is real, and the call is the same: choose life, that thou and thy seed may live.'),
  -- thread: galatians-6-neither-circumcision-nor-uncircumcision-but-a-new-creature-1-corinthians-7-ezekiel-36
  ('canon', 'galatians', 6, 15, 'canon', '1-corinthians', 7, 19, 'free', E'*Circumcision is nothing, and uncircumcision is nothing, but the keeping of the commandments of Elohim (God).* (1 Corinthians 7:19). *For in HaMashiach Yahusha (Christ Jesus) neither circumcision availeth any thing, nor uncircumcision, but a new creature.* (Galatians 6:15). Paul says the same thing twice, and the Corinthian half supplies the words the Galatian half assumes: the flesh-mark *availeth nothing* — what counts is *the keeping of the commandments of Elohim (God).* The new creature is precisely the one whose new heart keeps the commandments; the agitators'' circumcision-credential is nothing, the Torah is not.'),
  ('canon', 'galatians', 6, 15, 'canon', 'ezekiel', 36, 26, 'free', E'*A new heart also will I give you, and a new spirit will I put within you: and I will take away the stony heart out of your flesh, and I will give you an heart of flesh.* (Ezekiel 36:26). *Neither circumcision availeth any thing, nor uncircumcision, but a new creature.* (Galatians 6:15). The *new creature* is the new heart Yahuah (LORD) promised the scattered house — the stony heart taken away, the heart of flesh given. And the next breath of the promise tells what the new heart is for: *I will put my spirit within you, and cause you to walk in my statutes* (Ezekiel 36:27). The new creature is the Torah-keeping heart, not a heart set free from Torah.'),
  ('canon', 'galatians', 6, 15, 'canon', '2-corinthians', 5, 17, 'free', E'*Therefore if any man be in Messiah (Christ), he is a new creature: old things are passed away; behold, all things are become new.* (2 Corinthians 5:17). *For in HaMashiach Yahusha (Christ Jesus)... a new creature.* (Galatians 6:15). The same phrase stands in both letters: *a new creature.* Standing before Yahuah (LORD) does not turn on the flesh-mark of circumcision or its absence but on being *in Messiah (Christ)* — remade, the old passed away, all things become new.'),
  -- thread: galatians-6-the-israel-of-god-the-gathered-seed-not-a-replacement-people-psalm-125-128
  ('canon', 'galatians', 6, 16, 'canon', 'psalms', 125, 5, 'free', E'*As for such as turn aside unto their crooked ways, Yahuah (LORD) shall lead them forth with the workers of iniquity: but peace shall be upon Yashar''el (Israel).* (Psalm 125:5). *And as many as walk according to this rule, peace be on them, and mercy, and upon the Yashar''el (Israel) of Elohim (God).* (Galatians 6:16). Paul closes with the psalmist''s own benediction: *peace shall be upon Yashar''el (Israel).* He does not invent a new people to bless in Israel''s place — he pronounces the ancient covenant peace over the gathered seed of Yashar''el (Israel), the scattered now walking according to the rule and brought home.'),
  ('canon', 'galatians', 6, 16, 'canon', 'psalms', 128, 6, 'free', E'*Yea, thou shalt see thy children''s children, and peace upon Yashar''el (Israel).* (Psalm 128:6). *Peace be on them, and mercy, and upon the Yashar''el (Israel) of Elohim (God).* (Galatians 6:16). The Psalms of Ascent end as Paul ends: *peace upon Yashar''el (Israel).* *The Yashar''el (Israel) of Elohim (God)* is not a replacement for that Israel but its fullness — the covenant people of Yahuah (LORD), the gathered children walking in his way, upon whom the old benediction of peace now rests.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s223_g06_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s223_g06_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'galatians-6-restore-in-the-spirit-of-meekness-matthew-18-james-5',
       E'Restore such an one in the spirit of meekness — Matthew 18, James 5',
       E'The closing chapter opens with the work of the household: not the casting off of the fallen but the seeking of them. *Brethren, if a man be overtaken in a fault, ye which are spiritual, restore such an one in the spirit of meekness; considering thyself, lest thou also be tempted* (Galatians 6:1). This is the Master''s own way. *Moreover if thy brother shall trespass against thee, go and tell him his fault between thee and him alone: if he shall hear thee, thou hast gained thy brother* (Matthew 18:15) — the fault answered face to face, the aim the gaining of the brother, not his exposure. And James names the weight of it: *Brethren, if any of you do err from the truth, and one convert him; let him know, that he which converteth the sinner from the error of his way shall save a soul from death, and shall hide a multitude of sins* (James 5:19-20). To restore the one overtaken is to *save a soul from death* — which is why it must be done *in the spirit of meekness,* the restorer remembering his own frailty, *considering thyself, lest thou also be tempted.* The strong do not stand over the weak but stoop to lift them.',
       sv.verse_id, ev.verse_id, 'free', 7325
  FROM _s223_g06_lookup sv, _s223_g06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=6 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='galatians' AND ev.chapter_number=6 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'galatians-6-bear-one-anothers-burdens-and-fulfil-the-law-of-messiah-leviticus-19-john-13',
       E'Bear one another''s burdens, and so fulfil the law of Messiah — Leviticus 19, John 13',
       E'Here the inherited reading hears *the law of Messiah* as a new law set against the old, and the hearing is exactly wrong. *Bear ye one another''s burdens, and so fulfil the law of Messiah (Christ)* (Galatians 6:2). What is *the law of Messiah?* Paul has already told us, two breaths earlier: *all the law is fulfilled in one word, even in this; Thou shalt love thy neighbour as thyself* (Galatians 5:14). It is the Torah command itself — *Thou shalt not avenge, nor bear any grudge against the children of thy people, but thou shalt love thy neighbour as thyself: I am Yahuah (LORD)* (Leviticus 19:18). To bear one another''s burdens IS to keep this commandment; to *fulfil* it is to do it, never to do away with it. The Master gave the same word and measured it by his own love: *A new commandment I give unto you, That ye love one another; as I have loved you, that ye also love one another* (John 13:34) — new not because it overturns Leviticus but because the standard is now his own laying-down of himself. And Paul teaches the doing of it plainly in his other letter: *We then that are strong ought to bear the infirmities of the weak, and not to please ourselves* (Romans 15:1). The burden-bearing love that fulfils *the law of Messiah* is the Torah lived out — the commandment carried, not cancelled.',
       sv.verse_id, ev.verse_id, 'free', 7328
  FROM _s223_g06_lookup sv, _s223_g06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=6 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='galatians' AND ev.chapter_number=6 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'galatians-6-whatsoever-a-man-soweth-that-shall-he-reap-job-4-proverbs-22-hosea-8',
       E'Whatsoever a man soweth, that shall he also reap — Job 4, Proverbs 22, Hosea',
       E'Grace opened the door home; it did not unmake the law of the harvest. *Be not deceived; Elohim (God) is not mocked: for whatsoever a man soweth, that shall he also reap. For he that soweth to his flesh shall of the flesh reap corruption; but he that soweth to the Spirit shall of the Spirit reap life everlasting* (Galatians 6:7-8). The sowing-and-reaping is no new threat but the oldest order of the Way, and the whole Tanakh stands behind Paul''s word. *Even as I have seen, they that plow iniquity, and sow wickedness, reap the same* (Job 4:8). *He that soweth iniquity shall reap vanity: and the rod of his anger shall fail* (Proverbs 22:8). Over scattered Yashar''el (Israel) the prophet thundered it: *For they have sown the wind, and they shall reap the whirlwind* (Hosea 8:7). The consequence is real because the Way is real — *Elohim (God) is not mocked.* Yet the same law that warns leaves the door open, for the harvest turns on what is sown: *Sow to yourselves in righteousness, reap in mercy; break up your fallow ground: for it is time to seek Yahuah (LORD), till he come and rain righteousness upon you* (Hosea 10:12). And Moses set the two harvests before the people from the first: *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live* (Deuteronomy 30:19). To sow to the flesh is to reap corruption; to sow to the Spirit is to reap life everlasting — the cross opened the way to sow to the Spirit, but it did not cancel the reaping. *And let us not be weary in well doing: for in due season we shall reap, if we faint not* (Galatians 6:9).',
       sv.verse_id, ev.verse_id, 'free', 7331
  FROM _s223_g06_lookup sv, _s223_g06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=6 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='galatians' AND ev.chapter_number=6 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'galatians-6-neither-circumcision-nor-uncircumcision-but-a-new-creature-1-corinthians-7-ezekiel-36',
       E'Neither circumcision nor uncircumcision, but a new creature — 1 Corinthians 7, Ezekiel 36',
       E'The agitators *desire to make a fair shew in the flesh* and *constrain you to be circumcised* (Galatians 6:12), glorying in the flesh-mark as the doorway to covenant standing. Paul answers the whole flesh-credential system: *For in HaMashiach Yahusha (Christ Jesus) neither circumcision availeth any thing, nor uncircumcision, but a new creature* (Galatians 6:15). His own letter to Corinth supplies the words this verse assumes, and it is decisive against the Torah-abolished reading: *Circumcision is nothing, and uncircumcision is nothing, but the keeping of the commandments of Elohim (God)* (1 Corinthians 7:19). The flesh-mark counts for nothing — what counts is *the keeping of the commandments of Elohim (God).* The new creature is not the one freed from the commandments but the one given a heart that keeps them, exactly as Yahuah (LORD) promised the scattered house: *A new heart also will I give you, and a new spirit will I put within you: and I will take away the stony heart out of your flesh, and I will give you an heart of flesh* (Ezekiel 36:26) — and the very next word names its purpose, *I will put my spirit within you, and cause you to walk in my statutes* (Ezekiel 36:27). The new heart is the Torah-keeping heart. So standing before Yahuah (LORD) turns not on the flesh but on being remade in Messiah: *Therefore if any man be in Messiah (Christ), he is a new creature: old things are passed away; behold, all things are become new* (2 Corinthians 5:17). Not circumcision, not uncircumcision — a new creature whose new heart walks in his statutes.',
       sv.verse_id, ev.verse_id, 'free', 7334
  FROM _s223_g06_lookup sv, _s223_g06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=6 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='galatians' AND ev.chapter_number=6 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'galatians-6-the-israel-of-god-the-gathered-seed-not-a-replacement-people-psalm-125-128',
       E'The Yashar''el (Israel) of Elohim (God) — the gathered seed, not a replacement people (Psalm 125, 128)',
       E'This is the verse the replacement reading seizes, and the seizing reverses Paul''s own words. *And as many as walk according to this rule, peace be on them, and mercy, and upon the Yashar''el (Israel) of Elohim (God)* (Galatians 6:16). The inherited reading hears *the Israel of God* as a new people — the church — pronounced in the place of Yashar''el (Israel), the old Israel set aside. But Paul is closing his letter to the scattered seed of Yashar''el (Israel) come home, and he closes it with the Psalms'' own benediction. *As for such as turn aside unto their crooked ways, Yahuah (LORD) shall lead them forth with the workers of iniquity: but peace shall be upon Yashar''el (Israel)* (Psalm 125:5). *Yea, thou shalt see thy children''s children, and peace upon Yashar''el (Israel)* (Psalm 128:6). The benediction of the gathered covenant people ends, always, *peace upon Yashar''el (Israel)* — and that is the very blessing Paul pronounces. *The Yashar''el (Israel) of Elohim (God)* is not a people who replace Israel but Israel in its fullness: the covenant people of Yahuah (LORD), the scattered now *walking according to this rule,* the gathered seed upon whom the ancient peace at last rests. He does not bless a new Israel over the grave of the old; he blesses the old Israel restored. And he seals it with his own body: *From henceforth let no man trouble me: for I bear in my body the marks of the Lord Yahusha (Lord Jesus)* (Galatians 6:17) — the true mark of belonging, over against the agitators'' mark in the flesh.',
       sv.verse_id, ev.verse_id, 'free', 7337
  FROM _s223_g06_lookup sv, _s223_g06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=6 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='galatians' AND ev.chapter_number=6 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: galatians-6-restore-in-the-spirit-of-meekness-matthew-18-james-5
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 18:15 — *go and tell him his fault between thee and him alone... thou hast gained thy brother* the Master''s own way of restoration, the fault answered to gain the brother (Galatians 6:1).'
  FROM cross_reference_threads t, cross_references x, _s223_g06_lookup sv, _s223_g06_lookup tv
 WHERE t.slug='galatians-6-restore-in-the-spirit-of-meekness-matthew-18-james-5'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=6 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=18 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'James 5:19 — *if any of you do err from the truth, and one convert him* the strayed brother sought and turned back, not abandoned (Galatians 6:1).'
  FROM cross_reference_threads t, cross_references x, _s223_g06_lookup sv, _s223_g06_lookup tv
 WHERE t.slug='galatians-6-restore-in-the-spirit-of-meekness-matthew-18-james-5'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=6 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=5 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'James 5:20 — *he which converteth the sinner from the error of his way shall save a soul from death* the weight of restoration, why it is done in meekness (Galatians 6:1).'
  FROM cross_reference_threads t, cross_references x, _s223_g06_lookup sv, _s223_g06_lookup tv
 WHERE t.slug='galatians-6-restore-in-the-spirit-of-meekness-matthew-18-james-5'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=6 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=5 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: galatians-6-bear-one-anothers-burdens-and-fulfil-the-law-of-messiah-leviticus-19-john-13
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 19:18 — *thou shalt love thy neighbour as thyself: I am Yahuah (LORD)* the Torah command that IS *the law of Messiah*; fulfil means do, not abolish (Galatians 6:2).'
  FROM cross_reference_threads t, cross_references x, _s223_g06_lookup sv, _s223_g06_lookup tv
 WHERE t.slug='galatians-6-bear-one-anothers-burdens-and-fulfil-the-law-of-messiah-leviticus-19-john-13'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=6 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 13:34 — *A new commandment I give unto you, That ye love one another; as I have loved you* the Master''s command, the Torah love measured by his own love (Galatians 6:2).'
  FROM cross_reference_threads t, cross_references x, _s223_g06_lookup sv, _s223_g06_lookup tv
 WHERE t.slug='galatians-6-bear-one-anothers-burdens-and-fulfil-the-law-of-messiah-leviticus-19-john-13'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=6 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=13 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 15:1 — *we then that are strong ought to bear the infirmities of the weak* Paul teaches the same burden-bearing love elsewhere, the law of Messiah in deed (Galatians 6:2).'
  FROM cross_reference_threads t, cross_references x, _s223_g06_lookup sv, _s223_g06_lookup tv
 WHERE t.slug='galatians-6-bear-one-anothers-burdens-and-fulfil-the-law-of-messiah-leviticus-19-john-13'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=6 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=15 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: galatians-6-whatsoever-a-man-soweth-that-shall-he-reap-job-4-proverbs-22-hosea-8
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Job 4:8 — *they that plow iniquity, and sow wickedness, reap the same* the law of the harvest stood before Paul wrote it; grace did not unmake it (Galatians 6:7).'
  FROM cross_reference_threads t, cross_references x, _s223_g06_lookup sv, _s223_g06_lookup tv
 WHERE t.slug='galatians-6-whatsoever-a-man-soweth-that-shall-he-reap-job-4-proverbs-22-hosea-8'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=6 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=4 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 22:8 — *he that soweth iniquity shall reap vanity* the same harvest, woven into the order Yahuah (LORD) made (Galatians 6:7).'
  FROM cross_reference_threads t, cross_references x, _s223_g06_lookup sv, _s223_g06_lookup tv
 WHERE t.slug='galatians-6-whatsoever-a-man-soweth-that-shall-he-reap-job-4-proverbs-22-hosea-8'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=6 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=22 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hosea 8:7 — *they have sown the wind, and they shall reap the whirlwind* the judgment over scattered Yashar''el (Israel), the consequence Paul presses on them now (Galatians 6:8).'
  FROM cross_reference_threads t, cross_references x, _s223_g06_lookup sv, _s223_g06_lookup tv
 WHERE t.slug='galatians-6-whatsoever-a-man-soweth-that-shall-he-reap-job-4-proverbs-22-hosea-8'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=6 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=8 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Hosea 10:12 — *sow to yourselves in righteousness, reap in mercy... for it is time to seek Yahuah (LORD)* the door the consequence-system leaves open: sow to the Spirit (Galatians 6:8).'
  FROM cross_reference_threads t, cross_references x, _s223_g06_lookup sv, _s223_g06_lookup tv
 WHERE t.slug='galatians-6-whatsoever-a-man-soweth-that-shall-he-reap-job-4-proverbs-22-hosea-8'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=6 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=10 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Deuteronomy 30:19 — *I have set before you life and death, blessing and cursing: therefore choose life* the two harvests set before the same people from the first (Galatians 6:8).'
  FROM cross_reference_threads t, cross_references x, _s223_g06_lookup sv, _s223_g06_lookup tv
 WHERE t.slug='galatians-6-whatsoever-a-man-soweth-that-shall-he-reap-job-4-proverbs-22-hosea-8'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=6 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: galatians-6-neither-circumcision-nor-uncircumcision-but-a-new-creature-1-corinthians-7-ezekiel-36
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Corinthians 7:19 — *circumcision is nothing... but the keeping of the commandments of Elohim (God)* the words Galatians 6:15 assumes: the new creature keeps the commandments (Galatians 6:15).'
  FROM cross_reference_threads t, cross_references x, _s223_g06_lookup sv, _s223_g06_lookup tv
 WHERE t.slug='galatians-6-neither-circumcision-nor-uncircumcision-but-a-new-creature-1-corinthians-7-ezekiel-36'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=6 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=7 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 36:26 — *A new heart also will I give you, and a new spirit will I put within you* the new creature is the new heart promised the scattered house, to walk in his statutes (Galatians 6:15).'
  FROM cross_reference_threads t, cross_references x, _s223_g06_lookup sv, _s223_g06_lookup tv
 WHERE t.slug='galatians-6-neither-circumcision-nor-uncircumcision-but-a-new-creature-1-corinthians-7-ezekiel-36'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=6 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Corinthians 5:17 — *if any man be in Messiah (Christ), he is a new creature: old things are passed away* the same phrase; standing turns on being in Messiah, not the flesh-mark (Galatians 6:15).'
  FROM cross_reference_threads t, cross_references x, _s223_g06_lookup sv, _s223_g06_lookup tv
 WHERE t.slug='galatians-6-neither-circumcision-nor-uncircumcision-but-a-new-creature-1-corinthians-7-ezekiel-36'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=6 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=5 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: galatians-6-the-israel-of-god-the-gathered-seed-not-a-replacement-people-psalm-125-128
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 125:5 — *but peace shall be upon Yashar''el (Israel)* the psalmist''s benediction Paul echoes; he blesses Israel restored, not a people in its place (Galatians 6:16).'
  FROM cross_reference_threads t, cross_references x, _s223_g06_lookup sv, _s223_g06_lookup tv
 WHERE t.slug='galatians-6-the-israel-of-god-the-gathered-seed-not-a-replacement-people-psalm-125-128'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=6 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=125 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 128:6 — *and peace upon Yashar''el (Israel)* the Psalms close as Paul closes; *the Israel of God* is Israel in its fullness, the gathered seed (Galatians 6:16).'
  FROM cross_reference_threads t, cross_references x, _s223_g06_lookup sv, _s223_g06_lookup tv
 WHERE t.slug='galatians-6-the-israel-of-god-the-gathered-seed-not-a-replacement-people-psalm-125-128'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=6 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=128 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session223 — Galatians cross-references complete.'
