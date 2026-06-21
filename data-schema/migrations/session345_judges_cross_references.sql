-- =====================================================================
-- Session 345 — Judges FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py /tmp/former-prophets-wt/data-schema/migrations/session345_judges_cross_references.sql
-- =====================================================================

\echo 'session345 — Judges cross-references starting...'
BEGIN;

-- ----- fragment: minion_judges_1.sql (Judges 1) -----
-- Chapter: Judges 1 — after the death of Joshua the tribes continue the conquest, but the chapter
-- is governed by a refrain of FAILURE. Yahudah (Judah) goes up first by Yahuah's word (1:1-2),
-- takes Jerusalem (1:8) and Hebron and Debir, and Caleb/Othniel and Achsah's springs are recounted
-- (1:12-15, 20) — the faith that takes its portion. But verse 19 turns: *And Yahuah was with Yahudah;
-- and he drave out the inhabitants of the mountain; but could not drive out the inhabitants of the
-- valley, because they had chariots of iron* (1:19). Then tribe after tribe *did not drive out* the
-- Canaanites — Benjamin (1:21), Manasseh (1:27), Ephraim/Gezer (1:29), Zebulun (1:30), Asher
-- (1:31-32), Naphtali (1:33), Dan forced back (1:34) — *but the Canaanites would dwell in that land*,
-- put to tribute, *and did not utterly drive them out* (1:28). This INCOMPLETE OBEDIENCE is the seed
-- of the whole book's apostasy cycle: the un-driven-out nations become the snare and thorns Yahuah
-- warned of (Numbers 33:55, Deuteronomy 7:2-4) and the angel reannounces in the very next chapter
-- (Judges 2:3); Psalm 106 sings the outcome — *they did not destroy the nations... But were mingled
-- among the heathen, and learned their works* (Psalm 106:34-35).
-- Tag: jdg01   Temp view: _s345_jdg01_lookup
-- Sort band: 35650, 35653, 35656 (3 threads)
-- Source of EVERY row: 'canon','judges',1,v
--
-- Judges 1 coverage:
--   v.1-2 (after the death of Joshua... Who shall go up for us against the Canaanites first?... Yahudah
--          shall go up: behold, I have delivered the land into his hand)
--        NT:     none warranted distinct (the tribal-lead is a Tanakh covenant matter)
--        Extras: none warranted
--        Tanakh: ★ Genesis 49:8-10 (Yahudah... thy hand shall be in the neck of thine enemies... the
--                sceptre shall not depart from Yahudah), Numbers 2:3/10:14 (Yahudah camps and marches
--                first) — THREAD 3 (Yahudah goes up first, the lion-tribe leading by the sceptre-word)
--   v.4-8 (Yahuah delivered the Canaanites... slew of them in Bezek ten thousand... Adoni-bezek...
--          as I have done, so Elohim hath requited me... fought against Jerusalem, and had taken it)
--        NT:     none warranted (Adoni-bezek's measure-for-measure carried in prose; Gal 6:7 weighed,
--                deferred — not framework-load-bearing for this chapter)
--        Extras: none warranted
--        Tanakh: the taking of Jerusalem woven into THREAD 3 (Yahudah's portion taken by faith)
--   ★ v.12-15 (Caleb... He that smiteth Kirjath-sepher... to him will I give Achsah my daughter...
--          Othniel... took it... Give me a blessing... the upper springs and the nether springs)
--        NT:     none warranted (the account is a Tanakh inheritance matter)
--        Extras: none warranted
--        Tanakh: ★★ Joshua 15:16-19 (the SAME account, verbatim, in Yahudah's allotted inheritance) —
--                THREAD 2; Joshua 14:9-14 (Caleb's wholehearted following weighed, deferred to prose)
--   v.16, 20 (the children of the Kenite, Moses' father in law... and they gave Hebron unto Caleb,
--          as Moses said: and he expelled thence the three sons of Anak)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Joshua 15:13-14 (Hebron given to Caleb, the three sons of Anak driven) — folded into
--                THREAD 2 prose with the Caleb account
--   ★★★ v.19, 21, 27-33 (could not drive out the inhabitants of the valley, because they had chariots
--          of iron... Benjamin did not drive out the Jebusites... Manasseh... Ephraim... Zebulun...
--          Asher dwelt among the Canaanites... Naphtali... but the Canaanites would dwell in that land)
--        NT:     none warranted distinct (the incomplete-obedience type is fulfilled in the Torah
--                warnings and Psalm 106, not a single NT verse; the snare/thorn principle is Tanakh)
--        Extras: none warranted
--        Tanakh: ★★★ Numbers 33:55 (if ye will not drive out the inhabitants... pricks in your eyes,
--                and thorns in your sides), ★★ Deuteronomy 7:2 (make no covenant... shew no mercy),
--                Deuteronomy 7:4 (they will turn away thy son... serve other gods), ★★ Psalm 106:34-35
--                (they did not destroy the nations... but were mingled among the heathen, and learned
--                their works), ★★ Judges 2:3 (I will not drive them out... they shall be as thorns in
--                your sides, and their gods shall be a snare unto you) — THREAD 1
--   v.28 (when Yashar'el was strong... put the Canaanites to tribute, and did not utterly drive them out)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Psalm 106:36 (they served their idols: which were a snare unto them) — THREAD 1
--   v.34-36 (the Amorites forced the children of Dan into the mountain... yet the hand of the house of
--          Joseph prevailed... the coast of the Amorites)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: held in THREAD 1 prose (the climax of the failure refrain — even Dan pressed back)
--
-- Threads (slug — target libraries):
--   1. judges-1-the-canaanites-not-driven-out-the-snare-and-the-thorns — Tanakh (Numbers 33, Deut 7,
--      Psalm 106, Judges 2) [free]
--      (★★★ the INCOMPLETE conquest; the un-driven-out nations become the snare and thorns Yahuah
--       warned of; mingled and learned their works — the seed of the whole book's apostasy cycle)
--   2. judges-1-caleb-and-achsahs-springs-the-portion-taken-by-faith — Tanakh (Joshua 15) [free]
--      (★ the faith that takes its portion: Caleb, Othniel, Achsah's upper and nether springs — the
--       same account recorded in Yahudah's inheritance in Joshua 15)
--   3. judges-1-yahudah-shall-go-up-first-the-sceptre-tribe-leads — Tanakh (Genesis 49, Numbers 2) [free]
--      (Yahudah goes up first by Yahuah's word; the lion-tribe leading, the sceptre that shall not
--       depart, the hand in the neck of the enemies — Yahudah takes Jerusalem)
--
-- Framing notes:
--   ★★★ THE INCOMPLETE CONQUEST (THREAD 1): the refrain that governs the chapter and seeds the book.
--      *And Yahuah was with Yahudah; and he drave out the inhabitants of the mountain; but could not
--      drive out the inhabitants of the valley, because they had chariots of iron* (1:19) — and then
--      tribe after tribe *did not drive out*: Benjamin (1:21), Manasseh (1:27), Ephraim (1:29),
--      Zebulun (1:30), Asher (1:31-32), Naphtali (1:33), Dan pressed back into the hills (1:34). The
--      verdict: *but the Canaanites would dwell in that land* (1:27); *when Yashar'el (Israel) was
--      strong... they put the Canaanites to tribute, and did not utterly drive them out* (1:28). This
--      is exactly the disobedience Yahuah forewarned in the wilderness: *But if ye will not drive out
--      the inhabitants of the land from before you; then it shall come to pass, that those which ye
--      let remain of them shall be pricks in your eyes, and thorns in your sides* (Numbers 33:55);
--      *thou shalt smite them, and utterly destroy them; thou shalt make no covenant with them, nor
--      shew mercy unto them* (Deuteronomy 7:2), *for they will turn away thy son from following me,
--      that they may serve other gods* (Deuteronomy 7:4). The angel of Yahuah pronounces the sentence
--      in the very next chapter: *I will not drive them out from before you; but they shall be as
--      thorns in your sides, and their gods shall be a snare unto you* (Judges 2:3). And Psalm 106
--      sings the long outcome: *They did not destroy the nations, concerning whom Yahuah commanded
--      them: But were mingled among the heathen, and learned their works. And they served their idols:
--      which were a snare unto them* (Psalm 106:34-36). Incomplete obedience is the seed of the
--      apostasy cycle the whole book of Judges will turn on.
--   ★ CALEB AND ACHSAH'S SPRINGS (THREAD 2): against the failure, the faith that takes its portion.
--      *And Caleb said, He that smiteth Kirjath-sepher, and taketh it, to him will I give Achsah my
--      daughter to wife. And Othniel the son of Kenaz, Caleb's younger brother, took it* (1:12-13);
--      *Give me a blessing: for thou hast given me a south land; give me also springs of water. And
--      Caleb gave her the upper springs and the nether springs* (1:15). This is the same account
--      already recorded in Yahudah's allotted inheritance: *And Caleb said, He that smiteth
--      Kirjath-sepher... to him will I give Achsah my daughter to wife* (Joshua 15:16); *he gave her
--      the upper springs, and the nether springs* (Joshua 15:19) — and *Caleb drove thence the three
--      sons of Anak* (Joshua 15:14), which Judges echoes: *he expelled thence the three sons of Anak*
--      (1:20). Where the tribes leave the valley un-taken, Caleb's house takes the hill, the city, and
--      the springs. Faith asks for the blessing and gets the upper and the nether waters both.
--   YAHUDAH SHALL GO UP FIRST (THREAD 3): *Who shall go up for us against the Canaanites first, to
--      fight against them? And Yahuah said, Yahudah shall go up: behold, I have delivered the land into
--      his hand* (1:1-2). The lion-tribe leads because of the dying word of Jacob: *Yahudah, thou art
--      he whom thy brethren shall praise: thy hand shall be in the neck of thine enemies... The sceptre
--      shall not depart from Yahudah* (Genesis 49:8-10). Yahudah marched first in the wilderness camp
--      too — *on the east side... shall they of the standard of the camp of Yahudah pitch* and *In the
--      first place went the standard of the camp of the children of Yahudah* (Numbers 2:3; 10:14). So
--      it is Yahudah who takes Jerusalem (1:8), the south, and the coastal cities — the tribe of the
--      sceptre going up first, the foreshadow of the Davidic King who comes from him.
--   VERSES WITH NO SEPARATE ADD: v.4-7 (Adoni-bezek's measure-for-measure — *as I have done, so Elohim
--      hath requited me* — recorded in prose; Galatians 6:7 weighed but not framework-load-bearing for
--      this chapter), v.16 (the Kenite, Moses' father in law — geographic/lineage note, no warranted
--      target), v.22-26 (the house of Joseph at Beth-el and the spared man of Luz — the conquest
--      narrative, no distinct cross-library add), v.34-36 (Dan forced back, the Amorite coast — the
--      climax of the failure refrain, woven into THREAD 1 prose). All recorded, none silently skipped.

CREATE TEMP VIEW _s345_jdg01_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★★): the Canaanites not driven out — the snare and the thorns
    ('canon','judges',1,19,'canon','numbers',33,55,'free',
      E'*But if ye will not drive out the inhabitants of the land from before you; then it shall come to pass, that those which ye let remain of them shall be pricks in your eyes, and thorns in your sides, and shall vex you in the land wherein ye dwell* (Numbers 33:55). This is the exact disobedience Judges records: *could not drive out the inhabitants of the valley, because they had chariots of iron* (Judges 1:19). The nations left un-driven-out are no neutral remnant — they are the pricks and thorns Yahuah forewarned, the seed of the whole book''s misery.'),
    ('canon','judges',1,27,'canon','numbers',33,55,'free',
      E'*those which ye let remain of them shall be pricks in your eyes, and thorns in your sides, and shall vex you in the land wherein ye dwell* (Numbers 33:55). Manasseh''s failure — *Neither did Manasseh drive out the inhabitants of Beth-shean... but the Canaanites would dwell in that land* (Judges 1:27) — is precisely the "letting remain" the warning condemned. What is tolerated becomes the thorn in the side.'),
    ('canon','judges',1,28,'canon','deuteronomy',7,2,'free',
      E'*And when Yahuah Elohayka (the LORD thy God) shall deliver them before thee; thou shalt smite them, and utterly destroy them; thou shalt make no covenant with them, nor shew mercy unto them* (Deuteronomy 7:2). The command was to *utterly destroy*; Judges records the half-measure: *they put the Canaanites to tribute, and did not utterly drive them out* (Judges 1:28). Tribute is not destruction — it is the covenant-with-the-Canaanite the Torah forbade, the mixture that becomes the snare.'),
    ('canon','judges',1,28,'canon','deuteronomy',7,4,'free',
      E'*For they will turn away thy son from following me, that they may serve other gods: so will the anger of Yahuah (LORD) be kindled against you* (Deuteronomy 7:4). The reason driving-out had to be complete: the un-destroyed Canaanite *will turn away thy son*. Judges 1:28''s tribute-without-destruction leaves exactly the snare that turns the next generation to *Baalim* (Judges 2:11) — incomplete obedience breeds apostasy.'),
    ('canon','judges',1,28,'canon','psalms',106,34,'free',
      E'*They did not destroy the nations, concerning whom Yahuah (LORD) commanded them* (Psalm 106:34). The psalm names the sin of Judges 1 directly: the nations were *not destroyed*, only put *to tribute, and did not utterly drive them out* (Judges 1:28). Psalm 106 is the inspired verdict on the chapter''s refrain — they did not do what Yahuah commanded.'),
    ('canon','judges',1,28,'canon','psalms',106,35,'free',
      E'*But were mingled among the heathen, and learned their works* (Psalm 106:35). This is the outcome of the un-driven-out Canaanites of Judges 1:28: not separation but mingling, not conquest but assimilation — they *learned their works*. The toleration of the land''s inhabitants ends in learning the land''s idolatry.'),
    ('canon','judges',1,28,'canon','psalms',106,36,'free',
      E'*And they served their idols: which were a snare unto them* (Psalm 106:36). The Canaanites left to dwell and pay tribute (Judges 1:28) become the snare: their idols ensnare Yashar''el (Israel). What was spared for tribute becomes the trap — the snare Yahuah said the un-driven nations would be.'),
    ('canon','judges',1,21,'canon','judges',2,3,'free',
      E'*Wherefore I also said, I will not drive them out from before you; but they shall be as thorns in your sides, and their gods shall be a snare unto you* (Judges 2:3). The very next chapter pronounces the sentence on Judges 1''s failure: because Benjamin and the tribes *did not drive out* (Judges 1:21), Yahuah now will not drive them out either — they remain as thorns and their gods as a snare. The angel''s word seals the refrain of chapter 1.'),
    ('canon','judges',1,27,'canon','judges',2,3,'free',
      E'*they shall be as thorns in your sides, and their gods shall be a snare unto you* (Judges 2:3). Manasseh''s tolerated Canaanites who *would dwell in that land* (Judges 1:27) are exactly the thorns and snare the angel names. The geography of failure in chapter 1 becomes the verdict of judgment in chapter 2.'),

    -- THREAD 2 (★): Caleb and Achsah''s springs — the portion taken by faith
    ('canon','judges',1,12,'canon','joshua',15,16,'free',
      E'*And Caleb said, He that smiteth Kirjath-sepher, and taketh it, to him will I give Achsah my daughter to wife* (Joshua 15:16). Judges 1:12 records the identical word — the same Caleb, the same challenge, the same prize. The account already stood in Yahudah''s (Judah''s) allotted inheritance; Judges reaches back to it to show that where the tribes failed in the valley, Caleb''s house took the city by faith.'),
    ('canon','judges',1,13,'canon','joshua',15,17,'free',
      E'*And Othniel the son of Kenaz, the brother of Caleb, took it: and he gave him Achsah his daughter to wife* (Joshua 15:17). Othniel — Yashar''el''s (Israel''s) first deliverer to come (Judges 3:9) — is here the one who takes Kirjath-sepher, exactly as Judges 1:13 records. The man who will judge Yashar''el is introduced as the man who took the city when others would not.'),
    ('canon','judges',1,15,'canon','joshua',15,19,'free',
      E'*Who answered, Give me a blessing; for thou hast given me a south land; give me also springs of water. And he gave her the upper springs, and the nether springs* (Joshua 15:19). Word for word with Judges 1:15. Achsah asks her father for the blessing of water in a dry south land and receives both the upper and the nether springs — the faith that asks the Father for the blessing and is given the springs above and below.'),
    ('canon','judges',1,20,'canon','joshua',15,14,'free',
      E'*And Caleb drove thence the three sons of Anak, Sheshai, and Ahiman, and Talmai, the children of Anak* (Joshua 15:14). Judges 1:20 echoes it: *they gave Hebron unto Caleb, as Moses said: and he expelled thence the three sons of Anak*. The giants that made ten spies melt with fear are driven out by the one man who *wholly followed Yahuah* — Hebron taken, the Anakim expelled, the promise of Moses kept.'),

    -- THREAD 3: Yahudah shall go up first — the sceptre-tribe leads
    ('canon','judges',1,2,'canon','genesis',49,8,'free',
      E'*Yahudah (Judah), thou art he whom thy brethren shall praise: thy hand shall be in the neck of thine enemies; thy father''s children shall bow down before thee* (Genesis 49:8). Jacob''s dying word is why Yahudah goes up first: *Yahudah shall go up: behold, I have delivered the land into his hand* (Judges 1:2). The hand on the enemies'' neck is the hand Yahuah now fills with the land — the lion-tribe leading the conquest by the blessing spoken over its father.'),
    ('canon','judges',1,2,'canon','genesis',49,10,'free',
      E'*The sceptre shall not depart from Yahudah (Judah), nor a lawgiver from between his feet, until Shiloh come; and unto him shall the gathering of the people be* (Genesis 49:10). Yahudah goes up first (Judges 1:2) because the sceptre is his — the tribe that leads in the field is the tribe of the coming King. The conquest-lead of Judges 1 foreshadows the gathering of the people unto Shiloh, the Davidic King who comes from Yahudah.'),
    ('canon','judges',1,1,'canon','numbers',2,3,'free',
      E'*And on the east side toward the rising of the sun shall they of the standard of the camp of Yahudah (Judah) pitch throughout their armies* (Numbers 2:3). Yahudah held the place of the firstborn in the wilderness camp, pitched toward the sunrise; so when the tribes ask *Who shall go up... first?* (Judges 1:1), the answer is the tribe that always camped and marched first. The order of the camp becomes the order of the conquest.'),
    ('canon','judges',1,1,'canon','numbers',10,14,'free',
      E'*In the first place went the standard of the camp of the children of Yahudah (Judah) according to their armies* (Numbers 10:14). When Yashar''el (Israel) marched, Yahudah went first; when Yashar''el now asks who shall go up first against the Canaanites (Judges 1:1), the same tribe leads. The sceptre-tribe at the head of the march is the sceptre-tribe at the head of the war.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s345_jdg01_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s345_jdg01_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judges-1-the-canaanites-not-driven-out-the-snare-and-the-thorns',
       E'The Canaanites not driven out — the snare and the thorns, the seed of the apostasy cycle',
       E'After Joshua''s death the conquest is continued, but the chapter turns on a refrain of failure. *And Yahuah (LORD) was with Yahudah (Judah); and he drave out the inhabitants of the mountain; but could not drive out the inhabitants of the valley, because they had chariots of iron* (Judges 1:19). Then tribe after tribe *did not drive out*: *the children of Benjamin did not drive out the Jebusites* (1:21); *Neither did Manasseh drive out the inhabitants of Beth-shean... but the Canaanites would dwell in that land* (1:27); *Neither did Ephraim drive out the Canaanites that dwelt in Gezer* (1:29); Zebulun (1:30), Asher (1:31-32), Naphtali (1:33), and Dan forced back into the mountain (1:34). The summary verdict: *when Yashar''el (Israel) was strong... they put the Canaanites to tribute, and did not utterly drive them out* (1:28). This is precisely the disobedience Yahuah forewarned in the wilderness: *But if ye will not drive out the inhabitants of the land from before you; then it shall come to pass, that those which ye let remain of them shall be pricks in your eyes, and thorns in your sides* (Numbers 33:55); *thou shalt smite them, and utterly destroy them; thou shalt make no covenant with them, nor shew mercy unto them* (Deuteronomy 7:2), *for they will turn away thy son from following me, that they may serve other gods* (Deuteronomy 7:4). The angel of Yahuah seals the sentence in the very next chapter: *I will not drive them out from before you; but they shall be as thorns in your sides, and their gods shall be a snare unto you* (Judges 2:3). And Psalm 106 sings the long outcome: *They did not destroy the nations, concerning whom Yahuah (LORD) commanded them: But were mingled among the heathen, and learned their works. And they served their idols: which were a snare unto them* (Psalm 106:34-36). Incomplete obedience — tribute instead of utter destruction — is the seed of the whole book''s apostasy cycle.',
       sv.verse_id, ev.verse_id, 'free', 35650
  FROM _s345_jdg01_lookup sv, _s345_jdg01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=1 AND sv.verse_number=19
   AND ev.edition_slug='canon' AND ev.book_slug='judges' AND ev.chapter_number=1 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judges-1-caleb-and-achsahs-springs-the-portion-taken-by-faith',
       E'Caleb and Achsah''s springs — the portion taken by faith',
       E'Against the refrain of failure stands the faith that takes its portion. *And Caleb said, He that smiteth Kirjath-sepher, and taketh it, to him will I give Achsah my daughter to wife. And Othniel the son of Kenaz, Caleb''s younger brother, took it: and he gave him Achsah his daughter to wife* (Judges 1:12-13). When Achsah comes to her husband she asks her father for more: *Give me a blessing: for thou hast given me a south land; give me also springs of water. And Caleb gave her the upper springs and the nether springs* (1:15). This is the same account already recorded in Yahudah''s (Judah''s) allotted inheritance — *And Caleb said, He that smiteth Kirjath-sepher... to him will I give Achsah my daughter to wife* (Joshua 15:16); *And Othniel the son of Kenaz, the brother of Caleb, took it* (Joshua 15:17); *he gave her the upper springs, and the nether springs* (Joshua 15:19). And the giants are driven where the tribes left the valley un-taken: *they gave Hebron unto Caleb, as Moses said: and he expelled thence the three sons of Anak* (1:20) — *And Caleb drove thence the three sons of Anak, Sheshai, and Ahiman, and Talmai* (Joshua 15:14). Othniel, who takes the city here, will be Yashar''el''s (Israel''s) first deliverer (Judges 3:9). Where the nation tolerates the Canaanite, Caleb''s house takes the hill, the city, and the springs — faith asks the father for the blessing and is given the waters above and below.',
       sv.verse_id, ev.verse_id, 'free', 35653
  FROM _s345_jdg01_lookup sv, _s345_jdg01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=1 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='judges' AND ev.chapter_number=1 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judges-1-yahudah-shall-go-up-first-the-sceptre-tribe-leads',
       E'Yahudah shall go up first — the sceptre-tribe leads the conquest',
       E'*Now after the death of Joshua it came to pass, that the children of Yashar''el (Israel) asked Yahuah (LORD), saying, Who shall go up for us against the Canaanites first, to fight against them? And Yahuah (LORD) said, Yahudah (Judah) shall go up: behold, I have delivered the land into his hand* (Judges 1:1-2). The lion-tribe leads because of the dying blessing of Jacob: *Yahudah (Judah), thou art he whom thy brethren shall praise: thy hand shall be in the neck of thine enemies; thy father''s children shall bow down before thee* (Genesis 49:8); *The sceptre shall not depart from Yahudah (Judah), nor a lawgiver from between his feet, until Shiloh come; and unto him shall the gathering of the people be* (Genesis 49:10). Yahudah held the firstborn''s place in the wilderness camp too — *on the east side toward the rising of the sun shall they of the standard of the camp of Yahudah (Judah) pitch* (Numbers 2:3); *In the first place went the standard of the camp of the children of Yahudah (Judah)* (Numbers 10:14). So Yahudah goes up first and takes Jerusalem (1:8), the south, and the coastal cities. The order of the camp becomes the order of the conquest, and the sceptre-tribe at the head of the war foreshadows the Davidic King — the gathering of the people unto Shiloh — who comes from Yahudah.',
       sv.verse_id, ev.verse_id, 'free', 35656
  FROM _s345_jdg01_lookup sv, _s345_jdg01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=1 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='judges' AND ev.chapter_number=1 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *those which ye let remain of them shall be pricks in your eyes, and thorns in your sides* (Numbers 33:55) — the wilderness warning fulfilled in Judges 1:19, the inhabitants of the valley not driven out.'
  FROM cross_reference_threads t
  JOIN _s345_jdg01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=1 AND sv.verse_number=19
  JOIN _s345_jdg01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=33 AND tv.verse_number=55
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-1-the-canaanites-not-driven-out-the-snare-and-the-thorns'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*pricks in your eyes, and thorns in your sides* (Numbers 33:55) — Manasseh''s tolerated Canaanites *would dwell in that land* (Judges 1:27); what is let remain becomes the thorn.'
  FROM cross_reference_threads t
  JOIN _s345_jdg01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=1 AND sv.verse_number=27
  JOIN _s345_jdg01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=33 AND tv.verse_number=55
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-1-the-canaanites-not-driven-out-the-snare-and-the-thorns'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *thou shalt... utterly destroy them; thou shalt make no covenant with them* (Deuteronomy 7:2) — the command was destruction, not the tribute of Judges 1:28.'
  FROM cross_reference_threads t
  JOIN _s345_jdg01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=1 AND sv.verse_number=28
  JOIN _s345_jdg01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-1-the-canaanites-not-driven-out-the-snare-and-the-thorns'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*they will turn away thy son from following me, that they may serve other gods* (Deuteronomy 7:4) — why driving-out had to be complete; the un-destroyed Canaanite of Judges 1:28 turns the next generation to Baalim.'
  FROM cross_reference_threads t
  JOIN _s345_jdg01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=1 AND sv.verse_number=28
  JOIN _s345_jdg01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-1-the-canaanites-not-driven-out-the-snare-and-the-thorns'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★★ *They did not destroy the nations, concerning whom Yahuah (LORD) commanded them* (Psalm 106:34) — the inspired verdict on Judges 1:28: they did not do what Yahuah commanded.'
  FROM cross_reference_threads t
  JOIN _s345_jdg01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=1 AND sv.verse_number=28
  JOIN _s345_jdg01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=106 AND tv.verse_number=34
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-1-the-canaanites-not-driven-out-the-snare-and-the-thorns'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★★ *But were mingled among the heathen, and learned their works* (Psalm 106:35) — the outcome of the un-driven-out of Judges 1:28: not separation but assimilation.'
  FROM cross_reference_threads t
  JOIN _s345_jdg01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=1 AND sv.verse_number=28
  JOIN _s345_jdg01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=106 AND tv.verse_number=35
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-1-the-canaanites-not-driven-out-the-snare-and-the-thorns'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*And they served their idols: which were a snare unto them* (Psalm 106:36) — the Canaanites left for tribute (Judges 1:28) become the snare; what was spared becomes the trap.'
  FROM cross_reference_threads t
  JOIN _s345_jdg01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=1 AND sv.verse_number=28
  JOIN _s345_jdg01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=106 AND tv.verse_number=36
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-1-the-canaanites-not-driven-out-the-snare-and-the-thorns'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*I will not drive them out from before you; but they shall be as thorns in your sides, and their gods shall be a snare unto you* (Judges 2:3) — the angel''s sentence on Benjamin''s failure to drive out the Jebusites (Judges 1:21).'
  FROM cross_reference_threads t
  JOIN _s345_jdg01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=1 AND sv.verse_number=21
  JOIN _s345_jdg01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=2 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-1-the-canaanites-not-driven-out-the-snare-and-the-thorns'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'*they shall be as thorns in your sides, and their gods shall be a snare unto you* (Judges 2:3) — Manasseh''s tolerated Canaanites (Judges 1:27) are the thorns and snare the angel names; chapter 1''s geography becomes chapter 2''s verdict.'
  FROM cross_reference_threads t
  JOIN _s345_jdg01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=1 AND sv.verse_number=27
  JOIN _s345_jdg01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=2 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-1-the-canaanites-not-driven-out-the-snare-and-the-thorns'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *He that smiteth Kirjath-sepher, and taketh it, to him will I give Achsah my daughter to wife* (Joshua 15:16) — the identical account in Yahudah''s inheritance, the challenge Judges 1:12 records.'
  FROM cross_reference_threads t
  JOIN _s345_jdg01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=1 AND sv.verse_number=12
  JOIN _s345_jdg01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=15 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-1-caleb-and-achsahs-springs-the-portion-taken-by-faith'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*And Othniel the son of Kenaz, the brother of Caleb, took it* (Joshua 15:17) — Othniel, Yashar''el''s coming first deliverer (Judges 3:9), takes the city as Judges 1:13 records.'
  FROM cross_reference_threads t
  JOIN _s345_jdg01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=1 AND sv.verse_number=13
  JOIN _s345_jdg01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=15 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-1-caleb-and-achsahs-springs-the-portion-taken-by-faith'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Give me a blessing... give me also springs of water. And he gave her the upper springs, and the nether springs* (Joshua 15:19) — word for word with Judges 1:15; faith asks the father and is given the waters above and below.'
  FROM cross_reference_threads t
  JOIN _s345_jdg01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=1 AND sv.verse_number=15
  JOIN _s345_jdg01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=15 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-1-caleb-and-achsahs-springs-the-portion-taken-by-faith'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*And Caleb drove thence the three sons of Anak, Sheshai, and Ahiman, and Talmai* (Joshua 15:14) — the giants expelled by the one who wholly followed Yahuah; Judges 1:20, *he expelled thence the three sons of Anak*.'
  FROM cross_reference_threads t
  JOIN _s345_jdg01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=1 AND sv.verse_number=20
  JOIN _s345_jdg01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=15 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-1-caleb-and-achsahs-springs-the-portion-taken-by-faith'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Yahudah (Judah), thou art he whom thy brethren shall praise: thy hand shall be in the neck of thine enemies* (Genesis 49:8) — Jacob''s blessing is why Yahudah goes up first (Judges 1:2).'
  FROM cross_reference_threads t
  JOIN _s345_jdg01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=1 AND sv.verse_number=2
  JOIN _s345_jdg01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-1-yahudah-shall-go-up-first-the-sceptre-tribe-leads'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*The sceptre shall not depart from Yahudah (Judah)... until Shiloh come; and unto him shall the gathering of the people be* (Genesis 49:10) — the sceptre-tribe leads (Judges 1:2), foreshadowing the Davidic King from Yahudah.'
  FROM cross_reference_threads t
  JOIN _s345_jdg01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=1 AND sv.verse_number=2
  JOIN _s345_jdg01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-1-yahudah-shall-go-up-first-the-sceptre-tribe-leads'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*on the east side toward the rising of the sun shall they of the standard of the camp of Yahudah (Judah) pitch* (Numbers 2:3) — Yahudah held the firstborn''s place in the camp, the answer to *who shall go up first?* (Judges 1:1).'
  FROM cross_reference_threads t
  JOIN _s345_jdg01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=1 AND sv.verse_number=1
  JOIN _s345_jdg01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=2 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-1-yahudah-shall-go-up-first-the-sceptre-tribe-leads'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*In the first place went the standard of the camp of the children of Yahudah (Judah)* (Numbers 10:14) — Yahudah marched first; the same tribe leads the conquest of Judges 1:1.'
  FROM cross_reference_threads t
  JOIN _s345_jdg01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=1 AND sv.verse_number=1
  JOIN _s345_jdg01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=10 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-1-yahudah-shall-go-up-first-the-sceptre-tribe-leads'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_judges_2.sql (Judges 2) -----
-- Chapter: Judges 2 — THE APOSTASY CYCLE INTRODUCED (the keystone chapter of the book): the Angel of
--          Yahuah comes up from Gilgal to Bochim and rebukes the broken obedience (the Formed Son who
--          bears the Name, the covenant-keeper); the generation arises that knew not Yahuah and serves
--          Baalim; ★★★ the cycle laid out as the pattern of the whole book — sin / servitude /
--          supplication / salvation (a judge/deliverer raised, a shadow-saviour) / relapse worse than
--          before; the nations left un-driven to PROVE Yashar'el
-- Tag: jdg02   View: _s345_jdg02_lookup   Sort band: 35675, 35678, 35681, 35684
--
-- Judges 2 coverage:
--   v.1-3  (the ANGEL of Yahuah comes up from Gilgal to Bochim: *I made you to go up out of Egypt... I
--           will never break my covenant with you. And ye shall make no league with the inhabitants of
--           this land... but ye have not obeyed my voice... they shall be as thorns in your sides, and
--           their gods shall be a snare unto you*)
--          NT:     none warranted at the verse (the Angel-with-the-Name theophany is carried laterally
--                  in the Tanakh; the Formed-Son frame named in prose)
--          Extras: none warranted
--          Tanakh: Exodus 23:20-21 (Behold I send an Angel before thee... my name is in him), Exodus
--                  23:32-33 (make no covenant... it will surely be a snare), Deuteronomy 7:2 (thou shalt
--                  make no covenant with them, nor shew mercy)
--   v.4-9  (the people weep at Bochim and sacrifice; Joshua dies at 110; the people served Yahuah all
--           his days and the elders that outlived him)
--          NT/Extras/Tanakh: none warranted as standalone threads — the weeping/burial frame the turn
--                  into the next generation; woven into the surrounding threads
--   v.10-13 (another generation arose which knew not Yahuah; they did evil, served Baalim, forsook Yahuah
--            Elohim of their fathers, served Baal and Ashtaroth)
--          NT:     none warranted at the verse
--          Extras: none warranted
--          Tanakh: Nehemiah 9:26 (they cast thy law behind their backs), Psalm 106:35-36 (mingled among
--                  the heathen, served their idols which were a snare)
--   v.11-19 (★★★ THE CYCLE: did evil → Yahuah's anger hot, sold into the hands of spoilers → nevertheless
--            Yahuah raised up JUDGES which delivered them → it repented Yahuah because of their groanings
--            → when the judge was dead they returned and corrupted themselves MORE than their fathers)
--          NT:     Acts 13:20,23 (he gave unto them judges... until Samuel... raised up David... of this
--                  man's seed hath Elohim raised unto Yashar'el a Saviour, Yahusha) — the judges as
--                  shadow-saviours pointing to the true Deliverer who ends the cycle
--          Extras: none warranted
--          Tanakh: Nehemiah 9:27-28 (thou gavest them saviours, who saved them... when they returned and
--                  cried, thou heardest them), Psalm 106:43-45 (many times did he deliver them... he
--                  remembered for them his covenant, and repented according to his mercies)
--   v.20-23 (Yahuah's anger hot: because this people transgressed my covenant, I will not drive out the
--            nations which Joshua left, that through them I may PROVE Yashar'el whether they will keep the
--            way of Yahuah)
--          NT:     none warranted at the verse (the proving/testing frame is Torah-lateral; the
--                  generation-tested frame named in prose, cf. Heb 3 the provocation)
--          Extras: none warranted
--          Tanakh: Judges 3:1,4 (these are the nations Yahuah left to prove Yashar'el... to know whether
--                  they would hearken), Exodus 23:29 (I will not drive them out in one year, by little and
--                  little), Deuteronomy 8:2 (to prove thee, to know what was in thine heart, whether thou
--                  wouldest keep his commandments)
--
-- Threads:
--   judges-2-the-angel-of-yahuah-the-covenant-keeper-rebukes-at-bochim  [Tanakh: Exodus, Deuteronomy]                   (free)
--   judges-2-the-generation-that-knew-not-yahuah-and-served-baalim      [Tanakh: Nehemiah, Psalm]                       (free)
--   judges-2-the-apostasy-cycle-the-judges-as-shadow-saviours           [Tanakh: Nehemiah, Psalm | NT: Acts]            (free)
--   judges-2-the-nations-left-to-prove-yasharel                         [Tanakh: Judges, Exodus, Deuteronomy]           (free)
--
-- Framework notes: ★ The Angel of Yahuah who *came up from Gilgal to Bochim* (2:1) and says *I made you to
-- go up out of Egypt... I will never break my covenant with you* is the Formed Son who bears the Name —
-- the same Angel of Exodus 23:20-21, *Behold, I send an Angel before thee... my name is in him*; He who
-- led Yashar'el out and who now rebukes the broken obedience is Yahuah and has a Father, the covenant-keeper
-- who never breaks His word even when the people break theirs. The un-driven nations become *thorns in your
-- sides* and *a snare* exactly as Torah warned (Exod 23:32-33; Deut 7:2) — the consequence of disobedience,
-- never the Torah as curse. ★★★ The keystone is the CYCLE (2:11-19), the pattern of the whole book: sin
-- (*did evil... served Baalim*), servitude (*the anger of Yahuah was hot... he sold them into the hands of
-- their enemies*), supplication (their *groanings*), salvation (*Yahuah raised up judges, which delivered
-- them*), relapse worse than before (*when the judge was dead, they returned, and corrupted themselves more
-- than their fathers*) — and underneath it all the long-suffering mercy, *it repented Yahuah because of their
-- groanings* (2:18). Nehemiah confesses the same mercy, *thou gavest them saviours, who saved them* (Neh
-- 9:27); the Psalm sings it, *he remembered for them his covenant, and repented according to the multitude of
-- his mercies* (Ps 106:45). The judges are shadow-saviours — Yahuah's raised deliverers — and the line runs
-- straight to Acts: *he gave unto them judges... until Samuel... raised up David... Of this man's seed hath
-- Elohim raised unto Yashar'el a Saviour, Yahusha* (Acts 13:20-23) — the true Deliverer who breaks the cycle
-- for ever. ★ The nations left un-driven are the proving (2:22) — *that through them I may prove Yashar'el* —
-- the same testing of Judges 3:1,4, Exodus 23:29, and Deuteronomy 8:2 (*to prove thee, to know what was in
-- thine heart, whether thou wouldest keep his commandments*); the snare is also the schoolmaster. All members
-- canon → every thread tier_required 'free'.

CREATE TEMP VIEW _s345_jdg02_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: the Angel of Yahuah, the covenant-keeper, rebukes at Bochim (Exodus / Deuteronomy)
    ('canon','judges',2,1,'canon','exodus',23,20,'free',E'*Behold, I send an Angel before thee, to keep thee in the way, and to bring thee into the place which I have prepared* (Exodus 23:20). The One who *came up from Gilgal to Bochim, and said, I made you to go up out of Egypt, and have brought you unto the land which I sware unto your fathers; and I said, I will never break my covenant with you* (2:1) is that very Angel — the Formed Son who led Yashar''el (Israel) out and into the land, now standing in the land to rebuke. The same Sender, the same journey, the same Name brought up out of Egypt.'),
    ('canon','judges',2,1,'canon','exodus',23,21,'free',E'*Beware of him, and obey his voice, provoke him not; for he will not pardon your transgressions: for my name is in him* (Exodus 23:21). The Angel of Yahuah at Bochim bears the Name and speaks as Yahuah Himself — *I made you to go up out of Egypt... I will never break my covenant with you* (2:1) — the covenant-keeper whose voice they were to obey; the Formed Son who has the Name in Him, who is Yahuah and has a Father. The very *ye have not obeyed my voice* (2:2) is the provoking Exodus 23:21 forbade.'),
    ('canon','judges',2,2,'canon','exodus',23,32,'free',E'*Thou shalt make no covenant with them, nor with their gods* (Exodus 23:32). The Angel''s charge at Bochim repeats the command exactly: *ye shall make no league with the inhabitants of this land; ye shall throw down their altars: but ye have not obeyed my voice* (2:2). The league forbidden in Exodus is the league made in Judges — the broken word that springs the snare.'),
    ('canon','judges',2,3,'canon','exodus',23,33,'free',E'*They shall not dwell in thy land, lest they make thee sin against me: for if thou serve their gods, it will surely be a snare unto thee* (Exodus 23:33). The Angel pronounces the warned consequence as sentence: *I will not drive them out from before you; but they shall be as thorns in your sides, and their gods shall be a snare unto you* (2:3). The snare Yahuah foretold in the covenant is now left in place because the covenant was broken — the consequence of disobedience, never the Torah as curse.'),
    ('canon','judges',2,2,'canon','deuteronomy',7,2,'free',E'*And when Yahuah Elohayka (the LORD thy God) shall deliver them before thee; thou shalt smite them, and utterly destroy them; thou shalt make no covenant with them, nor shew mercy unto them* (Deuteronomy 7:2). The Bochim rebuke holds the people to this Torah: *ye shall make no league with the inhabitants of this land... but ye have not obeyed my voice; why have ye done this?* (2:2). They were charged to make no covenant; they made one; the Angel names the disobedience for what it is.'),
    -- THREAD 2: the generation that knew not Yahuah and served Baalim (Nehemiah / Psalm)
    ('canon','judges',2,10,'canon','nehemiah',9,26,'free',E'*Nevertheless they were disobedient, and rebelled against thee, and cast thy law behind their backs, and slew thy prophets which testified against them to turn them to thee, and they wrought great provocations* (Nehemiah 9:26). The generation that *knew not Yahuah (LORD), nor yet the works which he had done for Yashar''el (Israel)* (2:10) does precisely this — to forget the works is to cast the law behind the back. Nehemiah''s confession reads the same descent: a people who had the covenant and turned from it.'),
    ('canon','judges',2,12,'canon','psalms',106,35,'free',E'*But were mingled among the heathen, and learned their works* (Psalm 106:35). Judges names the same mingling and learning: *they forsook Yahuah Elohim (the LORD God) of their fathers... and followed other gods, of the gods of the people that were round about them, and bowed themselves unto them* (2:12). The nations left un-driven became the teachers; the people learned the works of the heathen round about.'),
    ('canon','judges',2,13,'canon','psalms',106,36,'free',E'*And they served their idols: which were a snare unto them* (Psalm 106:36). The Psalm names exactly the outcome the Angel foretold (the gods a snare, 2:3) and Judges records: *And they forsook Yahuah (LORD), and served Baal and Ashtaroth* (2:13). Baal and Ashtaroth are the idols that became the snare — the worship of the land''s gods that the league with the land''s people made possible.'),
    -- THREAD 3: ★★★ the apostasy cycle — the judges as shadow-saviours (Nehemiah / Psalm / Acts)
    ('canon','judges',2,16,'canon','nehemiah',9,27,'free',E'*Therefore thou deliveredst them into the hand of their enemies, who vexed them: and in the time of their trouble, when they cried unto thee, thou heardest them from heaven; and according to thy manifold mercies thou gavest them saviours, who saved them out of the hand of their enemies* (Nehemiah 9:27). This IS the cycle of Judges 2 confessed back: *Nevertheless Yahuah (LORD) raised up judges, which delivered them out of the hand of those that spoiled them* (2:16). The judges are Nehemiah''s *saviours* — Yahuah''s raised deliverers, shadows of the true Saviour, mercy answering the cry.'),
    ('canon','judges',2,19,'canon','nehemiah',9,28,'free',E'*But after they had rest, they did evil again before thee: therefore leftest thou them in the hand of their enemies, so that they had the dominion over them: yet when they returned, and cried unto thee, thou heardest them from heaven; and many times didst thou deliver them according to thy mercies* (Nehemiah 9:28). The relapse Judges names — *when the judge was dead, that they returned, and corrupted themselves more than their fathers* (2:19) — is the very wheel Nehemiah turns: rest, then evil again, then the cry, then deliverance again, *many times*. The long-suffering mercy keeps raising deliverers though the people keep relapsing.'),
    ('canon','judges',2,18,'canon','psalms',106,43,'free',E'*Many times did he deliver them; but they provoked him with their counsel, and were brought low for their iniquity* (Psalm 106:43). The Psalm sings the same *many times* of the cycle: *when Yahuah (LORD) raised them up judges, then Yahuah (LORD) was with the judge, and delivered them out of the hand of their enemies all the days of the judge* (2:18). Delivered, then provoking again — the wheel of Judges set to music.'),
    ('canon','judges',2,18,'canon','psalms',106,44,'free',E'*Nevertheless he regarded their affliction, when he heard their cry* (Psalm 106:44). The *Nevertheless* of the Psalm is the *Nevertheless* of Judges (2:16) — the turn from wrath to mercy at the sound of the groaning: *for it repented Yahuah (LORD) because of their groanings by reason of them that oppressed them and vexed them* (2:18). Yahuah hears the cry and relents; the affliction He regards is the supplication in the cycle.'),
    ('canon','judges',2,18,'canon','psalms',106,45,'free',E'*And he remembered for them his covenant, and repented according to the multitude of his mercies* (Psalm 106:45). The deepest line of the cycle: *it repented Yahuah (LORD) because of their groanings* (2:18). The covenant the Angel said He would never break (2:1) is the covenant He remembers here — the relenting is not weakness but faithfulness, mercy multiplied to a people who keep breaking faith.'),
    ('canon','judges',2,16,'canon','acts',13,20,'free',E'*And after that he gave unto them judges about the space of four hundred and fifty years, until Samuel the prophet* (Acts 13:20). Paul rehearses the whole age of the cycle in one line — the judges Yahuah *raised up... which delivered them* (2:16) — and sets it as the run-up to the king and the Saviour to come. The era of shadow-saviours is the stage on which the true Deliverer will be raised.'),
    ('canon','judges',2,16,'canon','acts',13,23,'free',E'*Of this man''s seed hath Elohim (God) according to his promise raised unto Yashar''el (Israel) a Saviour, Yahusha (Jesus)* (Acts 13:23). The line that began with the judges *raised up* to deliver (2:16) ends here: out of David''s seed Yahuah raises the one Saviour who breaks the cycle for ever. Every judge was a shadow of this — a deliverer raised in mercy — but Yahusha is the Deliverer who saves not for a generation but for ever, the end of the wheel of sin and servitude.'),
    -- THREAD 4: the nations left to prove Yashar'el (Judges / Exodus / Deuteronomy)
    ('canon','judges',2,21,'canon','judges',3,1,'free',E'*Now these are the nations which Yahuah (LORD) left, to prove Yashar''el (Israel) by them, even as many of Yashar''el (Israel) as had not known all the wars of Canaan* (Judges 3:1). The next chapter names the very nations of the sentence: *I also will not henceforth drive out any from before them of the nations which Joshua left when he died* (2:21). The un-driven nations are not abandonment but a proving — left by design.'),
    ('canon','judges',2,22,'canon','judges',3,4,'free',E'*And they were to prove Yashar''el (Israel) by them, to know whether they would hearken unto the commandments of Yahuah (LORD), which he commanded their fathers by the hand of Moses* (Judges 3:4). This is the purpose stated in 2:22 word for word: *That through them I may prove Yashar''el (Israel), whether they will keep the way of Yahuah (LORD) to walk therein, as their fathers did keep it, or not*. The nations are the test of obedience to the Torah given by Moses — the snare is also the schoolmaster.'),
    ('canon','judges',2,23,'canon','exodus',23,29,'free',E'*I will not drive them out from before thee in one year; lest the land become desolate, and the beast of the field multiply against thee* (Exodus 23:29). Yahuah''s *driving out by little and little* was always part of the plan — and now, after the covenant is broken, *Yahuah (LORD) left those nations, without driving them out hastily* (2:23). The measured leaving of Exodus becomes the proving-ground of Judges.'),
    ('canon','judges',2,22,'canon','deuteronomy',8,2,'free',E'*And thou shalt remember all the way which Yahuah Elohayka (the LORD thy God) led thee these forty years in the wilderness, to humble thee, and to prove thee, to know what was in thine heart, whether thou wouldest keep his commandments, or no* (Deuteronomy 8:2). The proving by the nations (2:22) is the same proving Moses named — *to know what was in thine heart, whether thou wouldest keep his commandments*. Yahuah tests His people to reveal the heart; the test of the wilderness and the test of the un-driven nations are one purpose, that they walk in His way and keep it.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s345_jdg02_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s345_jdg02_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judges-2-the-angel-of-yahuah-the-covenant-keeper-rebukes-at-bochim',
       E'The Angel of Yahuah, the Covenant-Keeper, Rebukes at Bochim',
       E'The book turns on a theophany: *And an angel of Yahuah (LORD) came up from Gilgal to Bochim, and said, I made you to go up out of Egypt, and have brought you unto the land which I sware unto your fathers; and I said, I will never break my covenant with you* (Judges 2:1). This is no created messenger but the Formed Son who bears the Name — the very Angel Yahuah promised in the wilderness: *Behold, I send an Angel before thee, to keep thee in the way, and to bring thee into the place which I have prepared* (Exodus 23:20), of whom Yahuah said, *Beware of him, and obey his voice, provoke him not; for he will not pardon your transgressions: for my name is in him* (Exodus 23:21). He who brought them up out of Egypt now stands in the land they were brought into, and speaks as Yahuah Himself — *I will never break my covenant with you* — the covenant-keeper who never breaks faith though the people break theirs. He is Yahuah and has a Father; the Name is in Him. His charge is the Torah they were given: *ye shall make no league with the inhabitants of this land; ye shall throw down their altars: but ye have not obeyed my voice; why have ye done this?* (2:2) — the very command of *thou shalt make no covenant with them, nor with their gods* (Exodus 23:32) and *thou shalt make no covenant with them, nor shew mercy unto them* (Deuteronomy 7:2). Because the league was made, the warned consequence falls as sentence: *I will not drive them out from before you; but they shall be as thorns in your sides, and their gods shall be a snare unto you* (2:3) — the snare Yahuah foretold, *if thou serve their gods, it will surely be a snare unto thee* (Exodus 23:33). The thorns and the snare are the fruit of disobedience, never the Torah as curse; and the people, hearing the Angel, *lifted up their voice, and wept* (2:4) — Bochim, the place of weeping.',
       sv.verse_id, ev.verse_id, 'free', 35675
  FROM _s345_jdg02_lookup sv, _s345_jdg02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=2 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='judges' AND ev.chapter_number=2 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judges-2-the-generation-that-knew-not-yahuah-and-served-baalim',
       E'The Generation That Knew Not Yahuah and Served Baalim',
       E'When the deliverer-generation passes, the descent begins: *And also all that generation were gathered unto their fathers: and there arose another generation after them, which knew not Yahuah (LORD), nor yet the works which he had done for Yashar''el (Israel)* (Judges 2:10). Not knowing the works is the root — for to forget what Yahuah did is to cast His law behind the back, exactly as Nehemiah confesses: *Nevertheless they were disobedient, and rebelled against thee, and cast thy law behind their backs, and slew thy prophets which testified against them to turn them to thee, and they wrought great provocations* (Nehemiah 9:26). So *the children of Yashar''el (Israel) did evil in the sight of Yahuah (LORD), and served Baalim: and they forsook Yahuah Elohim (the LORD God) of their fathers, which brought them out of the land of Egypt, and followed other gods, of the gods of the people that were round about them* (2:11-12). The Psalm names the mechanism — the nations left un-driven became the teachers: *But were mingled among the heathen, and learned their works* (Psalm 106:35), *And they served their idols: which were a snare unto them* (Psalm 106:36). The league with the land''s people made the worship of the land''s gods possible, and the snare the Angel foretold (2:3) closed: *And they forsook Yahuah (LORD), and served Baal and Ashtaroth* (2:13). A generation that did not know Yahuah''s works is a generation with nothing to hold it; forgetting the Deliverer, they served the gods of those they were charged to drive out.',
       sv.verse_id, ev.verse_id, 'free', 35678
  FROM _s345_jdg02_lookup sv, _s345_jdg02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=2 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='judges' AND ev.chapter_number=2 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judges-2-the-apostasy-cycle-the-judges-as-shadow-saviours',
       E'The Apostasy Cycle — the Judges as Shadow-Saviours',
       E'Here the whole book is laid out in miniature — the wheel that turns from Othniel to Samson: SIN, *the children of Yashar''el (Israel) did evil in the sight of Yahuah (LORD), and served Baalim* (2:11); SERVITUDE, *the anger of Yahuah (LORD) was hot against Yashar''el (Israel)... and he sold them into the hands of their enemies round about, so that they could not any longer stand* (2:14-15); SUPPLICATION, their *groanings by reason of them that oppressed them and vexed them* (2:18); SALVATION, *Nevertheless Yahuah (LORD) raised up judges, which delivered them out of the hand of those that spoiled them* (2:16), *and Yahuah (LORD) was with the judge, and delivered them out of the hand of their enemies all the days of the judge: for it repented Yahuah (LORD) because of their groanings* (2:18); and RELAPSE worse than before, *when the judge was dead, that they returned, and corrupted themselves more than their fathers, in following other gods... they ceased not from their own doings, nor from their stubborn way* (2:19). Nehemiah confesses the identical cycle and names the judges for what they are — saviours: *thou gavest them saviours, who saved them out of the hand of their enemies* (Nehemiah 9:27); *yet when they returned, and cried unto thee, thou heardest them from heaven; and many times didst thou deliver them according to thy mercies* (Nehemiah 9:28). The Psalm sings it: *Many times did he deliver them; but they provoked him with their counsel* (Psalm 106:43); *Nevertheless he regarded their affliction, when he heard their cry: and he remembered for them his covenant, and repented according to the multitude of his mercies* (Psalm 106:44-45) — the covenant the Angel swore He would never break (2:1) is the covenant He remembers when He relents. The judges are shadow-saviours, Yahuah''s raised deliverers, mercy answering the cry; but each saves for only a generation, and the wheel turns again. The line runs straight to its end: *he gave unto them judges... until Samuel the prophet* (Acts 13:20), then David, and then — *Of this man''s seed hath Elohim (God) according to his promise raised unto Yashar''el (Israel) a Saviour, Yahusha (Jesus)* (Acts 13:23). Every judge raised in mercy was a shadow of the one Deliverer who breaks the cycle not for a generation but for ever.',
       sv.verse_id, ev.verse_id, 'free', 35681
  FROM _s345_jdg02_lookup sv, _s345_jdg02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=2 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='judges' AND ev.chapter_number=2 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judges-2-the-nations-left-to-prove-yasharel',
       E'The Nations Left to Prove Yashar''el',
       E'The un-driven nations are not Yahuah''s defeat but His proving-ground. Because the covenant was broken, the sentence stands: *And the anger of Yahuah (LORD) was hot against Yashar''el (Israel); and he said, Because that this people hath transgressed my covenant which I commanded their fathers... I also will not henceforth drive out any from before them of the nations which Joshua left when he died: That through them I may prove Yashar''el (Israel), whether they will keep the way of Yahuah (LORD) to walk therein, as their fathers did keep it, or not* (Judges 2:20-22). The next chapter names the very nations and repeats the purpose: *Now these are the nations which Yahuah (LORD) left, to prove Yashar''el (Israel) by them* (Judges 3:1), *to know whether they would hearken unto the commandments of Yahuah (LORD), which he commanded their fathers by the hand of Moses* (Judges 3:4). The measured leaving was always Yahuah''s way — *I will not drive them out from before thee in one year; lest the land become desolate, and the beast of the field multiply against thee* (Exodus 23:29) — and so *Yahuah (LORD) left those nations, without driving them out hastily* (2:23). This is the same testing Moses set in the wilderness: *to humble thee, and to prove thee, to know what was in thine heart, whether thou wouldest keep his commandments, or no* (Deuteronomy 8:2). The snare that judges the disobedient is also the schoolmaster that proves the heart — Yahuah leaves the nations not to crush His people but to reveal whether they will keep His way and walk therein.',
       sv.verse_id, ev.verse_id, 'free', 35684
  FROM _s345_jdg02_lookup sv, _s345_jdg02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=2 AND sv.verse_number=20
   AND ev.edition_slug='canon' AND ev.book_slug='judges' AND ev.chapter_number=2 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Exodus 23:20 — *Behold, I send an Angel before thee... to bring thee into the place which I have prepared*: the Angel who came up from Gilgal (2:1) is that promised Angel, the Formed Son who led them in.'
  FROM cross_reference_threads t
  JOIN _s345_jdg02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=2 AND sv.verse_number=1
  JOIN _s345_jdg02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=23 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-2-the-angel-of-yahuah-the-covenant-keeper-rebukes-at-bochim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Exodus 23:21 — *provoke him not... for my name is in him*: the Angel at Bochim bears the Name and speaks as Yahuah (2:1) — the Formed Son who is Yahuah and has a Father.'
  FROM cross_reference_threads t
  JOIN _s345_jdg02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=2 AND sv.verse_number=1
  JOIN _s345_jdg02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=23 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-2-the-angel-of-yahuah-the-covenant-keeper-rebukes-at-bochim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Exodus 23:32 — *Thou shalt make no covenant with them, nor with their gods*: the league forbidden in Exodus is the league made in Judges (2:2), the broken word.'
  FROM cross_reference_threads t
  JOIN _s345_jdg02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=2 AND sv.verse_number=2
  JOIN _s345_jdg02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=23 AND tv.verse_number=32
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-2-the-angel-of-yahuah-the-covenant-keeper-rebukes-at-bochim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Exodus 23:33 — *if thou serve their gods, it will surely be a snare unto thee*: the snare Yahuah foretold is now left in place (2:3) because the covenant was broken — consequence, never Torah as curse.'
  FROM cross_reference_threads t
  JOIN _s345_jdg02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=2 AND sv.verse_number=3
  JOIN _s345_jdg02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=23 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-2-the-angel-of-yahuah-the-covenant-keeper-rebukes-at-bochim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Deuteronomy 7:2 — *thou shalt make no covenant with them, nor shew mercy unto them*: the Bochim rebuke holds the people to this Torah — they made the league they were charged to refuse (2:2).'
  FROM cross_reference_threads t
  JOIN _s345_jdg02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=2 AND sv.verse_number=2
  JOIN _s345_jdg02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-2-the-angel-of-yahuah-the-covenant-keeper-rebukes-at-bochim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Nehemiah 9:26 — *cast thy law behind their backs*: to *know not... the works which he had done* (2:10) is to forget Yahuah and cast off His law — Nehemiah''s confession of the same descent.'
  FROM cross_reference_threads t
  JOIN _s345_jdg02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=2 AND sv.verse_number=10
  JOIN _s345_jdg02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=9 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-2-the-generation-that-knew-not-yahuah-and-served-baalim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Psalm 106:35 — *were mingled among the heathen, and learned their works*: the nations left un-driven became the teachers; Yashar''el followed the gods of the people round about (2:12).'
  FROM cross_reference_threads t
  JOIN _s345_jdg02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=2 AND sv.verse_number=12
  JOIN _s345_jdg02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=106 AND tv.verse_number=35
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-2-the-generation-that-knew-not-yahuah-and-served-baalim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Psalm 106:36 — *served their idols: which were a snare unto them*: the snare the Angel foretold (2:3) closes — Baal and Ashtaroth (2:13) the idols that became the trap.'
  FROM cross_reference_threads t
  JOIN _s345_jdg02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=2 AND sv.verse_number=13
  JOIN _s345_jdg02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=106 AND tv.verse_number=36
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-2-the-generation-that-knew-not-yahuah-and-served-baalim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Nehemiah 9:27 — *thou gavest them saviours, who saved them*: the judges *raised up... which delivered them* (2:16) ARE Nehemiah''s saviours — Yahuah''s raised deliverers, shadows of the true Saviour.'
  FROM cross_reference_threads t
  JOIN _s345_jdg02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=2 AND sv.verse_number=16
  JOIN _s345_jdg02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=9 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-2-the-apostasy-cycle-the-judges-as-shadow-saviours'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Nehemiah 9:28 — *after they had rest, they did evil again... many times didst thou deliver them*: the relapse of 2:19 (corrupted themselves MORE than their fathers) is the same wheel Nehemiah turns.'
  FROM cross_reference_threads t
  JOIN _s345_jdg02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=2 AND sv.verse_number=19
  JOIN _s345_jdg02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=9 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-2-the-apostasy-cycle-the-judges-as-shadow-saviours'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Psalm 106:43 — *Many times did he deliver them; but they provoked him*: the *all the days of the judge* deliverance (2:18), then provoking again — the wheel of Judges set to music.'
  FROM cross_reference_threads t
  JOIN _s345_jdg02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=2 AND sv.verse_number=18
  JOIN _s345_jdg02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=106 AND tv.verse_number=43
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-2-the-apostasy-cycle-the-judges-as-shadow-saviours'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Psalm 106:44 — *Nevertheless he regarded their affliction, when he heard their cry*: the *Nevertheless* of the Psalm is the *Nevertheless* of 2:16 — wrath turned to mercy at the groaning (2:18).'
  FROM cross_reference_threads t
  JOIN _s345_jdg02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=2 AND sv.verse_number=18
  JOIN _s345_jdg02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=106 AND tv.verse_number=44
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-2-the-apostasy-cycle-the-judges-as-shadow-saviours'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Psalm 106:45 — *he remembered for them his covenant, and repented according to the multitude of his mercies*: the covenant the Angel never breaks (2:1) is the covenant He remembers — *it repented Yahuah* (2:18).'
  FROM cross_reference_threads t
  JOIN _s345_jdg02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=2 AND sv.verse_number=18
  JOIN _s345_jdg02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=106 AND tv.verse_number=45
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-2-the-apostasy-cycle-the-judges-as-shadow-saviours'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'Acts 13:20 — *he gave unto them judges... until Samuel the prophet*: Paul rehearses the whole age of the cycle (2:16) as the run-up to the king and the Saviour to come.'
  FROM cross_reference_threads t
  JOIN _s345_jdg02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=2 AND sv.verse_number=16
  JOIN _s345_jdg02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=13 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-2-the-apostasy-cycle-the-judges-as-shadow-saviours'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'Acts 13:23 — *of this man''s seed hath Elohim raised unto Yashar''el a Saviour, Yahusha*: the line of judges *raised up* to deliver (2:16) ends in the one Deliverer who breaks the cycle for ever.'
  FROM cross_reference_threads t
  JOIN _s345_jdg02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=2 AND sv.verse_number=16
  JOIN _s345_jdg02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=13 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-2-the-apostasy-cycle-the-judges-as-shadow-saviours'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Judges 3:1 — *these are the nations which Yahuah left, to prove Yashar''el by them*: the next chapter names the very nations of the sentence (2:21) — left by design, not abandonment.'
  FROM cross_reference_threads t
  JOIN _s345_jdg02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=2 AND sv.verse_number=21
  JOIN _s345_jdg02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=3 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-2-the-nations-left-to-prove-yasharel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Judges 3:4 — *to prove Yashar''el... whether they would hearken unto the commandments of Yahuah*: the purpose of 2:22 word for word — the nations the test of Torah-obedience.'
  FROM cross_reference_threads t
  JOIN _s345_jdg02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=2 AND sv.verse_number=22
  JOIN _s345_jdg02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=3 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-2-the-nations-left-to-prove-yasharel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Exodus 23:29 — *I will not drive them out in one year... by little and little*: the measured leaving was always Yahuah''s way — now the un-driven nations are the proving-ground (2:23).'
  FROM cross_reference_threads t
  JOIN _s345_jdg02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=2 AND sv.verse_number=23
  JOIN _s345_jdg02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=23 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-2-the-nations-left-to-prove-yasharel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Deuteronomy 8:2 — *to prove thee, to know what was in thine heart, whether thou wouldest keep his commandments*: the proving by the nations (2:22) is the same proving Moses named — the snare is also the schoolmaster.'
  FROM cross_reference_threads t
  JOIN _s345_jdg02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=2 AND sv.verse_number=22
  JOIN _s345_jdg02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=8 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-2-the-nations-left-to-prove-yasharel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_judges_3.sql (Judges 3) -----
-- Judges 3 — full-library cross-references. Tag jdg03. Session prefix s345.
-- Sort band 35700, step 3: 35700, 35703, 35706.
-- View: _s345_jdg03_lookup
--
-- FRAME: the cycle of the judges — Yahuah leaves nations to PROVE Yashar'el and
-- to TEACH them war (the testing of Deut 8:2; the proving of Judg 2:22); the
-- people do evil and are sold into bondage; ★ when they CRY, Yahuah raises a
-- DELIVERER on whom His Spirit comes — Othniel the first judge, the shadow-saviour
-- (Neh 9:27: thou gavest them saviours), the same Spirit-pattern that falls on
-- Gideon (Judg 6:34), Saul (1 Sam 11:6), and David (1 Sam 16:13), reaching forward
-- to the true Deliverer; ★ the unlikely deliverers — Ehud the left-handed Benjamite
-- with the hidden dagger, Shamgar with an ox goad — salvation by the humble
-- instrument, by few.
--
-- Judges 3 coverage:
--   v.1-4 (the nations left to prove Yashar'el / teach them war / whether they would hearken)
--        NT:     none warranted (the testing-pattern is the Tanakh spine here)
--        Extras: none warranted
--        Tanakh: Judg 2:22 (that through them I may prove Yashar'el), Deut 8:2 (to humble thee, to prove thee, whether thou wouldest keep his commandments) — THREAD 1
--   v.9-11 (they cried; Yahuah raised Othniel; the Spirit of Yahuah came upon him; the land had rest)
--        NT:     none warranted (Spirit-on-the-deliverer carried forward by the Tanakh witnesses; the true Deliverer is the consummation of the type)
--        Extras: none warranted
--        Tanakh: Neh 9:27 (thou gavest them saviours, who saved them — KEYSTONE), Judg 6:34 (the Spirit of Yahuah came upon Gideon), 1 Sam 16:13 (the Spirit of Yahuah came upon David) — THREAD 2
--   v.15-31 (Ehud the lefthanded Benjamite, the two-edged dagger, I have a message from Elohim; Shamgar's ox goad, six hundred Philistines)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Neh 9:27 (saviours raised when they cried), 1 Sam 11:6 (Spirit on Saul — deliverance from Ammon, the unlikely raised man), Ps 18:48 (he delivereth me from mine enemies) — THREAD 3
--
-- THREADS:
--   jdg03: judges-3-the-nations-left-to-prove-yashar-el-and-to-teach-them-war (canon Tanakh) [free]
--   jdg03: judges-3-the-spirit-of-yahuah-came-upon-othniel-the-deliverer-raised-when-they-cried (canon Tanakh) [free]
--   jdg03: judges-3-ehud-and-shamgar-the-unlikely-deliverers-salvation-by-few (canon Tanakh) [free]
--
-- Contested/load-bearing framing: the SPIRIT-empowered deliverer (3:10, the Spirit
-- of Yahuah came upon Othniel) is read as the shadow-saviour Yahuah raises when His
-- people cry — Neh 9:27 names the pattern (thou gavest them saviours), and the same
-- Spirit falls on Gideon, Saul, and David, reaching forward to the true and final
-- Deliverer (the Formed Son raised up to save). NOT a generic "charismatic leader";
-- the salvation is Yahuah's own, worked through the raised man. The unlikely
-- instruments (Ehud's left hand, Shamgar's ox goad) carry the salvation-by-few
-- weight — Yahuah delivers by the humble vessel.

CREATE TEMP VIEW _s345_jdg03_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: the nations left to prove Yashar'el / teach them war
    ('canon','judges',3,1,'canon','judges',2,22,'free',E'*That through them I may prove Yashar''el (Israel), whether they will keep the way of Yahuah (LORD) to walk therein, as their fathers did keep it, or not* (Judges 2:22). The nations *which Yahuah (LORD) left, to prove Yashar''el (Israel) by them* (Judges 3:1) are exactly the nations of that purpose declared one chapter before — left undriven so the covenant-walk of the next generation might be tested.'),
    ('canon','judges',3,1,'canon','deuteronomy',8,2,'free',E'*And thou shalt remember all the way which Yahuah Elohayka (the LORD thy God) led thee these forty years in the wilderness, to humble thee, and to prove thee, to know what was in thine heart, whether thou wouldest keep his commandments, or no* (Deuteronomy 8:2). The nations left *to prove Yashar''el (Israel) by them* (Judges 3:1) continue the wilderness-pattern into the land: the same Yahuah who proved them by manna now proves them by the heathen left in their midst, to know the heart.'),
    ('canon','judges',3,4,'canon','deuteronomy',8,2,'free',E'*To humble thee, and to prove thee, to know what was in thine heart, whether thou wouldest keep his commandments, or no* (Deuteronomy 8:2). The nations *were to prove Yashar''el (Israel) by them, to know whether they would hearken unto the commandments of Yahuah (LORD), which he commanded their fathers by the hand of Moses* (Judges 3:4) — the very test of Deuteronomy carried forward: would they keep the commandments, or no.'),
    ('canon','judges',3,4,'canon','judges',2,22,'free',E'*That through them I may prove Yashar''el (Israel), whether they will keep the way of Yahuah (LORD) to walk therein, as their fathers did keep it, or not* (Judges 2:22). The proving is repeated and made plain: *they were to prove Yashar''el (Israel) by them, to know whether they would hearken unto the commandments of Yahuah (LORD)* (Judges 3:4) — the nations are the instrument of testing covenant-faithfulness, never an accident.'),
    -- THREAD 2: the Spirit came upon Othniel, the deliverer raised when they cried
    ('canon','judges',3,9,'canon','nehemiah',9,27,'free',E'*Therefore thou deliveredst them into the hand of their enemies, who vexed them: and in the time of their trouble, when they cried unto thee, thou heardest them from heaven; and according to thy manifold mercies thou gavest them saviours, who saved them out of the hand of their enemies* (Nehemiah 9:27). This is the very pattern Judges 3 enacts: *when the children of Yashar''el (Israel) cried unto Yahuah (LORD), Yahuah (LORD) raised up a deliverer to the children of Yashar''el (Israel)... even Othniel the son of Kenaz* (Judges 3:9) — the saviour given when they cry, the shadow of the great Deliverer.'),
    ('canon','judges',3,10,'canon','judges',6,34,'free',E'*But the Spirit of Yahuah (LORD) came upon Gideon, and he blew a trumpet; and Abi-ezer was gathered after him* (Judges 6:34). The same Spirit that empowers Othniel — *the Spirit of Yahuah (LORD) came upon him, and he judged Yashar''el (Israel), and went out to war* (Judges 3:10) — falls again on Gideon: the deliverer is no mere strong man, but a vessel clothed with the Spirit of Yahuah to save His people.'),
    ('canon','judges',3,10,'canon','1-samuel',16,13,'free',E'*Then Samuel took the horn of oil, and anointed him in the midst of his brethren: and the Spirit of Yahuah (LORD) came upon David from that day forward* (1 Samuel 16:13). The Spirit that came upon Othniel the first judge — *the Spirit of Yahuah (LORD) came upon him, and he judged Yashar''el (Israel)* (Judges 3:10) — runs forward to rest on David the anointed king: the same Spirit-empowered deliverer, the line reaching toward the true and final Deliverer.'),
    ('canon','judges',3,11,'canon','nehemiah',9,27,'free',E'*Thou gavest them saviours, who saved them out of the hand of their enemies* (Nehemiah 9:27). *And the land had rest forty years* (Judges 3:11) — the fruit of the saviour given: when Yahuah raises the deliverer, the oppressor''s hand is broken and the land is granted rest, the mercy Nehemiah''s prayer recounts again and again.'),
    -- THREAD 3: Ehud and Shamgar, the unlikely deliverers, salvation by few
    ('canon','judges',3,15,'canon','nehemiah',9,27,'free',E'*When they cried unto thee, thou heardest them from heaven; and according to thy manifold mercies thou gavest them saviours, who saved them out of the hand of their enemies* (Nehemiah 9:27). Again the cry, again the saviour: *when the children of Yashar''el (Israel) cried unto Yahuah (LORD), Yahuah (LORD) raised them up a deliverer, Ehud the son of Gera, a Benjamite, a man lefthanded* (Judges 3:15) — and this saviour is the unlikely one, the left-handed man, that the deliverance might be plainly Yahuah''s.'),
    ('canon','judges',3,15,'canon','1-samuel',11,6,'free',E'*And the Spirit of Elohim (God) came upon Saul when he heard those tidings, and his anger was kindled greatly* (1 Samuel 11:6). As Yahuah raised Ehud to break the king of Moab — *Yahuah (LORD) raised them up a deliverer, Ehud the son of Gera, a Benjamite* (Judges 3:15) — so He raises Saul, another Benjamite, to break Ammon: the unlikely man taken up and made the instrument of Yahuah''s deliverance.'),
    ('canon','judges',3,28,'canon','psalms',18,48,'free',E'*He delivereth me from mine enemies: yea, thou liftest me up above those that rise up against me: thou hast delivered me from the violent man* (Psalm 18:48). Ehud''s cry of victory — *Follow after me: for Yahuah (LORD) hath delivered your enemies the Moabites into your hand* (Judges 3:28) — sings the same confession David sings: the enemy is given into the hand, the deliverance is Yahuah''s doing and not the warrior''s own.'),
    ('canon','judges',3,31,'canon','psalms',18,48,'free',E'*He delivereth me from mine enemies... thou hast delivered me from the violent man* (Psalm 18:48). Shamgar slays *six hundred men with an ox goad; and he also delivered Yashar''el (Israel)* (Judges 3:31) — deliverance by the humblest instrument, a farmer''s goad, that the saving be seen to belong to Yahuah who delivers, not to the weapon.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s345_jdg03_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s345_jdg03_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== threads =====
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judges-3-the-nations-left-to-prove-yashar-el-and-to-teach-them-war',
       E'The nations left to prove Yashar''el and to teach them war',
       E'The book of the judges opens its cycle with a purpose, not an oversight: *Now these are the nations which Yahuah (LORD) left, to prove Yashar''el (Israel) by them, even as many of Yashar''el (Israel) as had not known all the wars of Canaan* (Judges 3:1), *to teach them war* (Judges 3:2), *and they were to prove Yashar''el (Israel) by them, to know whether they would hearken unto the commandments of Yahuah (LORD), which he commanded their fathers by the hand of Moses* (Judges 3:4). The heathen left undriven are the instrument of a test. The previous chapter had already declared it: *That through them I may prove Yashar''el (Israel), whether they will keep the way of Yahuah (LORD) to walk therein, as their fathers did keep it, or not* (Judges 2:22). And the test reaches back to the wilderness word of Moses, where the proving was named the whole point of the way: *And thou shalt remember all the way which Yahuah Elohayka (the LORD thy God) led thee these forty years in the wilderness, to humble thee, and to prove thee, to know what was in thine heart, whether thou wouldest keep his commandments, or no* (Deuteronomy 8:2). The same Yahuah who proved them by manna now proves them by the nations in their midst — the question is never changed: would they keep His commandments, or no. The Torah-walk is the thing being tested, the covenant the thing at stake.',
       sv.verse_id, ev.verse_id, 'free', 35700
  FROM _s345_jdg03_lookup sv, _s345_jdg03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=3 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='judges' AND ev.chapter_number=3 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judges-3-the-spirit-of-yahuah-came-upon-othniel-the-deliverer-raised-when-they-cried',
       E'The Spirit of Yahuah came upon Othniel — the deliverer raised when they cried',
       E'They do evil, they serve Baalim, they are sold into the hand of Chushan-rishathaim eight years — and then comes the turn the whole book is built on: *And when the children of Yashar''el (Israel) cried unto Yahuah (LORD), Yahuah (LORD) raised up a deliverer to the children of Yashar''el (Israel), who delivered them, even Othniel the son of Kenaz, Caleb''s younger brother* (Judges 3:9). The first judge is no self-made hero; he is a man clothed from above: *And the Spirit of Yahuah (LORD) came upon him, and he judged Yashar''el (Israel), and went out to war: and Yahuah (LORD) delivered Chushan-rishathaim king of Mesopotamia into his hand... And the land had rest forty years* (Judges 3:10-11). Nehemiah''s great prayer names this exact mercy as the pattern of Yahuah''s dealings: *in the time of their trouble, when they cried unto thee, thou heardest them from heaven; and according to thy manifold mercies thou gavest them saviours, who saved them out of the hand of their enemies* (Nehemiah 9:27). And the Spirit that fell on Othniel falls again and again on the men Yahuah raises to save: *the Spirit of Yahuah (LORD) came upon Gideon, and he blew a trumpet* (Judges 6:34); *the Spirit of Yahuah (LORD) came upon David from that day forward* (1 Samuel 16:13). The deliverer is the shadow-saviour — given when His people cry, empowered by His Spirit, working His salvation — the line of raised deliverers reaching forward to the true and final Deliverer.',
       sv.verse_id, ev.verse_id, 'free', 35703
  FROM _s345_jdg03_lookup sv, _s345_jdg03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=3 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='judges' AND ev.chapter_number=3 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judges-3-ehud-and-shamgar-the-unlikely-deliverers-salvation-by-few',
       E'Ehud and Shamgar — the unlikely deliverers, salvation by few',
       E'The cycle runs again, and again the cry brings the saviour — but now the saviour is the unlikely one, that the deliverance might be plainly Yahuah''s. *When the children of Yashar''el (Israel) cried unto Yahuah (LORD), Yahuah (LORD) raised them up a deliverer, Ehud the son of Gera, a Benjamite, a man lefthanded* (Judges 3:15). With a two-edged dagger hidden on his right thigh and the words *I have a message from Elohim (God) unto thee* (Judges 3:20), he strikes down Eglon the fat king of Moab, blows the trumpet in mount Ephraim, and cries to Yashar''el: *Follow after me: for Yahuah (LORD) hath delivered your enemies the Moabites into your hand* (Judges 3:28) — the same confession David sings, *He delivereth me from mine enemies... thou hast delivered me from the violent man* (Psalm 18:48): the enemy given into the hand, the victory Yahuah''s and not the warrior''s. This is the pattern Nehemiah recounts — *thou gavest them saviours, who saved them out of the hand of their enemies* (Nehemiah 9:27) — and the pattern that will lift up another unlikely Benjamite, Saul, when *the Spirit of Elohim (God) came upon Saul* (1 Samuel 11:6) to break Ammon. Last of all comes Shamgar, with the humblest weapon of all: *he slew of the Philistines six hundred men with an ox goad; and he also delivered Yashar''el (Israel)* (Judges 3:31) — a farmer''s goad in the hand of Yahuah''s chosen man. Salvation by few, by the lowly instrument, that the saving be seen to belong to Yahuah who raises the deliverer.',
       sv.verse_id, ev.verse_id, 'free', 35706
  FROM _s345_jdg03_lookup sv, _s345_jdg03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=3 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='judges' AND ev.chapter_number=3 AND ev.verse_number=31
ON CONFLICT (slug) DO NOTHING;

-- ===== thread_members =====
-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*That through them I may prove Yashar''el (Israel), whether they will keep the way of Yahuah (LORD)* (Judges 2:22) — the nations left are the declared instrument of proving.'
  FROM cross_reference_threads t
  JOIN _s345_jdg03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=3 AND sv.verse_number=1
  JOIN _s345_jdg03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=2 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-3-the-nations-left-to-prove-yashar-el-and-to-teach-them-war'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*To humble thee, and to prove thee, to know what was in thine heart, whether thou wouldest keep his commandments* (Deuteronomy 8:2) — the wilderness testing carried into the land.'
  FROM cross_reference_threads t
  JOIN _s345_jdg03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=3 AND sv.verse_number=1
  JOIN _s345_jdg03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=8 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-3-the-nations-left-to-prove-yashar-el-and-to-teach-them-war'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Whether thou wouldest keep his commandments, or no* (Deuteronomy 8:2) — the proving of Judg 3:4 is the same test: would they hearken unto the commandments.'
  FROM cross_reference_threads t
  JOIN _s345_jdg03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=3 AND sv.verse_number=4
  JOIN _s345_jdg03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=8 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-3-the-nations-left-to-prove-yashar-el-and-to-teach-them-war'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*That through them I may prove Yashar''el (Israel)... or not* (Judges 2:22) — the proving repeated and made plain in Judg 3:4.'
  FROM cross_reference_threads t
  JOIN _s345_jdg03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=3 AND sv.verse_number=4
  JOIN _s345_jdg03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=2 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-3-the-nations-left-to-prove-yashar-el-and-to-teach-them-war'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*When they cried unto thee... thou gavest them saviours, who saved them* (Nehemiah 9:27) — the keystone: the saviour given when His people cry.'
  FROM cross_reference_threads t
  JOIN _s345_jdg03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=3 AND sv.verse_number=9
  JOIN _s345_jdg03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=9 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-3-the-spirit-of-yahuah-came-upon-othniel-the-deliverer-raised-when-they-cried'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*The Spirit of Yahuah (LORD) came upon Gideon* (Judges 6:34) — the same Spirit that empowered Othniel falls on the next deliverer.'
  FROM cross_reference_threads t
  JOIN _s345_jdg03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=3 AND sv.verse_number=10
  JOIN _s345_jdg03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=6 AND tv.verse_number=34
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-3-the-spirit-of-yahuah-came-upon-othniel-the-deliverer-raised-when-they-cried'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*The Spirit of Yahuah (LORD) came upon David from that day forward* (1 Samuel 16:13) — the Spirit-line runs from the first judge to the anointed king toward the true Deliverer.'
  FROM cross_reference_threads t
  JOIN _s345_jdg03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=3 AND sv.verse_number=10
  JOIN _s345_jdg03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=16 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-3-the-spirit-of-yahuah-came-upon-othniel-the-deliverer-raised-when-they-cried'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Thou gavest them saviours, who saved them out of the hand of their enemies* (Nehemiah 9:27) — the rest of the land (Judg 3:11) is the fruit of the saviour given.'
  FROM cross_reference_threads t
  JOIN _s345_jdg03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=3 AND sv.verse_number=11
  JOIN _s345_jdg03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=9 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-3-the-spirit-of-yahuah-came-upon-othniel-the-deliverer-raised-when-they-cried'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*When they cried unto thee... thou gavest them saviours, who saved them* (Nehemiah 9:27) — again the cry, again the saviour, now the unlikely left-handed man.'
  FROM cross_reference_threads t
  JOIN _s345_jdg03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=3 AND sv.verse_number=15
  JOIN _s345_jdg03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=9 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-3-ehud-and-shamgar-the-unlikely-deliverers-salvation-by-few'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*The Spirit of Elohim (God) came upon Saul* (1 Samuel 11:6) — another unlikely Benjamite raised, as Ehud was, to break the oppressor.'
  FROM cross_reference_threads t
  JOIN _s345_jdg03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=3 AND sv.verse_number=15
  JOIN _s345_jdg03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=11 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-3-ehud-and-shamgar-the-unlikely-deliverers-salvation-by-few'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*He delivereth me from mine enemies... thou hast delivered me from the violent man* (Psalm 18:48) — Ehud''s cry that Yahuah hath delivered the enemy into the hand.'
  FROM cross_reference_threads t
  JOIN _s345_jdg03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=3 AND sv.verse_number=28
  JOIN _s345_jdg03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=18 AND tv.verse_number=48
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-3-ehud-and-shamgar-the-unlikely-deliverers-salvation-by-few'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*He delivereth me from mine enemies* (Psalm 18:48) — Shamgar''s ox goad against six hundred: salvation by the humblest instrument, the saving Yahuah''s own.'
  FROM cross_reference_threads t
  JOIN _s345_jdg03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=3 AND sv.verse_number=31
  JOIN _s345_jdg03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=18 AND tv.verse_number=48
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-3-ehud-and-shamgar-the-unlikely-deliverers-salvation-by-few'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_judges_4.sql (Judges 4) -----
--
-- Book/chapter: Judges 4    Tag: jdg04    View: _s345_jdg04_lookup
-- Sort band: 35725, 35728, 35731
--
-- The cycle again: Yashar'el does evil, Yahuah sells them to Jabin king of Canaan (Hazor)
-- and his captain Sisera with 900 chariots of iron, 20 years of cruel oppression. They cry.
-- ★★ DEBORAH a prophetess judges Yashar'el under her palm tree; she summons Barak with
-- Yahuah's word; Barak goes only if she goes; therefore Sisera is sold into the hand of a
-- WOMAN. Yahuah DISCOMFITS Sisera and all his iron chariots before Barak (the victory His,
-- not the sword's). ★★ JAEL the wife of Heber the Kenite fells the fleeing general with a
-- TENT PEG through his temples — the unexpected deliverer, the mighty felled by the weak.
--
-- Judges 4 coverage:
--   v.1-3  (did evil; Yahuah sold them to Jabin/Sisera; 900 iron chariots; 20 yrs oppression; they cried)
--        NT:     Hebrews 11:32 (Barak among the faith-deliverers — carried on THREAD 3)
--        Extras: none warranted
--        Tanakh: Judges 2:16,18 (Yahuah raised up judges, delivered them out of the hand of the
--                spoilers); Psalm 83:9 (do unto them... as to Sisera, as to Jabin) -> THREAD 3
--   v.4-7  (Deborah the prophetess judges Yashar'el; summons Barak; Hath not Yahuah commanded...
--          I will deliver him into thine hand)
--        NT:     1 Corinthians 1:27 (Elohim hath chosen the weak things to confound the mighty) -> THREAD 1
--        Extras: none warranted
--        Tanakh: Judges 2:16,18 (Yahuah raised up / was with the judge); Joshua 11:6 (burn their
--                chariots — Yahuah's word against the chariots of Hazor before) -> THREAD 1
--   v.9    (Yahuah shall SELL SISERA INTO THE HAND OF A WOMAN)
--        NT:     1 Corinthians 1:27-28 (the weak / the base / things despised chosen) -> THREAD 2
--        Extras: none warranted
--        Tanakh: Judges 5:24 (Blessed above women shall Jael be) -> THREAD 2
--   v.14-15 (Yahuah is gone out before thee; Yahuah DISCOMFITED Sisera and all his chariots)
--        NT:     1 Corinthians 1:27 (chosen the weak to confound the mighty — iron chariots count
--                for nothing) -> THREAD 1
--        Extras: none warranted
--        Tanakh: Joshua 11:6 (Yahuah delivers, burn their chariots); Psalm 83:9 (as to Sisera,
--                as to Jabin, at the brook of Kison) -> THREAD 1
--   v.17-22 (Jael covers Sisera, gives milk, takes the tent nail and hammer, smites it into his
--          temples — the general felled by a woman's hand in the tent)
--        NT:     Hebrews 11:34 (out of weakness were made strong) -> THREAD 2
--        Extras: none warranted
--        Tanakh: Judges 5:24-27 (Deborah's song — blessed Jael; she smote Sisera, pierced his
--                temples, at her feet he fell down dead) -> THREAD 2
--   v.23-24 (So Elohim subdued Jabin; the hand of Yashar'el prevailed until they destroyed Jabin)
--        NT:     Hebrews 11:32 (Barak — through faith subdued kingdoms) -> THREAD 3
--        Extras: none warranted
--        Tanakh: Judges 2:18 (Yahuah delivered them out of the hand of their enemies all the days
--                of the judge); Psalm 83:9-10 (as to Sisera... they became as dung for the earth) -> THREAD 3
--   v.8,10-13,16 (Barak's condition; the muster; Heber the Kenite; Sisera gathers his chariots; the rout)
--        narrative scaffolding; framework weight carried by the threads above; none warranted standalone
--
-- THREADS:
--   judges-4-deborah-the-prophetess-and-the-victory-yahuah-gives (free)
--        -> Tanakh (Judges 2, Joshua 11, Psalm 83) + NT (1 Corinthians)
--   judges-4-sisera-sold-into-the-hand-of-a-woman-jaels-tent-peg (free)
--        -> Tanakh (Judges 5) + NT (1 Corinthians, Hebrews)
--   judges-4-the-cry-and-the-deliverer-raised-up (free)
--        -> Tanakh (Judges 2, Psalm 83) + NT (Hebrews)
--
-- Framework-load-bearing framing:
--   * 4:4-7,14-15 ★★ — Deborah the prophetess-judge speaks Yahuah's commanded word, and Yahuah
--     DISCOMFITS Sisera and his 900 iron chariots before Barak. The iron chariots — the very
--     terror that held off conquest — count for nothing where Yahuah goes out before His people
--     (Joshua 11:6, the earlier word against Hazor's chariots: "burn their chariots with fire").
--     1 Corinthians 1:27 reads the pattern forward: Elohim chooses the weak to confound the mighty.
--     The victory is Yahuah's, never the sword's; the judge is the shadow-deliverer He raises up.
--   * 4:9,17-22 ★★ — Sisera is SOLD INTO THE HAND OF A WOMAN: the mighty captain felled by Jael's
--     tent peg, the unexpected instrument, the despised vessel made the deliverer. Deborah's song
--     (Judges 5:24-27) celebrates her; Hebrews 11:34 reads the judges as those who "out of weakness
--     were made strong." The base things confound the mighty (1 Cor 1:27-28) — never human boast.
--   * 4:1-3,23-24 — the cry-and-deliverance cycle: they did evil, were sold, cried, and Yahuah
--     raised up the judge who delivered (Judges 2:16-18). Psalm 83:9 prays the memory of this very
--     deliverance over Yashar'el's later confederate enemies. Barak stands in Hebrews 11:32 among
--     the faith-deliverers — the shadow-saviour Yahuah raises in answer to the groaning of His people.

CREATE TEMP VIEW _s345_jdg04_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== B. cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: Deborah the prophetess and the victory Yahuah gives (iron chariots discomfited)
    ('canon','judges',4,6,'canon','judges',2,16,'free',
      E'*Nevertheless Yahuah (LORD) raised up judges, which delivered them out of the hand of those that spoiled them* (Judges 2:16). Deborah is exactly such a judge — *Hath not Yahuah Elohim (the LORD God) of Yashar''el (Israel) commanded, saying, Go and draw toward mount Tabor... and I will deliver him into thine hand?* (Judges 4:6-7); the deliverer is raised by Yahuah and speaks His commanded word, not her own.'),
    ('canon','judges',4,6,'canon','joshua',11,6,'free',
      E'*And Yahuah (LORD) said unto Joshua, Be not afraid because of them... thou shalt hough their horses, and burn their chariots with fire* (Joshua 11:6). The first Jabin of Hazor was broken when Yahuah counted his chariots as nothing; now Deborah carries the same word against his successor — *Go and draw toward mount Tabor... and I will deliver him into thine hand* (Judges 4:6-7); the chariots of Hazor are no terror where Yahuah commands.'),
    ('canon','judges',4,14,'canon','joshua',11,6,'free',
      E'*And Yahuah (LORD) said unto Joshua, Be not afraid because of them: for to morrow about this time will I deliver them up all slain before Yashar''el (Israel)... burn their chariots with fire* (Joshua 11:6). Deborah''s charge echoes it word for word — *Up; for this is the day in which Yahuah (LORD) hath delivered Sisera into thine hand: is not Yahuah (LORD) gone out before thee?* (Judges 4:14); the day, the deliverance, the burning of the chariots — all Yahuah''s, before His people lift a sword.'),
    ('canon','judges',4,15,'canon','psalms',83,9,'free',
      E'*Do unto them as unto the Midianites; as to Sisera, as to Jabin, at the brook of Kison* (Psalm 83:9). The psalmist prays the memory of this very rout — *And Yahuah (LORD) discomfited Sisera, and all his chariots, and all his host, with the edge of the sword before Barak* (Judges 4:15); the discomfiting of Sisera at Kishon becomes Yashar''el''s standing plea, that Yahuah would again scatter the confederate enemies of His people.'),
    ('canon','judges',4,15,'canon','1-corinthians',1,27,'free',
      E'*But Elohim (God) hath chosen the foolish things of the world to confound the wise; and Elohim (God) hath chosen the weak things of the world to confound the things which are mighty* (1 Corinthians 1:27). Nine hundred chariots of iron are the very picture of the mighty — yet *Yahuah (LORD) discomfited Sisera, and all his chariots* (Judges 4:15); the weak ten thousand on foot confound the iron host because the battle is Yahuah''s, the pattern Paul names as Elohim''s own way.'),
    ('canon','judges',4,4,'canon','1-corinthians',1,27,'free',
      E'*and Elohim (God) hath chosen the weak things of the world to confound the things which are mighty* (1 Corinthians 1:27). That *Deborah, a prophetess, the wife of Lapidoth, she judged Yashar''el (Israel) at that time* (Judges 4:4), and that the captain would be sold into a woman''s hand, is Elohim''s chosen way — the weak vessel set against the mighty host, that the deliverance be reckoned to Yahuah alone.'),

    -- THREAD 2: Sisera sold into the hand of a woman — Jael's tent peg, the mighty felled by the weak
    ('canon','judges',4,9,'canon','judges',5,24,'free',
      E'*Blessed above women shall Jael the wife of Heber the Kenite be, blessed shall she be above women in the tent* (Judges 5:24). Deborah''s word is fulfilled in Jael — *the journey that thou takest shall not be for thine honour; for Yahuah (LORD) shall sell Sisera into the hand of a woman* (Judges 4:9); the hand into which Sisera is sold is hers, and the song crowns her blessed above women.'),
    ('canon','judges',4,21,'canon','judges',5,26,'free',
      E'*She put her hand to the nail, and her right hand to the workmen''s hammer; and with the hammer she smote Sisera, she smote off his head, when she had pierced and stricken through his temples* (Judges 5:26). The song sings what the narrative records — *Then Jael Heber''s wife took a nail of the tent, and took an hammer in her hand... and smote the nail into his temples* (Judges 4:21); the mighty captain of nine hundred chariots is felled by a woman''s hand with a tent peg.'),
    ('canon','judges',4,21,'canon','judges',5,27,'free',
      E'*At her feet he bowed, he fell, he lay down: at her feet he bowed, he fell: where he bowed, there he fell down dead* (Judges 5:27). The terror of Yashar''el for twenty years comes to this — *for he was fast asleep and weary. So he died* (Judges 4:21); the song lingers over the fall of the mighty at the feet of the unexpected deliverer.'),
    ('canon','judges',4,9,'canon','1-corinthians',1,27,'free',
      E'*and Elohim (God) hath chosen the weak things of the world to confound the things which are mighty* (1 Corinthians 1:27). That *Yahuah (LORD) shall sell Sisera into the hand of a woman* (Judges 4:9) is this very principle in the days of the judges: the captain of iron chariots confounded not by a greater army but by a woman in a tent, that no flesh should glory.'),
    ('canon','judges',4,21,'canon','1-corinthians',1,28,'free',
      E'*And base things of the world, and things which are despised, hath Elohim (God) chosen, yea, and things which are not, to bring to nought things that are* (1 Corinthians 1:28). A tent peg and a hammer in a woman''s hand bring to nought the captain of nine hundred chariots — *she smote the nail into his temples, and fastened it into the ground... So he died* (Judges 4:21); the despised instrument brings the mighty to nothing.'),
    ('canon','judges',4,21,'canon','hebrews',11,34,'free',
      E'*Quenched the violence of fire, escaped the edge of the sword, out of weakness were made strong, waxed valiant in fight, turned to flight the armies of the aliens* (Hebrews 11:34). Jael''s deed — *and smote the nail into his temples... So he died* (Judges 4:21) — belongs to this roll of those who *out of weakness were made strong*; the weak hand made strong to fell the alien captain.'),

    -- THREAD 3: the cry and the deliverer raised up (the shadow-saviour)
    ('canon','judges',4,3,'canon','judges',2,16,'free',
      E'*Nevertheless Yahuah (LORD) raised up judges, which delivered them out of the hand of those that spoiled them* (Judges 2:16). The chapter opens in the cycle that Judges 2 declared — *And the children of Yashar''el (Israel) cried unto Yahuah (LORD): for he had nine hundred chariots of iron; and twenty years he mightily oppressed* (Judges 4:3); the cry of the oppressed is answered by the judge Yahuah raises up to deliver.'),
    ('canon','judges',4,3,'canon','psalms',83,9,'free',
      E'*Do unto them as unto the Midianites; as to Sisera, as to Jabin, at the brook of Kison* (Psalm 83:9). The twenty-year oppression — *for he had nine hundred chariots of iron; and twenty years he mightily oppressed the children of Yashar''el (Israel)* (Judges 4:3) — and its overthrow become a prayer in the Psalter: that Yahuah would deal with every confederate enemy as He dealt with Jabin and Sisera.'),
    ('canon','judges',4,23,'canon','judges',2,18,'free',
      E'*And when Yahuah (LORD) raised them up judges, then Yahuah (LORD) was with the judge, and delivered them out of the hand of their enemies all the days of the judge* (Judges 2:18). So it is here — *So Elohim (God) subdued on that day Jabin the king of Canaan before the children of Yashar''el (Israel)* (Judges 4:23); Yahuah is with the judge He raised, and by her hand subdues the oppressor.'),
    ('canon','judges',4,24,'canon','psalms',83,10,'free',
      E'*Which perished at Endor: they became as dung for the earth* (Psalm 83:10). The total overthrow the psalm remembers is what the chapter records — *And the hand of the children of Yashar''el (Israel) prospered, and prevailed against Jabin the king of Canaan, until they had destroyed Jabin* (Judges 4:24); the oppressor of His people is brought wholly to nought.'),
    ('canon','judges',4,23,'canon','hebrews',11,32,'free',
      E'*And what shall I more say? for the time would fail me to tell of Gedeon, and of Barak, and of Samson, and of Jephthae; of David also, and Samuel, and of the prophets* (Hebrews 11:32). Barak, whose pursuit ends in this subduing — *So Elohim (God) subdued on that day Jabin the king of Canaan before the children of Yashar''el (Israel)* (Judges 4:23) — is named among the faith-deliverers; the judge who answered the cry is a shadow of the Deliverer to come.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s345_jdg04_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s345_jdg04_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== C. threads =====
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judges-4-deborah-the-prophetess-and-the-victory-yahuah-gives',
       E'Deborah the prophetess-judge, and the victory Yahuah gives',
       E'The cycle turns again, and the deliverer Yahuah raises is *Deborah, a prophetess, the wife of Lapidoth, she judged Yashar''el (Israel) at that time* (Judges 4:4). Under her palm tree she speaks Yahuah''s commanded word to Barak — *Hath not Yahuah Elohim (the LORD God) of Yashar''el (Israel) commanded, saying, Go and draw toward mount Tabor... and I will deliver him into thine hand?* (Judges 4:6-7). The terror that held off conquest is nine hundred chariots of iron; but Yahuah had already broken the first Jabin of Hazor on the same ground — *Be not afraid because of them... thou shalt hough their horses, and burn their chariots with fire* (Joshua 11:6). So Deborah cries on the day of battle, *Up; for this is the day in which Yahuah (LORD) hath delivered Sisera into thine hand: is not Yahuah (LORD) gone out before thee?* (Judges 4:14), and *Yahuah (LORD) discomfited Sisera, and all his chariots, and all his host, with the edge of the sword before Barak* (Judges 4:15). The iron chariots count for nothing: this is Elohim''s own way — *Elohim (God) hath chosen the weak things of the world to confound the things which are mighty* (1 Corinthians 1:27). The psalmist will later pray the memory of it — *Do unto them as unto the Midianites; as to Sisera, as to Jabin, at the brook of Kison* (Psalm 83:9). The victory is Yahuah''s, never the sword''s; the prophetess-judge is the shadow-deliverer He raises up.',
       sv.verse_id, ev.verse_id, 'free', 35725
  FROM _s345_jdg04_lookup sv, _s345_jdg04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=4 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='judges' AND ev.chapter_number=4 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judges-4-sisera-sold-into-the-hand-of-a-woman-jaels-tent-peg',
       E'Sisera sold into the hand of a woman — Jael''s tent peg',
       E'Barak will go only if Deborah goes, and so the honour is taken from him: *the journey that thou takest shall not be for thine honour; for Yahuah (LORD) shall sell Sisera into the hand of a woman* (Judges 4:9). The mighty captain of nine hundred chariots flees on foot to a tent, and there *Jael Heber''s wife took a nail of the tent, and took an hammer in her hand, and went softly unto him, and smote the nail into his temples, and fastened it into the ground: for he was fast asleep and weary. So he died* (Judges 4:21). The general who oppressed Yashar''el twenty years is felled by a woman''s hand with a tent peg — the unexpected instrument, the despised vessel made the deliverer. Deborah''s song crowns her: *Blessed above women shall Jael the wife of Heber the Kenite be* (Judges 5:24); *with the hammer she smote Sisera, she smote off his head, when she had pierced and stricken through his temples* (Judges 5:26); *At her feet he bowed, he fell... where he bowed, there he fell down dead* (Judges 5:27). This is Elohim''s chosen way — *Elohim (God) hath chosen the weak things of the world to confound the things which are mighty* (1 Corinthians 1:27); *And base things of the world, and things which are despised, hath Elohim (God) chosen... to bring to nought things that are* (1 Corinthians 1:28). And Jael''s deed stands in the roll of faith, among those who *out of weakness were made strong... turned to flight the armies of the aliens* (Hebrews 11:34). The mighty are felled by the weak, that no flesh should glory.',
       sv.verse_id, ev.verse_id, 'free', 35728
  FROM _s345_jdg04_lookup sv, _s345_jdg04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=4 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='judges' AND ev.chapter_number=4 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judges-4-the-cry-and-the-deliverer-raised-up',
       E'The cry, and the deliverer raised up',
       E'The chapter opens in the cycle Judges 2 had declared: *the children of Yashar''el (Israel) cried unto Yahuah (LORD): for he had nine hundred chariots of iron; and twenty years he mightily oppressed the children of Yashar''el (Israel)* (Judges 4:3). This is the appointed pattern of the judges — *Nevertheless Yahuah (LORD) raised up judges, which delivered them out of the hand of those that spoiled them* (Judges 2:16); *then Yahuah (LORD) was with the judge, and delivered them out of the hand of their enemies all the days of the judge* (Judges 2:18). So the cry is answered: *So Elohim (God) subdued on that day Jabin the king of Canaan before the children of Yashar''el (Israel)* (Judges 4:23), and *the hand of the children of Yashar''el (Israel) prospered, and prevailed against Jabin the king of Canaan, until they had destroyed Jabin* (Judges 4:24). The Psalter will hold this deliverance up as a standing prayer — *as to Sisera, as to Jabin, at the brook of Kison... they became as dung for the earth* (Psalm 83:9-10) — and Barak is numbered among the faith-deliverers: *the time would fail me to tell of Gedeon, and of Barak, and of Samson... and of the prophets* (Hebrews 11:32). The judge who answers the cry is the shadow-saviour Yahuah raises in response to the groaning of His people, until the Deliverer Himself comes.',
       sv.verse_id, ev.verse_id, 'free', 35731
  FROM _s345_jdg04_lookup sv, _s345_jdg04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=4 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='judges' AND ev.chapter_number=4 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

-- ===== D. thread_members =====
-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Judges 2:16 — *Yahuah raised up judges, which delivered them*: Deborah is such a judge, speaking Yahuah''s commanded word (Judges 4:6-7).'
  FROM cross_reference_threads t
  JOIN _s345_jdg04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=4 AND sv.verse_number=6
  JOIN _s345_jdg04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=2 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-4-deborah-the-prophetess-and-the-victory-yahuah-gives'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Joshua 11:6 — *burn their chariots with fire*: the first Jabin of Hazor was broken when Yahuah counted his chariots as nothing; Deborah carries the same word (Judges 4:6-7).'
  FROM cross_reference_threads t
  JOIN _s345_jdg04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=4 AND sv.verse_number=6
  JOIN _s345_jdg04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=11 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-4-deborah-the-prophetess-and-the-victory-yahuah-gives'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Joshua 11:6 — *for to morrow about this time will I deliver them up all slain*: Deborah''s battle-day charge (Judges 4:14) echoes Yahuah''s word to Joshua.'
  FROM cross_reference_threads t
  JOIN _s345_jdg04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=4 AND sv.verse_number=14
  JOIN _s345_jdg04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=11 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-4-deborah-the-prophetess-and-the-victory-yahuah-gives'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Psalm 83:9 — *as to Sisera, as to Jabin, at the brook of Kison*: the discomfiting of Sisera (Judges 4:15) becomes Yashar''el''s standing prayer.'
  FROM cross_reference_threads t
  JOIN _s345_jdg04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=4 AND sv.verse_number=15
  JOIN _s345_jdg04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=83 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-4-deborah-the-prophetess-and-the-victory-yahuah-gives'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'1 Corinthians 1:27 — *the weak things... to confound the things which are mighty*: the iron chariots discomfited (Judges 4:15), Elohim''s own way.'
  FROM cross_reference_threads t
  JOIN _s345_jdg04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=4 AND sv.verse_number=15
  JOIN _s345_jdg04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=1 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-4-deborah-the-prophetess-and-the-victory-yahuah-gives'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'1 Corinthians 1:27 — *chosen the weak things*: that a prophetess judges Yashar''el (Judges 4:4) is the same chosen way, the weak vessel against the mighty host.'
  FROM cross_reference_threads t
  JOIN _s345_jdg04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=4 AND sv.verse_number=4
  JOIN _s345_jdg04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=1 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-4-deborah-the-prophetess-and-the-victory-yahuah-gives'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Judges 5:24 — *Blessed above women shall Jael... be*: Deborah''s word that Sisera is sold into a woman''s hand (Judges 4:9) is crowned in the song.'
  FROM cross_reference_threads t
  JOIN _s345_jdg04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=4 AND sv.verse_number=9
  JOIN _s345_jdg04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=5 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-4-sisera-sold-into-the-hand-of-a-woman-jaels-tent-peg'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Judges 5:26 — *with the hammer she smote Sisera... pierced... through his temples*: the song sings the tent-peg deed (Judges 4:21).'
  FROM cross_reference_threads t
  JOIN _s345_jdg04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=4 AND sv.verse_number=21
  JOIN _s345_jdg04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=5 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-4-sisera-sold-into-the-hand-of-a-woman-jaels-tent-peg'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Judges 5:27 — *where he bowed, there he fell down dead*: the song lingers over the mighty captain''s fall (Judges 4:21).'
  FROM cross_reference_threads t
  JOIN _s345_jdg04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=4 AND sv.verse_number=21
  JOIN _s345_jdg04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=5 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-4-sisera-sold-into-the-hand-of-a-woman-jaels-tent-peg'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'1 Corinthians 1:27 — *the weak things... to confound the mighty*: Sisera sold into a woman''s hand (Judges 4:9), the captain confounded by a woman in a tent.'
  FROM cross_reference_threads t
  JOIN _s345_jdg04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=4 AND sv.verse_number=9
  JOIN _s345_jdg04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=1 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-4-sisera-sold-into-the-hand-of-a-woman-jaels-tent-peg'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'1 Corinthians 1:28 — *base things... despised... to bring to nought things that are*: a tent peg brings the captain of iron chariots to nothing (Judges 4:21).'
  FROM cross_reference_threads t
  JOIN _s345_jdg04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=4 AND sv.verse_number=21
  JOIN _s345_jdg04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=1 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-4-sisera-sold-into-the-hand-of-a-woman-jaels-tent-peg'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'Hebrews 11:34 — *out of weakness were made strong... turned to flight the armies of the aliens*: Jael''s deed (Judges 4:21) in the roll of faith.'
  FROM cross_reference_threads t
  JOIN _s345_jdg04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=4 AND sv.verse_number=21
  JOIN _s345_jdg04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=34
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-4-sisera-sold-into-the-hand-of-a-woman-jaels-tent-peg'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Judges 2:16 — *Yahuah raised up judges, which delivered them*: the cry of the oppressed (Judges 4:3) answered by the judge Yahuah raises.'
  FROM cross_reference_threads t
  JOIN _s345_jdg04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=4 AND sv.verse_number=3
  JOIN _s345_jdg04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=2 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-4-the-cry-and-the-deliverer-raised-up'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Psalm 83:9 — *as to Sisera, as to Jabin*: the twenty-year oppression (Judges 4:3) and its overthrow become a prayer in the Psalter.'
  FROM cross_reference_threads t
  JOIN _s345_jdg04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=4 AND sv.verse_number=3
  JOIN _s345_jdg04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=83 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-4-the-cry-and-the-deliverer-raised-up'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Judges 2:18 — *Yahuah was with the judge, and delivered them out of the hand of their enemies*: so Elohim subdued Jabin (Judges 4:23).'
  FROM cross_reference_threads t
  JOIN _s345_jdg04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=4 AND sv.verse_number=23
  JOIN _s345_jdg04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=2 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-4-the-cry-and-the-deliverer-raised-up'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Psalm 83:10 — *they became as dung for the earth*: the total overthrow the psalm remembers is Yashar''el prevailing till Jabin was destroyed (Judges 4:24).'
  FROM cross_reference_threads t
  JOIN _s345_jdg04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=4 AND sv.verse_number=24
  JOIN _s345_jdg04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=83 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-4-the-cry-and-the-deliverer-raised-up'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Hebrews 11:32 — *of Barak...*: the judge who answers the cry, subduing Jabin (Judges 4:23), is named among the faith-deliverers, a shadow of the Deliverer to come.'
  FROM cross_reference_threads t
  JOIN _s345_jdg04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=4 AND sv.verse_number=23
  JOIN _s345_jdg04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=32
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-4-the-cry-and-the-deliverer-raised-up'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_judges_5.sql (Judges 5) -----
-- Chapter: Judges 5 — THE SONG OF DEBORAH AND BARAK (the victory-hymn after Sisera's fall; the
--          theophany of Yahuah marching from Seir; the tribes praised or rebuked; the stars in their
--          courses fighting; Jael blessed above women; the closing — let them that love Yahuah be as the sun)
-- Tag: jdg05   View: _s345_jdg05_lookup   Sort band: 35750, 35753, 35756, 35759
--
-- Judges 5 coverage:
--   v.1-3,9-12 (the song begun — Deborah and Barak sing; *Praise ye Yahuah for the avenging of
--               Yashar'el*; *I, even I, will sing unto Yahuah*; *awake, awake, Deborah... utter a song*)
--          NT:     none warranted at the verse (woven via the consummation thread)
--          Extras: none warranted
--          Tanakh: Exodus 15:1,2,21 (the Song of the Sea — *I will sing unto Yahuah, for he hath
--                  triumphed gloriously*; Miriam and the women sing)
--   v.4-5  (the theophany — *Yahuah, when thou wentest out of Seir... the earth trembled... the mountains
--           melted from before Yahuah, even that Sinai*) — THE MARCHING-FROM-SEIR KEYSTONE
--          NT:     none warranted (the Tanakh theophany cluster carries it)
--          Extras: none warranted
--          Tanakh: Deuteronomy 33:2 (Yahuah came from Sinai, and rose up from Seir), Habakkuk 3:3-6
--                  (Elohim came from Teman... the everlasting mountains were scattered), Psalms 68:7-8
--                  (when thou wentest forth before thy people... the earth shook... even Sinai)
--   v.6-8,13-18 (the tribes that came and the tribes that abode — Ephraim, Benjamin, Machir, Zebulun,
--               Issachar, Naphtali came; Reuben abode among the sheepfolds, Dan in ships, Asher on the shore)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: woven into the song/Song-of-the-Sea thread (the willing offering of the people, 5:2,9)
--   v.19-23 (the battle — the kings of Canaan fought; *they fought from heaven; the stars in their courses
--            fought against Sisera*; the river Kishon swept them; *curse ye Meroz... they came not to the
--            help of Yahuah*) — THE HEAVEN-FOUGHT KEYSTONE
--          NT:     none warranted at the verse
--          Extras: none warranted
--          Tanakh: Joshua 10:11,13 (Yahuah cast down great stones from heaven... the sun stood still),
--                  Judges 4:14-15 (is not Yahuah gone out before thee... Yahuah discomfited Sisera)
--   v.24-27 (Jael blessed above women — the tent-peg deliverance; *at her feet he bowed, he fell*)
--          NT:     none warranted (the deliverer-woman blessing woven via the song; Luke 1:42 echo noted in prose)
--          Extras: none warranted
--          Tanakh: Judges 4:21 (Jael... smote the nail into his temples... so he died)
--   v.28-30 (the mother of Sisera waiting in vain at the window — the proud enemy's fall)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: woven into the consummation thread (the enemies that perish, 5:31)
--   v.31  (the closing — *So let all thine enemies perish, O Yahuah: but let them that love him be as the
--          sun when he goeth forth in his might*) — THE CONSUMMATION KEYSTONE
--          NT:     Matthew 13:43 (then shall the righteous shine forth as the sun in the kingdom of their Father)
--          Extras: none warranted
--          Tanakh: Daniel 12:3 (they that be wise shall shine as the brightness of the firmament),
--                  Psalms 68:1-2 (let Elohim arise, let his enemies be scattered... so let the wicked perish)
--
-- Threads:
--   judges-5-the-song-of-deborah-the-victory-hymn-like-the-song-of-the-sea  [Tanakh: Exodus]                       (free)
--   judges-5-yahuah-marched-from-seir-the-theophany-the-mountains-melted    [Tanakh: Deuteronomy, Habakkuk, Psalms] (free)
--   judges-5-they-fought-from-heaven-the-stars-in-their-courses-fought      [Tanakh: Joshua, Judges]                (free)
--   judges-5-let-them-that-love-him-be-as-the-sun-the-perishing-and-the-shining [Tanakh: Daniel, Psalms | NT: Matthew] (free)
--
-- Framework notes: ★ The Song of Deborah (5:1-3) is sung in the same key as the Song of the Sea — *I, even
-- I, will sing unto Yahuah* (5:3) answers *I will sing unto Yahuah, for he hath triumphed gloriously*
-- (Exod 15:1), and the willing people who *offered themselves* (5:2,9) match the redeemed Yahuah *led forth*
-- (Exod 15:13); two women-prophets, Deborah and Miriam, lift the timbrel after the enemy's chariots fall.
-- ★★ The theophany (5:4-5) is the Formed Son marching to deliver — *Yahuah, when thou wentest out of Seir,
-- when thou marchedst out of the field of Edom, the earth trembled... the mountains melted from before Yahuah,
-- even that Sinai* — the same divine march sung in Moses' blessing (*Yahuah came from Sinai, and rose up from
-- Seir*, Deut 33:2), Habakkuk's prayer (*Elohim came from Teman... the everlasting mountains were scattered*,
-- Hab 3:3-6), and the Psalm (*when thou wentest forth before thy people... even Sinai itself was moved*, Ps
-- 68:7-8): the visible Glory who appeared at Sinai is the One who comes to fight for His people. ★ Heaven
-- itself enlists — *they fought from heaven; the stars in their courses fought against Sisera* (5:20), and
-- the angel of Yahuah curses Meroz *because they came not to the help of Yahuah* (5:23); the same heaven-aid
-- as Gibeon (Josh 10:11,13) and the deliverance Deborah promised (Judg 4:14-15). ★★ The hymn closes on the
-- great contrast (5:31): *So let all thine enemies perish, O Yahuah: but let them that love him be as the sun
-- when he goeth forth in his might* — the proud mother of Sisera waits in vain at her window (5:28-30), her
-- house among the perishing enemies, while those who love Yahuah are promised to shine like the sun. Yahusha
-- fills it: *Then shall the righteous shine forth as the sun in the kingdom of their Father* (Matt 13:43);
-- Daniel sees it: *they that be wise shall shine as the brightness of the firmament... as the stars for ever*
-- (Dan 12:3); and the Psalm opens with the same scattering of the enemy, *let Elohim arise, let his enemies
-- be scattered* (Ps 68:1-2). The seed-war ends in the perishing of the rebel and the shining of those who
-- love Him — the consummation. All members canon → every thread tier_required 'free'.

CREATE TEMP VIEW _s345_jdg05_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: the Song of Deborah — the victory-hymn like the Song of the Sea (Exodus)
    ('canon','judges',5,3,'canon','exodus',15,1,'free',E'*Then sang Moses and the children of Yashar''el (Israel) this song unto Yahuah (LORD)... I will sing unto Yahuah (LORD), for he hath triumphed gloriously: the horse and his rider hath he thrown into the sea* (Exodus 15:1). Deborah''s song is sung in the same key: *I, even I, will sing unto Yahuah (LORD); I will sing praise to Yahuah Elohim (the LORD God) of Yashar''el (Israel)* (5:3). Both hymns burst out the moment the enemy''s chariots are cast down — the same triumph-song of the people Yahuah delivers.'),
    ('canon','judges',5,2,'canon','exodus',15,13,'free',E'*Thou in thy mercy hast led forth the people which thou hast redeemed: thou hast guided them in thy strength unto thy holy habitation* (Exodus 15:13). The Song of the Sea names the people Yahuah *led forth* and redeemed; Deborah praises the same willing, redeemed people: *Praise ye Yahuah (LORD) for the avenging of Yashar''el (Israel), when the people willingly offered themselves* (5:2). Deliverance precedes the song, and the people offer themselves in answer to grace already shown.'),
    ('canon','judges',5,12,'canon','exodus',15,21,'free',E'*And Miriam answered them, Sing ye to Yahuah (LORD), for he hath triumphed gloriously; the horse and his rider hath he thrown into the sea* (Exodus 15:21). As Miriam the prophetess took the timbrel and led the women in the victory-song, so the prophetess Deborah is roused: *Awake, awake, Deborah: awake, awake, utter a song* (5:12). Two prophetesses lift the same hymn over the same kind of fall — the chariots of the proud broken, the song of Yahuah''s people raised.')
    ,
    -- THREAD 2: Yahuah marched from Seir — the theophany, the mountains melted (Deuteronomy / Habakkuk / Psalms)
    ('canon','judges',5,4,'canon','deuteronomy',33,2,'free',E'*And he said, Yahuah (LORD) came from Sinai, and rose up from Seir unto them; he shined forth from mount Paran, and he came with ten thousands of saints: from his right hand went a fiery law for them* (Deuteronomy 33:2). Moses'' blessing sings the very march Deborah sings: *Yahuah (LORD), when thou wentest out of Seir, when thou marchedst out of the field of Edom, the earth trembled* (5:4). The same Glory that rose from Seir and shined from Paran is the Formed One who now marches to deliver Yashar''el.'),
    ('canon','judges',5,5,'canon','deuteronomy',33,2,'free',E'*Yahuah (LORD) came from Sinai, and rose up from Seir unto them; he shined forth from mount Paran* (Deuteronomy 33:2). Deborah names the same Sinai-theophany: *The mountains melted from before Yahuah (LORD), even that Sinai from before Yahuah Elohim (the LORD God) of Yashar''el (Israel)* (5:5). The One who descended on Sinai in fire is the One whose presence melts the mountains as He marches to war for His people.'),
    ('canon','judges',5,4,'canon','habakkuk',3,3,'free',E'*Elohim (God) came from Teman, and the Holy One from mount Paran. Selah. His glory covered the heavens, and the earth was full of his praise* (Habakkuk 3:3). Habakkuk''s prayer takes up the identical march from the south country — Teman and Paran, the very region of Seir and Edom — that Deborah sings: *when thou wentest out of Seir... the earth trembled, and the heavens dropped* (5:4). The same theophany of the marching Deliverer carries across the song and the prophet.'),
    ('canon','judges',5,5,'canon','habakkuk',3,6,'free',E'*He stood, and measured the earth: he beheld, and drove asunder the nations; and the everlasting mountains were scattered, the perpetual hills did bow: his ways are everlasting* (Habakkuk 3:6). Habakkuk''s scattered mountains and bowing hills are Deborah''s *mountains melted from before Yahuah (LORD), even that Sinai* (5:5). The everlasting hills cannot stand before the presence of the marching Yahuah — the creation itself trembles when the Deliverer goes forth.'),
    ('canon','judges',5,4,'canon','psalms',68,8,'free',E'*The earth shook, the heavens also dropped at the presence of Elohim (God): even Sinai itself was moved at the presence of Elohim (God), the Elohim (God) of Yashar''el (Israel)* (Psalms 68:8). The Psalm sings Deborah''s theophany almost word for word — *the earth trembled, and the heavens dropped* (5:4) — *even Sinai itself was moved*. The march of Yahuah forth before His people shakes earth and heaven, the Glory of Sinai going out to deliver.'),
    ('canon','judges',5,4,'canon','psalms',68,7,'free',E'*O Elohim (God), when thou wentest forth before thy people, when thou didst march through the wilderness; Selah* (Psalms 68:7). The Psalm''s *when thou wentest forth before thy people... when thou didst march* is Deborah''s *when thou wentest out of Seir, when thou marchedst out of the field of Edom* (5:4). The going-forth and the marching are the same divine deliverance — Yahuah at the head of His people, the wilderness and the field shaking before Him.')
    ,
    -- THREAD 3: they fought from heaven — the stars in their courses fought (Joshua / Judges)
    ('canon','judges',5,20,'canon','joshua',10,11,'free',E'*Yahuah (LORD) cast down great stones from heaven upon them unto Azekah, and they died: they were more which died with hailstones than they whom the children of Yashar''el (Israel) slew with the sword* (Joshua 10:11). At Gibeon heaven itself made war on Yashar''el''s enemies, exactly as Deborah sings: *They fought from heaven; the stars in their courses fought against Sisera* (5:20). The host of heaven is enlisted in Yahuah''s battles — the enemy falls not by the sword of man alone but by the armies of the sky.'),
    ('canon','judges',5,20,'canon','joshua',10,13,'free',E'*And the sun stood still, and the moon stayed, until the people had avenged themselves upon their enemies... So the sun stood still in the midst of heaven, and hasted not to go down about a whole day* (Joshua 10:13). The sun and moon halted for Joshua''s battle as the stars fought for Deborah''s: *They fought from heaven; the stars in their courses fought against Sisera* (5:20). The very lights of heaven are marshalled for Yahuah''s deliverance — creation itself takes the field against the foe.'),
    ('canon','judges',5,23,'canon','judges',4,14,'free',E'*And Deborah said unto Barak, Up; for this is the day in which Yahuah (LORD) hath delivered Sisera into thine hand: is not Yahuah (LORD) gone out before thee?* (Judges 4:14). The prose names what the song celebrates — Yahuah gone out before the host — so the song can curse those who refused to follow: *Curse ye Meroz, said the angel of Yahuah (LORD)... because they came not to the help of Yahuah (LORD)* (5:23). When Yahuah Himself goes out to fight, to stand aside from His battle is itself the curse.'),
    ('canon','judges',5,21,'canon','judges',4,15,'free',E'*And Yahuah (LORD) discomfited Sisera, and all his chariots, and all his host, with the edge of the sword before Barak; so that Sisera lighted down off his chariot, and fled away on his feet* (Judges 4:15). The prose says Yahuah discomfited the host; the song says how: *The river of Kishon swept them away, that ancient river, the river Kishon* (5:21). Heaven''s war and the flooding Kishon are Yahuah''s discomfiting of Sisera — the chariots that were iron and dread swept off like nothing before Him.')
    ,
    -- THREAD 4: let them that love him be as the sun — the perishing and the shining (Daniel / Psalms / Matthew)
    ('canon','judges',5,31,'canon','matthew',13,43,'free',E'*Then shall the righteous shine forth as the sun in the kingdom of their Father. Who hath ears to hear, let him hear* (Matthew 13:43). Deborah''s closing word is fulfilled in Yahusha''s harvest parable: *let them that love him be as the sun when he goeth forth in his might* (5:31). Those who love Yahuah are promised the very brightness of the sun — the righteous shining in the Father''s kingdom while the enemies of Yahuah perish in the furnace.'),
    ('canon','judges',5,31,'canon','daniel',12,3,'free',E'*And they that be wise shall shine as the brightness of the firmament; and they that turn many to righteousness as the stars for ever and ever* (Daniel 12:3). Daniel sees the same shining Deborah sings — *let them that love him be as the sun when he goeth forth in his might* (5:31). The lovers of Yahuah are promised the brightness of the firmament and the stars; the same heaven that fought for them (5:20) is the glory they will wear forever.'),
    ('canon','judges',5,31,'canon','psalms',68,1,'free',E'*Let Elohim (God) arise, let his enemies be scattered: let them also that hate him flee before him* (Psalms 68:1). The Psalm of the marching Yahuah opens with the same prayer Deborah ends on: *So let all thine enemies perish, O Yahuah (LORD)* (5:31). The enemies of Yahuah are scattered and perish at His arising — the proud mother of Sisera waiting at her window (5:28) numbered among them.'),
    ('canon','judges',5,31,'canon','psalms',68,2,'free',E'*As smoke is driven away, so drive them away: as wax melteth before the fire, so let the wicked perish at the presence of Elohim (God)* (Psalms 68:2). The wicked melting like wax before Yahuah is Deborah''s *So let all thine enemies perish, O Yahuah (LORD)* (5:31). The same presence that melted the mountains (5:5) melts away the enemy — the perishing of the rebel set against the shining of those who love Him.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s345_jdg05_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s345_jdg05_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judges-5-the-song-of-deborah-the-victory-hymn-like-the-song-of-the-sea',
       E'The Song of Deborah — the Victory-Hymn Like the Song of the Sea',
       E'When Sisera''s nine hundred chariots of iron lie broken, Deborah and Barak break into song — and the song is cut from the same cloth as the Song of the Sea. *Then sang Deborah and Barak the son of Abinoam on that day... Praise ye Yahuah (LORD) for the avenging of Yashar''el (Israel), when the people willingly offered themselves* (Judges 5:1-2); *I, even I, will sing unto Yahuah (LORD); I will sing praise to Yahuah Elohim (the LORD God) of Yashar''el (Israel)* (5:3). It answers Moses note for note: *Then sang Moses and the children of Yashar''el (Israel) this song unto Yahuah (LORD)... I will sing unto Yahuah (LORD), for he hath triumphed gloriously: the horse and his rider hath he thrown into the sea* (Exodus 15:1). Both hymns rise the instant the chariots of the proud are cast down. And both sing the people Yahuah redeems: *Thou in thy mercy hast led forth the people which thou hast redeemed* (Exodus 15:13) is the willing, offered people of *when the people willingly offered themselves* (5:2,9) — deliverance first, then the song of the redeemed. So Deborah is roused as Miriam was: *Awake, awake, Deborah: awake, awake, utter a song* (5:12), the very office Miriam filled — *And Miriam answered them, Sing ye to Yahuah (LORD), for he hath triumphed gloriously; the horse and his rider hath he thrown into the sea* (Exodus 15:21). Two prophetesses, two timbrel-songs over two fallen hosts; the victory-hymn of Yahuah''s delivered people sung again at Kishon as it was sung at the Sea.',
       sv.verse_id, ev.verse_id, 'free', 35750
  FROM _s345_jdg05_lookup sv, _s345_jdg05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=5 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='judges' AND ev.chapter_number=5 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judges-5-yahuah-marched-from-seir-the-theophany-the-mountains-melted',
       E'Yahuah Marched from Seir — the Theophany, the Mountains Melted',
       E'At the heart of the song stands a theophany — the Formed Son marching out of the south to deliver: *Yahuah (LORD), when thou wentest out of Seir, when thou marchedst out of the field of Edom, the earth trembled, and the heavens dropped, the clouds also dropped water. The mountains melted from before Yahuah (LORD), even that Sinai from before Yahuah Elohim (the LORD God) of Yashar''el (Israel)* (Judges 5:4-5). This is the same march sung across the Scriptures. Moses'' blessing: *Yahuah (LORD) came from Sinai, and rose up from Seir unto them; he shined forth from mount Paran, and he came with ten thousands of saints: from his right hand went a fiery law for them* (Deuteronomy 33:2). Habakkuk''s prayer takes up the very region — Teman and Paran — and the very upheaval: *Elohim (God) came from Teman, and the Holy One from mount Paran. Selah. His glory covered the heavens* (Habakkuk 3:3); *He stood, and measured the earth: he beheld, and drove asunder the nations; and the everlasting mountains were scattered, the perpetual hills did bow* (Habakkuk 3:6). And the Psalm sings it almost word for word: *O Elohim (God), when thou wentest forth before thy people, when thou didst march through the wilderness* (Psalms 68:7); *The earth shook, the heavens also dropped at the presence of Elohim (God): even Sinai itself was moved at the presence of Elohim (God), the Elohim (God) of Yashar''el (Israel)* (Psalms 68:8). The visible Glory who descended on Sinai in fire — the One who appeared and led Yashar''el — is the One whose marching now melts the mountains and shakes the heavens. Creation itself cannot stand before the presence of the Deliverer going forth to fight for His people.',
       sv.verse_id, ev.verse_id, 'free', 35753
  FROM _s345_jdg05_lookup sv, _s345_jdg05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=5 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='judges' AND ev.chapter_number=5 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judges-5-they-fought-from-heaven-the-stars-in-their-courses-fought',
       E'They Fought from Heaven — the Stars in Their Courses Fought',
       E'The kings of Canaan came in their iron chariots, but the battle was decided above their heads: *The kings came and fought, then fought the kings of Canaan in Taanach by the waters of Megiddo... They fought from heaven; the stars in their courses fought against Sisera. The river of Kishon swept them away, that ancient river, the river Kishon* (Judges 5:19-21). The host of heaven is enlisted in Yahuah''s war — exactly as at Gibeon: *Yahuah (LORD) cast down great stones from heaven upon them... they were more which died with hailstones than they whom the children of Yashar''el (Israel) slew with the sword* (Joshua 10:11); *And the sun stood still, and the moon stayed, until the people had avenged themselves upon their enemies* (Joshua 10:13). The very lights of heaven take the field for Yahuah''s deliverance. The prose of the previous chapter names the same hand at work — *is not Yahuah (LORD) gone out before thee?* (Judges 4:14); *And Yahuah (LORD) discomfited Sisera, and all his chariots, and all his host* (Judges 4:15) — the discomfiting that the song reveals to be heaven''s war and the flooding Kishon. And because Yahuah Himself goes out to fight, to stand aside from His battle is itself the curse: *Curse ye Meroz, said the angel of Yahuah (LORD), curse ye bitterly the inhabitants thereof; because they came not to the help of Yahuah (LORD), to the help of Yahuah (LORD) against the mighty* (5:23). When the stars themselves come down to fight for Yashar''el, the only shame is to have stayed home.',
       sv.verse_id, ev.verse_id, 'free', 35756
  FROM _s345_jdg05_lookup sv, _s345_jdg05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=5 AND sv.verse_number=20
   AND ev.edition_slug='canon' AND ev.book_slug='judges' AND ev.chapter_number=5 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judges-5-let-them-that-love-him-be-as-the-sun-the-perishing-and-the-shining',
       E'Let Them That Love Him Be As the Sun — the Perishing and the Shining',
       E'The whole song narrows to one great contrast at its close. The proud mother of Sisera waits in vain at her lattice for a son who will never come: *The mother of Sisera looked out at a window, and cried through the lattice, Why is his chariot so long in coming? why tarry the wheels of his chariots?* (Judges 5:28); her wise ladies comfort her with dreams of dividing the spoil — *to every man a damsel or two* (5:30) — while her son lies dead at Jael''s feet. And then the final word: *So let all thine enemies perish, O Yahuah (LORD): but let them that love him be as the sun when he goeth forth in his might. And the land had rest forty years* (5:31). Two destinies are set side by side — the enemies of Yahuah perish; those who love Him shine like the rising sun. Yahusha fills the promise exactly: *Then shall the righteous shine forth as the sun in the kingdom of their Father. Who hath ears to hear, let him hear* (Matthew 13:43) — spoken as the tares are bound and burned and the wheat gathered, the very harvest-contrast of Deborah''s close. Daniel sees the same glory: *And they that be wise shall shine as the brightness of the firmament; and they that turn many to righteousness as the stars for ever and ever* (Daniel 12:3) — the lovers of Yahuah given the brightness of the very heaven that fought for them. And the Psalm of the marching Yahuah opens on the perishing side of the contrast: *Let Elohim (God) arise, let his enemies be scattered: let them also that hate him flee before him* (Psalms 68:1); *As smoke is driven away, so drive them away: as wax melteth before the fire, so let the wicked perish at the presence of Elohim (God)* (Psalms 68:2). The seed-war ends as it must — the rebel melted away like wax, those who love Yahuah shining as the sun. This is the consummation the whole library moves toward.',
       sv.verse_id, ev.verse_id, 'free', 35759
  FROM _s345_jdg05_lookup sv, _s345_jdg05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=5 AND sv.verse_number=31
   AND ev.edition_slug='canon' AND ev.book_slug='judges' AND ev.chapter_number=5 AND ev.verse_number=31
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Exodus 15:1 — *I will sing unto Yahuah, for he hath triumphed gloriously*: Deborah''s *I, even I, will sing unto Yahuah* (5:3) is the Song of the Sea sung again over a fallen host.'
  FROM cross_reference_threads t
  JOIN _s345_jdg05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=5 AND sv.verse_number=3
  JOIN _s345_jdg05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=15 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-5-the-song-of-deborah-the-victory-hymn-like-the-song-of-the-sea'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Exodus 15:13 — *Thou in thy mercy hast led forth the people which thou hast redeemed*: the redeemed people who *willingly offered themselves* (5:2) — deliverance first, then the song.'
  FROM cross_reference_threads t
  JOIN _s345_jdg05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=5 AND sv.verse_number=2
  JOIN _s345_jdg05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=15 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-5-the-song-of-deborah-the-victory-hymn-like-the-song-of-the-sea'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Exodus 15:21 — *Miriam answered them, Sing ye to Yahuah, for he hath triumphed gloriously*: the prophetess with the timbrel; Deborah is roused the same way, *awake, utter a song* (5:12).'
  FROM cross_reference_threads t
  JOIN _s345_jdg05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=5 AND sv.verse_number=12
  JOIN _s345_jdg05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=15 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-5-the-song-of-deborah-the-victory-hymn-like-the-song-of-the-sea'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Deuteronomy 33:2 — *Yahuah came from Sinai, and rose up from Seir... he shined forth from mount Paran*: the same march Deborah sings, *when thou wentest out of Seir* (5:4).'
  FROM cross_reference_threads t
  JOIN _s345_jdg05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=5 AND sv.verse_number=4
  JOIN _s345_jdg05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=33 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-5-yahuah-marched-from-seir-the-theophany-the-mountains-melted'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Deuteronomy 33:2 — *Yahuah came from Sinai... shined forth from mount Paran*: the Sinai-theophany of *the mountains melted... even that Sinai* (5:5), the One who descended in fire.'
  FROM cross_reference_threads t
  JOIN _s345_jdg05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=5 AND sv.verse_number=5
  JOIN _s345_jdg05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=33 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-5-yahuah-marched-from-seir-the-theophany-the-mountains-melted'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Habakkuk 3:3 — *Elohim came from Teman, and the Holy One from mount Paran*: the same southern march — Teman and Paran the region of Seir — as *when thou wentest out of Seir* (5:4).'
  FROM cross_reference_threads t
  JOIN _s345_jdg05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=5 AND sv.verse_number=4
  JOIN _s345_jdg05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='habakkuk' AND tv.chapter_number=3 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-5-yahuah-marched-from-seir-the-theophany-the-mountains-melted'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Habakkuk 3:6 — *the everlasting mountains were scattered, the perpetual hills did bow*: Deborah''s *mountains melted from before Yahuah, even that Sinai* (5:5) — creation trembling before the marching Deliverer.'
  FROM cross_reference_threads t
  JOIN _s345_jdg05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=5 AND sv.verse_number=5
  JOIN _s345_jdg05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='habakkuk' AND tv.chapter_number=3 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-5-yahuah-marched-from-seir-the-theophany-the-mountains-melted'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Psalms 68:8 — *The earth shook, the heavens also dropped... even Sinai itself was moved*: Deborah''s *the earth trembled, and the heavens dropped* (5:4) almost word for word, the Glory of Sinai going forth.'
  FROM cross_reference_threads t
  JOIN _s345_jdg05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=5 AND sv.verse_number=4
  JOIN _s345_jdg05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=68 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-5-yahuah-marched-from-seir-the-theophany-the-mountains-melted'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'Psalms 68:7 — *when thou wentest forth before thy people, when thou didst march through the wilderness*: the going-forth and marching of *when thou marchedst out of the field of Edom* (5:4).'
  FROM cross_reference_threads t
  JOIN _s345_jdg05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=5 AND sv.verse_number=4
  JOIN _s345_jdg05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=68 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-5-yahuah-marched-from-seir-the-theophany-the-mountains-melted'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Joshua 10:11 — *Yahuah cast down great stones from heaven upon them*: heaven made war at Gibeon as *the stars in their courses fought against Sisera* (5:20).'
  FROM cross_reference_threads t
  JOIN _s345_jdg05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=5 AND sv.verse_number=20
  JOIN _s345_jdg05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=10 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-5-they-fought-from-heaven-the-stars-in-their-courses-fought'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Joshua 10:13 — *the sun stood still, and the moon stayed*: the lights of heaven marshalled for Joshua as the stars fought for Deborah (5:20).'
  FROM cross_reference_threads t
  JOIN _s345_jdg05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=5 AND sv.verse_number=20
  JOIN _s345_jdg05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=10 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-5-they-fought-from-heaven-the-stars-in-their-courses-fought'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Judges 4:14 — *is not Yahuah gone out before thee?*: Yahuah goes out to fight, so to refuse His battle is the curse of *they came not to the help of Yahuah* (5:23).'
  FROM cross_reference_threads t
  JOIN _s345_jdg05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=5 AND sv.verse_number=23
  JOIN _s345_jdg05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=4 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-5-they-fought-from-heaven-the-stars-in-their-courses-fought'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Judges 4:15 — *Yahuah discomfited Sisera, and all his chariots*: the prose names the discomfiting the song reveals — *the river of Kishon swept them away* (5:21).'
  FROM cross_reference_threads t
  JOIN _s345_jdg05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=5 AND sv.verse_number=21
  JOIN _s345_jdg05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=4 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-5-they-fought-from-heaven-the-stars-in-their-courses-fought'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Matthew 13:43 — *Then shall the righteous shine forth as the sun in the kingdom of their Father*: Yahusha fills Deborah''s *let them that love him be as the sun* (5:31).'
  FROM cross_reference_threads t
  JOIN _s345_jdg05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=5 AND sv.verse_number=31
  JOIN _s345_jdg05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=13 AND tv.verse_number=43
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-5-let-them-that-love-him-be-as-the-sun-the-perishing-and-the-shining'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Daniel 12:3 — *they that be wise shall shine as the brightness of the firmament... as the stars for ever*: the lovers of Yahuah given the brightness of the heaven that fought for them (5:31).'
  FROM cross_reference_threads t
  JOIN _s345_jdg05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=5 AND sv.verse_number=31
  JOIN _s345_jdg05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-5-let-them-that-love-him-be-as-the-sun-the-perishing-and-the-shining'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Psalms 68:1 — *Let Elohim arise, let his enemies be scattered*: the Psalm of the marching Yahuah opens on Deborah''s *So let all thine enemies perish, O Yahuah* (5:31).'
  FROM cross_reference_threads t
  JOIN _s345_jdg05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=5 AND sv.verse_number=31
  JOIN _s345_jdg05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=68 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-5-let-them-that-love-him-be-as-the-sun-the-perishing-and-the-shining'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Psalms 68:2 — *as wax melteth before the fire, so let the wicked perish at the presence of Elohim*: the rebel melted away, set against those who love Yahuah shining as the sun (5:31).'
  FROM cross_reference_threads t
  JOIN _s345_jdg05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=5 AND sv.verse_number=31
  JOIN _s345_jdg05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=68 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-5-let-them-that-love-him-be-as-the-sun-the-perishing-and-the-shining'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session345 — Judges cross-references complete.'
