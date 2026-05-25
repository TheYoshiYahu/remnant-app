-- =====================================================================
-- Session 132 — Matt 3 extras-tier cross-references
-- =====================================================================
-- Adds Matt 3's extras-tier rows + threads to the cross-reference
-- corpus. Builds on the S131 metallic-argaman-pill pipeline
-- (`classifyBookSlug()` → 'extras' for any target outside OT/NT slug
-- sets, dispatching the metallic argaman gradient). S132 extends the
-- live extras-tier coverage to chapter 3.
--
-- The Matt 3 reading-target: Yochanan (John) the Immerser as the
-- Eliyahu (Elijah)-pattern prophet at the wilderness threshold;
-- the Pharisaic-Sadducean leadership identified through the seed-war
-- lens (generation-of-vipers / offspring-of-the-Watchers); the
-- stones-to-children rejection of the lineage-claim-without-fruit;
-- and the immersion of Yahusha (Jesus) with the heavens opened, the
-- Ruach (Spirit) descending dove-form, and the Father's voice from
-- heaven naming the Beloved Son. The Hebrew library's extras-tier
-- witness carries each of these beats earlier than the gospel and at
-- greater chronological / cosmological depth.
--
-- Editions used at S132: 1 Enoch (`1-enoch`), Jubilees (`jubilees`),
-- Apocrypha KJV 1611 (`ecclesiasticus`, `the-wisdom-of-solomon`),
-- Pseudepigrapha Charles vol 2 (`testaments-xii`), Ascension of Isaiah
-- (`ascension-isaiah`). The full view filter retains every scripture-
-- level extras edition seeded for V1 for forward compatibility with
-- future chapter migrations (Jasher, Adam-Eve Conflict, Apocalypse of
-- Abraham, Apocrypha Charles vol 1, Sonnini Acts 29) — these are not
-- targeted in S132 because the Matt 3 reading does not surface a
-- framework-bearing connection from those editions at the rigour the
-- migration requires. Historical-witness editions (Josephus, M.R.
-- James's apocryphal NT, Lightfoot's Apostolic Fathers) remain
-- deferred from V1 cross-refs per the historical-witness one-way rule.
--
-- Note on Charles' Testaments XII chapter numbering: the Charles
-- edition (the data's `pseudepigrapha` / `testaments-xii` slugs)
-- concatenates the twelve testaments into one continuous chapter
-- sequence. Testament of Levi chapter 2 (standard divisions) maps to
-- TestXII chapter 12 in the data. This migration cites the concatenated
-- chapter form to match the verse_lookup join.
--
-- Five new PROPOSED threads, plus one supplemental member added to
-- the S131-landed `plant-of-righteousness-and-the-branch` thread for
-- the Matt 3:10 *axe-at-the-root* connection.
-- ~18 new cross_references rows, all at tier_required='extras'.
-- Every member-note passes the 12 Red Lines and the 12-point
-- editorial checklist.
--
-- Idempotent: ON CONFLICT DO NOTHING on every INSERT.
-- =====================================================================

\echo 'Session 132 — Matt 3 extras-tier cross-references migration starting...'
BEGIN;

-- Verse-lookup temp view. Same edition filter as S131 — every
-- scripture-level extras edition seeded for V1, plus canon.
CREATE TEMP VIEW _s132_verse_lookup AS
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
-- Insert ~18 extras-tier cross_references rows.
-- ---------------------------------------------------------------------
-- The VALUES tuple carries (source-edition, source-book, source-chap,
-- source-verse, target-edition, target-book, target-chap, target-verse,
-- note). Source is always canon/matthew; target spans the extras
-- editions plus a few canon-only links for thread cohesion.
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, note) AS (VALUES
  -- Thread 1: praise-of-elijah-and-the-yochanan-pattern (Matt 3:1, 3, 11, 13)
  ('canon', 'matthew', 3, 1, 'apocrypha', 'ecclesiasticus', 48, 1,
   '*Then stood up Elias the prophet as fire, and his word burned like a lamp.* Ecclesiasticus 48 opens the Hebrew library''s explicit Praise of Elijah — the prophet-as-fire register that Matt 3:1''s Yochanan (John) the Immerser walks in the Eliyahu (Elijah)-pattern. The pre-Christian Hebrew-library witness knew Eliyahu (Elijah) by the same fire-and-burning-word language Matthew''s gospel inherits.'),
  ('canon', 'matthew', 3, 3, 'apocrypha', 'ecclesiasticus', 48, 10,
   '*Who were ordained for reproofs in their times, to pacify the wrath of the judgment of Yahuah (God), before it brake forth into fury, and to turn the heart of the father to the son, and to restore the tribes of Jacob.* Ecclesiasticus 48:10 echoes Malachi 4:5-6''s *turn the heart of the fathers to the children* and explicitly adds *to restore the tribes of Jacob* — the gathering-of-the-scattered theme tied directly to the Eliyahu (Elijah)-pattern. The Hebrew library knew the promise carried the ingathering of all twelve tribes long before the gospel''s opening verses; Yochanan''s (John''s) Yarden (Jordan) ministry stands in this register.'),
  ('canon', 'matthew', 3, 11, 'apocrypha', 'ecclesiasticus', 48, 1,
   '*Then stood up Elias the prophet as fire, and his word burned like a lamp.* The fire-baptism Yochanan (John) announces at Matt 3:11 — *he shall immerse you with the Ruach HaKodesh (Holy Spirit), and with fire* — sits inside the Hebrew library''s prophet-as-fire register. Ecclesiasticus reads Eliyahu (Elijah) as fire and his word as a burning lamp; Yochanan (John) names the one mightier than he as bringing the Ruach-and-fire register the Eliyahu (Elijah)-pattern had carried in shadow.'),
  ('canon', 'matthew', 3, 13, 'apocrypha', 'ecclesiasticus', 48, 12,
   '*Elias it was, who was covered with a whirlwind: and Eliseus was filled with his spirit: while he lived, he was not moved with the presence of any prince, neither could any bring him into subjection.* Ecclesiasticus 48:12 names the Eliyahu (Elijah) / Elisha mantle-transfer-by-spirit — at the Yarden (Jordan), the same river where Yahusha (Jesus) comes to Yochanan (John) at Matt 3:13. The river of the prophetic mantle is the river of the Messianic investiture; the Hebrew library witnesses the spirit-transfer at the Yarden the gospel inherits.'),

  -- Thread 2: heavens-opened-at-the-priestly-investiture (Matt 3:16)
  ('canon', 'matthew', 3, 16, 'pseudepigrapha', 'testaments-xii', 12, 6,
   '*And behold the heavens were opened, and an angel of Elohim (God) said to me, Levi, enter.* Testament of Levi 2:6 (TestXII ch 12:6 in the Charles concatenation) names the heavens-opening at the priestly investiture — the same heavens-opening Matt 3:16 narrates over Yahusha (Jesus) at the Yarden (Jordan). The Hebrew library knew the heavens open at the moment a covenant-bearing figure is invested for service; the gospel''s opening of the heavens follows the same architecture.'),
  ('canon', 'matthew', 3, 16, 'enoch', '1-enoch', 14, 15,
   '*But the middle one reached to heaven, like the throne of Yahuah (God), of stibium, and the top of the throne was of sapphire.* 1 Enoch 14''s Throne vision opens with Enoch ascending into the heavens and standing before the throne of Yahuah. The Hebrew library''s heavens-opening register at the Throne — sapphire, fire, the holy ones surrounding — names the cosmological room into which Matt 3:16''s opened heaven gives access. The Formless Father is on the Throne; the Formed has come into flesh; the heavens open for the announcement.'),
  ('canon', 'matthew', 3, 16, 'enoch', '1-enoch', 71, 1,
   '*And it came to pass after this that my spirit was carried off and it ascended into the heavens: And I saw the holy sons of Elohim (God). They were stepping on flames of fire: Their garments were white, and their raiment, And their faces shone like snow.* 1 Enoch 71 — Enoch''s exaltation and the revelation of the Son of Adam — is the Hebrew library''s most extensive heavens-opening vision. The Throne-room that opens to Enoch is the same room the Father''s voice speaks from at Matt 3:17.'),

  -- Thread 3: spirit-of-wisdom-on-the-elect-one (Matt 3:16)
  ('canon', 'matthew', 3, 16, 'apocrypha', 'the-wisdom-of-solomon', 7, 22,
   '*For wisdom, which is the worker of all things, taught me: for in her is an understanding spirit holy, one only, manifold, subtil, lively, clear, undefiled...* Wisdom of Solomon 7:22 begins the Hebrew library''s longest single Spirit-characterization — twenty-one attributes of the Ruach (Spirit) in three verses. The Spirit Matthew names descending dove-form at Matt 3:16 is the same Ruach the Hebrew library had been characterizing in the Wisdom literature for centuries before the gospel.'),
  ('canon', 'matthew', 3, 16, 'apocrypha', 'the-wisdom-of-solomon', 7, 25,
   '*For she is the breath of the power of Yahuah (God), and a pure influence flowing from the glory of the Almighty: therefore can no defiled thing fall into her.* Wisdom 7:25 names the Spirit as *the breath of the power of Yahuah* — the Ruach in the literal Hebrew-breath sense, the divine animating presence proceeding from the Father. The dove-descent at Matt 3:16 is the visible form of this breath landing on the Formed in flesh. The Hebrew library''s framework — the Ruach as Yahuah''s own breath, not as a third co-equal person of a later Trinitarian grid — is the framework the gospel inherits.'),
  ('canon', 'matthew', 3, 16, 'apocrypha', 'the-wisdom-of-solomon', 7, 27,
   '*And being but one, she can do all things: and remaining in herself, she makes all things new: and in all ages entering into holy souls, she makes them friends of Yahuah (God), and prophets.* Wisdom 7:27 names the Spirit''s anointing-of-prophets pattern — *she makes them friends of Yahuah, and prophets.* The dove-descent at Matt 3:16 is the same Spirit''s anointing of the Servant-Prophet-King the Father will name at v.17.'),
  ('canon', 'matthew', 3, 16, 'enoch', '1-enoch', 49, 3,
   '*And in him dwells the spirit of wisdom, And the spirit which gives insight, And the spirit of understanding and of might, And the spirit of those who have fallen asleep in righteousness.* 1 Enoch 49:3 names the Spirit-pattern that rests on the Elect One — the same architecture Isaiah 11:2 names of the Messianic-Branch, and the same Ruach the dove-descent at Matt 3:16 visibly enacts. The Hebrew library''s witness to the Spirit-on-the-Elect-One predates the gospel and frames what Matt 3:16 makes public.'),

  -- Thread 4: father-voice-naming-the-son-of-adam-at-the-investiture (Matt 3:17)
  ('canon', 'matthew', 3, 17, 'enoch', '1-enoch', 39, 5,
   '*And in those days the voice of the Holy One shall be heard in the heaven, and the voice of the Elect One shall be heard from the throne of glory.* 1 Enoch 39:5 names the doubled voice — the Father''s voice from heaven and the voice of the Elect One — in one breath. Matt 3:17''s *voice from heaven* is the Father''s voice the Hebrew library had been promising; Yahusha (Jesus) is the Elect One the same library named.'),
  ('canon', 'matthew', 3, 17, 'enoch', '1-enoch', 62, 7,
   '*And Yahuah (God) of Spirits said: ''This is the Son of Adam who is born unto righteousness, And righteousness abides over him, And the righteousness of the Head of Days forsakes him not.''* 1 Enoch 62:7 is the Hebrew library''s direct Father-voice naming of the Son of Adam — the same construction Matt 3:17''s *This is my beloved Son, in whom I am well pleased* enacts at the Yarden (Jordan). The Father in 1 Enoch names the Son of Adam at the cosmic throne; the same Father at Matt 3:17 names the Son in the water. Same voice, same Son, the public moment finally arrived.'),
  ('canon', 'matthew', 3, 17, 'ascension-isaiah', 'ascension-isaiah', 9, 12,
   '*Crowns and thrones of glory they do not receive, till the Beloved will descend in the form in which you will see Him descend will descend, I say into the world in the last days the Yahuah (Lord), who will be called Messiah.* Ascension of Isaiah 9:12 names the Beloved''s descent in human form — the same Beloved Father-voice names at Matt 3:17. The Ascension preserves the architecture: the Father commissions the Beloved''s descent; the Formed takes on flesh; the public investiture at the water is the manifestation of the prior heavenly designation.'),
  ('canon', 'matthew', 3, 17, 'ascension-isaiah', 'ascension-isaiah', 11, 32,
   '*And I saw how He ascended into the seventh heaven, and all the righteous and all the angels praised Him. And then I saw Him sit down on the right hand of that Great Glory whose glory I told you that I could not behold.* The Ascension of Isaiah''s closing vision shows the Beloved seated at the right hand of the Great Glory after the descent-and-ascent journey. Matt 3:17''s public naming-as-Son at the water is the inflection between the descent (already completed at Matt 1:23''s Immanuel) and the ascent the Ascension shows in completion. The Hebrew library''s framework holds the whole arc.'),

  -- Thread 5: watcher-rebellion-as-source-of-the-vipers (Matt 3:7)
  ('canon', 'matthew', 3, 7, 'enoch', '1-enoch', 6, 1,
   '*And it came to pass when the children of men had multiplied that in those days were born unto them beautiful and comely daughters.* 1 Enoch 6:1 opens the Watcher-rebellion narrative — the fallen angels'' descent and the breeding of the Nephilim. Yochanan''s (John''s) *generation of vipers* (Greek *gennēmata echidnōn*, offspring of vipers) at Matt 3:7 names the Pharisaic-Sadducean leadership in the seed-war register the Hebrew library opens at 1 Enoch 6. The tares woven in by the fallen Watchers are the source of the seed Yochanan (John) identifies in his own day.'),
  ('canon', 'matthew', 3, 7, 'enoch', '1-enoch', 6, 2,
   '*And the angels, the children of the heaven, saw and lusted after them, and said to one another: ''Come, let us choose us wives from among the children of men and beget us children.''* 1 Enoch 6:2 names the lust-and-beget mechanism by which the fallen Watchers seeded the tares into the human race. The seed-war pattern Yochanan (John) identifies at Matt 3:7 — and Yahusha (Jesus) re-identifies at Matt 23:33 and John 8:44 — has this 1 Enoch 6 origin in the Hebrew library''s witness.'),
  ('canon', 'matthew', 3, 7, 'enoch', '1-enoch', 10, 9,
   '*And to Gabriel said Yahuah (God): ''Proceed against the bastards and the reprobates, and against the children of fornication: and destroy the children of fornication and the children of the Watchers from amongst men.''* 1 Enoch 10:9 names the judgment specifically against *the children of the Watchers* — the post-Flood persistence of the seed-line the Watchers planted. Yochanan (John) identifying the Pharisaic-Sadducean leadership as *offspring of vipers* is the gospel-front-end naming of the same persistent seed-line.'),
  ('canon', 'matthew', 3, 7, 'jubilees', 'jubilees', 5, 1,
   '*And it came to pass when the children of men began to multiply on the face of the earth and daughters were born to them, that the angels of Elohim (God) saw them on a certain year of this jubilee.* Jubilees 5:1 carries the same Watcher narrative — the parallel Hebrew-library witness to the seed-war origin. Two extras-tier witnesses (1 Enoch + Jubilees) confirm the architecture Yochanan (John) names at Matt 3:7 in shorthand.'),
  ('canon', 'matthew', 3, 7, 'jubilees', 'jubilees', 10, 1,
   '*And in the third week of this jubilee the unclean demons began to lead astray the children of the sons of Noah; and to make to err and destroy them.* Jubilees 10:1 names the persistence of the Watcher-spirits after the Flood — the unclean demons that lead astray. The Pharisaic-Sadducean apparatus Yochanan (John) confronts at Matt 3:7 is operating inside this lead-astray architecture; the system is the contemporary face of the persistent seed-war.'),

  -- Supplemental row to S131''s landed `plant-of-righteousness-and-the-branch` thread
  -- (anchored Matt 2:23, adding Matt 3:10 axe-at-the-root member)
  ('canon', 'matthew', 3, 10, 'enoch', '1-enoch', 10, 16,
   '*Destroy all wrong from the face of the earth and let every evil work come to an end: and let the plant of righteousness and truth appear: and it shall prove a blessing.* 1 Enoch 10:16 — the same plant-of-righteousness verse anchored at Matt 2:23 (the Branch-town settling) — also reads as the Hebrew-library witness to Matt 3:10''s *every tree which bringeth not forth good fruit is hewn down, and cast into the fire.* The destruction of the wrong-bearing trees is the clearing for the plant of righteousness to appear; the Hebrew library names the post-harvest sifting at the front of the gathering.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, 'extras'::content_tier
  FROM input i
  JOIN _s132_verse_lookup sv ON sv.edition_slug = i.src_edition
                            AND sv.book_slug    = i.src_slug
                            AND sv.chapter_number = i.src_ch
                            AND sv.verse_number  = i.src_v
  JOIN _s132_verse_lookup tv ON tv.edition_slug = i.tgt_edition
                            AND tv.book_slug    = i.tgt_slug
                            AND tv.chapter_number = i.tgt_ch
                            AND tv.verse_number  = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ---------------------------------------------------------------------
-- Insert 5 new extras-tier threads.
-- ---------------------------------------------------------------------

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'praise-of-elijah-and-the-yochanan-pattern',
       'The Praise of Elijah and the Yochanan (John) pattern',
       'Ecclesiasticus 48 — the Hebrew library''s explicit Praise of Elijah — names Eliyahu (Elijah) by the same prophet-as-fire, ordained-to-reproof, restore-the-tribes-of-Jacob register the gospel inherits at Matt 3:1-13. Sirach 48:1 reads Eliyahu (Elijah) as fire and his word as a burning lamp; v.10 echoes Malachi 4:5-6''s *turn the heart of the father to the son* and adds *to restore the tribes of Jacob* — the gathering-of-the-twelve-tribes theme attached to the Eliyahu (Elijah)-pattern; v.12 names the Eliyahu (Elijah) / Elisha mantle-transfer-by-spirit at the Yarden (Jordan) the same river where Yochanan (John) immerses Yahusha (Jesus). The pre-Christian Hebrew-library witness knew the Eliyahu (Elijah)-pattern carried the ingathering of all twelve tribes — the same architecture the gospel''s opening prophet inherits.',
       sv.verse_id, ev.verse_id, 'extras', 200
  FROM _s132_verse_lookup sv, _s132_verse_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 3 AND sv.verse_number = 1
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'matthew' AND ev.chapter_number = 3 AND ev.verse_number = 13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'heavens-opened-at-the-priestly-investiture',
       'The heavens opened at the priestly investiture',
       'The heavens-opening at Matt 3:16 — *the heavens were opened unto him, and he saw the Ruach (Spirit) of Elohim (God) descending like a dove* — sits inside a Hebrew-library tradition of heavens-opening at the moment a covenant-bearing figure is invested for service. Testament of Levi 2:6 (TestXII ch 12:6 in the Charles concatenation) — *behold the heavens were opened, and an angel of Elohim (God) said to me, Levi, enter* — names the heavens-opening at Levi''s priestly investiture. 1 Enoch 14:15 names the Throne-room the open heaven gives access to. 1 Enoch 71:1 names Enoch''s ascent into that same Throne-room and the revelation of the Son of Adam. The cosmological room into which Matt 3:16''s opened heaven gives access is the same room the Hebrew library had been mapping.',
       sv.verse_id, ev.verse_id, 'extras', 201
  FROM _s132_verse_lookup sv, _s132_verse_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 3 AND sv.verse_number = 16
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'matthew' AND ev.chapter_number = 3 AND ev.verse_number = 16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'spirit-of-wisdom-on-the-elect-one',
       'The Spirit of Wisdom on the Elect One',
       'The Ruach (Spirit) descending dove-form at Matt 3:16 is the same Ruach the Hebrew library had been characterizing for centuries. Wisdom of Solomon 7:22-27 names the Spirit''s twenty-one attributes — *holy, one only, manifold, subtil, lively, clear, undefiled* — and frames her as *the breath of the power of Yahuah (God), and a pure influence flowing from the glory of the Almighty* (v.25). The dove-form is the visible manifestation of the breath proceeding from the Father. 1 Enoch 49:3 names the Spirit-pattern resting on the Elect One: *in him dwells the spirit of wisdom, And the spirit which gives insight, And the spirit of understanding and of might* — the same architecture Isaiah 11:2 names of the Messianic-Branch. The Hebrew library''s framework — the Ruach as Yahuah''s own breath, not as a third co-equal person of a later Trinitarian grid — is the framework the gospel inherits at the immersion.',
       sv.verse_id, ev.verse_id, 'extras', 202
  FROM _s132_verse_lookup sv, _s132_verse_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 3 AND sv.verse_number = 16
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'matthew' AND ev.chapter_number = 3 AND ev.verse_number = 16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'father-voice-naming-the-son-of-adam-at-the-investiture',
       'The Father-voice naming the Son of Adam at the investiture',
       'Matt 3:17''s *voice from heaven, saying, This is my beloved Son, in whom I am well pleased* enacts a Father-voice naming the Hebrew library had been carrying. 1 Enoch 39:5 names *the voice of the Holy One ... in the heaven, and the voice of the Elect One ... from the throne of glory* in one breath. 1 Enoch 62:7 is the Hebrew library''s direct Father-voice naming the Son of Adam: *This is the Son of Adam who is born unto righteousness, And righteousness abides over him, And the righteousness of the Head of Days forsakes him not* — the same construction Matt 3:17 enacts at the Yarden (Jordan). Ascension of Isaiah 9:12 frames the descent of the Beloved in human form; Ascension 11:32 frames the ascent and seating at the right hand of the Great Glory. The Hebrew library''s framework holds the whole descent-public-naming-ascent arc.',
       sv.verse_id, ev.verse_id, 'extras', 203
  FROM _s132_verse_lookup sv, _s132_verse_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 3 AND sv.verse_number = 17
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'matthew' AND ev.chapter_number = 3 AND ev.verse_number = 17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'watcher-rebellion-as-source-of-the-vipers',
       'The Watcher rebellion as the source of the vipers',
       'Yochanan''s (John''s) *generation of vipers* — Greek *gennēmata echidnōn,* offspring of vipers — at Matt 3:7 names the Pharisaic-Sadducean leadership in the seed-war register the Hebrew library opens at 1 Enoch 6-16 and Jubilees 5 / 10. 1 Enoch 6:1-2 narrates the fallen-Watchers'' descent and their breeding of the Nephilim — the tares woven in by the fallen Watchers (Matt 13:24-30, 36-43). 1 Enoch 10:9 names the judgment against *the children of the Watchers* explicitly. Jubilees 5:1 carries the same narrative; Jubilees 10:1 narrates the persistence of the Watcher-spirits as unclean demons after the Flood. The seed-war pattern Yochanan (John) names at Matt 3:7 — and Yahusha (Jesus) re-names at Matt 23:33 and John 8:44 — has this 1 Enoch 6 / Jubilees 5 origin in the Hebrew library''s witness. The system is the contemporary face of the persistent seed-war; the people inside are victims of the deception their inherited tradition handed them.',
       sv.verse_id, ev.verse_id, 'extras', 204
  FROM _s132_verse_lookup sv, _s132_verse_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 3 AND sv.verse_number = 7
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'matthew' AND ev.chapter_number = 3 AND ev.verse_number = 7
ON CONFLICT (slug) DO NOTHING;

-- ---------------------------------------------------------------------
-- Link cross_references to their threads.
-- ---------------------------------------------------------------------

-- Thread 1: praise-of-elijah-and-the-yochanan-pattern
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, 'Ecclesiasticus 48:1 — *Then stood up Elias the prophet as fire, and his word burned like a lamp.* The Hebrew library names Eliyahu (Elijah) by the prophet-as-fire register Yochanan (John) walks at Matt 3:1.'
  FROM cross_reference_threads t, cross_references x,
       _s132_verse_lookup sv, _s132_verse_lookup tv
 WHERE t.slug = 'praise-of-elijah-and-the-yochanan-pattern'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 3 AND sv.verse_number = 1
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 48 AND tv.verse_number = 1
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, 'Ecclesiasticus 48:10 — *to turn the heart of the father to the son, and to restore the tribes of Jacob.* The Hebrew library reads the Eliyahu (Elijah)-pattern as carrying the ingathering of all twelve tribes — explicit echo of Malachi 4:5-6.'
  FROM cross_reference_threads t, cross_references x,
       _s132_verse_lookup sv, _s132_verse_lookup tv
 WHERE t.slug = 'praise-of-elijah-and-the-yochanan-pattern'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 3 AND sv.verse_number = 3
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 48 AND tv.verse_number = 10
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, 'Ecclesiasticus 48:1 carried again — the fire-baptism Yochanan (John) announces at Matt 3:11 sits inside the prophet-as-fire register.'
  FROM cross_reference_threads t, cross_references x,
       _s132_verse_lookup sv, _s132_verse_lookup tv
 WHERE t.slug = 'praise-of-elijah-and-the-yochanan-pattern'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 3 AND sv.verse_number = 11
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 48 AND tv.verse_number = 1
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, 'Ecclesiasticus 48:12 — *Eliseus was filled with his spirit.* The Eliyahu (Elijah) / Elisha mantle-transfer-by-spirit at the Yarden (Jordan); the same river Matt 3:13 places Yahusha (Jesus) coming to Yochanan (John).'
  FROM cross_reference_threads t, cross_references x,
       _s132_verse_lookup sv, _s132_verse_lookup tv
 WHERE t.slug = 'praise-of-elijah-and-the-yochanan-pattern'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 3 AND sv.verse_number = 13
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 48 AND tv.verse_number = 12
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2: heavens-opened-at-the-priestly-investiture
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, 'Testament of Levi 2:6 (TestXII ch 12:6) — *behold the heavens were opened, and an angel of Elohim (God) said to me, Levi, enter.* The Hebrew library''s heavens-opening at the priestly investiture; Matt 3:16''s heavens-opening at the Messianic investiture.'
  FROM cross_reference_threads t, cross_references x,
       _s132_verse_lookup sv, _s132_verse_lookup tv
 WHERE t.slug = 'heavens-opened-at-the-priestly-investiture'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 3 AND sv.verse_number = 16
   AND tv.edition_slug = 'pseudepigrapha' AND tv.book_slug = 'testaments-xii' AND tv.chapter_number = 12 AND tv.verse_number = 6
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, '1 Enoch 14:15 — the Throne-room the open heaven gives access to. Sapphire, fire, the Father on the Throne; the cosmological room into which Matt 3:16''s opened heaven gives access.'
  FROM cross_reference_threads t, cross_references x,
       _s132_verse_lookup sv, _s132_verse_lookup tv
 WHERE t.slug = 'heavens-opened-at-the-priestly-investiture'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 3 AND sv.verse_number = 16
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 14 AND tv.verse_number = 15
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, '1 Enoch 71:1 — Enoch''s ascent into the heavens and the revelation of the Son of Adam. The Throne-room the Father''s voice speaks from at Matt 3:17.'
  FROM cross_reference_threads t, cross_references x,
       _s132_verse_lookup sv, _s132_verse_lookup tv
 WHERE t.slug = 'heavens-opened-at-the-priestly-investiture'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 3 AND sv.verse_number = 16
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 71 AND tv.verse_number = 1
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3: spirit-of-wisdom-on-the-elect-one
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, 'Wisdom of Solomon 7:22 — the Hebrew library''s twenty-one-attribute characterization of the Ruach (Spirit) holy, one only, manifold, subtil, lively, clear, undefiled.'
  FROM cross_reference_threads t, cross_references x,
       _s132_verse_lookup sv, _s132_verse_lookup tv
 WHERE t.slug = 'spirit-of-wisdom-on-the-elect-one'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 3 AND sv.verse_number = 16
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'the-wisdom-of-solomon' AND tv.chapter_number = 7 AND tv.verse_number = 22
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, 'Wisdom 7:25 — *the breath of the power of Yahuah (God), and a pure influence flowing from the glory of the Almighty.* The Ruach as the Father''s own breath; the dove-descent is the visible form of the breath landing on the Formed in flesh.'
  FROM cross_reference_threads t, cross_references x,
       _s132_verse_lookup sv, _s132_verse_lookup tv
 WHERE t.slug = 'spirit-of-wisdom-on-the-elect-one'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 3 AND sv.verse_number = 16
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'the-wisdom-of-solomon' AND tv.chapter_number = 7 AND tv.verse_number = 25
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, 'Wisdom 7:27 — *in all ages entering into holy souls, she makes them friends of Yahuah (God), and prophets.* The Spirit-anointing of the Servant-Prophet-King the Father will name at v.17.'
  FROM cross_reference_threads t, cross_references x,
       _s132_verse_lookup sv, _s132_verse_lookup tv
 WHERE t.slug = 'spirit-of-wisdom-on-the-elect-one'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 3 AND sv.verse_number = 16
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'the-wisdom-of-solomon' AND tv.chapter_number = 7 AND tv.verse_number = 27
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, '1 Enoch 49:3 — *in him dwells the spirit of wisdom, And the spirit which gives insight, And the spirit of understanding and of might.* The Spirit-pattern on the Elect One; Isaiah 11:2 in the Hebrew library''s parallel witness.'
  FROM cross_reference_threads t, cross_references x,
       _s132_verse_lookup sv, _s132_verse_lookup tv
 WHERE t.slug = 'spirit-of-wisdom-on-the-elect-one'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 3 AND sv.verse_number = 16
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 49 AND tv.verse_number = 3
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4: father-voice-naming-the-son-of-adam-at-the-investiture
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, '1 Enoch 39:5 — *the voice of the Holy One ... in the heaven, and the voice of the Elect One ... from the throne of glory.* The doubled Father / Son voice the Hebrew library promises; Matt 3:17 enacts the Father side publicly.'
  FROM cross_reference_threads t, cross_references x,
       _s132_verse_lookup sv, _s132_verse_lookup tv
 WHERE t.slug = 'father-voice-naming-the-son-of-adam-at-the-investiture'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 3 AND sv.verse_number = 17
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 39 AND tv.verse_number = 5
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, '1 Enoch 62:7 — the direct Father-voice naming the Son of Adam: *This is the Son of Adam who is born unto righteousness.* The construction Matt 3:17 enacts at the Yarden (Jordan).'
  FROM cross_reference_threads t, cross_references x,
       _s132_verse_lookup sv, _s132_verse_lookup tv
 WHERE t.slug = 'father-voice-naming-the-son-of-adam-at-the-investiture'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 3 AND sv.verse_number = 17
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 62 AND tv.verse_number = 7
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, 'Ascension of Isaiah 9:12 — the Beloved''s descent in human form. The framework the public naming at Matt 3:17 completes.'
  FROM cross_reference_threads t, cross_references x,
       _s132_verse_lookup sv, _s132_verse_lookup tv
 WHERE t.slug = 'father-voice-naming-the-son-of-adam-at-the-investiture'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 3 AND sv.verse_number = 17
   AND tv.edition_slug = 'ascension-isaiah' AND tv.book_slug = 'ascension-isaiah' AND tv.chapter_number = 9 AND tv.verse_number = 12
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, 'Ascension of Isaiah 11:32 — the ascent of the Beloved and the seating at the right hand of the Great Glory. The completion of the descent-naming-ascent arc the framework holds.'
  FROM cross_reference_threads t, cross_references x,
       _s132_verse_lookup sv, _s132_verse_lookup tv
 WHERE t.slug = 'father-voice-naming-the-son-of-adam-at-the-investiture'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 3 AND sv.verse_number = 17
   AND tv.edition_slug = 'ascension-isaiah' AND tv.book_slug = 'ascension-isaiah' AND tv.chapter_number = 11 AND tv.verse_number = 32
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 5: watcher-rebellion-as-source-of-the-vipers
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, '1 Enoch 6:1 — the opening of the Watcher-rebellion narrative.'
  FROM cross_reference_threads t, cross_references x,
       _s132_verse_lookup sv, _s132_verse_lookup tv
 WHERE t.slug = 'watcher-rebellion-as-source-of-the-vipers'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 3 AND sv.verse_number = 7
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 6 AND tv.verse_number = 1
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, '1 Enoch 6:2 — the lust-and-beget mechanism by which the Watchers seeded the tares into the human race.'
  FROM cross_reference_threads t, cross_references x,
       _s132_verse_lookup sv, _s132_verse_lookup tv
 WHERE t.slug = 'watcher-rebellion-as-source-of-the-vipers'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 3 AND sv.verse_number = 7
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 6 AND tv.verse_number = 2
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, '1 Enoch 10:9 — the judgment specifically against *the children of the Watchers,* the post-Flood persistence of the planted seed-line.'
  FROM cross_reference_threads t, cross_references x,
       _s132_verse_lookup sv, _s132_verse_lookup tv
 WHERE t.slug = 'watcher-rebellion-as-source-of-the-vipers'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 3 AND sv.verse_number = 7
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 10 AND tv.verse_number = 9
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, 'Jubilees 5:1 — the parallel Hebrew-library witness to the Watcher narrative.'
  FROM cross_reference_threads t, cross_references x,
       _s132_verse_lookup sv, _s132_verse_lookup tv
 WHERE t.slug = 'watcher-rebellion-as-source-of-the-vipers'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 3 AND sv.verse_number = 7
   AND tv.edition_slug = 'jubilees' AND tv.book_slug = 'jubilees' AND tv.chapter_number = 5 AND tv.verse_number = 1
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, 'Jubilees 10:1 — the persistence of the Watcher-spirits as unclean demons after the Flood. The lead-astray architecture the Pharisaic-Sadducean apparatus operates inside.'
  FROM cross_reference_threads t, cross_references x,
       _s132_verse_lookup sv, _s132_verse_lookup tv
 WHERE t.slug = 'watcher-rebellion-as-source-of-the-vipers'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 3 AND sv.verse_number = 7
   AND tv.edition_slug = 'jubilees' AND tv.book_slug = 'jubilees' AND tv.chapter_number = 10 AND tv.verse_number = 1
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Supplemental member: extend S131-landed `plant-of-righteousness-and-the-branch`
-- with the Matt 3:10 axe-at-the-root cross-reference.
-- The thread itself was created in S131; this just adds one new member.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, '1 Enoch 10:16 again — read at Matt 3:10: the destruction of the wrong-bearing trees is the clearing for the plant of righteousness to appear. The Hebrew library names the post-harvest sifting at the front of the gathering.'
  FROM cross_reference_threads t, cross_references x,
       _s132_verse_lookup sv, _s132_verse_lookup tv
 WHERE t.slug = 'plant-of-righteousness-and-the-branch'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 3 AND sv.verse_number = 10
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 10 AND tv.verse_number = 16
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

DROP VIEW _s132_verse_lookup;

\echo 'Session 132 migration complete. Verifying row counts...'

SELECT
    (SELECT count(*) FROM cross_references x WHERE x.tier_required = 'extras') AS extras_xref_rows_total,
    (SELECT count(*) FROM cross_reference_threads t WHERE t.tier_required = 'extras') AS extras_threads_total,
    (SELECT count(*) FROM cross_reference_thread_members m
       JOIN cross_reference_threads t ON t.id = m.thread_id
      WHERE t.tier_required = 'extras') AS extras_members_total;

-- Per-thread member counts for S132's new threads
SELECT t.slug, count(m.*) AS member_count
  FROM cross_reference_threads t
  LEFT JOIN cross_reference_thread_members m ON m.thread_id = t.id
 WHERE t.slug IN (
       'praise-of-elijah-and-the-yochanan-pattern',
       'heavens-opened-at-the-priestly-investiture',
       'spirit-of-wisdom-on-the-elect-one',
       'father-voice-naming-the-son-of-adam-at-the-investiture',
       'watcher-rebellion-as-source-of-the-vipers'
   )
 GROUP BY t.slug
 ORDER BY t.slug;

COMMIT;

\echo 'Session 132 — Matt 3 extras-tier cross-references migration done.'
