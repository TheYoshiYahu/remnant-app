-- =====================================================================
-- Session 133 — Matt 4 extras-tier cross-references
-- =====================================================================
-- Adds Matt 4's extras-tier rows + threads to the cross-reference
-- corpus. Continues the S131 (Matt 1-2) and S132 (Matt 3) extras-tier
-- coverage onto Matt 4, the wilderness temptation chapter.
--
-- The Matt 4 reading-target: Yahusha (Jesus) led by the Ruach (Spirit)
-- into the wilderness for the forty-day fast and the three temptations
-- (stones-to-bread, temple-pinnacle, kingdoms-for-worship), each
-- answered by a Deuteronomy 6-8 counter-citation that brings the Torah-
-- instruction the wilderness-generation failed to internalize into the
-- conversation; the move to Kfar-Nachum (Capernaum) and the Yeshayahu
-- (Isaiah) 9 quotation that locks the geographic-tribal substance of
-- *Galilee of the goyim (Gentiles)* as the territory of the scattered
-- northern tribes; the kingdom-at-hand proclamation picked up word-for-
-- word from Yochanan (John); the calling of the first four disciples as
-- Jeremiah-16 fishers of the scattered seed; and the early-ministry
-- geographic-scope summary of the gathering-territory. The Hebrew
-- library's extras-tier witness carries the temptation architecture
-- earlier and at greater cosmological depth than the gospel — Mastema
-- as the named accuser-figure provoking the testing of the righteous-
-- one (Jubilees), Azazel as the Watcher-chief bound in the wilderness
-- where Yahusha (Jesus) walks the testing-arc (1 Enoch), Beliar as the
-- king-of-this-world who currently administers the kingdoms he offers
-- (Ascension of Isaiah), the ungodly's plot against the righteous-Son
-- who calls himself the child of Yahuah (Wisdom of Solomon), and the
-- gathering of the dispersed sheep into the house at the close of the
-- age (1 Enoch's Animal Apocalypse).
--
-- Editions used at S133: 1 Enoch (`1-enoch`), Jubilees (`jubilees`),
-- Apocrypha KJV 1611 (`the-wisdom-of-solomon`), Ascension of Isaiah
-- (`ascension-isaiah`). The full view filter retains every scripture-
-- level extras edition seeded for V1 for forward compatibility with
-- future chapter migrations (Jasher, Adam-Eve Conflict, Apocalypse of
-- Abraham, Apocrypha Charles vol 1, Sonnini Acts 29, Pseudepigrapha)
-- — these are not targeted in S133 because the Matt 4 reading does not
-- surface a framework-bearing connection from those editions at the
-- rigour the migration requires. Historical-witness editions (Josephus,
-- M.R. James's apocryphal NT, Lightfoot's Apostolic Fathers) remain
-- deferred from V1 cross-refs per the historical-witness one-way rule.
--
-- Brief scope notes: Forty-day fast canon parallels (Mosheh / Eliyahu)
-- are canon-tier and not extras-targeted in this migration. The
-- *Galilee of the goyim (Gentiles)* / Yeshayahu (Isaiah) 9 tribal-
-- territory reading is canon-anchored; no clean tribal-territory
-- parallel surfaces in the extras library at the rigour the migration
-- requires, so Matt 4:13-16 is not extras-targeted here. Healings
-- throughout Galilee (Matt 4:23-24) is similarly thin on extras and
-- deferred.
--
-- Five new PROPOSED threads at extras-tier:
--   1. `temptation-as-mastema-architecture`              (sort 205)
--   2. `azazel-bound-in-the-wilderness-as-the-temptation-ground` (sort 206)
--   3. `beliar-as-king-of-this-world`                    (sort 207)
--   4. `ungodly-plot-against-the-righteous-son`          (sort 208)
--   5. `animal-apocalypse-gathering-of-the-dispersed-sheep` (sort 209)
--
-- ~17 new cross_references rows, all at tier_required='extras'.
-- Every member-note passes the 12 Red Lines and the 12-point editorial
-- checklist.
--
-- Idempotent: ON CONFLICT DO NOTHING on every INSERT.
-- =====================================================================

\echo 'Session 133 — Matt 4 extras-tier cross-references migration starting...'
BEGIN;

-- Verse-lookup temp view. Same edition filter as S131 / S132 — every
-- scripture-level extras edition seeded for V1, plus canon.
CREATE TEMP VIEW _s133_verse_lookup AS
SELECT
    e.slug AS edition_slug,
    b.slug AS book_slug,
    c.chapter_number,
    v.verse_number,
    v.id AS verse_id
  FROM verses v
  JOIN chapters c ON v.chapter_id = c.id
  JOIN books    b ON c.book_id    = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN (
       'canon',
       'enoch',
       'jubilees',
       'jasher',
       'apocrypha',
       'apocrypha-charles-vol1',
       'pseudepigrapha',
       'adam-eve-conflict',
       'apocalypse-of-abraham',
       'ascension-isaiah'
   );

-- ---------------------------------------------------------------------
-- Insert ~17 extras-tier cross_references rows.
-- ---------------------------------------------------------------------
-- The VALUES tuple carries (source-edition, source-book, source-chap,
-- source-verse, target-edition, target-book, target-chap, target-verse,
-- note). Source is always canon/matthew; target spans the extras
-- editions named above.
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, note) AS (VALUES
  -- Thread 1: temptation-as-mastema-architecture (Matt 4:1, 3, 5-7)
  ('canon', 'matthew', 4, 1, 'jubilees', 'jubilees', 10, 8,
   '*And the chief of the spirits, Mastema, came and said: Yahuah (Lord), Creator, let some of them remain before me, and let them hearken to my voice, and do all that I shall say unto them; for if some of them are not left to me, I shall not be able to execute the power of my will on the sons of men.* Jubilees 10:8 names Mastema as the chief-of-evil-spirits with an authorized role to lead astray and judge. Matt 4:1''s *tempted of the devil* sits inside this Jubilees architecture — the same chief-of-evil-spirits figure Yahusha (Jesus) confronts in the wilderness; the Hebrew library names the figure the gospel inherits.'),
  ('canon', 'matthew', 4, 3, 'jubilees', 'jubilees', 11, 5,
   '*And Prince Mastema sent ravens and birds that they should eat the seed which was sown in the land, in order to destroy the land, and rob the children of men of their labours.* Jubilees 11:5 names Mastema''s standing disruption-of-the-bread-supply pattern. Matt 4:3''s stones-to-bread temptation walks the same provision-disruption architecture at the Messianic level — the tempter pressing the Son-of-Adam to short-circuit the Father''s provision-pattern by self-action. The Hebrew library carries the Mastema-disruption-of-the-bread pattern the gospel inherits.'),
  ('canon', 'matthew', 4, 5, 'jubilees', 'jubilees', 17, 16,
   '*And the prince Mastema came and said before Elohim (God): Behold, Avraham (Abraham) loves Yitschaq (Isaac) his son, and he delights in him above all things; bid him offer him as a burnt-offering on the altar, and Thou wilt see if he will do this command, and Thou wilt know if he is faithful in everything wherein Thou dost try him.* Jubilees 17:16 names Mastema''s role at the Aqedah — the accuser-figure provoking the testing-of-the-righteous-Son. Matt 4:5-7''s temple-pinnacle test walks the same architecture: the tempter provoking a testing of the Son-of-Adam to prove the Sonship-claim by visible-sign. Avraham was tested with Yitschaq; Yahusha (Jesus) is tested with himself. The Hebrew library carries the Mastema-as-testing-accuser pattern the gospel walks at the Messianic level.'),

  -- Thread 2: azazel-bound-in-the-wilderness-as-the-temptation-ground (Matt 4:1)
  ('canon', 'matthew', 4, 1, 'enoch', '1-enoch', 8, 1,
   '*And Azazel taught men to make swords, and knives, and shields, and breastplates, and made known to them the metals of the earth and the art of working them, and bracelets, and ornaments, and the use of antimony, and the beautifying of the eyelids, and all kinds of costly stones, and all colouring tinctures.* 1 Enoch 8:1 names Azazel as the Watcher who taught forbidden arts — the leading edge of the Watcher-rebellion that seeded the corruption of the earth. Matt 4:1''s *the devil* who tempts Yahusha (Jesus) in the wilderness is named in the Hebrew library''s witness: the same Watcher-chief whose rebellion seeded the corruption.'),
  ('canon', 'matthew', 4, 1, 'enoch', '1-enoch', 10, 4,
   '*And again Yahuah (the Lord) said to Raphael: Bind Azazel hand and foot, and cast him into the darkness: and make an opening in the desert, which is in Dudael, and cast him therein.* 1 Enoch 10:4 locates the Watcher-chief''s binding-judgment IN THE WILDERNESS — Dudael, the desert. The Hebrew library places the bound Watcher in the same wilderness Matt 4:1 names as the location of Yahusha''s (Jesus''s) temptation. The Ruach (Spirit) leads Yahusha out to the very ground where the bound Watcher is held.'),
  ('canon', 'matthew', 4, 1, 'enoch', '1-enoch', 10, 5,
   '*And place upon him rough and jagged rocks, and cover him with darkness, and let him abide there for ever, and cover his face that he may not see light.* 1 Enoch 10:5 completes the wilderness-binding judgment — the Watcher-chief held in darkness with face covered. Matt 4:1''s wilderness-confrontation reads against this architecture: Yahusha (Jesus) steps into the territory of the bound Watcher and walks the testing-arc on the figure''s own ground.'),
  ('canon', 'matthew', 4, 1, 'enoch', '1-enoch', 10, 8,
   '*And the whole earth has been corrupted through the works that were taught by Azazel: to him ascribe all sin.* 1 Enoch 10:8 names the Yom Kippur scapegoat-for-Azazel architecture that Leviticus 16:10 carries in shorthand — the goat sent to the wilderness *for Azazel* bears the sin away to the Watcher-chief who is its source. Matt 4:1 places Yahusha (Jesus) himself in the wilderness in the same register: the Son-of-Adam-in-flesh walks out where the bound Watcher''s sin is carried, and confronts the figure who is to bear it.'),

  -- Thread 3: beliar-as-king-of-this-world (Matt 4:8-10)
  ('canon', 'matthew', 4, 8, 'ascension-isaiah', 'ascension-isaiah', 4, 2,
   '*And after it is consummated, Beliar will descend, the great angel, the king of this world, which he has ruled ever since it came into being; and he will descend from his firmament in the form of a man, a king of unrighteousness, a slayer of his mother — this is the king of this world.* Ascension of Isaiah 4:2 names Beliar as *the king of this world,* the figure who has ruled it from the beginning. Matt 4:8-9''s offer of *all the kingdoms of the world* by the devil is the same king-of-this-world figure offering what he currently administers. The Hebrew library''s framework — Beliar / the devil as the temporary king-of-this-world during the present age (under Watcher-rebellion administration) — locks the framework reading that the wilderness-offer was not an empty bluff.'),
  ('canon', 'matthew', 4, 9, 'ascension-isaiah', 'ascension-isaiah', 4, 9,
   '*And much power will be in his hands, and he will make all do what he chooses; and he will speak as the Beloved and will say: I am Elohim (God), and before me there was none. And all the people in the world will believe in him.* Ascension 4:9 names Beliar''s standing worship-grab pattern — speaking as the Beloved, claiming the worship due to Elohim. Matt 4:9''s *if thou wilt fall down and worship me* is the king-of-this-world enacting the same worship-grab at the Messianic level. The Hebrew library names the architecture; the gospel narrates one instance of it.'),
  ('canon', 'matthew', 4, 10, 'ascension-isaiah', 'ascension-isaiah', 1, 3,
   '*Beliar was wroth with Hizkiyah (Hezekiah) because of his vision, and because of the unmasking with which he had unmasked Sammael, and because by him the going forth of the Beloved from the seventh heaven had been made known.* Ascension 1:3 names Beliar''s adversarial pattern toward the prophetic revelation of the Beloved''s descent. Matt 4:10''s *Get thee hence, Satan* sends the same Beliar-figure away in the same architecture: the Beloved who has descended dismisses the king-of-this-world who opposes the descent.'),

  -- Thread 4: ungodly-plot-against-the-righteous-son (Matt 4:3, 6, 11)
  ('canon', 'matthew', 4, 3, 'apocrypha', 'the-wisdom-of-solomon', 2, 13,
   '*He professeth to have the knowledge of Yahuah (God): and he calleth himself the child of Yahuah (the Lord).* Wisdom of Solomon 2:13 names the Hebrew library''s framework for the testing-of-the-righteous-one: the ungodly identify the righteous-one by his claim to be the child of Yahuah and plot to test that claim. Matt 4:3''s *if thou be the Son of Elohim (God)* is the devil''s instance of the same testing-by-challenge-of-the-Sonship pattern. The Wisdom architecture sets the literary register the temptation pericope walks at the Messianic level.'),
  ('canon', 'matthew', 4, 6, 'apocrypha', 'the-wisdom-of-solomon', 2, 16,
   '*We are esteemed of him as counterfeits: he abstaineth from our ways as from filthiness: he pronounceth the end of the just to be blessed, and maketh his boast that Elohim (God) is his father.* Wisdom 2:16 names the ungodly''s frame: the righteous-one boasts that Elohim is his father, and the ungodly resent the boast. Matt 4:6''s *if thou be the Son of Elohim, cast thyself down: for it is written, He shall give his angels charge concerning thee* enacts the same testing-of-the-claimed-Sonship dynamic — demanding visible proof of the Father''s protection from the one who has claimed Elohim as his father.'),
  ('canon', 'matthew', 4, 6, 'apocrypha', 'the-wisdom-of-solomon', 2, 18,
   '*For if the just man be the Son of Elohim (God), he will help him, and deliver him from the hand of his enemies.* Wisdom 2:18 is the Hebrew library''s direct prefiguring of Matt 4:6 — the ungodly''s *let-Elohim-save-him-if-he-is-his* testing-pattern. Wisdom names the architecture; Matt 4:6 walks it at the Messianic level; the devil''s cut-quote of Psalm 91 is the *let-the-angels-save-him* instance of the Wisdom pattern.'),
  ('canon', 'matthew', 4, 11, 'apocrypha', 'the-wisdom-of-solomon', 2, 20,
   '*Let us condemn him with a shameful death: for by his own saying he shall be respected.* Wisdom 2:20 names the death-sentence-against-the-righteous-one that the ungodly''s plot culminates in. Matt 4:11''s *Then the devil leaveth him* names the wilderness-end of the first phase of the plot; the Wisdom architecture extends past the wilderness through the gospel''s whole arc to the cross. The Hebrew library names the full arc the gospel will walk; the temptation is the opening.'),

  -- Thread 5: animal-apocalypse-gathering-of-the-dispersed-sheep (Matt 4:19, 25)
  ('canon', 'matthew', 4, 19, 'enoch', '1-enoch', 89, 74,
   '*And forsook again the house of Yahuah (the Lord) and His tower, and fell away entirely, and their eyes were blinded; and the eyes of their shepherds likewise; and they delivered them in large numbers to their shepherds for destruction, and they trampled the sheep with their feet and devoured them.* 1 Enoch 89:74 — inside the Animal Apocalypse (1 Enoch 85-90) — names the scattering-of-the-sheep that Yahusha (Jesus) sends the disciples to address. The Hebrew library''s gathering-of-the-dispersed-sheep architecture (the white-sheep blinded and devoured by the shepherds in the apostasy) is the prophetic register Matt 4:19''s *fishers of men* commission walks: the disciples are commissioned to gather the sheep the Animal Apocalypse named as scattered.'),
  ('canon', 'matthew', 4, 19, 'enoch', '1-enoch', 90, 6,
   '*But behold lambs were borne by those white sheep, and they began to open their eyes and to see, and to cry to the sheep.* 1 Enoch 90:6 names the late-age awakening of the lambs — the white-sheep born to the white-sheep who open their eyes and see. The fishers-of-men commission at Matt 4:19 enters the same awakening-architecture: the gathering of the scattered-and-now-awakening sheep, the lost sheep of the house of Yashar''el (Israel) opening their eyes when the Shepherd''s voice reaches them.'),
  ('canon', 'matthew', 4, 25, 'enoch', '1-enoch', 90, 33,
   '*And all that had been destroyed and dispersed, and all the beasts of the field, and all the birds of the heaven, assembled in that house, and Yahuah (the Lord) of the sheep rejoiced with great joy because they were all good and had returned to His house.* 1 Enoch 90:33 names the great-gathering-into-the-house at the close of the age. Matt 4:25''s geographic-scope summary — *great multitudes of people from Galilee, and from Decapolis, and from Yerushalayim (Jerusalem), and from Yahudah (Judaea), and from beyond Yarden (Jordan)* — is the early-ministry beginning of the same gathering. The Hebrew library names the consummation of the architecture Matt 4 opens.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, 'extras'::content_tier
  FROM input i
  JOIN _s133_verse_lookup sv ON sv.edition_slug = i.src_edition
                            AND sv.book_slug    = i.src_slug
                            AND sv.chapter_number = i.src_ch
                            AND sv.verse_number  = i.src_v
  JOIN _s133_verse_lookup tv ON tv.edition_slug = i.tgt_edition
                            AND tv.book_slug    = i.tgt_slug
                            AND tv.chapter_number = i.tgt_ch
                            AND tv.verse_number  = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ---------------------------------------------------------------------
-- Insert 5 new extras-tier threads.
-- ---------------------------------------------------------------------

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'temptation-as-mastema-architecture',
       'The temptation as Mastema architecture',
       'Matt 4:1-7''s *tempted of the devil* sits inside the Hebrew library''s named Mastema architecture from Jubilees. Jubilees 10:8 names Mastema as the chief-of-evil-spirits with an authorized role to lead astray and judge. Jubilees 11:5 names Mastema''s standing disruption-of-the-bread-supply pattern (the ravens sent to eat the sown seed) — the architecture Matt 4:3''s stones-to-bread temptation walks at the Messianic level. Jubilees 17:16 names Mastema''s role at the Aqedah — the accuser-figure provoking the testing-of-the-righteous-Son to prove the Sonship-claim by visible-sign — the same architecture Matt 4:5-7''s temple-pinnacle test walks. Avraham (Abraham) was tested with Yitschaq (Isaac); Yahusha (Jesus) is tested with himself. The Hebrew library names the figure and the testing-architecture the gospel inherits.',
       sv.verse_id, ev.verse_id, 'extras', 205
  FROM _s133_verse_lookup sv, _s133_verse_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 4 AND sv.verse_number = 1
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'matthew' AND ev.chapter_number = 4 AND ev.verse_number = 7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'azazel-bound-in-the-wilderness-as-the-temptation-ground',
       'Azazel bound in the wilderness as the temptation-ground',
       'Matt 4:1 — *Then was Yahusha (Jesus) led up of the Ruach (Spirit) into the wilderness to be tempted of the devil* — reads against 1 Enoch''s wilderness-binding architecture. 1 Enoch 8:1 names Azazel''s teaching of forbidden arts as the leading edge of the Watcher-rebellion. 1 Enoch 10:4-5 names Yahuah''s (the LORD''s) binding-judgment on Azazel: *Bind Azazel hand and foot, and cast him into the darkness: and make an opening in the desert, which is in Dudael, and cast him therein... place upon him rough and jagged rocks, and cover him with darkness... cover his face that he may not see light.* The Watcher-chief is bound in the wilderness. 1 Enoch 10:8 names the Yom Kippur scapegoat-for-Azazel architecture that Leviticus 16:10 carries in shorthand — sin borne away to the wilderness-figure who is its source. Matt 4:1 places Yahusha (Jesus) on the very ground where the bound Watcher is held; the wilderness-temptation is the public confrontation between the Son-of-Adam-in-flesh and the bound Watcher-chief, walked on the Watcher''s own territory and passed.',
       sv.verse_id, ev.verse_id, 'extras', 206
  FROM _s133_verse_lookup sv, _s133_verse_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 4 AND sv.verse_number = 1
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'matthew' AND ev.chapter_number = 4 AND ev.verse_number = 11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'beliar-as-king-of-this-world',
       'Beliar as king of this world',
       'Matt 4:8-10''s third-temptation offer of *all the kingdoms of the world, and the glory of them* by the devil reads against the Ascension of Isaiah''s named king-of-this-world architecture. Asc.Is 4:2 names Beliar as *the king of this world, which he has ruled ever since it came into being* — the figure who currently administers the kingdoms he offers Yahusha (Jesus) at Matt 4:8-9. The Hebrew library locks the framework reading that the wilderness-offer was not an empty bluff: the kingdoms ARE temporarily under the dominion of the principalities and powers, and Beliar / the devil is offering what he administers. Asc.Is 4:9 names Beliar''s standing worship-grab pattern — speaking as the Beloved, claiming the worship due to Elohim (God) — the same worship-grab Matt 4:9''s *if thou wilt fall down and worship me* enacts. Asc.Is 1:3 names Beliar''s adversarial pattern toward the prophetic revelation of the Beloved''s descent — the architecture Matt 4:10''s *Get thee hence, Satan* dismisses.',
       sv.verse_id, ev.verse_id, 'extras', 207
  FROM _s133_verse_lookup sv, _s133_verse_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 4 AND sv.verse_number = 8
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'matthew' AND ev.chapter_number = 4 AND ev.verse_number = 10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ungodly-plot-against-the-righteous-son',
       'The ungodly''s plot against the righteous Son',
       'The temptation pericope sits inside the Hebrew library''s named architecture of *the ungodly''s plot against the righteous Son* — Wisdom of Solomon 2:10-20. Wisdom 2:13 names the trigger: *he professeth to have the knowledge of Yahuah (God): and he calleth himself the child of Yahuah (the Lord).* The ungodly identify the righteous-one by his Sonship-claim. Matt 4:3''s and 4:6''s *if thou be the Son of Elohim (God)* enact the same testing-by-challenge-of-the-Sonship pattern at the Messianic level. Wisdom 2:16 names the ungodly''s frame — *he maketh his boast that Elohim (God) is his father* — the resentment Matt 4:6 walks. Wisdom 2:18 is the direct prefiguring of Matt 4:6 — *if the just man be the Son of Elohim, he will help him, and deliver him from the hand of his enemies* — the *let-Elohim-save-him-if-he-is-his* taunt the devil''s cut-quote of Psalm 91 enacts. Wisdom 2:20 names the death-sentence the plot culminates in: *let us condemn him with a shameful death.* The wilderness-temptation is the opening; the Wisdom architecture carries the full arc the gospel will walk to the cross.',
       sv.verse_id, ev.verse_id, 'extras', 208
  FROM _s133_verse_lookup sv, _s133_verse_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 4 AND sv.verse_number = 3
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'matthew' AND ev.chapter_number = 4 AND ev.verse_number = 11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'animal-apocalypse-gathering-of-the-dispersed-sheep',
       'The Animal Apocalypse gathering of the dispersed sheep',
       'Matt 4:19''s *fishers of men* commission and Matt 4:25''s early-ministry geographic-scope summary read against the Animal Apocalypse of 1 Enoch 85-90. 1 Enoch 89:74 names the scattering-of-the-sheep — the white-sheep blinded and devoured by the failed shepherds in the apostasy. 1 Enoch 90:6 names the late-age awakening of the lambs — *behold lambs were borne by those white sheep, and they began to open their eyes and to see.* 1 Enoch 90:33 names the great-gathering-into-the-house at the close of the age — *all that had been destroyed and dispersed... assembled in that house.* The disciples are commissioned at Matt 4:19 as the agents of the gathering the Animal Apocalypse names; Matt 4:25''s geographic-scope summary is the early-ministry beginning of the consummation the Hebrew library names. The lost sheep of the house of Yashar''el (Israel) open their eyes when the Shepherd''s voice reaches them.',
       sv.verse_id, ev.verse_id, 'extras', 209
  FROM _s133_verse_lookup sv, _s133_verse_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 4 AND sv.verse_number = 19
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'matthew' AND ev.chapter_number = 4 AND ev.verse_number = 25
ON CONFLICT (slug) DO NOTHING;

-- ---------------------------------------------------------------------
-- Link cross_references to their threads.
-- ---------------------------------------------------------------------

-- Thread 1: temptation-as-mastema-architecture
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, 'Jubilees 10:8 — *the chief of the spirits, Mastema, came and said: Yahuah (Lord), Creator, let some of them remain before me.* The Hebrew library names the chief-of-evil-spirits with an authorized role to lead astray and judge; the architecture Matt 4:1''s *tempted of the devil* sits inside.'
  FROM cross_reference_threads t, cross_references x,
       _s133_verse_lookup sv, _s133_verse_lookup tv
 WHERE t.slug = 'temptation-as-mastema-architecture'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 4 AND sv.verse_number = 1
   AND tv.edition_slug = 'jubilees' AND tv.book_slug = 'jubilees' AND tv.chapter_number = 10 AND tv.verse_number = 8
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, 'Jubilees 11:5 — *Prince Mastema sent ravens and birds that they should eat the seed which was sown in the land.* Mastema''s standing disruption-of-the-bread-supply pattern; Matt 4:3''s stones-to-bread temptation walks the same architecture at the Messianic level.'
  FROM cross_reference_threads t, cross_references x,
       _s133_verse_lookup sv, _s133_verse_lookup tv
 WHERE t.slug = 'temptation-as-mastema-architecture'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 4 AND sv.verse_number = 3
   AND tv.edition_slug = 'jubilees' AND tv.book_slug = 'jubilees' AND tv.chapter_number = 11 AND tv.verse_number = 5
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, 'Jubilees 17:16 — *the prince Mastema came and said before Elohim (God): Behold, Avraham (Abraham) loves Yitschaq (Isaac) his son... bid him offer him as a burnt-offering on the altar.* Mastema''s role at the Aqedah; Matt 4:5-7''s temple-pinnacle test walks the same testing-of-the-righteous-Son architecture.'
  FROM cross_reference_threads t, cross_references x,
       _s133_verse_lookup sv, _s133_verse_lookup tv
 WHERE t.slug = 'temptation-as-mastema-architecture'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 4 AND sv.verse_number = 5
   AND tv.edition_slug = 'jubilees' AND tv.book_slug = 'jubilees' AND tv.chapter_number = 17 AND tv.verse_number = 16
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2: azazel-bound-in-the-wilderness-as-the-temptation-ground
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, '1 Enoch 8:1 — *Azazel taught men to make swords, and knives, and shields, and breastplates.* The Watcher who taught forbidden arts; the leading edge of the rebellion that seeded the corruption of the earth.'
  FROM cross_reference_threads t, cross_references x,
       _s133_verse_lookup sv, _s133_verse_lookup tv
 WHERE t.slug = 'azazel-bound-in-the-wilderness-as-the-temptation-ground'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 4 AND sv.verse_number = 1
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 8 AND tv.verse_number = 1
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, '1 Enoch 10:4 — *Bind Azazel hand and foot, and cast him into the darkness: and make an opening in the desert, which is in Dudael, and cast him therein.* The Hebrew library locates the Watcher-chief''s binding judgment IN THE WILDERNESS — the same ground Matt 4:1 names as the location of Yahusha''s (Jesus''s) temptation.'
  FROM cross_reference_threads t, cross_references x,
       _s133_verse_lookup sv, _s133_verse_lookup tv
 WHERE t.slug = 'azazel-bound-in-the-wilderness-as-the-temptation-ground'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 4 AND sv.verse_number = 1
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 10 AND tv.verse_number = 4
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, '1 Enoch 10:5 — *cover him with darkness, and let him abide there for ever, and cover his face that he may not see light.* The completion of the wilderness-binding; Yahusha (Jesus) walks the testing-arc on the bound Watcher''s ground.'
  FROM cross_reference_threads t, cross_references x,
       _s133_verse_lookup sv, _s133_verse_lookup tv
 WHERE t.slug = 'azazel-bound-in-the-wilderness-as-the-temptation-ground'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 4 AND sv.verse_number = 1
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 10 AND tv.verse_number = 5
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, '1 Enoch 10:8 — *the whole earth has been corrupted through the works that were taught by Azazel: to him ascribe all sin.* The Yom Kippur scapegoat-for-Azazel architecture (Leviticus 16:10 in shorthand); Matt 4:1 places Yahusha (Jesus) in the wilderness in the same register.'
  FROM cross_reference_threads t, cross_references x,
       _s133_verse_lookup sv, _s133_verse_lookup tv
 WHERE t.slug = 'azazel-bound-in-the-wilderness-as-the-temptation-ground'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 4 AND sv.verse_number = 1
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 10 AND tv.verse_number = 8
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3: beliar-as-king-of-this-world
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, 'Ascension of Isaiah 4:2 — *Beliar will descend, the great angel, the king of this world, which he has ruled ever since it came into being.* The Hebrew library names Beliar as the king-of-this-world; Matt 4:8-9''s offer of all the kingdoms is the same figure offering what he currently administers.'
  FROM cross_reference_threads t, cross_references x,
       _s133_verse_lookup sv, _s133_verse_lookup tv
 WHERE t.slug = 'beliar-as-king-of-this-world'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 4 AND sv.verse_number = 8
   AND tv.edition_slug = 'ascension-isaiah' AND tv.book_slug = 'ascension-isaiah' AND tv.chapter_number = 4 AND tv.verse_number = 2
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, 'Ascension of Isaiah 4:9 — *he will speak as the Beloved and will say: I am Elohim (God), and before me there was none.* Beliar''s standing worship-grab; Matt 4:9''s *fall down and worship me* enacts the same.'
  FROM cross_reference_threads t, cross_references x,
       _s133_verse_lookup sv, _s133_verse_lookup tv
 WHERE t.slug = 'beliar-as-king-of-this-world'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 4 AND sv.verse_number = 9
   AND tv.edition_slug = 'ascension-isaiah' AND tv.book_slug = 'ascension-isaiah' AND tv.chapter_number = 4 AND tv.verse_number = 9
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, 'Ascension of Isaiah 1:3 — *Beliar was wroth with Hizkiyah (Hezekiah) because of his vision... by him the going forth of the Beloved from the seventh heaven had been made known.* Beliar''s adversarial pattern toward the prophetic revelation of the Beloved''s descent; Matt 4:10''s *Get thee hence, Satan* dismisses the same figure.'
  FROM cross_reference_threads t, cross_references x,
       _s133_verse_lookup sv, _s133_verse_lookup tv
 WHERE t.slug = 'beliar-as-king-of-this-world'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 4 AND sv.verse_number = 10
   AND tv.edition_slug = 'ascension-isaiah' AND tv.book_slug = 'ascension-isaiah' AND tv.chapter_number = 1 AND tv.verse_number = 3
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4: ungodly-plot-against-the-righteous-son
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, 'Wisdom of Solomon 2:13 — *he professeth to have the knowledge of Yahuah (God): and he calleth himself the child of Yahuah (the Lord).* The ungodly identify the righteous-one by his Sonship-claim; Matt 4:3''s *if thou be the Son of Elohim (God)* enacts the same testing-by-challenge.'
  FROM cross_reference_threads t, cross_references x,
       _s133_verse_lookup sv, _s133_verse_lookup tv
 WHERE t.slug = 'ungodly-plot-against-the-righteous-son'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 4 AND sv.verse_number = 3
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'the-wisdom-of-solomon' AND tv.chapter_number = 2 AND tv.verse_number = 13
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, 'Wisdom 2:16 — *he maketh his boast that Elohim (God) is his father.* The ungodly''s resentment of the Sonship-boast; Matt 4:6''s testing-of-the-claimed-Sonship dynamic walks the same.'
  FROM cross_reference_threads t, cross_references x,
       _s133_verse_lookup sv, _s133_verse_lookup tv
 WHERE t.slug = 'ungodly-plot-against-the-righteous-son'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 4 AND sv.verse_number = 6
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'the-wisdom-of-solomon' AND tv.chapter_number = 2 AND tv.verse_number = 16
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, 'Wisdom 2:18 — *if the just man be the Son of Elohim (God), he will help him, and deliver him from the hand of his enemies.* The direct prefiguring of Matt 4:6 — the *let-Elohim-save-him-if-he-is-his* taunt; the devil''s cut-quote of Psalm 91 is the *let-the-angels-save-him* instance of the Wisdom architecture.'
  FROM cross_reference_threads t, cross_references x,
       _s133_verse_lookup sv, _s133_verse_lookup tv
 WHERE t.slug = 'ungodly-plot-against-the-righteous-son'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 4 AND sv.verse_number = 6
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'the-wisdom-of-solomon' AND tv.chapter_number = 2 AND tv.verse_number = 18
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, 'Wisdom 2:20 — *let us condemn him with a shameful death.* The death-sentence the plot culminates in; Matt 4:11 names the wilderness-end of the first phase, the Wisdom arc extends through the gospel to the cross.'
  FROM cross_reference_threads t, cross_references x,
       _s133_verse_lookup sv, _s133_verse_lookup tv
 WHERE t.slug = 'ungodly-plot-against-the-righteous-son'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 4 AND sv.verse_number = 11
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'the-wisdom-of-solomon' AND tv.chapter_number = 2 AND tv.verse_number = 20
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 5: animal-apocalypse-gathering-of-the-dispersed-sheep
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, '1 Enoch 89:74 — *they delivered them in large numbers to their shepherds for destruction, and they trampled the sheep with their feet and devoured them.* The Animal Apocalypse names the scattering Yahusha (Jesus) sends the disciples to address.'
  FROM cross_reference_threads t, cross_references x,
       _s133_verse_lookup sv, _s133_verse_lookup tv
 WHERE t.slug = 'animal-apocalypse-gathering-of-the-dispersed-sheep'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 4 AND sv.verse_number = 19
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 89 AND tv.verse_number = 74
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, '1 Enoch 90:6 — *lambs were borne by those white sheep, and they began to open their eyes and to see.* The late-age awakening of the lambs; the fishers-of-men commission at Matt 4:19 enters the gathering of the scattered-and-now-awakening sheep.'
  FROM cross_reference_threads t, cross_references x,
       _s133_verse_lookup sv, _s133_verse_lookup tv
 WHERE t.slug = 'animal-apocalypse-gathering-of-the-dispersed-sheep'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 4 AND sv.verse_number = 19
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 90 AND tv.verse_number = 6
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, '1 Enoch 90:33 — *all that had been destroyed and dispersed... assembled in that house.* The great-gathering-into-the-house at the close of the age; Matt 4:25''s geographic-scope summary is the early-ministry beginning of the same consummation.'
  FROM cross_reference_threads t, cross_references x,
       _s133_verse_lookup sv, _s133_verse_lookup tv
 WHERE t.slug = 'animal-apocalypse-gathering-of-the-dispersed-sheep'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 4 AND sv.verse_number = 25
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 90 AND tv.verse_number = 33
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

DROP VIEW _s133_verse_lookup;

\echo 'Session 133 migration complete. Verifying row counts...'

SELECT
    (SELECT count(*) FROM cross_references x WHERE x.tier_required = 'extras') AS extras_xref_rows_total,
    (SELECT count(*) FROM cross_reference_threads t WHERE t.tier_required = 'extras') AS extras_threads_total,
    (SELECT count(*) FROM cross_reference_thread_members m
       JOIN cross_reference_threads t ON t.id = m.thread_id
      WHERE t.tier_required = 'extras') AS extras_members_total;

-- Per-thread member counts for S133's new threads
SELECT t.slug, count(m.*) AS member_count
  FROM cross_reference_threads t
  LEFT JOIN cross_reference_thread_members m ON m.thread_id = t.id
 WHERE t.slug IN (
       'temptation-as-mastema-architecture',
       'azazel-bound-in-the-wilderness-as-the-temptation-ground',
       'beliar-as-king-of-this-world',
       'ungodly-plot-against-the-righteous-son',
       'animal-apocalypse-gathering-of-the-dispersed-sheep'
   )
 GROUP BY t.slug
 ORDER BY t.slug;

COMMIT;

\echo 'Session 133 — Matt 4 extras-tier cross-references migration done.'
