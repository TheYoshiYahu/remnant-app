-- ----- fragment: minion_hebrews_03.sql (S222 Hebrews 3) -----
-- =====================================================================
-- S222 minion — HEBREWS 3 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: HEBREWS 3.  Tag: h03 (temp view _s222_h03_lookup).  Sort band: floor 7914, ceiling 7920, step 1.
-- Source is ALWAYS the canon Hebrews verse; targets span Tanakh + extra-canonical + NT.
-- Tiers per-row: canon target = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (watchpoint): Moses is NOT denigrated and the Torah is NOT inferior. The chapter
-- holds Yahusha (Jesus) and Moses BOTH as faithful — *Who was faithful to him that appointed him,
-- as also Moses was faithful in all his house* (3:2) — and the contrast at 3:5-6 is servant-in-the-
-- house (Moses, faithful, *for a testimony of those things which were to be spoken after*) vs
-- son-over-the-house (Messiah, *a son over his own house*), NOT true-vs-false, NOT law-abolished.
-- The praise quotes Numbers 12:7 verbatim: *My servant Moses is not so, who is faithful in all mine
-- house* — Yahuah's own commendation of Moses against Miriam and Aaron's reproach. Then the
-- wilderness warning: 3:7-11 quotes Psalm 95:7-11 in full (*To day if ye will hear his voice,
-- harden not your hearts*), and 3:15 re-quotes it. The failure is unbelief = faithlessness: an
-- *evil heart of unbelief, in departing from the living Elohim (God)* (3:12) that *could not enter
-- in because of unbelief* (3:19). The rest forfeited is the same rest the prophet sang and the
-- generation lost when their *carcases fell in the wilderness* (3:17 / Numbers 14:29-32; the
-- covenant-refusal traced in Psalm 78:10, *they kept not the covenant … and refused to walk in his
-- law*). The continuation into Hebrews 4 (the rest *remaineth*, the Sabbath affirmed) is carried in
-- prose; the Psalm-95 thread anchors here at chapter 3 where the citation lands.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-6   Apostle and High Priest; Yahusha and Moses both faithful; servant-in-house / son-over-house
--           Tanakh: Numbers 12:7 (My servant Moses is faithful in all mine house — PRAISE)  Extras: none warranted  NT: none added (carried at Heb 4:14-16 in prose)
--   v.7-11  the Ruach HaKodesh saith: To day if ye will hear his voice, harden not your hearts (quoted in full)
--           Tanakh: Psalm 95:7, 95:8, 95:11 (the verbatim citation)  Extras: none warranted  NT: none warranted
--   v.12-15 evil heart of unbelief, departing from the living Elohim; exhort one another To day
--           Tanakh: none added (Psalm 95 re-quoted at 3:15, carried in the Psalm-95 thread)  Extras: none warranted  NT: 1 Corinthians 10:11 (ensamples), 1 Corinthians 10:12 (take heed lest he fall)
--   v.16-19 some provoked; carcases fell; could not enter in because of unbelief
--           Tanakh: Numbers 14:29 / 14:32 (carcases shall fall in this wilderness), Psalm 78:10 (refused to walk in his law)  Extras: none warranted  NT: none added (1 Cor 10 carried at v.12-15)
--
-- EXTRAS: none warranted for Hebrews 3. The wilderness-rebellion memory exists in the Hebrew library
-- (Wisdom, Sirach), but the writer of Hebrews has the canon texts explicitly in hand — Numbers 12:7,
-- Psalm 95:7-11 quoted verbatim, the Numbers 14 / Psalm 78 rebellion — and those are the load-bearing
-- witnesses. No extras pull adds framework weight the canon does not already carry here.
--
-- THREADS (slug -> target libraries):
--   7914 hebrews-3-the-apostle-and-high-priest-faithful-as-was-moses-numbers-12        (Tanakh)
--   7915 hebrews-3-to-day-if-ye-will-hear-his-voice-harden-not-your-hearts-psalm-95     (Tanakh)
--   7916 hebrews-3-an-evil-heart-of-unbelief-departing-from-the-living-elohim           (NT)
--   7917 hebrews-3-their-carcases-fell-in-the-wilderness-could-not-enter-for-unbelief   (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s222_h03_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: hebrews-3-the-apostle-and-high-priest-faithful-as-was-moses-numbers-12
  ('canon', 'hebrews', 3, 2, 'canon', 'numbers', 12, 7, 'free', E'*My servant Moses is not so, who is faithful in all mine house.* (Numbers 12:7). When Miriam and Aaron spake against Moses, Yahuah (LORD) himself stood in the door of the tabernacle and commended him: of all to whom he speaks in vision and dream, *my servant Moses is not so, who is faithful in all mine house.* The writer takes that very commendation as his measure for the Messiah: *Who was faithful to him that appointed him, as also Moses was faithful in all his house* (Hebrews 3:2). Moses is not the foil — he is the praised pattern of faithfulness, and Yahusha (Jesus) stands beside him as faithful in the same way.'),
  ('canon', 'hebrews', 3, 5, 'canon', 'numbers', 12, 7, 'free', E'*My servant Moses is not so, who is faithful in all mine house.* (Numbers 12:7). The honour Yahuah (LORD) gave Moses — *faithful in all mine house* — is exactly the honour the writer repeats: *And Moses verily was faithful in all his house, as a servant, for a testimony of those things which were to be spoken after* (Hebrews 3:5). The contrast that follows — *Messiah (Christ) as a son over his own house* (Hebrews 3:6) — is servant-in-the-house against son-over-the-house, not faithful against unfaithful. Moses the faithful servant testified beforehand of the things the Son would speak; both are faithful, each in his place.')
,
  -- thread: hebrews-3-to-day-if-ye-will-hear-his-voice-harden-not-your-hearts-psalm-95
  ('canon', 'hebrews', 3, 7, 'canon', 'psalms', 95, 7, 'free', E'*For he is our Elohim (God); and we are the people of his pasture, and the sheep of his hand. To day if ye will hear his voice,* (Psalm 95:7). The writer hears the psalm as the living voice of the Ruach HaKodesh (Holy Spirit) still speaking: *Wherefore (as the Ruach HaKodesh (Holy Spirit) saith, To day if ye will hear his voice* (Hebrews 3:7). The summons is not a closed chapter of history but a word that lands on every generation of the sheep of his hand — *To day* — calling for the hearing that is faithfulness, the hearing the wilderness generation refused.'),
  ('canon', 'hebrews', 3, 8, 'canon', 'psalms', 95, 8, 'free', E'*Harden not your heart, as in the provocation, and as in the day of temptation in the wilderness:* (Psalm 95:8). The Hebrews citation runs the psalm word for word: *Harden not your hearts, as in the provocation, in the day of temptation in the wilderness* (Hebrews 3:8). The hardened heart is the heart that hears the voice and will not bend to it — the very failure the wilderness generation enacted at Meribah and Massah. The warning stands over the hearers now: the danger is not the law but the hardened, unbelieving heart that refuses the voice.'),
  ('canon', 'hebrews', 3, 11, 'canon', 'psalms', 95, 11, 'free', E'*Unto whom I sware in my wrath that they should not enter into my rest.* (Psalm 95:11). The psalm ends on the oath, and so does the Hebrews citation: *So I sware in my wrath, They shall not enter into my rest* (Hebrews 3:11). The rest forfeited is the inheritance the faithless generation lost — and the writer presses it as a present peril, for the same oath warns the same way against the same unbelief. The faithlessness that hardens the heart shuts the door to the rest; the hearing that is faithfulness enters in.')
,
  -- thread: hebrews-3-an-evil-heart-of-unbelief-departing-from-the-living-elohim
  ('canon', 'hebrews', 3, 12, 'canon', '1-corinthians', 10, 11, 'free', E'*Now all these things happened unto them for ensamples: and they are written for our admonition, upon whom the ends of the world are come.* (1 Corinthians 10:11). The wilderness generation''s fall is no dead history; it is written for the living. *Take heed, brethren, lest there be in any of you an evil heart of unbelief, in departing from the living Elohim (God)* (Hebrews 3:12). Both writers read the wilderness the same way: the carcases that fell are an admonition to those who now hear the voice — the evil heart of unbelief, the departing, is the very thing the ensample warns against.'),
  ('canon', 'hebrews', 3, 14, 'canon', '1-corinthians', 10, 12, 'free', E'*Wherefore let him that thinketh he standeth take heed lest he fall.* (1 Corinthians 10:12). *For we are made partakers of Messiah (Christ), if we hold the beginning of our confidence stedfast unto the end* (Hebrews 3:14). The partaking is held by the steadfast, and the steadfast is the one who heeds the warning. *Let him that thinketh he standeth take heed lest he fall* — the same caution Hebrews presses with its *if we hold … stedfast unto the end.* Faithfulness held to the end is the mark of the partaker; presumption is the road back into the wilderness.')
,
  -- thread: hebrews-3-their-carcases-fell-in-the-wilderness-could-not-enter-for-unbelief
  ('canon', 'hebrews', 3, 17, 'canon', 'numbers', 14, 29, 'free', E'*Your carcases shall fall in this wilderness; and all that were numbered of you, according to your whole number, from twenty years old and upward, which have murmured against me,* (Numbers 14:29). The writer asks *with whom was he grieved forty years? was it not with them that had sinned, whose carcases fell in the wilderness?* (Hebrews 3:17) — and the answer is written plainly in the wilderness sentence itself: *your carcases shall fall in this wilderness … which have murmured against me.* The fallen are the murmurers, those who would not believe the One who had carried them out of Egypt.'),
  ('canon', 'hebrews', 3, 18, 'canon', 'numbers', 14, 32, 'free', E'*But as for you, your carcases, they shall fall in this wilderness.* (Numbers 14:32). *And to whom sware he that they should not enter into his rest, but to them that believed not?* (Hebrews 3:18). The oath barring the rest fell on the generation whose *carcases … shall fall in this wilderness* — those who, after all the signs, *believed not.* The writer reads it exactly as Numbers wrote it: the rest was lost not for keeping the covenant but for refusing to trust the Elohim (God) who kept them.'),
  ('canon', 'hebrews', 3, 19, 'canon', 'psalms', 78, 10, 'free', E'*They kept not the covenant of Elohim (God), and refused to walk in his law;* (Psalm 78:10). *So we see that they could not enter in because of unbelief* (Hebrews 3:19). The psalmist names the unbelief from the inside: the wilderness generation *kept not the covenant of Elohim (God), and refused to walk in his law.* The unbelief that shut the door to the rest was not a bare lapse of feeling but a refusal of the covenant and a refusal to walk in the law — faithlessness shown in turning away from his ways.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s222_h03_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s222_h03_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-3-the-apostle-and-high-priest-faithful-as-was-moses-numbers-12',
       E'The Apostle and High Priest — faithful, as Moses was faithful (Numbers 12)',
       E'This opening is read as if it demoted Moses; it does the opposite. The writer calls the reader to *consider the Apostle and High Priest of our profession, HaMashiach Yahusha (Christ Jesus)* (Hebrews 3:1), and his measure of the Messiah''s faithfulness is Moses'' own: *Who was faithful to him that appointed him, as also Moses was faithful in all his house* (Hebrews 3:2). That phrase is lifted straight from the moment Yahuah (LORD) defended Moses against the reproach of Miriam and Aaron — coming down in the pillar of the cloud to declare, *My servant Moses is not so, who is faithful in all mine house* (Numbers 12:7). It is the highest commendation: Moses the faithful servant, spoken to mouth to mouth. The writer keeps that praise intact: *And Moses verily was faithful in all his house, as a servant, for a testimony of those things which were to be spoken after* (Hebrews 3:5). The contrast that follows — *But Messiah (Christ) as a son over his own house; whose house are we, if we hold fast the confidence and the rejoicing of the hope firm unto the end* (Hebrews 3:6) — is servant-in-the-house against son-over-the-house, not faithful against unfaithful, not true against false. Moses the servant testified beforehand of the things the Son would speak and bring; both are faithful, each in his appointed place. The builder has more honour than the house, *but he that built all things is Elohim (God)* (Hebrews 3:4) — and the faithful servant is honoured within the house he was faithful in.',
       sv.verse_id, ev.verse_id, 'free', 7914
  FROM _s222_h03_lookup sv, _s222_h03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=3 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=3 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-3-to-day-if-ye-will-hear-his-voice-harden-not-your-hearts-psalm-95',
       E'To day if ye will hear his voice, harden not your hearts (Psalm 95)',
       E'The writer quotes Psalm 95 at length and hears it as the living voice of the Ruach HaKodesh (Holy Spirit) still speaking: *Wherefore (as the Ruach HaKodesh (Holy Spirit) saith, To day if ye will hear his voice, Harden not your hearts, as in the provocation, in the day of temptation in the wilderness* (Hebrews 3:7-8). The psalm sets the summons against the people it addresses — *we are the people of his pasture, and the sheep of his hand. To day if ye will hear his voice* (Psalm 95:7) — and warns them by the wilderness failure: *Harden not your heart, as in the provocation, and as in the day of temptation in the wilderness* (Psalm 95:8). The hardened heart is the heart that hears the voice and will not bend to it; that is the wilderness generation''s sin, played out at Meribah and Massah. The psalm closes on the oath, and so does the citation: *Unto whom I sware in my wrath that they should not enter into my rest* (Psalm 95:11) — *So I sware in my wrath, They shall not enter into my rest* (Hebrews 3:11). The rest barred from the faithless is pressed on the present hearer as a live peril: the same Spirit who spoke through the psalm speaks the same *To day,* and the same oath warns the same way. The danger is never the law — it is the hardened, unbelieving heart that refuses the voice. The hearing that is faithfulness enters the rest; the hardening that is faithlessness forfeits it.',
       sv.verse_id, ev.verse_id, 'free', 7915
  FROM _s222_h03_lookup sv, _s222_h03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=3 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=3 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-3-an-evil-heart-of-unbelief-departing-from-the-living-elohim',
       E'An evil heart of unbelief, departing from the living Elohim',
       E'The wilderness warning turns to the hearer: *Take heed, brethren, lest there be in any of you an evil heart of unbelief, in departing from the living Elohim (God)* (Hebrews 3:12); *But exhort one another daily, while it is called To day; lest any of you be hardened through the deceitfulness of sin* (Hebrews 3:13); *For we are made partakers of Messiah (Christ), if we hold the beginning of our confidence stedfast unto the end* (Hebrews 3:14). Paul reads the same wilderness the same way for the assembly: *Now all these things happened unto them for ensamples: and they are written for our admonition, upon whom the ends of the world are come* (1 Corinthians 10:11). The carcases that fell are not dead history but a written admonition to those who now hear the voice; the evil heart of unbelief, the departing, is the very thing the ensample warns against. And the steadfastness Hebrews requires — *if we hold … stedfast unto the end* — is the caution Paul presses: *Wherefore let him that thinketh he standeth take heed lest he fall* (1 Corinthians 10:12). The partaking of Messiah is held by the faithful who heed the warning; presumption is the road back into the wilderness. Faithfulness held to the end is the mark of the partaker — not a confidence that lets the heart harden, but a confidence held fast.',
       sv.verse_id, ev.verse_id, 'free', 7916
  FROM _s222_h03_lookup sv, _s222_h03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=3 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=3 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-3-their-carcases-fell-in-the-wilderness-could-not-enter-for-unbelief',
       E'Their carcases fell in the wilderness — could not enter for unbelief',
       E'The chapter closes by naming who fell and why. *For some, when they had heard, did provoke: howbeit not all that came out of Egypt by Moses. But with whom was he grieved forty years? was it not with them that had sinned, whose carcases fell in the wilderness?* (Hebrews 3:16-17). The sentence is written plainly in Numbers: *Your carcases shall fall in this wilderness; and all that were numbered of you … which have murmured against me* (Numbers 14:29), *But as for you, your carcases, they shall fall in this wilderness* (Numbers 14:32). The fallen are the murmurers — those who, after the cloud and the sea and the manna, would not trust the Elohim (God) who carried them. *And to whom sware he that they should not enter into his rest, but to them that believed not? So we see that they could not enter in because of unbelief* (Hebrews 3:18-19). The psalmist names that unbelief from the inside: *They kept not the covenant of Elohim (God), and refused to walk in his law* (Psalm 78:10). The unbelief that shut the door was no bare lapse of feeling — it was a refusal of the covenant and a refusal to walk in the law, faithlessness shown in turning from his ways. The rest was lost not for keeping the covenant but for breaking faith with the One who kept them; and the warning stands over every hearer who is called *To day.*',
       sv.verse_id, ev.verse_id, 'free', 7917
  FROM _s222_h03_lookup sv, _s222_h03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=3 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=3 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: hebrews-3-the-apostle-and-high-priest-faithful-as-was-moses-numbers-12
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 12:7 — *My servant Moses is not so, who is faithful in all mine house* Yahuah''s own commendation of Moses; the writer makes it the measure of the Messiah''s faithfulness (Hebrews 3:2).'
  FROM cross_reference_threads t, cross_references x, _s222_h03_lookup sv, _s222_h03_lookup tv
 WHERE t.slug='hebrews-3-the-apostle-and-high-priest-faithful-as-was-moses-numbers-12'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=3 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=12 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 12:7 — *faithful in all mine house* the contrast at Hebrews 3:5-6 is servant-in-the-house against son-over-the-house, not faithful against unfaithful (Hebrews 3:5).'
  FROM cross_reference_threads t, cross_references x, _s222_h03_lookup sv, _s222_h03_lookup tv
 WHERE t.slug='hebrews-3-the-apostle-and-high-priest-faithful-as-was-moses-numbers-12'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=3 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=12 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hebrews-3-to-day-if-ye-will-hear-his-voice-harden-not-your-hearts-psalm-95
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 95:7 — *we are the people of his pasture, and the sheep of his hand. To day if ye will hear his voice* the writer hears it as the Ruach HaKodesh (Holy Spirit) still speaking the summons to the sheep (Hebrews 3:7).'
  FROM cross_reference_threads t, cross_references x, _s222_h03_lookup sv, _s222_h03_lookup tv
 WHERE t.slug='hebrews-3-to-day-if-ye-will-hear-his-voice-harden-not-your-hearts-psalm-95'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=3 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=95 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 95:8 — *Harden not your heart, as in the provocation, and as in the day of temptation in the wilderness* the hardened heart hears the voice and will not bend; the wilderness sin enacted (Hebrews 3:8).'
  FROM cross_reference_threads t, cross_references x, _s222_h03_lookup sv, _s222_h03_lookup tv
 WHERE t.slug='hebrews-3-to-day-if-ye-will-hear-his-voice-harden-not-your-hearts-psalm-95'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=3 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=95 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 95:11 — *Unto whom I sware in my wrath that they should not enter into my rest* the oath barring the rest, pressed on the present hearer as a live peril (Hebrews 3:11).'
  FROM cross_reference_threads t, cross_references x, _s222_h03_lookup sv, _s222_h03_lookup tv
 WHERE t.slug='hebrews-3-to-day-if-ye-will-hear-his-voice-harden-not-your-hearts-psalm-95'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=3 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=95 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hebrews-3-an-evil-heart-of-unbelief-departing-from-the-living-elohim
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Corinthians 10:11 — *all these things happened unto them for ensamples … written for our admonition* the wilderness fall is written for the living; the evil heart of unbelief is what it warns against (Hebrews 3:12).'
  FROM cross_reference_threads t, cross_references x, _s222_h03_lookup sv, _s222_h03_lookup tv
 WHERE t.slug='hebrews-3-an-evil-heart-of-unbelief-departing-from-the-living-elohim'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=3 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=10 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Corinthians 10:12 — *let him that thinketh he standeth take heed lest he fall* the partaking is held by the steadfast who heed the warning; presumption is the road back to the wilderness (Hebrews 3:14).'
  FROM cross_reference_threads t, cross_references x, _s222_h03_lookup sv, _s222_h03_lookup tv
 WHERE t.slug='hebrews-3-an-evil-heart-of-unbelief-departing-from-the-living-elohim'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=3 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=10 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hebrews-3-their-carcases-fell-in-the-wilderness-could-not-enter-for-unbelief
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 14:29 — *Your carcases shall fall in this wilderness … which have murmured against me* the fallen are the murmurers who would not believe (Hebrews 3:17).'
  FROM cross_reference_threads t, cross_references x, _s222_h03_lookup sv, _s222_h03_lookup tv
 WHERE t.slug='hebrews-3-their-carcases-fell-in-the-wilderness-could-not-enter-for-unbelief'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=3 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=14 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 14:32 — *your carcases, they shall fall in this wilderness* the oath barring the rest fell on those who believed not (Hebrews 3:18).'
  FROM cross_reference_threads t, cross_references x, _s222_h03_lookup sv, _s222_h03_lookup tv
 WHERE t.slug='hebrews-3-their-carcases-fell-in-the-wilderness-could-not-enter-for-unbelief'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=3 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=14 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 78:10 — *They kept not the covenant of Elohim (God), and refused to walk in his law* the unbelief that shut the door was a refusal of the covenant and the law — faithlessness, not feeling (Hebrews 3:19).'
  FROM cross_reference_threads t, cross_references x, _s222_h03_lookup sv, _s222_h03_lookup tv
 WHERE t.slug='hebrews-3-their-carcases-fell-in-the-wilderness-could-not-enter-for-unbelief'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=3 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=78 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
