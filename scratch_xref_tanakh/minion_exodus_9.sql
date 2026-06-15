-- ----- fragment: minion_exodus_9.sql (Exodus 9) -----
-- Chapter: Exodus 9 (murrain, boils, hail; "for this cause have I raised thee up")
-- Tag: ex09   Session: s305   Sort band base: 29200 (step 3)
--
-- Exodus 9 coverage:
--   v.1-2  (Let my people go / refusal)
--          NT:     none warranted (the demand recurs; framed in keystone)
--          Extras: none warranted
--          Tanakh: none warranted (lateral within-Exodus)
--   v.3-7  (a very grievous murrain on the cattle; Yahuah severs Yashar'el's cattle)
--          NT:     none warranted
--          Extras: none warranted (Wisdom retells the broader signs; bound to hail thread)
--          Tanakh: Psalm 78:48,50 (cattle given to hail / life to pestilence) + Psalm 105:bound to hail -> THREAD 2
--   v.7    (heart of Pharaoh was hardened)
--          NT:     Romans 9:18 (whom he will he hardeneth) -> THREAD 1
--          Extras: none warranted
--          Tanakh: Exodus 8:15 self-hardening counter-witness -> THREAD 1
--   v.8-12 (the boil with blains upon man and beast; the boil was upon the magicians)
--          NT:     Revelation 16:2 (noisome grievous sore on them with the mark of the beast) -> THREAD 3
--          Extras: none warranted
--          Tanakh: Deuteronomy 28:27,35 (the botch/boil of Egypt as covenant-sanction) -> THREAD 3
--   v.13-16 (all my plagues / that thou mayest know there is none like me / FOR THIS CAUSE RAISED THEE UP)
--          NT:     Romans 9:17 (the scripture saith unto Pharaoh -- quoted BY NAME), Romans 9:18 -> THREAD 1 (KEYSTONE)
--          Extras: none warranted
--          Tanakh: Exodus 8:15 (he hardened his heart -- self-hardening) -> THREAD 1
--   v.18-26 (hail mingled with fire, very grievous; those who feared the word brought servants in; Goshen spared)
--          NT:     Revelation 8:7 (hail and fire mingled with blood), Revelation 16:21 (the great hail) -> THREAD 4
--          Extras: Wisdom of Solomon 16:16 (strange rains, hails, fire consumed), 16:22 (fire burning in the hail) -> THREAD 4
--          Tanakh: Psalm 78:47-48 (vines with hail, cattle to hail), Psalm 105:32 (hail for rain, flaming fire) -> THREAD 4 / THREAD 2
--   v.27-35 (I have sinned / Yahuah is righteous; he sinned yet more and hardened his heart)
--          NT:     bound to keystone (self-hardening pattern) -> THREAD 1
--          Extras: none warranted
--          Tanakh: none warranted
--
-- THREADS (4):
--   1. exodus-9-for-this-cause-have-i-raised-thee-up   [free]  -> Romans (NT) + Exodus lateral
--        KEYSTONE. 9:16 quoted BY NAME at Romans 9:17; 9:18 hardening; Exod 8:15 self-hardening counter-witness.
--        Frame: covenant judgment + glory of the Name, the self-hardening vessel of wrath -- NOT arbitrary reprobation of a people.
--   2. exodus-9-a-very-grievous-murrain-on-the-cattle  [free]  -> Psalms (Tanakh)
--   3. exodus-9-the-boil-of-egypt-upon-the-magicians   [free]  -> Deuteronomy (Tanakh) + Revelation (NT)
--   4. exodus-9-hail-and-fire-mingled-very-grievous    [extras]-> Revelation (NT) + Psalms (Tanakh) + Wisdom of Solomon (apocrypha)

