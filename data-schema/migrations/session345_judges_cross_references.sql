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

-- ----- fragment: minion_judges_6.sql (Judges 6) -----
-- Chapter: Judges 6 — GIDEON CALLED BY THE ANGEL OF YAHUAH (the cycle — Midian oppresses seven
--          years, Yashar'el cries, a prophet rebukes; ★★ the Angel of Yahuah sits under the oak and
--          commissions Gideon threshing in the winepress — *thou mighty man of valour... have not I
--          sent thee?*; the least chosen; ★ the fire-sign out of the rock; ★ seen face to face yet
--          not die — Yahuah-shalom; Baal's altar thrown down — Jerubbaal; ★★ the Spirit of Yahuah
--          clothed Gideon; ★ the fleece — Yahuah condescends to confirm weak faith)
-- Tag: jdg06   View: _s345_jdg06_lookup   Sort band: 35775, 35778, 35781, 35784, 35787
--
-- Judges 6 coverage:
--   v.1-10 (the cycle — *delivered them into the hand of Midian seven years*; *the children of
--           Yashar'el cried unto Yahuah*; a prophet rebukes, *I brought you up from Egypt... ye have
--           not obeyed my voice*) — THE OPPRESSION/CRY/REBUKE
--          NT:     none warranted at the verse
--          Extras: none warranted
--          Tanakh: Judges 2:1-3,11-16 (the angel of Yahuah's covenant lawsuit; the judges-cycle —
--                  Yahuah raised up judges, delivered them), Exodus 3:7-9 (I have seen the affliction
--                  of my people... heard their cry)
--   v.11-16 (the Angel of Yahuah under the oak calls Gideon — *Yahuah is with thee, thou mighty man
--            of valour*; *Go in this thy might... have not I sent thee?*; *I am the least in my
--            father's house*; *Surely I will be with thee*) — THE COMMISSIONING OF THE LEAST
--          NT:     1 Corinthians 1:27-28 (Elohim hath chosen the weak things... base things... things
--                  which are not, to bring to nought things that are)
--          Extras: none warranted
--          Tanakh: Exodus 3:10-12 (Come now... I will send thee unto Pharaoh; Who am I... Certainly I
--                  will be with thee), Exodus 3:7 (the cry heard — woven into thread 1)
--   v.17-24 (the sign — the offering, the staff, *there rose up fire out of the rock, and consumed*;
--            *I have seen an angel of Yahuah face to face*; *Peace be unto thee; fear not: thou shalt
--            not die*; the altar Yahuah-shalom) — THE FIRE-SIGN / SEEN FACE TO FACE
--          NT:     none warranted (the Tanakh theophany cluster carries the Formed-Son weight)
--          Extras: none warranted
--          Tanakh: Judges 13:15-22 (Manoah's angel — the kid offered, fire/flame ascends, *we shall
--                  surely die, because we have seen Elohim*), Exodus 33:20 (Thou canst not see my face:
--                  for there shall no man see me, and live), Exodus 3:6 (Moses hid his face; afraid to
--                  look upon Elohim)
--   v.25-34 (Baal's altar thrown down — Jerubbaal, *Let Baal plead*; ★★ *the Spirit of Yahuah came
--            upon Gideon*) — THE SPIRIT CLOTHED THE JUDGE
--          NT:     none warranted at the verse
--          Extras: none warranted
--          Tanakh: Judges 13:25 (the Spirit of Yahuah began to move him — Samson), Numbers 11:25 (the
--                  spirit rested upon them, and they prophesied — the Spirit put upon the deliverers)
--   v.36-40 (the fleece — the double sign, dew on the fleece/ground dry, then the reverse; *let me
--            prove, I pray thee, but this once*) — YAHUAH CONFIRMS WEAK FAITH
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: Exodus 4:1-9 (the signs given to the doubting deliverer — the rod, the leprous
--                  hand — *that they may believe*; *if they will not believe... the latter sign*)
--
-- Threads:
--   judges-6-the-cycle-midian-oppressed-and-yashar-el-cried-the-prophet-rebuked  [Tanakh: Judges, Exodus] (free)
--   judges-6-the-angel-of-yahuah-commissioned-gideon-the-least-have-not-i-sent-thee [Tanakh: Exodus | NT: 1 Corinthians] (free)
--   judges-6-fire-out-of-the-rock-i-have-seen-the-angel-of-yahuah-face-to-face   [Tanakh: Judges, Exodus] (free)
--   judges-6-the-spirit-of-yahuah-came-upon-gideon-the-spirit-clothed-the-judge  [Tanakh: Judges, Numbers] (free)
--   judges-6-the-fleece-yahuah-condescends-to-confirm-the-weak-faith             [Tanakh: Exodus] (free)
--
-- Framework notes: ★ The cycle (6:1-10) is the Judges pattern named in chapter 2 — Yashar'el does evil,
-- is delivered into an oppressor's hand, *cried unto Yahuah*, and Yahuah raises a deliverer (Judg 2:16);
-- the prophet's rebuke *I brought you up from Egypt... ye have not obeyed my voice* (6:8-10) is the same
-- covenant lawsuit the angel of Yahuah brought at Bochim (Judg 2:1-3), and the cry-heard answers Exodus
-- 3:7 where Yahuah *heard their cry*. ★★ The Angel of Yahuah (6:11-16) is the Formed Son — He bears the
-- Name, He is called *Yahuah* outright at v.14,16, and He commissions the reluctant Gideon exactly as He
-- commissioned Moses at the bush: *Go in this thy might... have not I sent thee?* (6:14) answers *I will
-- send thee unto Pharaoh* (Exod 3:10); Gideon's *I am the least in my father's house* (6:15) answers
-- Moses' *Who am I?* (Exod 3:11); and both get the same promise, *Surely I will be with thee* (6:16) /
-- *Certainly I will be with thee* (Exod 3:12). The least is chosen — Paul names the principle: *Elohim
-- hath chosen the weak things of the world to confound the things which are mighty* (1 Cor 1:27). ★ The
-- fire-sign and face-to-face (6:17-24) is the theophany: the Angel touches the offering with His staff
-- and *there rose up fire out of the rock, and consumed* it (6:21), and Gideon fears for his life having
-- *seen an angel of Yahuah face to face* (6:22) — the exact terror of Manoah, *we shall surely die,
-- because we have seen Elohim* (Judg 13:22, the same angel, the same kid offered, the same fire ascending),
-- and the terror behind *there shall no man see me, and live* (Exod 33:20) and Moses hiding his face
-- (Exod 3:6). Yet the One who is Yahuah speaks peace: *Peace be unto thee; fear not: thou shalt not die*
-- (6:23) — the Formed Son seen, who spares. ★★ *The Spirit of Yahuah came upon Gideon* (6:34) — the Hebrew
-- says the Spirit *clothed itself with* Gideon; the Spirit-empowered judge, the same Spirit that *began to
-- move* Samson (Judg 13:25) and that Yahuah *took... and gave it unto the seventy elders... and they
-- prophesied* (Num 11:25). The Spirit and the deliverance are inseparable. ★ The fleece (6:36-40) is
-- Yahuah's condescension to confirm a weak faith — the same grace He showed the doubting Moses, giving him
-- sign upon sign *that they may believe* (Exod 4:5), *if they will not believe... the voice of the latter
-- sign* (Exod 4:8). Yahuah meets the trembling deliverer where he is. All members canon → every thread
-- tier_required 'free'.

CREATE TEMP VIEW _s345_jdg06_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: the cycle — Midian oppressed and Yashar'el cried, the prophet rebuked (Judges / Exodus)
    ('canon','judges',6,6,'canon','judges',2,16,'free',E'*Nevertheless Yahuah (LORD) raised up judges, which delivered them out of the hand of those that spoiled them* (Judges 2:16). Chapter 2 lays down the whole pattern Gideon''s story now repeats: Yashar''el does evil, is sold into an oppressor''s hand, and *the children of Yashar''el (Israel) cried unto Yahuah (LORD)* (6:6) — and at the cry Yahuah raises a deliverer. The Midian-oppression and the cry are the cycle''s opening move, and the Angel''s call of Gideon is Yahuah raising the judge.'),
    ('canon','judges',6,8,'canon','judges',2,1,'free',E'*And an angel of Yahuah (LORD) came up from Gilgal to Bochim, and said, I made you to go up out of Egypt, and have brought you unto the land which I sware unto your fathers; and I said, I will never break my covenant with you* (Judges 2:1). The prophet sent in 6:8 brings the very same covenant lawsuit the angel of Yahuah brought at Bochim — *Thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel), I brought you up from Egypt, and brought you forth out of the house of bondage* (6:8). The complaint is identical: I kept covenant, *but ye have not obeyed my voice* (6:10 / Judg 2:2).'),
    ('canon','judges',6,6,'canon','exodus',3,7,'free',E'*And Yahuah (LORD) said, I have surely seen the affliction of my people which are in Egypt, and have heard their cry by reason of their taskmasters; for I know their sorrows* (Exodus 3:7). The cry of impoverished Yashar''el — *the children of Yashar''el (Israel) cried unto Yahuah (LORD)* (6:6) — is the same cry Yahuah heard from Egypt; and as the cry from Egypt brought the Angel of the bush, the cry under Midian brings the Angel under the oak. The Deliverer comes to the cry of His afflicted people.'),
    ('canon','judges',6,10,'canon','judges',2,11,'free',E'*And the children of Yashar''el (Israel) did evil in the sight of Yahuah (LORD), and served Baalim* (Judges 2:11). The prophet''s charge *fear not the gods of the Amorites, in whose land ye dwell: but ye have not obeyed my voice* (6:10) names the sin chapter 2 named — Yashar''el forsook Yahuah and served the Baalim. The very Baal-altar Gideon must throw down (6:25) is the cycle''s root, the broken first commandment that brought Midian upon them.')
    ,
    -- THREAD 2: the Angel of Yahuah commissioned Gideon the least — have not I sent thee? (Exodus / 1 Corinthians)
    ('canon','judges',6,14,'canon','exodus',3,10,'free',E'*Come now therefore, and I will send thee unto Pharaoh, that thou mayest bring forth my people the children of Yashar''el (Israel) out of Egypt* (Exodus 3:10). The Angel of Yahuah commissions Gideon in the very words He used at the bush: *Go in this thy might, and thou shalt save Yashar''el (Israel) from the hand of the Midianites: have not I sent thee?* (6:14). The same Formed One who sent Moses to Pharaoh now sends Gideon against Midian — the Deliverer who appears, bears the Name, and raises up the deliverer.'),
    ('canon','judges',6,15,'canon','exodus',3,11,'free',E'*And Moses said unto Elohim (God), Who am I, that I should go unto Pharaoh, and that I should bring forth the children of Yashar''el (Israel) out of Egypt?* (Exodus 3:11). Gideon answers his call exactly as Moses answered his: *Oh my Lord, wherewith shall I save Yashar''el (Israel)? behold, my family is poor in Manasseh, and I am the least in my father''s house* (6:15). The chosen deliverer protests his own nothingness — *Who am I* and *I am the least* are the same shrinking before a calling too great.'),
    ('canon','judges',6,16,'canon','exodus',3,12,'free',E'*And he said, Certainly I will be with thee; and this shall be a token unto thee, that I have sent thee* (Exodus 3:12). To the protesting least Yahuah gives the same single answer He gave Moses: *Surely I will be with thee, and thou shalt smite the Midianites as one man* (6:16). The deliverer''s weakness is met not with a better deliverer but with the promise of presence — *I will be with thee* — and a sign to seal that He has sent.'),
    ('canon','judges',6,15,'canon','1-corinthians',1,27,'free',E'*But Elohim (God) hath chosen the foolish things of the world to confound the wise; and Elohim (God) hath chosen the weak things of the world to confound the things which are mighty* (1 Corinthians 1:27). Gideon — *poor in Manasseh... the least in my father''s house* (6:15) — is the very principle Paul names: Yahuah chooses the weak to shame the mighty, so the victory is plainly His. The least man threshing in a winepress is sent to break the camels-without-number of Midian.'),
    ('canon','judges',6,15,'canon','1-corinthians',1,28,'free',E'*And base things of the world, and things which are despised, hath Elohim (God) chosen, yea, and things which are not, to bring to nought things that are: That no flesh should glory in his presence* (1 Corinthians 1:28). Gideon counts himself among the *things which are not* — *I am the least* (6:15) — and that is precisely whom Yahuah chooses, *that no flesh should glory in his presence*. The deliverance of Yashar''el will be by Yahuah''s hand through the least, never by the strength of the deliverer.')
    ,
    -- THREAD 3: fire out of the rock — I have seen the angel of Yahuah face to face (Judges / Exodus)
    ('canon','judges',6,21,'canon','judges',13,20,'free',E'*For it came to pass, when the flame went up toward heaven from off the altar, that the angel of Yahuah (LORD) ascended in the flame of the altar. And Manoah and his wife looked on it, and fell on their faces to the ground* (Judges 13:20). The same Angel of Yahuah, the same offered kid, the same ascending fire: as fire rose and the Angel departed for Gideon — *there rose up fire out of the rock, and consumed the flesh and the unleavened cakes* (6:21) — so the flame ascends and the Angel ascends in it for Manoah. The Formed One receives the offering and is made known in the fire.'),
    ('canon','judges',6,22,'canon','judges',13,22,'free',E'*And Manoah said unto his wife, We shall surely die, because we have seen Elohim (God)* (Judges 13:22). Gideon''s terror is word for word Manoah''s: *Alas, O Yahuah (Lord) GOD! for because I have seen an angel of Yahuah (LORD) face to face* (6:22). To have seen the Angel of Yahuah is to have seen Elohim — both men brace for death, for the One they saw is Yahuah Himself in the form that appears.'),
    ('canon','judges',6,22,'canon','exodus',33,20,'free',E'*And he said, Thou canst not see my face: for there shall no man see me, and live* (Exodus 33:20). Gideon''s dread — *I have seen an angel of Yahuah (LORD) face to face* (6:22) — rests on this very law spoken to Moses: no man sees Yahuah and lives. Yet Gideon has seen the Angel of Yahuah and is told *thou shalt not die* (6:23): the Formed Son is the One who may be seen, the visible Glory of the unseen Father, who shows His face to His servants and spares them.'),
    ('canon','judges',6,22,'canon','exodus',3,6,'free',E'*Moreover he said, I am the Elohim (God) of thy father, the Elohim (God) of Abraham, the Elohim (God) of Isaac, and the Elohim (God) of Jacob. And Moses hid his face; for he was afraid to look upon Elohim (God)* (Exodus 3:6). At the bush the Angel of Yahuah is named Elohim, and Moses hides his face in fear; under the oak Gideon, *when he perceived that he was an angel of Yahuah (LORD)* (6:22), is gripped by the same fear of having looked upon the One who is Yahuah. The Angel who calls the deliverer is the Elohim of the fathers, seen and feared.')
    ,
    -- THREAD 4: the Spirit of Yahuah came upon Gideon — the Spirit clothed the judge (Judges / Numbers)
    ('canon','judges',6,34,'canon','judges',13,25,'free',E'*And the Spirit of Yahuah (LORD) began to move him at times in the camp of Dan between Zorah and Eshtaol* (Judges 13:25). As the Spirit of Yahuah began to move Samson for his deliverance, so *the Spirit of Yahuah (LORD) came upon Gideon, and he blew a trumpet* (6:34) — the same Spirit that empowers the judge to act. The deliverers of Yashar''el move not by their own strength but as the Spirit of Yahuah comes upon them.'),
    ('canon','judges',6,34,'canon','numbers',11,25,'free',E'*And Yahuah (LORD) came down in a cloud, and spake unto him, and took of the spirit that was upon him, and gave it unto the seventy elders: and it came to pass, that, when the spirit rested upon them, they prophesied, and did not cease* (Numbers 11:25). The Spirit put upon the seventy to bear the burden of the people is the same Spirit that *came upon Gideon* (6:34) to gather and lead them. The Spirit clothing the chosen man is how Yahuah equips every deliverer He raises — Moses'' elders, Gideon, the judges — for the work too heavy for flesh.')
    ,
    -- THREAD 5: the fleece — Yahuah condescends to confirm the weak faith (Exodus)
    ('canon','judges',6,37,'canon','exodus',4,8,'free',E'*And it shall come to pass, if they will not believe thee, neither hearken to the voice of the first sign, that they will believe the voice of the latter sign* (Exodus 4:8). Yahuah gave the doubting Moses a first sign and a latter sign to confirm him; He gives the doubting Gideon the same doubled mercy — dew on the fleece and the ground dry, then dew on the ground and the fleece dry (6:37-40), *let me prove, I pray thee, but this once* (6:39). The Deliverer condescends to the trembling faith of the man He sends.'),
    ('canon','judges',6,36,'canon','exodus',4,5,'free',E'*That they may believe that Yahuah Elohim (the LORD God) of their fathers, the Elohim (God) of Abraham, the Elohim (God) of Isaac, and the Elohim (God) of Jacob, hath appeared unto thee* (Exodus 4:5). The signs to Moses were given *that they may believe*; Gideon asks his sign for the same reason — *If thou wilt save Yashar''el (Israel) by mine hand, as thou hast said... then shall I know that thou wilt save Yashar''el (Israel) by mine hand* (6:36-37). Yahuah does not despise the weak faith that asks to know; He meets it with the confirming sign.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s345_jdg06_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s345_jdg06_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judges-6-the-cycle-midian-oppressed-and-yashar-el-cried-the-prophet-rebuked',
       E'The Cycle — Midian Oppressed, and Yashar''el Cried; the Prophet Rebuked',
       E'Judges 6 opens with the cycle the whole book turns on, laid out plainly back in chapter 2. Yashar''el does evil, and Yahuah sells them into an oppressor''s hand — this time Midian, seven years of such terror that they make dens in the mountains and the Midianites *destroyed the increase of the earth... left no sustenance for Yashar''el (Israel), neither sheep, nor ox, nor ass* (Judges 6:4), coming *as grasshoppers for multitude; for both they and their camels were without number* (6:5). Then comes the turn: *And Yashar''el (Israel) was greatly impoverished because of the Midianites; and the children of Yashar''el (Israel) cried unto Yahuah (LORD)* (6:6). This is the cycle''s heart — *Nevertheless Yahuah (LORD) raised up judges, which delivered them out of the hand of those that spoiled them* (Judges 2:16). At the cry, Yahuah moves to raise a deliverer. But first He sends a prophet with a covenant lawsuit: *Thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel), I brought you up from Egypt, and brought you forth out of the house of bondage... fear not the gods of the Amorites, in whose land ye dwell: but ye have not obeyed my voice* (6:8-10). It is the very charge the angel of Yahuah brought at Bochim — *I made you to go up out of Egypt... I will never break my covenant with you. And ye shall make no league with the inhabitants of this land; ye shall throw down their altars: but ye have not obeyed my voice* (Judges 2:1-2). The sin is the broken first commandment — *the children of Yashar''el (Israel) did evil in the sight of Yahuah (LORD), and served Baalim* (Judges 2:11) — the same Baal-altar Gideon will be told to throw down. And the cry is the cry Yahuah always hears: *I have surely seen the affliction of my people which are in Egypt, and have heard their cry by reason of their taskmasters; for I know their sorrows* (Exodus 3:7). As the cry from Egypt drew the Angel of the bush, the cry under Midian draws the Angel under the oak. Yahuah keeps covenant even with covenant-breakers; the curse of Deuteronomy is the discipline that drives His people back to His mercy.',
       sv.verse_id, ev.verse_id, 'free', 35775
  FROM _s345_jdg06_lookup sv, _s345_jdg06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=6 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='judges' AND ev.chapter_number=6 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judges-6-the-angel-of-yahuah-commissioned-gideon-the-least-have-not-i-sent-thee',
       E'The Angel of Yahuah Commissioned Gideon the Least — Have Not I Sent Thee?',
       E'*And there came an angel of Yahuah (LORD), and sat under an oak which was in Ophrah... and his son Gideon threshed wheat by the winepress, to hide it from the Midianites* (Judges 6:11). The Angel who appears here is the Formed Son — He bears the Name, and the text plainly calls Him *Yahuah* as He speaks: *And Yahuah (LORD) looked upon him, and said, Go in this thy might, and thou shalt save Yashar''el (Israel) from the hand of the Midianites: have not I sent thee?* (6:14). It is the bush all over again. To Moses the same One said, *Come now therefore, and I will send thee unto Pharaoh, that thou mayest bring forth my people the children of Yashar''el (Israel) out of Egypt* (Exodus 3:10). And the reluctant deliverer answers the same way both times. Moses: *Who am I, that I should go unto Pharaoh?* (Exodus 3:11). Gideon: *Oh my Lord, wherewith shall I save Yashar''el (Israel)? behold, my family is poor in Manasseh, and I am the least in my father''s house* (6:15). To both protests Yahuah gives the one sufficient answer — not a better man, but His own presence: *Certainly I will be with thee* (Exodus 3:12); *Surely I will be with thee, and thou shalt smite the Midianites as one man* (6:16). This is the deliberate way of Yahuah. Paul names the principle exactly: *Elohim (God) hath chosen the foolish things of the world to confound the wise; and Elohim (God) hath chosen the weak things of the world to confound the things which are mighty* (1 Corinthians 1:27); *and base things of the world, and things which are despised, hath Elohim (God) chosen, yea, and things which are not, to bring to nought things that are: That no flesh should glory in his presence* (1 Corinthians 1:28). Gideon reckons himself among the *things which are not* — *I am the least* — and that is precisely whom the Angel of Yahuah chooses, that the camels-without-number of Midian might fall, and no flesh glory. The Deliverer who appeared, spoke, and led Yashar''el calls the least man in the threshing-floor and makes him a mighty man of valour.',
       sv.verse_id, ev.verse_id, 'free', 35778
  FROM _s345_jdg06_lookup sv, _s345_jdg06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=6 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='judges' AND ev.chapter_number=6 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judges-6-fire-out-of-the-rock-i-have-seen-the-angel-of-yahuah-face-to-face',
       E'Fire Out of the Rock — I Have Seen the Angel of Yahuah Face to Face',
       E'Gideon asks for a sign and brings an offering — a kid and unleavened cakes — and sets it before the Angel under the oak. *Then the angel of Yahuah (LORD) put forth the end of the staff that was in his hand, and touched the flesh and the unleavened cakes; and there rose up fire out of the rock, and consumed the flesh and the unleavened cakes. Then the angel of Yahuah (LORD) departed out of his sight* (Judges 6:21). The Formed One receives the offering and is made known in the fire — and the very same scene plays out for Manoah a few chapters on, the same Angel, the same kid, the same ascending flame: *when the flame went up toward heaven from off the altar, that the angel of Yahuah (LORD) ascended in the flame of the altar. And Manoah and his wife looked on it, and fell on their faces to the ground* (Judges 13:20). Then comes the terror. *And when Gideon perceived that he was an angel of Yahuah (LORD), Gideon said, Alas, O Yahuah (Lord) GOD! for because I have seen an angel of Yahuah (LORD) face to face* (6:22) — word for word Manoah''s dread, *We shall surely die, because we have seen Elohim (God)* (Judges 13:22). Both men know the ancient law: *Thou canst not see my face: for there shall no man see me, and live* (Exodus 33:20); it was why *Moses hid his face; for he was afraid to look upon Elohim (God)* (Exodus 3:6). To see the Angel of Yahuah is to see Elohim — for the Angel who bears the Name is the visible Glory of the unseen Father, the Formed Son. And yet — this is the wonder — the One seen speaks peace and spares: *And Yahuah (LORD) said unto him, Peace be unto thee; fear not: thou shalt not die* (6:23). So Gideon builds an altar and names it *Yahuah Shalom (Jehovah-shalom)* (6:24). The face that no man may see and live is the face the Formed Son turns toward His servant — and instead of death, He gives peace.',
       sv.verse_id, ev.verse_id, 'free', 35781
  FROM _s345_jdg06_lookup sv, _s345_jdg06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=6 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='judges' AND ev.chapter_number=6 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judges-6-the-spirit-of-yahuah-came-upon-gideon-the-spirit-clothed-the-judge',
       E'The Spirit of Yahuah Came Upon Gideon — the Spirit Clothed the Judge',
       E'Before Gideon can lead, he must tear down the idol in his own father''s house. By night he throws down *the altar of Baal that thy father hath* and cuts down the grove beside it (6:25-28), and when the men of the city demand his death his father answers, *Will ye plead for Baal? will ye save him?... if he be a god, let him plead for himself, because one hath cast down his altar* (6:31) — and so Gideon is named *Jerubbaal*, Let Baal plead (6:32). The cycle''s root sin is dealt with first; the deliverer of Yashar''el must himself be clean of the Baalim. Then the host of Midian and Amalek and the children of the east gather in the valley of Jezreel, and the word comes: *But the Spirit of Yahuah (LORD) came upon Gideon, and he blew a trumpet; and Abi-ezer was gathered after him* (6:34). The Hebrew is vivid — the Spirit of Yahuah *clothed itself with* Gideon, put him on like a garment. This is how Yahuah equips every deliverer He raises. The same Spirit *began to move* Samson — *And the Spirit of Yahuah (LORD) began to move him at times in the camp of Dan between Zorah and Eshtaol* (Judges 13:25). The same Spirit Yahuah took from Moses and spread to the seventy elders to bear the burden of the people — *and it came to pass, that, when the spirit rested upon them, they prophesied, and did not cease* (Numbers 11:25). The judge does not deliver by his own arm; the Spirit clothes the chosen man and the trumpet sounds. The Spirit and the deliverance are inseparable, as the Spirit and the Torah written on the heart are inseparable — Yahuah Himself acting through the man He has put on.',
       sv.verse_id, ev.verse_id, 'free', 35784
  FROM _s345_jdg06_lookup sv, _s345_jdg06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=6 AND sv.verse_number=25
   AND ev.edition_slug='canon' AND ev.book_slug='judges' AND ev.chapter_number=6 AND ev.verse_number=34
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judges-6-the-fleece-yahuah-condescends-to-confirm-the-weak-faith',
       E'The Fleece — Yahuah Condescends to Confirm the Weak Faith',
       E'Even Spirit-clothed and named Jerubbaal, Gideon is still afraid, and he asks Yahuah for one more confirming sign — twice. *Behold, I will put a fleece of wool in the floor; and if the dew be on the fleece only, and it be dry upon all the earth beside, then shall I know that thou wilt save Yashar''el (Israel) by mine hand, as thou hast said* (Judges 6:37). It is so. Then, almost ashamed, he asks the reverse: *Let not thine anger be hot against me, and I will speak but this once: let me prove, I pray thee, but this once with the fleece; let it now be dry only upon the fleece, and upon all the ground let there be dew* (6:39) — and Yahuah does that also, *for it was dry upon the fleece only, and there was dew on all the ground* (6:40). This is not unbelief rebuked but weak faith met with mercy. It is the very grace Yahuah showed the doubting Moses, who said *they will not believe me*: Yahuah gave him a first sign and a second, *if they will not believe thee, neither hearken to the voice of the first sign, that they will believe the voice of the latter sign* (Exodus 4:8), all *that they may believe that Yahuah Elohim (the LORD God) of their fathers... hath appeared unto thee* (Exodus 4:5). Gideon asks his fleece for the same reason — *then shall I know that thou wilt save Yashar''el (Israel) by mine hand* (6:37). The Deliverer who chose the least does not despise the trembling of the least; He condescends, He gives sign upon sign, He meets His servant where his faith is small and steadies him for the work. Yahuah is gentle with the weak hand He intends to use.',
       sv.verse_id, ev.verse_id, 'free', 35787
  FROM _s345_jdg06_lookup sv, _s345_jdg06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=6 AND sv.verse_number=36
   AND ev.edition_slug='canon' AND ev.book_slug='judges' AND ev.chapter_number=6 AND ev.verse_number=40
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Judges 2:16 — *Yahuah raised up judges, which delivered them*: the cycle Gideon repeats — at the cry of 6:6, Yahuah raises a deliverer.'
  FROM cross_reference_threads t
  JOIN _s345_jdg06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=6 AND sv.verse_number=6
  JOIN _s345_jdg06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=2 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-6-the-cycle-midian-oppressed-and-yashar-el-cried-the-prophet-rebuked'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Judges 2:1 — *I made you to go up out of Egypt... I will never break my covenant*: the angel of Yahuah''s lawsuit at Bochim, the same charge the prophet brings in 6:8.'
  FROM cross_reference_threads t
  JOIN _s345_jdg06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=6 AND sv.verse_number=8
  JOIN _s345_jdg06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=2 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-6-the-cycle-midian-oppressed-and-yashar-el-cried-the-prophet-rebuked'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Exodus 3:7 — *I have... heard their cry by reason of their taskmasters*: the cry under Midian (6:6) is the cry Yahuah heard from Egypt; the Deliverer comes to it.'
  FROM cross_reference_threads t
  JOIN _s345_jdg06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=6 AND sv.verse_number=6
  JOIN _s345_jdg06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=3 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-6-the-cycle-midian-oppressed-and-yashar-el-cried-the-prophet-rebuked'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Judges 2:11 — *did evil... and served Baalim*: the root sin the prophet names (6:10), the Baal-altar Gideon must throw down (6:25).'
  FROM cross_reference_threads t
  JOIN _s345_jdg06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=6 AND sv.verse_number=10
  JOIN _s345_jdg06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=2 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-6-the-cycle-midian-oppressed-and-yashar-el-cried-the-prophet-rebuked'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Exodus 3:10 — *I will send thee unto Pharaoh*: the Angel of Yahuah sends Gideon in the bush-words — *have not I sent thee?* (6:14).'
  FROM cross_reference_threads t
  JOIN _s345_jdg06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=6 AND sv.verse_number=14
  JOIN _s345_jdg06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=3 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-6-the-angel-of-yahuah-commissioned-gideon-the-least-have-not-i-sent-thee'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Exodus 3:11 — *Who am I, that I should go unto Pharaoh?*: Moses'' shrinking is Gideon''s *I am the least in my father''s house* (6:15).'
  FROM cross_reference_threads t
  JOIN _s345_jdg06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=6 AND sv.verse_number=15
  JOIN _s345_jdg06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=3 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-6-the-angel-of-yahuah-commissioned-gideon-the-least-have-not-i-sent-thee'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Exodus 3:12 — *Certainly I will be with thee*: the same one answer to the protesting least — *Surely I will be with thee* (6:16).'
  FROM cross_reference_threads t
  JOIN _s345_jdg06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=6 AND sv.verse_number=16
  JOIN _s345_jdg06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=3 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-6-the-angel-of-yahuah-commissioned-gideon-the-least-have-not-i-sent-thee'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'1 Corinthians 1:27 — *Elohim hath chosen the weak things of the world to confound the things which are mighty*: Gideon the least (6:15) is the principle named.'
  FROM cross_reference_threads t
  JOIN _s345_jdg06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=6 AND sv.verse_number=15
  JOIN _s345_jdg06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=1 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-6-the-angel-of-yahuah-commissioned-gideon-the-least-have-not-i-sent-thee'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'1 Corinthians 1:28 — *things which are not, to bring to nought things that are... That no flesh should glory*: Gideon counts himself nothing (6:15), and that is whom Yahuah chooses.'
  FROM cross_reference_threads t
  JOIN _s345_jdg06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=6 AND sv.verse_number=15
  JOIN _s345_jdg06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=1 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-6-the-angel-of-yahuah-commissioned-gideon-the-least-have-not-i-sent-thee'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Judges 13:20 — *the angel of Yahuah ascended in the flame of the altar*: the same Angel, kid, and ascending fire as Gideon''s *fire out of the rock* (6:21).'
  FROM cross_reference_threads t
  JOIN _s345_jdg06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=6 AND sv.verse_number=21
  JOIN _s345_jdg06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=13 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-6-fire-out-of-the-rock-i-have-seen-the-angel-of-yahuah-face-to-face'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Judges 13:22 — *We shall surely die, because we have seen Elohim*: Manoah''s terror is Gideon''s *I have seen an angel of Yahuah face to face* (6:22).'
  FROM cross_reference_threads t
  JOIN _s345_jdg06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=6 AND sv.verse_number=22
  JOIN _s345_jdg06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=13 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-6-fire-out-of-the-rock-i-have-seen-the-angel-of-yahuah-face-to-face'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Exodus 33:20 — *there shall no man see me, and live*: the law behind Gideon''s dread; yet the Formed Son, the visible Glory, is the One who may be seen and spares.'
  FROM cross_reference_threads t
  JOIN _s345_jdg06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=6 AND sv.verse_number=22
  JOIN _s345_jdg06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=33 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-6-fire-out-of-the-rock-i-have-seen-the-angel-of-yahuah-face-to-face'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Exodus 3:6 — *Moses hid his face; for he was afraid to look upon Elohim*: the Angel of the bush is named Elohim; Gideon fears the same, having looked on the One who is Yahuah (6:22).'
  FROM cross_reference_threads t
  JOIN _s345_jdg06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=6 AND sv.verse_number=22
  JOIN _s345_jdg06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=3 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-6-fire-out-of-the-rock-i-have-seen-the-angel-of-yahuah-face-to-face'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Judges 13:25 — *the Spirit of Yahuah began to move him*: the same Spirit that moved Samson came upon Gideon (6:34) — the Spirit-empowered judge.'
  FROM cross_reference_threads t
  JOIN _s345_jdg06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=6 AND sv.verse_number=34
  JOIN _s345_jdg06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=13 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-6-the-spirit-of-yahuah-came-upon-gideon-the-spirit-clothed-the-judge'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Numbers 11:25 — *the spirit rested upon them, and they prophesied*: the Spirit put upon the seventy to bear the people is the Spirit that came upon Gideon (6:34) to lead them.'
  FROM cross_reference_threads t
  JOIN _s345_jdg06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=6 AND sv.verse_number=34
  JOIN _s345_jdg06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=11 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-6-the-spirit-of-yahuah-came-upon-gideon-the-spirit-clothed-the-judge'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Exodus 4:8 — *if they will not believe... the voice of the latter sign*: Yahuah''s doubled sign to doubting Moses is the doubled fleece-sign to doubting Gideon (6:37-40).'
  FROM cross_reference_threads t
  JOIN _s345_jdg06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=6 AND sv.verse_number=37
  JOIN _s345_jdg06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=4 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-6-the-fleece-yahuah-condescends-to-confirm-the-weak-faith'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Exodus 4:5 — *that they may believe... hath appeared unto thee*: the signs to Moses were given to confirm; Gideon asks his fleece *that I may know* (6:36-37).'
  FROM cross_reference_threads t
  JOIN _s345_jdg06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=6 AND sv.verse_number=36
  JOIN _s345_jdg06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=4 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-6-the-fleece-yahuah-condescends-to-confirm-the-weak-faith'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_judges_7.sql (Judges 7) -----
-- Chapter: Judges 7 — GIDEON'S THREE HUNDRED (the army reduced lest Yashar'el boast "mine own
--          hand hath saved me"; the fearful sent home and the lapping-test; the Midianite's dream
--          of the barley cake; the 300 with trumpets, empty pitchers and lamps; the light out of
--          the broken vessels; "the sword of Yahuah, and of Gideon"; Yahuah sets every man's
--          sword against his fellow and the host flees) — A KEYSTONE: salvation by Yahuah, not by might.
-- Tag: jdg07   View: _s345_jdg07_lookup   Sort band: 35800, 35803, 35806, 35809
--
-- Judges 7 coverage:
--   v.2  (*The people that are with thee are too many for me to give the Midianites into their
--         hands, lest Yashar'el vaunt themselves against me, saying, Mine own hand hath saved me*)
--         — THE KEYSTONE: the army cut down precisely so the glory is Yahuah's alone
--          NT:     1 Corinthians 1:29 (that no flesh should glory in his presence); 1:27 (the weak things to confound the mighty)
--          Extras: none warranted
--          Tanakh: Deuteronomy 8:17 (My power and the might of mine hand hath gotten me this wealth),
--                  Zechariah 4:6 (Not by might, nor by power, but by my spirit), Psalms 33:16 (no king saved by the multitude of an host)
--   v.3,7 (the fearful sent home — 22,000 depart, 10,000 remain; *By the three hundred men that
--          lapped will I save you*) — THE FEW, NOT THE MANY
--          NT:     none warranted at the verse (woven via the keystone/1 Cor)
--          Extras: none warranted
--          Tanakh: Deuteronomy 20:8 (What man is there that is fearful and fainthearted? let him return),
--                  1 Samuel 14:6 (there is no restraint to Yahuah to save by many or by few), Psalms 33:17 (an horse is a vain thing for safety)
--   v.4-6 (the lapping-test — the 300 who lapped chosen)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: woven into the "fearful sent home / by the three hundred" thread (the means Yahuah used to make the army small)
--   v.13-15 (the Midianite's dream of the barley cake; Gideon worships)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: woven into the prose (the assurance given to the weak instrument; framed under the sword-of-Yahuah thread)
--   v.16,18,20 (the 300 with trumpets, empty pitchers and lamps within; they brake the pitchers,
--          blew the trumpets, held the lamps, and cried *The sword of Yahuah, and of Gideon*)
--          — THE LIGHT OUT OF THE BROKEN VESSELS
--          NT:     2 Corinthians 4:7 (this treasure in earthen vessels, that the excellency of the power may be of Elohim, and not of us);
--                  4:6 (Elohim, who commanded the light to shine out of darkness, hath shined in our hearts)
--          Extras: none warranted
--          Tanakh: 1 Corinthians 1:27 noted in the boasting thread (the weak things chosen)
--   v.18,20,22 (*The sword of Yahuah, and of Gideon*; Yahuah set every man's sword against his
--          fellow throughout all the host, and the host fled) — YAHUAH THE TRUE VICTOR
--          NT:     none warranted at the verse
--          Extras: none warranted
--          Tanakh: 1 Samuel 14:20 (every man's sword was against his fellow), 2 Chronicles 20:15 (the battle
--                  is not yours, but Elohim's), 2 Chronicles 20:22 (when they began to sing... Yahuah set ambushments)
--   v.8-12,17,19,21,23-25 (the camp scene; the rout; Ephraim called; Oreb and Zeeb taken)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: woven into the rout/sword-of-Yahuah thread (the host routed by Yahuah, the weak the means)
--
-- Threads:
--   judges-7-too-many-lest-yashar-el-say-mine-own-hand-hath-saved-me     [Tanakh: Deuteronomy, Zechariah, Psalms | NT: 1 Corinthians] (free)
--   judges-7-the-fearful-sent-home-by-the-three-hundred-will-i-save-you  [Tanakh: Deuteronomy, 1 Samuel, Psalms]                       (free)
--   judges-7-the-treasure-in-earthen-vessels-the-light-from-the-broken-pitchers [NT: 2 Corinthians, 1 Corinthians]                     (free)
--   judges-7-the-sword-of-yahuah-and-of-gideon-yahuah-the-true-victor    [Tanakh: 1 Samuel, 2 Chronicles]                              (free)
--
-- Framework notes: ★★★ The chapter's whole architecture is the Yoshi lens made narrative — salvation
-- is by Yahuah, never by might or numbers. Yahuah cuts the army down on purpose: *The people that are
-- with thee are too many for me to give the Midianites into their hands, lest Yashar'el (Israel) vaunt
-- themselves against me, saying, Mine own hand hath saved me* (7:2). That is exactly the lie Moses
-- warned of — *thou say in thine heart, My power and the might of mine hand hath gotten me this wealth*
-- (Deut 8:17) — and exactly the principle Zechariah declares — *Not by might, nor by power, but by my
-- spirit, saith Yahuah Tseva'ot* (Zech 4:6) — and the Psalm sings — *There is no king saved by the
-- multitude of an host* (Ps 33:16). Paul names the same divine strategy: Yahuah *hath chosen the weak
-- things of the world to confound the things which are mighty... That no flesh should glory in his
-- presence* (1 Cor 1:27,29). ★ So the fearful are sent home per the Torah's own war-law (*What man is
-- there that is fearful and fainthearted? let him go and return*, Deut 20:8), then the 300 are sifted
-- by the lapping, until Yahuah says *By the three hundred men that lapped will I save you* (7:7) — the
-- few, not the many, as Jonathan knew: *there is no restraint to Yahuah to save by many or by few*
-- (1 Sam 14:6). ★★ The instrument of victory is weakness itself: trumpets, *empty pitchers, and lamps
-- within the pitchers* (7:16) — and when the pitchers are broken the light blazes out and the host
-- panics. Paul reads the figure exactly: *we have this treasure in earthen vessels, that the excellency
-- of the power may be of Elohim (God), and not of us* (2 Cor 4:7); the same Elohim *who commanded the
-- light to shine out of darkness, hath shined in our hearts* (2 Cor 4:6). ★ And the victory is openly
-- credited to Yahuah — the cry is *The sword of Yahuah (LORD), and of Gideon* (7:18,20), and *Yahuah
-- (LORD) set every man's sword against his fellow* (7:22), the enemy routing itself as at Michmash
-- (*every man's sword was against his fellow*, 1 Sam 14:20) and in Jehoshaphat's valley (*the battle is
-- not yours, but Elohim's*, 2 Chron 20:15; *when they began to sing... Yahuah set ambushments*, 2 Chron
-- 20:22). Gideon's name leads the cry, but the sword is Yahuah's; the weak man is only the means. All
-- members canon → every thread tier_required 'free'.

CREATE TEMP VIEW _s345_jdg07_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: too many, lest they say "mine own hand hath saved me" (Deuteronomy / Zechariah / Psalms / 1 Corinthians)
    ('canon','judges',7,2,'canon','deuteronomy',8,17,'free',E'*And thou say in thine heart, My power and the might of mine hand hath gotten me this wealth* (Deuteronomy 8:17). This is the very boast Yahuah moves to forestall when He thins Gideon''s army: *The people that are with thee are too many for me to give the Midianites into their hands, lest Yashar''el (Israel) vaunt themselves against me, saying, Mine own hand hath saved me* (7:2). Moses warned the heart would credit its own hand for what Yahuah gave; so Yahuah cuts the army down until no hand but His can claim the victory.'),
    ('canon','judges',7,2,'canon','zechariah',4,6,'free',E'*Not by might, nor by power, but by my spirit, saith Yahuah Tseva''ot (LORD of hosts)* (Zechariah 4:6). Zechariah states the principle that Judges 7 dramatizes: the work is done not by Yashar''el''s strength of numbers but by Yahuah''s own Spirit. Yahuah declares *the people... are too many... lest Yashar''el (Israel) vaunt themselves against me* (7:2) for the same reason the headstone is brought forth not by might nor power — so that all glory returns to Yahuah alone.'),
    ('canon','judges',7,2,'canon','psalms',33,16,'free',E'*There is no king saved by the multitude of an host: a mighty man is not delivered by much strength* (Psalms 33:16). The Psalm sings the truth Gideon''s thinned army proves on the field: salvation never comes by the size of the host. Yahuah sends the multitude home *lest Yashar''el (Israel) vaunt themselves against me, saying, Mine own hand hath saved me* (7:2) — for no king and no army is ever saved by its own multitude, only by Yahuah.'),
    ('canon','judges',7,2,'canon','1-corinthians',1,29,'free',E'*That no flesh should glory in his presence* (1 Corinthians 1:29). Paul names the exact end Yahuah pursues in reducing the army — that no flesh may boast before Him. Yahuah will not give the Midianites into so many hands *lest Yashar''el (Israel) vaunt themselves against me, saying, Mine own hand hath saved me* (7:2); the deliverance is arranged so the only possible glory is Yahuah''s.'),
    ('canon','judges',7,2,'canon','1-corinthians',1,27,'free',E'*But Elohim (God) hath chosen the foolish things of the world to confound the wise; and Elohim (God) hath chosen the weak things of the world to confound the things which are mighty* (1 Corinthians 1:27). The same divine strategy runs through Gideon''s 300: Yahuah deliberately keeps the weak and the few so the mighty host of Midian is confounded by them. The army is *too many for me* (7:2) until it is small enough that the power must plainly be Yahuah''s.')
    ,
    -- THREAD 2: the fearful sent home / by the three hundred will I save you (Deuteronomy / 1 Samuel / Psalms)
    ('canon','judges',7,3,'canon','deuteronomy',20,8,'free',E'*And the officers shall speak further unto the people, and they shall say, What man is there that is fearful and fainthearted? let him go and return unto his house, lest his brethren''s heart faint as well as his heart* (Deuteronomy 20:8). Gideon obeys the Torah''s own war-law to the letter: *Whosoever is fearful and afraid, let him return and depart early from mount Gilead. And there returned of the people twenty and two thousand* (7:3). The Law that sent the fearful home is the very means Yahuah uses to make the army small.'),
    ('canon','judges',7,7,'canon','1-samuel',14,6,'free',E'*Come, and let us go over unto the garrison of these uncircumcised: it may be that Yahuah (LORD) will work for us: for there is no restraint to Yahuah (LORD) to save by many or by few* (1 Samuel 14:6). Jonathan and his armourbearer act on the same faith that shrinks Gideon''s army: Yahuah is not bound to the size of the host. Yahuah says *By the three hundred men that lapped will I save you, and deliver the Midianites into thine hand* (7:7) — the few are enough, for there is no restraint to Yahuah to save by many or by few.'),
    ('canon','judges',7,7,'canon','psalms',33,17,'free',E'*An horse is a vain thing for safety: neither shall he deliver any by his great strength* (Psalms 33:17). If even the warhorse cannot save, then numbers cannot. The Psalm''s confession stands behind Yahuah''s word *By the three hundred men that lapped will I save you* (7:7): the deliverance rests not on strength or multitude but on Yahuah, who saves by three hundred as surely as by ten thousand.')
    ,
    -- THREAD 3: the treasure in earthen vessels — the light from the broken pitchers (2 Corinthians / 1 Corinthians)
    ('canon','judges',7,16,'canon','2-corinthians',4,7,'free',E'*But we have this treasure in earthen vessels, that the excellency of the power may be of Elohim (God), and not of us* (2 Corinthians 4:7). Paul reads Gideon''s very stratagem: the 300 carry *a trumpet in every man''s hand, with empty pitchers, and lamps within the pitchers* (7:16) — the light hidden inside fragile clay. The vessel must be broken for the light to blaze out, that the excellency of the power may plainly be Yahuah''s and not the man''s.'),
    ('canon','judges',7,20,'canon','2-corinthians',4,7,'free',E'*But we have this treasure in earthen vessels, that the excellency of the power may be of Elohim (God), and not of us* (2 Corinthians 4:7). When *they blew the trumpets, and brake the pitchers, and held the lamps in their left hands* (7:20), the breaking is the point: the clay shatters and the light shines, and the host of Midian flees. So Paul: the treasure of light shines out of broken earthen vessels precisely so the power is known to be of Elohim and not of us.'),
    ('canon','judges',7,20,'canon','2-corinthians',4,6,'free',E'*For Elohim (God), who commanded the light to shine out of darkness, hath shined in our hearts, to give the light of the knowledge of the glory of Elohim (God) in the face of Yahusha HaMashiach (Jesus Christ)* (2 Corinthians 4:6). The lamps hidden in the pitchers blaze into the midnight camp the moment the clay is broken — *they brake the pitchers, and held the lamps* (7:20). The same Elohim who commands light to shine out of darkness makes the hidden light flash forth from the broken vessels, and the darkness of Midian dissolves before it.'),
    ('canon','judges',7,16,'canon','1-corinthians',1,27,'free',E'*And Elohim (God) hath chosen the weak things of the world to confound the things which are mighty* (1 Corinthians 1:27). A trumpet, a clay jar, and a torch are the weakest of weapons — yet by them the mighty host of Midian is confounded. Gideon arms the 300 with *empty pitchers, and lamps within the pitchers* (7:16): the weak things of the world, chosen by Yahuah to overthrow the strong.')
    ,
    -- THREAD 4: the sword of Yahuah and of Gideon — Yahuah the true victor (1 Samuel / 2 Chronicles)
    ('canon','judges',7,22,'canon','1-samuel',14,20,'free',E'*And Saul and all the people that were with him assembled themselves, and they came to the battle: and, behold, every man''s sword was against his fellow, and there was a very great discomfiture* (1 Samuel 14:20). At Michmash as at Midian, Yahuah turns the enemy''s blades upon itself: *the three hundred blew the trumpets, and Yahuah (LORD) set every man''s sword against his fellow, even throughout all the host* (7:22). The victory needs no slaughter by Yashar''el — Yahuah routs the host by its own panic, every man''s sword against his fellow.'),
    ('canon','judges',7,18,'canon','2-chronicles',20,15,'free',E'*Be not afraid nor dismayed by reason of this great multitude; for the battle is not yours, but Elohim''s (God''s)* (2 Chronicles 20:15). The cry of the 300 confesses the same truth — *The sword of Yahuah (LORD), and of Gideon* (7:18) — Gideon''s name leads, but the sword is Yahuah''s. As Jehoshaphat is told the battle belongs to Elohim, so Gideon''s three hundred go to war owning that the victory is Yahuah''s alone.'),
    ('canon','judges',7,22,'canon','2-chronicles',20,22,'free',E'*And when they began to sing and to praise, Yahuah (LORD) set ambushments against the children of Ammon, Moab, and mount Seir, which were come against Yahudah (Judah); and they were smitten* (2 Chronicles 20:22). In Jehoshaphat''s valley the enemy is set against itself the moment Yahudah praises; at Midian the same hand acts the moment the trumpets sound: *Yahuah (LORD) set every man''s sword against his fellow, even throughout all the host* (7:22). Yahuah is the true victor in both — the people only lift the trumpet and the song, and Yahuah turns the foe against itself.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s345_jdg07_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s345_jdg07_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judges-7-too-many-lest-yashar-el-say-mine-own-hand-hath-saved-me',
       E'Too Many — Lest Yashar''el Say "Mine Own Hand Hath Saved Me"',
       E'This is the hinge of the whole chapter, and the lens of the whole library: Yahuah will not save Yashar''el by a great army, lest the army take the credit. *And Yahuah (LORD) said unto Gideon, The people that are with thee are too many for me to give the Midianites into their hands, lest Yashar''el (Israel) vaunt themselves against me, saying, Mine own hand hath saved me* (Judges 7:2). The danger is not a small army but a proud heart — the very boast Moses warned the land against: *And thou say in thine heart, My power and the might of mine hand hath gotten me this wealth* (Deuteronomy 8:17). So Yahuah reduces the host until no hand but His can claim the deliverance. This is the principle Zechariah will state to Zerubbabel — *Not by might, nor by power, but by my spirit, saith Yahuah Tseva''ot (LORD of hosts)* (Zechariah 4:6) — and the Psalm sings it as settled law: *There is no king saved by the multitude of an host: a mighty man is not delivered by much strength* (Psalms 33:16). Paul gathers the whole pattern into a sentence: Elohim *hath chosen the weak things of the world to confound the things which are mighty* (1 Corinthians 1:27) — *That no flesh should glory in his presence* (1 Corinthians 1:29). Gideon''s 300 are the weak things of the world, kept small on purpose so that when Midian falls, no flesh can glory, and the glory returns whole to Yahuah. Salvation is not by might, not by numbers, not by the hand of man — it is Yahuah''s alone.',
       sv.verse_id, ev.verse_id, 'free', 35800
  FROM _s345_jdg07_lookup sv, _s345_jdg07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=7 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='judges' AND ev.chapter_number=7 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judges-7-the-fearful-sent-home-by-the-three-hundred-will-i-save-you',
       E'The Fearful Sent Home — By the Three Hundred Will I Save You',
       E'Having said the army is too many, Yahuah shows Gideon how to make it small — and the first cut is the Torah''s own war-law. *Now therefore go to, proclaim in the ears of the people, saying, Whosoever is fearful and afraid, let him return and depart early from mount Gilead. And there returned of the people twenty and two thousand; and there remained ten thousand* (Judges 7:3). That is Moses'' command kept to the letter: *And the officers shall speak further unto the people, and they shall say, What man is there that is fearful and fainthearted? let him go and return unto his house, lest his brethren''s heart faint as well as his heart* (Deuteronomy 20:8). Then ten thousand are sifted by the water to three hundred, until Yahuah declares the verdict: *By the three hundred men that lapped will I save you, and deliver the Midianites into thine hand* (7:7). The few are enough, for the deliverance never rested on the many — exactly the faith Jonathan carried to the Philistine garrison: *there is no restraint to Yahuah (LORD) to save by many or by few* (1 Samuel 14:6). And the Psalm names what numbers and warhorses cannot do: *An horse is a vain thing for safety: neither shall he deliver any by his great strength* (Psalms 33:17). Three hundred men with no horses and no host — and Yahuah saves Yashar''el by them, that it might be plain who the Saviour is.',
       sv.verse_id, ev.verse_id, 'free', 35803
  FROM _s345_jdg07_lookup sv, _s345_jdg07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=7 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='judges' AND ev.chapter_number=7 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judges-7-the-treasure-in-earthen-vessels-the-light-from-the-broken-pitchers',
       E'The Treasure in Earthen Vessels — the Light from the Broken Pitchers',
       E'The weapons Gideon hands the 300 are the weakest imaginable — and that is the sermon. *And he divided the three hundred men into three companies, and he put a trumpet in every man''s hand, with empty pitchers, and lamps within the pitchers* (Judges 7:16): a horn, a clay jar, and a torch hidden inside the jar. The light is sealed in fragile earthenware until the appointed moment, when *they blew the trumpets, and brake the pitchers, and held the lamps in their left hands... and they cried, The sword of Yahuah (LORD), and of Gideon* (7:20). The vessel must shatter for the light to blaze into the midnight camp — and at that flash the whole host of Midian panics and flees. Paul reads the figure exactly: *But we have this treasure in earthen vessels, that the excellency of the power may be of Elohim (God), and not of us* (2 Corinthians 4:7). The clay is meant to break; the breaking is where the glory shines, so the power is plainly Yahuah''s. And the light itself is Yahuah''s gift: *For Elohim (God), who commanded the light to shine out of darkness, hath shined in our hearts, to give the light of the knowledge of the glory of Elohim (God)* (2 Corinthians 4:6) — the same Elohim who commands light out of darkness makes the hidden lamp flash out of the broken pitcher. These are the weak things Yahuah chooses on purpose: *Elohim (God) hath chosen the weak things of the world to confound the things which are mighty* (1 Corinthians 1:27) — empty pitchers and torches routing a numberless army, that the excellency of the power may be of Elohim, and not of us.',
       sv.verse_id, ev.verse_id, 'free', 35806
  FROM _s345_jdg07_lookup sv, _s345_jdg07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=7 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='judges' AND ev.chapter_number=7 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judges-7-the-sword-of-yahuah-and-of-gideon-yahuah-the-true-victor',
       E'The Sword of Yahuah and of Gideon — Yahuah the True Victor',
       E'When the 300 break their pitchers, the cry that goes up names the real order of the battle: *When I blow with a trumpet, I and all that are with me, then blow ye the trumpets also on every side of all the camp, and say, The sword of Yahuah (LORD), and of Gideon* (Judges 7:18); and again, *they cried, The sword of Yahuah (LORD), and of Gideon* (7:20). Gideon''s name leads the cry, but the sword is Yahuah''s — and so is the victory, for no Israelite blade does the killing: *And the three hundred blew the trumpets, and Yahuah (LORD) set every man''s sword against his fellow, even throughout all the host: and the host fled* (7:22). Yahuah turns the enemy upon itself, exactly as at Michmash, where *behold, every man''s sword was against his fellow, and there was a very great discomfiture* (1 Samuel 14:20). It is the same deliverance Jehoshaphat is promised when a great multitude comes against Yahudah: *Be not afraid nor dismayed by reason of this great multitude; for the battle is not yours, but Elohim''s (God''s)* (2 Chronicles 20:15) — and the same hand that acts the instant the people worship: *And when they began to sing and to praise, Yahuah (LORD) set ambushments against the children of Ammon, Moab, and mount Seir... and they were smitten* (2 Chronicles 20:22). The pattern is fixed across the canon: Yahuah''s people lift the trumpet and the praise, and Yahuah Himself routs the foe, every man''s sword against his fellow. The weak instrument is only the means; the sword is Yahuah''s, and so is the glory.',
       sv.verse_id, ev.verse_id, 'free', 35809
  FROM _s345_jdg07_lookup sv, _s345_jdg07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=7 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='judges' AND ev.chapter_number=7 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Deuteronomy 8:17 — *My power and the might of mine hand hath gotten me this wealth*: the exact boast Yahuah forestalls by thinning the army, *lest... Mine own hand hath saved me* (7:2).'
  FROM cross_reference_threads t
  JOIN _s345_jdg07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=7 AND sv.verse_number=2
  JOIN _s345_jdg07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=8 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-7-too-many-lest-yashar-el-say-mine-own-hand-hath-saved-me'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Zechariah 4:6 — *Not by might, nor by power, but by my spirit, saith Yahuah Tseva''ot*: the very principle Gideon''s thinned army dramatizes; the glory is Yahuah''s, not Yashar''el''s (7:2).'
  FROM cross_reference_threads t
  JOIN _s345_jdg07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=7 AND sv.verse_number=2
  JOIN _s345_jdg07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=4 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-7-too-many-lest-yashar-el-say-mine-own-hand-hath-saved-me'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Psalms 33:16 — *There is no king saved by the multitude of an host*: settled law behind Yahuah sending the multitude home (7:2) — no army is saved by its own numbers.'
  FROM cross_reference_threads t
  JOIN _s345_jdg07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=7 AND sv.verse_number=2
  JOIN _s345_jdg07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=33 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-7-too-many-lest-yashar-el-say-mine-own-hand-hath-saved-me'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'1 Corinthians 1:29 — *That no flesh should glory in his presence*: the exact end Yahuah pursues — the army cut down so no flesh can boast *Mine own hand hath saved me* (7:2).'
  FROM cross_reference_threads t
  JOIN _s345_jdg07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=7 AND sv.verse_number=2
  JOIN _s345_jdg07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=1 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-7-too-many-lest-yashar-el-say-mine-own-hand-hath-saved-me'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'1 Corinthians 1:27 — *the weak things of the world to confound the things which are mighty*: the same strategy — the few kept small to confound numberless Midian (7:2).'
  FROM cross_reference_threads t
  JOIN _s345_jdg07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=7 AND sv.verse_number=2
  JOIN _s345_jdg07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=1 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-7-too-many-lest-yashar-el-say-mine-own-hand-hath-saved-me'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Deuteronomy 20:8 — *What man is there that is fearful and fainthearted? let him go and return*: the Torah war-law Gideon keeps when *Whosoever is fearful... let him return* (7:3).'
  FROM cross_reference_threads t
  JOIN _s345_jdg07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=7 AND sv.verse_number=3
  JOIN _s345_jdg07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=20 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-7-the-fearful-sent-home-by-the-three-hundred-will-i-save-you'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'1 Samuel 14:6 — *there is no restraint to Yahuah to save by many or by few*: Jonathan''s faith behind Yahuah''s word *By the three hundred men that lapped will I save you* (7:7).'
  FROM cross_reference_threads t
  JOIN _s345_jdg07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=7 AND sv.verse_number=7
  JOIN _s345_jdg07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=14 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-7-the-fearful-sent-home-by-the-three-hundred-will-i-save-you'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Psalms 33:17 — *An horse is a vain thing for safety*: if even the warhorse cannot save, numbers cannot; Yahuah saves by three hundred (7:7).'
  FROM cross_reference_threads t
  JOIN _s345_jdg07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=7 AND sv.verse_number=7
  JOIN _s345_jdg07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=33 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-7-the-fearful-sent-home-by-the-three-hundred-will-i-save-you'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'2 Corinthians 4:7 — *this treasure in earthen vessels, that the excellency of the power may be of Elohim, and not of us*: Gideon''s *lamps within the pitchers* (7:16), the light hidden in fragile clay.'
  FROM cross_reference_threads t
  JOIN _s345_jdg07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=7 AND sv.verse_number=16
  JOIN _s345_jdg07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=4 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-7-the-treasure-in-earthen-vessels-the-light-from-the-broken-pitchers'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'2 Corinthians 4:7 — *the excellency of the power... of Elohim, and not of us*: the breaking is the point — *they brake the pitchers, and held the lamps* (7:20), and Midian flees.'
  FROM cross_reference_threads t
  JOIN _s345_jdg07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=7 AND sv.verse_number=20
  JOIN _s345_jdg07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=4 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-7-the-treasure-in-earthen-vessels-the-light-from-the-broken-pitchers'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'2 Corinthians 4:6 — *Elohim, who commanded the light to shine out of darkness, hath shined in our hearts*: the hidden lamps blaze into the midnight camp the moment the clay breaks (7:20).'
  FROM cross_reference_threads t
  JOIN _s345_jdg07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=7 AND sv.verse_number=20
  JOIN _s345_jdg07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=4 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-7-the-treasure-in-earthen-vessels-the-light-from-the-broken-pitchers'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'1 Corinthians 1:27 — *the weak things of the world to confound the things which are mighty*: a trumpet, a clay jar, and a torch — the *empty pitchers, and lamps* (7:16) that rout a numberless host.'
  FROM cross_reference_threads t
  JOIN _s345_jdg07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=7 AND sv.verse_number=16
  JOIN _s345_jdg07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=1 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-7-the-treasure-in-earthen-vessels-the-light-from-the-broken-pitchers'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'1 Samuel 14:20 — *every man''s sword was against his fellow*: at Michmash as at Midian, Yahuah turns the enemy''s blades on itself — *Yahuah set every man''s sword against his fellow* (7:22).'
  FROM cross_reference_threads t
  JOIN _s345_jdg07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=7 AND sv.verse_number=22
  JOIN _s345_jdg07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=14 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-7-the-sword-of-yahuah-and-of-gideon-yahuah-the-true-victor'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'2 Chronicles 20:15 — *the battle is not yours, but Elohim''s*: the cry *The sword of Yahuah, and of Gideon* (7:18) confesses the same — Gideon''s name leads, the sword is Yahuah''s.'
  FROM cross_reference_threads t
  JOIN _s345_jdg07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=7 AND sv.verse_number=18
  JOIN _s345_jdg07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=20 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-7-the-sword-of-yahuah-and-of-gideon-yahuah-the-true-victor'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'2 Chronicles 20:22 — *when they began to sing and to praise, Yahuah set ambushments... and they were smitten*: the foe set against itself the moment the people worship, as the host *fled* when the trumpets sound (7:22).'
  FROM cross_reference_threads t
  JOIN _s345_jdg07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=7 AND sv.verse_number=22
  JOIN _s345_jdg07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=20 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-7-the-sword-of-yahuah-and-of-gideon-yahuah-the-true-victor'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_judges_8.sql (Judges 8) -----
-- Judges 8 — Gideon beyond Jordan: the soft answer, the kings of Midian slain,
--   the refusal of the crown ("Yahuah shall rule over you"), and the ephod-snare.
-- TAG: jdg08   VIEW: _s345_jdg08_lookup   SORT BAND: 35825, 35828, 35831, 35834
--
-- Judges 8 coverage:
--   v.1-3 (the soft answer turning away Ephraim's wrath)
--        NT:     none warranted (Prov 15 carries the wisdom-weight directly)
--        Extras: none warranted
--        Tanakh: Proverbs 15:1 (a soft answer turneth away wrath), Proverbs 15:18 (slow to anger appeaseth strife)  [USED]
--   v.4-21 (Succoth/Penuel refuse bread; the two kings slain; the brethren avenged)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: none warranted (narrative; the avenging of brethren self-contained)
--   v.22-23 (the men of Yashar'el ask Gideon to be king; he refuses — Yahuah shall rule)
--        NT:     none warranted (the theocracy-rejection arc is wholly Tanakh)
--        Extras: none warranted
--        Tanakh: Deut 17:14-15 (the king Yahuah shall choose — the Torah frame), 1 Sam 8:7 (they have rejected me from reigning), 1 Sam 12:12 (Yahuah was your king)  [USED]
--   v.24-27, 33-34 (the golden earrings; the ephod made a snare; after Gideon, Baal-berith)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Exod 32:2-4 (Aaron's golden earrings → the calf), Judges 2:3 (their gods a snare), Psalms 106:36 (their idols a snare), Psalms 106:39 (went a whoring with their own inventions)  [USED]
--
-- THREADS:
--   1. judges-8-the-soft-answer-that-turneth-away-wrath (8:1-3)  [Tanakh only; tier free]
--        → Proverbs 15:1, Proverbs 15:18
--   2. judges-8-yahuah-shall-rule-over-you-gideon-refuses-the-crown (8:22-23)  [Tanakh only; tier free]
--        → Deut 17:14, Deut 17:15, 1 Samuel 8:7, 1 Samuel 12:12
--   3. judges-8-the-ephod-became-a-snare (8:24-33)  [Tanakh only; tier free]
--        → Exodus 32:2, Exodus 32:4, Judges 2:3, Psalms 106:36, Psalms 106:39
--
-- Framework-load-bearing verse: 8:23 — Gideon's refusal "Yahuah shall rule over you" is
--   the theocracy keystone (Yahuah the true King), framed FORWARD to 1 Sam 8:7 where the
--   nation forsakes exactly this truth ("they have rejected me, that I should not reign over
--   them"). The crown belongs to Yahuah; the Torah king (Deut 17) is the one HE chooses, never
--   a dynasty seized. 8:27 — the ephod as snare framed by Exod 32 (gold devotion misdirected,
--   the good deliverer's misstep), Judg 2:3, and Ps 106's snare/whoring refrain.

CREATE TEMP VIEW _s345_jdg08_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 1: the soft answer (8:1-3)
    ('canon','judges',8,2,  'canon','proverbs',15,1, 'free',
     E'*A soft answer turneth away wrath: but grievous words stir up anger.* (Proverbs 15:1). When the men of Ephraim *did chide with him sharply* (Judges 8:1), Gideon does not return grievous words; he gives the soft answer — *Is not the gleaning of the grapes of Ephraim better than the vintage of Abi-ezer?* (Judges 8:2) — exalting his brethren above himself, and the wisdom of the Proverb is proven in the field.'),
    ('canon','judges',8,3,  'canon','proverbs',15,1, 'free',
     E'*A soft answer turneth away wrath: but grievous words stir up anger.* (Proverbs 15:1). The fruit is recorded plainly: *Then their anger was abated toward him, when he had said that* (Judges 8:3) — the very turning-away of wrath the Proverb promises to the one who answers softly.'),
    ('canon','judges',8,3,  'canon','proverbs',15,18, 'free',
     E'*A wrathful man stirreth up strife: but he that is slow to anger appeaseth strife.* (Proverbs 15:18). Gideon, slow to anger, *appeaseth strife* with Ephraim — giving Elohim (God) the glory, *Elohim (God) hath delivered into your hands the princes of Midian* (Judges 8:3) — and the kindled quarrel that could have split Yashar''el (Israel) is quieted.'),
    -- Thread 2: Yahuah shall rule over you (8:22-23)
    ('canon','judges',8,23,  'canon','deuteronomy',17,14, 'free',
     E'*When thou art come unto the land which Yahuah Elohayka (the LORD thy God) giveth thee... and shalt say, I will set a king over me, like as all the nations that are about me;* (Deuteronomy 17:14). The men of Yashar''el (Israel) crave a dynasty *like all the nations* — *Rule thou over us, both thou, and thy son, and thy son''s son also* (Judges 8:22) — but Gideon will not seize what Torah reserves to Yahuah''s own choosing.'),
    ('canon','judges',8,23,  'canon','deuteronomy',17,15, 'free',
     E'*Thou shalt in any wise set him king over thee, whom Yahuah Elohayka (the LORD thy God) shall choose: one from among thy brethren shalt thou set king over thee* (Deuteronomy 17:15). The crown is never grasped by the deliverer''s hand; it is GIVEN by Yahuah''s choice. So Gideon refuses the offered dynasty — *I will not rule over you, neither shall my son rule over you: Yahuah (LORD) shall rule over you* (Judges 8:23) — leaving the throne to the One whose it is.'),
    ('canon','judges',8,23,  'canon','1-samuel',8,7, 'free',
     E'*And Yahuah (LORD) said unto Samuel... they have not rejected thee, but they have rejected me, that I should not reign over them.* (1 Samuel 8:7). Gideon confessed the truth Yashar''el (Israel) would later forsake — *Yahuah (LORD) shall rule over you* (Judges 8:23) — for in demanding a king like the nations they cast off Yahuah Himself as King. The refusal here is the very kingship rejected there.'),
    ('canon','judges',8,23,  'canon','1-samuel',12,12, 'free',
     E'*And when ye saw that Nahash the king of the children of Ammon came against you, ye said unto me, Nay; but a king shall reign over us: when Yahuah Elohaychem (the LORD your God) was your king.* (1 Samuel 12:12). Samuel names the very throne Gideon had guarded — *Yahuah (LORD) shall rule over you* (Judges 8:23) — Yahuah Himself was their King, and to demand another was to depose the true One.'),
    -- Thread 3: the ephod became a snare (8:24-33)
    ('canon','judges',8,24,  'canon','exodus',32,2, 'free',
     E'*And Aaron said unto them, Break off the golden earrings, which are in the ears of your wives, of your sons, and of your daughters, and bring them unto me.* (Exodus 32:2). Gideon, like Aaron, gathers golden earrings of the spoil — *I would desire a request of you, that ye would give me every man the earrings of his prey* (Judges 8:24) — and the same gold that became Aaron''s calf will become Gideon''s snare.'),
    ('canon','judges',8,27,  'canon','exodus',32,4, 'free',
     E'*And he received them at their hand, and fashioned it with a graving tool, after he had made it a molten calf: and they said, These be thy gods, O Yashar''el (Israel)* (Exodus 32:4). As Aaron''s gold became an object of whoring devotion, so *Gideon made an ephod thereof... and all Yashar''el (Israel) went thither a whoring after it: which thing became a snare unto Gideon, and to his house* (Judges 8:27) — even the good deliverer''s gift, set up apart from Yahuah, turns to idolatry.'),
    ('canon','judges',8,27,  'canon','judges',2,3, 'free',
     E'*Wherefore I also said, I will not drive them out from before you; but they shall be as thorns in your sides, and their gods shall be a snare unto you.* (Judges 2:3). The angel''s word at Bochim names the recurring trap of the book — *their gods shall be a snare* — and Gideon''s ephod proves it from within: *which thing became a snare unto Gideon, and to his house* (Judges 8:27).'),
    ('canon','judges',8,27,  'canon','psalms',106,36, 'free',
     E'*And they served their idols: which were a snare unto them.* (Psalms 106:36). The Psalm''s history of Yashar''el (Israel) names the very pattern Gideon falls into — the object of devotion become *a snare* — for *all Yashar''el (Israel) went thither a whoring after it: which thing became a snare unto Gideon, and to his house* (Judges 8:27).'),
    ('canon','judges',8,33,  'canon','psalms',106,39, 'free',
     E'*Thus were they defiled with their own works, and went a whoring with their own inventions.* (Psalms 106:39). When *Gideon was dead... the children of Yashar''el (Israel) turned again, and went a whoring after Baalim, and made Baal-berith their god* (Judges 8:33) — the same whoring after their own inventions the Psalm laments, the cycle of forsaking Yahuah resuming the moment the deliverer is gone.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s345_jdg08_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s345_jdg08_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== threads =====
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judges-8-the-soft-answer-that-turneth-away-wrath',
       E'The Soft Answer That Turneth Away Wrath',
       E'The men of Ephraim *did chide with him sharply* — *Why hast thou served us thus, that thou calledst us not, when thou wentest to fight with the Midianites?* (Judges 8:1). A lesser man returns grievous words and splits the tribes; Gideon gives the soft answer. *Is not the gleaning of the grapes of Ephraim better than the vintage of Abi-ezer? Elohim (God) hath delivered into your hands the princes of Midian, Oreb and Zeeb* (Judges 8:2-3) — he exalts his brethren above himself and gives Elohim (God) the glory. And the wisdom of the Proverb is proven in the field: *Then their anger was abated toward him, when he had said that* (Judges 8:3). This is the very promise: *A soft answer turneth away wrath: but grievous words stir up anger* (Proverbs 15:1), and *A wrathful man stirreth up strife: but he that is slow to anger appeaseth strife* (Proverbs 15:18). The peacemaker''s tongue keeps Yashar''el (Israel) one.',
       sv.verse_id, ev.verse_id, 'free', 35825
  FROM _s345_jdg08_lookup sv, _s345_jdg08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=8 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='judges' AND ev.chapter_number=8 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judges-8-yahuah-shall-rule-over-you-gideon-refuses-the-crown',
       E'Yahuah Shall Rule Over You — Gideon Refuses the Crown',
       E'Flush with victory, *the men of Yashar''el (Israel) said unto Gideon, Rule thou over us, both thou, and thy son, and thy son''s son also: for thou hast delivered us from the hand of Midian* (Judges 8:22). They offer him a dynasty — a throne held by blood-succession, a king *like all the nations* (Deuteronomy 17:14). Gideon will not take it. *I will not rule over you, neither shall my son rule over you: Yahuah (LORD) shall rule over you* (Judges 8:23). This is the heart of the theocracy: Yahuah is the true King, and the crown is never seized by the deliverer''s hand. Even the king Torah permits is the one *whom Yahuah Elohayka (the LORD thy God) shall choose: one from among thy brethren* (Deuteronomy 17:15) — given by Yahuah, never grasped. The tragedy is that Yashar''el (Israel) would later forsake the very truth Gideon guarded. *They have not rejected thee, but they have rejected me, that I should not reign over them* (1 Samuel 8:7); *ye said unto me, Nay; but a king shall reign over us: when Yahuah Elohaychem (the LORD your God) was your king* (1 Samuel 12:12). To demand a king like the nations was to depose the King who already reigned.',
       sv.verse_id, ev.verse_id, 'free', 35828
  FROM _s345_jdg08_lookup sv, _s345_jdg08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=8 AND sv.verse_number=22
   AND ev.edition_slug='canon' AND ev.book_slug='judges' AND ev.chapter_number=8 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judges-8-the-ephod-became-a-snare',
       E'The Ephod Became a Snare',
       E'Having refused the crown, Gideon asks instead for the gold of the spoil: *I would desire a request of you, that ye would give me every man the earrings of his prey* (Judges 8:24). The echo of Sinai is exact — *And Aaron said unto them, Break off the golden earrings, which are in the ears of your wives, of your sons, and of your daughters, and bring them unto me* (Exodus 32:2) — and the same gold that became Aaron''s calf, *fashioned it with a graving tool, after he had made it a molten calf* (Exodus 32:4), becomes Gideon''s downfall. *And Gideon made an ephod thereof, and put it in his city, even in Ophrah: and all Yashar''el (Israel) went thither a whoring after it: which thing became a snare unto Gideon, and to his house* (Judges 8:27). Even the good deliverer''s gift, set up apart from Yahuah, turns to idolatry. The angel had warned of exactly this trap: *their gods shall be a snare unto you* (Judges 2:3); and the Psalm names the pattern — *And they served their idols: which were a snare unto them* (Psalms 106:36), *Thus were they defiled with their own works, and went a whoring with their own inventions* (Psalms 106:39). So when *Gideon was dead... the children of Yashar''el (Israel) turned again, and went a whoring after Baalim, and made Baal-berith their god* (Judges 8:33) — the snare he planted bore its bitter fruit, and the cycle resumed.',
       sv.verse_id, ev.verse_id, 'free', 35831
  FROM _s345_jdg08_lookup sv, _s345_jdg08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=8 AND sv.verse_number=24
   AND ev.edition_slug='canon' AND ev.book_slug='judges' AND ev.chapter_number=8 AND ev.verse_number=33
ON CONFLICT (slug) DO NOTHING;

-- ===== thread_members =====
-- Thread 1: the soft answer
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*A soft answer turneth away wrath* (Proverbs 15:1) — Gideon''s answer to Ephraim (Judges 8:2) exalts his brethren and gives Elohim (God) the glory.'
  FROM cross_reference_threads t
  JOIN _s345_jdg08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=8 AND sv.verse_number=2
  JOIN _s345_jdg08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=15 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-8-the-soft-answer-that-turneth-away-wrath'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*A soft answer turneth away wrath* (Proverbs 15:1) — the fruit recorded: *their anger was abated* (Judges 8:3).'
  FROM cross_reference_threads t
  JOIN _s345_jdg08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=8 AND sv.verse_number=3
  JOIN _s345_jdg08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=15 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-8-the-soft-answer-that-turneth-away-wrath'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*He that is slow to anger appeaseth strife* (Proverbs 15:18) — Gideon quiets the quarrel that could have split Yashar''el (Israel) (Judges 8:3).'
  FROM cross_reference_threads t
  JOIN _s345_jdg08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=8 AND sv.verse_number=3
  JOIN _s345_jdg08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=15 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-8-the-soft-answer-that-turneth-away-wrath'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2: Yahuah shall rule over you
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*I will set a king over me, like as all the nations* (Deuteronomy 17:14) — the dynastic craving Gideon is offered (Judges 8:22) and refuses.'
  FROM cross_reference_threads t
  JOIN _s345_jdg08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=8 AND sv.verse_number=23
  JOIN _s345_jdg08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=17 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-8-yahuah-shall-rule-over-you-gideon-refuses-the-crown'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Whom Yahuah Elohayka (the LORD thy God) shall choose* (Deuteronomy 17:15) — the king is given by Yahuah''s choice, never grasped; so Gideon leaves the throne to its Owner (Judges 8:23).'
  FROM cross_reference_threads t
  JOIN _s345_jdg08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=8 AND sv.verse_number=23
  JOIN _s345_jdg08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=17 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-8-yahuah-shall-rule-over-you-gideon-refuses-the-crown'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*They have rejected me, that I should not reign over them* (1 Samuel 8:7) — the very kingship Gideon guarded (Judges 8:23), later cast off.'
  FROM cross_reference_threads t
  JOIN _s345_jdg08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=8 AND sv.verse_number=23
  JOIN _s345_jdg08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=8 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-8-yahuah-shall-rule-over-you-gideon-refuses-the-crown'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*When Yahuah Elohaychem (the LORD your God) was your king* (1 Samuel 12:12) — Yahuah Himself reigned, the throne Gideon refused to usurp (Judges 8:23).'
  FROM cross_reference_threads t
  JOIN _s345_jdg08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=8 AND sv.verse_number=23
  JOIN _s345_jdg08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=12 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-8-yahuah-shall-rule-over-you-gideon-refuses-the-crown'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3: the ephod became a snare
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Break off the golden earrings* (Exodus 32:2) — the same gathered gold of devotion Gideon requests (Judges 8:24).'
  FROM cross_reference_threads t
  JOIN _s345_jdg08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=8 AND sv.verse_number=24
  JOIN _s345_jdg08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=32 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-8-the-ephod-became-a-snare'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*He had made it a molten calf* (Exodus 32:4) — Aaron''s gold became an idol; so Gideon''s ephod *became a snare unto Gideon, and to his house* (Judges 8:27).'
  FROM cross_reference_threads t
  JOIN _s345_jdg08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=8 AND sv.verse_number=27
  JOIN _s345_jdg08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=32 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-8-the-ephod-became-a-snare'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Their gods shall be a snare unto you* (Judges 2:3) — the angel''s warning at Bochim proven from within by Gideon''s ephod (Judges 8:27).'
  FROM cross_reference_threads t
  JOIN _s345_jdg08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=8 AND sv.verse_number=27
  JOIN _s345_jdg08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=2 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-8-the-ephod-became-a-snare'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*They served their idols: which were a snare unto them* (Psalms 106:36) — the Psalm names Gideon''s very pattern (Judges 8:27).'
  FROM cross_reference_threads t
  JOIN _s345_jdg08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=8 AND sv.verse_number=27
  JOIN _s345_jdg08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=106 AND tv.verse_number=36
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-8-the-ephod-became-a-snare'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Went a whoring with their own inventions* (Psalms 106:39) — after Gideon died, Yashar''el (Israel) *went a whoring after Baalim* (Judges 8:33), the cycle resuming.'
  FROM cross_reference_threads t
  JOIN _s345_jdg08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=8 AND sv.verse_number=33
  JOIN _s345_jdg08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=106 AND tv.verse_number=39
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-8-the-ephod-became-a-snare'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_judges_9.sql (Judges 9) -----
-- Chapter: Judges 9 — ABIMELECH THE BLOODY USURPER (Gideon's son by his Shechem concubine persuades
--          Shechem to crown him; he murders his SEVENTY brethren on one stone, only Jotham escaping;
--          JOTHAM'S PARABLE of the trees — olive, fig, vine all refuse the crown, the worthless BRAMBLE
--          accepts and threatens fire; Elohim sends an evil spirit so the innocent blood returns;
--          a woman casts a millstone on Abimelech's head at Thebez — Elohim renders his wickedness on his own head)
-- Tag: jdg09   View: _s345_jdg09_lookup   Sort band: 35850, 35853, 35856
--
-- Judges 9 coverage:
--   v.1-6  (Abimelech bribed from the house of Baal-berith hires vain men and slays the seventy sons of
--           Jerubbaal upon one stone, only Jotham the youngest hid; Shechem makes him king)
--          NT:     none warranted at the verse (the seed-war / innocent-blood weave carries it)
--          Extras: none warranted
--          Tanakh: Judges 8:22-23 (Gideon refused — *I will not rule over you... Yahuah shall rule over you*),
--                  Judges 8:30-31 (the threescore and ten sons of his body; the Shechem concubine bare Abimelech),
--                  Judges 8:33-35 (they made Baal-berith their god; shewed no kindness to the house of Jerubbaal)
--   v.7-15 (Jotham's parable — the trees seek a king; olive, fig, vine refuse; the bramble accepts and
--           threatens *let fire come out of the bramble, and devour the cedars of Lebanon*) — THE BRAMBLE-KING KEYSTONE
--          NT:     none warranted (the worthless-ruler fable is self-contained Tanakh wisdom)
--          Extras: none warranted
--          Tanakh: 2 Kings 14:9 (the thistle in Lebanon sent to the cedar... a wild beast trode down the thistle —
--                  the worthless/presumptuous leader, the same fable-form)
--   v.16-21 (Jotham's curse — if you dealt not truly, let fire come out from Abimelech and from Shechem and
--            devour one another; Jotham flees to Beer)
--          NT:     none warranted (folded into the bramble-fire thread; the curse is the fable applied)
--          Extras: none warranted
--          Tanakh: woven into the bramble thread (9:15 fire answered by 9:20 fire; fulfilled 9:45,49,57)
--   v.22-24,45,49 (after three years Elohim sends an evil spirit between Abimelech and Shechem *that the
--            cruelty done to the threescore and ten sons... might come, and their blood be laid upon Abimelech*;
--            he burns the tower of Shechem, a thousand men and women)
--          NT:     Galatians 6:7 (*whatsoever a man soweth, that shall he also reap*) — the sowing-and-reaping fill
--          Extras: none warranted
--          Tanakh: woven into the requiting-blood thread (the blood-guilt returning)
--   v.50-57 (at Thebez a woman casts a piece of a millstone on Abimelech's head; he bids his armourbearer
--            slay him lest men say a woman slew him; *thus Elohim rendered the wickedness of Abimelech...
--            and all the evil of the men of Shechem did Elohim render upon their heads*) — THE MISCHIEF-RETURNS KEYSTONE
--          NT:     Galatians 6:7 (Elohim is not mocked — a man reaps what he sows)
--          Extras: none warranted
--          Tanakh: Psalms 7:16 (*His mischief shall return upon his own head, and his violent dealing shall
--                  come down upon his own pate*), Proverbs 26:27 (*Whoso diggeth a pit shall fall therein:
--                  and he that rolleth a stone, it will return upon him*), 2 Samuel 11:21 (*did not a woman
--                  cast a piece of a millstone upon him from the wall, that he died in Thebez?* — the death
--                  remembered as a byword in Yashar'el)
--
-- Threads:
--   judges-9-abimelech-the-bloody-usurper-the-seventy-slain-the-king-who-refused-kingship  [Tanakh: Judges 8] (free)
--   judges-9-jothams-parable-the-bramble-king-let-fire-come-out-of-the-bramble             [Tanakh: 2 Kings]   (free)
--   judges-9-the-mischief-returns-upon-his-own-head-the-millstone-elohim-rendered-the-blood [Tanakh: Psalms, Proverbs, 2 Samuel | NT: Galatians] (free)
--
-- Framework notes: ★ Abimelech is the ANTI-GIDEON. His father, when all Yashar'el begged him to found a
-- dynasty, refused outright — *I will not rule over you, neither shall my son rule over you: Yahuah (LORD)
-- shall rule over you* (Judg 8:23) — for the kingship belongs to Yahuah, not to a man grasping for it. The
-- concubine's son grasps the very crown his father laid down, and to seize it he murders the seventy true
-- sons *upon one stone* (9:5,18), bought with seventy pieces of silver out of the house of Baal-berith
-- (9:4), the idol Yashar'el had made their god when Gideon died (8:33). Victims, not enemies: the seventy
-- slain are the innocent blood the chapter will require — the bloody usurper against the lawful house, the
-- seed-war within the covenant people. ★★ Jotham, the one who escaped, climbs Gerizim and tells the oldest
-- political fable in Scripture: the trees go to anoint a king (9:8). The olive, the fig, and the vine — the
-- fruitful and useful — all refuse, for each has better fruit to give than to wave over other trees (*Should
-- I leave my fatness... my sweetness... my wine, which cheereth Elohim and man*, 9:9,11,13). Only the worthless
-- BRAMBLE, that bears nothing and gives no shade, accepts — and instantly threatens fire: *if not, let fire
-- come out of the bramble, and devour the cedars of Lebanon* (9:15). The unfit ruler is the one who grasps
-- power; the bramble king gives no shelter but burns. The same fable-form answers Amaziah's pride generations
-- later — *The thistle that was in Lebanon sent to the cedar... and there passed by a wild beast... and trode
-- down the thistle* (2 Kings 14:9): the worthless thing that exalts itself against the cedar is trodden down.
-- ★ The curse runs its course exactly as the fable warned. Elohim sends an evil spirit between Abimelech and
-- Shechem *that the cruelty done to the threescore and ten sons of Jerubbaal might come, and their blood be
-- laid upon Abimelech* (9:23-24); the bramble's fire devours the cedars and the cedars' fire devours the
-- bramble (9:20,45,49). And at Thebez a woman drops a millstone on the usurper's skull (9:53), and the chapter
-- closes naming the law of the harvest plainly: *Thus Elohim rendered the wickedness of Abimelech... and all
-- the evil of the men of Shechem did Elohim render upon their heads* (9:56-57). This is Psalm 7 — *His
-- mischief shall return upon his own head* (Ps 7:16); Proverbs 26 — *Whoso diggeth a pit shall fall therein:
-- and he that rolleth a stone, it will return upon him* (Prov 26:27); the death so famous it became a byword,
-- *did not a woman cast a piece of a millstone upon him from the wall, that he died in Thebez?* (2 Sam 11:21);
-- and the gospel's plain word, *Be not deceived; Elohim (God) is not mocked: for whatsoever a man soweth, that
-- shall he also reap* (Gal 6:7). The innocent blood is required; the mischief comes home. All members canon →
-- every thread tier_required 'free'.

CREATE TEMP VIEW _s345_jdg09_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: Abimelech the bloody usurper — the seventy slain vs the king who refused kingship (Judges 8)
    ('canon','judges',9,5,'canon','judges',8,23,'free',E'*And Gideon said unto them, I will not rule over you, neither shall my son rule over you: Yahuah (LORD) shall rule over you* (Judges 8:23). Abimelech is the very son Gideon swore would not rule — and he seizes the crown his father laid down by slaying the rest of that house: *he went unto his father''s house at Ophrah, and slew his brethren the sons of Jerubbaal, being threescore and ten persons, upon one stone* (9:5). The father refused kingship for Yahuah''s sake; the concubine''s son murders his way to it.'),
    ('canon','judges',9,5,'canon','judges',8,30,'free',E'*And Gideon had threescore and ten sons of his body begotten: for he had many wives* (Judges 8:30). The threescore and ten sons named here are the very brethren Abimelech kills *upon one stone* (9:5) — the whole lawful house of Jerubbaal wiped out in a single morning so that one usurper might reign. The innocent blood the chapter will require begins as a roll of Gideon''s own sons.'),
    ('canon','judges',9,1,'canon','judges',8,31,'free',E'*And his concubine that was in Shechem, she also bare him a son, whose name he called Abimelech* (Judges 8:31). This is the man who now *went to Shechem unto his mother''s brethren... saying... remember also that I am your bone and your flesh* (9:1-2). The concubine''s son works his mother''s kin and the city of his birth to make himself king — claiming by blood what his father refused for Yahuah''s honour.'),
    ('canon','judges',9,4,'canon','judges',8,33,'free',E'*And it came to pass, as soon as Gideon was dead, that the children of Yashar''el (Israel) turned again, and went a whoring after Baalim, and made Baal-berith their god* (Judges 8:33). The very idol Yashar''el had set up after Gideon died now funds the murder: *they gave him threescore and ten pieces of silver out of the house of Baal-berith, wherewith Abimelech hired vain and light persons* (9:4). The apostasy bankrolls the bloodshed — seventy pieces of silver from the false god to slay the seventy true sons.')
    ,
    -- THREAD 2: Jotham's parable — the bramble king, let fire come out of the bramble (2 Kings)
    ('canon','judges',9,15,'canon','2-kings',14,9,'free',E'*And Jehoash the king of Yashar''el (Israel) sent to Amaziah king of Yahudah (Judah), saying, The thistle that was in Lebanon sent to the cedar that was in Lebanon, saying, Give thy daughter to my son to wife: and there passed by a wild beast that was in Lebanon, and trode down the thistle* (2 Kings 14:9). Jehoash answers Amaziah''s pride with the same fable Jotham told — the worthless thorn presuming against the cedar. Jotham''s bramble that threatens *let fire come out of the bramble, and devour the cedars of Lebanon* (9:15) is the thistle trodden down: the unfit ruler who exalts himself over the mighty is brought to nothing.')
    ,
    -- THREAD 3: the mischief returns upon his own head — the millstone, Elohim rendered the blood (Psalms / Proverbs / 2 Samuel / Galatians)
    ('canon','judges',9,56,'canon','psalms',7,16,'free',E'*His mischief shall return upon his own head, and his violent dealing shall come down upon his own pate* (Psalms 7:16). This is the law the chapter closes on: *Thus Elohim (God) rendered the wickedness of Abimelech, which he did unto his father, in slaying his seventy brethren* (9:56). The violent dealing of the man who slew seventy upon one stone comes down on his own pate — a millstone on his skull at Thebez — exactly as the Psalm sings the wicked falling into his own pit.'),
    ('canon','judges',9,53,'canon','proverbs',26,27,'free',E'*Whoso diggeth a pit shall fall therein: and he that rolleth a stone, it will return upon him* (Proverbs 26:27). Abimelech slew his brethren *upon one stone* (9:5) and burned the tower of Shechem with fire — and the stone returns: *a certain woman cast a piece of a millstone upon Abimelech''s head, and all to brake his skull* (9:53). The stone he rolled against others comes back upon him; the proverb is fulfilled to the letter.'),
    ('canon','judges',9,53,'canon','2-samuel',11,21,'free',E'*Who smote Abimelech the son of Jerubbesheth? did not a woman cast a piece of a millstone upon him from the wall, that he died in Thebez?* (2 Samuel 11:21). Generations later Abimelech''s death is a byword in Yashar''el — the very moment recorded here: *a certain woman cast a piece of a millstone upon Abimelech''s head* (9:53). His shameful end, the usurper felled by a woman''s millstone, is remembered as the proverb of the reckless death.'),
    ('canon','judges',9,24,'canon','galatians',6,7,'free',E'*Be not deceived; Elohim (God) is not mocked: for whatsoever a man soweth, that shall he also reap* (Galatians 6:7). The chapter names the same law in advance: Elohim sent the evil spirit *That the cruelty done to the threescore and ten sons of Jerubbaal might come, and their blood be laid upon Abimelech their brother, which slew them* (9:24). The blood he sowed is the harvest he reaps — Elohim is not mocked, and the cruelty done to the seventy returns upon the head that ordered it.'),
    ('canon','judges',9,57,'canon','galatians',6,7,'free',E'*Be not deceived; Elohim (God) is not mocked: for whatsoever a man soweth, that shall he also reap* (Galatians 6:7). Shechem''s share of the harvest closes the chapter: *And all the evil of the men of Shechem did Elohim (God) render upon their heads: and upon them came the curse of Jotham the son of Jerubbaal* (9:57). The men who bankrolled and aided the slaughter reap what they sowed — the curse of Jotham coming home, Elohim rendering their evil upon their own heads.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s345_jdg09_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s345_jdg09_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judges-9-abimelech-the-bloody-usurper-the-seventy-slain-the-king-who-refused-kingship',
       E'Abimelech the Bloody Usurper — the Seventy Slain vs the King Who Refused Kingship',
       E'Gideon had ended his life with the one refusal that defines the whole book of Judges. When all Yashar''el begged him to found a dynasty, he would not — *And Gideon said unto them, I will not rule over you, neither shall my son rule over you: Yahuah (LORD) shall rule over you* (Judges 8:23). The kingship belongs to Yahuah; no man may grasp it. But Gideon *had threescore and ten sons of his body begotten: for he had many wives* (Judges 8:30), and one more — *his concubine that was in Shechem, she also bare him a son, whose name he called Abimelech* (Judges 8:31). The concubine''s son is the man who now seizes the very crown his father laid down. He goes to Shechem, to his mother''s kin, and works the city: *remember also that I am your bone and your flesh* (9:2). And when Yashar''el after Gideon''s death *went a whoring after Baalim, and made Baal-berith their god* (Judges 8:33), the apostasy itself bankrolls the murder: *they gave him threescore and ten pieces of silver out of the house of Baal-berith, wherewith Abimelech hired vain and light persons* (9:4) — seventy pieces of silver from the false god to slay the seventy true sons. *And he went unto his father''s house at Ophrah, and slew his brethren the sons of Jerubbaal, being threescore and ten persons, upon one stone: notwithstanding yet Jotham the youngest son of Jerubbaal was left; for he hid himself* (9:5). The whole lawful house wiped out in one morning so that one usurper might reign. Abimelech is the anti-Gideon — the son who grasped what his father refused, who shed his brothers'' blood to wear a crown that belonged to Yahuah. The seventy slain are the innocent blood this chapter will require.',
       sv.verse_id, ev.verse_id, 'free', 35850
  FROM _s345_jdg09_lookup sv, _s345_jdg09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=9 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='judges' AND ev.chapter_number=9 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judges-9-jothams-parable-the-bramble-king-let-fire-come-out-of-the-bramble',
       E'Jotham''s Parable — the Bramble King, Let Fire Come Out of the Bramble',
       E'Jotham, the one son who escaped the slaughter, climbs to the top of mount Gerizim and tells the oldest political fable in Scripture. *The trees went forth on a time to anoint a king over them; and they said unto the olive tree, Reign thou over us* (9:8). But the fruitful and the useful all refuse — each has better fruit to give than to wave over other trees. The olive: *Should I leave my fatness, wherewith by me they honour Elohim (God) and man, and go to be promoted over the trees?* (9:9). The fig: *Should I forsake my sweetness, and my good fruit?* (9:11). The vine: *Should I leave my wine, which cheereth Elohim (God) and man?* (9:13). The good trees will not abandon their calling to grasp at rule. *Then said all the trees unto the bramble, Come thou, and reign over us* (9:14) — and only the worthless bramble, that bears no fruit and gives no shade, accepts. And it accepts with a threat: *And the bramble said unto the trees, If in truth ye anoint me king over you, then come and put your trust in my shadow: and if not, let fire come out of the bramble, and devour the cedars of Lebanon* (9:15). The bramble has no shadow worth trusting; what it offers is fire. The unfit ruler is precisely the one who grasps for power — and what he gives his people is not shelter but burning. The fable is no isolated tale; it is the shape of the whole canon''s warning against the grasping king. Generations later King Jehoash answers Amaziah''s pride with the very same fable-form: *The thistle that was in Lebanon sent to the cedar that was in Lebanon, saying, Give thy daughter to my son to wife: and there passed by a wild beast that was in Lebanon, and trode down the thistle* (2 Kings 14:9). The worthless thorn that presumes against the cedar is trodden down. So Jotham''s curse follows the fable to its end — *let fire come out from Abimelech, and devour the men of Shechem... and let fire come out from the men of Shechem... and devour Abimelech* (9:20) — and the chapter watches it burn.',
       sv.verse_id, ev.verse_id, 'free', 35853
  FROM _s345_jdg09_lookup sv, _s345_jdg09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=9 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='judges' AND ev.chapter_number=9 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judges-9-the-mischief-returns-upon-his-own-head-the-millstone-elohim-rendered-the-blood',
       E'The Mischief Returns Upon His Own Head — the Millstone, Elohim Rendered the Blood',
       E'The curse runs its course exactly as Jotham''s fable warned. After three years *Elohim (God) sent an evil spirit between Abimelech and the men of Shechem* (9:23), and the reason is stated plainly: *That the cruelty done to the threescore and ten sons of Jerubbaal might come, and their blood be laid upon Abimelech their brother, which slew them; and upon the men of Shechem, which aided him in the killing of his brethren* (9:24). The innocent blood is being required. The bramble''s fire devours the cedars and the cedars'' fire devours the bramble — Abimelech burns the tower of Shechem, *about a thousand men and women* (9:49) — and then comes Thebez. *And a certain woman cast a piece of a millstone upon Abimelech''s head, and all to brake his skull* (9:53); he begs his armourbearer to run him through *that men say not of me, A woman slew him* (9:54), but the shame is already fixed forever. The chapter closes naming the law of the harvest twice over: *Thus Elohim (God) rendered the wickedness of Abimelech, which he did unto his father, in slaying his seventy brethren: And all the evil of the men of Shechem did Elohim (God) render upon their heads: and upon them came the curse of Jotham the son of Jerubbaal* (9:56-57). This is the Psalm of the wicked man falling into his own pit: *His mischief shall return upon his own head, and his violent dealing shall come down upon his own pate* (Psalms 7:16) — and his pate is precisely where the millstone lands. It is the proverb to the letter: *Whoso diggeth a pit shall fall therein: and he that rolleth a stone, it will return upon him* (Proverbs 26:27) — the man who slew upon a stone is broken by a stone. So famous is the reckoning that it becomes a byword in Yashar''el; Joab cites it generations later: *Who smote Abimelech the son of Jerubbesheth? did not a woman cast a piece of a millstone upon him from the wall, that he died in Thebez?* (2 Samuel 11:21). And the gospel names the unchanging principle: *Be not deceived; Elohim (God) is not mocked: for whatsoever a man soweth, that shall he also reap* (Galatians 6:7). The blood Abimelech sowed is the harvest he reaped; the evil the men of Shechem sowed Elohim rendered upon their own heads. Yahuah is not mocked, and the innocent blood always comes home.',
       sv.verse_id, ev.verse_id, 'free', 35856
  FROM _s345_jdg09_lookup sv, _s345_jdg09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=9 AND sv.verse_number=23
   AND ev.edition_slug='canon' AND ev.book_slug='judges' AND ev.chapter_number=9 AND ev.verse_number=57
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Judges 8:23 — *I will not rule over you... Yahuah shall rule over you*: Abimelech seizes the very crown his father refused, slaying the rest of the house to do it (9:5).'
  FROM cross_reference_threads t
  JOIN _s345_jdg09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=9 AND sv.verse_number=5
  JOIN _s345_jdg09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=8 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-9-abimelech-the-bloody-usurper-the-seventy-slain-the-king-who-refused-kingship'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Judges 8:30 — *Gideon had threescore and ten sons of his body begotten*: the seventy named here are the very brethren Abimelech kills *upon one stone* (9:5).'
  FROM cross_reference_threads t
  JOIN _s345_jdg09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=9 AND sv.verse_number=5
  JOIN _s345_jdg09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=8 AND tv.verse_number=30
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-9-abimelech-the-bloody-usurper-the-seventy-slain-the-king-who-refused-kingship'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Judges 8:31 — *his concubine that was in Shechem... bare him a son, whose name he called Abimelech*: the concubine''s son works his mother''s city, *I am your bone and your flesh* (9:1-2).'
  FROM cross_reference_threads t
  JOIN _s345_jdg09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=9 AND sv.verse_number=1
  JOIN _s345_jdg09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=8 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-9-abimelech-the-bloody-usurper-the-seventy-slain-the-king-who-refused-kingship'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Judges 8:33 — *made Baal-berith their god*: the apostasy bankrolls the murder — seventy pieces of silver from the false god''s house to hire the killers (9:4).'
  FROM cross_reference_threads t
  JOIN _s345_jdg09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=9 AND sv.verse_number=4
  JOIN _s345_jdg09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=8 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-9-abimelech-the-bloody-usurper-the-seventy-slain-the-king-who-refused-kingship'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'2 Kings 14:9 — *The thistle that was in Lebanon sent to the cedar... a wild beast... trode down the thistle*: the same worthless-ruler fable; Jotham''s bramble that threatens *fire... devour the cedars of Lebanon* (9:15) is the thistle trodden down.'
  FROM cross_reference_threads t
  JOIN _s345_jdg09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=9 AND sv.verse_number=15
  JOIN _s345_jdg09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=14 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-9-jothams-parable-the-bramble-king-let-fire-come-out-of-the-bramble'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Psalms 7:16 — *His mischief shall return upon his own head... come down upon his own pate*: the violent dealing of Abimelech comes down on his own pate, *Elohim rendered the wickedness of Abimelech* (9:56).'
  FROM cross_reference_threads t
  JOIN _s345_jdg09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=9 AND sv.verse_number=56
  JOIN _s345_jdg09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=7 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-9-the-mischief-returns-upon-his-own-head-the-millstone-elohim-rendered-the-blood'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Proverbs 26:27 — *he that rolleth a stone, it will return upon him*: the man who slew his brethren *upon one stone* (9:5) is broken by a stone, the millstone on his skull (9:53).'
  FROM cross_reference_threads t
  JOIN _s345_jdg09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=9 AND sv.verse_number=53
  JOIN _s345_jdg09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=26 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-9-the-mischief-returns-upon-his-own-head-the-millstone-elohim-rendered-the-blood'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'2 Samuel 11:21 — *did not a woman cast a piece of a millstone upon him... that he died in Thebez?*: Abimelech''s shameful end becomes a byword in Yashar''el, the very moment of 9:53.'
  FROM cross_reference_threads t
  JOIN _s345_jdg09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=9 AND sv.verse_number=53
  JOIN _s345_jdg09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=11 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-9-the-mischief-returns-upon-his-own-head-the-millstone-elohim-rendered-the-blood'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Galatians 6:7 — *whatsoever a man soweth, that shall he also reap*: the blood he sowed is the harvest, *the cruelty done to the threescore and ten sons... might come, and their blood be laid upon Abimelech* (9:24).'
  FROM cross_reference_threads t
  JOIN _s345_jdg09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=9 AND sv.verse_number=24
  JOIN _s345_jdg09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=6 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-9-the-mischief-returns-upon-his-own-head-the-millstone-elohim-rendered-the-blood'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Galatians 6:7 — *Elohim is not mocked*: Shechem''s harvest closes the chapter, *all the evil of the men of Shechem did Elohim render upon their heads... the curse of Jotham* (9:57).'
  FROM cross_reference_threads t
  JOIN _s345_jdg09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=9 AND sv.verse_number=57
  JOIN _s345_jdg09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=6 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-9-the-mischief-returns-upon-his-own-head-the-millstone-elohim-rendered-the-blood'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_judges_10.sql (Judges 10) -----
-- Chapter: Judges 10 — THE CYCLE DEEPENS, AND THE GRIEVED MERCY OF YAHUAH: Tola and Jair judge
--          Yashar'el (the minor judges, the rest between); ★ the apostasy worse than ever —
--          Yashar'el serves the gods of SEVEN nations (Baalim, Ashtaroth, Syria, Zidon, Moab,
--          Ammon, Philistines) and *forsook Yahuah, and served not him* (10:6); sold to the
--          Philistines and Ammon, 18 years of oppression; ★★ they cry and CONFESS *We have
--          sinned* (10:10,15); ★★ Yahuah's wearied rebuke — *I will deliver you no more. Go and
--          cry unto the gods which ye have chosen* (10:11-14); ★★★ but when they put away the
--          strange gods and serve Yahuah, *his soul was grieved for the misery of Yashar'el*
--          (10:16) — the divine compassion that relents at true repentance, the heart that cannot
--          finally give His people up.
-- Tag: jdg10   View: _s345_jdg10_lookup   Sort band: 35875, 35878, 35881
--
-- Judges 10 coverage:
--   v.1-5  (Tola of Issachar judges 23 years; Jair the Gileadite judges 22 years, thirty sons on
--           thirty ass colts, thirty cities Havoth-jair)
--          NT/Extras/Tanakh: none warranted — the minor-judge rest-notices frame the turn into
--                  the relapse; carried into the surrounding threads
--   v.6-10 (★ did evil AGAIN, served the gods of SEVEN nations, *forsook Yahuah, and served not
--           him*; sold into the hands of the Philistines and Ammon, 18 years' oppression; the cry
--           and the confession *We have sinned... we have forsaken our Elohim, and also served
--           Baalim*)
--          NT:     none warranted at the verse (the cycle's lateral weight is in the Tanakh; the
--                  Deliverer who ends the cycle is named in the Thread-3 NT capstone)
--          Extras: none warranted
--          Tanakh: Judges 2:11-13 (did evil, served Baalim, forsook Yahuah, served Baal and
--                  Ashtaroth), 1 Samuel 12:9-10 (sold into the hand of the Philistines and Moab...
--                  We have sinned, we have forsaken Yahuah, served Baalim and Ashtaroth), Psalm
--                  106:36 (served their idols, which were a snare unto them)
--   v.11-14 (★★ Yahuah's wearied rebuke: *Did not I deliver you from the Egyptians... yet ye have
--            forsaken me, and served other gods: wherefore I will deliver you no more. Go and cry
--            unto the gods which ye have chosen; let them deliver you*)
--          NT:     none warranted at the verse
--          Extras: none warranted
--          Tanakh: Deuteronomy 32:37-38 (Where are their gods, their rock in whom they trusted?...
--                  let them rise up and help you), Jeremiah 2:28 (let them arise, if they can save
--                  thee in the time of thy trouble), Nehemiah 9:28 (after rest they did evil
--                  again... yet when they returned and cried, thou heardest them)
--   v.15-16 (★★★ the renewed confession *We have sinned: do thou unto us whatsoever seemeth good...
--            deliver us only*; they PUT AWAY the strange gods and served Yahuah; *his soul was
--            grieved for the misery of Yashar'el*)
--          NT:     Romans 11:1-2 (Hath Elohim cast away his people? Elohim forbid... hath not cast
--                  away his people which he foreknew) — the anti-replacement seal: the grieved heart
--                  of Judges 10 is the same heart that has NOT cast off Yashar'el
--          Extras: none warranted
--          Tanakh: Hosea 11:8 (How shall I give thee up, Ephraim?... mine heart is turned within
--                  me, my repentings are kindled together), Isaiah 63:9 (In all their affliction he
--                  was afflicted... in his love and in his pity he redeemed them), Nehemiah 9:31
--                  (for thy great mercies' sake thou didst not utterly consume them, nor forsake
--                  them)
--   v.17-18 (Ammon gathers in Gilead, Yashar'el encamps at Mizpeh; the princes seek a head —
--            setting up Jephthah)
--          NT/Extras/Tanakh: none warranted — narrative bridge into chapter 11
--
-- Threads:
--   judges-10-the-deepening-apostasy-and-the-cry-of-confession        [Tanakh: Judges, 1 Samuel, Psalm]              (free)
--   judges-10-i-will-deliver-you-no-more-cry-to-your-chosen-gods       [Tanakh: Deuteronomy, Jeremiah, Nehemiah]      (free)
--   judges-10-his-soul-was-grieved-for-the-misery-of-yasharel          [Tanakh: Hosea, Isaiah, Nehemiah | NT: Romans] (free)
--
-- Framework notes: ★ The cycle of Judges 2 returns deeper: the people serve the gods of SEVEN
-- nations at once and *forsook Yahuah, and served not him* (10:6) — the same evil, the same
-- Baalim and Ashtaroth (Judges 2:11-13), the same selling-into-the-hand (1 Sam 12:9), the idols
-- that are a snare (Ps 106:36). ★★ The wearied rebuke *I will deliver you no more. Go and cry
-- unto the gods which ye have chosen* (10:13-14) is the bitter irony Moses sang (Deut 32:37-38,
-- *Where are their gods... let them rise up and help you*) and Jeremiah pressed (Jer 2:28, *let
-- them arise, if they can save thee*) — the chosen gods who cannot save, the patience tested to
-- its edge; yet Nehemiah confesses the cry was still heard (Neh 9:28). ★★★ The keystone is 10:16
-- — they PUT AWAY the strange gods (true repentance, not mere words) and *his soul was grieved
-- for the misery of Yashar'el*. This is the very heart of Yahuah: *How shall I give thee up,
-- Ephraim?... mine heart is turned within me, my repentings are kindled together* (Hos 11:8);
-- *In all their affliction he was afflicted... in his love and in his pity he redeemed them* (Isa
-- 63:9 — the Angel of His presence, the Formed Son who bears the affliction with His people);
-- *for thy great mercies' sake thou didst not utterly consume them, nor forsake them* (Neh 9:31).
-- And the NT seals it against the replacement reading: *Hath Elohim cast away his people? Elohim
-- forbid... Elohim hath not cast away his people which he foreknew* (Rom 11:1-2). The grieved soul
-- of Judges 10 is the same heart that never finally gives His covenant people up. All members
-- canon → every thread tier_required 'free'.

CREATE TEMP VIEW _s345_jdg10_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: the deepening apostasy and the cry of confession (Judges / 1 Samuel / Psalm)
    ('canon','judges',10,6,'canon','judges',2,11,'free',E'*And the children of Yashar''el (Israel) did evil in the sight of Yahuah (LORD), and served Baalim* (Judges 2:11). The cycle laid down at the book''s opening returns here word for word, only deeper: *And the children of Yashar''el (Israel) did evil again in the sight of Yahuah (LORD), and served Baalim, and Ashtaroth, and the gods of Syria, and the gods of Zidon, and the gods of Moab, and the gods of the children of Ammon, and the gods of the Philistines* (10:6). The same evil, the same Baalim — now multiplied to the gods of seven nations.'),
    ('canon','judges',10,6,'canon','judges',2,12,'free',E'*And they forsook Yahuah Elohim (the LORD God) of their fathers, which brought them out of the land of Egypt, and followed other gods, of the gods of the people that were round about them* (Judges 2:12). The forsaking of Judges 2 is the forsaking of Judges 10: *and forsook Yahuah (LORD), and served not him* (10:6). The very thing the Angel rebuked at Bochim — following the gods of the people round about — is now the settled practice; the cycle has not been broken, only worn deeper.'),
    ('canon','judges',10,6,'canon','judges',2,13,'free',E'*And they forsook Yahuah (LORD), and served Baal and Ashtaroth* (Judges 2:13). Baal and Ashtaroth head the list again — *served Baalim, and Ashtaroth* (10:6) — the same two idols that opened the book''s descent now open this one. The relapse is not a new sin but the old one returned, *did evil again*, the wheel turning once more.'),
    ('canon','judges',10,7,'canon','1-samuel',12,9,'free',E'*And when they forgat Yahuah (LORD) their Elohim (God), he sold them into the hand of Sisera, captain of the host of Hazor, and into the hand of the Philistines, and into the hand of the king of Moab, and they fought against them* (1 Samuel 12:9). Samuel rehearses the very pattern of Judges 10: *And the anger of Yahuah (LORD) was hot against Yashar''el (Israel), and he sold them into the hands of the Philistines, and into the hands of the children of Ammon* (10:7). To forget Yahuah is to be sold into the hand of the oppressor — the servitude that follows the sin in every turn of the wheel.'),
    ('canon','judges',10,10,'canon','1-samuel',12,10,'free',E'*And they cried unto Yahuah (LORD), and said, We have sinned, because we have forsaken Yahuah (LORD), and have served Baalim and Ashtaroth: but now deliver us out of the hand of our enemies, and we will serve thee* (1 Samuel 12:10). This is the confession of Judges 10 almost to the word: *And the children of Yashar''el (Israel) cried unto Yahuah (LORD), saying, We have sinned against thee, both because we have forsaken our Elohim (God), and also served Baalim* (10:10). Samuel names this same cry as the supplication-step of the cycle — sin confessed, deliverance begged, the wheel turning toward mercy.'),
    ('canon','judges',10,6,'canon','psalms',106,36,'free',E'*And they served their idols: which were a snare unto them* (Psalm 106:36). The Psalm names the trap that the seven-fold idolatry of Judges 10 sprang: *and served not him* (10:6). To serve Baalim, Ashtaroth, and the gods of Syria, Zidon, Moab, Ammon, and the Philistines is to be caught in the snare the Psalm sings — the idols of the nations round about become the chains of those who bow to them.'),
    -- THREAD 2: ★★ "I will deliver you no more — go cry to your chosen gods" (Deuteronomy / Jeremiah / Nehemiah)
    ('canon','judges',10,14,'canon','deuteronomy',32,37,'free',E'*And he shall say, Where are their gods, their rock in whom they trusted* (Deuteronomy 32:37). Moses foresang the very taunt Yahuah now speaks: *Go and cry unto the gods which ye have chosen; let them deliver you in the time of your tribulation* (10:14). The chosen gods are summoned to do what only Yahuah can do — and Moses already knew the answer: they are no rock, they cannot stand.'),
    ('canon','judges',10,14,'canon','deuteronomy',32,38,'free',E'*Which did eat the fat of their sacrifices, and drank the wine of their drink offerings? let them rise up and help you, and be your protection* (Deuteronomy 32:38). This is Yahuah''s rebuke in Judges 10 set to song a generation earlier — *let them deliver you in the time of your tribulation* (10:14). The bitter irony is the same: the gods who received the sacrifices are told to provide the salvation, and they cannot. The patience of Yahuah is tested to its edge — *I will deliver you no more* (10:13).'),
    ('canon','judges',10,14,'canon','jeremiah',2,28,'free',E'*But where are thy gods that thou hast made thee? let them arise, if they can save thee in the time of thy trouble: for according to the number of thy cities are thy gods, O Yahudah (Judah)* (Jeremiah 2:28). Jeremiah presses the same charge Yahuah lays in Judges 10: *Go and cry unto the gods which ye have chosen; let them deliver you in the time of your tribulation* (10:14). The chosen gods are challenged to save in the hour of trouble — and the prophet knows, as Yahuah knows, that they cannot rise.'),
    ('canon','judges',10,13,'canon','nehemiah',9,28,'free',E'*But after they had rest, they did evil again before thee: therefore leftest thou them in the hand of their enemies, so that they had the dominion over them: yet when they returned, and cried unto thee, thou heardest them from heaven; and many times didst thou deliver them according to thy mercies* (Nehemiah 9:28). Yahuah''s *I will deliver you no more* (10:13) is the wearied edge of the very wheel Nehemiah confesses — rest, then evil again, then the cry. The rebuke is real, the patience worn; yet the cycle Nehemiah names ends not in abandonment but in *many times didst thou deliver them* — the mercy that keeps answering the cry.'),
    -- THREAD 3: ★★★ "his soul was grieved for the misery of Yashar'el" (Hosea / Isaiah / Nehemiah / Romans)
    ('canon','judges',10,16,'canon','hosea',11,8,'free',E'*How shall I give thee up, Ephraim? how shall I deliver thee, Yashar''el (Israel)? how shall I make thee as Admah? how shall I set thee as Zeboim? mine heart is turned within me, my repentings are kindled together* (Hosea 11:8). This is the inner life of the line *his soul was grieved for the misery of Yashar''el (Israel)* (10:16). When the people put away the strange gods, Yahuah''s heart turns within Him — the same divine compassion Hosea voices: the God who cannot finally give His people up, whose repentings kindle together at their return.'),
    ('canon','judges',10,16,'canon','isaiah',63,9,'free',E'*In all their affliction he was afflicted, and the angel of his presence saved them: in his love and in his pity he redeemed them; and he bare them, and carried them all the days of old* (Isaiah 63:9). The *grieved* soul of 10:16 is this very mystery — *in all their affliction he was afflicted*. Yahuah does not stand apart from the *misery of Yashar''el (Israel)*; the Angel of His presence (the Formed Son who bears the Name) bears it with them, in love and in pity, and that shared affliction is the ground of His relenting.'),
    ('canon','judges',10,16,'canon','nehemiah',9,31,'free',E'*Nevertheless for thy great mercies'' sake thou didst not utterly consume them, nor forsake them; for thou art a gracious and merciful Elohim (God)* (Nehemiah 9:31). The grieved soul of Judges 10 is the gracious and merciful Elohim Nehemiah confesses — the God who, though His patience is worn to *I will deliver you no more* (10:13), still *didst not utterly consume them, nor forsake them*. The misery that grieves Him (10:16) is met not with abandonment but with the great mercies that never let His people be wholly lost.'),
    ('canon','judges',10,16,'canon','romans',11,1,'free',E'*I say then, Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham, of the tribe of Benjamin* (Romans 11:1). The heart that was *grieved for the misery of Yashar''el (Israel)* (10:16) is the heart Paul declares has never cast His people off. The grief of Judges 10 is the standing answer to every replacement reading — the God whose soul is moved at His people''s misery does not, will not, cast them away.'),
    ('canon','judges',10,16,'canon','romans',11,2,'free',E'*Elohim (God) hath not cast away his people which he foreknew. Wot ye not what the scripture saith of Elias? how he maketh intercession to Elohim (God) against Yashar''el (Israel)* (Romans 11:2). The relenting soul of 10:16 — grieved at His people''s misery the moment they put away their idols — is the very proof of this: *Elohim hath not cast away his people which he foreknew*. The mercy that turns at true repentance in Judges is the same foreknowing love that holds Yashar''el (Israel) for ever; both olive branches are His.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s345_jdg10_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s345_jdg10_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judges-10-the-deepening-apostasy-and-the-cry-of-confession',
       E'The Deepening Apostasy and the Cry of Confession',
       E'After the quiet rest of Tola and Jair (10:1-5), the wheel turns again — and turns deeper. *And the children of Yashar''el (Israel) did evil again in the sight of Yahuah (LORD), and served Baalim, and Ashtaroth, and the gods of Syria, and the gods of Zidon, and the gods of Moab, and the gods of the children of Ammon, and the gods of the Philistines, and forsook Yahuah (LORD), and served not him* (10:6). This is the cycle of the book''s opening returned word for word, only multiplied — where Judges 2 named one apostasy, *the children of Yashar''el (Israel) did evil in the sight of Yahuah (LORD), and served Baalim* (Judges 2:11), here it is the gods of seven nations at once. The same forsaking, *they forsook Yahuah Elohim (the LORD God) of their fathers... and followed other gods, of the gods of the people that were round about them* (Judges 2:12); the same two idols heading the list, *served Baal and Ashtaroth* (Judges 2:13). And the idols are a trap, exactly as the Psalm sings: *they served their idols: which were a snare unto them* (Psalm 106:36). The servitude follows as it always does: *and he sold them into the hands of the Philistines, and into the hands of the children of Ammon* (10:7) — the very selling Samuel rehearses, *when they forgat Yahuah (LORD) their Elohim (God), he sold them into the hand... of the Philistines* (1 Samuel 12:9). Eighteen years of oppression, *Yashar''el (Israel) was sore distressed* (10:9), and then the cry: *We have sinned against thee, both because we have forsaken our Elohim (God), and also served Baalim* (10:10) — the confession Samuel names as the supplication-step of the cycle, *We have sinned, because we have forsaken Yahuah (LORD), and have served Baalim and Ashtaroth* (1 Samuel 12:10). Sin, servitude, the cry — the wheel of the whole book, worn deeper, turning once more toward mercy.',
       sv.verse_id, ev.verse_id, 'free', 35875
  FROM _s345_jdg10_lookup sv, _s345_jdg10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=10 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='judges' AND ev.chapter_number=10 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judges-10-i-will-deliver-you-no-more-cry-to-your-chosen-gods',
       E'I Will Deliver You No More — Cry to Your Chosen Gods',
       E'For the first time in the book, Yahuah answers the cry not with a deliverer but with a rebuke — the long-suffering tested to its edge. *Did not I deliver you from the Egyptians, and from the Amorites, from the children of Ammon, and from the Philistines? The Zidonians also, and the Amalekites, and the Maonites, did oppress you; and ye cried to me, and I delivered you out of their hand. Yet ye have forsaken me, and served other gods: wherefore I will deliver you no more. Go and cry unto the gods which ye have chosen; let them deliver you in the time of your tribulation* (10:11-14). The taunt is bitter and ancient — Moses sang it a generation before: *Where are their gods, their rock in whom they trusted, which did eat the fat of their sacrifices, and drank the wine of their drink offerings? let them rise up and help you, and be your protection* (Deuteronomy 32:37-38). The gods who received the worship are summoned to provide the rescue — and they cannot. Jeremiah would press the same charge: *where are thy gods that thou hast made thee? let them arise, if they can save thee in the time of thy trouble* (Jeremiah 2:28). The chosen gods are no rock; they cannot stand. Yet even *I will deliver you no more* (10:13) is the wearied edge of the wheel, not its end — for Nehemiah confesses this very pattern and names where it lands: *after they had rest, they did evil again before thee... yet when they returned, and cried unto thee, thou heardest them from heaven; and many times didst thou deliver them according to thy mercies* (Nehemiah 9:28). The rebuke is real, the patience worn thin — but it is the rebuke of a Father who will be moved again, not the verdict of a God who has cast His people off.',
       sv.verse_id, ev.verse_id, 'free', 35878
  FROM _s345_jdg10_lookup sv, _s345_jdg10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=10 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='judges' AND ev.chapter_number=10 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judges-10-his-soul-was-grieved-for-the-misery-of-yasharel',
       E'His Soul Was Grieved for the Misery of Yashar''el',
       E'The rebuke was not the last word, because the repentance was real. *And the children of Yashar''el (Israel) said unto Yahuah (LORD), We have sinned: do thou unto us whatsoever seemeth good unto thee; deliver us only, we pray thee, this day* (10:15) — and then, not words alone but the act: *And they put away the strange gods from among them, and served Yahuah (LORD)* (10:16a). The strange gods of the seven nations were cast out; they turned and served Him. And then the line that opens the very heart of Yahuah: *and his soul was grieved for the misery of Yashar''el (Israel)* (10:16b). The God who had just said *I will deliver you no more* cannot hold to it — His soul is moved at His people''s misery. This is the inner life Hosea would later voice: *How shall I give thee up, Ephraim? how shall I deliver thee, Yashar''el (Israel)? how shall I make thee as Admah? how shall I set thee as Zeboim? mine heart is turned within me, my repentings are kindled together* (Hosea 11:8) — the God who cannot finally give His people up. It is the mystery Isaiah names: *In all their affliction he was afflicted, and the angel of his presence saved them: in his love and in his pity he redeemed them; and he bare them, and carried them all the days of old* (Isaiah 63:9) — Yahuah does not watch the misery from afar; the Angel of His presence, the Formed Son who bears the Name, bears the affliction with His people, and that shared grief is the ground of His relenting. Nehemiah confesses the same heart in one line: *for thy great mercies'' sake thou didst not utterly consume them, nor forsake them; for thou art a gracious and merciful Elohim (God)* (Nehemiah 9:31). And the New Testament seals it against every reading that would write Yashar''el out: *Hath Elohim (God) cast away his people? Elohim (God) forbid* (Romans 11:1); *Elohim (God) hath not cast away his people which he foreknew* (Romans 11:2). The soul grieved at the misery of His people in Judges 10 is the same heart that, foreknowing them, has never cast them off and never will — the mercy that relents at true repentance, the love that cannot let His covenant people be wholly lost.',
       sv.verse_id, ev.verse_id, 'free', 35881
  FROM _s345_jdg10_lookup sv, _s345_jdg10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=10 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='judges' AND ev.chapter_number=10 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Judges 2:11 — *did evil in the sight of Yahuah, and served Baalim*: the cycle of the book''s opening returns word for word in 10:6, only multiplied to the gods of seven nations.'
  FROM cross_reference_threads t
  JOIN _s345_jdg10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=10 AND sv.verse_number=6
  JOIN _s345_jdg10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=2 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-10-the-deepening-apostasy-and-the-cry-of-confession'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Judges 2:12 — *forsook Yahuah Elohim... followed other gods, of the gods of the people round about*: the forsaking the Angel rebuked at Bochim is now the settled practice (10:6, *served not him*).'
  FROM cross_reference_threads t
  JOIN _s345_jdg10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=10 AND sv.verse_number=6
  JOIN _s345_jdg10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=2 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-10-the-deepening-apostasy-and-the-cry-of-confession'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Judges 2:13 — *forsook Yahuah, and served Baal and Ashtaroth*: the same two idols head the list again (10:6) — the relapse is the old sin returned, *did evil again*.'
  FROM cross_reference_threads t
  JOIN _s345_jdg10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=10 AND sv.verse_number=6
  JOIN _s345_jdg10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=2 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-10-the-deepening-apostasy-and-the-cry-of-confession'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'1 Samuel 12:9 — *when they forgat Yahuah... he sold them into the hand of the Philistines*: Samuel rehearses the very servitude of 10:7 — to forget Yahuah is to be sold into the oppressor''s hand.'
  FROM cross_reference_threads t
  JOIN _s345_jdg10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=10 AND sv.verse_number=7
  JOIN _s345_jdg10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=12 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-10-the-deepening-apostasy-and-the-cry-of-confession'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'1 Samuel 12:10 — *We have sinned, because we have forsaken Yahuah, and have served Baalim and Ashtaroth*: the confession of 10:10 almost word for word — the supplication-step of the cycle.'
  FROM cross_reference_threads t
  JOIN _s345_jdg10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=10 AND sv.verse_number=10
  JOIN _s345_jdg10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=12 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-10-the-deepening-apostasy-and-the-cry-of-confession'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'Psalm 106:36 — *served their idols: which were a snare unto them*: the seven-fold idolatry of 10:6 sprang the very trap the Psalm sings — the idols of the nations round about become the chains.'
  FROM cross_reference_threads t
  JOIN _s345_jdg10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=10 AND sv.verse_number=6
  JOIN _s345_jdg10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=106 AND tv.verse_number=36
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-10-the-deepening-apostasy-and-the-cry-of-confession'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Deuteronomy 32:37 — *Where are their gods, their rock in whom they trusted*: Moses foresang the very taunt of 10:14 — the chosen gods summoned, who are no rock and cannot stand.'
  FROM cross_reference_threads t
  JOIN _s345_jdg10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=10 AND sv.verse_number=14
  JOIN _s345_jdg10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=37
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-10-i-will-deliver-you-no-more-cry-to-your-chosen-gods'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Deuteronomy 32:38 — *let them rise up and help you, and be your protection*: the gods who ate the sacrifices are told to give the salvation (10:14) — and cannot; the patience worn to *I will deliver you no more* (10:13).'
  FROM cross_reference_threads t
  JOIN _s345_jdg10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=10 AND sv.verse_number=14
  JOIN _s345_jdg10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=38
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-10-i-will-deliver-you-no-more-cry-to-your-chosen-gods'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Jeremiah 2:28 — *let them arise, if they can save thee in the time of thy trouble*: Jeremiah presses the same charge as 10:14 — the chosen gods challenged to save, who cannot rise.'
  FROM cross_reference_threads t
  JOIN _s345_jdg10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=10 AND sv.verse_number=14
  JOIN _s345_jdg10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=2 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-10-i-will-deliver-you-no-more-cry-to-your-chosen-gods'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Nehemiah 9:28 — *yet when they returned, and cried unto thee... many times didst thou deliver them*: *I will deliver you no more* (10:13) is the wearied edge of the wheel Nehemiah confesses — rebuke, not abandonment; the mercy that keeps answering.'
  FROM cross_reference_threads t
  JOIN _s345_jdg10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=10 AND sv.verse_number=13
  JOIN _s345_jdg10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=9 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-10-i-will-deliver-you-no-more-cry-to-your-chosen-gods'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Hosea 11:8 — *How shall I give thee up, Ephraim?... mine heart is turned within me, my repentings are kindled together*: the inner life of *his soul was grieved* (10:16) — the God who cannot finally give His people up.'
  FROM cross_reference_threads t
  JOIN _s345_jdg10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=10 AND sv.verse_number=16
  JOIN _s345_jdg10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=11 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-10-his-soul-was-grieved-for-the-misery-of-yasharel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Isaiah 63:9 — *In all their affliction he was afflicted, and the angel of his presence saved them*: Yahuah does not watch the *misery* from afar (10:16) — the Angel of His presence, the Formed Son, bears it with them.'
  FROM cross_reference_threads t
  JOIN _s345_jdg10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=10 AND sv.verse_number=16
  JOIN _s345_jdg10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=63 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-10-his-soul-was-grieved-for-the-misery-of-yasharel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Nehemiah 9:31 — *thou didst not utterly consume them, nor forsake them; for thou art a gracious and merciful Elohim*: the grieved heart of 10:16, though worn to *deliver you no more*, still does not forsake.'
  FROM cross_reference_threads t
  JOIN _s345_jdg10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=10 AND sv.verse_number=16
  JOIN _s345_jdg10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=9 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-10-his-soul-was-grieved-for-the-misery-of-yasharel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Romans 11:1 — *Hath Elohim cast away his people? Elohim forbid*: the heart grieved for Yashar''el''s misery (10:16) is the standing answer to every replacement reading.'
  FROM cross_reference_threads t
  JOIN _s345_jdg10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=10 AND sv.verse_number=16
  JOIN _s345_jdg10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-10-his-soul-was-grieved-for-the-misery-of-yasharel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Romans 11:2 — *Elohim hath not cast away his people which he foreknew*: the mercy that relents at true repentance in Judges is the same foreknowing love that holds Yashar''el for ever — both olive branches His.'
  FROM cross_reference_threads t
  JOIN _s345_jdg10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=10 AND sv.verse_number=16
  JOIN _s345_jdg10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-10-his-soul-was-grieved-for-the-misery-of-yasharel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_judges_11.sql (Judges 11) -----
-- Judges 11 — full-library cross-references. Tag jdg11. Session prefix s345.
-- Sort band 35900, step 3: 35900, 35903, 35906, 35909.
-- View: _s345_jdg11_lookup
--
-- FRAME: JEPHTHAH the Gileadite — son of a harlot, THRUST OUT by his brethren
-- (thou shalt not inherit), who then come begging him to be their captain and HEAD
-- when Ammon makes war (11:1-11): ★ the REJECTED-then-exalted deliverer, the stone
-- the builders refused become the head of the corner (Ps 118:22). ★ The Spirit of
-- Yahuah comes upon him (11:29), the Spirit-empowered judge in the Othniel/Gideon
-- line. ★★ The RASH VOW (11:30-31, 34-39) — whatsoever cometh forth of the doors of
-- my house... I will offer it up for a burnt offering — and his ONLY CHILD, his
-- daughter, comes out with timbrels; he keeps the vow at terrible cost. The tragedy
-- of the unconsidered word: Eccl 5:2-6 (be not rash with thy mouth... better not
-- vow than vow and not pay), Num 30:2 (the vow binding, he shall not break his
-- word), and Lev 27:1-8 (the Torah's REDEMPTION-provision for persons devoted — the
-- vow need not have ended so; the rashness, not the keeping, the tragedy). ★ And yet
-- Jephthah stands in the roll of FAITH, the imperfect deliverer commended (Heb 11:32).
--
-- Judges 11 coverage:
--   v.1-11 (Jephthah the son of an harlot, thrust out by his brethren, fetched back and made head and captain)
--        NT:     none warranted (the rejected-then-exalted pattern carried by the Tanakh keystone Ps 118:22; the NT names that stone of Messiah elsewhere, the Tanakh root is the weave here)
--        Extras: none warranted
--        Tanakh: Ps 118:22 (the stone which the builders refused is become the head stone of the corner — KEYSTONE) — THREAD 1
--   v.12-28 (the diplomatic recital: Yahuah Elohim dispossessed the Amorites/Sihon, not Ammon's land)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Num 21:21-24 (Sihon would not suffer Yashar'el to pass; Yashar'el smote him and possessed his land from Arnon unto Jabbok) — the history Jephthah recites, folded into THREAD 1's anchor and into a v.21/v.23 link
--   v.29 (the Spirit of Yahuah came upon Jephthah)
--        NT:     none warranted (Spirit-on-the-deliverer carried by the Tanakh witnesses)
--        Extras: none warranted
--        Tanakh: Judg 3:10 (the Spirit of Yahuah came upon Othniel), Judg 6:34 (the Spirit came upon Gideon) — THREAD 2
--   v.30-31, 34-39 (the rash vow; his only daughter comes out; he keeps it)
--        NT:     none warranted (the warning is Tanakh wisdom; Eccl/Num the binding voices)
--        Extras: none warranted
--        Tanakh: Eccl 5:2,4,5 (be not rash with thy mouth; defer not to pay; better not vow than vow and not pay), Num 30:2 (he shall not break his word, he shall do according to all that proceedeth out of his mouth), Lev 27:2 / 27:8 (the singular vow of persons; redemption by the priest's estimation — the provision unheeded) — THREAD 3
--   v.32 (Jephthah commended for faith — the imperfect deliverer in the roll)
--        NT:     Heb 11:32 (the time would fail me to tell... of Jephthae) — THREAD 4
--        Extras: none warranted
--        Tanakh: 1 Sam 12:11 (Yahuah sent Jephthah... and delivered you, and ye dwelled safe) — the deliverance remembered, folded into THREAD 4
--
-- THREADS:
--   jdg11: judges-11-jephthah-thrust-out-by-his-brethren-made-head-the-stone-the-builders-refused (canon Tanakh) [free]
--   jdg11: judges-11-the-spirit-of-yahuah-came-upon-jephthah-the-spirit-empowered-judge (canon Tanakh) [free]
--   jdg11: judges-11-the-rash-vow-be-not-rash-with-thy-mouth-and-the-redemption-unheeded (canon Tanakh) [free]
--   jdg11: judges-11-jephthah-in-the-roll-of-faith-the-imperfect-deliverer-commended (canon NT) [free]
--
-- Contested/load-bearing framing: (1) The REJECTED deliverer made HEAD (11:2,8,11)
-- is read through Ps 118:22, the stone the builders refused become the head of the
-- corner — the unlikely, cast-out man exalted by Yahuah to save His people; the
-- shadow of the rejected-then-exalted Deliverer, the type read from the Tanakh root.
-- (2) The RASH VOW is framed as TRAGEDY, not as a model of piety: the keeping of the
-- vow honoured the binding word (Num 30:2), but the rashness was the sin Eccl 5
-- warns against, and the Torah itself gave a way out — Lev 27 set a priest's
-- estimation for persons singularly vowed, redemption that Jephthah in his haste
-- never sought. The cost was the daughter's; the lesson is the weight of the
-- unconsidered word, never that Yahuah delights in such an offering. (3) Jephthah is
-- nonetheless commended for FAITH (Heb 11:32) — the imperfect deliverer, flawed and
-- yet a vessel of Yahuah's salvation, named in the roll with Gideon, Barak, Samson.

CREATE TEMP VIEW _s345_jdg11_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: thrust out by his brethren, made head — the stone the builders refused
    ('canon','judges',11,2,'canon','psalms',118,22,'free',E'*The stone which the builders refused is become the head stone of the corner* (Psalm 118:22). Jephthah''s brethren *thrust out Jephthah, and said unto him, Thou shalt not inherit in our father''s house; for thou art the son of a strange woman* (Judges 11:2) — the very man rejected as worthless by the builders of the house is the one Yahuah will set at the head; the stone refused become the chief corner.'),
    ('canon','judges',11,7,'canon','psalms',118,22,'free',E'*The stone which the builders refused is become the head stone of the corner* (Psalm 118:22). *Did not ye hate me, and expel me out of my father''s house? and why are ye come unto me now when ye are in distress?* (Judges 11:7) — the rejected man names the rejection even as the distressed builders return to set him at the corner they once cast away.'),
    ('canon','judges',11,8,'canon','psalms',118,22,'free',E'*The stone which the builders refused is become the head stone of the corner* (Psalm 118:22). The elders answer the expelled son: *Therefore we turn again to thee now... and be our head over all the inhabitants of Gilead* (Judges 11:8) — the stone refused is lifted to be the head; the cast-out becomes the chief.'),
    ('canon','judges',11,11,'canon','psalms',118,22,'free',E'*The stone which the builders refused is become the head stone of the corner* (Psalm 118:22). *Then Jephthah went with the elders of Gilead, and the people made him head and captain over them* (Judges 11:11) — the exaltation is accomplished: the son of the harlot thrust from the inheritance is set as head over all, the rejected-then-exalted deliverer Yahuah raises to save.'),
    ('canon','judges',11,21,'canon','numbers',21,24,'free',E'*And Yashar''el (Israel) smote him with the edge of the sword, and possessed his land from Arnon unto Jabbok, even unto the children of Ammon* (Numbers 21:24). Jephthah recites this very history to the king of Ammon: *Yahuah Elohim (the LORD God) of Yashar''el (Israel) delivered Sihon and all his people into the hand of Yashar''el (Israel)... so Yashar''el (Israel) possessed all the land of the Amorites* (Judges 11:21) — the land was taken from Sihon the Amorite, not from Ammon, just as Numbers records.'),
    ('canon','judges',11,23,'canon','numbers',21,24,'free',E'*And Yashar''el (Israel) smote him with the edge of the sword, and possessed his land from Arnon unto Jabbok, even unto the children of Ammon* (Numbers 21:24). *So now Yahuah Elohim (the LORD God) of Yashar''el (Israel) hath dispossessed the Amorites from before his people Yashar''el (Israel), and shouldest thou possess it?* (Judges 11:23) — Jephthah''s diplomacy rests on the Numbers record: it was the Amorite, not Ammon, whom Yahuah dispossessed.'),
    -- THREAD 2: the Spirit of Yahuah came upon Jephthah
    ('canon','judges',11,29,'canon','judges',3,10,'free',E'*And the Spirit of Yahuah (LORD) came upon him, and he judged Yashar''el (Israel), and went out to war* (Judges 3:10). The same Spirit that clothed Othniel the first judge clothes Jephthah: *Then the Spirit of Yahuah (LORD) came upon Jephthah, and he passed over Gilead, and Manasseh* (Judges 11:29) — the deliverer is no self-made captain but a vessel empowered from above to save His people.'),
    ('canon','judges',11,29,'canon','judges',6,34,'free',E'*But the Spirit of Yahuah (LORD) came upon Gideon, and he blew a trumpet; and Abi-ezer was gathered after him* (Judges 6:34). As the Spirit fell on Gideon to gather and to fight, so *the Spirit of Yahuah (LORD) came upon Jephthah* (Judges 11:29) before he passed over against Ammon — the recurring sign that the salvation is Yahuah''s own, worked through the man His Spirit takes up.'),
    -- THREAD 3: the rash vow — be not rash with thy mouth; the redemption unheeded
    ('canon','judges',11,30,'canon','ecclesiastes',5,4,'free',E'*When thou vowest a vow unto Elohim (God), defer not to pay it; for he hath no pleasure in fools: pay that which thou hast vowed* (Ecclesiastes 5:4). Jephthah''s vow — *If thou shalt without fail deliver the children of Ammon into mine hands* (Judges 11:30) — binds him to pay; but the wisdom of Ecclesiastes warns that the vow once made cannot be undone, the very snare Jephthah walks into.'),
    ('canon','judges',11,31,'canon','ecclesiastes',5,2,'free',E'*Be not rash with thy mouth, and let not thine heart be hasty to utter any thing before Elohim (God): for Elohim (God) is in heaven, and thou upon earth: therefore let thy words be few* (Ecclesiastes 5:2). Jephthah''s rash word — *whatsoever cometh forth of the doors of my house to meet me... shall surely be the LORD''S, and I will offer it up for a burnt offering* (Judges 11:31) — is exactly the hasty utterance the Preacher warns against: the unconsidered vow that will cost him his only child.'),
    ('canon','judges',11,31,'canon','ecclesiastes',5,5,'free',E'*Better is it that thou shouldest not vow, than that thou shouldest vow and not pay* (Ecclesiastes 5:5). The terrible weight of Jephthah''s words — *I will offer it up for a burnt offering* (Judges 11:31) — proves the Preacher''s wisdom: the vow rashly made becomes a snare, and far better had it never been spoken than spoken to such a cost.'),
    ('canon','judges',11,31,'canon','numbers',30,2,'free',E'*If a man vow a vow unto Yahuah (LORD), or swear an oath to bind his soul with a bond; he shall not break his word, he shall do according to all that proceedeth out of his mouth* (Numbers 30:2). The Torah''s law of vows is the iron that binds Jephthah: *whatsoever cometh forth... I will offer it up for a burnt offering* (Judges 11:31) — *he shall not break his word*; the rashness is his, but the binding word is real, and this is the law he will not go back from.'),
    ('canon','judges',11,35,'canon','numbers',30,2,'free',E'*He shall not break his word, he shall do according to all that proceedeth out of his mouth* (Numbers 30:2). Jephthah''s anguish — *I have opened my mouth unto Yahuah (LORD), and I cannot go back* (Judges 11:35) — is the very law of Numbers spoken in his own grief: the word that proceedeth out of the mouth binds the soul, and he holds it to be unbreakable.'),
    ('canon','judges',11,39,'canon','leviticus',27,2,'free',E'*Speak unto the children of Yashar''el (Israel), and say unto them, When a man shall make a singular vow, the persons shall be for Yahuah (LORD) by thy estimation* (Leviticus 27:2). The Torah had foreseen the very case — a person singularly vowed to Yahuah — and set not death but a priest''s *estimation*; yet *he did with her according to his vow which he had vowed* (Judges 11:39), the redemption-provision unsought, the rashness the tragedy and not the law.'),
    ('canon','judges',11,39,'canon','leviticus',27,8,'free',E'*But if he be poorer than thy estimation, then he shall present himself before the priest, and the priest shall value him; according to his ability that vowed shall the priest value him* (Leviticus 27:8). The Torah made a way for every vowed person to be redeemed by estimation before the priest — a door Jephthah, who *did with her according to his vow* (Judges 11:39), never went to; the law of redemption stood open and unheeded.'),
    -- THREAD 4: Jephthah in the roll of faith — the imperfect deliverer commended
    ('canon','judges',11,32,'canon','hebrews',11,32,'free',E'*And what shall I more say? for the time would fail me to tell of Gedeon, and of Barak, and of Samson, and of Jephthae; of David also, and Samuel, and of the prophets* (Hebrews 11:32). Flawed as he was, the deliverer who *passed over unto the children of Ammon to fight against them; and Yahuah (LORD) delivered them into his hands* (Judges 11:32) is named in the roll of faith — the imperfect vessel commended, who *through faith subdued kingdoms, wrought righteousness, obtained promises* (Hebrews 11:33).'),
    ('canon','judges',11,32,'canon','1-samuel',12,11,'free',E'*And Yahuah (LORD) sent Jerubbaal, and Bedan, and Jephthah, and Samuel, and delivered you out of the hand of your enemies on every side, and ye dwelled safe* (1 Samuel 12:11). Samuel sets Jephthah among the saviours Yahuah sent: the man Yahuah used to deliver, of whom it is written *Yahuah (LORD) delivered them into his hands* (Judges 11:32) — the deliverance was real, and remembered, the imperfect judge a true instrument of salvation.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s345_jdg11_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s345_jdg11_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== threads =====
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judges-11-jephthah-thrust-out-by-his-brethren-made-head-the-stone-the-builders-refused',
       E'Jephthah thrust out by his brethren, made head — the stone the builders refused',
       E'The deliverer of Gilead enters under a stain and a rejection: *Now Jephthah the Gileadite was a mighty man of valour, and he was the son of an harlot* (Judges 11:1), and his half-brethren *thrust out Jephthah, and said unto him, Thou shalt not inherit in our father''s house; for thou art the son of a strange woman* (Judges 11:2). Cast from the inheritance, he flees to the land of Tob. But when Ammon makes war, the builders who refused him come begging: *Come, and be our captain, that we may fight with the children of Ammon* (Judges 11:6). He names their rejection to their faces — *Did not ye hate me, and expel me out of my father''s house? and why are ye come unto me now when ye are in distress?* (Judges 11:7) — and they raise him higher than they had cast him down: *Therefore we turn again to thee now... and be our head over all the inhabitants of Gilead* (Judges 11:8). So it is done: *the people made him head and captain over them* (Judges 11:11). This is the pattern the Psalm sings — *The stone which the builders refused is become the head stone of the corner* (Psalm 118:22): the man rejected as worthless by the builders of the house is the very one Yahuah lifts to be the head of the corner, the unlikely cast-out deliverer raised to save His people. Jephthah''s wisdom in office is to recite the covenant history rightly: the land was taken from Sihon the Amorite, not from Ammon — *Yashar''el (Israel) smote him with the edge of the sword, and possessed his land from Arnon unto Jabbok* (Numbers 21:24) — *Yahuah Elohim (the LORD God) of Yashar''el (Israel) hath dispossessed the Amorites from before his people Yashar''el (Israel), and shouldest thou possess it?* (Judges 11:23). The rejected stone, set at the corner, judges rightly.',
       sv.verse_id, ev.verse_id, 'free', 35900
  FROM _s345_jdg11_lookup sv, _s345_jdg11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=11 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='judges' AND ev.chapter_number=11 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judges-11-the-spirit-of-yahuah-came-upon-jephthah-the-spirit-empowered-judge',
       E'The Spirit of Yahuah came upon Jephthah — the Spirit-empowered judge',
       E'Before the rejected man can save, he must be clothed from above. The diplomacy fails — *the king of the children of Ammon hearkened not unto the words of Jephthah* (Judges 11:28) — and then comes the sign the whole book marks on every true deliverer: *Then the Spirit of Yahuah (LORD) came upon Jephthah, and he passed over Gilead, and Manasseh, and passed over Mizpeh of Gilead, and from Mizpeh of Gilead he passed over unto the children of Ammon* (Judges 11:29). This is the same Spirit that clothed the first judge — *the Spirit of Yahuah (LORD) came upon him, and he judged Yashar''el (Israel), and went out to war* (Judges 3:10) — and the same that fell on Gideon — *the Spirit of Yahuah (LORD) came upon Gideon, and he blew a trumpet* (Judges 6:34). The deliverer is never a self-made captain; he is a vessel taken up by the Spirit of Yahuah, that the salvation might plainly be Yahuah''s own work through the man He empowers. The cast-out son of the harlot goes out against Ammon not in his own strength but in the Spirit that came upon him.',
       sv.verse_id, ev.verse_id, 'free', 35903
  FROM _s345_jdg11_lookup sv, _s345_jdg11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=11 AND sv.verse_number=29
   AND ev.edition_slug='canon' AND ev.book_slug='judges' AND ev.chapter_number=11 AND ev.verse_number=29
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judges-11-the-rash-vow-be-not-rash-with-thy-mouth-and-the-redemption-unheeded',
       E'The rash vow — be not rash with thy mouth, and the redemption unheeded',
       E'Here is the tragedy at the heart of the chapter, and it is a tragedy of the unconsidered word. On the eve of battle Jephthah binds himself with a vow: *If thou shalt without fail deliver the children of Ammon into mine hands, then it shall be, that whatsoever cometh forth of the doors of my house to meet me, when I return in peace from the children of Ammon, shall surely be the LORD''S, and I will offer it up for a burnt offering* (Judges 11:30-31). Yahuah gives the victory; and when he comes home, *behold, his daughter came out to meet him with timbrels and with dances: and she was his only child* (Judges 11:34). He rends his clothes: *I have opened my mouth unto Yahuah (LORD), and I cannot go back* (Judges 11:35), and at the end of two months *did with her according to his vow which he had vowed* (Judges 11:39). The wisdom of the Preacher had warned against exactly this rashness: *Be not rash with thy mouth, and let not thine heart be hasty to utter any thing before Elohim (God): for Elohim (God) is in heaven, and thou upon earth: therefore let thy words be few* (Ecclesiastes 5:2), and *Better is it that thou shouldest not vow, than that thou shouldest vow and not pay* (Ecclesiastes 5:5). The vow once made was binding — *If a man vow a vow unto Yahuah (LORD)... he shall not break his word, he shall do according to all that proceedeth out of his mouth* (Numbers 30:2) — and Jephthah honoured the binding word. But the Torah itself had set a door of mercy that his haste never sought: for persons singularly vowed there was redemption by estimation — *When a man shall make a singular vow, the persons shall be for Yahuah (LORD) by thy estimation* (Leviticus 27:2), and even the poorest *shall present himself before the priest, and the priest shall value him* (Leviticus 27:8). The vow need not have ended so. The lesson is not that Yahuah delights in such an offering — He does not — but the terrible weight of the rash and unconsidered word, and the redemption that stood open and unheeded.',
       sv.verse_id, ev.verse_id, 'free', 35906
  FROM _s345_jdg11_lookup sv, _s345_jdg11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=11 AND sv.verse_number=30
   AND ev.edition_slug='canon' AND ev.book_slug='judges' AND ev.chapter_number=11 AND ev.verse_number=39
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judges-11-jephthah-in-the-roll-of-faith-the-imperfect-deliverer-commended',
       E'Jephthah in the roll of faith — the imperfect deliverer commended',
       E'For all his flaws — the rash vow, the terrible cost — Jephthah is not cast out of the testimony of faith. *So Jephthah passed over unto the children of Ammon to fight against them; and Yahuah (LORD) delivered them into his hands* (Judges 11:32), and the deliverance was real and remembered. Samuel names him among the saviours Yahuah sent: *And Yahuah (LORD) sent Jerubbaal, and Bedan, and Jephthah, and Samuel, and delivered you out of the hand of your enemies on every side, and ye dwelled safe* (1 Samuel 12:11). And the roll of faith sets him with the great deliverers: *And what shall I more say? for the time would fail me to tell of Gedeon, and of Barak, and of Samson, and of Jephthae; of David also, and Samuel, and of the prophets: Who through faith subdued kingdoms, wrought righteousness, obtained promises* (Hebrews 11:32-33). The imperfect vessel is commended — not for the rashness of his vow, but for the faith by which he trusted Yahuah for the victory and was made an instrument of His salvation. The stone the builders refused, on whom the Spirit came, who erred grievously with his mouth, is yet numbered among the faithful.',
       sv.verse_id, ev.verse_id, 'free', 35909
  FROM _s345_jdg11_lookup sv, _s345_jdg11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=11 AND sv.verse_number=32
   AND ev.edition_slug='canon' AND ev.book_slug='judges' AND ev.chapter_number=11 AND ev.verse_number=32
ON CONFLICT (slug) DO NOTHING;

-- ===== thread_members =====
-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*The stone which the builders refused is become the head stone of the corner* (Psalm 118:22) — the son thrust out (Judg 11:2) is the very stone the builders rejected.'
  FROM cross_reference_threads t
  JOIN _s345_jdg11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=11 AND sv.verse_number=2
  JOIN _s345_jdg11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=118 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-11-jephthah-thrust-out-by-his-brethren-made-head-the-stone-the-builders-refused'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*The stone which the builders refused is become the head stone of the corner* (Psalm 118:22) — Jephthah names the rejection (Judg 11:7) as the distressed builders return.'
  FROM cross_reference_threads t
  JOIN _s345_jdg11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=11 AND sv.verse_number=7
  JOIN _s345_jdg11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=118 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-11-jephthah-thrust-out-by-his-brethren-made-head-the-stone-the-builders-refused'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*...become the head stone of the corner* (Psalm 118:22) — the elders raise the cast-out man to be their head (Judg 11:8).'
  FROM cross_reference_threads t
  JOIN _s345_jdg11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=11 AND sv.verse_number=8
  JOIN _s345_jdg11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=118 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-11-jephthah-thrust-out-by-his-brethren-made-head-the-stone-the-builders-refused'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*...is become the head stone of the corner* (Psalm 118:22) — the exaltation done: made head and captain over all (Judg 11:11).'
  FROM cross_reference_threads t
  JOIN _s345_jdg11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=11 AND sv.verse_number=11
  JOIN _s345_jdg11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=118 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-11-jephthah-thrust-out-by-his-brethren-made-head-the-stone-the-builders-refused'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Yashar''el (Israel)... possessed his land from Arnon unto Jabbok* (Numbers 21:24) — the history Jephthah recites: Yahuah delivered Sihon, not Ammon''s land (Judg 11:21).'
  FROM cross_reference_threads t
  JOIN _s345_jdg11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=11 AND sv.verse_number=21
  JOIN _s345_jdg11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=21 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-11-jephthah-thrust-out-by-his-brethren-made-head-the-stone-the-builders-refused'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*...possessed his land from Arnon unto Jabbok* (Numbers 21:24) — Jephthah''s argument: Yahuah dispossessed the Amorite, not Ammon (Judg 11:23).'
  FROM cross_reference_threads t
  JOIN _s345_jdg11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=11 AND sv.verse_number=23
  JOIN _s345_jdg11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=21 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-11-jephthah-thrust-out-by-his-brethren-made-head-the-stone-the-builders-refused'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*The Spirit of Yahuah (LORD) came upon him* (Judges 3:10) — the same Spirit that clothed Othniel the first judge clothes Jephthah (Judg 11:29).'
  FROM cross_reference_threads t
  JOIN _s345_jdg11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=11 AND sv.verse_number=29
  JOIN _s345_jdg11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=3 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-11-the-spirit-of-yahuah-came-upon-jephthah-the-spirit-empowered-judge'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*The Spirit of Yahuah (LORD) came upon Gideon, and he blew a trumpet* (Judges 6:34) — the recurring sign on every true deliverer, now on Jephthah (Judg 11:29).'
  FROM cross_reference_threads t
  JOIN _s345_jdg11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=11 AND sv.verse_number=29
  JOIN _s345_jdg11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=6 AND tv.verse_number=34
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-11-the-spirit-of-yahuah-came-upon-jephthah-the-spirit-empowered-judge'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*When thou vowest a vow unto Elohim (God), defer not to pay it... pay that which thou hast vowed* (Ecclesiastes 5:4) — the vow once made binds Jephthah (Judg 11:30).'
  FROM cross_reference_threads t
  JOIN _s345_jdg11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=11 AND sv.verse_number=30
  JOIN _s345_jdg11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=5 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-11-the-rash-vow-be-not-rash-with-thy-mouth-and-the-redemption-unheeded'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Be not rash with thy mouth... therefore let thy words be few* (Ecclesiastes 5:2) — the hasty utterance the Preacher warns against, spoken by Jephthah (Judg 11:31).'
  FROM cross_reference_threads t
  JOIN _s345_jdg11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=11 AND sv.verse_number=31
  JOIN _s345_jdg11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=5 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-11-the-rash-vow-be-not-rash-with-thy-mouth-and-the-redemption-unheeded'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Better is it that thou shouldest not vow, than that thou shouldest vow and not pay* (Ecclesiastes 5:5) — the snare of the rash vow at terrible cost (Judg 11:31).'
  FROM cross_reference_threads t
  JOIN _s345_jdg11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=11 AND sv.verse_number=31
  JOIN _s345_jdg11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=5 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-11-the-rash-vow-be-not-rash-with-thy-mouth-and-the-redemption-unheeded'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*He shall not break his word, he shall do according to all that proceedeth out of his mouth* (Numbers 30:2) — the Torah law of vows that binds the rash word (Judg 11:31).'
  FROM cross_reference_threads t
  JOIN _s345_jdg11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=11 AND sv.verse_number=31
  JOIN _s345_jdg11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=30 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-11-the-rash-vow-be-not-rash-with-thy-mouth-and-the-redemption-unheeded'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*He shall not break his word... he shall do according to all that proceedeth out of his mouth* (Numbers 30:2) — Jephthah''s anguish, I cannot go back (Judg 11:35), is this law in his grief.'
  FROM cross_reference_threads t
  JOIN _s345_jdg11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=11 AND sv.verse_number=35
  JOIN _s345_jdg11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=30 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-11-the-rash-vow-be-not-rash-with-thy-mouth-and-the-redemption-unheeded'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*When a man shall make a singular vow, the persons shall be for Yahuah (LORD) by thy estimation* (Leviticus 27:2) — the Torah''s redemption for vowed persons, unsought (Judg 11:39).'
  FROM cross_reference_threads t
  JOIN _s345_jdg11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=11 AND sv.verse_number=39
  JOIN _s345_jdg11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=27 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-11-the-rash-vow-be-not-rash-with-thy-mouth-and-the-redemption-unheeded'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*He shall present himself before the priest, and the priest shall value him* (Leviticus 27:8) — the door of redemption that stood open and unheeded (Judg 11:39).'
  FROM cross_reference_threads t
  JOIN _s345_jdg11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=11 AND sv.verse_number=39
  JOIN _s345_jdg11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=27 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-11-the-rash-vow-be-not-rash-with-thy-mouth-and-the-redemption-unheeded'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*...the time would fail me to tell of Gedeon, and of Barak, and of Samson, and of Jephthae* (Hebrews 11:32) — the imperfect deliverer named in the roll of faith (Judg 11:32).'
  FROM cross_reference_threads t
  JOIN _s345_jdg11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=11 AND sv.verse_number=32
  JOIN _s345_jdg11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=32
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-11-jephthah-in-the-roll-of-faith-the-imperfect-deliverer-commended'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Yahuah (LORD) sent Jerubbaal, and Bedan, and Jephthah, and Samuel, and delivered you* (1 Samuel 12:11) — Jephthah among the saviours Yahuah sent (Judg 11:32).'
  FROM cross_reference_threads t
  JOIN _s345_jdg11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=11 AND sv.verse_number=32
  JOIN _s345_jdg11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=12 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-11-jephthah-in-the-roll-of-faith-the-imperfect-deliverer-commended'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_judges_12.sql (Judges 12) -----
--
-- Chapter: Judges 12 — Ephraim's proud strife with Jephthah; the Shibboleth test
--   at the fords of Jordan; 42,000 of Ephraim fall (brother against brother); the
--   minor judges Ibzan, Elon, Abdon (the rest between).
-- Tag: jdg12   View: _s345_jdg12_lookup   Sort band: 35925, 35928, 35931
--
-- Judges 12 coverage:
--   v.1   (Ephraim threatens to burn Jephthah's house, angry they were not called)
--         NT:     none warranted
--         Extras: none warranted
--         Tanakh: Judges 8:1 (Ephraim's identical chiding of Gideon) — T1
--   v.2-3 (Jephthah's answer — I called you and ye delivered me not)
--         NT:     none warranted
--         Extras: none warranted
--         Tanakh: none warranted (answered in the thread prose)
--   v.4   (Gilead smites Ephraim — civil war begins; the taunt "fugitives of Ephraim")
--         NT:     Matthew 12:25 (house/kingdom divided against itself cannot stand) — T2
--                 James 4:1 (whence come wars and fightings — of the lusts that war) — T2
--         Extras: none warranted
--         Tanakh: Judges 8:2 (Gideon's soft answer abated Ephraim's wrath) — T1;
--                 Proverbs 15:1 (soft answer turneth away wrath) — T1;
--                 Proverbs 17:14 (leave off contention before it be meddled with) — T1;
--                 Genesis 13:8 (let there be no strife, for we be brethren) — T2;
--                 1 Kings 12:24 (fight not against your brethren the children of Israel) — T2
--   v.5-6 (the Shibboleth test at the fords; 42,000 Ephraimites slain)
--         NT:     Matthew 12:25 (divided house — anchor of T2)
--         Extras: none warranted
--         Tanakh: 1 Kings 12:24 (the LATER fratricide forbidden — T2)
--   v.7   (Jephthah judged Israel six years, then died, buried in Gilead)
--         NT:     none warranted
--         Extras: none warranted
--         Tanakh: Judges 2:16 (Yahuah raised up judges who delivered them) — T3
--   v.8-15 (Ibzan, Elon, Abdon — the minor judges, the rest between)
--         NT:     none warranted
--         Extras: none warranted
--         Tanakh: Judges 10:1 (the minor-judge formula — arose to defend Israel) — T3
--
-- Threads:
--   T1 judges-12-the-proud-strife-of-ephraim-the-soft-answer-they-would-not-give
--      (free) — Tanakh: Judges 8; Proverbs 15, 17
--   T2 judges-12-shibboleth-and-the-forty-two-thousand-brother-against-brother
--      (free) — Tanakh: Genesis 13, 1 Kings 12; NT: Matthew 12, James 4
--   T3 judges-12-ibzan-elon-and-abdon-the-rest-between
--      (free) — Tanakh: Judges 2, 10
--
-- Framework-load-bearing framing: Ephraim is the proud northern tribe (the stick of
-- Joseph). Twice they quarrel over not being "called" — once with Gideon (Judg 8),
-- where a soft answer abates the wrath; here with Jephthah, where the same pride runs
-- to slaughter. The Shibboleth that cannot be framed and the 42,000 of a brother-tribe
-- fallen are the wound of the divided house — the two-house framework grieves it, and
-- it foreshadows the formal tearing of Ephraim from Judah (1 Kings 12), where Yahuah
-- HIMSELF forbids the brothers to fight (1 Kings 12:24). The healing is Ezekiel 37 —
-- the two sticks made one again.
--

CREATE TEMP VIEW _s345_jdg12_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- T1: Ephraim's proud strife — the soft answer they would not give
    ('canon','judges',12,1,'canon','judges',8,1,'free',E'*And the men of Ephraim said unto him, Why hast thou served us thus, that thou calledst us not, when thou wentest to fight with the Midianites? And they did chide with him sharply* (Judges 8:1). The same proud tribe, the same grievance, a generation before: Ephraim quarrels with Gideon over not being *called* to the battle, exactly as here they confront Jephthah — *Wherefore passedst thou over to fight against the children of Ammon... and didst not call us to go with thee? we will burn thine house upon thee with fire* (Judges 12:1). The recurring pride of the stick of Joseph, twice offended that the victory came without them.'),
    ('canon','judges',12,4,'canon','judges',8,2,'free',E'*And he said unto them, What have I done now in comparison of you? Is not the gleaning of the grapes of Ephraim better than the vintage of Abi-ezer?... Then their anger was abated toward him, when he had said that* (Judges 8:2-3). Gideon answered the same proud wrath with a soft word that exalted Ephraim above himself — and the quarrel died. Jephthah answers in kind — *I and my people were at great strife with the children of Ammon; and when I called you, ye delivered me not* — but here no soft word turns the wrath; instead *the men of Gilead smote Ephraim* (Judges 12:4). The contrast of the two answers is the whole tragedy.'),
    ('canon','judges',12,4,'canon','proverbs',15,1,'free',E'*A soft answer turneth away wrath: but grievous words stir up anger* (Proverbs 15:1). Gideon''s soft answer turned away Ephraim''s wrath (Judges 8:3); at the fords of Jordan the grievous words on both sides stir it to slaughter. *The men of Gilead smote Ephraim* (Judges 12:4) — the proverb read backward, the wrath not turned but loosed.'),
    ('canon','judges',12,4,'canon','proverbs',17,14,'free',E'*The beginning of strife is as when one letteth out water: therefore leave off contention, before it be meddled with* (Proverbs 17:14). The strife between Gilead and Ephraim is the let-out water that cannot be gathered again — *the men of Gilead smote Ephraim* (Judges 12:4), and forty-two thousand fell before the contention was left off. The wisdom Ephraim would not heed.'),
    -- T2: Shibboleth and the forty-two thousand — brother against brother
    ('canon','judges',12,4,'canon','genesis',13,8,'free',E'*And Abram said unto Lot, Let there be no strife, I pray thee, between me and thee, and between my herdmen and thy herdmen; for we be brethren* (Genesis 13:8). Abram disarms strife by naming the bond — *we be brethren*. At the fords of Jordan that naming is forgotten: Gilead and Ephraim, brothers within Yashar''el (Israel), fight (Judges 12:4), and the very word a man cannot frame becomes his death-sentence. The father''s wisdom unmade.'),
    ('canon','judges',12,6,'canon','matthew',12,25,'free',E'*And Yahusha (Jesus) knew their thoughts, and said unto them, Every kingdom divided against itself is brought to desolation; and every city or house divided against itself shall not stand* (Matthew 12:25). The Shibboleth slaughter — *there fell at that time of the Ephraimites forty and two thousand* (Judges 12:6) — is the house of Yashar''el (Israel) divided against itself, the doctrine of the divided kingdom written in blood before the kingdom is even formally torn. A house so divided cannot stand; it must be made one again (Ezekiel 37).'),
    ('canon','judges',12,6,'canon','1-kings',12,24,'free',E'*Thus saith Yahuah (LORD), Ye shall not go up, nor fight against your brethren the children of Yashar''el (Israel): return every man to his house; for this thing is from me* (1 Kings 12:24). When the kingdom is finally torn and Yahudah (Judah) musters to fight the northern tribes, Yahuah HIMSELF forbids the fratricide — *ye shall not... fight against your brethren*. The very thing Yahuah will forbid at the splitting of the houses is what already happened at the fords: *there fell... forty and two thousand* (Judges 12:6) of Ephraim, brother slain by brother for a word he could not say.'),
    ('canon','judges',12,4,'canon','james',4,1,'free',E'*From whence come wars and fightings among you? come they not hence, even of your lusts that war in your members?* (James 4:1). Jephthah''s war with Ephraim springs not from Ammon but from wounded pride within the camp — *the men of Gilead smote Ephraim, because they said, Ye Gileadites are fugitives of Ephraim* (Judges 12:4). The fighting comes from the lusts that war within the house, brother contending with brother over honour.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s345_jdg12_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s345_jdg12_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- T3 members reuse the cross_references rows below
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    ('canon','judges',12,7,'canon','judges',2,16,'free',E'*Nevertheless Yahuah (LORD) raised up judges, which delivered them out of the hand of those that spoiled them* (Judges 2:16). The book''s own summary of the whole pattern: Jephthah is one such raised-up deliverer — *And Jephthah judged Yashar''el (Israel) six years* (Judges 12:7) — and after him the line continues, Ibzan, Elon, Abdon, each raised up for a season of rest.'),
    ('canon','judges',12,8,'canon','judges',10,1,'free',E'*And after Abimelech there arose to defend Yashar''el (Israel) Tola the son of Puah... and he dwelt in Shamir in mount Ephraim* (Judges 10:1). The minor-judge formula — arose, judged, died, buried — repeated for the quieter deliverers. So *after him Ibzan of Beth-lehem judged Yashar''el (Israel)* (Judges 12:8), and Elon, and Abdon: the rest between the great battles, the years of peace recorded as plainly as the wars.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s345_jdg12_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s345_jdg12_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== threads =====
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judges-12-the-proud-strife-of-ephraim-the-soft-answer-they-would-not-give', E'The proud strife of Ephraim — the soft answer they would not give', E'Twice the proud tribe of Ephraim, the stick of Joseph, quarrels over not being *called* to the battle. To Gideon they came first: *Why hast thou served us thus, that thou calledst us not, when thou wentest to fight with the Midianites? And they did chide with him sharply* (Judges 8:1). Gideon turned the wrath with a soft word that set Ephraim above himself — *Is not the gleaning of the grapes of Ephraim better than the vintage of Abi-ezer?... Then their anger was abated toward him* (Judges 8:2-3). That is *a soft answer turneth away wrath* (Proverbs 15:1) lived out. Here to Jephthah they come with the same grievance and a worse threat — *Wherefore passedst thou over to fight against the children of Ammon... and didst not call us to go with thee? we will burn thine house upon thee with fire* (Judges 12:1). But no soft word turns this wrath; *the men of Gilead smote Ephraim* (Judges 12:4). *The beginning of strife is as when one letteth out water: therefore leave off contention, before it be meddled with* (Proverbs 17:14) — and the contention was not left off until forty-two thousand had fallen. The recurring pride of the proud tribe, and the soft answer they would not give.',
       sv.verse_id, ev.verse_id, 'free', 35925
  FROM _s345_jdg12_lookup sv, _s345_jdg12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=12 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='judges' AND ev.chapter_number=12 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judges-12-shibboleth-and-the-forty-two-thousand-brother-against-brother', E'Shibboleth, and the forty-two thousand — brother against brother', E'At the fords of Jordan the strife runs to slaughter. *And the men of Gilead smote Ephraim* (Judges 12:4) — brothers within Yashar''el (Israel) at war — and at the passages of Jordan the test of a single word: *Then said they unto him, Say now Shibboleth: and he said Sibboleth: for he could not frame to pronounce it right. Then they took him, and slew him at the passages of Jordan: and there fell at that time of the Ephraimites forty and two thousand* (Judges 12:6). A man slain by his brother for a word he could not say. Long before, Abram had disarmed strife by naming the bond: *Let there be no strife, I pray thee, between me and thee... for we be brethren* (Genesis 13:8) — the wisdom here forgotten. This is the house of Yashar''el (Israel) divided against itself, and *every... house divided against itself shall not stand* (Matthew 12:25); *from whence come wars and fightings among you? come they not hence, even of your lusts that war in your members?* (James 4:1). It is the wound of the divided house written in blood before the kingdom is even formally torn — and when it IS torn, and Yahudah (Judah) musters to fight the north, Yahuah Himself forbids the fratricide: *Thus saith Yahuah (LORD), Ye shall not go up, nor fight against your brethren the children of Yashar''el (Israel)... for this thing is from me* (1 Kings 12:24). The two-house framework grieves this slaughter of a brother-tribe; the healing is the two sticks made one stick again (Ezekiel 37).',
       sv.verse_id, ev.verse_id, 'free', 35928
  FROM _s345_jdg12_lookup sv, _s345_jdg12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=12 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='judges' AND ev.chapter_number=12 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judges-12-ibzan-elon-and-abdon-the-rest-between', E'Ibzan, Elon, and Abdon — the rest between', E'*And Jephthah judged Yashar''el (Israel) six years. Then died Jephthah the Gileadite* (Judges 12:7), and after him three quieter deliverers: *Ibzan of Beth-lehem... Elon, a Zebulonite... Abdon the son of Hillel, a Pirathonite* (Judges 12:8,11,13). The book has already named the pattern they fulfil: *Nevertheless Yahuah (LORD) raised up judges, which delivered them out of the hand of those that spoiled them* (Judges 2:16). Each is recorded in the same plain minor-judge formula as Tola before them — *after Abimelech there arose to defend Yashar''el (Israel) Tola the son of Puah... and he judged Yashar''el (Israel) twenty and three years, and died, and was buried* (Judges 10:1-2) — arose, judged, died, buried. These are the years of rest between the great battles, the peace recorded as faithfully as the wars, Yahuah''s mercy in raising up a deliverer for each generation.',
       sv.verse_id, ev.verse_id, 'free', 35931
  FROM _s345_jdg12_lookup sv, _s345_jdg12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=12 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='judges' AND ev.chapter_number=12 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- ===== thread_members =====
-- T1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Judges 8:1 — *Why hast thou served us thus, that thou calledst us not* — Ephraim''s identical grievance against Gideon a generation before.'
  FROM cross_reference_threads t
  JOIN _s345_jdg12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=12 AND sv.verse_number=1
  JOIN _s345_jdg12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=8 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-12-the-proud-strife-of-ephraim-the-soft-answer-they-would-not-give'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Judges 8:2-3 — Gideon''s soft answer *abated* Ephraim''s anger; the word that turned the wrath Jephthah''s strife would not turn.'
  FROM cross_reference_threads t
  JOIN _s345_jdg12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=12 AND sv.verse_number=4
  JOIN _s345_jdg12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=8 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-12-the-proud-strife-of-ephraim-the-soft-answer-they-would-not-give'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Proverbs 15:1 — *A soft answer turneth away wrath: but grievous words stir up anger* — the proverb Gideon kept and the fords broke.'
  FROM cross_reference_threads t
  JOIN _s345_jdg12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=12 AND sv.verse_number=4
  JOIN _s345_jdg12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=15 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-12-the-proud-strife-of-ephraim-the-soft-answer-they-would-not-give'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Proverbs 17:14 — *leave off contention, before it be meddled with* — the let-out water that ran to forty-two thousand fallen.'
  FROM cross_reference_threads t
  JOIN _s345_jdg12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=12 AND sv.verse_number=4
  JOIN _s345_jdg12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=17 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-12-the-proud-strife-of-ephraim-the-soft-answer-they-would-not-give'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- T2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Genesis 13:8 — *Let there be no strife... for we be brethren* — Abram disarms strife by naming the bond the fords forgot.'
  FROM cross_reference_threads t
  JOIN _s345_jdg12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=12 AND sv.verse_number=4
  JOIN _s345_jdg12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=13 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-12-shibboleth-and-the-forty-two-thousand-brother-against-brother'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'James 4:1 — *from whence come wars and fightings among you?* — the war that springs from wounded pride within the camp.'
  FROM cross_reference_threads t
  JOIN _s345_jdg12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=12 AND sv.verse_number=4
  JOIN _s345_jdg12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=4 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-12-shibboleth-and-the-forty-two-thousand-brother-against-brother'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Matthew 12:25 — *every... house divided against itself shall not stand* — the divided house of Yashar''el (Israel) written in blood at the fords.'
  FROM cross_reference_threads t
  JOIN _s345_jdg12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=12 AND sv.verse_number=6
  JOIN _s345_jdg12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=12 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-12-shibboleth-and-the-forty-two-thousand-brother-against-brother'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'1 Kings 12:24 — *Ye shall not... fight against your brethren the children of Yashar''el (Israel)* — the fratricide Yahuah will forbid at the splitting of the houses, already done here.'
  FROM cross_reference_threads t
  JOIN _s345_jdg12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=12 AND sv.verse_number=6
  JOIN _s345_jdg12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=12 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-12-shibboleth-and-the-forty-two-thousand-brother-against-brother'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- T3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Judges 2:16 — *Yahuah (LORD) raised up judges, which delivered them* — the book''s own naming of the pattern Jephthah and his successors fulfil.'
  FROM cross_reference_threads t
  JOIN _s345_jdg12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=12 AND sv.verse_number=7
  JOIN _s345_jdg12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=2 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-12-ibzan-elon-and-abdon-the-rest-between'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Judges 10:1 — *there arose to defend Yashar''el (Israel) Tola* — the same minor-judge formula (arose, judged, died, buried) that frames Ibzan, Elon, Abdon.'
  FROM cross_reference_threads t
  JOIN _s345_jdg12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=12 AND sv.verse_number=8
  JOIN _s345_jdg12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=10 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-12-ibzan-elon-and-abdon-the-rest-between'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_judges_13.sql (Judges 13) -----
--
-- Chapter: Judges 13 (the birth of Samson; the angel of Yahuah whose name is Wonderful)
-- Tag: jdg13   View: _s345_jdg13_lookup   Sort band: 35950,35953,35956,35959,35962
--
-- Judges 13 coverage:
--   v.1   (cycle: Yashar'el delivered to the Philistines forty years; the deliverer-sent)
--         NT:     none warranted
--         Extras: none warranted
--         Tanakh: Exodus 3:7-8 (I am come down to deliver); Judges 6:11-12 (the angel sent to raise a deliverer) -> THREAD 5
--   v.2-3 (Manoah's wife BARREN; the angel of Yahuah: thou shalt conceive and bear a son)
--         NT:     Luke 1:7,13 (Elisabeth barren, the son promised); Hebrews 11:11 (Sara received strength to conceive by faith) -> THREAD 1
--         Extras: none warranted
--         Tanakh: Genesis 18:10-14 (Sarah shall have a son); 1 Samuel 1:11,20 (Hannah's shut womb opened) -> THREAD 1
--   v.4-5 (the Nazarite unto Elohim from the womb -- no wine, no razor, no unclean -- shall BEGIN to deliver)
--         NT:     Luke 1:15 (John great, drink no wine nor strong drink, filled with the Spirit from the womb) -> THREAD 2
--         Extras: none warranted
--         Tanakh: Numbers 6:2-5,8 (the law of the Nazarite -- separated, no wine, no razor, holy unto Yahuah) -> THREAD 2
--   v.6-7 (a man of Elohim, his countenance like an angel of Elohim, very terrible; the Nazarite repeated) -> woven into THREAD 2/4
--   v.8-16 (Manoah intreats; the angel returns; offer the burnt offering unto Yahuah) -> woven into THREAD 4
--   v.17-18 (What is thy name? ... seeing it is SECRET = WONDERFUL/PELI)
--         NT:     none warranted (Isaiah 9:6 Wonderful itself is the NT-bearing fulfilment)
--         Extras: none warranted
--         Tanakh: Isaiah 9:6 (his name shall be called Wonderful); Genesis 32:29 (Jacob's wrestler: wherefore dost ask after my name?) -> THREAD 3
--   v.19-22 (the angel ascends in the flame of the altar; We shall surely die, we have SEEN ELOHIM)
--         NT:     none warranted
--         Extras: none warranted
--         Tanakh: Judges 6:22-23 (Gideon: I have seen an angel of Yahuah face to face); Exodus 33:20 (no man see me and live); Genesis 18:1-2 (Yahuah appeared, three men stood by him) -> THREAD 4
--   v.23   (his wife reasons: Yahuah would not have received the offering if to kill us) -> woven into THREAD 4
--   v.24-25 (Samson born, Yahuah blessed him; the Spirit of Yahuah BEGAN to move him) -> the barren womb opened (THREAD 1) + the deliverer begun (THREAD 5)
--
-- Threads (5):
--   judges-13-the-barren-womb-opened-thou-shalt-bear-a-son       [canon: Genesis, 1 Samuel, Luke, Hebrews]  free
--   judges-13-the-nazarite-from-the-womb-to-begin-to-deliver     [canon: Numbers, Luke]                      free
--   judges-13-the-angel-whose-name-is-wonderful-secret           [canon: Isaiah, Genesis]                    free
--   judges-13-we-have-seen-elohim-the-theophany-received         [canon: Judges, Exodus, Genesis]            free
--   judges-13-he-shall-begin-to-deliver-the-deliverer-sent       [canon: Exodus, Judges]                     free
--
-- Framework note on the angel "Wonderful": the angel of Yahuah of v.13-18 is NOT a created
-- angel and NOT a co-equal-trinity person -- he is the Formed Son who bears the Name. He receives
-- the burnt offering that must be offered "unto Yahuah" (v.16), he ascends IN the flame of the
-- altar (v.20), and Manoah confesses "we have seen ELOHIM" (v.22). When asked his name he answers
-- it is "secret" -- KJV for the Hebrew PELI, the very root of Isaiah 9:6's "Wonderful." The One
-- whose name is Wonderful is the same One who wrestled Jacob and would not tell his name
-- (Genesis 32:29), the visible Yahuah who later took on flesh -- Yahuah, and yet having a Father.

CREATE TEMP VIEW _s345_jdg13_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================ cross_references ============================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
  -- THREAD 1: the barren womb opened
  ('canon','judges',13,3,'canon','genesis',18,10,'free',E'*And he said, I will certainly return unto thee according to the time of life; and, lo, Sarah thy wife shall have a son* (Genesis 18:10). The angel of Yahuah comes to the barren wife of Manoah and says *thou shalt conceive, and bear a son* -- the same word of promise spoken to Sarah in her old age. The barren womb opened is Yahuah''s signature on the child of promise.'),
  ('canon','judges',13,3,'canon','genesis',18,14,'free',E'*Is any thing too hard for Yahuah (LORD)? At the time appointed I will return unto thee, according to the time of life, and Sarah shall have a son* (Genesis 18:14). Manoah''s wife *was barren, and bare not* -- yet *thou shalt conceive, and bear a son*. Nothing is too hard for Yahuah; the closed womb is His to open.'),
  ('canon','judges',13,3,'canon','1-samuel',1,11,'free',E'*O Yahuah Tseva''ot (LORD of hosts), if thou wilt indeed look on the affliction of thine handmaid... but wilt give unto thine handmaid a man child, then I will give him unto Yahuah (LORD) all the days of his life, and there shall no razor come upon his head* (1 Samuel 1:11). Hannah''s shut womb and her vowed Nazarite son are the very pattern of Manoah''s barren wife and her Nazarite child -- *no razor shall come on his head* (Judges 13:5).'),
  ('canon','judges',13,24,'canon','1-samuel',1,20,'free',E'*Wherefore it came to pass, when the time was come about after Hannah had conceived, that she bare a son, and called his name Samuel, saying, Because I have asked him of Yahuah (LORD)* (1 Samuel 1:20). As Hannah''s barren womb bore Samuel, so *the woman bare a son, and called his name Samson* (Judges 13:24) -- the child asked of Yahuah, set apart from the womb.'),
  ('canon','judges',13,2,'canon','luke',1,7,'free',E'*And they had no child, because that Elisabeth was barren, and they both were now well stricken in years* (Luke 1:7). Manoah''s *wife was barren, and bare not* (Judges 13:2) -- the same closed womb the angel will open. The barren-womb pattern runs from Sarah to Hannah to Elisabeth, every time the prelude to a child given for deliverance.'),
  ('canon','judges',13,3,'canon','luke',1,13,'free',E'*Fear not, Zacharias: for thy prayer is heard; and thy wife Elisabeth shall bear thee a son, and thou shalt call his name John* (Luke 1:13). As the angel of Yahuah tells Manoah''s barren wife *thou shalt conceive, and bear a son* (Judges 13:3), the angel tells Zacharias the same -- a son promised to a barren womb, set apart to prepare a people.'),
  ('canon','judges',13,3,'canon','hebrews',11,11,'free',E'*Through faith also Sara herself received strength to conceive seed, and was delivered of a child when she was past age, because she judged him faithful who had promised* (Hebrews 11:11). The barren womb that bears Samson stands in the same faith-roll: the One who promised is faithful, and the dead womb conceives because He spoke -- *thou shalt conceive, and bear a son* (Judges 13:3).'),

  -- THREAD 2: the Nazarite from the womb to begin to deliver
  ('canon','judges',13,5,'canon','numbers',6,2,'free',E'*When either man or woman shall separate themselves to vow a vow of a Nazarite, to separate themselves unto Yahuah (LORD)* (Numbers 6:2). Samson is *a Nazarite unto Elohim (God) from the womb* (Judges 13:5) -- not by his own later vow but set apart by Yahuah from conception, the law of the Nazarite written upon his life before his first breath.'),
  ('canon','judges',13,5,'canon','numbers',6,5,'free',E'*All the days of the vow of his separation there shall no razor come upon his head... he shall be holy, and shall let the locks of the hair of his head grow* (Numbers 6:5). *No razor shall come on his head* (Judges 13:5) -- the uncut hair is the visible sign of the Nazarite''s separation, the consecration of his Elohim upon his head.'),
  ('canon','judges',13,4,'canon','numbers',6,3,'free',E'*He shall separate himself from wine and strong drink, and shall drink no vinegar of wine... neither shall he drink any liquor of grapes, nor eat moist grapes, or dried* (Numbers 6:3). The angel charges the mother *drink not wine nor strong drink, and eat not any unclean thing* (Judges 13:4) -- the Nazarite separation begins in the womb, the mother keeping it for the child she carries.'),
  ('canon','judges',13,7,'canon','numbers',6,8,'free',E'*All the days of his separation he is holy unto Yahuah (LORD)* (Numbers 6:8). *The child shall be a Nazarite to Elohim (God) from the womb to the day of his death* (Judges 13:7) -- a lifelong, womb-to-grave separation, holy unto Yahuah every day.'),
  ('canon','judges',13,5,'canon','luke',1,15,'free',E'*For he shall be great in the sight of Yahuah (Lord), and shall drink neither wine nor strong drink; and he shall be filled with the Ruach HaKodesh (Holy Spirit), even from his mother''s womb* (Luke 1:15). John the Baptist is the Nazarite-deliverer answering Samson''s pattern -- set apart from the womb, no wine, the Spirit upon him -- a child given to *begin to deliver Yashar''el (Israel)* (Judges 13:5) by turning the hearts of the people.'),

  -- THREAD 3: the angel whose name is Wonderful / secret
  ('canon','judges',13,18,'canon','isaiah',9,6,'free',E'*For unto us a child is born, unto us a son is given... and his name shall be called Wonderful, Counsellor, El Gibbor (The mighty God), Avi-ad (The everlasting Father), Sar Shalom (The Prince of Peace)* (Isaiah 9:6). When Manoah asks the angel his name, the answer is *Why askest thou thus after my name, seeing it is secret?* (Judges 13:18) -- KJV "secret" is PELI, the very word Isaiah renders "Wonderful." The angel of Yahuah whose name is Wonderful is the Formed Son who bears the Name.'),
  ('canon','judges',13,17,'canon','genesis',32,29,'free',E'*And Jacob asked him, and said, Tell me, I pray thee, thy name. And he said, Wherefore is it that thou dost ask after my name? And he blessed him there* (Genesis 32:29). Manoah asks *What is thy name?* (Judges 13:17) and the angel answers exactly as the One who wrestled Jacob did -- *Wherefore... dost ask after my name?* The same visible Yahuah, the Formed Son, who will not surrender His Name to a man but blesses him.'),
  ('canon','judges',13,22,'canon','genesis',32,29,'free',E'*And Jacob asked him, and said, Tell me, I pray thee, thy name. And he said, Wherefore is it that thou dost ask after my name? And he blessed him there* (Genesis 32:29). Jacob called that place Peniel, *for I have seen Elohim (God) face to face, and my life is preserved* -- the same confession Manoah makes, *we have seen Elohim (God)* (Judges 13:22). The wrestler and the angel of the flame are the one Formed Son seen face to face.'),

  -- THREAD 4: we have seen Elohim -- the theophany received
  ('canon','judges',13,22,'canon','judges',6,22,'free',E'*And when Gideon perceived that he was an angel of Yahuah (LORD), Gideon said, Alas, O Yahuah (Lord) GOD! for because I have seen an angel of Yahuah (LORD) face to face* (Judges 6:22). Manoah''s dread, *We shall surely die, because we have seen Elohim (God)* (Judges 13:22), is Gideon''s dread -- to see the angel of Yahuah, the visible Elohim, was thought to be death for a man.'),
  ('canon','judges',13,22,'canon','judges',6,23,'free',E'*And Yahuah (LORD) said unto him, Peace be unto thee; fear not: thou shalt not die* (Judges 6:23). Where Yahuah Himself reassures Gideon, Manoah''s wife reasons the same comfort: *If Yahuah (LORD) were pleased to kill us, he would not have received a burnt offering and a meat offering at our hands* (Judges 13:23) -- the offering received is the pledge they shall not die.'),
  ('canon','judges',13,22,'canon','exodus',33,20,'free',E'*And he said, Thou canst not see my face: for there shall no man see me, and live* (Exodus 33:20). Manoah''s fear -- *We shall surely die, because we have seen Elohim (God)* (Judges 13:22) -- rests on this very word; yet the angel of Yahuah, the Formed Son, may be seen and his witnesses live, the Face of the Father veiled in the One who bears the Name.'),
  ('canon','judges',13,20,'canon','genesis',18,1,'free',E'*And Yahuah (LORD) appeared unto him in the plains of Mamre: and he sat in the tent door in the heat of the day* (Genesis 18:1). As Yahuah appeared to Abraham as a man who ate at his table, the angel of Yahuah appears to Manoah, receives the offering, and *ascended in the flame of the altar* (Judges 13:20) -- the visible Yahuah received, the theophany of the Formed Son.'),

  -- THREAD 5: he shall begin to deliver -- the deliverer sent in the cycle
  ('canon','judges',13,1,'canon','exodus',3,7,'free',E'*And Yahuah (LORD) said, I have surely seen the affliction of my people which are in Egypt, and have heard their cry... for I know their sorrows* (Exodus 3:7). *Yahuah (LORD) delivered them into the hand of the Philistines forty years* (Judges 13:1) -- the same covenant pattern: the people in bondage, Yahuah moving to raise up a deliverer, the angel of Yahuah appearing to call him forth.'),
  ('canon','judges',13,5,'canon','exodus',3,8,'free',E'*And I am come down to deliver them out of the hand of the Egyptians, and to bring them up out of that land unto a good land and a large* (Exodus 3:8). The angel promises the child *shall begin to deliver Yashar''el (Israel) out of the hand of the Philistines* (Judges 13:5) -- Yahuah coming down to deliver, here through a Nazarite raised up from a barren womb.'),
  ('canon','judges',13,5,'canon','judges',6,12,'free',E'*And the angel of Yahuah (LORD) appeared unto him, and said unto him, Yahuah (LORD) is with thee, thou mighty man of valour* (Judges 6:12). As the angel of Yahuah came to Gideon to raise a deliverer against Midian, the same angel comes to Manoah''s house to set apart Samson, who *shall begin to deliver Yashar''el (Israel)* (Judges 13:5) -- one Sender, one pattern of rescue.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s345_jdg13_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s345_jdg13_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================ threads ============================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judges-13-the-barren-womb-opened-thou-shalt-bear-a-son',
       E'The barren womb opened: thou shalt conceive, and bear a son',
       E'Manoah''s *wife was barren, and bare not* (Judges 13:2) -- and the angel of Yahuah comes to her with the oldest promise in the canon: *Behold now, thou art barren, and bearest not: but thou shalt conceive, and bear a son* (Judges 13:3). This is the signature of Yahuah on the child of promise: the closed womb that He alone opens.\n\nIt is Sarah''s word exactly -- *lo, Sarah thy wife shall have a son* (Genesis 18:10) -- for *Is any thing too hard for Yahuah (LORD)?* (Genesis 18:14). And the New Testament reads Sarah''s barren womb as faith: *Through faith also Sara herself received strength to conceive seed... because she judged him faithful who had promised* (Hebrews 11:11).\n\nIt is Hannah''s word, who vowed her son a Nazarite from a shut womb -- *give unto thine handmaid a man child... and there shall no razor come upon his head* (1 Samuel 1:11) -- and *bare a son, and called his name Samuel, saying, Because I have asked him of Yahuah (LORD)* (1 Samuel 1:20). So *the woman bare a son, and called his name Samson* (Judges 13:24).\n\nAnd it is Elisabeth''s word: she *was barren, and they both were now well stricken in years* (Luke 1:7), until the angel said *thy wife Elisabeth shall bear thee a son, and thou shalt call his name John* (Luke 1:13). Every time the barren womb is opened, the child given is a deliverer set apart -- Isaac, Samuel, Samson, John -- the pattern Yahuah keeps until the Seed Himself is born.',
       sv.verse_id, ev.verse_id, 'free', 35950
  FROM _s345_jdg13_lookup sv, _s345_jdg13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=13 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='judges' AND ev.chapter_number=13 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judges-13-the-nazarite-from-the-womb-to-begin-to-deliver',
       E'The Nazarite from the womb to begin to deliver Yashar''el',
       E'The child is consecrated before he is conceived: *no razor shall come on his head: for the child shall be a Nazarite unto Elohim (God) from the womb: and he shall begin to deliver Yashar''el (Israel) out of the hand of the Philistines* (Judges 13:5). Even the mother must keep the separation for him -- *drink not wine nor strong drink, and eat not any unclean thing* (Judges 13:4) -- *from the womb to the day of his death* (Judges 13:7).\n\nThis is the law of the Nazarite of Numbers 6, but reversed: not a vow a man takes upon himself, but a separation Yahuah lays upon a life from the womb. *When either man or woman shall separate themselves to vow a vow of a Nazarite, to separate themselves unto Yahuah (LORD)* (Numbers 6:2); *He shall separate himself from wine and strong drink... neither shall he drink any liquor of grapes* (Numbers 6:3); *there shall no razor come upon his head... he shall be holy, and shall let the locks of the hair of his head grow* (Numbers 6:5); *all the days of his separation he is holy unto Yahuah (LORD)* (Numbers 6:8).\n\nSamson is to *begin* to deliver -- the first stroke of a rescue finished by another. The Nazarite-deliverer set apart from the womb finds his clearest echo in John the Baptist: *he shall be great in the sight of Yahuah (Lord), and shall drink neither wine nor strong drink; and he shall be filled with the Ruach HaKodesh (Holy Spirit), even from his mother''s womb* (Luke 1:15) -- the forerunner who begins to turn the people, that the Greater Deliverer may finish.',
       sv.verse_id, ev.verse_id, 'free', 35953
  FROM _s345_jdg13_lookup sv, _s345_jdg13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=13 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='judges' AND ev.chapter_number=13 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judges-13-the-angel-whose-name-is-wonderful-secret',
       E'The angel whose name is Wonderful: why askest thou after my name, seeing it is secret?',
       E'Manoah asks the angel of Yahuah, *What is thy name, that when thy sayings come to pass we may do thee honour?* (Judges 13:17). The answer carries the whole Christology of the chapter: *Why askest thou thus after my name, seeing it is secret?* (Judges 13:18). The KJV "secret" renders the Hebrew PELI -- the very root of the name Isaiah gives the coming child: *For unto us a child is born, unto us a son is given... and his name shall be called Wonderful, Counsellor, El Gibbor (The mighty God), Avi-ad (The everlasting Father), Sar Shalom (The Prince of Peace)* (Isaiah 9:6).\n\nThe angel of Yahuah whose name is Wonderful is no created messenger and no co-equal second person -- he is the Formed Son who bears the Name, the visible Yahuah who has a Father. He answers Manoah word for word as he answered Jacob at the Jabbok: *Tell me, I pray thee, thy name. And he said, Wherefore is it that thou dost ask after my name? And he blessed him there* (Genesis 32:29). The One who wrestled the patriarch and would not surrender His Name, the One Jacob said he had seen *face to face*, is the One who ascends in Manoah''s altar-flame. The Name is withheld because it is the Name itself -- *Wonderful* -- borne by the Formed Son who will one day take on flesh.',
       sv.verse_id, ev.verse_id, 'free', 35956
  FROM _s345_jdg13_lookup sv, _s345_jdg13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=13 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='judges' AND ev.chapter_number=13 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judges-13-we-have-seen-elohim-the-theophany-received',
       E'We have seen Elohim: the angel ascends in the flame, the theophany received',
       E'When Manoah offers the kid upon the rock, *the angel did wondrously; and Manoah and his wife looked on* (Judges 13:19), and *when the flame went up toward heaven from off the altar... the angel of Yahuah (LORD) ascended in the flame of the altar* (Judges 13:20). They fall on their faces, and Manoah says, *We shall surely die, because we have seen Elohim (God)* (Judges 13:22).\n\nThis is the dread every man feels who sees the angel of Yahuah. Gideon said it in the chapter before: *Alas, O Yahuah (Lord) GOD! for because I have seen an angel of Yahuah (LORD) face to face* (Judges 6:22) -- and Yahuah answered, *Peace be unto thee; fear not: thou shalt not die* (Judges 6:23). It rests on the word given to Moses: *Thou canst not see my face: for there shall no man see me, and live* (Exodus 33:20). Yet the angel of Yahuah, the Formed Son, may be seen and his witnesses live, as Yahuah was seen by Abraham at the oaks -- *And Yahuah (LORD) appeared unto him in the plains of Mamre* (Genesis 18:1) -- and ate at his table.\n\nManoah''s wife reasons the comfort rightly: *If Yahuah (LORD) were pleased to kill us, he would not have received a burnt offering and a meat offering at our hands, neither would he have shewed us all these things* (Judges 13:23). The offering received, the angel ascending in its flame -- the visible Yahuah received their worship, the theophany of the One who bears the Name.',
       sv.verse_id, ev.verse_id, 'free', 35959
  FROM _s345_jdg13_lookup sv, _s345_jdg13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=13 AND sv.verse_number=20
   AND ev.edition_slug='canon' AND ev.book_slug='judges' AND ev.chapter_number=13 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judges-13-he-shall-begin-to-deliver-the-deliverer-sent',
       E'He shall begin to deliver: the deliverer sent in the cycle of bondage',
       E'The chapter opens in the well-worn cycle of the Judges: *And the children of Yashar''el (Israel) did evil again in the sight of Yahuah (LORD); and Yahuah (LORD) delivered them into the hand of the Philistines forty years* (Judges 13:1). Yet even before the people cry out, Yahuah is already moving to raise a deliverer -- the angel of Yahuah appears to a barren woman to call forth a child who *shall begin to deliver Yashar''el (Israel) out of the hand of the Philistines* (Judges 13:5).\n\nThis is the same covenant pattern Yahuah set at the bush: *I have surely seen the affliction of my people which are in Egypt, and have heard their cry by reason of their taskmasters; for I know their sorrows* (Exodus 3:7); *And I am come down to deliver them out of the hand of the Egyptians, and to bring them up out of that land unto a good land and a large* (Exodus 3:8). Yahuah comes down to deliver -- by a Moses, by a Nazarite raised from a closed womb.\n\nAnd it is the very work the same angel of Yahuah did one chapter before, raising Gideon against Midian: *And the angel of Yahuah (LORD) appeared unto him, and said unto him, Yahuah (LORD) is with thee, thou mighty man of valour* (Judges 6:12). One Sender, one pattern of rescue -- the angel of Yahuah appearing to call the deliverer forth, until the Spirit of Yahuah *began to move* the child He had set apart (Judges 13:25).',
       sv.verse_id, ev.verse_id, 'free', 35962
  FROM _s345_jdg13_lookup sv, _s345_jdg13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=13 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='judges' AND ev.chapter_number=13 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- ============================ thread_members ============================
-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Genesis 18:10 -- *lo, Sarah thy wife shall have a son*: the same word the angel speaks to Manoah''s barren wife.'
  FROM cross_reference_threads t
  JOIN _s345_jdg13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=13 AND sv.verse_number=3
  JOIN _s345_jdg13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=18 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-13-the-barren-womb-opened-thou-shalt-bear-a-son'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Genesis 18:14 -- *Is any thing too hard for Yahuah?*: the closed womb is His to open.'
  FROM cross_reference_threads t
  JOIN _s345_jdg13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=13 AND sv.verse_number=3
  JOIN _s345_jdg13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=18 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-13-the-barren-womb-opened-thou-shalt-bear-a-son'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'1 Samuel 1:11 -- Hannah''s shut womb, her vowed Nazarite son *there shall no razor come upon his head*: the Samson pattern.'
  FROM cross_reference_threads t
  JOIN _s345_jdg13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=13 AND sv.verse_number=3
  JOIN _s345_jdg13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=1 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-13-the-barren-womb-opened-thou-shalt-bear-a-son'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'1 Samuel 1:20 -- Hannah *bare a son, and called his name Samuel*: as the woman *bare a son, and called his name Samson*.'
  FROM cross_reference_threads t
  JOIN _s345_jdg13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=13 AND sv.verse_number=24
  JOIN _s345_jdg13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=1 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-13-the-barren-womb-opened-thou-shalt-bear-a-son'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Luke 1:7 -- *Elisabeth was barren*: the same closed womb the angel will open, prelude to a deliverer.'
  FROM cross_reference_threads t
  JOIN _s345_jdg13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=13 AND sv.verse_number=2
  JOIN _s345_jdg13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-13-the-barren-womb-opened-thou-shalt-bear-a-son'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'Luke 1:13 -- *thy wife Elisabeth shall bear thee a son*: the angel''s promise of a son to a barren womb.'
  FROM cross_reference_threads t
  JOIN _s345_jdg13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=13 AND sv.verse_number=3
  JOIN _s345_jdg13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-13-the-barren-womb-opened-thou-shalt-bear-a-son'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'Hebrews 11:11 -- *Sara herself received strength to conceive... because she judged him faithful who had promised*: the barren womb is faith.'
  FROM cross_reference_threads t
  JOIN _s345_jdg13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=13 AND sv.verse_number=3
  JOIN _s345_jdg13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-13-the-barren-womb-opened-thou-shalt-bear-a-son'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Numbers 6:2 -- the law of the Nazarite, *to separate themselves unto Yahuah*: Samson set apart from the womb, not by his own vow.'
  FROM cross_reference_threads t
  JOIN _s345_jdg13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=13 AND sv.verse_number=5
  JOIN _s345_jdg13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=6 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-13-the-nazarite-from-the-womb-to-begin-to-deliver'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Numbers 6:5 -- *there shall no razor come upon his head*: the uncut hair, the visible sign of separation.'
  FROM cross_reference_threads t
  JOIN _s345_jdg13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=13 AND sv.verse_number=5
  JOIN _s345_jdg13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=6 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-13-the-nazarite-from-the-womb-to-begin-to-deliver'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Numbers 6:3 -- *separate himself from wine and strong drink*: the charge the angel lays on the mother for the child she carries.'
  FROM cross_reference_threads t
  JOIN _s345_jdg13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=13 AND sv.verse_number=4
  JOIN _s345_jdg13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=6 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-13-the-nazarite-from-the-womb-to-begin-to-deliver'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Numbers 6:8 -- *all the days of his separation he is holy unto Yahuah*: from the womb to the day of his death.'
  FROM cross_reference_threads t
  JOIN _s345_jdg13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=13 AND sv.verse_number=7
  JOIN _s345_jdg13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=6 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-13-the-nazarite-from-the-womb-to-begin-to-deliver'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Luke 1:15 -- John great, *drink neither wine nor strong drink... filled with the Spirit from his mother''s womb*: the Nazarite-deliverer who begins the turning.'
  FROM cross_reference_threads t
  JOIN _s345_jdg13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=13 AND sv.verse_number=5
  JOIN _s345_jdg13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-13-the-nazarite-from-the-womb-to-begin-to-deliver'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Isaiah 9:6 -- *his name shall be called Wonderful*: the same PELI the KJV renders "secret" in the angel''s answer; the Formed Son who bears the Name.'
  FROM cross_reference_threads t
  JOIN _s345_jdg13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=13 AND sv.verse_number=18
  JOIN _s345_jdg13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=9 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-13-the-angel-whose-name-is-wonderful-secret'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Genesis 32:29 -- *Wherefore is it that thou dost ask after my name?*: the wrestler answers Manoah''s question word for word; one Formed Son.'
  FROM cross_reference_threads t
  JOIN _s345_jdg13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=13 AND sv.verse_number=17
  JOIN _s345_jdg13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=32 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-13-the-angel-whose-name-is-wonderful-secret'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Genesis 32:29 -- Jacob saw Elohim *face to face* at Peniel, the same confession as *we have seen Elohim*: the visible Yahuah seen and the witness preserved.'
  FROM cross_reference_threads t
  JOIN _s345_jdg13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=13 AND sv.verse_number=22
  JOIN _s345_jdg13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=32 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-13-the-angel-whose-name-is-wonderful-secret'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Judges 6:22 -- Gideon: *I have seen an angel of Yahuah face to face*: the same dread as Manoah''s *we have seen Elohim*.'
  FROM cross_reference_threads t
  JOIN _s345_jdg13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=13 AND sv.verse_number=22
  JOIN _s345_jdg13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=6 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-13-we-have-seen-elohim-the-theophany-received'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Judges 6:23 -- *fear not: thou shalt not die*: Yahuah''s comfort to Gideon, the comfort Manoah''s wife reasons from the offering received.'
  FROM cross_reference_threads t
  JOIN _s345_jdg13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=13 AND sv.verse_number=22
  JOIN _s345_jdg13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=6 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-13-we-have-seen-elohim-the-theophany-received'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Exodus 33:20 -- *there shall no man see me, and live*: the word Manoah''s fear rests on; yet the Formed Son may be seen.'
  FROM cross_reference_threads t
  JOIN _s345_jdg13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=13 AND sv.verse_number=22
  JOIN _s345_jdg13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=33 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-13-we-have-seen-elohim-the-theophany-received'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Genesis 18:1 -- *Yahuah appeared unto him in the plains of Mamre*: the visible Yahuah received at Abraham''s table, as the angel ascends in Manoah''s altar-flame.'
  FROM cross_reference_threads t
  JOIN _s345_jdg13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=13 AND sv.verse_number=20
  JOIN _s345_jdg13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=18 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-13-we-have-seen-elohim-the-theophany-received'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Exodus 3:7 -- *I have surely seen the affliction of my people... I know their sorrows*: the covenant pattern behind the forty-year bondage.'
  FROM cross_reference_threads t
  JOIN _s345_jdg13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=13 AND sv.verse_number=1
  JOIN _s345_jdg13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=3 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-13-he-shall-begin-to-deliver-the-deliverer-sent'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Exodus 3:8 -- *I am come down to deliver them*: Yahuah coming down to deliver, here through a Nazarite raised from a barren womb.'
  FROM cross_reference_threads t
  JOIN _s345_jdg13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=13 AND sv.verse_number=5
  JOIN _s345_jdg13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=3 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-13-he-shall-begin-to-deliver-the-deliverer-sent'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Judges 6:12 -- the angel of Yahuah appears to Gideon to raise a deliverer: the same Sender comes to Manoah''s house for Samson.'
  FROM cross_reference_threads t
  JOIN _s345_jdg13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=13 AND sv.verse_number=5
  JOIN _s345_jdg13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=6 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-13-he-shall-begin-to-deliver-the-deliverer-sent'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_judges_14.sql (Judges 14) -----
-- Chapter: Judges 14 — THE HIDDEN PROVIDENCE AND THE RIDDLE OF SWEETNESS: Samson desires a
--          PHILISTINE woman of Timnath — *get her for me; for she pleaseth me well* (14:3); ★ but
--          *his father and his mother knew not that it was of Yahuah, that he sought an occasion
--          against the Philistines* (14:4) — the secret providence working even through Samson's
--          flawed desire to begin Yashar'el's deliverance; ★ on the way the SPIRIT OF YAHUAH comes
--          mightily upon him and he RENDS a young LION as a kid, *nothing in his hand* (14:5-6);
--          later he finds HONEY in the lion's carcase and eats (14:8-9); ★★ the RIDDLE at the
--          feast — *Out of the eater came forth meat, and out of the strong came forth sweetness*
--          (14:14) — the faint type readers feel: life and sweetness brought forth out of the
--          slain strong one, the devourer overcome; the Philistines threaten the wife, she weeps
--          out the answer (14:15-18); ★ the Spirit comes again and he slays thirty at Ashkelon
--          (14:19) — the occasion against the Philistines begun.
-- Tag: jdg14   View: _s345_jdg14_lookup   Sort band: 35975, 35978, 35981
--
-- Judges 14 coverage:
--   v.1-4  (Samson desires a Philistine of Timnath; his parents object — *the uncircumcised
--           Philistines*; ★ *his father and his mother knew not that it was of Yahuah, that he
--           sought an occasion against the Philistines: for at that time the Philistines had
--           dominion over Yashar'el*)
--          NT:     Romans 11:33 (*O the depth of the riches both of the wisdom and knowledge of
--                  Elohim! how unsearchable are his judgments, and his ways past finding out!*) —
--                  the hidden providence working His purpose even through a flawed desire
--          Extras: none warranted
--          Tanakh: Judges 13:5 (*he shall begin to deliver Yashar'el out of the hand of the
--                  Philistines*) — the providence of 14:4 is the appointed deliverance begun;
--                  Genesis 50:20 (*ye thought evil against me; but Elohim meant it unto good*) —
--                  the same secret over-ruling
--   v.5-6  (★ the SPIRIT OF YAHUAH came mightily upon him; he RENT the young lion as a kid,
--           *nothing in his hand*)
--          NT:     none warranted at the verse (the Spirit-empowerment is a Tanakh weave)
--          Extras: none warranted
--          Tanakh: Judges 13:25 (*the Spirit of Yahuah began to move him*), Judges 15:14 (*the
--                  Spirit of Yahuah came mightily upon him* — the same word, the bands as burnt
--                  flax), 1 Samuel 11:6 (*the Spirit of Elohim came upon Saul... and his anger was
--                  kindled*), Proverbs 30:30 (*A lion which is strongest among beasts*)
--   v.8-9, 14, 18  (★★ honey in the lion's carcase; the riddle *Out of the eater came forth meat,
--           and out of the strong came forth sweetness*; *What is sweeter than honey? and what is
--           stronger than a lion?*)
--          NT:     John 12:24 (*Except a corn of wheat fall into the ground and die, it abideth
--                  alone: but if it die, it bringeth forth much fruit*), 1 Corinthians 15:54
--                  (*Death is swallowed up in victory*), 1 Corinthians 15:55 (*O death, where is
--                  thy sting? O grave, where is thy victory?*)
--          Extras: none warranted (no clean witness; the type is carried by the NT weave)
--          Tanakh: Proverbs 30:30 (*A lion which is strongest among beasts, and turneth not away
--                  for any*) — the strong one out of whom the sweetness came
--   v.10-13, 15-17, 20  (the feast, the wager, the wife enticed and weeping, the answer given)
--          NT/Extras/Tanakh: none warranted — narrative carried inside the riddle thread
--   v.19   (★ the Spirit came again; he slew thirty at Ashkelon, took their spoil, paid the wager)
--          NT:     none warranted at the verse
--          Extras: none warranted
--          Tanakh: Judges 13:5 (*he shall begin to deliver Yashar'el*) — the occasion against the
--                  Philistines (14:4) now begun in deed; carried in Thread 1 and Thread 2
--
-- Threads:
--   judges-14-it-was-of-yahuah-the-hidden-occasion-against-the-philistines   [Tanakh: Judges, Genesis | NT: Romans]   (free)
--   judges-14-the-spirit-came-mightily-and-he-rent-the-lion                  [Tanakh: Judges, 1 Samuel, Proverbs]      (free)
--   judges-14-out-of-the-strong-came-forth-sweetness                         [Tanakh: Proverbs | NT: John, 1 Corinthians] (free)
--
-- Framework notes: ★ The keystone of the chapter is 14:4 — *his father and his mother knew not
-- that it was of Yahuah, that he sought an occasion against the Philistines*. Samson's desire for
-- the Timnite is flawed (his parents rightly object — *the uncircumcised Philistines*, 14:3), yet
-- Yahuah is secretly over-ruling it to begin the deliverance the Angel promised at his birth, *he
-- shall begin to deliver Yashar'el out of the hand of the Philistines* (Judges 13:5). This is the
-- same hidden providence Yoseph named — *ye thought evil against me; but Elohim meant it unto good*
-- (Genesis 50:20) — and the depth Paul adored, *how unsearchable are his judgments, and his ways
-- past finding out* (Romans 11:33). ★ The Spirit-empowered strength: *the Spirit of Yahuah came
-- mightily upon him, and he rent him as he would have rent a kid, and he had nothing in his hand*
-- (14:6) — the same Spirit that began to move him (13:25), that comes mightily again at Lehi
-- (15:14), the same Spirit that came on Saul (1 Sam 11:6); the lion is the strongest among beasts
-- (Prov 30:30), and it is rent bare-handed. ★★ The riddle is the faint type readers feel: out of
-- the slain strong one — the lion, the eater, the devourer — comes meat and sweetness; *Out of the
-- eater came forth meat, and out of the strong came forth sweetness* (14:14). The corn of wheat
-- must die to bring forth fruit (John 12:24); death itself is swallowed up in victory, its sting
-- and the grave's victory undone (1 Cor 15:54-55). Life and sweetness brought forth out of death,
-- the devourer overcome — the pattern the whole library carries to its consummation. All members
-- canon → every thread tier_required 'free'.

CREATE TEMP VIEW _s345_jdg14_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: ★ "it was of Yahuah" — the hidden occasion against the Philistines (Judges / Genesis / Romans)
    ('canon','judges',14,4,'canon','judges',13,5,'free',E'*For, lo, thou shalt conceive, and bear a son; and no razor shall come on his head: for the child shall be a Nazarite unto Elohim (God) from the womb: and he shall begin to deliver Yashar''el (Israel) out of the hand of the Philistines* (Judges 13:5). The Angel''s word at Samson''s birth is the key to the secret of 14:4 — *it was of Yahuah (LORD), that he sought an occasion against the Philistines*. The flawed desire for the Timnite is the very hinge Yahuah uses to begin the deliverance He appointed before the boy was born.'),
    ('canon','judges',14,4,'canon','genesis',50,20,'free',E'*But as for you, ye thought evil against me; but Elohim (God) meant it unto good, to bring to pass, as it is this day, to save much people alive* (Genesis 50:20). Yoseph names the same hidden over-ruling that runs beneath 14:4 — *his father and his mother knew not that it was of Yahuah (LORD)*. What looks like Samson''s own wayward want is Yahuah secretly meaning it unto good: the occasion against the Philistines, the saving of His people, worked through a thing the actors themselves did not understand.'),
    ('canon','judges',14,4,'canon','romans',11,33,'free',E'*O the depth of the riches both of the wisdom and knowledge of Elohim (God)! how unsearchable are his judgments, and his ways past finding out!* (Romans 11:33). Paul''s cry is the only fit response to 14:4 — *his father and his mother knew not that it was of Yahuah (LORD), that he sought an occasion against the Philistines*. The providence that bends even a flawed desire to begin His people''s deliverance is past finding out; the parents did not know, and could not, that Yahuah was at work in it.'),
    -- THREAD 2: ★ the Spirit came mightily and he rent the lion (Judges / 1 Samuel / Proverbs)
    ('canon','judges',14,6,'canon','judges',13,25,'free',E'*And the Spirit of Yahuah (LORD) began to move him at times in the camp of Dan between Zorah and Eshtaol* (Judges 13:25). The stirring that began in the camp of Dan now breaks out in full strength: *And the Spirit of Yahuah (LORD) came mightily upon him, and he rent him as he would have rent a kid* (14:6). The same Spirit that first moved him is the Spirit that rends the lion — the gift, not the man, is the strength.'),
    ('canon','judges',14,6,'canon','judges',15,14,'free',E'*And when he came unto Lehi, the Philistines shouted against him: and the Spirit of Yahuah (LORD) came mightily upon him, and the cords that were upon his arms became as flax that was burnt with fire, and his bands loosed from off his hands* (Judges 15:14). The same words return at Lehi as here at Timnath — *the Spirit of Yahuah (LORD) came mightily upon him* (14:6). What rends the lion bare-handed is what burns the new cords like flax: the strength is always the Spirit coming mightily, never Samson''s arm alone.'),
    ('canon','judges',14,6,'canon','1-samuel',11,6,'free',E'*And the Spirit of Elohim (God) came upon Saul when he heard those tidings, and his anger was kindled greatly* (1 Samuel 11:6). The Spirit that came mightily on Samson to rend the lion (14:6) is the same Spirit that came upon Saul to deliver Jabesh-gilead — the deliverer-stirring that raised up Yashar''el''s saviours, the empowering for the work that no man could do of himself.'),
    ('canon','judges',14,6,'canon','proverbs',30,30,'free',E'*A lion which is strongest among beasts, and turneth not away for any* (Proverbs 30:30). The proverb names exactly what Samson faced — the strongest among beasts, that turns away for nothing — and the wonder of 14:6 is that he *rent him as he would have rent a kid, and he had nothing in his hand*. The strongest of beasts is torn like a young goat, bare-handed, because the Spirit of Yahuah came mightily upon him.'),
    -- THREAD 3: ★★ out of the strong came forth sweetness (Proverbs / John / 1 Corinthians)
    ('canon','judges',14,14,'canon','proverbs',30,30,'free',E'*A lion which is strongest among beasts, and turneth not away for any* (Proverbs 30:30). The riddle turns on this very strength: *Out of the eater came forth meat, and out of the strong came forth sweetness* (14:14) — and the men answer *what is stronger than a lion?* (14:18). The strongest among beasts is the *strong* of the riddle, the slain devourer out of whose carcase the honey came.'),
    ('canon','judges',14,14,'canon','john',12,24,'free',E'*Verily, verily, I say unto you, Except a corn of wheat fall into the ground and die, it abideth alone: but if it die, it bringeth forth much fruit* (John 12:24). Samson''s riddle carries the faint shape of this law: *Out of the eater came forth meat, and out of the strong came forth sweetness* (14:14). Out of death comes food; out of the slain strong one comes the sweetness — the corn of wheat that must die to bring forth fruit, life drawn out of the very place of death.'),
    ('canon','judges',14,14,'canon','1-corinthians',15,54,'free',E'*So when this corruptible shall have put on incorruption, and this mortal shall have put on immortality, then shall be brought to pass the saying that is written, Death is swallowed up in victory* (1 Corinthians 15:54). The riddle''s sweetness out of the strong (14:14) is a far-off whisper of this: the eater devoured, the devourer overcome, *death... swallowed up in victory*. Out of the slain lion comes honey; out of death itself comes the swallowing-up of death.'),
    ('canon','judges',14,14,'canon','1-corinthians',15,55,'free',E'*O death, where is thy sting? O grave, where is thy victory?* (1 Corinthians 15:55). The faint type readers feel in 14:14 — *out of the strong came forth sweetness* — opens here in full: the strong one, the eater, the grave, is itself robbed of its victory and its sting. The honey in the lion''s carcase is the smallest seed of this great undoing, life and sweetness brought forth out of the conquered devourer.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s345_jdg14_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s345_jdg14_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judges-14-it-was-of-yahuah-the-hidden-occasion-against-the-philistines',
       E'It Was of Yahuah — The Hidden Occasion Against the Philistines',
       E'Samson goes down to Timnath, sees a daughter of the Philistines, and tells his father and mother, *now therefore get her for me to wife* (14:2). His parents object rightly — *Is there never a woman among the daughters of thy brethren, or among all my people, that thou goest to take a wife of the uncircumcised Philistines?* (14:3) — and Samson presses on regardless: *Get her for me; for she pleaseth me well* (14:3). The desire is flawed, the parents are not wrong to grieve it. And yet the verse that follows opens the secret of the whole chapter: *But his father and his mother knew not that it was of Yahuah (LORD), that he sought an occasion against the Philistines: for at that time the Philistines had dominion over Yashar''el (Israel)* (14:4). Beneath Samson''s own wayward want, Yahuah is working — bending even this to begin the deliverance the Angel had promised at his birth: *he shall begin to deliver Yashar''el (Israel) out of the hand of the Philistines* (Judges 13:5). This is the very hidden over-ruling Yoseph named to his brothers: *ye thought evil against me; but Elohim (God) meant it unto good, to bring to pass, as it is this day, to save much people alive* (Genesis 50:20). What the actors do not understand, Yahuah is secretly meaning unto good — the occasion against the oppressor, the saving of His people. There is only one fit response, and Paul gives it: *O the depth of the riches both of the wisdom and knowledge of Elohim (God)! how unsearchable are his judgments, and his ways past finding out!* (Romans 11:33). The parents did not know, and could not; the providence that turns a flawed desire into the first stroke of deliverance is past finding out.',
       sv.verse_id, ev.verse_id, 'free', 35975
  FROM _s345_jdg14_lookup sv, _s345_jdg14_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=14 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='judges' AND ev.chapter_number=14 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judges-14-the-spirit-came-mightily-and-he-rent-the-lion',
       E'The Spirit Came Mightily and He Rent the Lion',
       E'On the way down to Timnath a young lion roars against Samson — and then the line that is the heart of his strength: *And the Spirit of Yahuah (LORD) came mightily upon him, and he rent him as he would have rent a kid, and he had nothing in his hand* (14:6). The strongest of beasts is torn like a young goat, bare-handed. The phrase is no accident; it is the refrain of Samson''s whole life. It began as a stirring: *And the Spirit of Yahuah (LORD) began to move him at times in the camp of Dan between Zorah and Eshtaol* (Judges 13:25). It breaks out here in full at the lion. And it returns word for word at Lehi: *the Spirit of Yahuah (LORD) came mightily upon him, and the cords that were upon his arms became as flax that was burnt with fire* (Judges 15:14). The strength is always the Spirit coming mightily, never the arm of the man — the same deliverer-Spirit that came upon Saul to rescue Jabesh-gilead: *And the Spirit of Elohim (God) came upon Saul when he heard those tidings, and his anger was kindled greatly* (1 Samuel 11:6). And the wonder of the lion is measured by the proverb: *A lion which is strongest among beasts, and turneth not away for any* (Proverbs 30:30). The beast that turns away for nothing is rent like a kid, because the Spirit of Yahuah came mightily — the gift, not the man, doing the work no man could do of himself.',
       sv.verse_id, ev.verse_id, 'free', 35978
  FROM _s345_jdg14_lookup sv, _s345_jdg14_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=14 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='judges' AND ev.chapter_number=14 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judges-14-out-of-the-strong-came-forth-sweetness',
       E'Out of the Strong Came Forth Sweetness',
       E'After a time Samson returns and turns aside to the carcase of the lion — *and, behold, there was a swarm of bees and honey in the carcase of the lion* (14:8). He takes the honey in his hands and eats, and at his wedding feast he frames it into a riddle for the thirty Philistine companions: *Out of the eater came forth meat, and out of the strong came forth sweetness* (14:14). They cannot expound it; they threaten his wife with fire, she weeps it out of him through the seven days, and on the seventh they answer — *What is sweeter than honey? and what is stronger than a lion?* (14:18). The riddle turns on the *strong*, the lion that is *strongest among beasts, and turneth not away for any* (Proverbs 30:30), the eater out of whose slain carcase the sweetness came. And here readers feel a faint, far-off shape — life and sweetness brought forth out of death, the devourer itself overcome. It is the law the Formed Son would speak: *Except a corn of wheat fall into the ground and die, it abideth alone: but if it die, it bringeth forth much fruit* (John 12:24) — out of death, food; out of the slain strong one, the sweetness. It opens at last into the great undoing Paul sings: *Death is swallowed up in victory* (1 Corinthians 15:54); *O death, where is thy sting? O grave, where is thy victory?* (1 Corinthians 15:55). The eater is devoured, the devourer overcome. The honey in the lion''s carcase is the smallest seed of that whole pattern — sweetness drawn out of the conquered strong one, life out of the very place of death.',
       sv.verse_id, ev.verse_id, 'free', 35981
  FROM _s345_jdg14_lookup sv, _s345_jdg14_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=14 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='judges' AND ev.chapter_number=14 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Judges 13:5 — *he shall begin to deliver Yashar''el out of the hand of the Philistines*: the Angel''s word at Samson''s birth is the key to *it was of Yahuah* (14:4) — the flawed desire is the hinge of the appointed deliverance.'
  FROM cross_reference_threads t
  JOIN _s345_jdg14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=14 AND sv.verse_number=4
  JOIN _s345_jdg14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=13 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-14-it-was-of-yahuah-the-hidden-occasion-against-the-philistines'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Genesis 50:20 — *ye thought evil against me; but Elohim meant it unto good*: Yoseph names the same hidden over-ruling that runs beneath 14:4 — the wayward want secretly meant unto good, to save His people.'
  FROM cross_reference_threads t
  JOIN _s345_jdg14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=14 AND sv.verse_number=4
  JOIN _s345_jdg14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=50 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-14-it-was-of-yahuah-the-hidden-occasion-against-the-philistines'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Romans 11:33 — *how unsearchable are his judgments, and his ways past finding out*: the only fit response to 14:4 — the providence that bends a flawed desire to begin His people''s deliverance is past finding out; the parents could not know.'
  FROM cross_reference_threads t
  JOIN _s345_jdg14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=14 AND sv.verse_number=4
  JOIN _s345_jdg14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-14-it-was-of-yahuah-the-hidden-occasion-against-the-philistines'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Judges 13:25 — *the Spirit of Yahuah began to move him*: the stirring that began in the camp of Dan breaks out in full at the lion (14:6) — the gift, not the man, is the strength.'
  FROM cross_reference_threads t
  JOIN _s345_jdg14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=14 AND sv.verse_number=6
  JOIN _s345_jdg14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=13 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-14-the-spirit-came-mightily-and-he-rent-the-lion'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Judges 15:14 — *the Spirit of Yahuah came mightily upon him, and the cords... became as flax*: the same words return at Lehi — what rends the lion bare-handed (14:6) is what burns the new cords like flax.'
  FROM cross_reference_threads t
  JOIN _s345_jdg14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=14 AND sv.verse_number=6
  JOIN _s345_jdg14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=15 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-14-the-spirit-came-mightily-and-he-rent-the-lion'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'1 Samuel 11:6 — *the Spirit of Elohim came upon Saul... and his anger was kindled*: the same deliverer-Spirit that came mightily on Samson (14:6) raised up Yashar''el''s saviours for the work no man could do of himself.'
  FROM cross_reference_threads t
  JOIN _s345_jdg14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=14 AND sv.verse_number=6
  JOIN _s345_jdg14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=11 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-14-the-spirit-came-mightily-and-he-rent-the-lion'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Proverbs 30:30 — *A lion which is strongest among beasts, and turneth not away for any*: the wonder of 14:6 measured — the strongest of beasts is rent *as he would have rent a kid*, bare-handed, by the Spirit.'
  FROM cross_reference_threads t
  JOIN _s345_jdg14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=14 AND sv.verse_number=6
  JOIN _s345_jdg14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=30 AND tv.verse_number=30
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-14-the-spirit-came-mightily-and-he-rent-the-lion'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Proverbs 30:30 — *A lion which is strongest among beasts*: the *strong* of the riddle (14:14) and the answer *what is stronger than a lion?* (14:18) — the slain devourer out of whose carcase the honey came.'
  FROM cross_reference_threads t
  JOIN _s345_jdg14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=14 AND sv.verse_number=14
  JOIN _s345_jdg14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=30 AND tv.verse_number=30
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-14-out-of-the-strong-came-forth-sweetness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'John 12:24 — *Except a corn of wheat fall into the ground and die... it bringeth forth much fruit*: the faint shape of the riddle (14:14) — out of death, food; out of the slain strong one, the sweetness.'
  FROM cross_reference_threads t
  JOIN _s345_jdg14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=14 AND sv.verse_number=14
  JOIN _s345_jdg14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=12 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-14-out-of-the-strong-came-forth-sweetness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'1 Corinthians 15:54 — *Death is swallowed up in victory*: the sweetness out of the strong (14:14) opens here — the eater devoured, the devourer overcome.'
  FROM cross_reference_threads t
  JOIN _s345_jdg14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=14 AND sv.verse_number=14
  JOIN _s345_jdg14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=54
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-14-out-of-the-strong-came-forth-sweetness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'1 Corinthians 15:55 — *O death, where is thy sting? O grave, where is thy victory?*: the type readers feel in 14:14 opens in full — the strong one, the grave, robbed of its victory; honey from the lion''s carcase the smallest seed of it.'
  FROM cross_reference_threads t
  JOIN _s345_jdg14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=14 AND sv.verse_number=14
  JOIN _s345_jdg14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=55
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-14-out-of-the-strong-came-forth-sweetness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_judges_15.sql (Judges 15) -----
-- Chapter: Judges 15 — SAMSON AVENGED, BOUND, AND REVIVED: his wife given to another, the 300
--          FOXES with firebrands burning the Philistines' standing corn, vineyards, and olives
--          (15:4-5); the Philistines burn his wife and her father; Samson smites them hip and
--          thigh; ★ the men of Yahudah, fearing the Philistines, BIND the deliverer and deliver
--          him up to the enemy (15:9-13 — the deliverer rejected and handed over by his own
--          people he came to save, a faint *his own received him not* pattern); ★ the SPIRIT OF
--          YAHUAH comes mightily on him, the cords break like burnt flax, and with the JAWBONE of
--          an ass he slays a THOUSAND men (15:14-16 — Spirit-empowered deliverance by the humble
--          instrument, salvation by the weak thing, no restraint to save by many or by few); ★★
--          Samson, exhausted and athirst, CRIES to Yahuah and Elohim CLEAVES a hollow place so
--          WATER comes out and he revives — *En-hakkore*, the well of him that cried (15:18-19 —
--          Yahuah giving water to the fainting deliverer, the answered cry, the water from the
--          rock); Samson judges Yashar'el twenty years.
-- Tag: jdg15   View: _s345_jdg15_lookup   Sort band: 36000, 36003, 36006
--
-- Judges 15 coverage:
--   v.1-8  (★ Samson's wife given to his companion; the 300 foxes and firebrands burn the
--           standing corn, vineyards, olives; the Philistines burn his wife and her father;
--           Samson smites them hip and thigh and dwells in the rock Etam)
--          NT:     none warranted (the revenge-cycle frames the betrayal that brings Yahudah's
--                  binding; carried into Thread 1)
--          Extras: none warranted
--          Tanakh: none warranted — the standing-corn/fire imagery is local; the framework weight
--                  is in the binding (v.9-13), the Spirit (v.14-16), and the cry (v.18-19)
--   v.9-13 (★ the Philistines pitch in Yahudah; the men of Yahudah, fearing their rulers, BIND
--           Samson with two new cords and deliver him up to the enemy — the deliverer handed over
--           by his own people)
--          NT:     John 1:10 (the world was made by him, and the world knew him not), John 1:11
--                  (He came unto his own, and his own received him not) — the faint pattern: the
--                  one who came to save Yashar'el is bound and handed over by Yashar'el
--          Extras: none warranted
--          Tanakh: Genesis 37:27-28 (Joseph's brethren sell him into the hand of strangers) — the
--                  deliverer-to-be rejected and handed over by his own kin, the same Yoseph pattern
--   v.14-17 (★ the Spirit of Yahuah comes mightily on him, the cords become as burnt flax and
--            loose from his hands; with a new jawbone of an ass he slays a thousand men; Ramath-lehi)
--          NT:     none warranted at the verse (the salvation-by-the-weak motif's lateral weight
--                  is in the Tanakh; carried into Thread 2)
--          Extras: none warranted
--          Tanakh: 1 Samuel 14:6 (no restraint to Yahuah to save by many or by few), Psalm 18:32
--                  (it is Elohim that girdeth me with strength), Psalm 18:39 (thou hast girded me
--                  with strength unto the battle) — the Spirit-given strength, deliverance by the
--                  weak thing and the humble instrument
--   v.18-19 (★★ Samson sore athirst CRIES to Yahuah; Elohim cleaves a hollow place and water comes
--            out; he drinks, his spirit comes again, he revives; En-hakkore, the well of him that
--            cried)
--          NT:     none warranted at the verse (the giving-water-to-the-fainting type's apostolic
--                  weight sits with the rock of Exodus 17, threaded elsewhere; here the lateral
--                  Tanakh witnesses carry it)
--          Extras: none warranted
--          Tanakh: Exodus 17:6 (smite the rock, and there shall come water out of it, that the
--                  people may drink), Psalm 3:4 (I cried unto Yahuah... and he heard me out of his
--                  holy hill), Psalm 18:6 (in my distress I called upon Yahuah... he heard my voice)
--                  — the answered cry, Yahuah reviving the fainting servant with water from the rock
--   v.20  (Samson judged Yashar'el twenty years in the days of the Philistines)
--          NT/Extras/Tanakh: none warranted — the judgeship summary closes the chapter
--
-- Threads:
--   judges-15-the-deliverer-bound-and-delivered-up-by-his-own       [Tanakh: Genesis | NT: John]          (free)
--   judges-15-the-spirit-came-mightily-and-salvation-by-the-weak    [Tanakh: 1 Samuel, Psalm]             (free)
--   judges-15-the-cry-answered-en-hakkore-water-to-the-fainting     [Tanakh: Exodus, Psalm]               (free)
--
-- Framework notes: ★ When the Philistines come up to bind Samson, the men of Yahudah — fearing
-- their oppressors — bind their own deliverer with two new cords and hand him over: *We are come
-- down to bind thee, that we may deliver thee into the hand of the Philistines* (15:12). The one
-- raised up to begin to save Yashar'el is rejected and delivered up by the very people he came to
-- save — the faint foreshadow of *He came unto his own, and his own received him not* (John 1:11),
-- and of Yoseph whose brethren sold him into strangers' hands (Genesis 37:27-28). ★ But the cords
-- cannot hold the Spirit-bearer: *the Spirit of Yahuah (LORD) came mightily upon him, and the cords
-- that were upon his arms became as flax that was burnt with fire* (15:14), and with a humble
-- jawbone he slays a thousand — *there is no restraint to Yahuah (LORD) to save by many or by few*
-- (1 Samuel 14:6), the strength girded by Elohim (Psalm 18:32,39), salvation by the weak thing.
-- ★★ And when the deliverer faints and cries, Yahuah answers with water: *Elohim (God) clave an
-- hollow place... and there came water thereout; and when he had drunk, his spirit came again, and
-- he revived* (15:19) — the same Yahuah who clave the rock at Horeb so *there shall come water out
-- of it, that the people may drink* (Exodus 17:6), the God who hears the cry (Psalm 3:4; 18:6) and
-- revives the fainting servant. He named the place *En-hakkore* — the well of him that cried. All
-- members canon → every thread tier_required 'free'.

CREATE TEMP VIEW _s345_jdg15_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: the deliverer bound and delivered up by his own (Genesis / John)
    ('canon','judges',15,12,'canon','john',1,11,'free',E'*He came unto his own, and his own received him not* (John 1:11). When the Philistines come up to bind Samson, the men of Yahudah (Judah) come not to defend their deliverer but to surrender him: *We are come down to bind thee, that we may deliver thee into the hand of the Philistines* (15:12). The one Yahuah raised up to begin to save Yashar''el (Israel) is bound and handed over by the very people he came to save — the faint, early shadow of the Deliverer rejected by His own.'),
    ('canon','judges',15,13,'canon','john',1,10,'free',E'*He was in the world, and the world was made by him, and the world knew him not* (John 1:10). The men of Yahudah (Judah) bind their own deliverer and deliver him up — *they bound him with two new cords, and brought him up from the rock* (15:13) — fearing their Philistine rulers more than they trust the one sent to free them. The pattern is faint here and full in the Gospel: the deliverer is in the midst of his people, and his people know him not.'),
    ('canon','judges',15,12,'canon','genesis',37,27,'free',E'*Come, and let us sell him to the Ishmeelites, and let not our hand be upon him; for he is our brother and our flesh. And his brethren were content* (Genesis 37:27). Yoseph''s own brethren delivered him into the hand of strangers — the same shape as Yahudah binding Samson to deliver him *into the hand of the Philistines* (15:12). The deliverer-to-be is handed over by his own kin; what they mean for harm, Yahuah bends toward salvation.'),
    ('canon','judges',15,13,'canon','genesis',37,28,'free',E'*Then there passed by Midianites merchantmen; and they drew and lifted up Joseph out of the pit, and sold Joseph to the Ishmeelites for twenty pieces of silver: and they brought Joseph into Egypt* (Genesis 37:28). Yoseph bound and sold into strangers'' hands by his brethren foreshadows the deliverer *bound with two new cords* (15:13) and handed to the Philistines by the men of Yahudah (Judah). In both, the one his people reject becomes the very one through whom Yahuah works deliverance.'),
    -- THREAD 2: ★ the Spirit came mightily, and salvation by the weak thing (1 Samuel / Psalm)
    ('canon','judges',15,14,'canon','1-samuel',14,6,'free',E'*Come, and let us go over unto the garrison of these uncircumcised: it may be that Yahuah (LORD) will work for us: for there is no restraint to Yahuah (LORD) to save by many or by few* (1 Samuel 14:6). When *the Spirit of Yahuah (LORD) came mightily upon him, and the cords that were upon his arms became as flax that was burnt with fire* (15:14), Yahuah saved by one man against a host — the very truth Jonathan would speak: there is no restraint to Yahuah to save by many or by few. The deliverance is not in the numbers nor the weapon but in the Spirit that empowers.'),
    ('canon','judges',15,15,'canon','1-samuel',14,6,'free',E'*there is no restraint to Yahuah (LORD) to save by many or by few* (1 Samuel 14:6). With a cast-off jawbone the Spirit-filled man overturns a thousand — *he found a new jawbone of an ass, and put forth his hand, and took it, and slew a thousand men therewith* (15:15). Salvation by the weak and despised thing, the humble instrument in the hand of the empowered servant: this is Yahuah''s signature, saving by the few against the many.'),
    ('canon','judges',15,14,'canon','psalms',18,32,'free',E'*It is Elohim (God) that girdeth me with strength, and maketh my way perfect* (Psalm 18:32). When *the Spirit of Yahuah (LORD) came mightily upon him* (15:14) and the cords fell like burnt flax, it was no native power of Samson''s but the strength Elohim girds upon His servant — the very confession of the Psalm. The strength that breaks the bands is given, not owned.'),
    ('canon','judges',15,16,'canon','psalms',18,39,'free',E'*For thou hast girded me with strength unto the battle: thou hast subdued under me those that rose up against me* (Psalm 18:39). Samson''s boast — *With the jawbone of an ass, heaps upon heaps... have I slain a thousand men* (15:16) — is the deed the Psalm ascribes to Yahuah''s gift: the strength unto the battle, the enemies subdued, is girded on by Elohim. The empowered servant prevails because the One who girds him prevails through him.'),
    -- THREAD 3: ★★ the cry answered — En-hakkore, water to the fainting (Exodus / Psalm)
    ('canon','judges',15,18,'canon','psalms',3,4,'free',E'*I cried unto Yahuah (LORD) with my voice, and he heard me out of his holy hill. Selah* (Psalm 3:4). Spent and athirst, the deliverer turns the same way: *he was sore athirst, and called on Yahuah (LORD), and said, Thou hast given this great deliverance into the hand of thy servant: and now shall I die for thirst* (15:18). The cry of the fainting servant is heard — the Psalm sings the answer Samson received: the One who hears out of His holy hill.'),
    ('canon','judges',15,18,'canon','psalms',18,6,'free',E'*In my distress I called upon Yahuah (LORD), and cried unto my Elohim (God): he heard my voice out of his temple, and my cry came before him, even into his ears* (Psalm 18:6). Samson''s distress-cry — *now shall I die for thirst, and fall into the hand of the uncircumcised?* (15:18) — is met as the Psalm describes every such cry: heard, the cry coming before Yahuah into His ears. The deliverer who delivered Yashar''el is himself delivered when he calls.'),
    ('canon','judges',15,19,'canon','exodus',17,6,'free',E'*Behold, I will stand before thee there upon the rock in Horeb; and thou shalt smite the rock, and there shall come water out of it, that the people may drink* (Exodus 17:6). The God who clave the rock at Horeb is the God who answers Samson: *Elohim (God) clave an hollow place that was in the jaw, and there came water thereout; and when he had drunk, his spirit came again, and he revived* (15:19). The same Yahuah brings water out of the dry place to revive the fainting — at Horeb for the whole congregation, at En-hakkore for the one who cried.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s345_jdg15_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s345_jdg15_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judges-15-the-deliverer-bound-and-delivered-up-by-his-own',
       E'The Deliverer Bound and Delivered Up by His Own',
       E'Samson was raised up to *begin to deliver Yashar''el (Israel) out of the hand of the Philistines* — and here the bitter irony of that calling shows. When the Philistines pitch in Yahudah (Judah) seeking him, the men of Yahudah do not rally to their deliverer; fearing their oppressors, they come to bind him: *Knowest thou not that the Philistines are rulers over us? what is this that thou hast done unto us?* (15:11). They say it plainly — *We are come down to bind thee, that we may deliver thee into the hand of the Philistines* (15:12) — and they do it: *they bound him with two new cords, and brought him up from the rock* (15:13). The one sent to save them is bound and handed over by the very people he came to save. It is the faint, early shadow of the Deliverer rejected by His own: *He was in the world, and the world was made by him, and the world knew him not* (John 1:10); *He came unto his own, and his own received him not* (John 1:11). It is the shape, too, of Yoseph, whose brethren delivered him into strangers'' hands — *let us sell him to the Ishmeelites... for he is our brother and our flesh* (Genesis 37:27); *and sold Joseph to the Ishmeelites for twenty pieces of silver: and they brought Joseph into Egypt* (Genesis 37:28). In Yoseph, in Samson, in the Messiah the pattern holds: the one his own people reject and hand over becomes the very one through whom Yahuah works the deliverance. What they mean to silence, Yahuah turns to salvation.',
       sv.verse_id, ev.verse_id, 'free', 36000
  FROM _s345_jdg15_lookup sv, _s345_jdg15_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=15 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='judges' AND ev.chapter_number=15 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judges-15-the-spirit-came-mightily-and-salvation-by-the-weak',
       E'The Spirit Came Mightily — Salvation by the Weak Thing',
       E'The two new cords cannot hold the Spirit-bearer. *And when he came unto Lehi, the Philistines shouted against him: and the Spirit of Yahuah (LORD) came mightily upon him, and the cords that were upon his arms became as flax that was burnt with fire, and his bands loosed from off his hands* (15:14). What snaps the bands is not Samson''s sinew but the Spirit of Yahuah falling on him — the strength is given, not owned: *It is Elohim (God) that girdeth me with strength, and maketh my way perfect* (Psalm 18:32). And the instrument matches the lesson. Free, he takes up the most despised thing at hand: *he found a new jawbone of an ass, and put forth his hand, and took it, and slew a thousand men therewith* (15:15) — and boasts, *With the jawbone of an ass, heaps upon heaps, with the jaw of an ass have I slain a thousand men* (15:16). One empowered man, one cast-off bone, a thousand fallen: this is Yahuah''s signature, the truth Jonathan would later speak before his own lone assault — *there is no restraint to Yahuah (LORD) to save by many or by few* (1 Samuel 14:6). The victory is the Psalm''s confession: *thou hast girded me with strength unto the battle: thou hast subdued under me those that rose up against me* (Psalm 18:39). Salvation comes not by the host nor the fine weapon but by the Spirit who empowers the servant and the weak thing in his hand — so that the deliverance is plainly Yahuah''s, and not man''s.',
       sv.verse_id, ev.verse_id, 'free', 36003
  FROM _s345_jdg15_lookup sv, _s345_jdg15_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=15 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='judges' AND ev.chapter_number=15 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judges-15-the-cry-answered-en-hakkore-water-to-the-fainting',
       E'The Cry Answered — En-hakkore, Water to the Fainting',
       E'The deliverer who delivered Yashar''el (Israel) now needs delivering himself. Spent from the slaughter and parched, Samson does the one thing that saves: he cries out. *And he was sore athirst, and called on Yahuah (LORD), and said, Thou hast given this great deliverance into the hand of thy servant: and now shall I die for thirst, and fall into the hand of the uncircumcised?* (15:18). It is the cry the Psalms put words to: *I cried unto Yahuah (LORD) with my voice, and he heard me out of his holy hill* (Psalm 3:4); *In my distress I called upon Yahuah (LORD), and cried unto my Elohim (God): he heard my voice out of his temple, and my cry came before him, even into his ears* (Psalm 18:6). And Yahuah answers with water from the dry place: *But Elohim (God) clave an hollow place that was in the jaw, and there came water thereout; and when he had drunk, his spirit came again, and he revived* (15:19). It is the same God, the same gift, as at Horeb, where He stood upon the rock and said, *thou shalt smite the rock, and there shall come water out of it, that the people may drink* (Exodus 17:6) — there for the whole fainting congregation, here for the one fainting servant. Samson named the place for what it was: *En-hakkore* — the well of him that cried. The God who empowers the deliverance is the God who hears the deliverer''s cry and revives him; the same hand that broke the cords brings the water that brings his spirit again.',
       sv.verse_id, ev.verse_id, 'free', 36006
  FROM _s345_jdg15_lookup sv, _s345_jdg15_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=15 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='judges' AND ev.chapter_number=15 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'John 1:11 — *He came unto his own, and his own received him not*: the men of Yahudah bind their own deliverer to hand him over (15:12) — the faint shadow of the Deliverer rejected by His own.'
  FROM cross_reference_threads t
  JOIN _s345_jdg15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=15 AND sv.verse_number=12
  JOIN _s345_jdg15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-15-the-deliverer-bound-and-delivered-up-by-his-own'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'John 1:10 — *the world was made by him, and the world knew him not*: Yahudah binds him with two new cords (15:13), fearing their rulers more than trusting the one sent to free them — his people know him not.'
  FROM cross_reference_threads t
  JOIN _s345_jdg15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=15 AND sv.verse_number=13
  JOIN _s345_jdg15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-15-the-deliverer-bound-and-delivered-up-by-his-own'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Genesis 37:27 — *let us sell him to the Ishmeelites... he is our brother and our flesh*: Yoseph delivered into strangers'' hands by his own kin, the same shape as Yahudah delivering Samson to the Philistines (15:12).'
  FROM cross_reference_threads t
  JOIN _s345_jdg15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=15 AND sv.verse_number=12
  JOIN _s345_jdg15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=37 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-15-the-deliverer-bound-and-delivered-up-by-his-own'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Genesis 37:28 — *sold Joseph to the Ishmeelites for twenty pieces of silver*: Yoseph bound and sold by his brethren foreshadows the deliverer *bound with two new cords* (15:13) and handed to the enemy — the one rejected becomes the one through whom Yahuah saves.'
  FROM cross_reference_threads t
  JOIN _s345_jdg15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=15 AND sv.verse_number=13
  JOIN _s345_jdg15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=37 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-15-the-deliverer-bound-and-delivered-up-by-his-own'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'1 Samuel 14:6 — *no restraint to Yahuah to save by many or by few*: the Spirit comes mightily and the cords fall like burnt flax (15:14) — Yahuah saves by one man against a host, not by numbers.'
  FROM cross_reference_threads t
  JOIN _s345_jdg15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=15 AND sv.verse_number=14
  JOIN _s345_jdg15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=14 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-15-the-spirit-came-mightily-and-salvation-by-the-weak'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'1 Samuel 14:6 — *to save by many or by few*: with a cast-off jawbone the Spirit-filled man slays a thousand (15:15) — salvation by the weak and despised thing, Yahuah''s signature.'
  FROM cross_reference_threads t
  JOIN _s345_jdg15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=15 AND sv.verse_number=15
  JOIN _s345_jdg15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=14 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-15-the-spirit-came-mightily-and-salvation-by-the-weak'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Psalm 18:32 — *It is Elohim that girdeth me with strength*: when the Spirit came mightily and the cords fell like burnt flax (15:14), the strength was given, not owned.'
  FROM cross_reference_threads t
  JOIN _s345_jdg15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=15 AND sv.verse_number=14
  JOIN _s345_jdg15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=18 AND tv.verse_number=32
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-15-the-spirit-came-mightily-and-salvation-by-the-weak'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Psalm 18:39 — *thou hast girded me with strength unto the battle... subdued under me those that rose up against me*: Samson''s boast of the thousand slain (15:16) is the deed the Psalm ascribes to Yahuah''s gift.'
  FROM cross_reference_threads t
  JOIN _s345_jdg15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=15 AND sv.verse_number=16
  JOIN _s345_jdg15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=18 AND tv.verse_number=39
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-15-the-spirit-came-mightily-and-salvation-by-the-weak'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Psalm 3:4 — *I cried unto Yahuah with my voice, and he heard me out of his holy hill*: spent and athirst, the deliverer cries (15:18) — the Psalm sings the answer he received.'
  FROM cross_reference_threads t
  JOIN _s345_jdg15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=15 AND sv.verse_number=18
  JOIN _s345_jdg15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=3 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-15-the-cry-answered-en-hakkore-water-to-the-fainting'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Psalm 18:6 — *In my distress I called upon Yahuah... he heard my voice out of his temple*: Samson''s distress-cry (15:18) is met as the Psalm describes — heard, the cry coming before Yahuah into His ears.'
  FROM cross_reference_threads t
  JOIN _s345_jdg15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=15 AND sv.verse_number=18
  JOIN _s345_jdg15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=18 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-15-the-cry-answered-en-hakkore-water-to-the-fainting'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Exodus 17:6 — *smite the rock, and there shall come water out of it, that the people may drink*: the God who clave the rock at Horeb cleaves the hollow place so water comes and Samson revives (15:19) — En-hakkore, the well of him that cried.'
  FROM cross_reference_threads t
  JOIN _s345_jdg15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=15 AND sv.verse_number=19
  JOIN _s345_jdg15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=17 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-15-the-cry-answered-en-hakkore-water-to-the-fainting'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_judges_16.sql (Judges 16) -----
-- Judges 16 — Samson and Delilah; Samson's death. Tag jdg16. Sort band 36025–36037.
-- The Nazarite secret (Num 6 / Judg 13:5) = the strength was Yahuah's presence, not Samson's own.
-- The seduction that destroys (Prov 5 / 7, the strange woman) — "he wist not that Yahuah was departed."
-- The fallen deliverer humbled (eyes put out, grinding in prison) — yet "the hair began to grow again" = restoration.
-- The deliverer who in his DEATH wins the greater victory — a faint shadow of the One whose death
--   overthrew the enemy (John 12:24 corn of wheat / Col 2:15 spoiled principalities; Heb 11:32,34 out of weakness made strong).
--
-- Judges 16 coverage:
--   v.4-6 (Delilah of Sorek, the lords bribe her, the secret of his strength):
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Proverbs 5:3-5, 7:21-27 (the strange woman whose end is death) — THREAD 2
--   v.16-17 (his soul vexed unto death; he tells ALL — the Nazarite secret, no razor):
--        NT:     none warranted (Num 6 / Judg 13 carry it)
--        Extras: none warranted
--        Tanakh: Numbers 6:2,5; Judges 13:5 (the Nazarite separation, the source) — THREAD 1
--   v.19-20 (hair shaved, strength gone, "he wist not that Yahuah was departed from him"):
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Proverbs 5:22-23, 7:26-27 (holden with the cords of his sins, many strong men slain) — THREAD 2
--   v.21-22 (eyes put out, grinding in prison house; the hair began to grow again):
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: (self-anchored — the fallen-deliverer/restoration thread bounds itself) — THREAD 3
--   v.28-30 (cries to Yahuah only-this-once; let me die with the Philistines; dead at his death more than in his life):
--        NT:     John 12:24 (corn of wheat dies, brings forth fruit); Colossians 2:15 (spoiled principalities,
--                triumphing); Hebrews 11:32,34 (Samson in the roll of faith, out of weakness made strong) — THREAD 4
--        Extras: none warranted
--        Tanakh: Judges 13:5 (he shall BEGIN to deliver Israel — finished here in death) — THREAD 3/4
--
-- THREADS:
--   judges-16-a-nazarite-unto-elohim-from-the-womb-the-secret-of-his-strength  [Tanakh] free
--   judges-16-the-strange-woman-and-he-wist-not-that-yahuah-was-departed       [Tanakh] free
--   judges-16-the-fallen-deliverer-humbled-and-the-hair-began-to-grow-again    [Tanakh] free
--   judges-16-let-me-die-with-the-philistines-the-death-that-wins-the-victory  [Tanakh+NT] free

CREATE TEMP VIEW _s345_jdg16_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: the Nazarite secret (Num 6 / Judg 13:5)
    ('canon','judges',16,17,'canon','numbers',6,2,'free',
     E'*When either man or woman shall separate themselves to vow a vow of a Nazarite, to separate themselves unto Yahuah (LORD)* (Numbers 6:2). Samson''s confession — *I have been a Nazarite unto Elohim (God) from my mother''s womb* (Judges 16:17) — names the separation of Numbers 6 as the ground of all his strength: the power was never in the hair but in the consecration *unto Yahuah* it signified.'),
    ('canon','judges',16,17,'canon','numbers',6,5,'free',
     E'*All the days of the vow of his separation there shall no razor come upon his head: until the days be fulfilled... he shall be holy, and shall let the locks of the hair of his head grow* (Numbers 6:5). This is the exact statute Samson betrays — *There hath not come a razor upon mine head... if I be shaven, then my strength will go from me* (Judges 16:17). The uncut hair was the visible token of an invisible holiness *unto Yahuah*; sever the token and the holiness is forfeit.'),
    ('canon','judges',16,17,'canon','judges',13,5,'free',
     E'The angel of Yahuah had spoken it before his birth: *no razor shall come on his head: for the child shall be a Nazarite unto Elohim (God) from the womb: and he shall begin to deliver Yashar''el (Israel) out of the hand of the Philistines* (Judges 13:5). Samson''s secret (16:17) is simply this commission remembered; his whole strength was the keeping of a vow Yahuah had laid on him *from the womb*.'),
    -- THREAD 2: the strange woman / he wist not that Yahuah was departed (Prov 5, Prov 7)
    ('canon','judges',16,5,'canon','proverbs',5,3,'free',
     E'*For the lips of a strange woman drop as an honeycomb, and her mouth is smoother than oil: But her end is bitter as wormwood, sharp as a twoedged sword* (Proverbs 5:3-4). Delilah of the valley of Sorek, hired by the Philistine lords to *entice him, and see wherein his great strength lieth* (Judges 16:5), is the strange woman of Proverbs made flesh — sweet speech that ends in death.'),
    ('canon','judges',16,16,'canon','proverbs',7,21,'free',
     E'*With her much fair speech she caused him to yield, with the flattering of her lips she forced him* (Proverbs 7:21). So Delilah: *she pressed him daily with her words, and urged him, so that his soul was vexed unto death; That he told her all his heart* (Judges 16:16-17). The daily wearing-down of Proverbs 7 is the very method that breaks the strong man.'),
    ('canon','judges',16,20,'canon','proverbs',5,22,'free',
     E'*His own iniquities shall take the wicked himself, and he shall be holden with the cords of his sins* (Proverbs 5:22). The most sobering line in the chapter — *he wist not that Yahuah (LORD) was departed from him* (Judges 16:20) — is this proverb enacted: the strength was Yahuah''s presence all along, and the man bound by his own compromise does not even know the Spirit has gone.'),
    ('canon','judges',16,20,'canon','proverbs',7,26,'free',
     E'*For she hath cast down many wounded: yea, many strong men have been slain by her. Her house is the way to hell, going down to the chambers of death* (Proverbs 7:26-27). Samson is the chief of those *strong men* — shaven, afflicted, and not even aware that *Yahuah (LORD) was departed from him* (Judges 16:20). The strange woman''s house claims the mightiest judge of Yashar''el (Israel).'),
    -- THREAD 3: the fallen deliverer humbled / the hair began to grow again
    ('canon','judges',16,21,'canon','judges',13,5,'free',
     E'The angel had promised *he shall begin to deliver Yashar''el (Israel)* (Judges 13:5) — only BEGIN. Here the deliverer is undone: *the Philistines took him, and put out his eyes... and he did grind in the prison house* (Judges 16:21). The blinded, fettered judge grinding like a beast is the deliverance left unfinished, awaiting the one act still to come.'),
    -- THREAD 4: let me die with the Philistines / the death that wins the victory
    ('canon','judges',16,30,'canon','john',12,24,'free',
     E'*Verily, verily, I say unto you, Except a corn of wheat fall into the ground and die, it abideth alone: but if it die, it bringeth forth much fruit* (John 12:24). Samson''s prayer — *Let me die with the Philistines*... *so the dead which he slew at his death were more than they which he slew in his life* (Judges 16:30) — is a faint, broken shadow of this law: the deliverer accomplishes more in dying than in living. He is the seed that falls, not the harvest; the true Deliverer would die without sin and rise.'),
    ('canon','judges',16,30,'canon','colossians',2,15,'free',
     E'*And having spoiled principalities and powers, he made a shew of them openly, triumphing over them in it* (Colossians 2:15). When the house of Dagon falls on the lords of the Philistines (Judges 16:30), the enemy''s gods and rulers are overthrown by the very death of the deliverer — a dim figure of the One whose death, not His escape, *spoiled principalities and powers*.'),
    ('canon','judges',16,30,'canon','hebrews',11,32,'free',
     E'*And what shall I more say? for the time would fail me to tell of Gedeon, and of Barak, and of Samson, and of Jephthae* (Hebrews 11:32). Samson is named in the roll of faith — not for his failures but for the final cry of Judges 16:28-30, the death by which he *slew more than... in his life*. The witness of faith reaches even the broken deliverer who turned back to Yahuah at the last.'),
    ('canon','judges',16,28,'canon','hebrews',11,34,'free',
     E'*Quenched the violence of fire, escaped the edge of the sword, out of weakness were made strong, waxed valiant in fight* (Hebrews 11:34). Blind and bound, Samson cries *strengthen me, I pray thee, only this once, O Elohim (God)* (Judges 16:28) — and *out of weakness* he is *made strong*. The strength was never his; restored at the last, it is Yahuah''s answered once more.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s345_jdg16_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s345_jdg16_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== threads =====
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judges-16-a-nazarite-unto-elohim-from-the-womb-the-secret-of-his-strength',
       E'A Nazarite unto Elohim from the womb — the secret of his strength',
       E'Pressed daily till his soul was *vexed unto death*, Samson at last *told her all his heart* — *There hath not come a razor upon mine head; for I have been a Nazarite unto Elohim (God) from my mother''s womb: if I be shaven, then my strength will go from me* (Judges 16:16-17). The secret is no charm in the hair; it is the vow of separation Yahuah laid on him before he was born. *When either man or woman shall separate themselves to vow a vow of a Nazarite, to separate themselves unto Yahuah (LORD)* (Numbers 6:2), the statute runs: *there shall no razor come upon his head... he shall be holy, and shall let the locks of the hair of his head grow* (Numbers 6:5). The uncut hair is the token of a holiness *unto Yahuah* — and the angel of Yahuah had named that holiness before Samson''s birth: *no razor shall come on his head: for the child shall be a Nazarite unto Elohim (God) from the womb: and he shall begin to deliver Yashar''el (Israel) out of the hand of the Philistines* (Judges 13:5). His strength was the keeping of a vow; betray the vow, and the strength — which was never his own — is gone.',
       sv.verse_id, ev.verse_id, 'free', 36025
  FROM _s345_jdg16_lookup sv, _s345_jdg16_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=16 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='judges' AND ev.chapter_number=16 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judges-16-the-strange-woman-and-he-wist-not-that-yahuah-was-departed',
       E'The strange woman — and he wist not that Yahuah was departed',
       E'*He loved a woman in the valley of Sorek, whose name was Delilah* (Judges 16:4), and the Philistine lords hired her to *entice him, and see wherein his great strength lieth* (16:5). She is the strange woman of the Proverbs made flesh: *For the lips of a strange woman drop as an honeycomb, and her mouth is smoother than oil: But her end is bitter as wormwood, sharp as a twoedged sword* (Proverbs 5:3-4). Her method is exactly the method that breaks him — *With her much fair speech she caused him to yield, with the flattering of her lips she forced him* (Proverbs 7:21); so *she pressed him daily with her words, and urged him, so that his soul was vexed unto death* (Judges 16:16). Then comes the most sobering line in all of Samson''s story: shaven and afflicted, *he awoke out of his sleep, and said, I will go out as at other times before, and shake myself. And he wist not that Yahuah (LORD) was departed from him* (16:20). *His own iniquities shall take the wicked himself, and he shall be holden with the cords of his sins* (Proverbs 5:22): the strength was Yahuah''s presence all along, and the man bound by his own compromise does not even know the Spirit has gone. *Many strong men have been slain by her. Her house is the way to hell* (Proverbs 7:26-27) — and Samson is the chief of them.',
       sv.verse_id, ev.verse_id, 'free', 36028
  FROM _s345_jdg16_lookup sv, _s345_jdg16_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=16 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='judges' AND ev.chapter_number=16 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judges-16-the-fallen-deliverer-humbled-and-the-hair-began-to-grow-again',
       E'The fallen deliverer humbled — and the hair began to grow again',
       E'*The Philistines took him, and put out his eyes, and brought him down to Gaza, and bound him with fetters of brass; and he did grind in the prison house* (Judges 16:21). The mightiest judge of Yashar''el (Israel) is blinded, fettered, and set grinding like a beast — the deliverer humbled to the lowest place. Yet the angel''s word had promised only a beginning: *he shall begin to deliver Yashar''el (Israel) out of the hand of the Philistines* (Judges 13:5) — BEGIN; the work was never finished while he lived in his strength. And then the quiet hinge of grace: *Howbeit the hair of his head began to grow again after he was shaven* (16:22). The token of separation returns; the restoration begins in the prison house, unseen by his captors, preparing the one act still to come.',
       sv.verse_id, ev.verse_id, 'free', 36031
  FROM _s345_jdg16_lookup sv, _s345_jdg16_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=16 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='judges' AND ev.chapter_number=16 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judges-16-let-me-die-with-the-philistines-the-death-that-wins-the-victory',
       E'Let me die with the Philistines — the death that wins the greater victory',
       E'At the feast to Dagon, blind Samson is set between the pillars, and he turns back to Yahuah at the last: *O Yahuah (Lord) GOD, remember me, I pray thee, and strengthen me, I pray thee, only this once, O Elohim (God), that I may be at once avenged of the Philistines for my two eyes* (Judges 16:28). *Quenched the violence of fire, escaped the edge of the sword, out of weakness were made strong* (Hebrews 11:34) — the strength that was never his is answered once more. Then *Samson said, Let me die with the Philistines. And he bowed himself with all his might; and the house fell upon the lords, and upon all the people... So the dead which he slew at his death were more than they which he slew in his life* (16:30). The deliverer accomplishes more in dying than in living — a faint, broken shadow of the law the true Deliverer would speak: *Except a corn of wheat fall into the ground and die, it abideth alone: but if it die, it bringeth forth much fruit* (John 12:24). When the house of Dagon falls, the enemy''s gods and lords are overthrown by the death of the deliverer — dimly figuring the One who, *having spoiled principalities and powers, he made a shew of them openly, triumphing over them in it* (Colossians 2:15). Samson is the seed that falls, not the harvest; named in the roll of faith — *of Samson, and of Jephthae* (Hebrews 11:32) — for this last cry. But where Samson dies in his sin and stays in the grave, the true Deliverer would die without sin and rise.',
       sv.verse_id, ev.verse_id, 'free', 36034
  FROM _s345_jdg16_lookup sv, _s345_jdg16_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=16 AND sv.verse_number=28
   AND ev.edition_slug='canon' AND ev.book_slug='judges' AND ev.chapter_number=16 AND ev.verse_number=30
ON CONFLICT (slug) DO NOTHING;

-- ===== thread_members =====
-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*When either man or woman shall separate themselves to vow a vow of a Nazarite, to separate themselves unto Yahuah (LORD)* (Numbers 6:2) — the separation that was the ground of his strength.'
  FROM cross_reference_threads t
  JOIN _s345_jdg16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=16 AND sv.verse_number=17
  JOIN _s345_jdg16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=6 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-16-a-nazarite-unto-elohim-from-the-womb-the-secret-of-his-strength'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*There shall no razor come upon his head... he shall be holy, and shall let the locks of the hair of his head grow* (Numbers 6:5) — the exact statute Samson betrays.'
  FROM cross_reference_threads t
  JOIN _s345_jdg16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=16 AND sv.verse_number=17
  JOIN _s345_jdg16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=6 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-16-a-nazarite-unto-elohim-from-the-womb-the-secret-of-his-strength'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*The child shall be a Nazarite unto Elohim (God) from the womb: and he shall begin to deliver Yashar''el (Israel)* (Judges 13:5) — the commission Samson''s secret remembers.'
  FROM cross_reference_threads t
  JOIN _s345_jdg16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=16 AND sv.verse_number=17
  JOIN _s345_jdg16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=13 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-16-a-nazarite-unto-elohim-from-the-womb-the-secret-of-his-strength'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*The lips of a strange woman drop as an honeycomb... But her end is bitter as wormwood* (Proverbs 5:3-4) — Delilah of Sorek is the strange woman made flesh.'
  FROM cross_reference_threads t
  JOIN _s345_jdg16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=16 AND sv.verse_number=5
  JOIN _s345_jdg16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=5 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-16-the-strange-woman-and-he-wist-not-that-yahuah-was-departed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*With her much fair speech she caused him to yield, with the flattering of her lips she forced him* (Proverbs 7:21) — the daily wearing-down that vexes his soul unto death.'
  FROM cross_reference_threads t
  JOIN _s345_jdg16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=16 AND sv.verse_number=16
  JOIN _s345_jdg16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=7 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-16-the-strange-woman-and-he-wist-not-that-yahuah-was-departed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*His own iniquities shall take the wicked himself, and he shall be holden with the cords of his sins* (Proverbs 5:22) — enacted in *he wist not that Yahuah was departed from him*.'
  FROM cross_reference_threads t
  JOIN _s345_jdg16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=16 AND sv.verse_number=20
  JOIN _s345_jdg16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=5 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-16-the-strange-woman-and-he-wist-not-that-yahuah-was-departed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Many strong men have been slain by her. Her house is the way to hell* (Proverbs 7:26-27) — Samson is the chief of those strong men.'
  FROM cross_reference_threads t
  JOIN _s345_jdg16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=16 AND sv.verse_number=20
  JOIN _s345_jdg16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=7 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-16-the-strange-woman-and-he-wist-not-that-yahuah-was-departed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*He shall BEGIN to deliver Yashar''el (Israel)* (Judges 13:5) — only begin; the blinded judge grinding in prison is the deliverance left unfinished, awaiting the last act.'
  FROM cross_reference_threads t
  JOIN _s345_jdg16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=16 AND sv.verse_number=21
  JOIN _s345_jdg16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=13 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-16-the-fallen-deliverer-humbled-and-the-hair-began-to-grow-again'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Except a corn of wheat fall into the ground and die, it abideth alone: but if it die, it bringeth forth much fruit* (John 12:24) — the law Samson''s death faintly shadows: more accomplished in dying than in living.'
  FROM cross_reference_threads t
  JOIN _s345_jdg16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=16 AND sv.verse_number=30
  JOIN _s345_jdg16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=12 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-16-let-me-die-with-the-philistines-the-death-that-wins-the-victory'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Having spoiled principalities and powers, he made a shew of them openly, triumphing over them in it* (Colossians 2:15) — the house of Dagon falls; the enemy''s gods are overthrown by the deliverer''s death.'
  FROM cross_reference_threads t
  JOIN _s345_jdg16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=16 AND sv.verse_number=30
  JOIN _s345_jdg16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=2 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-16-let-me-die-with-the-philistines-the-death-that-wins-the-victory'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*The time would fail me to tell of... Samson* (Hebrews 11:32) — named in the roll of faith for the last cry by which he slew more than in his life.'
  FROM cross_reference_threads t
  JOIN _s345_jdg16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=16 AND sv.verse_number=30
  JOIN _s345_jdg16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=32
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-16-let-me-die-with-the-philistines-the-death-that-wins-the-victory'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Out of weakness were made strong* (Hebrews 11:34) — blind and bound, he cries *strengthen me... only this once* (16:28), and the strength that was never his is answered.'
  FROM cross_reference_threads t
  JOIN _s345_jdg16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=16 AND sv.verse_number=28
  JOIN _s345_jdg16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=34
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-16-let-me-die-with-the-philistines-the-death-that-wins-the-victory'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_judges_17.sql (Judges 17) -----
-- Chapter: Judges 17  |  Tag: jdg17  |  Session: s345  |  Sort band: 36050, 36053, 36056
--
-- The dark appendix opens. Micah of mount Ephraim makes a house of gods from his
-- mother's dedicated silver — a graven image and a molten image, an ephod and
-- teraphim — and consecrates first his own son, then a wandering Levite, to be his
-- priest. The do-it-yourself religion: worship invented by man's own design,
-- breaking the second commandment and the one-place/one-priesthood ordinance, yet
-- presuming on Yahuah's favour. The key refrain frames the whole appendix: in those
-- days there was no king in Yashar'el, every man did that which was right in his
-- own eyes.
--
-- Judges 17 coverage:
--   v.1-5  (graven+molten image, house of gods, home-made priest)
--          NT:     none warranted (the type is Torah-against-idolatry; no NT verse adds)
--          Extras: none warranted
--          Tanakh: Exodus 20:4 (no graven image), Exodus 20:23 (gods of silver),
--                  Deuteronomy 12:8 (every man right in his own eyes / one place),
--                  Deuteronomy 18:5 (Yahuah's chosen priesthood)
--   v.6    (no king, every man right in his own eyes — THE REFRAIN)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: Deuteronomy 12:8 (the very phrase forbidden), Proverbs 14:12
--                  (the way that seems right ends in death), Judges 18:1 + 21:25
--                  (the refrain repeated, framing the appendix)
--   v.7-13 (the hired Levite; "now know I that Yahuah will do me good")
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: Deuteronomy 18:1-2,5 (the lawful Levitical priesthood vs. a hired
--                  priest), Proverbs 14:12 (the presumption that seems right)
--
-- Threads (slug — target libraries):
--   judges-17-a-house-of-gods-the-graven-image-against-the-second-commandment  (Tanakh) free
--   judges-17-no-king-every-man-right-in-his-own-eyes  (Tanakh) free
--   judges-17-a-levite-to-my-priest-the-hired-presumption  (Tanakh) free
--
-- Contested/load-bearing framing: 17:5's house of gods + ephod + home-made priest,
-- and 17:13's "now know I that Yahuah will do me good," are read as the corruption of
-- true worship — man's design against Torah, the need for the true King — NOT a
-- neutral folk-piety. The refrain 17:6 is bound to Deut 12:8 (the exact phrase Torah
-- forbade) and Prov 14:12 (the way that seems right ends in death).

CREATE TEMP VIEW _s345_jdg17_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 1: the house of gods / graven image against the second commandment
    ('canon','judges',17,3,'canon','exodus',20,4,'free',E'*Thou shalt not make unto thee any graven image, or any likeness of any thing that is in heaven above, or that is in the earth beneath, or that is in the water under the earth* (Exodus 20:4). Micah''s mother dedicates her silver *unto Yahuah (LORD)... to make a graven image and a molten image* (Judges 17:3) — she names the right Name over the very thing the second word of the covenant forbids. The idol is built in Yahuah''s name; the design is man''s.'),
    ('canon','judges',17,4,'canon','exodus',20,23,'free',E'*Ye shall not make with me gods of silver, neither shall ye make unto you gods of gold* (Exodus 20:23). The founder takes the silver and *made thereof a graven image and a molten image* (Judges 17:4) — the precise prohibition broken metal-for-metal, gods of silver fashioned to stand beside the worship of Yahuah.'),
    ('canon','judges',17,5,'canon','deuteronomy',18,5,'free',E'*For Yahuah Elohayka (the LORD thy God) hath chosen him out of all thy tribes, to stand to minister in the name of Yahuah (LORD), him and his sons for ever* (Deuteronomy 18:5). Yahuah alone chooses His priesthood; yet Micah *made an ephod, and teraphim, and consecrated one of his sons, who became his priest* (Judges 17:5) — a man manufactures his own priest and his own oracle, the house of gods against the house Yahuah chose.'),
    -- Thread 2: no king, every man right in his own eyes (the refrain)
    ('canon','judges',17,6,'canon','deuteronomy',12,8,'free',E'*Ye shall not do after all the things that we do here this day, every man whatsoever is right in his own eyes* (Deuteronomy 12:8). The refrain *every man did that which was right in his own eyes* (Judges 17:6) is the exact thing Torah forbade — Deuteronomy commanded worship at the one place Yahuah would choose, not the design of each man''s own eyes; Judges shows the nation living out what Moses warned against.'),
    ('canon','judges',17,6,'canon','proverbs',14,12,'free',E'*There is a way which seemeth right unto a man, but the end thereof are the ways of death* (Proverbs 14:12). When *every man did that which was right in his own eyes* (Judges 17:6), self-authority replaces the way of Yahuah — and the wisdom of Proverbs names the end of that road: the way that seems right to a man ends in death.'),
    ('canon','judges',17,6,'canon','judges',18,1,'free',E'*In those days there was no king in Yashar''el (Israel)* (Judges 18:1). The refrain that opens here — *In those days there was no king in Yashar''el (Israel)* (Judges 17:6) — is repeated at the head of the next chapter, framing the whole dark appendix as the anarchy of a people with no king, pointing to the need for the true King.'),
    ('canon','judges',17,6,'canon','judges',21,25,'free',E'*In those days there was no king in Yashar''el (Israel): every man did that which was right in his own eyes* (Judges 21:25). The book closes on the very words it speaks here (Judges 17:6) — the refrain bookends the appendix; the moral and spiritual chaos of self-rule cries out for the King who will do that which is right in the sight of Yahuah.'),
    -- Thread 3: a Levite to my priest — the hired presumption
    ('canon','judges',17,10,'canon','deuteronomy',18,1,'free',E'*The priests the Levites, and all the tribe of Levi, shall have no part nor inheritance with Yashar''el (Israel): they shall eat the offerings of Yahuah (LORD) made by fire, and his inheritance* (Deuteronomy 18:1). Micah hires the wandering Levite — *be unto me a father and a priest, and I will give thee ten shekels of silver by the year* (Judges 17:10). The Levite''s portion was Yahuah Himself, the offerings made by fire; here he sells his ministry for wages at a man''s private shrine.'),
    ('canon','judges',17,10,'canon','deuteronomy',18,2,'free',E'*Therefore shall they have no inheritance among their brethren: Yahuah (LORD) is their inheritance, as he hath said unto them* (Deuteronomy 18:2). The Levite was to have no inheritance because *Yahuah (LORD) is their inheritance*; Micah''s offer — *ten shekels of silver by the year, and a suit of apparel, and thy victuals* (Judges 17:10) — trades that inheritance for hire, the priesthood made a paid post.'),
    ('canon','judges',17,13,'canon','proverbs',14,12,'free',E'*There is a way which seemeth right unto a man, but the end thereof are the ways of death* (Proverbs 14:12). Micah''s confidence — *Now know I that Yahuah (LORD) will do me good, seeing I have a Levite to my priest* (Judges 17:13) — is the presumption that ritual secures favour while the commandments are broken; it seems right to him, but it is the way whose end is death.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s345_jdg17_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s345_jdg17_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== threads =====
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judges-17-a-house-of-gods-the-graven-image-against-the-second-commandment',
       E'A House of Gods: The Graven Image Against the Second Commandment',
       E'Micah of mount Ephraim makes worship by his own design. His mother dedicates her silver *unto Yahuah (LORD)... to make a graven image and a molten image* (Judges 17:3) — the right Name spoken over the very thing the covenant forbids: *Thou shalt not make unto thee any graven image, or any likeness of any thing that is in heaven above, or that is in the earth beneath* (Exodus 20:4). The founder casts it, *a graven image and a molten image* (Judges 17:4), breaking metal-for-metal the word *Ye shall not make with me gods of silver, neither shall ye make unto you gods of gold* (Exodus 20:23). Then *the man Micah had an house of gods, and made an ephod, and teraphim, and consecrated one of his sons, who became his priest* (Judges 17:5) — a home-made oracle and a home-made priesthood, when Yahuah alone chooses the one *to stand to minister in the name of Yahuah (LORD), him and his sons for ever* (Deuteronomy 18:5). This is the do-it-yourself religion: idolatry built in Yahuah''s name, the design of man set against the design of the covenant.',
       sv.verse_id, ev.verse_id, 'free', 36050
  FROM _s345_jdg17_lookup sv, _s345_jdg17_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=17 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='judges' AND ev.chapter_number=17 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judges-17-no-king-every-man-right-in-his-own-eyes',
       E'No King in Yashar''el: Every Man Right in His Own Eyes',
       E'The key refrain that frames the whole dark appendix: *In those days there was no king in Yashar''el (Israel), but every man did that which was right in his own eyes* (Judges 17:6). It is the very thing Moses forbade — *Ye shall not do after all the things that we do here this day, every man whatsoever is right in his own eyes* (Deuteronomy 12:8) — for Yahuah had commanded worship at the one place He would choose, not the verdict of each man''s own eyes. And the way of self-authority has an end: *There is a way which seemeth right unto a man, but the end thereof are the ways of death* (Proverbs 14:12). The refrain is no passing remark; it opens the next chapter — *In those days there was no king in Yashar''el (Israel)* (Judges 18:1) — and closes the book — *In those days there was no king in Yashar''el (Israel): every man did that which was right in his own eyes* (Judges 21:25). The anarchy of a people who are each their own authority cries out for the true King who does that which is right in the sight of Yahuah.',
       sv.verse_id, ev.verse_id, 'free', 36053
  FROM _s345_jdg17_lookup sv, _s345_jdg17_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=17 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='judges' AND ev.chapter_number=17 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judges-17-a-levite-to-my-priest-the-hired-presumption',
       E'A Levite to My Priest: The Hired Presumption',
       E'A wandering Levite of Beth-lehem-judah comes by, and Micah hires him: *Dwell with me, and be unto me a father and a priest, and I will give thee ten shekels of silver by the year, and a suit of apparel, and thy victuals* (Judges 17:10). But the Levite''s portion was never wages — *The priests the Levites, and all the tribe of Levi, shall have no part nor inheritance with Yashar''el (Israel): they shall eat the offerings of Yahuah (LORD) made by fire, and his inheritance* (Deuteronomy 18:1); *Yahuah (LORD) is their inheritance, as he hath said unto them* (Deuteronomy 18:2). The Levite sells the inheritance of Yahuah for a salary at a man''s private shrine. And Micah''s heart follows: *Now know I that Yahuah (LORD) will do me good, seeing I have a Levite to my priest* (Judges 17:13) — the presumption that the right ritual and a hired priest secure favour while the commandments are broken. It is *a way which seemeth right unto a man, but the end thereof are the ways of death* (Proverbs 14:12).',
       sv.verse_id, ev.verse_id, 'free', 36056
  FROM _s345_jdg17_lookup sv, _s345_jdg17_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=17 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='judges' AND ev.chapter_number=17 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- ===== thread_members =====
-- Thread 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Thou shalt not make unto thee any graven image* (Exodus 20:4) — the second word of the covenant, broken in Micah''s mother''s dedication of silver to make a graven and molten image.'
  FROM cross_reference_threads t
  JOIN _s345_jdg17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=17 AND sv.verse_number=3
  JOIN _s345_jdg17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-17-a-house-of-gods-the-graven-image-against-the-second-commandment'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Ye shall not make with me gods of silver* (Exodus 20:23) — the founder casts the silver into a graven and molten image, the prohibition broken metal-for-metal.'
  FROM cross_reference_threads t
  JOIN _s345_jdg17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=17 AND sv.verse_number=4
  JOIN _s345_jdg17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-17-a-house-of-gods-the-graven-image-against-the-second-commandment'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Yahuah... hath chosen him... to stand to minister in the name of Yahuah* (Deuteronomy 18:5) — Yahuah alone chooses His priesthood; Micah manufactures his own ephod, teraphim, and priest.'
  FROM cross_reference_threads t
  JOIN _s345_jdg17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=17 AND sv.verse_number=5
  JOIN _s345_jdg17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=18 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-17-a-house-of-gods-the-graven-image-against-the-second-commandment'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*every man whatsoever is right in his own eyes* (Deuteronomy 12:8) — the exact phrase Torah forbade; the refrain shows the nation living out what Moses warned against.'
  FROM cross_reference_threads t
  JOIN _s345_jdg17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=17 AND sv.verse_number=6
  JOIN _s345_jdg17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=12 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-17-no-king-every-man-right-in-his-own-eyes'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*a way which seemeth right unto a man, but the end thereof are the ways of death* (Proverbs 14:12) — the end of self-authority when every man is his own judge.'
  FROM cross_reference_threads t
  JOIN _s345_jdg17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=17 AND sv.verse_number=6
  JOIN _s345_jdg17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=14 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-17-no-king-every-man-right-in-his-own-eyes'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*In those days there was no king in Yashar''el* (Judges 18:1) — the refrain repeated to open the next chapter, framing the appendix.'
  FROM cross_reference_threads t
  JOIN _s345_jdg17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=17 AND sv.verse_number=6
  JOIN _s345_jdg17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=18 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-17-no-king-every-man-right-in-his-own-eyes'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*In those days there was no king in Yashar''el: every man did that which was right in his own eyes* (Judges 21:25) — the same words close the book; the refrain bookends the appendix and points to the need for the true King.'
  FROM cross_reference_threads t
  JOIN _s345_jdg17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=17 AND sv.verse_number=6
  JOIN _s345_jdg17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=21 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-17-no-king-every-man-right-in-his-own-eyes'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*The priests the Levites... shall have no part nor inheritance... they shall eat the offerings of Yahuah made by fire* (Deuteronomy 18:1) — the Levite''s portion was Yahuah, not wages; here he is hired for ten shekels a year.'
  FROM cross_reference_threads t
  JOIN _s345_jdg17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=17 AND sv.verse_number=10
  JOIN _s345_jdg17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=18 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-17-a-levite-to-my-priest-the-hired-presumption'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Yahuah is their inheritance, as he hath said unto them* (Deuteronomy 18:2) — the Levite trades the inheritance of Yahuah for silver and apparel at a man''s private shrine.'
  FROM cross_reference_threads t
  JOIN _s345_jdg17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=17 AND sv.verse_number=10
  JOIN _s345_jdg17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=18 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-17-a-levite-to-my-priest-the-hired-presumption'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*a way which seemeth right unto a man, but the end thereof are the ways of death* (Proverbs 14:12) — Micah''s presumption that a hired Levite secures Yahuah''s favour while the commandments are broken.'
  FROM cross_reference_threads t
  JOIN _s345_jdg17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=17 AND sv.verse_number=13
  JOIN _s345_jdg17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=14 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-17-a-levite-to-my-priest-the-hired-presumption'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_judges_18.sql (Judges 18) -----
-- Chapter: Judges 18 — the tribe of Dan steals Micah's gods and his hireling Levite,
--   smites quiet Laish, rebuilds it as Dan, and institutionalizes idolatry "until the captivity."
-- Tag: jdg18    View: _s345_jdg18_lookup    Sort band: 36075, 36078, 36081
--
-- Judges 18 coverage:
--   v.1  (no king in Yashar'el / Dan seeking inheritance)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Judges 17:6 + Judges 21:25 (refrain), Deuteronomy 12:8 (right in own eyes) — THREAD 3
--   v.4  (Micah hath hired me, I am his priest)
--        NT:     John 10:12-13 (the hireling) — THREAD 1
--        Extras: none warranted
--        Tanakh: Judges 17:10 (hired for ten shekels) — THREAD 1
--   v.19 (priest unto a tribe rather than one man — better pay)
--        NT:     John 10:12-13 (the hireling who careth not) — THREAD 1
--        Extras: none warranted
--        Tanakh: Judges 17:10-12 (the hire) — THREAD 1
--   v.24 (ye have taken away my gods which I made)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Deuteronomy 12:30-31 (snared by their gods, abomination) — THREAD 1
--   v.27 (smote quiet, secure Laish with the edge of the sword)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Joshua 19:47 (the Dan-conquest of Leshem) — THREAD 2
--   v.29 (called the city Dan)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Joshua 19:47 (Leshem renamed Dan) — THREAD 2
--   v.30-31 (set up the graven image, priests until the captivity)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: 1 Kings 12:28-30 (Jeroboam's golden calf set in Dan), 2 Kings 17:6 + 17:23
--                (the captivity it leads to), Deuteronomy 12:2-3 (utterly destroy graven images) — THREAD 2
--
-- Threads (slug + target libraries):
--   judges-18-the-hireling-priest-and-the-stolen-gods            (Tanakh + NT)  — free
--   judges-18-dan-sets-up-the-graven-image-until-the-captivity   (Tanakh only)  — free
--   judges-18-in-those-days-there-was-no-king-in-yasharel        (Tanakh only)  — free
--
-- Framework-load-bearing framing: Dan = the very site of Jeroboam's golden calf (1 Kings 12:29),
--   the false worship that becomes generational ("until the captivity," 18:30) and leads to the
--   Assyrian scattering of the northern house (2 Kings 17:6, 23) — the two-house judgment-history.
--   The hireling Levite (the priest who goes where the pay is better) read forward to John 10:12-13.

CREATE TEMP VIEW _s345_jdg18_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: the hireling priest and the stolen gods
    ('canon','judges',18,4,  'canon','judges',17,10, 'free',
      E'*And Micah said unto him, Dwell with me, and be unto me a father and a priest, and I will give thee ten shekels of silver by the year, and a suit of apparel, and thy victuals. So the Levite went in.* (Judges 17:10) — the Levite serves for wages. When the Danites find him, *Micah... hath hired me, and I am his priest* (Judges 18:4): worship as merchandise, the priesthood for pay.'),
    ('canon','judges',18,19, 'canon','judges',17,12, 'free',
      E'*And Micah consecrated the Levite; and the young man became his priest, and was in the house of Micah.* (Judges 17:12) — the same hireling now lured to a better post. *Is it better for thee to be a priest unto the house of one man, or that thou be a priest unto a tribe and a family in Yashar''el (Israel)?* (Judges 18:19) — and *the priest''s heart was glad* (18:20): he goes where the pay is greater.'),
    ('canon','judges',18,19, 'canon','john',10,12, 'free',
      E'*But he that is an hireling, and not the shepherd, whose own the sheep are not, seeth the wolf coming, and leaveth the sheep, and fleeth: and the wolf catcheth them, and scattereth the sheep.* (John 10:12) — Yahusha (Jesus) names the type. The Levite who jumps to *a priest unto a tribe* (18:19) for the larger flock and the larger fee is the hireling, not the shepherd.'),
    ('canon','judges',18,4,  'canon','john',10,13, 'free',
      E'*The hireling fleeth, because he is an hireling, and careth not for the sheep.* (John 10:13) — the priest who says *hath hired me, and I am his priest* (Judges 18:4) cares for the wage, not the worship; he blesses whatever way the silver points (*Go in peace: before Yahuah (LORD) is your way*, 18:6).'),
    ('canon','judges',18,24, 'canon','deuteronomy',12,30, 'free',
      E'*Take heed to thyself that thou be not snared by following them, after that they be destroyed from before thee; and that thou enquire not after their gods, saying, How did these nations serve their gods? even so will I do likewise.* (Deuteronomy 12:30) — Micah cries *Ye have taken away my gods which I made* (Judges 18:24): hand-made gods, the very snare Torah warned of, treated as property to be stolen.'),
    ('canon','judges',18,24, 'canon','deuteronomy',12,31, 'free',
      E'*Thou shalt not do so unto Yahuah Elohayka (the LORD thy God): for every abomination to Yahuah (LORD), which he hateth, have they done unto their gods...* (Deuteronomy 12:31) — *my gods which I made* (Judges 18:24) is exactly the abomination Yahuah (Yahuah) hates; the graven image and the molten image are no true worship but the thing forbidden.'),

    -- THREAD 2: Dan sets up the graven image until the captivity
    ('canon','judges',18,27, 'canon','joshua',19,47, 'free',
      E'*And the coast of the children of Dan went out too little for them: therefore the children of Dan went up to fight against Leshem, and took it, and smote it with the edge of the sword, and possessed it, and dwelt therein, and called Leshem, Dan, after the name of Dan their father.* (Joshua 19:47) — the same conquest. *They smote them with the edge of the sword, and burnt the city with fire* (Judges 18:27): quiet Laish/Leshem taken, and the tribe renames it for itself.'),
    ('canon','judges',18,30, 'canon','1-kings',12,28, 'free',
      E'*Whereupon the king took counsel, and made two calves of gold, and said unto them, It is too much for you to go up to Jerusalem: behold thy gods, O Yashar''el (Israel), which brought thee up out of the land of Egypt.* (1 Kings 12:28) — the idolatry of Judges 18 is no isolated lapse; *the children of Dan set up the graven image* (18:30), and on that very site Jeroboam will later raise one of his golden calves.'),
    ('canon','judges',18,30, 'canon','1-kings',12,29, 'free',
      E'*And he set the one in Beth-el, and the other put he in Dan.* (1 Kings 12:29) — Dan, made a centre of false worship here *until the day of the captivity of the land* (Judges 18:30), becomes the very place the divided northern kingdom plants its calf: the corruption seeded, then institutionalized by the crown.'),
    ('canon','judges',18,30, 'canon','2-kings',17,6, 'free',
      E'*In the ninth year of Hoshea the king of Assyria took Samaria, and carried Yashar''el (Israel) away into Assyria, and placed them in Halah and in Habor by the river of Gozan, and in the cities of the Medes.* (2 Kings 17:6) — *until the day of the captivity of the land* (Judges 18:30) names the end-point: the false worship that began at Dan ripens into the Assyrian scattering of the northern house.'),
    ('canon','judges',18,30, 'canon','2-kings',17,23, 'free',
      E'*Until Yahuah (LORD) removed Yashar''el (Israel) out of his sight, as he had said by all his servants the prophets. So was Yashar''el (Israel) carried away out of their own land to Assyria unto this day.* (2 Kings 17:23) — the calf of Dan and *all the sins of Jeroboam* (17:22) carry the ten tribes into exile; the generational idolatry of 18:30 is the road to the scattering Yahuah (Yahuah) will one day gather (Ezekiel 37).'),
    ('canon','judges',18,31, 'canon','deuteronomy',12,2, 'free',
      E'*Ye shall utterly destroy all the places, wherein the nations which ye shall possess served their gods, upon the high mountains, and upon the hills, and under every green tree:* (Deuteronomy 12:2) — Yashar''el (Israel) was commanded to tear idolatry DOWN; instead *they set them up Micah''s graven image, which he made* (Judges 18:31), building up the very thing Torah said to destroy.'),
    ('canon','judges',18,31, 'canon','deuteronomy',12,3, 'free',
      E'*And ye shall overthrow their altars, and break their pillars, and burn their groves with fire; and ye shall hew down the graven images of their gods, and destroy the names of them out of that place.* (Deuteronomy 12:3) — *hew down the graven images*; but Dan enshrines one *all the time that the house of Elohim (God) was in Shiloh* (Judges 18:31) — the rival worship standing beside the true.'),

    -- THREAD 3: in those days there was no king in Yashar'el
    ('canon','judges',18,1,  'canon','judges',17,6, 'free',
      E'*In those days there was no king in Yashar''el (Israel), but every man did that which was right in his own eyes.* (Judges 17:6) — the refrain that frames the whole Micah account. *In those days there was no king in Yashar''el (Israel)* (Judges 18:1): with no true King, a man makes his own gods and a tribe steals them.'),
    ('canon','judges',18,1,  'canon','judges',21,25, 'free',
      E'*In those days there was no king in Yashar''el (Israel): every man did that which was right in his own eyes.* (Judges 21:25) — the closing verse of the book repeats it. The whole descent — idol, hireling, theft, slaughter, generational idolatry — flows from *there was no king in Yashar''el (Israel)* (Judges 18:1): the need for the true King.'),
    ('canon','judges',18,1,  'canon','deuteronomy',12,8, 'free',
      E'*Ye shall not do after all the things that we do here this day, every man whatsoever is right in his own eyes.* (Deuteronomy 12:8) — Torah forbade the very anarchy the refrain laments. *No king in Yashar''el (Israel)* (Judges 18:1) is each man doing *right in his own eyes*, the exact disorder Yahuah (Yahuah) said not to do.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s345_jdg18_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s345_jdg18_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== threads =====
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judges-18-the-hireling-priest-and-the-stolen-gods',
       E'The Hireling Priest and the Stolen Gods',
       E'Religion for hire, worship as merchandise. Micah''s Levite served for wages — *Micah... hath hired me, and I am his priest* (Judges 18:4), as Micah had set the terms: *I will give thee ten shekels of silver by the year, and a suit of apparel, and thy victuals* (Judges 17:10). When the Danites offer a larger flock, the Levite jumps: *Is it better for thee to be a priest unto the house of one man, or that thou be a priest unto a tribe and a family in Yashar''el (Israel)?* — and *the priest''s heart was glad* (18:19-20). Yahusha (Jesus) names the type: *he that is an hireling, and not the shepherd... seeth the wolf coming, and leaveth the sheep, and fleeth* (John 10:12); *the hireling fleeth, because he is an hireling, and careth not for the sheep* (John 10:13). And the gods themselves are hand-made plunder — *Ye have taken away my gods which I made* (18:24) — the very snare Torah forbade: *enquire not after their gods... for every abomination to Yahuah (LORD), which he hateth, have they done unto their gods* (Deuteronomy 12:30-31).',
       sv.verse_id, ev.verse_id, 'free', 36075
  FROM _s345_jdg18_lookup sv, _s345_jdg18_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=18 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='judges' AND ev.chapter_number=18 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judges-18-dan-sets-up-the-graven-image-until-the-captivity',
       E'Dan Sets Up the Graven Image — Until the Captivity',
       E'Idolatry institutionalized, and made generational. Dan smites quiet Laish — *they smote them with the edge of the sword, and burnt the city with fire* (Judges 18:27), the same conquest told in *they... took it, and smote it with the edge of the sword... and called Leshem, Dan* (Joshua 19:47) — and rebuilds it under its own name. Then *the children of Dan set up the graven image: and Jonathan... he and his sons were priests to the tribe of Dan until the day of the captivity of the land* (18:30); *they set them up Micah''s graven image, which he made* (18:31). This is no isolated lapse but a SITE of false worship — the very place Jeroboam will later plant a golden calf: *made two calves of gold... behold thy gods, O Yashar''el (Israel)* (1 Kings 12:28), *and he set the one in Beth-el, and the other put he in Dan* (12:29). And it ends where idolatry always ends — the scattering of the northern house: *the king of Assyria took Samaria, and carried Yashar''el (Israel) away into Assyria* (2 Kings 17:6); *so was Yashar''el (Israel) carried away out of their own land to Assyria* (17:23). Torah had commanded the opposite — not to enshrine but to *utterly destroy... and hew down the graven images of their gods* (Deuteronomy 12:2-3). The seed sown here ripens into the exile.',
       sv.verse_id, ev.verse_id, 'free', 36078
  FROM _s345_jdg18_lookup sv, _s345_jdg18_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=18 AND sv.verse_number=27
   AND ev.edition_slug='canon' AND ev.book_slug='judges' AND ev.chapter_number=18 AND ev.verse_number=31
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judges-18-in-those-days-there-was-no-king-in-yasharel',
       E'In Those Days There Was No King in Yashar''el',
       E'The refrain that frames the whole descent. *In those days there was no king in Yashar''el (Israel)* (Judges 18:1) — and with no true King, a man makes his own gods, a hireling sells his office, a tribe steals the gods and slaughters a quiet city. The refrain opened the Micah account — *In those days there was no king in Yashar''el (Israel), but every man did that which was right in his own eyes* (Judges 17:6) — and it closes the book: *every man did that which was right in his own eyes* (Judges 21:25). Torah had already named this very anarchy and forbidden it: *Ye shall not do after all the things that we do here this day, every man whatsoever is right in his own eyes* (Deuteronomy 12:8). The whole chaos cries out for the true King.',
       sv.verse_id, ev.verse_id, 'free', 36081
  FROM _s345_jdg18_lookup sv, _s345_jdg18_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=18 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='judges' AND ev.chapter_number=18 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

-- ===== thread_members =====
-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Micah... hath hired me, and I am his priest* (18:4) — the hire set in Judges 17:10: ten shekels, apparel, and victuals by the year.'
  FROM cross_reference_threads t
  JOIN _s345_jdg18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=18 AND sv.verse_number=4
  JOIN _s345_jdg18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=17 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-18-the-hireling-priest-and-the-stolen-gods'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*the priest''s heart was glad* (18:20) — the hireling consecrated in Judges 17:12 jumps to the bigger flock and the bigger fee.'
  FROM cross_reference_threads t
  JOIN _s345_jdg18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=18 AND sv.verse_number=19
  JOIN _s345_jdg18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=17 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-18-the-hireling-priest-and-the-stolen-gods'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*he that is an hireling... leaveth the sheep, and fleeth* (John 10:12) — Yahusha (Jesus) names the type of the priest who serves a tribe for the larger pay.'
  FROM cross_reference_threads t
  JOIN _s345_jdg18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=18 AND sv.verse_number=19
  JOIN _s345_jdg18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=10 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-18-the-hireling-priest-and-the-stolen-gods'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*the hireling... careth not for the sheep* (John 10:13) — the priest of 18:4 cares for the wage, blessing whatever way the silver points.'
  FROM cross_reference_threads t
  JOIN _s345_jdg18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=18 AND sv.verse_number=4
  JOIN _s345_jdg18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=10 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-18-the-hireling-priest-and-the-stolen-gods'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*be not snared by following them... enquire not after their gods* (Deuteronomy 12:30) — Micah''s *gods which I made* (18:24) are the very snare Torah forbade.'
  FROM cross_reference_threads t
  JOIN _s345_jdg18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=18 AND sv.verse_number=24
  JOIN _s345_jdg18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=12 AND tv.verse_number=30
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-18-the-hireling-priest-and-the-stolen-gods'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*every abomination to Yahuah (LORD), which he hateth, have they done unto their gods* (Deuteronomy 12:31) — *my gods which I made* (18:24) is precisely that abomination.'
  FROM cross_reference_threads t
  JOIN _s345_jdg18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=18 AND sv.verse_number=24
  JOIN _s345_jdg18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=12 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-18-the-hireling-priest-and-the-stolen-gods'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*took it, and smote it with the edge of the sword... and called Leshem, Dan* (Joshua 19:47) — the same conquest of quiet Laish/Leshem (18:27), the tribe renaming it for itself.'
  FROM cross_reference_threads t
  JOIN _s345_jdg18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=18 AND sv.verse_number=27
  JOIN _s345_jdg18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=19 AND tv.verse_number=47
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-18-dan-sets-up-the-graven-image-until-the-captivity'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*made two calves of gold... behold thy gods, O Yashar''el (Israel)* (1 Kings 12:28) — the idolatry Dan sets up (18:30) is the same Jeroboam will later institutionalize with the crown.'
  FROM cross_reference_threads t
  JOIN _s345_jdg18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=18 AND sv.verse_number=30
  JOIN _s345_jdg18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=12 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-18-dan-sets-up-the-graven-image-until-the-captivity'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*the other put he in Dan* (1 Kings 12:29) — the calf is planted on the very site Dan made a centre of false worship here.'
  FROM cross_reference_threads t
  JOIN _s345_jdg18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=18 AND sv.verse_number=30
  JOIN _s345_jdg18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=12 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-18-dan-sets-up-the-graven-image-until-the-captivity'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*the king of Assyria... carried Yashar''el (Israel) away into Assyria* (2 Kings 17:6) — *until the day of the captivity of the land* (18:30) names this end.'
  FROM cross_reference_threads t
  JOIN _s345_jdg18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=18 AND sv.verse_number=30
  JOIN _s345_jdg18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=17 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-18-dan-sets-up-the-graven-image-until-the-captivity'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*so was Yashar''el (Israel) carried away out of their own land to Assyria* (2 Kings 17:23) — the calf of Dan and the sins of Jeroboam carry the ten tribes into exile.'
  FROM cross_reference_threads t
  JOIN _s345_jdg18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=18 AND sv.verse_number=30
  JOIN _s345_jdg18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=17 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-18-dan-sets-up-the-graven-image-until-the-captivity'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*Ye shall utterly destroy all the places, wherein the nations... served their gods* (Deuteronomy 12:2) — Yashar''el was to tear idolatry down, not set it up (18:31).'
  FROM cross_reference_threads t
  JOIN _s345_jdg18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=18 AND sv.verse_number=31
  JOIN _s345_jdg18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=12 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-18-dan-sets-up-the-graven-image-until-the-captivity'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*hew down the graven images of their gods, and destroy the names of them* (Deuteronomy 12:3) — but Dan enshrines one all the time the house of Elohim (God) stood in Shiloh (18:31).'
  FROM cross_reference_threads t
  JOIN _s345_jdg18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=18 AND sv.verse_number=31
  JOIN _s345_jdg18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=12 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-18-dan-sets-up-the-graven-image-until-the-captivity'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*there was no king in Yashar''el (Israel), but every man did that which was right in his own eyes* (Judges 17:6) — the refrain that opens the Micah account.'
  FROM cross_reference_threads t
  JOIN _s345_jdg18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=18 AND sv.verse_number=1
  JOIN _s345_jdg18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=17 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-18-in-those-days-there-was-no-king-in-yasharel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*every man did that which was right in his own eyes* (Judges 21:25) — the book''s closing verse repeats it; the whole descent flows from no King.'
  FROM cross_reference_threads t
  JOIN _s345_jdg18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=18 AND sv.verse_number=1
  JOIN _s345_jdg18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=21 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-18-in-those-days-there-was-no-king-in-yasharel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Ye shall not do... every man whatsoever is right in his own eyes* (Deuteronomy 12:8) — Torah forbade the very anarchy the refrain laments.'
  FROM cross_reference_threads t
  JOIN _s345_jdg18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=18 AND sv.verse_number=1
  JOIN _s345_jdg18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=12 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-18-in-those-days-there-was-no-king-in-yasharel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_judges_19.sql (Judges 19) -----
-- Chapter: Judges 19 — the Levite and his concubine at Gibeah; the lowest point of the book.
-- Tag: jdg19   View: _s345_jdg19_lookup   Sort band: 36100, 36103, 36106, 36109
-- SOURCE every row: ('canon','judges',19,v).  Handled GRAVELY — the concubine is a VICTIM, never an enemy.
--
-- Judges 19 coverage:
--   v.1   (no king / Levite + concubine)  NT: none warranted  Extras: none warranted  Tanakh: Judg 17:6, 21:25 (the refrain) — threaded under thread 3.
--   v.15-21 (no man took them in / the old man)  NT: none warranted  Extras: none warranted  Tanakh: Gen 19:1-3 (Lot the lone host) — context for thread 1; not over-threaded.
--   v.22  (sons of Belial beset the house, "that we may know him")  NT: none warranted  Extras: none warranted  Tanakh: Gen 19:4-5 (men of Sodom, "bring them out, that we may know them") — THREAD 1, the Sodom-inside-Yashar'el echo.
--   v.23-24 (the old man's plea "do not so wickedly")  NT: none warranted  Extras: none warranted  Tanakh: Gen 19:6-8 (Lot's near-identical plea/offer) — THREAD 1.
--   v.25  (concubine thrust out, abused all night)  NT: none warranted  Extras: none warranted  Tanakh: Gen 19:8 (the offered daughters) — THREAD 1 (Levite's failure) + THREAD 2 (the victim).
--   v.26-28 (she falls dead on the threshold; "Up... but none answered")  NT: none warranted  Extras: none warranted  Tanakh: none direct — THREAD 2 carries the victim within ch (anchor 25→28).
--   v.29  (cut into twelve pieces, sent through all Yashar'el)  NT: none warranted  Extras: none warranted  Tanakh: Judg 20:6-7 (the tribes' answer) — THREAD 3.
--   v.30  ("no such deed... consider of it")  NT: none warranted  Extras: none warranted  Tanakh: Hosea 9:9, Hosea 10:9 (the byword "as in the days of Gibeah"); Judg 17:6, 21:25 (no king) — THREAD 3.
--
-- THREADS (3):
--   judges-19-gibeah-become-sodom-the-sons-of-belial   [free; Tanakh: Genesis] — vv.22-25 → Gen 19:4-8: the same wickedness now INSIDE the covenant people, in a city of Benjamin.
--   judges-19-the-concubine-the-victim-of-the-collapse  [free; Tanakh: Judges (self)] — vv.25-28: the innocent woman destroyed; victims-not-enemies, grave restraint.
--   judges-19-as-in-the-days-of-gibeah-no-king-every-man-right  [free; Tanakh: Judges self + Hosea] — vv.29-30 → Hosea 9:9/10:9 + Judg 17:6/21:25: the byword of Yashar'el's lowest corruption, the fruit of "no king."

CREATE TEMP VIEW _s345_jdg19_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 — Gibeah become Sodom: the sons of Belial
    ('canon','judges',19,22,'canon','genesis',19,4,'free',E'*But before they lay down, the men of the city, even the men of Sodom, compassed the house round, both old and young, all the people from every quarter* (Genesis 19:4). The horror of Gibeah is Sodom returned almost verbatim — *behold, the men of the city, certain sons of Belial, beset the house round about, and beat at the door* (Judges 19:22). The wickedness that called down brimstone on the cities of the plain is now found INSIDE Yashar''el (Israel), in a city of the tribe of Benjamin.'),
    ('canon','judges',19,22,'canon','genesis',19,5,'free',E'*And they called unto Lot, and said unto him, Where are the men which came in to thee this night? bring them out unto us, that we may know them* (Genesis 19:5). The sons of Belial at Gibeah demand the very same: *Bring forth the man that came into thine house, that we may know him* (Judges 19:22). The same depraved demand, word for word — but now it rises from within the covenant people, not from the heathen city.'),
    ('canon','judges',19,23,'canon','genesis',19,6,'free',E'*And Lot went out at the door unto them, and shut the door after him, And said, I pray you, brethren, do not so wickedly* (Genesis 19:6-7). The old man of Gibeah pleads in the same words: *Nay, my brethren, nay, I pray you, do not so wickedly; seeing that this man is come into mine house, do not this folly* (Judges 19:23). The host''s cry against the city''s evil is identical — Gibeah has become Sodom.'),
    ('canon','judges',19,24,'canon','genesis',19,8,'free',E'*Behold now, I have two daughters which have not known man; let me, I pray you, bring them out unto you, and do ye to them as is good in your eyes* (Genesis 19:8). The dreadful offer is repeated at Gibeah: *Behold, here is my daughter a maiden, and his concubine; them I will bring out now... but unto this man do not so vile a thing* (Judges 19:24). Even the desperate, failing attempt to appease the mob is the same — the collapse is total, women offered up to the city''s violence.'),
    ('canon','judges',19,25,'canon','genesis',19,8,'free',E'*Behold now, I have two daughters which have not known man; let me, I pray you, bring them out unto you* (Genesis 19:8). At Sodom the angels struck the mob blind and the daughters were spared; at Gibeah there was no such deliverance — *so the man took his concubine, and brought her forth unto them; and they knew her, and abused her all the night* (Judges 19:25). Where heaven intervened for Lot, the men of Yashar''el (Israel) had sunk lower than Sodom, and the innocent was given over.'),
    -- THREAD 2 — the concubine the victim of the collapse (self, within the chapter)
    ('canon','judges',19,25,'canon','judges',19,28,'free',E'*And he said unto her, Up, and let us be going. But none answered* (Judges 19:28). She is the VICTIM, not the enemy — *they... abused her all the night until the morning... Then came the woman in the dawning of the day, and fell down at the door of the man''s house... and her hands were upon the threshold* (Judges 19:25-27). The innocent destroyed by the city''s depravity; her silent body becomes the witness against a people who have forgotten Yahuah (LORD).'),
    -- THREAD 3 — as in the days of Gibeah; no king, every man right in his own eyes
    ('canon','judges',19,29,'canon','judges',20,6,'free',E'*And I took my concubine, and cut her in pieces, and sent her throughout all the country of the inheritance of Yashar''el (Israel): for they have committed lewdness and folly in Yashar''el (Israel)* (Judges 20:6). The Levite''s appalling summons — *he took a knife, and laid hold on his concubine, and divided her... into twelve pieces, and sent her into all the coasts of Yashar''el (Israel)* (Judges 19:29) — calls all twelve tribes to reckon with the depth of the collapse.'),
    ('canon','judges',19,30,'canon','hosea',9,9,'free',E'*They have deeply corrupted themselves, as in the days of Gibeah: therefore he will remember their iniquity, he will visit their sins* (Hosea 9:9). Centuries later the prophet names this night as the byword of Yashar''el''s lowest corruption — *There was no such deed done nor seen from the day that the children of Yashar''el (Israel) came up out of the land of Egypt unto this day* (Judges 19:30). Gibeah becomes the very measure of how deep the covenant people can fall.'),
    ('canon','judges',19,30,'canon','hosea',10,9,'free',E'*O Yashar''el (Israel), thou hast sinned from the days of Gibeah: there they stood: the battle in Gibeah against the children of iniquity did not overtake them* (Hosea 10:9). Hosea reaches back again to this chapter as the root of Yashar''el''s sin — the appalling deed that demanded the tribes *consider of it, take advice, and speak your minds* (Judges 19:30) is the prophets'' standing emblem of national corruption.'),
    ('canon','judges',19,1,'canon','judges',17,6,'free',E'*In those days there was no king in Yashar''el (Israel), but every man did that which was right in his own eyes* (Judges 17:6). The horror of chapter 19 opens with the same note: *And it came to pass in those days, when there was no king in Yashar''el (Israel)* (Judges 19:1). The refrain is the diagnosis — with no king to uphold the Torah of Yahuah (LORD), every man''s own eyes become the law, and this is the fruit.'),
    ('canon','judges',19,1,'canon','judges',21,25,'free',E'*In those days there was no king in Yashar''el (Israel): every man did that which was right in his own eyes* (Judges 21:25). The book seals the whole Gibeah account with this verdict, the same word that framed it — *when there was no king in Yashar''el (Israel)* (Judges 19:1). The Levite, the concubine, the sons of Belial, the twelve severed pieces: all of it is what "every man right in his own eyes" finally comes to.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s345_jdg19_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s345_jdg19_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judges-19-gibeah-become-sodom-the-sons-of-belial',
       E'Gibeah become Sodom — the sons of Belial',
       E'The men of Gibeah, *certain sons of Belial, beset the house round about, and beat at the door* (Judges 19:22), and their demand is Sodom returned almost word for word. At Sodom: *the men of the city, even the men of Sodom, compassed the house round... and said unto him... bring them out unto us, that we may know them* (Genesis 19:4-5). At Gibeah: *Bring forth the man that came into thine house, that we may know him* (Judges 19:22). The host''s plea is the same — Lot''s *I pray you, brethren, do not so wickedly* (Genesis 19:7) is the old man''s *Nay, my brethren, nay, I pray you, do not so wickedly... do not this folly* (Judges 19:23) — and even the dreadful offer of the daughters is repeated (Genesis 19:8; Judges 19:24). But the difference is the whole point: at Sodom the angels struck the mob blind and the daughters were spared, and Yahuah (LORD) rained brimstone on the heathen city; at Gibeah there was no such deliverance — *they... abused her all the night* (Judges 19:25). The wickedness that judged the cities of the plain is now found INSIDE the covenant people, in a city of the tribe of Benjamin. This is not the world''s sin against Yashar''el (Israel); it is Yashar''el become Sodom.',
       sv.verse_id, ev.verse_id, 'free', 36100
  FROM _s345_jdg19_lookup sv, _s345_jdg19_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=19 AND sv.verse_number=22
   AND ev.edition_slug='canon' AND ev.book_slug='judges' AND ev.chapter_number=19 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judges-19-the-concubine-the-victim-of-the-collapse',
       E'The concubine — the victim of the collapse',
       E'The woman of this chapter is a VICTIM, never an enemy. Thrust out to the mob, *they... abused her all the night until the morning: and when the day began to spring, they let her go* (Judges 19:25). At dawn she crawls back: *Then came the woman in the dawning of the day, and fell down at the door of the man''s house where her lord was, till it was light* (Judges 19:26), *and her hands were upon the threshold* (Judges 19:27). And then the unbearable silence: *And he said unto her, Up, and let us be going. But none answered* (Judges 19:28). The innocent is destroyed by the city''s depravity and by every man who failed her — the men of Gibeah, and the Levite who handed her over. Her broken body on the threshold becomes the wordless witness against a people who have forgotten Yahuah (LORD). The framework dismantles the system that killed her; it never blames the slain. *There was no such deed done nor seen from the day that the children of Yashar''el (Israel) came up out of the land of Egypt* (Judges 19:30).',
       sv.verse_id, ev.verse_id, 'free', 36103
  FROM _s345_jdg19_lookup sv, _s345_jdg19_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=19 AND sv.verse_number=25
   AND ev.edition_slug='canon' AND ev.book_slug='judges' AND ev.chapter_number=19 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judges-19-as-in-the-days-of-gibeah-no-king-every-man-right',
       E'As in the days of Gibeah — no king, every man right in his own eyes',
       E'The Levite''s appalling summons — *he took a knife, and laid hold on his concubine, and divided her, together with her bones, into twelve pieces, and sent her into all the coasts of Yashar''el (Israel)* (Judges 19:29) — calls all twelve tribes to reckon: *consider of it, take advice, and speak your minds* (Judges 19:30). The tribes answer in the same terms (*they have committed lewdness and folly in Yashar''el (Israel)*, Judges 20:6). And this night becomes the prophets'' standing byword for the lowest depth of national corruption: *They have deeply corrupted themselves, as in the days of Gibeah* (Hosea 9:9); *O Yashar''el (Israel), thou hast sinned from the days of Gibeah* (Hosea 10:9). The book itself names the cause, framing the whole account front and back: *In those days there was no king in Yashar''el (Israel)* (Judges 19:1) — *In those days there was no king in Yashar''el (Israel): every man did that which was right in his own eyes* (Judges 21:25; cf. Judges 17:6). With no king to uphold the Torah of Yahuah (LORD), every man''s own eyes become the law — and Gibeah is what that finally comes to.',
       sv.verse_id, ev.verse_id, 'free', 36106
  FROM _s345_jdg19_lookup sv, _s345_jdg19_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=19 AND sv.verse_number=29
   AND ev.edition_slug='canon' AND ev.book_slug='judges' AND ev.chapter_number=19 AND ev.verse_number=30
ON CONFLICT (slug) DO NOTHING;

-- ===== THREAD 1 members =====
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*the men of the city, even the men of Sodom, compassed the house round* (Genesis 19:4) — the sons of Belial beset the house at Gibeah, Sodom returned inside Yashar''el (Israel).'
  FROM cross_reference_threads t
  JOIN _s345_jdg19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=19 AND sv.verse_number=22
  JOIN _s345_jdg19_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=19 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-19-gibeah-become-sodom-the-sons-of-belial'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*bring them out unto us, that we may know them* (Genesis 19:5) — the identical demand of the mob, word for word, now from within the covenant people.'
  FROM cross_reference_threads t
  JOIN _s345_jdg19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=19 AND sv.verse_number=22
  JOIN _s345_jdg19_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=19 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-19-gibeah-become-sodom-the-sons-of-belial'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*I pray you, brethren, do not so wickedly* (Genesis 19:6-7) — the host''s plea against the city''s evil, identical at Gibeah (Judges 19:23).'
  FROM cross_reference_threads t
  JOIN _s345_jdg19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=19 AND sv.verse_number=23
  JOIN _s345_jdg19_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=19 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-19-gibeah-become-sodom-the-sons-of-belial'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*I have two daughters... bring them out unto you* (Genesis 19:8) — the same dreadful offer to appease the mob, repeated at Gibeah (Judges 19:24).'
  FROM cross_reference_threads t
  JOIN _s345_jdg19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=19 AND sv.verse_number=24
  JOIN _s345_jdg19_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=19 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-19-gibeah-become-sodom-the-sons-of-belial'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*do ye to them as is good in your eyes* (Genesis 19:8) — at Sodom the daughters were spared by the angels; at Gibeah there was no such deliverance (Judges 19:25), the people sunk lower than Sodom.'
  FROM cross_reference_threads t
  JOIN _s345_jdg19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=19 AND sv.verse_number=25
  JOIN _s345_jdg19_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=19 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-19-gibeah-become-sodom-the-sons-of-belial'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ===== THREAD 2 members =====
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Up, and let us be going. But none answered* (Judges 19:28) — the abused woman, fallen on the threshold (Judges 19:25-27), the innocent VICTIM of the city''s depravity, never the enemy.'
  FROM cross_reference_threads t
  JOIN _s345_jdg19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=19 AND sv.verse_number=25
  JOIN _s345_jdg19_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=19 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-19-the-concubine-the-victim-of-the-collapse'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ===== THREAD 3 members =====
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*they have committed lewdness and folly in Yashar''el (Israel)* (Judges 20:6) — the tribes'' answer to the twelve severed pieces and the summons to consider (Judges 19:29).'
  FROM cross_reference_threads t
  JOIN _s345_jdg19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=19 AND sv.verse_number=29
  JOIN _s345_jdg19_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=20 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-19-as-in-the-days-of-gibeah-no-king-every-man-right'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*They have deeply corrupted themselves, as in the days of Gibeah* (Hosea 9:9) — the prophet names this night the byword of Yashar''el''s lowest corruption.'
  FROM cross_reference_threads t
  JOIN _s345_jdg19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=19 AND sv.verse_number=30
  JOIN _s345_jdg19_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=9 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-19-as-in-the-days-of-gibeah-no-king-every-man-right'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*O Yashar''el (Israel), thou hast sinned from the days of Gibeah* (Hosea 10:9) — Hosea reaches back again to this chapter as the root of the nation''s sin.'
  FROM cross_reference_threads t
  JOIN _s345_jdg19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=19 AND sv.verse_number=30
  JOIN _s345_jdg19_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=10 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-19-as-in-the-days-of-gibeah-no-king-every-man-right'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*In those days there was no king in Yashar''el (Israel)... every man did that which was right in his own eyes* (Judges 17:6) — the refrain that opens the horror (Judges 19:1), the diagnosis of the collapse.'
  FROM cross_reference_threads t
  JOIN _s345_jdg19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=19 AND sv.verse_number=1
  JOIN _s345_jdg19_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=17 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-19-as-in-the-days-of-gibeah-no-king-every-man-right'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*In those days there was no king in Yashar''el (Israel): every man did that which was right in his own eyes* (Judges 21:25) — the book seals the whole Gibeah account with this verdict, the same word that framed it (Judges 19:1).'
  FROM cross_reference_threads t
  JOIN _s345_jdg19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=19 AND sv.verse_number=1
  JOIN _s345_jdg19_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=21 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-19-as-in-the-days-of-gibeah-no-king-every-man-right'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_judges_20.sql (Judges 20) -----
-- Chapter: Judges 20  | tag: jdg20 | view: _s345_jdg20_lookup | sort band: 36125, 36128, 36131
-- All Yashar'el gathers as one man to Mizpeh over the outrage at Gibeah; Benjamin
-- defends the sons of Belial and goes to war for its guilty; Yashar'el inquires of
-- Yahuah, is twice defeated, weeps and fasts; on the third day Yahuah delivers
-- Benjamin and the tribe is all but exterminated — 600 men escape to the rock Rimmon.
--
-- Judges 20 coverage:
--   v.1-11 (gathered as one man, the Levite's report, the resolve against Gibeah):
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: woven into thread 1 frame (the congregation as one man); no standalone add
--   v.12-14 (deliver the children of Belial that we may put away evil; Benjamin would not hearken, went to war):
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Deut 13:5 put-the-evil-away, Deut 13:13 children-of-Belial, Deut 13:6-8 no-pity-on-brother  -> THREAD 1
--   v.15-17 (the numbering of the armies):
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: none warranted (census detail)
--   v.18,23,26-28 (asked counsel of Elohim, Yahudah first; wept before Yahuah; fasted, enquired by the ark/Phinehas):
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Judges 1:1-2 the same inquiry that opens the book (Yahudah up first), Numbers 27:21 the Urim-inquiry  -> THREAD 2
--   v.19-45 (the three days of battle, the ambush, the rout):
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: woven into thread 3 frame; no standalone add
--   v.46-48 (25,000 of Benjamin fell, 600 fled to Rimmon, the cities burned):
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Hosea 10:9 the days of Gibeah, Judges 21:6/21:17 one tribe cut off / a tribe not destroyed, Genesis 49:27 Benjamin the ravening wolf  -> THREAD 3
--
-- THREADS:
--   judges-20-benjamin-defended-the-sons-of-belial-rather-than-put-the-evil-away (free) — Tanakh: Deut 13
--   judges-20-they-inquired-of-yahuah-and-wept-the-just-cause-still-chastened (free) — Tanakh: Judges 1, Numbers 27
--   judges-20-benjamin-near-exterminated-brother-against-brother-the-days-of-gibeah (free) — Tanakh: Hosea 10, Judges 21, Genesis 49

CREATE TEMP VIEW _s345_jdg20_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: Benjamin defended the sons of Belial rather than put the evil away (Deut 13)
    ('canon','judges',20,13,'canon','deuteronomy',13,5,'free',
      E'*And that prophet, or that dreamer of dreams, shall be put to death... So shalt thou put the evil away from the midst of thee* (Deuteronomy 13:5). Yashar''el (Israel) demands of Benjamin exactly what the Torah commanded: *Now therefore deliver us the men, the children of Belial, which are in Gibeah, that we may put them to death, and put away evil from Yashar''el (Israel)* (Judges 20:13). The very phrase of Deut 13 — *put the evil away* — is the lawful claim; the tribe''s refusal is the refusal of Torah.'),
    ('canon','judges',20,13,'canon','deuteronomy',13,13,'free',
      E'*Certain men, the children of Belial, are gone out from among you, and have withdrawn the inhabitants of their city* (Deuteronomy 13:13). The Torah names the very offenders Gibeah harbored — *the children of Belial, which are in Gibeah* (Judges 20:13) — and prescribes the inquiry and the purge; the men of Gibeah are the sons of Belial Deut 13 said to root out.'),
    ('canon','judges',20,13,'canon','deuteronomy',13,6,'free',
      E'*If thy brother, the son of thy mother, or thy son, or thy daughter, or the wife of thy bosom... entice thee secretly, saying, Let us go and serve other gods... thou shalt not consent unto him, nor hearken unto him; neither shall thine eye pity him* (Deuteronomy 13:6,8). Torah forbids sparing even the nearest kin who do evil; Benjamin does the opposite — it pities its own and *would not hearken to the voice of their brethren* (Judges 20:13), shielding the guilty that should have died.'),
    -- THREAD 1 link verse: 20:14 Benjamin gathered to war
    ('canon','judges',20,14,'canon','deuteronomy',13,5,'free',
      E'*So shalt thou put the evil away from the midst of thee* (Deuteronomy 13:5). Instead of surrendering the wicked, *the children of Benjamin gathered themselves together out of the cities unto Gibeah, to go out to battle against the children of Yashar''el (Israel)* (Judges 20:14) — the tribe takes up arms FOR the sons of Belial rather than purge them, inverting the very command that the evil be put away.'),

    -- THREAD 2: they inquired of Yahuah and wept — the just cause still chastened (Judges 1, Numbers 27)
    ('canon','judges',20,18,'canon','judges',1,1,'free',
      E'*Now after the death of Joshua it came to pass, that the children of Yashar''el (Israel) asked Yahuah (LORD), saying, Who shall go up for us against the Canaanites first* (Judges 1:1). The book opened with this same inquiry; now it closes the cycle of judges with it — *they... asked counsel of Elohim (God), and said, Which of us shall go up first* (Judges 20:18) — but the enemy now is a brother-tribe, the same question turned inward upon Yashar''el.'),
    ('canon','judges',20,18,'canon','judges',1,2,'free',
      E'*And Yahuah (LORD) said, Yahudah (Judah) shall go up: behold, I have delivered the land into his hand* (Judges 1:2). The answer that began the book — Yahudah first — is the answer again: *And Yahuah (LORD) said, Yahudah (Judah) shall go up first* (Judges 20:18); the tribe of the sceptre leads, yet here goes up to weep and be defeated before the deliverance comes.'),
    ('canon','judges',20,18,'canon','numbers',27,21,'free',
      E'*And he shall stand before Eleazar the priest, who shall ask counsel for him after the judgment of Urim before Yahuah (LORD): at his word shall they go out, and at his word they shall come in* (Numbers 27:21). The inquiry *asked counsel of Elohim (God)* (Judges 20:18) is the appointed Urim-means of seeking Yahuah''s word — the same channel established for Joshua now sought by all the tribes at the house of Elohim.'),
    ('canon','judges',20,23,'canon','judges',1,2,'free',
      E'*And Yahuah (LORD) said, Yahudah (Judah) shall go up* (Judges 1:2). Even after the first slaughter the people return to the same inquiry, now in tears: *And the children of Yashar''el (Israel) went up and wept before Yahuah (LORD) until even, and asked counsel of Yahuah (LORD)... And Yahuah (LORD) said, Go up against him* (Judges 20:23). The just cause is granted yet not spared the chastening — the weeping and the going-up belong together.'),
    ('canon','judges',20,28,'canon','numbers',27,21,'free',
      E'*at his word shall they go out, and at his word they shall come in* (Numbers 27:21). The third inquiry is answered with the promise of deliverance: *And Yahuah (LORD) said, Go up; for to morrow I will deliver them into thine hand* (Judges 20:28) — the Urim-inquiry before the ark, with Phinehas the priest standing, finally brings the word that gives the victory, after the fasting and the tears.'),

    -- THREAD 3: Benjamin near exterminated — brother against brother, the days of Gibeah (Hosea 10, Judges 21, Genesis 49)
    ('canon','judges',20,46,'canon','hosea',10,9,'free',
      E'*O Yashar''el (Israel), thou hast sinned from the days of Gibeah: there they stood: the battle in Gibeah against the children of iniquity did not overtake them* (Hosea 10:9). Centuries later the prophet makes Gibeah the byword for Yashar''el''s deepest wound — *So that all which fell that day of Benjamin were twenty and five thousand men that drew the sword* (Judges 20:46); the near-destruction of a tribe becomes the measure of how far the people had fallen.'),
    ('canon','judges',20,46,'canon','judges',21,17,'free',
      E'*And they said, There must be an inheritance for them that be escaped of Benjamin, that a tribe be not destroyed out of Yashar''el (Israel)* (Judges 21:17). The slaughter of *twenty and five thousand men* (Judges 20:46) brings Yashar''el to the brink the next chapter must repair — a whole tribe all but blotted out, the elders scrambling that *a tribe be not destroyed out of Yashar''el*.'),
    ('canon','judges',20,48,'canon','hosea',10,9,'free',
      E'*O Yashar''el (Israel), thou hast sinned from the days of Gibeah* (Hosea 10:9). The avenging turns total — *the men of Yashar''el (Israel) turned again upon the children of Benjamin, and smote them with the edge of the sword... also they set on fire all the cities* (Judges 20:48); brother destroying brother and burning his cities is the very sin the prophet recalls — Yashar''el wounding Yashar''el, the tragedy of a people turned upon itself.'),
    ('canon','judges',20,48,'canon','judges',21,6,'free',
      E'*And the children of Yashar''el (Israel) repented them for Benjamin their brother, and said, There is one tribe cut off from Yashar''el (Israel) this day* (Judges 21:6). The fire that consumed *all the cities* (Judges 20:48) leaves the nation grieving its own act — *one tribe cut off* — the avengers weeping over the brother they nearly erased.'),
    ('canon','judges',20,48,'canon','genesis',49,27,'free',
      E'*Benjamin shall ravin as a wolf: in the morning he shall devour the prey, and at night he shall divide the spoil* (Genesis 49:27). Jacob''s last-days word over Benjamin is darkened here: the ravening wolf has devoured within the fold, and now the fold devours the wolf — *they... smote them with the edge of the sword, as well the men of every city, as the beast* (Judges 20:48), the tribe of the prey itself made prey.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s345_jdg20_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s345_jdg20_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== threads =====
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judges-20-benjamin-defended-the-sons-of-belial-rather-than-put-the-evil-away',
       E'Benjamin defended the sons of Belial rather than put the evil away',
       E'Yashar''el (Israel) comes to Benjamin with a lawful demand straight out of the Torah: *Now therefore deliver us the men, the children of Belial, which are in Gibeah, that we may put them to death, and put away evil from Yashar''el (Israel)* (Judges 20:13). The phrase is Deuteronomy''s own — *So shalt thou put the evil away from the midst of thee* (Deuteronomy 13:5) — and Deut 13 even names the offenders: *Certain men, the children of Belial, are gone out from among you* (Deuteronomy 13:13). The Torah is unsparing: *if thy brother... entice thee... neither shall thine eye pity him* (Deuteronomy 13:6,8). Benjamin does the exact opposite. It pities its own and *would not hearken to the voice of their brethren* (Judges 20:13); *the children of Benjamin gathered themselves together... to go out to battle against the children of Yashar''el (Israel)* (Judges 20:14). A tribe takes up arms FOR the sons of Belial rather than purge them — shielding the guilty the Torah said must die. This is the moral inversion at the root of the whole tragedy: the evil is not put away, the tribe defends its wicked, and Yashar''el is dragged into war against a brother.',
       sv.verse_id, ev.verse_id, 'free', 36125
  FROM _s345_jdg20_lookup sv, _s345_jdg20_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=20 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='judges' AND ev.chapter_number=20 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judges-20-they-inquired-of-yahuah-and-wept-the-just-cause-still-chastened',
       E'They inquired of Yahuah and wept — the just cause still chastened',
       E'Three times Yashar''el (Israel) seeks Yahuah before the war is won, and the inquiry binds this chapter back to the book''s beginning. The book of Judges opened, *Now after the death of Joshua... the children of Yashar''el (Israel) asked Yahuah (LORD), saying, Who shall go up for us against the Canaanites first... And Yahuah (LORD) said, Yahudah (Judah) shall go up* (Judges 1:1-2); now the same question and the same answer return — *Which of us shall go up first to the battle against the children of Benjamin? And Yahuah (LORD) said, Yahudah (Judah) shall go up first* (Judges 20:18) — but the enemy is now a brother-tribe, the cycle turned inward. The seeking is the appointed Urim-inquiry given to Joshua: *he shall stand before Eleazar the priest, who shall ask counsel for him after the judgment of Urim before Yahuah (LORD)* (Numbers 27:21). Yet the just cause is not spared the chastening. After the first slaughter they *went up and wept before Yahuah (LORD) until even, and asked counsel of Yahuah (LORD)... Go up against him* (Judges 20:23); after the second they *wept, and sat there before Yahuah (LORD), and fasted that day until even* (Judges 20:26), and only then comes the word, *Go up; for to morrow I will deliver them into thine hand* (Judges 20:28). The inquiry, the tears, and the fasting belong together: even the cause that is right must be humbled before Yahuah before it is given the victory.',
       sv.verse_id, ev.verse_id, 'free', 36128
  FROM _s345_jdg20_lookup sv, _s345_jdg20_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=20 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='judges' AND ev.chapter_number=20 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judges-20-benjamin-near-exterminated-brother-against-brother-the-days-of-gibeah',
       E'Benjamin near exterminated — brother against brother, the days of Gibeah',
       E'On the third day Yahuah delivers Benjamin into Yashar''el''s hand and the tribe is all but blotted out: *all which fell that day of Benjamin were twenty and five thousand men that drew the sword* (Judges 20:46), and *the men of Yashar''el (Israel) turned again upon the children of Benjamin, and smote them with the edge of the sword, as well the men of every city, as the beast... also they set on fire all the cities that they came to* (Judges 20:48). Only six hundred men escape to the rock Rimmon. This is brother destroying brother — Yashar''el wounding Yashar''el, a whole tribe of the twelve nearly erased. Centuries later the prophet makes it the byword for the people''s deepest fall: *O Yashar''el (Israel), thou hast sinned from the days of Gibeah* (Hosea 10:9). The next chapter recoils in grief — *There is one tribe cut off from Yashar''el (Israel) this day* (Judges 21:6) — and scrambles *that a tribe be not destroyed out of Yashar''el (Israel)* (Judges 21:17). And Jacob''s last-days word is darkened: *Benjamin shall ravin as a wolf: in the morning he shall devour the prey, and at night he shall divide the spoil* (Genesis 49:27) — the ravening wolf devoured within the fold, and the fold devoured the wolf. This is the wound the two-house framework grieves: a people turned upon itself, self-righteous and self-destroying, in the days when *there was no king in Yashar''el (Israel): every man did that which was right in his own eyes*.',
       sv.verse_id, ev.verse_id, 'free', 36131
  FROM _s345_jdg20_lookup sv, _s345_jdg20_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=20 AND sv.verse_number=46
   AND ev.edition_slug='canon' AND ev.book_slug='judges' AND ev.chapter_number=20 AND ev.verse_number=48
ON CONFLICT (slug) DO NOTHING;

-- ===== thread_members =====
-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*So shalt thou put the evil away from the midst of thee* (Deuteronomy 13:5) — the very phrase Yashar''el invokes demanding the men of Gibeah; Benjamin refuses the command.'
  FROM cross_reference_threads t
  JOIN _s345_jdg20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=20 AND sv.verse_number=13
  JOIN _s345_jdg20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=13 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-20-benjamin-defended-the-sons-of-belial-rather-than-put-the-evil-away'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Certain men, the children of Belial, are gone out from among you* (Deuteronomy 13:13) — the Torah names the very offenders Gibeah harbored.'
  FROM cross_reference_threads t
  JOIN _s345_jdg20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=20 AND sv.verse_number=13
  JOIN _s345_jdg20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=13 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-20-benjamin-defended-the-sons-of-belial-rather-than-put-the-evil-away'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*neither shall thine eye pity him* (Deuteronomy 13:6,8) — Torah forbids sparing even the nearest kin who do evil; Benjamin pities its own instead.'
  FROM cross_reference_threads t
  JOIN _s345_jdg20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=20 AND sv.verse_number=13
  JOIN _s345_jdg20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=13 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-20-benjamin-defended-the-sons-of-belial-rather-than-put-the-evil-away'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*So shalt thou put the evil away* (Deuteronomy 13:5) — Benjamin instead gathers to war FOR the sons of Belial (Judges 20:14), inverting the command.'
  FROM cross_reference_threads t
  JOIN _s345_jdg20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=20 AND sv.verse_number=14
  JOIN _s345_jdg20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=13 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-20-benjamin-defended-the-sons-of-belial-rather-than-put-the-evil-away'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*the children of Yashar''el (Israel) asked Yahuah (LORD), saying, Who shall go up... first* (Judges 1:1) — the book''s opening inquiry returns, now turned against a brother-tribe.'
  FROM cross_reference_threads t
  JOIN _s345_jdg20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=20 AND sv.verse_number=18
  JOIN _s345_jdg20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=1 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-20-they-inquired-of-yahuah-and-wept-the-just-cause-still-chastened'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*And Yahuah (LORD) said, Yahudah (Judah) shall go up* (Judges 1:2) — the same answer that began the book; the tribe of the sceptre leads again.'
  FROM cross_reference_threads t
  JOIN _s345_jdg20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=20 AND sv.verse_number=18
  JOIN _s345_jdg20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=1 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-20-they-inquired-of-yahuah-and-wept-the-just-cause-still-chastened'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*who shall ask counsel for him after the judgment of Urim before Yahuah (LORD)* (Numbers 27:21) — the appointed Urim-means of seeking Yahuah''s word, sought now by all the tribes.'
  FROM cross_reference_threads t
  JOIN _s345_jdg20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=20 AND sv.verse_number=18
  JOIN _s345_jdg20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=27 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-20-they-inquired-of-yahuah-and-wept-the-just-cause-still-chastened'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*And Yahuah (LORD) said, Yahudah (Judah) shall go up* (Judges 1:2) — the same word renewed after the first defeat, the weeping cause sent up again (Judges 20:23).'
  FROM cross_reference_threads t
  JOIN _s345_jdg20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=20 AND sv.verse_number=23
  JOIN _s345_jdg20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=1 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-20-they-inquired-of-yahuah-and-wept-the-just-cause-still-chastened'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*at his word shall they go out, and at his word they shall come in* (Numbers 27:21) — the third inquiry, before the ark with Phinehas standing, finally brings the word of deliverance (Judges 20:28).'
  FROM cross_reference_threads t
  JOIN _s345_jdg20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=20 AND sv.verse_number=28
  JOIN _s345_jdg20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=27 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-20-they-inquired-of-yahuah-and-wept-the-just-cause-still-chastened'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*thou hast sinned from the days of Gibeah* (Hosea 10:9) — the prophet makes Gibeah the byword for Yashar''el''s deepest fall; the 25,000 fallen (Judges 20:46) are that wound.'
  FROM cross_reference_threads t
  JOIN _s345_jdg20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=20 AND sv.verse_number=46
  JOIN _s345_jdg20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=10 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-20-benjamin-near-exterminated-brother-against-brother-the-days-of-gibeah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*that a tribe be not destroyed out of Yashar''el (Israel)* (Judges 21:17) — the slaughter brings the nation to the brink the next chapter must repair.'
  FROM cross_reference_threads t
  JOIN _s345_jdg20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=20 AND sv.verse_number=46
  JOIN _s345_jdg20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=21 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-20-benjamin-near-exterminated-brother-against-brother-the-days-of-gibeah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*thou hast sinned from the days of Gibeah* (Hosea 10:9) — brother burning brother''s cities (Judges 20:48) is the very sin the prophet recalls, Yashar''el wounding Yashar''el.'
  FROM cross_reference_threads t
  JOIN _s345_jdg20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=20 AND sv.verse_number=48
  JOIN _s345_jdg20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=10 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-20-benjamin-near-exterminated-brother-against-brother-the-days-of-gibeah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*There is one tribe cut off from Yashar''el (Israel) this day* (Judges 21:6) — the avengers weep over the brother they nearly erased.'
  FROM cross_reference_threads t
  JOIN _s345_jdg20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=20 AND sv.verse_number=48
  JOIN _s345_jdg20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=21 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-20-benjamin-near-exterminated-brother-against-brother-the-days-of-gibeah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Benjamin shall ravin as a wolf... he shall divide the spoil* (Genesis 49:27) — Jacob''s last-days word darkened: the ravening wolf is itself made prey (Judges 20:48).'
  FROM cross_reference_threads t
  JOIN _s345_jdg20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=20 AND sv.verse_number=48
  JOIN _s345_jdg20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-20-benjamin-near-exterminated-brother-against-brother-the-days-of-gibeah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_judges_21.sql (Judges 21) -----
--
-- Chapter: Judges 21 (THE FINAL CHAPTER OF JUDGES) | tag: jdg21 | view: _s345_jdg21_lookup
-- Sort band: 36150, 36153, 36156
--
-- Judges 21 coverage:
--   v.1-7  (the rash oath; a tribe nearly cut off; how shall we do for wives)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: Deuteronomy 12:8 (every man right in his own eyes — the same diagnosis) [used in v.25 thread];
--                  the man-made fix compounding the disorder is framed in the Jabesh-gilead thread
--   v.8-14 (smite Jabesh-gilead, spare 400 virgins, give them to Benjamin)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: 1 Samuel 11:1-13 (Jabesh-gilead — Saul, the first king, RISES to save the very city
--                  the lawless age slaughtered; the place that needed a king named again at the dawn of the
--                  monarchy) — the Jabesh-gilead / man-made-fix thread
--   v.15-23 (the elders' second scheme — seize the dancing daughters of Shiloh)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: rashness atop rashness, framed in the man-made-fix thread (anchored at the oath v.18)
--   v.24-25 (every man to his inheritance; THE CLOSING REFRAIN: no king, every man right in his own eyes)
--          NT:     Luke 1:32-33 (the throne of his father David; he shall reign for ever — the TRUE KING)
--          Extras: none warranted
--          Tanakh: Deuteronomy 12:8 (every man right in his own eyes — the Torah already named the disorder);
--                  Proverbs 14:12 (the way that seemeth right ends in death); 1 Samuel 8:5-7 (the people demand
--                  a king — rejecting Yahuah as King); 2 Samuel 7:12-16 (the righteous King of David's line,
--                  the throne established for ever) — the closing-refrain / need-for-the-King thread
--
-- Threads (3):
--   judges-21-the-man-made-fixes-compounding-the-disorder  [Tanakh] free
--       v.6,7,11,18 -> Judges 21 self (the breach) + 1 Samuel 11 (Jabesh-gilead saved by the rising king)
--   judges-21-no-king-every-man-right-in-his-own-eyes  [Tanakh + NT] free
--       v.25,24 -> Deuteronomy 12:8 / Proverbs 14:12 / 1 Samuel 8:5,7 / 2 Samuel 7:12,13,16 / Luke 1:32,33
--
-- Framework-load-bearing verse: 21:25 — the closing refrain of the whole book. Framed as the
-- DIAGNOSIS of the entire dark age (self-authority, every man his own law) and the aching NEED FOR
-- THE TRUE KING — answered first in the demanded/failed monarchy (1 Sam 8, which itself REJECTS Yahuah
-- as King), then truly in the righteous KING of David's line who does right in Yahuah's eyes
-- (2 Sam 7 / Luke 1:32-33, the Messiah). The way that SEEMS right ends in death (Prov 14:12);
-- the antidote is the King who reigns in righteousness. NOT a brief for monarchy-as-such, but for THE King.

CREATE TEMP VIEW _s345_jdg21_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===================== B. cross_references =====================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: the man-made fixes compounding the disorder
    ('canon','judges',21,6,  'canon','judges',21,15, 'free',
      E'*And the people repented them for Benjamin, because that Yahuah (LORD) had made a breach in the tribes of Yashar''el (Israel)* (Judges 21:15). The people who *repented them for Benjamin their brother, and said, There is one tribe cut off from Yashar''el (Israel) this day* (21:6) now name the wound for what it is — a *breach in the tribes*. Their own rash oath at Mizpeh tore the body of Yashar''el (Israel); the grief is real, but the remedy they reach for only deepens the disorder.'),
    ('canon','judges',21,7,  'canon','judges',21,18, 'free',
      E'*Howbeit we may not give them wives of our daughters: for the children of Yashar''el (Israel) have sworn, saying, Cursed be he that giveth a wife to Benjamin* (Judges 21:18). The cry *How shall we do for wives for them that remain, seeing we have sworn by Yahuah (LORD) that we will not give them of our daughters to wives?* (21:7) is answered not by repenting of the rash oath but by building a scheme around it — a man-made fix laid atop the man-made vow, rashness compounding rashness.'),
    ('canon','judges',21,11, 'canon','1-samuel',11,1, 'free',
      E'*Then Nahash the Ammonite came up, and encamped against Jabesh-gilead: and all the men of Jabesh said unto Nahash, Make a covenant with us, and we will serve thee* (1 Samuel 11:1). The men of Yashar''el (Israel) here *utterly destroy every male* of Jabesh-gilead (Judges 21:11) to harvest brides — a city slaughtered to patch the breach. The same Jabesh-gilead reappears at the dawn of the monarchy, besieged and helpless, until a KING rises to save it: the lawless age plunders Jabesh; the king delivers it.'),
    ('canon','judges',21,11, 'canon','1-samuel',11,13, 'free',
      E'*And Saul said, There shall not a man be put to death this day: for to day Yahuah (LORD) hath wrought salvation in Yashar''el (Israel)* (1 Samuel 11:13). Where the kingless tribes *utterly destroy* Jabesh-gilead to serve their own scheme (Judges 21:11), the first king delivers that very city and stays the sword — *Yahuah (LORD) hath wrought salvation*. The contrast aches for the King the book has not yet named.'),

    -- THREAD 2: no king; every man right in his own eyes — the closing refrain, the need for the King
    ('canon','judges',21,25, 'canon','deuteronomy',12,8, 'free',
      E'*Ye shall not do after all the things that we do here this day, every man whatsoever is right in his own eyes* (Deuteronomy 12:8). The Torah had already named the very disorder Judges closes on. The book''s last verse — *every man did that which was right in his own eyes* (21:25) — is the exact phrase Moshe (Moses) forbade; the dark age of the Judges is Yashar''el (Israel) doing precisely what Yahuah (LORD) said not to do.'),
    ('canon','judges',21,25, 'canon','proverbs',14,12, 'free',
      E'*There is a way which seemeth right unto a man, but the end thereof are the ways of death* (Proverbs 14:12). When *every man did that which was right in his own eyes* (Judges 21:25), each one walks the way that merely SEEMS right — and the whole book has shown where that road ends: idolatry, civil war, a tribe nearly cut off. Self-authority is not freedom but the way of death; the antidote is not every man''s own eyes but the King who reigns in righteousness.'),
    ('canon','judges',21,25, 'canon','1-samuel',8,5, 'free',
      E'*And said unto him, Behold, thou art old, and thy sons walk not in thy ways: now make us a king to judge us like all the nations* (1 Samuel 8:5). Judges ends aching — *In those days there was no king in Yashar''el (Israel)* (21:25). The cry for a king will be answered, but wrongly: Yashar''el (Israel) demands a king *like all the nations*, a man-made remedy for a heart-deep sickness — the next rash fix in the long chain.'),
    ('canon','judges',21,25, 'canon','1-samuel',8,7, 'free',
      E'*And Yahuah (LORD) said unto Samuel, Hearken unto the voice of the people in all that they say unto thee: for they have not rejected thee, but they have rejected me, that I should not reign over them* (1 Samuel 8:7). The deepest answer to *there was no king in Yashar''el (Israel)* (Judges 21:25) is that Yahuah (LORD) Himself was meant to be King — and in demanding a human one *like all the nations* they reject His reign. The need is real; the King they choose is not the King they need.'),
    ('canon','judges',21,25, 'canon','2-samuel',7,12, 'free',
      E'*And when thy days be fulfilled, and thou shalt sleep with thy fathers, I will set up thy seed after thee, which shall proceed out of thy bowels, and I will establish his kingdom* (2 Samuel 7:12). Against the kingless anarchy where *every man did that which was right in his own eyes* (Judges 21:25), Yahuah (LORD) promises David a SEED — the righteous King of the paternal bloodline who will reign in Yahuah''s eyes, not his own. The ache of Judges 21 is the empty throne this promise fills.'),
    ('canon','judges',21,25, 'canon','2-samuel',7,13, 'free',
      E'*He shall build an house for my name, and I will stablish the throne of his kingdom for ever* (2 Samuel 7:13). The book that ends *there was no king in Yashar''el (Israel)* (Judges 21:25) is answered by an EVERLASTING throne — *I will stablish the throne of his kingdom for ever*. Where the Judges-age throne was empty and every man his own law, the Davidic King''s throne stands for ever.'),
    ('canon','judges',21,25, 'canon','2-samuel',7,16, 'free',
      E'*And thine house and thy kingdom shall be established for ever before thee: thy throne shall be established for ever* (2 Samuel 7:16). The closing wound of Judges — *no king in Yashar''el (Israel)* (21:25) — is bound for ever by an everlasting throne. *Thy throne shall be established for ever*: the answer to the kingless dark age is not a man-made fix but the King whose kingdom has no end.'),
    ('canon','judges',21,25, 'canon','luke',1,32, 'free',
      E'*He shall be great, and shall be called the Son of the Highest: and Yahuah Elohim (the Lord God) shall give unto him the throne of his father David* (Luke 1:32). The empty throne that closes Judges — *In those days there was no king in Yashar''el (Israel)* (21:25) — is filled at last in the Messiah, given *the throne of his father David*. The whole dark age aches forward to THIS King, the seed of David who does right in Yahuah''s eyes.'),
    ('canon','judges',21,25, 'canon','luke',1,33, 'free',
      E'*And he shall reign over the house of Jacob for ever; and of his kingdom there shall be no end* (Luke 1:33). Judges ends with no king and every man his own law (21:25); the answer is the King who *shall reign over the house of Jacob for ever* — the gathered two-house people under one righteous throne, *of his kingdom there shall be no end*. The book that closes in anarchy points, across the canon, to the King who reigns without end.'),
    ('canon','judges',21,24, 'canon','luke',1,33, 'free',
      E'*And he shall reign over the house of Jacob for ever; and of his kingdom there shall be no end* (Luke 1:33). The tribes scatter home — *they went out from thence every man to his inheritance* (Judges 21:24) — a people with no center, no throne, no king. The Messiah is the King who gathers *the house of Jacob* back under one everlasting reign, the antidote to the centerless dark age the book has chronicled.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s345_jdg21_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s345_jdg21_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===================== C. threads =====================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judges-21-the-man-made-fixes-compounding-the-disorder',
       E'The man-made fixes compounding the disorder — Jabesh-gilead and the breach',
       E'Yashar''el (Israel) grieves that a whole tribe is nearly cut off: *And the children of Yashar''el (Israel) repented them for Benjamin their brother, and said, There is one tribe cut off from Yashar''el (Israel) this day* (Judges 21:6). The grief is real — *Yahuah (LORD) had made a breach in the tribes of Yashar''el (Israel)* (21:15) — but the wound was self-inflicted by their own rash oath at Mizpeh.\n\nRather than repent of the rashness, they pile fix upon fix. *How shall we do for wives for them that remain, seeing we have sworn by Yahuah (LORD) that we will not give them of our daughters to wives?* (21:7) is answered not by undoing the vow but by building schemes around it: *Cursed be he that giveth a wife to Benjamin* (21:18). So they *utterly destroy every male, and every woman that hath lain by man* of Jabesh-gilead to harvest brides (21:11), then lie in wait to seize the dancing daughters of Shiloh — rashness compounding rashness, more disorder atop disorder.\n\nThe slaughtered city itself testifies. *Then Nahash the Ammonite came up, and encamped against Jabesh-gilead* (1 Samuel 11:1) — the same Jabesh-gilead, besieged and helpless, until a KING rises to save it: *And Saul said, There shall not a man be put to death this day: for to day Yahuah (LORD) hath wrought salvation in Yashar''el (Israel)* (1 Samuel 11:13). Where the kingless tribes plunder Jabesh to serve their own scheme, the king delivers it. The contrast aches for the King the book has not yet named.',
       sv.verse_id, ev.verse_id, 'free', 36150
  FROM _s345_jdg21_lookup sv, _s345_jdg21_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=21 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='judges' AND ev.chapter_number=21 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judges-21-no-king-every-man-right-in-his-own-eyes',
       E'No king in Yashar''el — every man right in his own eyes: the aching need for the true King',
       E'The whole dark age of the Judges closes on one verse — the diagnosis of everything that came before: *In those days there was no king in Yashar''el (Israel): every man did that which was right in his own eyes* (Judges 21:25). The tribes scatter home, *every man to his inheritance* (21:24): a people with no center, no throne, no King, each one his own law.\n\nThe Torah had already forbidden exactly this: *Ye shall not do after all the things that we do here this day, every man whatsoever is right in his own eyes* (Deuteronomy 12:8). The book''s last words are the very phrase Moshe (Moses) named as the disorder. And wisdom names where that road ends: *There is a way which seemeth right unto a man, but the end thereof are the ways of death* (Proverbs 14:12). Self-authority is not freedom; it is the way of death. The whole book has shown it — idolatry, civil war, a tribe nearly cut off.\n\nThe ache is for a King. But the first answer is a wrong one: *now make us a king to judge us like all the nations* (1 Samuel 8:5), and Yahuah (LORD) answers, *they have not rejected thee, but they have rejected me, that I should not reign over them* (1 Samuel 8:7) — a man-made remedy for a heart-deep sickness, the next rash fix in the long chain. The true answer comes to David: *I will set up thy seed after thee... and I will establish his kingdom* (2 Samuel 7:12); *I will stablish the throne of his kingdom for ever* (7:13); *thy throne shall be established for ever* (7:16).\n\nAnd the everlasting throne is filled at last in the Messiah: *Yahuah Elohim (the Lord God) shall give unto him the throne of his father David: And he shall reign over the house of Jacob for ever; and of his kingdom there shall be no end* (Luke 1:32-33). The book that ends in anarchy — every man right in his own eyes — points across the whole canon to the King who does right in YAHUAH''s eyes, the seed of David who gathers the two-house people under one throne that has no end. Judges leaves us aching for Him.',
       sv.verse_id, ev.verse_id, 'free', 36153
  FROM _s345_jdg21_lookup sv, _s345_jdg21_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=21 AND sv.verse_number=24
   AND ev.edition_slug='canon' AND ev.book_slug='judges' AND ev.chapter_number=21 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

-- ===================== D. thread_members =====================
-- THREAD 1: the man-made fixes compounding the disorder
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Yahuah (LORD) had made a breach in the tribes of Yashar''el (Israel)* (Judges 21:15) — the self-inflicted wound named for what it is.'
  FROM cross_reference_threads t
  JOIN _s345_jdg21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=21 AND sv.verse_number=6
  JOIN _s345_jdg21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=21 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-21-the-man-made-fixes-compounding-the-disorder'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Cursed be he that giveth a wife to Benjamin* (Judges 21:18) — a scheme built around the rash oath rather than repentance of it.'
  FROM cross_reference_threads t
  JOIN _s345_jdg21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=21 AND sv.verse_number=7
  JOIN _s345_jdg21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=21 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-21-the-man-made-fixes-compounding-the-disorder'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Nahash the Ammonite came up, and encamped against Jabesh-gilead* (1 Samuel 11:1) — the city plundered here, besieged again at the dawn of the monarchy.'
  FROM cross_reference_threads t
  JOIN _s345_jdg21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=21 AND sv.verse_number=11
  JOIN _s345_jdg21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=11 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-21-the-man-made-fixes-compounding-the-disorder'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Yahuah (LORD) hath wrought salvation in Yashar''el (Israel)* (1 Samuel 11:13) — the king delivers the very city the kingless tribes destroyed.'
  FROM cross_reference_threads t
  JOIN _s345_jdg21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=21 AND sv.verse_number=11
  JOIN _s345_jdg21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=11 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-21-the-man-made-fixes-compounding-the-disorder'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2: no king; every man right in his own eyes
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*every man whatsoever is right in his own eyes* (Deuteronomy 12:8) — the Torah named this disorder before Judges enacted it.'
  FROM cross_reference_threads t
  JOIN _s345_jdg21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=21 AND sv.verse_number=25
  JOIN _s345_jdg21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=12 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-21-no-king-every-man-right-in-his-own-eyes'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*the end thereof are the ways of death* (Proverbs 14:12) — the way that SEEMS right to every man''s own eyes ends in death.'
  FROM cross_reference_threads t
  JOIN _s345_jdg21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=21 AND sv.verse_number=25
  JOIN _s345_jdg21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=14 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-21-no-king-every-man-right-in-his-own-eyes'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*make us a king to judge us like all the nations* (1 Samuel 8:5) — the ache for a king answered first by a wrong, man-made remedy.'
  FROM cross_reference_threads t
  JOIN _s345_jdg21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=21 AND sv.verse_number=25
  JOIN _s345_jdg21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=8 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-21-no-king-every-man-right-in-his-own-eyes'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*they have rejected me, that I should not reign over them* (1 Samuel 8:7) — Yahuah (LORD) Himself was the King they were meant to have.'
  FROM cross_reference_threads t
  JOIN _s345_jdg21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=21 AND sv.verse_number=25
  JOIN _s345_jdg21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=8 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-21-no-king-every-man-right-in-his-own-eyes'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*I will set up thy seed after thee... and I will establish his kingdom* (2 Samuel 7:12) — the righteous King of David''s bloodline, the true answer.'
  FROM cross_reference_threads t
  JOIN _s345_jdg21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=21 AND sv.verse_number=25
  JOIN _s345_jdg21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=7 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-21-no-king-every-man-right-in-his-own-eyes'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*I will stablish the throne of his kingdom for ever* (2 Samuel 7:13) — an everlasting throne against the empty throne of Judges.'
  FROM cross_reference_threads t
  JOIN _s345_jdg21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=21 AND sv.verse_number=25
  JOIN _s345_jdg21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=7 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-21-no-king-every-man-right-in-his-own-eyes'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*thy throne shall be established for ever* (2 Samuel 7:16) — the kingless dark age answered by a throne without end.'
  FROM cross_reference_threads t
  JOIN _s345_jdg21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=21 AND sv.verse_number=25
  JOIN _s345_jdg21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=7 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-21-no-king-every-man-right-in-his-own-eyes'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*Yahuah Elohim (the Lord God) shall give unto him the throne of his father David* (Luke 1:32) — the empty throne filled at last in the Messiah.'
  FROM cross_reference_threads t
  JOIN _s345_jdg21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=21 AND sv.verse_number=25
  JOIN _s345_jdg21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=32
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-21-no-king-every-man-right-in-his-own-eyes'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'*he shall reign over the house of Jacob for ever; and of his kingdom there shall be no end* (Luke 1:33) — the King who gathers the two-house people under one endless reign.'
  FROM cross_reference_threads t
  JOIN _s345_jdg21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=21 AND sv.verse_number=25
  JOIN _s345_jdg21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-21-no-king-every-man-right-in-his-own-eyes'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 10, E'*he shall reign over the house of Jacob for ever* (Luke 1:33) — the tribes scattered home (Judges 21:24) gathered again under one throne.'
  FROM cross_reference_threads t
  JOIN _s345_jdg21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='judges' AND sv.chapter_number=21 AND sv.verse_number=24
  JOIN _s345_jdg21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='judges-21-no-king-every-man-right-in-his-own-eyes'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session345 — Judges cross-references complete.'
