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


COMMIT;
\echo 'session223 — Galatians cross-references complete.'