CREATE TEMP VIEW _s305_ex09_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: for this cause have I raised thee up (keystone)
    ('canon','exodus',9,16,'canon','romans',9,17,'free',
     E'*For the scripture saith unto Pharaoh, Even for this same purpose have I raised thee up, that I might shew my power in thee, and that my name might be declared throughout all the earth* (Romans 9:17). Sha''ul quotes Exodus 9:16 to Pharaoh BY NAME, word for word: *And in very deed for this cause have I raised thee up, for to shew in thee my power; and that my name may be declared throughout all the earth* (Exodus 9:16). Yahuah (LORD) raises up and judges a self-hardening oppressor not to crush him arbitrarily but to *shew in thee my power* and that *my name may be declared throughout all the earth* — the whole plague-cycle is the glory of the Name made known to the nations.'),
    ('canon','exodus',9,16,'canon','romans',9,18,'free',
     E'*Therefore hath he mercy on whom he will have mercy, and whom he will he hardeneth* (Romans 9:18). The hardening at issue is Pharaoh''s — *And in very deed for this cause have I raised thee up* (Exodus 9:16) — and Pharaoh fitted himself: again and again *the heart of Pharaoh was hardened, and he did not let the people go* (Exodus 9:7) and *he sinned yet more, and hardened his heart* (Exodus 9:34). Yahuah hands the self-hardened man over to his own choosing; this is covenant judgment on a tyrant, not the reprobation of a people — the same passage ends gathering *my people, which were not my people* (Romans 9:25).'),
    ('canon','exodus',9,7,'canon','romans',9,18,'free',
     E'*Therefore hath he mercy on whom he will have mercy, and whom he will he hardeneth* (Romans 9:18). Where Yahuah (LORD) is said to harden, the text first shows the man hardening himself: *And the heart of Pharaoh was hardened, and he did not let the people go* (Exodus 9:7). The vessel of wrath shapes its own clay by repeated refusal before *Yahuah (LORD) hardened the heart of Pharaoh* (Exodus 9:12).'),
    ('canon','exodus',9,16,'canon','exodus',8,15,'free',
     E'*But when Pharaoh saw that there was respite, he hardened his heart, and hearkened not unto them; as Yahuah (LORD) had said* (Exodus 8:15). Before Yahuah is ever said to harden, Pharaoh hardens himself the moment relief comes — the self-hardening counter-witness to *for this cause have I raised thee up* (Exodus 9:16). The vessel of wrath fits itself to destruction by its own repeated choosing.'),
    -- THREAD 2: a very grievous murrain on the cattle
    ('canon','exodus',9,3,'canon','psalms',78,48,'free',
     E'*He gave up their cattle also to the hail, and their flocks to hot thunderbolts* (Psalm 78:48). The psalmist sings the very judgment Exodus 9 narrates — *Behold, the hand of Yahuah (LORD) is upon thy cattle which is in the field... there shall be a very grievous murrain* (Exodus 9:3) — naming Egypt''s cattle struck down as the wondrous works to be told to the children (Psalm 78:4).'),
    ('canon','exodus',9,6,'canon','psalms',78,50,'free',
     E'*He made a way to his anger; he spared not their soul from death, but gave their life over to the pestilence* (Psalm 78:50). The grievous murrain that struck Egypt — *all the cattle of Egypt died: but of the cattle of the children of Yashar''el (Israel) died not one* (Exodus 9:6) — is sung as the pestilence by which Yahuah severed his own people from the oppressor.'),
    -- THREAD 3: the boil of Egypt upon the magicians
    ('canon','exodus',9,11,'canon','deuteronomy',28,27,'free',
     E'*Yahuah (LORD) will smite thee with the botch of Egypt, and with the emerods, and with the scab, and with the itch, whereof thou canst not be healed* (Deuteronomy 28:27). The boil that fell on Egypt and silenced its sorcerers — *the magicians could not stand before Moses because of the boils; for the boil was upon the magicians* (Exodus 9:11) — is named *the botch of Egypt* and set as a covenant-sanction: the plague that judged the oppressor will fall on covenant-breaking Yashar''el too if she walks as Egypt walked.'),
    ('canon','exodus',9,11,'canon','deuteronomy',28,35,'free',
     E'*Yahuah (LORD) shall smite thee in the knees, and in the legs, with a sore botch that cannot be healed, from the sole of thy foot unto the top of thy head* (Deuteronomy 28:35). The same incurable boil — *a boil breaking forth with blains upon man, and upon beast* (Exodus 9:9) — stands in the Torah''s curse-list as a sanction within the covenant, the Egypt-plague turned witness against unfaithfulness.'),
    ('canon','exodus',9,9,'canon','revelation',16,2,'free',
     E'*And the first went, and poured out his vial upon the earth; and there fell a noisome and grievous sore upon the men which had the mark of the beast, and upon them which worshipped his image* (Revelation 16:2). The boil-plague is taken up in the bowls of wrath: as the boil struck Egypt''s counterfeiters — *the boil was upon the magicians* (Exodus 9:11) — so *a noisome and grievous sore* falls on the worshippers of the end-time counterfeit kingdom. *A boil breaking forth with blains upon man, and upon beast* (Exodus 9:9) becomes the pattern for the sore on those marked by the beast.'),
    -- THREAD 4: hail and fire mingled, very grievous
    ('canon','exodus',9,24,'canon','revelation',8,7,'free',
     E'*The first angel sounded, and there followed hail and fire mingled with blood, and they were cast upon the earth: and the third part of trees was burnt up, and all green grass was burnt up* (Revelation 8:7). The Egypt-hail is taken up in the trumpets: *there was hail, and fire mingled with the hail, very grievous, such as there was none like it in all the land of Egypt* (Exodus 9:24). The fire-mingled hail that *brake every tree of the field* (Exodus 9:25) becomes the first trumpet that burns the trees and grass — the plagues of Egypt enlarged onto the whole earth.'),
    ('canon','exodus',9,24,'canon','revelation',16,21,'free',
     E'*And there fell upon men a great hail out of heaven, every stone about the weight of a talent: and men blasphemed Elohim (God) because of the plague of the hail; for the plague thereof was exceeding great* (Revelation 16:21). The last bowl is the Egypt-hail come to its full measure — *such as hath not been in Egypt since the foundation thereof even until now* (Exodus 9:18) — and as Pharaoh hardened after the hail ceased (Exodus 9:34), so the men under the great hail *blasphemed Elohim (God)* and repented not.'),
    ('canon','exodus',9,23,'canon','psalms',78,47,'free',
     E'*He destroyed their vines with hail, and their sycomore trees with frost* (Psalm 78:47). The psalm rehearses the seventh plague — *Yahuah (LORD) sent thunder and hail, and the fire ran along upon the ground* (Exodus 9:23) — counting the hail among the signs Yahuah wrought in the field of Zoan that the generations might not forget his works.'),
    ('canon','exodus',9,23,'canon','psalms',105,32,'free',
     E'*He gave them hail for rain, and flaming fire in their land* (Psalm 105:32). The hail-and-fire of Exodus 9 — *and the fire ran along upon the ground; and Yahuah (LORD) rained hail upon the land of Egypt* (Exodus 9:23) — is sung in the great covenant-psalm as Yahuah remembering *his covenant for ever* (Psalm 105:8) and bringing his people out to *keep his laws* (Psalm 105:45). The wonder serves the seed-promise, not mere wrath.'),
    ('canon','exodus',9,24,'apocrypha','the-wisdom-of-solomon',16,16,'extras',
     E'*For the ungodly, that denied to know you, were scourged by the strength of your arm: with strange rains, hails, and showers, were they persecuted, that they could not avoid, and through fire were they consumed* (Wisdom of Solomon 16:16). The sage retells the seventh plague as a measured wonder against *the ungodly, that denied to know you* — Pharaoh''s house — exactly mirroring *hail, and fire mingled with the hail, very grievous* (Exodus 9:24).'),
    ('canon','exodus',9,24,'apocrypha','the-wisdom-of-solomon',16,22,'extras',
     E'*But snow and ice endured the fire, and melted not, that they might know that fire burning in the hail, and sparkling in the rain, did destroy the fruits of the enemies* (Wisdom of Solomon 16:22). Wisdom marvels at the paradox Exodus records without comment — *fire mingled with the hail, very grievous* (Exodus 9:24) — fire and ice held together by Yahuah''s command, sparing the righteous and destroying *the fruits of the enemies*, just as Goshen alone had no hail (Exodus 9:26).')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s305_ex09_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s305_ex09_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== threads =====
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-9-for-this-cause-have-i-raised-thee-up',
       E'For This Cause Have I Raised Thee Up — the Power and the Name Declared',
       E'At the heart of the plague-cycle Yahuah (LORD) tells Pharaoh why he yet stands: *And in very deed for this cause have I raised thee up, for to shew in thee my power; and that my name may be declared throughout all the earth* (Exodus 9:16). Sha''ul quotes this verse to Pharaoh BY NAME: *For the scripture saith unto Pharaoh, Even for this same purpose have I raised thee up, that I might shew my power in thee, and that my name might be declared throughout all the earth* (Romans 9:17), and draws the lesson, *whom he will he hardeneth* (Romans 9:18). Read through the lens this is covenant judgment and the glory of the Name, not arbitrary reprobation of a people: Yahuah raises up a tyrant-oppressor and judges him so that *there is none like me in all the earth* (Exodus 9:14) is made known to the nations. And the hardening is no riddle — the vessel of wrath fits itself. Before Yahuah is ever said to harden, Pharaoh hardens himself: *when Pharaoh saw that there was respite, he hardened his heart* (Exodus 8:15); *the heart of Pharaoh was hardened, and he did not let the people go* (Exodus 9:7); and even after he confesses *I have sinned this time: Yahuah (LORD) is righteous* (Exodus 9:27), *he sinned yet more, and hardened his heart* (Exodus 9:34). Only then does *Yahuah (LORD) harden* (Exodus 9:12) — handing the self-hardened man over to his own choosing. The same chapter of Romans that quotes this verse ends not in rejection but in ingathering: *I will call them my people, which were not my people* (Romans 9:25) — the two-house mercy that the display of power and Name was always serving.',
       sv.verse_id, ev.verse_id, 'free', 29200
  FROM _s305_ex09_lookup sv, _s305_ex09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=9 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=9 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-9-a-very-grievous-murrain-on-the-cattle',
       E'A Very Grievous Murrain — Yahuah Severs the Cattle of Yashar''el',
       E'The fifth plague falls on Egypt''s livestock: *Behold, the hand of Yahuah (LORD) is upon thy cattle which is in the field... there shall be a very grievous murrain* (Exodus 9:3), and Yahuah draws the line of the covenant straight through it — *Yahuah (LORD) shall sever between the cattle of Yashar''el (Israel) and the cattle of Egypt: and there shall nothing die of all that is the children''s of Yashar''el (Israel)* (Exodus 9:4), so that *all the cattle of Egypt died: but of the cattle of the children of Yashar''el (Israel) died not one* (Exodus 9:6). The Psalms sing this very judgment back to the children that they not forget: *He gave up their cattle also to the hail, and their flocks to hot thunderbolts* (Psalm 78:48), and *He made a way to his anger; he spared not their soul from death, but gave their life over to the pestilence* (Psalm 78:50). The wonder is told as covenant memory — *shewing to the generation to come the praises of Yahuah (LORD)* (Psalm 78:4) — the same Yahuah who severs his people from the oppressor.',
       sv.verse_id, ev.verse_id, 'free', 29203
  FROM _s305_ex09_lookup sv, _s305_ex09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=9 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=9 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-9-the-boil-of-egypt-upon-the-magicians',
       E'The Boil of Egypt — the Counterfeiters Struck, the Sore of the Beast',
       E'The sixth plague strikes the very sorcerers who had aped Yahuah''s signs: ashes of the furnace become *a boil breaking forth with blains upon man, and upon beast, throughout all the land of Egypt* (Exodus 9:9), and now *the magicians could not stand before Moses because of the boils; for the boil was upon the magicians, and upon all the Egyptians* (Exodus 9:11). The counterfeiters are silenced in their own flesh. The Torah names this *the botch of Egypt* and sets it as a covenant-sanction — not the Torah as curse, but the Deuteronomy 28 exile-judgment for covenant-breaking: *Yahuah (LORD) will smite thee with the botch of Egypt, and with the emerods, and with the scab, and with the itch, whereof thou canst not be healed* (Deuteronomy 28:27), *with a sore botch that cannot be healed, from the sole of thy foot unto the top of thy head* (Deuteronomy 28:35). The same plague is taken up at the end in the bowls of wrath, falling now on the worshippers of the last counterfeit kingdom: *there fell a noisome and grievous sore upon the men which had the mark of the beast, and upon them which worshipped his image* (Revelation 16:2). The Egypt-boil that judged the magicians judges every counterfeit power that sets itself against Yahuah.',
       sv.verse_id, ev.verse_id, 'free', 29206
  FROM _s305_ex09_lookup sv, _s305_ex09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=9 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=9 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-9-hail-and-fire-mingled-very-grievous',
       E'Hail and Fire Mingled — the Wonder Taken Up in the Trumpets and Bowls',
       E'The seventh plague is the strangest wonder of all: *Yahuah (LORD) sent thunder and hail, and the fire ran along upon the ground; and Yahuah (LORD) rained hail upon the land of Egypt* (Exodus 9:23), so that *there was hail, and fire mingled with the hail, very grievous, such as there was none like it in all the land of Egypt since it became a nation* (Exodus 9:24) — fire and ice held together by Yahuah''s command. Even in Egypt the wonder divides a remnant: *He that feared the word of Yahuah (LORD) among the servants of Pharaoh made his servants and his cattle flee into the houses* (Exodus 9:20), while *Only in the land of Goshen, where the children of Yashar''el (Israel) were, was there no hail* (Exodus 9:26). The Psalms sing it — *He destroyed their vines with hail, and their sycomore trees with frost* (Psalm 78:47); *He gave them hail for rain, and flaming fire in their land* (Psalm 105:32) — bound to the covenant Yahuah *remembered for ever* (Psalm 105:8). The Wisdom of Solomon marvels at the same paradox: *with strange rains, hails, and showers, were they persecuted... and through fire were they consumed* (Wisdom of Solomon 16:16), *fire burning in the hail, and sparkling in the rain, did destroy the fruits of the enemies* (Wisdom of Solomon 16:22) — the measured wonder that struck the ungodly yet spared the righteous. And the apocalypse takes it up onto the whole earth: *there followed hail and fire mingled with blood, and they were cast upon the earth* (Revelation 8:7), and at the last, *there fell upon men a great hail out of heaven, every stone about the weight of a talent* (Revelation 16:21). The plague of Egypt is the rehearsal of the day of Yahuah.',
       sv.verse_id, ev.verse_id, 'extras', 29209
  FROM _s305_ex09_lookup sv, _s305_ex09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=9 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=9 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

