-- ----- fragment: minion_hebrews_06.sql (S222 Hebrews 6) -----
-- =====================================================================
-- S222 minion — HEBREWS 6 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: HEBREWS 6.  Tag: h06 (temp view _s222_h06_lookup).  Sort band: 7935, step 1 (<=7941).
-- Source is ALWAYS the canon Hebrews verse; targets span Tanakh + extra-canonical + NT.
-- Tiers per-row: canon target = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME: Hebrews 6 turns on the solemn warning against falling away after enlightenment
-- (6:4-6) and the ground-bearing-thorns parable (6:7-8). Read in the framework: this is the real
-- peril of covenant-abandonment for the enlightened — faithfulness held to the end, not a
-- once-saved-always-saved prooftext nor cheap grace. *They that through faith and patience inherit
-- the promises* (6:12) is emunah — faith that endures and bears fruit. The ground that *bringeth
-- forth herbs* receives blessing; the ground that *beareth thorns and briers is rejected, and is
-- nigh unto cursing* (6:7-8) — the cursed ground of Eden (Genesis 3:17-18) and the vineyard that
-- yielded wild grapes (Isaiah 5), the same tree-by-fruit test Yahusha (Jesus) gives (Matthew 7:19).
-- The better things turn on the oath to Abraham (6:13-15 / Genesis 22:16-17), the two immutable
-- things, the hope as *an anchor of the soul* entering *within the veil* where the forerunner has
-- gone (6:19-20), the *high priest for ever after the order of Melek Tsadiq (Melchizedek)* (6:20 /
-- Psalm 110:4), which Hebrews itself re-walks at 5:6 and 7:17.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-3   leaving first principles, going on unto perfection; baptisms, laying on of hands, resurrection, judgment
--           Tanakh: none warranted  Extras: none warranted  NT: none warranted (catechetical list, no single load-bearing pull)
--   v.4-6   the falling-away warning; crucify the Son afresh
--           Tanakh: none warranted  Extras: none warranted  NT: Hebrews 10:26-27 (sin wilfully, no more sacrifice — Heb-internal re-walk of the same peril)
--   v.7-8   the ground bearing herbs vs thorns; nigh unto cursing, end to be burned
--           Tanakh: Genesis 3:17 + 3:18 (cursed ground, thorns), Isaiah 5:7 (vineyard yielded wild grapes)  Extras: none warranted  NT: Matthew 7:19 (every tree not bearing good fruit hewn down and cast into fire)
--   v.9-12  better things; Elohim not unrighteous to forget your work and labour of love; through faith and patience inherit the promises
--           Tanakh: none warranted  Extras: none warranted  NT: none warranted (woven into v.13-15 endurance prose)
--   v.13-15 the oath to Abraham, surely blessing I will bless thee; patiently endured, obtained the promise
--           Tanakh: Genesis 22:16 + 22:17 (the oath at the binding)  Extras: none warranted (clean witness preferred; Jasher/Jubilees parallels carry editorial framing)  NT: none warranted
--   v.16-18 men swear by the greater; two immutable things; impossible for Elohim to lie; strong consolation
--           Tanakh: none warranted (carried at v.13-15)  Extras: none warranted  NT: none warranted
--   v.19-20 the hope as an anchor of the soul, within the veil; the forerunner entered, high priest for ever after the order of Melek Tsadiq
--           Tanakh: Psalm 110:4 (priest for ever after the order of Melek Tsadiq)  Extras: none warranted  NT: Hebrews 9:24 (entered heaven itself for us), Hebrews 5:6 + 7:17 (Heb-internal re-walk of Psalm 110:4)
--
-- THREADS (slug -> target libraries):
--   7935 hebrews-6-the-ground-that-beareth-thorns-is-nigh-unto-cursing                       (Tanakh + NT)
--   7936 hebrews-6-surely-blessing-i-will-bless-thee-the-oath-to-abraham-genesis-22          (Tanakh)
--   7937 hebrews-6-an-anchor-of-the-soul-within-the-veil-whither-the-forerunner-entered      (NT)
--   7938 hebrews-6-an-high-priest-for-ever-after-the-order-of-melchizedek-psalm-110          (Tanakh + NT)
-- =====================================================================

