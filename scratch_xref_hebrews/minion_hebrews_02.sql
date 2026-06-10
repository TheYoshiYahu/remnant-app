-- ----- fragment: minion_hebrews_02.sql (S222 Hebrews 2) -----
-- =====================================================================
-- S222 minion — HEBREWS 2 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: HEBREWS 2.  Tag: h02 (temp view _s222_h02_lookup).  Sort band: 7907..7913, step 1.
-- Source is ALWAYS the canon Hebrews verse; targets span Tanakh + extra-canonical + NT.
-- Tiers per-row: canon target = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME: Hebrews 2 is the incarnation chapter — the Formed truly took flesh. Yahusha
-- (Jesus) *was made a little lower than the angels for the suffering of death* (2:9), *took part*
-- of *flesh and blood* (2:14), *took on him the seed of Abraham* (2:16), and so became *a merciful
-- and faithful high priest* (2:17). The Christology watchpoint: the Son who tasted death and was
-- *made perfect through sufferings* (2:10) has a Father — *he is not ashamed to call them brethren*
-- and says *I will put my trust in him* (2:13) — he is the Formed drawn from the Formless, who came
-- in flesh, not a co-equal second person, and not the Father himself. The chapter's three Tanakh
-- quotations carry the weave: Psalm 8 (the son of Adam crowned with glory), Psalm 22 (declaring
-- the name unto the brethren), Isaiah 8 (behold I and the children). Son-of-Adam note: 2:6 quotes
-- Psalm 8 *son of Adam* — a plain son-of-Adam restoration, NOT the Daniel 7 kaph carve-out.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-4   so great salvation, spoken by Yahuah, confirmed with signs
--           Tanakh: none warranted (the warning is internal to the catena's argument)  Extras: none warranted  NT: none warranted
--   v.5-9   made a little lower than the angels / crowned with glory / all things under his feet
--           Tanakh: Psalm 8:4 (what is man / son of Adam), 8:5 (lower than the angels, crowned), 8:6 (all things under his feet)  Extras: none warranted  NT: none warranted (Phil 2 carried at the incarnation thread, v.14-18)
--   v.10-11 captain of salvation perfect through sufferings / he that sanctifieth and they sanctified all of one
--           Tanakh: none added (carried into the Psalm 22 thread at v.12)  Extras: none warranted  NT: none warranted
--   v.12    I will declare thy name unto my brethren / in the midst of the church sing praise
--           Tanakh: Psalm 22:22 (declare thy name / midst of the congregation), 22:23 (all ye seed of Jacob praise him)  Extras: none warranted  NT: none warranted
--   v.13    I will put my trust in him / Behold I and the children which Elohim hath given me
--           Tanakh: Isaiah 8:17 (I will wait upon Yahuah), 8:18 (behold I and the children given me)  Extras: none warranted  NT: none warranted
--   v.14-18 partakers of flesh and blood / took on him the seed of Abraham / merciful faithful high priest
--           Tanakh: Genesis 22:17 (multiply thy seed — the seed of Abraham he took on him)  Extras: none warranted  NT: Philippians 2:7 (took the form of a servant, made in the likeness of men), 2:8 (obedient unto death)
--
--   Extras across the whole chapter: NONE WARRANTED. The Melchizedek priest-king tradition
--   (Genesis 14 / Jubilees / 2 Enoch) belongs to Hebrews 5 and 7; the faith-cloud extras
--   (1 Enoch, Jubilees, Sirach, 2 Maccabees) belong to Hebrews 11. Chapter 2 carries no
--   load-bearing unique extra-canonical witness; the weave is Tanakh + NT. Curated, not a dump.
--
-- THREADS (slug -> target libraries):
--   7907 hebrews-2-what-is-man-the-son-of-adam-crowned-with-glory-psalm-8          (Tanakh)
--   7908 hebrews-2-i-will-declare-thy-name-unto-my-brethren-psalm-22               (Tanakh)
--   7909 hebrews-2-behold-i-and-the-children-which-elohim-hath-given-me-isaiah-8   (Tanakh)
--   7910 hebrews-2-flesh-and-blood-the-seed-of-abraham-the-merciful-high-priest    (Tanakh + NT)
-- =====================================================================

CREATE TEMP VIEW _s222_h02_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: hebrews-2-what-is-man-the-son-of-adam-crowned-with-glory-psalm-8
  ('canon', 'hebrews', 2, 6, 'canon', 'psalms', 8, 4, 'free', E'*What is man, that thou art mindful of him? and the son of Adam, that thou visitest him?* (Psalm 8:4). The writer says *one in a certain place testified, saying, What is man, that thou art mindful of him? or the son of Adam, that thou visitest him?* (Hebrews 2:6) — quoting the psalm word for word. The psalm marvels that the Most High should be mindful of the *son of Adam,* the seed drawn from the first formed man; Hebrews takes up that very wonder and bends it toward the One who fulfils it.'),
  ('canon', 'hebrews', 2, 7, 'canon', 'psalms', 8, 5, 'free', E'*For thou hast made him a little lower than the angels, and hast crowned him with glory and honour.* (Psalm 8:5). Hebrews quotes it directly: *Thou madest him a little lower than the angels; thou crownedst him with glory and honour* (Hebrews 2:7). The lowering and the crowning are read of the Son who *was made a little lower than the angels for the suffering of death, crowned with glory and honour* (Hebrews 2:9) — the path of the son of Adam from humiliation to glory walked out in the flesh of Yahusha (Jesus).'),
  ('canon', 'hebrews', 2, 8, 'canon', 'psalms', 8, 6, 'free', E'*Thou madest him to have dominion over the works of thy hands; thou hast put all things under his feet:* (Psalm 8:6). *Thou hast put all things in subjection under his feet. For in that he put all in subjection under him, he left nothing that is not put under him. But now we see not yet all things put under him* (Hebrews 2:8). The dominion granted to the son of Adam at creation is restored and exceeded in the crowned Son — all things put under his feet, though the consummation is *not yet* seen. The first Adam''s forfeited dominion is taken up by the One who tasted death for every man.'),
  -- thread: hebrews-2-i-will-declare-thy-name-unto-my-brethren-psalm-22
  ('canon', 'hebrews', 2, 12, 'canon', 'psalms', 22, 22, 'free', E'*I will declare thy name unto my brethren: in the midst of the congregation will I praise thee.* (Psalm 22:22). Hebrews puts these words in the mouth of the Son: *Saying, I will declare thy name unto my brethren, in the midst of the church will I sing praise unto thee* (Hebrews 2:12). The psalm of the forsaken one — *my Elohim (God), my Elohim (God), why hast thou forsaken me?* (Psalm 22:1) — turns at its end to praise; the One who suffered and is *not ashamed to call them brethren* (Hebrews 2:11) names the Father''s name among his own and leads their praise.'),
  ('canon', 'hebrews', 2, 12, 'canon', 'psalms', 22, 23, 'free', E'*Ye that fear Yahuah (LORD), praise him; all ye the seed of Jacob, glorify him; and fear him, all ye the seed of Yashar''el (Israel).* (Psalm 22:23). The brethren in whose midst the Son sings praise — *in the midst of the church will I sing praise unto thee* (Hebrews 2:12) — are named in the psalm''s next breath: *all ye the seed of Jacob,* *all ye the seed of Yashar''el (Israel).* The congregation he gathers to declare the Father''s name is the seed itself, called to glorify the One who delivered the afflicted.'),
  -- thread: hebrews-2-behold-i-and-the-children-which-elohim-hath-given-me-isaiah-8
  ('canon', 'hebrews', 2, 13, 'canon', 'isaiah', 8, 17, 'free', E'*And I will wait upon Yahuah (LORD), that hideth his face from the house of Jacob, and I will look for him.* (Isaiah 8:17). Hebrews quotes the prophet''s trust as the Son''s own: *And again, I will put my trust in him* (Hebrews 2:13). The One *made perfect through sufferings* (Hebrews 2:10) speaks the language of dependence — *I will wait upon Yahuah (LORD)* — the Formed who took flesh putting his trust in the Father whose face was hidden, looking for him through the suffering.'),
  ('canon', 'hebrews', 2, 13, 'canon', 'isaiah', 8, 18, 'free', E'*Behold, I and the children whom Yahuah (LORD) hath given me are for signs and for wonders in Yashar''el (Israel) from Yahuah Tseva''ot (LORD of hosts), which dwelleth in mount Zion.* (Isaiah 8:18). The second clause Hebrews quotes — *And again, Behold I and the children which Elohim (God) hath given me* (Hebrews 2:13) — is the prophet''s word taken up by the Son. The children are *given* him by the Father; he stands with them as their elder brother, *for which cause he is not ashamed to call them brethren* (Hebrews 2:11), the gathered seed who are for signs and wonders in Yashar''el (Israel).'),
  -- thread: hebrews-2-flesh-and-blood-the-seed-of-abraham-the-merciful-high-priest
  ('canon', 'hebrews', 2, 16, 'canon', 'genesis', 22, 17, 'free', E'*That in blessing I will bless thee, and in multiplying I will multiply thy seed as the stars of the heaven, and as the sand which is upon the sea shore; and thy seed shall possess the gate of his enemies;* (Genesis 22:17). Hebrews says of the Son, *For verily he took not on him the nature of angels; but he took on him the seed of Abraham* (Hebrews 2:16). The seed Yahuah (LORD) swore to multiply on the mount of the binding is the seed the Son joined himself to in the flesh — taking on him not angels but *the seed of Abraham,* entering the very line of promise to redeem it from within.'),
  ('canon', 'hebrews', 2, 14, 'canon', 'philippians', 2, 7, 'free', E'*But made himself of no reputation, and took upon him the form of a servant, and was made in the likeness of men:* (Philippians 2:7). *Forasmuch then as the children are partakers of flesh and blood, he also himself likewise took part of the same* (Hebrews 2:14). The two say one thing: the One *being in the form of Elohim (God)* (Philippians 2:6) *took part* of flesh and blood, *made in the likeness of men.* The Formed drawn from the Formless truly entered the flesh of the children he came to deliver — real incarnation, not appearance.'),
  ('canon', 'hebrews', 2, 17, 'canon', 'philippians', 2, 8, 'free', E'*And being found in fashion as a man, he humbled himself, and became obedient unto death, even the death of the cross.* (Philippians 2:8). *Wherefore in all things it behoved him to be made like unto his brethren, that he might be a merciful and faithful high priest in things pertaining to Elohim (God), to make reconciliation for the sins of the people* (Hebrews 2:17). Made *like unto his brethren* in all things, *obedient unto death,* the Son became the high priest who makes reconciliation — having *suffered being tempted, he is able to succour them that are tempted* (Hebrews 2:18). The humbling unto death is the qualifying of the merciful priest.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s222_h02_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s222_h02_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-2-what-is-man-the-son-of-adam-crowned-with-glory-psalm-8',
       E'What is man, the son of Adam, crowned with glory — Psalm 8',
       E'The writer reaches for a psalm of wonder and reads it of the Son. *But one in a certain place testified, saying, What is man, that thou art mindful of him? or the son of Adam, that thou visitest him?* (Hebrews 2:6) is Psalm 8 word for word: *What is man, that thou art mindful of him? and the son of Adam, that thou visitest him?* (Psalm 8:4). The psalm marvels that the Most High should be mindful of the *son of Adam* — the seed drawn from the first formed man — and trace his appointed glory: *thou hast made him a little lower than the angels, and hast crowned him with glory and honour* (Psalm 8:5), *thou hast put all things under his feet* (Psalm 8:6). Hebrews takes each line up: *Thou madest him a little lower than the angels; thou crownedst him with glory and honour* (Hebrews 2:7); *Thou hast put all things in subjection under his feet … he left nothing that is not put under him* (Hebrews 2:8). The dominion Adam forfeited is restored and exceeded — yet *now we see not yet all things put under him* (Hebrews 2:8). The resolution is the Person: *But we see Yahusha (Jesus), who was made a little lower than the angels for the suffering of death, crowned with glory and honour; that he by the grace of Elohim (God) should taste death for every man* (Hebrews 2:9). The path of the son of Adam — lowered, then crowned — is walked out in the flesh of the One who tasted death, the Formed who took up the line of Adam to bring many sons unto glory.',
       sv.verse_id, ev.verse_id, 'free', 7907
  FROM _s222_h02_lookup sv, _s222_h02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=2 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=2 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-2-i-will-declare-thy-name-unto-my-brethren-psalm-22',
       E'I will declare thy name unto my brethren — Psalm 22',
       E'The Son is *not ashamed to call them brethren* (Hebrews 2:11), and the writer proves it from the psalm of the forsaken one. *Saying, I will declare thy name unto my brethren, in the midst of the church will I sing praise unto thee* (Hebrews 2:12) is Psalm 22:22 on his lips: *I will declare thy name unto my brethren: in the midst of the congregation will I praise thee* (Psalm 22:22). That psalm opens in the depths — *my Elohim (God), my Elohim (God), why hast thou forsaken me?* (Psalm 22:1) — and turns at its hinge to praise: the One who suffered, who *sanctifieth* those who are *sanctified,* *all of one* (Hebrews 2:11), names the Father''s name among his own and leads their song. And the brethren are named in the psalm''s very next breath: *Ye that fear Yahuah (LORD), praise him; all ye the seed of Jacob, glorify him; and fear him, all ye the seed of Yashar''el (Israel)* (Psalm 22:23). The congregation in whose midst he sings is the seed itself — the gathered children of Jacob and Yashar''el (Israel), called to glorify the One who *hath not despised nor abhorred the affliction of the afflicted* (Psalm 22:24).',
       sv.verse_id, ev.verse_id, 'free', 7908
  FROM _s222_h02_lookup sv, _s222_h02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=2 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=2 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-2-behold-i-and-the-children-which-elohim-hath-given-me-isaiah-8',
       E'Behold I and the children which Elohim hath given me — Isaiah 8',
       E'Twice over Hebrews puts the prophet Isaiah''s words into the mouth of the Son. *And again, I will put my trust in him. And again, Behold I and the children which Elohim (God) hath given me* (Hebrews 2:13) draws on the prophet who waited through the hiding of the Father''s face: *And I will wait upon Yahuah (LORD), that hideth his face from the house of Jacob, and I will look for him* (Isaiah 8:17), and *Behold, I and the children whom Yahuah (LORD) hath given me are for signs and for wonders in Yashar''el (Israel) from Yahuah Tseva''ot (LORD of hosts), which dwelleth in mount Zion* (Isaiah 8:18). The Son who was *made perfect through sufferings* (Hebrews 2:10) speaks the language of dependence — *I will put my trust in him* — the Formed who took flesh trusting the Father through the suffering, looking for him while the face is hidden. And the children are *given* him by that Father; he stands with them, *not ashamed to call them brethren* (Hebrews 2:11), the gathered seed who are for signs and wonders in Yashar''el (Israel). The Christology is exact: the One who trusts and is given children is the Son, who has a Father — not the Father himself, and not a co-equal apart from him.',
       sv.verse_id, ev.verse_id, 'free', 7909
  FROM _s222_h02_lookup sv, _s222_h02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=2 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=2 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-2-flesh-and-blood-the-seed-of-abraham-the-merciful-high-priest',
       E'Flesh and blood, the seed of Abraham, the merciful high priest',
       E'Here the incarnation is named without flinching. *Forasmuch then as the children are partakers of flesh and blood, he also himself likewise took part of the same* (Hebrews 2:14) — the Son truly entered the flesh of those he came to deliver, *that through death he might destroy him that had the power of death, that is, the devil* (Hebrews 2:14), and *deliver them who through fear of death were all their lifetime subject to bondage* (Hebrews 2:15). It is the same descent Paul sang: the One *being in the form of Elohim (God)* (Philippians 2:6) *made himself of no reputation, and took upon him the form of a servant, and was made in the likeness of men* (Philippians 2:7), *and being found in fashion as a man, he humbled himself, and became obedient unto death, even the death of the cross* (Philippians 2:8). And the flesh he took was no generic flesh: *For verily he took not on him the nature of angels; but he took on him the seed of Abraham* (Hebrews 2:16) — the very line Yahuah (LORD) swore to multiply on the mount of the binding, *in blessing I will bless thee, and in multiplying I will multiply thy seed as the stars of the heaven* (Genesis 22:17). Entering the seed of promise from within, *in all things it behoved him to be made like unto his brethren, that he might be a merciful and faithful high priest in things pertaining to Elohim (God), to make reconciliation for the sins of the people* (Hebrews 2:17). The humbling unto death qualifies the priest: *for in that he himself hath suffered being tempted, he is able to succour them that are tempted* (Hebrews 2:18). The Formed who took on real flesh and tasted death has a Father in whose things he ministers as priest — he is not a co-equal second person, nor the Father, but the Son made like his brethren to bring them home.',
       sv.verse_id, ev.verse_id, 'free', 7910
  FROM _s222_h02_lookup sv, _s222_h02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=2 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=2 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: hebrews-2-what-is-man-the-son-of-adam-crowned-with-glory-psalm-8
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 8:4 — *What is man, that thou art mindful of him? and the son of Adam, that thou visitest him?* the very words Hebrews quotes; the wonder of the Most High mindful of the son of Adam (Hebrews 2:6).'
  FROM cross_reference_threads t, cross_references x, _s222_h02_lookup sv, _s222_h02_lookup tv
 WHERE t.slug='hebrews-2-what-is-man-the-son-of-adam-crowned-with-glory-psalm-8'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=2 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=8 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 8:5 — *thou hast made him a little lower than the angels, and hast crowned him with glory and honour* the lowering and crowning read of the Son made lower for the suffering of death (Hebrews 2:7,9).'
  FROM cross_reference_threads t, cross_references x, _s222_h02_lookup sv, _s222_h02_lookup tv
 WHERE t.slug='hebrews-2-what-is-man-the-son-of-adam-crowned-with-glory-psalm-8'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=2 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=8 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 8:6 — *thou hast put all things under his feet* the dominion of the son of Adam restored and exceeded in the crowned Son, though not yet seen in full (Hebrews 2:8).'
  FROM cross_reference_threads t, cross_references x, _s222_h02_lookup sv, _s222_h02_lookup tv
 WHERE t.slug='hebrews-2-what-is-man-the-son-of-adam-crowned-with-glory-psalm-8'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=2 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=8 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hebrews-2-i-will-declare-thy-name-unto-my-brethren-psalm-22
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 22:22 — *I will declare thy name unto my brethren: in the midst of the congregation will I praise thee* the forsaken one''s turn to praise, spoken by the Son not ashamed to call them brethren (Hebrews 2:12).'
  FROM cross_reference_threads t, cross_references x, _s222_h02_lookup sv, _s222_h02_lookup tv
 WHERE t.slug='hebrews-2-i-will-declare-thy-name-unto-my-brethren-psalm-22'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=2 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=22 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 22:23 — *all ye the seed of Jacob, glorify him … all ye the seed of Yashar''el (Israel)* the brethren in whose midst he sings are the gathered seed (Hebrews 2:12).'
  FROM cross_reference_threads t, cross_references x, _s222_h02_lookup sv, _s222_h02_lookup tv
 WHERE t.slug='hebrews-2-i-will-declare-thy-name-unto-my-brethren-psalm-22'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=2 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=22 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hebrews-2-behold-i-and-the-children-which-elohim-hath-given-me-isaiah-8
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 8:17 — *I will wait upon Yahuah (LORD), that hideth his face from the house of Jacob, and I will look for him* the Son''s own trust through the suffering, the Formed who took flesh depending on the Father (Hebrews 2:13).'
  FROM cross_reference_threads t, cross_references x, _s222_h02_lookup sv, _s222_h02_lookup tv
 WHERE t.slug='hebrews-2-behold-i-and-the-children-which-elohim-hath-given-me-isaiah-8'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=2 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=8 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 8:18 — *Behold, I and the children whom Yahuah (LORD) hath given me are for signs and for wonders in Yashar''el (Israel)* the children given the Son by the Father, the gathered seed he calls brethren (Hebrews 2:13).'
  FROM cross_reference_threads t, cross_references x, _s222_h02_lookup sv, _s222_h02_lookup tv
 WHERE t.slug='hebrews-2-behold-i-and-the-children-which-elohim-hath-given-me-isaiah-8'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=2 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=8 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hebrews-2-flesh-and-blood-the-seed-of-abraham-the-merciful-high-priest
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Philippians 2:7 — *took upon him the form of a servant, and was made in the likeness of men* the One in the form of Elohim took part of flesh and blood, real incarnation (Hebrews 2:14).'
  FROM cross_reference_threads t, cross_references x, _s222_h02_lookup sv, _s222_h02_lookup tv
 WHERE t.slug='hebrews-2-flesh-and-blood-the-seed-of-abraham-the-merciful-high-priest'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=2 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 22:17 — *in multiplying I will multiply thy seed as the stars of the heaven* the seed of Abraham sworn on the mount is the seed the Son took on him (Hebrews 2:16).'
  FROM cross_reference_threads t, cross_references x, _s222_h02_lookup sv, _s222_h02_lookup tv
 WHERE t.slug='hebrews-2-flesh-and-blood-the-seed-of-abraham-the-merciful-high-priest'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=2 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Philippians 2:8 — *he humbled himself, and became obedient unto death, even the death of the cross* the humbling unto death qualifies the merciful and faithful high priest (Hebrews 2:17).'
  FROM cross_reference_threads t, cross_references x, _s222_h02_lookup sv, _s222_h02_lookup tv
 WHERE t.slug='hebrews-2-flesh-and-blood-the-seed-of-abraham-the-merciful-high-priest'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=2 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=2 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
