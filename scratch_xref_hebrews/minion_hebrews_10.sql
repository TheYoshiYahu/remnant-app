-- ----- fragment: minion_hebrews_10.sql (S222 Hebrews 10) -----
-- =====================================================================
-- S222 minion — HEBREWS 10 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: HEBREWS 10.  Tag: h10 (temp view _s222_h10_lookup).  Sort band: floor 7964, ceiling 7970, step 1.
-- Source is ALWAYS the canon Hebrews verse; targets span Tanakh + extra-canonical + NT.
-- Tiers per-row: canon target = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (the watchpoint): Hebrews 10 announces the finality of the once-for-all
-- offering — NOT the abolition of the Torah. *He taketh away the first, that he may establish
-- the second* (10:9): what is TAKEN AWAY is the system of animal sacrifice (which *can never
-- take away sins*, 10:11); what is ESTABLISHED is the once-for-all offering of the body of
-- Messiah (10:10). The covenant is RENEWED with the SAME law: *I will put my laws into their
-- hearts, and in their minds will I write them* (10:16, re-quoting Jeremiah 31:33) — the heart-
-- internalized Torah, not a discarded law. The ongoing call to obedience STANDS: the warning
-- against wilful sin (10:26), the *sorer punishment* set against the death without mercy under
-- Moses' law (10:28-29 / Deuteronomy 17:6), *Vengeance belongeth unto me* (10:30 / Deuteronomy
-- 32:35-36), and *the just shall live by faith* (10:38 / Habakkuk 2:3-4 — the same verse Romans
-- 1:17 quotes; faith = faithfulness/emunah).
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST:
--   v.1-4   the shadow of good things, the blood of bulls and goats cannot take away sins
--           Tanakh: Psalm 40:6 (carried in the Psalm-40 thread)  Extras: none warranted  NT: none warranted
--   v.5-8   Psalm 40 quoted: sacrifice thou wouldest not, but a body prepared; lo I come to do thy will
--           Tanakh: Psalm 40:6, 40:7, 40:8  Extras: none warranted  NT: none warranted
--   v.9-10  he taketh away the first, that he may establish the second; the body offered once for all
--           Tanakh: Psalm 40:6, 40:8 (the will-doing root)  Extras: none warranted  NT: John 19:30 (it is finished)
--   v.11-15 every priest standeth daily / this man one sacrifice for ever / perfected for ever
--           Tanakh: Psalm 110:1 (sat down, enemies the footstool) — carried in prose, woven elsewhere in Hebrews 1; none added here  Extras: none warranted  NT: none warranted
--   v.16-18 re-quote of Jeremiah 31: I will put my laws into their hearts; their sins remember no more
--           Tanakh: Jeremiah 31:33, 31:34  Extras: none warranted  NT: none warranted
--   v.19-25 boldness to enter by the new and living way; draw near; hold fast; assemble
--           Tanakh: none warranted  Extras: none warranted  NT: none warranted (John 4:24 thread already lives at john-4-...; not re-built here)
--   v.26-31 if we sin wilfully no more sacrifice; sorer punishment; vengeance belongeth unto me
--           Tanakh: Deuteronomy 17:6 (two or three witnesses), Deuteronomy 32:35, 32:36 (vengeance / Yahuah shall judge his people), Isaiah 26:11 (fire devour the adversaries)  Extras: none warranted  NT: none warranted
--   v.32-36 call to remembrance the former days; the better and enduring substance; patience
--           Tanakh: none warranted  Extras: none warranted  NT: none warranted
--   v.37-39 he that shall come will come; the just shall live by faith; not them who draw back
--           Tanakh: Habakkuk 2:3, 2:4  Extras: none warranted  NT: Romans 1:17 (the same Habakkuk citation)
--
-- THREADS (slug -> target libraries):
--   7964 hebrews-10-a-body-hast-thou-prepared-me-lo-i-come-to-do-thy-will-psalm-40        (Tanakh)
--   7965 hebrews-10-he-taketh-away-the-first-the-once-for-all-offering-of-the-body        (Tanakh + NT)
--   7966 hebrews-10-i-will-put-my-laws-into-their-hearts-jeremiah-31                       (Tanakh)
--   7967 hebrews-10-he-that-despised-moses-law-the-sorer-punishment-deuteronomy-17         (Tanakh)
--   7968 hebrews-10-vengeance-belongeth-unto-me-yahuah-shall-judge-his-people-deuteronomy-32  (Tanakh)
--   7969 hebrews-10-the-just-shall-live-by-faith-habakkuk-2-the-faithful-draw-not-back     (Tanakh + NT)
-- =====================================================================