CREATE TEMP VIEW _s222_h06_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: hebrews-6-the-ground-that-beareth-thorns-is-nigh-unto-cursing
  ('canon', 'hebrews', 6, 8, 'canon', 'genesis', 3, 17, 'free', E'*And unto Adam he said, Because thou hast hearkened unto the voice of thy wife, and hast eaten of the tree, of which I commanded thee, saying, Thou shalt not eat of it: cursed is the ground for thy sake; in sorrow shalt thou eat of it all the days of thy life;* (Genesis 3:17). The ground that *beareth thorns and briers is rejected, and is nigh unto cursing; whose end is to be burned* (Hebrews 6:8). The writer reaches straight back to the garden: the curse that bound the ground to thorn was spoken over disobedience, *cursed is the ground for thy sake.* The enlightened soul that bears no fruit after the rain of the heavenly gift stands under that same sentence — not blessed earth, but cursed ground.'),
  ('canon', 'hebrews', 6, 8, 'canon', 'genesis', 3, 18, 'free', E'*Thorns also and thistles shall it bring forth to thee; and thou shalt eat the herb of the field;* (Genesis 3:18). Hebrews sets the herb-bearing ground that *receiveth blessing from Elohim (God)* (6:7) against the ground that *beareth thorns and briers* (6:8) — the very thorns and thistles the cursed ground brought forth after the fall. The same rain falls on both grounds; what each yields reveals what it is. The thorn-bearer is *nigh unto cursing,* the fruit of a heart that drank the rain and rendered nothing back.'),
  ('canon', 'hebrews', 6, 8, 'canon', 'isaiah', 5, 7, 'free', E'*For the vineyard of Yahuah Tseva''ot (LORD of hosts) is the house of Yashar''el (Israel), and the men of Yahudah (Judah) his pleasant plant: and he looked for judgment, but behold oppression; for righteousness, but behold a cry.* (Isaiah 5:7). The prophet sang of the vineyard tended with every care that yet *brought forth wild grapes,* and named it the house of Yashar''el (Israel). Hebrews presses the same picture onto the enlightened who fall away: ground watered by the rain that *bringeth forth herbs* is blessed; ground that returns thorns is *rejected, and is nigh unto cursing* (Hebrews 6:8). The tending was not in question; the fruit was.'),
  ('canon', 'hebrews', 6, 8, 'canon', 'matthew', 7, 19, 'free', E'*Every tree that bringeth not forth good fruit is hewn down, and cast into the fire.* (Matthew 7:19). The ground that *beareth thorns and briers* has an end: *whose end is to be burned* (Hebrews 6:8). Yahusha (Jesus) gave the same verdict — the test is the fruit, and the tree that bears none is hewn down and *cast into the fire.* This is the peril Hebrews names for the enlightened: not a snatched-away security, but the real possibility that one who tasted the heavenly gift bears thorns and comes to the fire.'),
  -- thread: hebrews-6-surely-blessing-i-will-bless-thee-the-oath-to-abraham-genesis-22
  ('canon', 'hebrews', 6, 14, 'canon', 'genesis', 22, 16, 'free', E'*And said, By myself have I sworn, saith Yahuah (LORD), for because thou hast done this thing, and hast not withheld thy son, thine only son:* (Genesis 22:16). *When Elohim (God) made promise to Abraham, because he could swear by no greater, he sware by himself* (Hebrews 6:13). The writer quotes the oath sworn at the binding on the mountain: *By myself have I sworn.* There is none greater for Yahuah (LORD) to swear by, so he swears by himself — the immutable ground of the promise, given because Abraham *hast not withheld thy son.*'),
  ('canon', 'hebrews', 6, 14, 'canon', 'genesis', 22, 17, 'free', E'*That in blessing I will bless thee, and in multiplying I will multiply thy seed as the stars of the heaven, and as the sand which is upon the sea shore; and thy seed shall possess the gate of his enemies;* (Genesis 22:17). Hebrews quotes the oath nearly word for word: *Surely blessing I will bless thee, and multiplying I will multiply thee* (Hebrews 6:14). The promise sworn at the binding is the seed multiplied as the stars and the sand — the covenant lineage of the twelve tribes carried forward. *And so, after he had patiently endured, he obtained the promise* (6:15): the oath is sure, and the heir inherits it through the same faith and patience.'),
  -- thread: hebrews-6-an-anchor-of-the-soul-within-the-veil-whither-the-forerunner-entered
  ('canon', 'hebrews', 6, 20, 'canon', 'hebrews', 9, 24, 'free', E'*For Messiah (Christ) is not entered into the holy places made with hands, which are the figures of the true; but into heaven itself, now to appear in the presence of Elohim (God) for us:* (Hebrews 9:24). The hope is *an anchor of the soul, both sure and stedfast, and which entereth into that within the veil; whither the forerunner is for us entered, even Yahusha (Jesus)* (Hebrews 6:19-20). What *within the veil* means the writer says plainly a few chapters on: not the earthly holy place but *heaven itself,* where the forerunner appears *in the presence of Elohim (God) for us.* The anchor of the soul is fixed not in this world but in the heavenly sanctuary where Yahusha has already gone in.'),
  -- thread: hebrews-6-an-high-priest-for-ever-after-the-order-of-melchizedek-psalm-110
  ('canon', 'hebrews', 6, 20, 'canon', 'psalms', 110, 4, 'free', E'*Yahuah (LORD) hath sworn, and will not repent, Thou art a priest for ever after the order of Melek Tsadiq (Melchizedek).* (Psalm 110:4). The forerunner entered within the veil, *made an high priest for ever after the order of Melek Tsadiq (Melchizedek)* (Hebrews 6:20). The writer is quoting the psalm''s oath directly — and the oath stands alongside the oath to Abraham earlier in the chapter, for *Yahuah (LORD) hath sworn, and will not repent.* The priesthood after the order of Melek Tsadiq is not Levitical and not temporary; it is sworn by oath, *for ever,* the eternal priest-king the psalm foretold.'),
  ('canon', 'hebrews', 6, 20, 'canon', 'hebrews', 5, 6, 'free', E'*As he saith also in another place, Thou art a priest for ever after the order of Melek Tsadiq (Melchizedek).* (Hebrews 5:6). The same psalm-oath the writer cited at the close of chapter five he sounds again here: the forerunner *made an high priest for ever after the order of Melek Tsadiq (Melchizedek)* (Hebrews 6:20). Hebrews keeps returning to the one text, building toward the full exposition of the Melek Tsadiq priesthood — the priest-king who arises not by carnal descent but by the power of an endless life.'),
  ('canon', 'hebrews', 6, 20, 'canon', 'hebrews', 7, 17, 'free', E'*For he testifieth, Thou art a priest for ever after the order of Melek Tsadiq (Melchizedek).* (Hebrews 7:17). The high priest *for ever after the order of Melek Tsadiq (Melchizedek)* named at 6:20 is the thread the writer takes up fully in chapter seven: *For he testifieth, Thou art a priest for ever after the order of Melek Tsadiq (Melchizedek).* The forerunner who entered within the veil and the eternal priest expounded from Genesis 14 and Psalm 110 are one — the same Yahusha (Jesus), priest by oath and *for ever.*')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s222_h06_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s222_h06_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-6-the-ground-that-beareth-thorns-is-nigh-unto-cursing',
       E'The ground that beareth thorns is nigh unto cursing',
       E'After the solemn warning against falling away — that it is *impossible for those who were once enlightened, and have tasted of the heavenly gift … if they shall fall away, to renew them again unto repentance* (Hebrews 6:4-6) — the writer draws a parable from the soil. *For the earth which drinketh in the rain that cometh oft upon it, and bringeth forth herbs meet for them by whom it is dressed, receiveth blessing from Elohim (God): but that which beareth thorns and briers is rejected, and is nigh unto cursing; whose end is to be burned* (Hebrews 6:7-8). The same rain falls on both grounds; the fruit reveals what each one is. This is not a once-saved-always-saved security and it is not cheap grace — it is the real peril of covenant-abandonment for the enlightened, faithfulness tested by what it bears. The picture reaches straight back to Eden, where the curse first bound the ground to thorn: *cursed is the ground for thy sake; in sorrow shalt thou eat of it all the days of thy life* (Genesis 3:17), *thorns also and thistles shall it bring forth to thee* (Genesis 3:18). The prophet sang the same warning over the covenant people themselves — a vineyard tended with every care that yet yielded wild grapes: *For the vineyard of Yahuah Tseva''ot (LORD of hosts) is the house of Yashar''el (Israel), and the men of Yahudah (Judah) his pleasant plant: and he looked for judgment, but behold oppression* (Isaiah 5:7). And Yahusha (Jesus) gave the verdict in plainest words: *Every tree that bringeth not forth good fruit is hewn down, and cast into the fire* (Matthew 7:19). The tending was never in question. The fruit was. The thorn-bearer comes to the fire.',
       sv.verse_id, ev.verse_id, 'free', 7935
  FROM _s222_h06_lookup sv, _s222_h06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=6 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=6 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-6-surely-blessing-i-will-bless-thee-the-oath-to-abraham-genesis-22',
       E'Surely blessing I will bless thee — the oath to Abraham',
       E'Against the slothful and the fallen the writer sets *them who through faith and patience inherit the promises* (Hebrews 6:12), and the great pattern is Abraham. *For when Elohim (God) made promise to Abraham, because he could swear by no greater, he sware by himself, saying, Surely blessing I will bless thee, and multiplying I will multiply thee* (Hebrews 6:13-14). The words are quoted from the oath sworn on the mountain at the binding of Isaac, after Abraham had not withheld his son: *By myself have I sworn, saith Yahuah (LORD), for because thou hast done this thing, and hast not withheld thy son, thine only son: that in blessing I will bless thee, and in multiplying I will multiply thy seed as the stars of the heaven, and as the sand which is upon the sea shore* (Genesis 22:16-17). There is none greater for Yahuah (LORD) to swear by, so he swears by himself — the promise made immutable. The seed multiplied as the stars and the sand is the covenant lineage carried forward through the twelve tribes, not a metaphor for any who believe. *And so, after he had patiently endured, he obtained the promise* (Hebrews 6:15): the oath is sure, and the heir inherits it through the same faith that endures and obeys — emunah that does not let go.',
       sv.verse_id, ev.verse_id, 'free', 7936
  FROM _s222_h06_lookup sv, _s222_h06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=6 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=6 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-6-an-anchor-of-the-soul-within-the-veil-whither-the-forerunner-entered',
       E'An anchor of the soul within the veil, whither the forerunner entered',
       E'By the oath and the promise — *two immutable things, in which it was impossible for Elohim (God) to lie* (Hebrews 6:18) — the heirs have a strong consolation, and the writer names its fixity: *which hope we have as an anchor of the soul, both sure and stedfast, and which entereth into that within the veil; whither the forerunner is for us entered, even Yahusha (Jesus)* (Hebrews 6:19-20). The anchor does not hold to anything in this world; it reaches *within the veil,* into the inner sanctuary itself, where Yahusha has already gone as the forerunner who opens the way. What that veil hides the writer says plainly a few chapters on: *For Messiah (Christ) is not entered into the holy places made with hands, which are the figures of the true; but into heaven itself, now to appear in the presence of Elohim (God) for us* (Hebrews 9:24). The earthly holy place was the figure; the true is heaven, and there the Formed-one who took on flesh stands in the presence of the Father on behalf of his own. The soul''s anchor is fixed in the heavenly sanctuary where the forerunner has already entered in.',
       sv.verse_id, ev.verse_id, 'free', 7937
  FROM _s222_h06_lookup sv, _s222_h06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=6 AND sv.verse_number=19
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=6 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-6-an-high-priest-for-ever-after-the-order-of-melchizedek-psalm-110',
       E'An high priest for ever after the order of Melek Tsadiq (Melchizedek)',
       E'The chapter closes on the title that governs the whole epistle: the forerunner entered within the veil, *made an high priest for ever after the order of Melek Tsadiq (Melchizedek)* (Hebrews 6:20). The words are the oath of the psalm, quoted directly: *Yahuah (LORD) hath sworn, and will not repent, Thou art a priest for ever after the order of Melek Tsadiq (Melchizedek)* (Psalm 110:4). The oath stands beside the oath to Abraham earlier in the same chapter — Yahuah (LORD) swearing and not repenting, the immutable word made the ground of the priesthood. This is not the Levitical priesthood, bound by carnal descent and ended by death; it is the priesthood of the priest-king of Salem, eternal and sworn by oath, *for ever.* Hebrews keeps returning to this one text: at the close of chapter five — *As he saith also in another place, Thou art a priest for ever after the order of Melek Tsadiq (Melchizedek)* (Hebrews 5:6) — and again in the full exposition of chapter seven — *For he testifieth, Thou art a priest for ever after the order of Melek Tsadiq (Melchizedek)* (Hebrews 7:17). The forerunner who entered the heavenly sanctuary and the eternal priest the psalm foretold are one: the same Yahusha (Jesus), priest by oath and for ever.',
       sv.verse_id, ev.verse_id, 'free', 7938
  FROM _s222_h06_lookup sv, _s222_h06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=6 AND sv.verse_number=20
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=6 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: hebrews-6-the-ground-that-beareth-thorns-is-nigh-unto-cursing
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:17 — *cursed is the ground for thy sake; in sorrow shalt thou eat of it* the Eden curse that bound the ground to thorn is the sentence over the thorn-bearing soul (Hebrews 6:8).'
  FROM cross_reference_threads t, cross_references x, _s222_h06_lookup sv, _s222_h06_lookup tv
 WHERE t.slug='hebrews-6-the-ground-that-beareth-thorns-is-nigh-unto-cursing'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=6 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:18 — *thorns also and thistles shall it bring forth to thee* the thorns the cursed ground brings forth are what the unfruitful heart returns for the rain it drank (Hebrews 6:8).'
  FROM cross_reference_threads t, cross_references x, _s222_h06_lookup sv, _s222_h06_lookup tv
 WHERE t.slug='hebrews-6-the-ground-that-beareth-thorns-is-nigh-unto-cursing'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=6 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 5:7 — *the vineyard of Yahuah Tseva''ot (LORD of hosts) is the house of Yashar''el (Israel)* the tended vineyard that yielded wild grapes is the same warning to the covenant people (Hebrews 6:8).'
  FROM cross_reference_threads t, cross_references x, _s222_h06_lookup sv, _s222_h06_lookup tv
 WHERE t.slug='hebrews-6-the-ground-that-beareth-thorns-is-nigh-unto-cursing'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=6 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=5 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 7:19 — *Every tree that bringeth not forth good fruit is hewn down, and cast into the fire* Yahusha''s (Jesus''s) verdict: the fruitless tree comes to the fire, the end of the thorn-bearing ground (Hebrews 6:8).'
  FROM cross_reference_threads t, cross_references x, _s222_h06_lookup sv, _s222_h06_lookup tv
 WHERE t.slug='hebrews-6-the-ground-that-beareth-thorns-is-nigh-unto-cursing'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=6 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hebrews-6-surely-blessing-i-will-bless-thee-the-oath-to-abraham-genesis-22
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 22:16 — *By myself have I sworn, saith Yahuah (LORD) … thou hast not withheld thy son* the oath at the binding: Yahuah swears by himself because there is none greater (Hebrews 6:13).'
  FROM cross_reference_threads t, cross_references x, _s222_h06_lookup sv, _s222_h06_lookup tv
 WHERE t.slug='hebrews-6-surely-blessing-i-will-bless-thee-the-oath-to-abraham-genesis-22'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=6 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 22:17 — *in blessing I will bless thee, and in multiplying I will multiply thy seed as the stars of the heaven* the oath Hebrews quotes; the seed-promise carried through the twelve tribes (Hebrews 6:14).'
  FROM cross_reference_threads t, cross_references x, _s222_h06_lookup sv, _s222_h06_lookup tv
 WHERE t.slug='hebrews-6-surely-blessing-i-will-bless-thee-the-oath-to-abraham-genesis-22'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=6 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hebrews-6-an-anchor-of-the-soul-within-the-veil-whither-the-forerunner-entered
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hebrews 9:24 — *but into heaven itself, now to appear in the presence of Elohim (God) for us* what is within the veil is heaven itself, where the forerunner appears for us (Hebrews 6:19-20).'
  FROM cross_reference_threads t, cross_references x, _s222_h06_lookup sv, _s222_h06_lookup tv
 WHERE t.slug='hebrews-6-an-anchor-of-the-soul-within-the-veil-whither-the-forerunner-entered'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=6 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=9 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hebrews-6-an-high-priest-for-ever-after-the-order-of-melchizedek-psalm-110
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 110:4 — *Yahuah (LORD) hath sworn, and will not repent, Thou art a priest for ever after the order of Melek Tsadiq (Melchizedek)* the psalm-oath Hebrews quotes; the priesthood sworn for ever (Hebrews 6:20).'
  FROM cross_reference_threads t, cross_references x, _s222_h06_lookup sv, _s222_h06_lookup tv
 WHERE t.slug='hebrews-6-an-high-priest-for-ever-after-the-order-of-melchizedek-psalm-110'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=6 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=110 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 5:6 — *As he saith also in another place, Thou art a priest for ever after the order of Melek Tsadiq (Melchizedek)* the same psalm-oath sounded at the close of chapter five (Hebrews 6:20).'
  FROM cross_reference_threads t, cross_references x, _s222_h06_lookup sv, _s222_h06_lookup tv
 WHERE t.slug='hebrews-6-an-high-priest-for-ever-after-the-order-of-melchizedek-psalm-110'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=6 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=5 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 7:17 — *For he testifieth, Thou art a priest for ever after the order of Melek Tsadiq (Melchizedek)* the title taken up in the full exposition of chapter seven (Hebrews 6:20).'
  FROM cross_reference_threads t, cross_references x, _s222_h06_lookup sv, _s222_h06_lookup tv
 WHERE t.slug='hebrews-6-an-high-priest-for-ever-after-the-order-of-melchizedek-psalm-110'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=6 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=7 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