-- ===== thread_members =====
-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Romans 9:17 quotes Exodus 9:16 to Pharaoh BY NAME — the power shewn and the Name declared throughout all the earth.'
  FROM cross_reference_threads t
  JOIN _s305_ex09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=9 AND sv.verse_number=16
  JOIN _s305_ex09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=9 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-9-for-this-cause-have-i-raised-thee-up'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Romans 9:18 — *whom he will he hardeneth*: Yahuah hands the self-hardened vessel over, ending in mercy on *my people, which were not my people* (Romans 9:25).'
  FROM cross_reference_threads t
  JOIN _s305_ex09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=9 AND sv.verse_number=16
  JOIN _s305_ex09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=9 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-9-for-this-cause-have-i-raised-thee-up'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Exodus 9:7 — Pharaoh''s own hardening precedes Yahuah''s; Romans 9:18 read against the self-hardening text.'
  FROM cross_reference_threads t
  JOIN _s305_ex09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=9 AND sv.verse_number=7
  JOIN _s305_ex09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=9 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-9-for-this-cause-have-i-raised-thee-up'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Exodus 8:15 — the self-hardening counter-witness: Pharaoh hardens himself the moment respite comes, fitting the vessel of wrath to destruction.'
  FROM cross_reference_threads t
  JOIN _s305_ex09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=9 AND sv.verse_number=16
  JOIN _s305_ex09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=8 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-9-for-this-cause-have-i-raised-thee-up'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Psalm 78:48 — *He gave up their cattle also to the hail*: the murrain sung as covenant memory to the generations.'
  FROM cross_reference_threads t
  JOIN _s305_ex09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=9 AND sv.verse_number=3
  JOIN _s305_ex09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=78 AND tv.verse_number=48
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-9-a-very-grievous-murrain-on-the-cattle'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Psalm 78:50 — *gave their life over to the pestilence*: the severing of Yashar''el''s cattle from Egypt''s.'
  FROM cross_reference_threads t
  JOIN _s305_ex09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=9 AND sv.verse_number=6
  JOIN _s305_ex09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=78 AND tv.verse_number=50
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-9-a-very-grievous-murrain-on-the-cattle'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Deuteronomy 28:27 — *the botch of Egypt*: the boil named in the Torah''s covenant-sanction list.'
  FROM cross_reference_threads t
  JOIN _s305_ex09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=9 AND sv.verse_number=11
  JOIN _s305_ex09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-9-the-boil-of-egypt-upon-the-magicians'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Deuteronomy 28:35 — *a sore botch that cannot be healed*: the incurable Egypt-boil as covenant witness.'
  FROM cross_reference_threads t
  JOIN _s305_ex09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=9 AND sv.verse_number=11
  JOIN _s305_ex09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=35
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-9-the-boil-of-egypt-upon-the-magicians'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Revelation 16:2 — the boil-plague poured out in the bowls upon them with the mark of the beast; the counterfeiters struck again.'
  FROM cross_reference_threads t
  JOIN _s305_ex09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=9 AND sv.verse_number=9
  JOIN _s305_ex09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=16 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-9-the-boil-of-egypt-upon-the-magicians'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Revelation 8:7 — *hail and fire mingled with blood*: the first trumpet takes up the Egypt-hail onto the whole earth.'
  FROM cross_reference_threads t
  JOIN _s305_ex09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=9 AND sv.verse_number=24
  JOIN _s305_ex09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=8 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-9-hail-and-fire-mingled-very-grievous'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Revelation 16:21 — the great hail of the last bowl, the Egypt-hail come to its full measure; men blaspheme and repent not, as Pharaoh hardened.'
  FROM cross_reference_threads t
  JOIN _s305_ex09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=9 AND sv.verse_number=24
  JOIN _s305_ex09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=16 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-9-hail-and-fire-mingled-very-grievous'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Psalm 78:47 — *He destroyed their vines with hail*: the seventh plague sung among the wonders of Zoan.'
  FROM cross_reference_threads t
  JOIN _s305_ex09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=9 AND sv.verse_number=23
  JOIN _s305_ex09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=78 AND tv.verse_number=47
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-9-hail-and-fire-mingled-very-grievous'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Psalm 105:32 — *He gave them hail for rain, and flaming fire in their land*: the hail bound to the covenant Yahuah remembered for ever.'
  FROM cross_reference_threads t
  JOIN _s305_ex09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=9 AND sv.verse_number=23
  JOIN _s305_ex09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=105 AND tv.verse_number=32
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-9-hail-and-fire-mingled-very-grievous'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Wisdom of Solomon 16:16 — the hail/fire retold as a measured wonder scourging the ungodly that denied to know Yahuah.'
  FROM cross_reference_threads t
  JOIN _s305_ex09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=9 AND sv.verse_number=24
  JOIN _s305_ex09_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=16 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-9-hail-and-fire-mingled-very-grievous'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'Wisdom of Solomon 16:22 — *fire burning in the hail*: the paradox of fire and ice held together, sparing the righteous (Goshen) and destroying the enemies.'
  FROM cross_reference_threads t
  JOIN _s305_ex09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=9 AND sv.verse_number=24
  JOIN _s305_ex09_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=16 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-9-hail-and-fire-mingled-very-grievous'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