CREATE TEMP VIEW _s222_h10_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: hebrews-10-a-body-hast-thou-prepared-me-lo-i-come-to-do-thy-will-psalm-40
  ('canon', 'hebrews', 10, 5, 'canon', 'psalms', 40, 6, 'free', E'*Sacrifice and offering thou didst not desire; mine ears hast thou opened: burnt offering and sin offering hast thou not required.* (Psalm 40:6). When Messiah *cometh into the world, he saith, Sacrifice and offering thou wouldest not, but a body hast thou prepared me* (Hebrews 10:5). The writer reaches straight back to the psalm of David: Yahuah (LORD) *didst not desire* the sacrifice and offering as the end in themselves — what he sought was the opened ear, the obedient body. The animal offerings were never the thing wanted; they pointed past themselves to the One who would come to do the will.'),
  ('canon', 'hebrews', 10, 7, 'canon', 'psalms', 40, 7, 'free', E'*Then said I, Lo, I come: in the volume of the book it is written of me,* (Psalm 40:7). *Then said I, Lo, I come (in the volume of the book it is written of me,) to do thy will, O Elohim (God)* (Hebrews 10:7). The Son speaks the psalmist''s very words: *Lo, I come,* and *in the volume of the book it is written of me.* The whole scroll was written toward this coming — the obedient One who steps into the world to render the will the offerings could only foreshadow.'),
  ('canon', 'hebrews', 10, 7, 'canon', 'psalms', 40, 8, 'free', E'*I delight to do thy will, O my Elohim (God): yea, thy law is within my heart.* (Psalm 40:8). The Son comes *to do thy will, O Elohim (God)* (Hebrews 10:7), and the psalm names what doing that will looks like: *I delight to do thy will, O my Elohim (God): yea, thy law is within my heart.* The will of Elohim and the law within the heart are one and the same — the very internalized Torah the new covenant promises. The obedience the sacrifices pointed toward is the law treasured in the heart and lived out, not the law set aside.'),
  -- thread: hebrews-10-he-taketh-away-the-first-the-once-for-all-offering-of-the-body
  ('canon', 'hebrews', 10, 9, 'canon', 'psalms', 40, 6, 'free', E'*Sacrifice and offering thou didst not desire; mine ears hast thou opened: burnt offering and sin offering hast thou not required.* (Psalm 40:6). *Then said he, Lo, I come to do thy will, O Elohim (God). He taketh away the first, that he may establish the second* (Hebrews 10:9). The *first* taken away is named in the verse before by the psalm itself: *sacrifice and offering* and *burnt offering and sin offering* — the system of animal offering that Yahuah (LORD) *didst not desire.* The *second* established is the will-doing of the obedient One. What is removed is the bull-and-goat administration, never the law it served.'),
  ('canon', 'hebrews', 10, 9, 'canon', 'psalms', 40, 8, 'free', E'*I delight to do thy will, O my Elohim (God): yea, thy law is within my heart.* (Psalm 40:8). When the Son says *Lo, I come to do thy will, O Elohim (God). He taketh away the first, that he may establish the second* (Hebrews 10:9), the *second* he establishes is exactly the psalm''s posture: *I delight to do thy will... yea, thy law is within my heart.* The thing established is heart-obedience to the will of Elohim with his law treasured within — the establishing of the law in the heart, not its abolition. The animal-offering shadow gives way to the substance: the obedient body that does the will.'),
  ('canon', 'hebrews', 10, 10, 'canon', 'john', 19, 30, 'free', E'*When Yahusha (Jesus) therefore had received the vinegar, he said, It is finished: and he bowed his head, and gave up the ghost.* (John 19:30). *By the which will we are sanctified through the offering of the body of Yahusha HaMashiach (Jesus Christ) once for all* (Hebrews 10:10). The offering of the body *once for all* is the moment the will was finished: *It is finished.* The daily priests stood and offered the same sacrifices that *can never take away sins* (Hebrews 10:11); the obedient Son offered his own body one time and sat down. What the bulls and goats year by year could not do, the once-for-all offering of the body accomplished — and the work was finished.'),
  -- thread: hebrews-10-i-will-put-my-laws-into-their-hearts-jeremiah-31
  ('canon', 'hebrews', 10, 16, 'canon', 'jeremiah', 31, 33, 'free', E'*But this shall be the covenant that I will make with the house of Yashar''el (Israel); After those days, saith Yahuah (LORD), I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people.* (Jeremiah 31:33). The writer cites the prophet as the very witness of the Ruach HaKodesh (Holy Spirit): *This is the covenant that I will make with them after those days, saith Yahuah (Lord), I will put my laws into their hearts, and in their minds will I write them* (Hebrews 10:16). The new covenant is the SAME law — *my law,* *my laws* — now written within. The change is internalization, the law moved from tables of stone into the inward parts. Nothing here annuls the Torah; it engraves it on the heart.'),
  ('canon', 'hebrews', 10, 17, 'canon', 'jeremiah', 31, 34, 'free', E'*And they shall teach no more every man his neighbour, and every man his brother, saying, Know Yahuah (LORD): for they shall all know me, from the least of them unto the greatest of them, saith Yahuah (LORD): for I will forgive their iniquity, and I will remember their sin no more.* (Jeremiah 31:34). *And their sins and iniquities will I remember no more* (Hebrews 10:17). The writer quotes the prophet''s closing clause word for word. The remembrance of sins *every year* by the old offerings (Hebrews 10:3) gives way to the covenant promise of full pardon: *I will remember their sin no more.* Where this remission is reached, *there is no more offering for sin* (Hebrews 10:18) — not because the law is gone, but because the forgiveness the law''s sacrifices reached toward is now complete.'),
  -- thread: hebrews-10-he-that-despised-moses-law-the-sorer-punishment-deuteronomy-17
  ('canon', 'hebrews', 10, 28, 'canon', 'deuteronomy', 17, 6, 'free', E'*At the mouth of two witnesses, or three witnesses, shall he that is worthy of death be put to death; but at the mouth of one witness he shall not be put to death.* (Deuteronomy 17:6). *He that despised Moses’ law died without mercy under two or three witnesses* (Hebrews 10:28). The writer leans the whole weight of his warning on the standing authority of the Torah: the law of Moses still defines what despising covenant looks like, still names the *two or three witnesses* by which death is established. He does not set Moses'' law aside — he argues FROM it: if breaking it brought death without mercy, how much sorer the punishment for trampling the Son and the blood of the covenant.'),
  ('canon', 'hebrews', 10, 27, 'canon', 'isaiah', 26, 11, 'free', E'*Yahuah (LORD), when thy hand is lifted up, they will not see: but they shall see, and be ashamed for their envy at the people; yea, the fire of thine enemies shall devour them.* (Isaiah 26:11). The wilful sinner has only *a certain fearful looking for of judgment and fiery indignation, which shall devour the adversaries* (Hebrews 10:27). The prophet had already named that fire: *the fire of thine enemies shall devour them.* The judgment the writer warns of is no new severity but the long-promised consuming of the adversaries who would not see when the hand of Yahuah (LORD) was lifted up.'),
  -- thread: hebrews-10-vengeance-belongeth-unto-me-yahuah-shall-judge-his-people-deuteronomy-32
  ('canon', 'hebrews', 10, 30, 'canon', 'deuteronomy', 32, 35, 'free', E'*To me belongeth vengeance, and recompence; their foot shall slide in due time: for the day of their calamity is at hand, and the things that shall come upon them make haste.* (Deuteronomy 32:35). *For we know him that hath said, Vengeance belongeth unto me, I will recompense, saith Yahuah (Lord)* (Hebrews 10:30). The writer quotes the Song of Moses: *To me belongeth vengeance, and recompence.* The settling of accounts is Yahuah''s (LORD''s) own — not abandoned, not abolished by the new covenant, but reserved in his hand. The warning to the wilful sinner is grounded in the same word Moses sang over Yashar''el (Israel).'),
  ('canon', 'hebrews', 10, 30, 'canon', 'deuteronomy', 32, 36, 'free', E'*For Yahuah (LORD) shall judge his people, and repent himself for his servants, when he seeth that their power is gone, and there is none shut up, or left.* (Deuteronomy 32:36). *And again, Yahuah (Lord) shall judge his people* (Hebrews 10:30). The writer adds the next line of the same song: *Yahuah (LORD) shall judge his people.* That Yahuah judges his own people is mercy and severity in one motion — he judges, and he *repent himself for his servants.* The living Elohim into whose hands it is a fearful thing to fall (Hebrews 10:31) is the same Yahuah who judges and vindicates his people in the Song of Moses.'),
  -- thread: hebrews-10-the-just-shall-live-by-faith-habakkuk-2-the-faithful-draw-not-back
  ('canon', 'hebrews', 10, 37, 'canon', 'habakkuk', 2, 3, 'free', E'*For the vision is yet for an appointed time, but at the end it shall speak, and not lie: though it tarry, wait for it; because it will surely come, it will not tarry.* (Habakkuk 2:3). *For yet a little while, and he that shall come will come, and will not tarry* (Hebrews 10:37). The writer takes up the prophet''s own promise of the appointed time: *though it tarry, wait for it; because it will surely come, it will not tarry.* The coming One is sure; the call is to wait in faithfulness for what *will surely come.*'),
  ('canon', 'hebrews', 10, 38, 'canon', 'habakkuk', 2, 4, 'free', E'*Behold, his soul which is lifted up is not upright in him: but the just shall live by his faith.* (Habakkuk 2:4). *Now the just shall live by faith: but if any man draw back, my soul shall have no pleasure in him* (Hebrews 10:38). The prophet sets the two souls side by side: the one *lifted up,* not upright, against the just who *shall live by his faith.* This is faithfulness — the enduring trust that does not draw back. The writer presses the contrast: the just live by faith, while the one who draws back is the proud soul in whom Elohim has no pleasure.'),
  ('canon', 'hebrews', 10, 38, 'canon', 'romans', 1, 17, 'free', E'*For therein is the righteousness of Elohim (God) revealed from faith to faith: as it is written, The just shall live by faith.* (Romans 1:17). *Now the just shall live by faith: but if any man draw back, my soul shall have no pleasure in him* (Hebrews 10:38). Paul and the writer to the Hebrews quote the same word of Habakkuk — *The just shall live by faith.* In both it is faithfulness, the trust that endures and does not draw back. The righteous one lives by clinging, by walking on in emunah toward the One who *will surely come* — the same faith that justifies and the same faith that perseveres.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s222_h10_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s222_h10_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-10-a-body-hast-thou-prepared-me-lo-i-come-to-do-thy-will-psalm-40',
       E'A body hast thou prepared me — Lo, I come to do thy will (Psalm 40)',
       E'When Messiah *cometh into the world, he saith, Sacrifice and offering thou wouldest not, but a body hast thou prepared me: In burnt offerings and sacrifices for sin thou hast had no pleasure. Then said I, Lo, I come (in the volume of the book it is written of me,) to do thy will, O Elohim (God)* (Hebrews 10:5-7). The writer is quoting David''s psalm, and it carries the whole frame. *Sacrifice and offering thou didst not desire; mine ears hast thou opened: burnt offering and sin offering hast thou not required* (Psalm 40:6) — the animal offerings were never the thing Yahuah (LORD) sought; he sought the opened ear, the obedient body. *Then said I, Lo, I come: in the volume of the book it is written of me* (Psalm 40:7) — the whole scroll was written toward this coming. And the psalm names exactly what doing the will means: *I delight to do thy will, O my Elohim (God): yea, thy law is within my heart* (Psalm 40:8). The will of Elohim and the law within the heart are one. The obedience the sacrifices foreshadowed is the law treasured in the heart and lived out — the very internalized Torah of the new covenant, not the law set aside.',
       sv.verse_id, ev.verse_id, 'free', 7964
  FROM _s222_h10_lookup sv, _s222_h10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=10 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=10 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-10-he-taketh-away-the-first-the-once-for-all-offering-of-the-body',
       E'He taketh away the first — the once-for-all offering of the body',
       E'*Then said he, Lo, I come to do thy will, O Elohim (God). He taketh away the first, that he may establish the second* (Hebrews 10:9). Read inside the psalm the writer is quoting, the *first* is named plainly: *Sacrifice and offering thou didst not desire... burnt offering and sin offering hast thou not required* (Psalm 40:6) — the bull-and-goat administration, the offerings that *can never take away sins* (Hebrews 10:11). That is what is taken away. The *second* established is the will-doing of the obedient One, and the psalm names it as heart-obedience with the law treasured within: *I delight to do thy will, O my Elohim (God): yea, thy law is within my heart* (Psalm 40:8). What is removed is the animal-sacrifice system; what is established is the law in the heart and the obedience it produces — never the abolition of the Torah. And the offering that fulfils it is given once: *By the which will we are sanctified through the offering of the body of Yahusha HaMashiach (Jesus Christ) once for all* (Hebrews 10:10). The daily priests stood and offered repeatedly what could not take away sin; the obedient Son offered his own body one time and the work was finished: *When Yahusha (Jesus) therefore had received the vinegar, he said, It is finished: and he bowed his head, and gave up the ghost* (John 19:30). What the offerings year by year could not do, the once-for-all offering of the body accomplished. The shadow gave way to the substance — the body that did the will.',
       sv.verse_id, ev.verse_id, 'free', 7965
  FROM _s222_h10_lookup sv, _s222_h10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=10 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=10 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-10-i-will-put-my-laws-into-their-hearts-jeremiah-31',
       E'I will put my laws into their hearts (Jeremiah 31)',
       E'The writer brings forward the Ruach HaKodesh (Holy Spirit) as witness and quotes the prophet a second time in the epistle: *This is the covenant that I will make with them after those days, saith Yahuah (Lord), I will put my laws into their hearts, and in their minds will I write them; And their sins and iniquities will I remember no more* (Hebrews 10:16-17). This is Jeremiah''s new covenant, word for word: *But this shall be the covenant that I will make with the house of Yashar''el (Israel); After those days, saith Yahuah (LORD), I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people* (Jeremiah 31:33). The covenant is the SAME law — *my law,* *my laws* — now moved from tables of stone into the inward parts. The change is internalization, not annulment; the Torah engraved on the heart, not discarded. And it comes with full pardon: *for I will forgive their iniquity, and I will remember their sin no more* (Jeremiah 31:34). The old offerings made *a remembrance again of sins every year* (Hebrews 10:3); the new covenant reaches the forgiveness those offerings pointed toward — *their sins and iniquities will I remember no more.* Where this remission is reached, *there is no more offering for sin* (Hebrews 10:18). The sacrificial administration is finished because the forgiveness is complete — and the law it served is now written where it always belonged, on the heart.',
       sv.verse_id, ev.verse_id, 'free', 7966
  FROM _s222_h10_lookup sv, _s222_h10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=10 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=10 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-10-he-that-despised-moses-law-the-sorer-punishment-deuteronomy-17',
       E'He that despised Moses'' law — the sorer punishment (Deuteronomy 17)',
       E'The once-for-all offering does not loosen the call to obedience — it sharpens it. *For if we sin wilfully after that we have received the knowledge of the truth, there remaineth no more sacrifice for sins, But a certain fearful looking for of judgment and fiery indignation, which shall devour the adversaries* (Hebrews 10:26-27). The prophet had already named that fire: *Yahuah (LORD), when thy hand is lifted up, they will not see: but they shall see, and be ashamed for their envy at the people; yea, the fire of thine enemies shall devour them* (Isaiah 26:11). Then the writer argues from the standing authority of the Torah itself: *He that despised Moses’ law died without mercy under two or three witnesses* (Hebrews 10:28) — leaning on the very statute of Moses, *At the mouth of two witnesses, or three witnesses, shall he that is worthy of death be put to death; but at the mouth of one witness he shall not be put to death* (Deuteronomy 17:6). He does not set Moses'' law aside; he argues FROM it. If despising the law brought death without mercy, *of how much sorer punishment, suppose ye, shall he be thought worthy, who hath trodden under foot the Son of Elohim (God), and hath counted the blood of the covenant, wherewith he was sanctified, an unholy thing* (Hebrews 10:29). The law of Moses still stands as the measure; the trampling of the Son is the sorer offense.',
       sv.verse_id, ev.verse_id, 'free', 7967
  FROM _s222_h10_lookup sv, _s222_h10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=10 AND sv.verse_number=26
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=10 AND ev.verse_number=29
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-10-vengeance-belongeth-unto-me-yahuah-shall-judge-his-people-deuteronomy-32',
       E'Vengeance belongeth unto me — Yahuah shall judge his people (Deuteronomy 32)',
       E'The warning rests on the Song of Moses. *For we know him that hath said, Vengeance belongeth unto me, I will recompense, saith Yahuah (Lord). And again, Yahuah (Lord) shall judge his people* (Hebrews 10:30). Both lines come from the song Moses sang over Yashar''el (Israel): *To me belongeth vengeance, and recompence; their foot shall slide in due time: for the day of their calamity is at hand* (Deuteronomy 32:35), and *For Yahuah (LORD) shall judge his people, and repent himself for his servants, when he seeth that their power is gone* (Deuteronomy 32:36). The settling of accounts is Yahuah''s (LORD''s) own, reserved in his hand — not abandoned, not abolished by the new covenant. And that Yahuah judges his own people is mercy and severity in one motion: he judges, and he *repent himself for his servants.* So *it is a fearful thing to fall into the hands of the living Elohim (God)* (Hebrews 10:31) — the same living Yahuah of the Song of Moses, who judges and vindicates his people. The new covenant does not retire his judgment; it leaves the recompence exactly where Moses sang it belonged.',
       sv.verse_id, ev.verse_id, 'free', 7968
  FROM _s222_h10_lookup sv, _s222_h10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=10 AND sv.verse_number=30
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=10 AND ev.verse_number=31
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-10-the-just-shall-live-by-faith-habakkuk-2-the-faithful-draw-not-back',
       E'The just shall live by faith — the faithful draw not back (Habakkuk 2)',
       E'The chapter closes on the prophet Habakkuk. *For yet a little while, and he that shall come will come, and will not tarry. Now the just shall live by faith: but if any man draw back, my soul shall have no pleasure in him* (Hebrews 10:37-38). Both lines are Habakkuk''s. The coming is sure: *For the vision is yet for an appointed time, but at the end it shall speak, and not lie: though it tarry, wait for it; because it will surely come, it will not tarry* (Habakkuk 2:3). And the two souls stand side by side: *Behold, his soul which is lifted up is not upright in him: but the just shall live by his faith* (Habakkuk 2:4). This faith is faithfulness — the enduring trust that waits for what will surely come and does not draw back. It is the very word Paul takes up: *For therein is the righteousness of Elohim (God) revealed from faith to faith: as it is written, The just shall live by faith* (Romans 1:17). Paul and the writer to the Hebrews quote the same line of the same prophet, and in both it is emunah — the trust that justifies and the trust that perseveres. So the writer ends: *we are not of them who draw back unto perdition; but of them that believe to the saving of the soul* (Hebrews 10:39). The just live by clinging, walking on in faithfulness toward the One who will surely come.',
       sv.verse_id, ev.verse_id, 'free', 7969
  FROM _s222_h10_lookup sv, _s222_h10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=10 AND sv.verse_number=37
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=10 AND ev.verse_number=39
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
  -- thread: hebrews-10-a-body-hast-thou-prepared-me-lo-i-come-to-do-thy-will-psalm-40
  ('hebrews-10-a-body-hast-thou-prepared-me-lo-i-come-to-do-thy-will-psalm-40', 'canon','hebrews',10,5, 'canon','psalms',40,6, 1, E'Psalm 40:6 — *Sacrifice and offering thou didst not desire; mine ears hast thou opened* — the offerings were never the thing wanted; the opened ear and obedient body were.'),
  ('hebrews-10-a-body-hast-thou-prepared-me-lo-i-come-to-do-thy-will-psalm-40', 'canon','hebrews',10,7, 'canon','psalms',40,7, 2, E'Psalm 40:7 — *Lo, I come: in the volume of the book it is written of me* — the Son speaks the psalmist''s words; the whole scroll was written toward this coming.'),
  ('hebrews-10-a-body-hast-thou-prepared-me-lo-i-come-to-do-thy-will-psalm-40', 'canon','hebrews',10,7, 'canon','psalms',40,8, 3, E'Psalm 40:8 — *I delight to do thy will... yea, thy law is within my heart* — the will of Elohim and the law in the heart are one; the obedience the sacrifices pointed toward.'),
  -- thread: hebrews-10-he-taketh-away-the-first-the-once-for-all-offering-of-the-body
  ('hebrews-10-he-taketh-away-the-first-the-once-for-all-offering-of-the-body', 'canon','hebrews',10,9, 'canon','psalms',40,6, 1, E'Psalm 40:6 — *Sacrifice and offering thou didst not desire... burnt offering and sin offering hast thou not required* — the *first* taken away is the animal-offering system, named in the psalm itself.'),
  ('hebrews-10-he-taketh-away-the-first-the-once-for-all-offering-of-the-body', 'canon','hebrews',10,9, 'canon','psalms',40,8, 2, E'Psalm 40:8 — *I delight to do thy will... yea, thy law is within my heart* — the *second* established is heart-obedience with the law treasured within, not the law abolished.'),
  ('hebrews-10-he-taketh-away-the-first-the-once-for-all-offering-of-the-body', 'canon','hebrews',10,10, 'canon','john',19,30, 3, E'John 19:30 — *It is finished: and he bowed his head, and gave up the ghost* — the once-for-all offering of the body was the moment the will was finished.'),
  -- thread: hebrews-10-i-will-put-my-laws-into-their-hearts-jeremiah-31
  ('hebrews-10-i-will-put-my-laws-into-their-hearts-jeremiah-31', 'canon','hebrews',10,16, 'canon','jeremiah',31,33, 1, E'Jeremiah 31:33 — *I will put my law in their inward parts, and write it in their hearts* — the new covenant is the SAME law, now internalized, not annulled.'),
  ('hebrews-10-i-will-put-my-laws-into-their-hearts-jeremiah-31', 'canon','hebrews',10,17, 'canon','jeremiah',31,34, 2, E'Jeremiah 31:34 — *I will forgive their iniquity, and I will remember their sin no more* — the full pardon the old yearly offerings could only point toward.'),
  -- thread: hebrews-10-he-that-despised-moses-law-the-sorer-punishment-deuteronomy-17
  ('hebrews-10-he-that-despised-moses-law-the-sorer-punishment-deuteronomy-17', 'canon','hebrews',10,28, 'canon','deuteronomy',17,6, 1, E'Deuteronomy 17:6 — *At the mouth of two witnesses, or three witnesses, shall he that is worthy of death be put to death* — the writer argues FROM Moses'' standing law, not against it.'),
  ('hebrews-10-he-that-despised-moses-law-the-sorer-punishment-deuteronomy-17', 'canon','hebrews',10,27, 'canon','isaiah',26,11, 2, E'Isaiah 26:11 — *the fire of thine enemies shall devour them* — the *fiery indignation, which shall devour the adversaries* is the long-promised consuming of those who would not see.'),
  -- thread: hebrews-10-vengeance-belongeth-unto-me-yahuah-shall-judge-his-people-deuteronomy-32
  ('hebrews-10-vengeance-belongeth-unto-me-yahuah-shall-judge-his-people-deuteronomy-32', 'canon','hebrews',10,30, 'canon','deuteronomy',32,35, 1, E'Deuteronomy 32:35 — *To me belongeth vengeance, and recompence* — the recompence is Yahuah''s own, reserved in his hand, sung in the Song of Moses.'),
  ('hebrews-10-vengeance-belongeth-unto-me-yahuah-shall-judge-his-people-deuteronomy-32', 'canon','hebrews',10,30, 'canon','deuteronomy',32,36, 2, E'Deuteronomy 32:36 — *Yahuah (LORD) shall judge his people, and repent himself for his servants* — judgment and vindication of his own people in one motion.'),
  -- thread: hebrews-10-the-just-shall-live-by-faith-habakkuk-2-the-faithful-draw-not-back
  ('hebrews-10-the-just-shall-live-by-faith-habakkuk-2-the-faithful-draw-not-back', 'canon','hebrews',10,37, 'canon','habakkuk',2,3, 1, E'Habakkuk 2:3 — *though it tarry, wait for it; because it will surely come, it will not tarry* — the appointed coming is sure; the call is to wait in faithfulness.'),
  ('hebrews-10-the-just-shall-live-by-faith-habakkuk-2-the-faithful-draw-not-back', 'canon','hebrews',10,38, 'canon','habakkuk',2,4, 2, E'Habakkuk 2:4 — *the just shall live by his faith* — faithfulness, the enduring trust set against the proud soul that draws back.'),
  ('hebrews-10-the-just-shall-live-by-faith-habakkuk-2-the-faithful-draw-not-back', 'canon','hebrews',10,38, 'canon','romans',1,17, 3, E'Romans 1:17 — *as it is written, The just shall live by faith* — Paul quotes the same line of Habakkuk; the same emunah that justifies and perseveres.')
) AS m(slug, src_edition,src_slug,src_ch,src_v, tgt_edition,tgt_slug,tgt_ch,tgt_v, sort_order, member_note)
  JOIN cross_reference_threads t ON t.slug = m.slug
  JOIN _s222_h10_lookup sv ON sv.edition_slug=m.src_edition AND sv.book_slug=m.src_slug AND sv.chapter_number=m.src_ch AND sv.verse_number=m.src_v
  JOIN _s222_h10_lookup tv ON tv.edition_slug=m.tgt_edition AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
