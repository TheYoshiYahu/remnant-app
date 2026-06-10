-- ----- fragment: minion_hebrews_07.sql (S222 Hebrews 7) -----
-- =====================================================================
-- S222 minion — HEBREWS 7 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: HEBREWS 7 (the Melek Tsadiq chapter).  Tag: h07 (temp view _s222_h07_lookup).
-- Sort band: floor 7942, ceiling 7949, step 1 (7942..7945 used).
-- Source is ALWAYS the canon Hebrews verse; targets span Tanakh + extra-canonical + NT.
-- Tiers per-row: canon target = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (HIGH CARE — Red Lines #4/#5/#7; the priesthood-change watchpoint):
-- Hebrews 7 does NOT abolish the Torah. It announces the change of the PRIESTLY administration
-- — which tribe may serve, the requirement of Levitical/Aaronic carnal descent — because the
-- priest now arises out of Yahudah (Judah) after the order of Melek Tsadiq (Melchizedek). When
-- 7:12 says *the priesthood being changed, there is made of necessity a change also of the law,*
-- the law in view is the ordinance regulating the priesthood and the altar (7:13-14, *of which
-- tribe Moses spake nothing concerning priesthood*), NOT the moral Torah, the Sabbath, the
-- feasts, or the dietary law. The *commandment going before* that is *disannulled* (7:18) is the
-- specific *law of a carnal commandment* (7:16) establishing the Aaronic line by descent; the
-- *better hope* (7:19) is *brought in* and by it *we draw nigh unto Elohim (God).* The eternal
-- priest is confirmed by the oath (*Yahuah (Lord) sware and will not repent,* 7:21 / Psalm 110:4),
-- *ever liveth to make intercession* (7:25), is *holy, harmless, undefiled, separate from
-- sinners* (7:26), and offered *once, when he offered up himself* (7:27). Christology: Yahusha
-- is the Formed priest-king, *made like unto the Son of Elohim (God)* (7:3), who has a Father and
-- is *consecrated for evermore* by the word of the oath (7:28). The default trained reading —
-- "Hebrews 7 does away with the old priesthood and its law" as license against the Torah — is the
-- replacement reading and is held out.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-3   Melek Tsadiq, king of Salem, priest of El Elyon, blessed Abraham, tithes of all
--           Tanakh: Genesis 14:18 (priest of El Elyon, bread and wine), 14:19 (blessed Abram),
--                   14:20 (gave him tithes of all)  Extras: Jasher 16:11 (king of Jerusalem,
--                   bread and wine), Jasher 16:12 (blessed Abram, gave a tenth, priest before
--                   Elohim)  NT: none added (Hebrews 5:6,10 carried in prose; same hand)
--   v.4-10  Abraham (and Levi in his loins) paid tithes to the greater priest
--           Tanakh: Genesis 14:20 (carried at v.1-3)  Extras: Jasher 16:12 (carried at v.1-3)
--           NT: none warranted
--   v.11-19 the priesthood changed → a change of the (priestly/altar) law; priest from Judah;
--           the disannulling of the carnal commandment; the better hope brings us nigh
--           Tanakh: Psalm 110:4 (a priest for ever after the order of Melek Tsadiq, the oath),
--                   Zechariah 6:12 (the BRANCH grows out of his place), Zechariah 6:13 (a priest
--                   upon his throne, the counsel of peace) — the priest-king from outside the
--                   Aaronic line  Extras: none warranted  NT: none warranted
--   v.20-25 the oath that the Levitical priests never had; surety of a better testament;
--           unchangeable priesthood; ever liveth to make intercession; able to save to the uttermost
--           Tanakh: Psalm 110:4 (the oath, *Yahuah sware and will not repent*), Psalm 110:1 (sit
--                   at my right hand)  Extras: none warranted  NT: none warranted
--   v.26-28 holy, harmless, undefiled, separate from sinners; offered once, himself; the Son
--           consecrated for evermore by the word of the oath
--           Tanakh: Psalm 110:4 (the word of the oath that maketh the Son)  Extras: none warranted
--           NT: none warranted (the once-for-all offering re-walked at Hebrews 9-10; same hand)
--
-- THREADS (slug -> target libraries):
--   7942 hebrews-7-melchizedek-king-of-salem-priest-of-el-elyon-blessed-abraham-genesis-14   (Tanakh + Extras)
--   7943 hebrews-7-the-priesthood-changed-a-priest-from-judah-after-the-order-of-melchizedek  (Tanakh)
--   7944 hebrews-7-yahuah-sware-and-will-not-repent-the-oath-and-the-better-testament-psalm-110 (Tanakh)
--   7945 hebrews-7-holy-harmless-undefiled-who-offered-up-himself-once                          (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s222_h07_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: hebrews-7-melchizedek-king-of-salem-priest-of-el-elyon-blessed-abraham-genesis-14
  ('canon', 'hebrews', 7, 1, 'canon', 'genesis', 14, 18, 'free', E'*And Melek Tsadiq (Melchizedek) king of Salem brought forth bread and wine: and he was the priest of the El Elyon (most high God).* (Genesis 14:18). The whole argument of the chapter rests on this one verse. *For this Melek Tsadiq (Melchizedek), king of Salem, priest of the El Elyon (most high God), who met Abraham returning from the slaughter of the kings, and blessed him* (Hebrews 7:1). The writer is reading Genesis word by word: the king of Salem, the priest of the El Elyon — a priesthood older than Aaron, older than Levi, standing before Yahuah (LORD) when Abraham was still a wanderer in the land.'),
  ('canon', 'hebrews', 7, 1, 'canon', 'genesis', 14, 19, 'free', E'*And he blessed him, and said, Blessed be Abram of the El Elyon (most high God), possessor of heaven and earth* (Genesis 14:19). *Who met Abraham returning from the slaughter of the kings, and blessed him* (Hebrews 7:1). The blessing flows downward, from the greater to the lesser — *and without all contradiction the less is blessed of the better* (Hebrews 7:7). Abraham, the father of the faithful and the bearer of the promises, bows to receive a blessing from the priest of the El Elyon.'),
  ('canon', 'hebrews', 7, 2, 'canon', 'genesis', 14, 20, 'free', E'*And blessed be the El Elyon (most high God), which hath delivered thine enemies into thy hand. And he gave him tithes of all.* (Genesis 14:20). *To whom also Abraham gave a tenth part of all* (Hebrews 7:2). The patriarch himself paid the tithe to this priest — *first being by interpretation King of righteousness, and after that also King of Salem, which is, King of peace* (Hebrews 7:2). The king of righteousness and the king of peace receives the tenth from the man who held the promises, marking him the greater priest.'),
  ('canon', 'hebrews', 7, 1, 'jasher', 'jasher', 16, 11, 'extras', E'*And Adonizedek king of Jerusalem, the same was Shem, went out with his men to meet Abram and his people, with bread and wine, and they remained together in the valley of Melech.* (Jasher 16:11). The Hebrew library remembers the same meeting Hebrews builds upon: the king of Salem — Jerusalem — coming out with bread and wine to the returning Abram. *For this Melek Tsadiq (Melchizedek), king of Salem... who met Abraham returning from the slaughter of the kings, and blessed him* (Hebrews 7:1). The encounter at the king''s dale is no allegory; it stands witnessed in the record of the patriarchs.'),
  ('canon', 'hebrews', 7, 2, 'jasher', 'jasher', 16, 12, 'extras', E'*And Adonizedek blessed Abram, and Abram gave him a tenth from all that he had brought from the spoil of his enemies, for Adonizedek was a priest before Elohim (God).* (Jasher 16:12). *To whom also Abraham gave a tenth part of all* (Hebrews 7:2). The Hebrew record names the very thing the writer of Hebrews presses: this king of Salem *was a priest before Elohim (God),* and Abraham gave him the tenth. The priesthood that stands before Yahuah (LORD) is older than the sons of Levi, and Abraham himself acknowledged it.'),
  -- thread: hebrews-7-the-priesthood-changed-a-priest-from-judah-after-the-order-of-melchizedek
  ('canon', 'hebrews', 7, 17, 'canon', 'psalms', 110, 4, 'free', E'*Yahuah (LORD) hath sworn, and will not repent, Thou art a priest for ever after the order of Melek Tsadiq (Melchizedek).* (Psalm 110:4). *For he testifieth, Thou art a priest for ever after the order of Melek Tsadiq (Melchizedek)* (Hebrews 7:17). The whole change turns on this sworn word. Because the promised priest rises *after the order of Melek Tsadiq (Melchizedek)* and not *after the order of Aaron* (Hebrews 7:11), the ordinance that bound the priesthood to the sons of Levi gives way — the priestly administration changes, not the righteous instruction of Yahuah (LORD).'),
  ('canon', 'hebrews', 7, 14, 'canon', 'zechariah', 6, 12, 'free', E'*And speak unto him, saying, Thus speaketh Yahuah Tseva''ot (LORD of hosts), saying, Behold the man whose name is The BRANCH; and he shall grow up out of his place, and he shall build the temple of Yahuah (LORD)* (Zechariah 6:12). *For it is evident that our Lord sprang out of Juda; of which tribe Moses spake nothing concerning priesthood* (Hebrews 7:14). The prophet had already seen a priest who would not come of Aaron''s line — the BRANCH who *shall grow up out of his place,* the kingly stock of Yahudah (Judah), arising to build the house of Yahuah (LORD). The priest from Judah was no contradiction of the prophets but their fulfilment.'),
  ('canon', 'hebrews', 7, 15, 'canon', 'zechariah', 6, 13, 'free', E'*Even he shall build the temple of Yahuah (LORD); and he shall bear the glory, and shall sit and rule upon his throne; and he shall be a priest upon his throne: and the counsel of peace shall be between them both.* (Zechariah 6:13). *And it is yet far more evident: for that after the similitude of Melek Tsadiq (Melchizedek) there ariseth another priest* (Hebrews 7:15). The prophet joined the two offices the Aaronic order kept apart: a king who is *a priest upon his throne.* This is the order of Melek Tsadiq (Melchizedek) himself — king of Salem and priest of the El Elyon at once — the priest-king in whom *the counsel of peace* is established.'),
  -- thread: hebrews-7-yahuah-sware-and-will-not-repent-the-oath-and-the-better-testament-psalm-110
  ('canon', 'hebrews', 7, 21, 'canon', 'psalms', 110, 4, 'free', E'*Yahuah (LORD) hath sworn, and will not repent, Thou art a priest for ever after the order of Melek Tsadiq (Melchizedek).* (Psalm 110:4). *But this with an oath by him that said unto him, Yahuah (Lord) sware and will not repent, Thou art a priest for ever after the order of Melek Tsadiq (Melchizedek)* (Hebrews 7:21). The Levitical priests were made without an oath; this priest is established by the sworn word of Yahuah (LORD) himself — a word that *will not repent.* The oath is what makes the testament better and sure: *by so much was Yahusha (Jesus) made a surety of a better testament* (Hebrews 7:22).'),
  ('canon', 'hebrews', 7, 25, 'canon', 'psalms', 110, 1, 'free', E'*Yahuah (LORD) said unto my Lord, Sit thou at my right hand, until I make thine enemies thy footstool.* (Psalm 110:1). *Wherefore he is able also to save them to the uttermost that come unto Elohim (God) by him, seeing he ever liveth to make intercession for them* (Hebrews 7:25). The same psalm that swore the eternal priesthood seated this Lord at the right hand of Yahuah (LORD). Enthroned and undying, he *ever liveth* — and from that throne he makes intercession, able to save to the uttermost all who come to Elohim (God) through him.'),
  -- thread: hebrews-7-holy-harmless-undefiled-who-offered-up-himself-once
  ('canon', 'hebrews', 7, 28, 'canon', 'psalms', 110, 4, 'free', E'*Yahuah (LORD) hath sworn, and will not repent, Thou art a priest for ever after the order of Melek Tsadiq (Melchizedek).* (Psalm 110:4). *For the law maketh men high priests which have infirmity; but the word of the oath, which was since the law, maketh the Son, who is consecrated for evermore* (Hebrews 7:28). The contrast is between men of infirmity made priests by ordinance, and the Son made priest by the sworn word — *the word of the oath.* That word *consecrates* him *for evermore,* the priest who needs no succession because he does not die.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s222_h07_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s222_h07_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-7-melchizedek-king-of-salem-priest-of-el-elyon-blessed-abraham-genesis-14',
       E'Melek Tsadiq (Melchizedek), king of Salem, priest of the El Elyon — Genesis 14',
       E'The chapter is built on a single passage of Genesis, read word by word. *And Melek Tsadiq (Melchizedek) king of Salem brought forth bread and wine: and he was the priest of the El Elyon (most high God)* (Genesis 14:18). *And he blessed him, and said, Blessed be Abram of the El Elyon (most high God), possessor of heaven and earth* (Genesis 14:19). *And he gave him tithes of all* (Genesis 14:20). The writer of Hebrews takes up each line: *For this Melek Tsadiq (Melchizedek), king of Salem, priest of the El Elyon (most high God), who met Abraham returning from the slaughter of the kings, and blessed him; to whom also Abraham gave a tenth part of all; first being by interpretation King of righteousness, and after that also King of Salem, which is, King of peace* (Hebrews 7:1-2). The point is the greatness of this priest. He stands *without father, without mother, without descent, having neither beginning of days, nor end of life; but made like unto the Son of Elohim (God); abideth a priest continually* (Hebrews 7:3) — the priest-king pattern in whom the eternal priest after the order of Melek Tsadiq (Melchizedek) is foreshown, the Formed one who has a Father and abides continually. And the proof of his greatness is that Abraham himself, who held the promises, paid him the tenth and received his blessing: *and without all contradiction the less is blessed of the better* (Hebrews 7:7). Even Levi, *yet in the loins of his father, when Melek Tsadiq (Melchizedek) met him* (Hebrews 7:10), paid tithes through Abraham — the Aaronic order acknowledging a priesthood older and greater than its own. The Hebrew library remembers the same meeting: *And Adonizedek king of Jerusalem... went out with his men to meet Abram and his people, with bread and wine... And Adonizedek blessed Abram, and Abram gave him a tenth from all... for Adonizedek was a priest before Elohim (God)* (Jasher 16:11-12). The encounter at the king''s dale is no allegory; it stands witnessed, and on it the whole argument of the eternal priesthood is raised.',
       sv.verse_id, ev.verse_id, 'extras', 7942
  FROM _s222_h07_lookup sv, _s222_h07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=7 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=7 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-7-the-priesthood-changed-a-priest-from-judah-after-the-order-of-melchizedek',
       E'The priesthood changed — a priest from Judah after the order of Melek Tsadiq (Melchizedek)',
       E'This is the verse the inherited reading turns into a weapon against the Torah, and the turning misreads what is being changed. *For the priesthood being changed, there is made of necessity a change also of the law* (Hebrews 7:12). Read the next breath, and the writer himself tells which law: *For he of whom these things are spoken pertaineth to another tribe, of which no man gave attendance at the altar. For it is evident that our Lord sprang out of Juda; of which tribe Moses spake nothing concerning priesthood* (Hebrews 7:13-14). The law that changes is the ordinance regulating who may serve at the altar — the requirement of Aaronic, Levitical descent — for the promised priest arises out of Yahudah (Judah), *after the order of Melek Tsadiq (Melchizedek), and not... after the order of Aaron* (Hebrews 7:11). He *is made, not after the law of a carnal commandment, but after the power of an endless life* (Hebrews 7:16); and *there is verily a disannulling of the commandment going before for the weakness and unprofitableness thereof. For the law made nothing perfect, but the bringing in of a better hope did; by the which we draw nigh unto Elohim (God)* (Hebrews 7:18-19). The *commandment going before* that is set aside is the carnal-descent ordinance establishing the Aaronic line; the priestly system that *could make nothing perfect* on its own gives way to the priest who can — the moral instruction of Yahuah (LORD), his Sabbath, his feasts, his ways, stand untouched. And the prophets had already seen it: the sworn word, *Thou art a priest for ever after the order of Melek Tsadiq (Melchizedek)* (Psalm 110:4), and Zechariah''s vision of a priest not of Aaron''s line — *Behold the man whose name is The BRANCH; and he shall grow up out of his place* (Zechariah 6:12), who *shall sit and rule upon his throne; and he shall be a priest upon his throne: and the counsel of peace shall be between them both* (Zechariah 6:13). The two offices Aaron''s order kept apart — king and priest — are joined in the order of Melek Tsadiq (Melchizedek), exactly as Genesis named him king of Salem and priest of the El Elyon at once. The administration changes; the better hope is brought in; we draw nigh.',
       sv.verse_id, ev.verse_id, 'free', 7943
  FROM _s222_h07_lookup sv, _s222_h07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=7 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=7 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-7-yahuah-sware-and-will-not-repent-the-oath-and-the-better-testament-psalm-110',
       E'Yahuah (LORD) sware and will not repent — the oath and the better testament (Psalm 110)',
       E'The Levitical priests held their office by ordinance and by birth; this priest holds his by the sworn word of Yahuah (LORD). *And inasmuch as not without an oath he was made priest: (for those priests were made without an oath; but this with an oath by him that said unto him, Yahuah (Lord) sware and will not repent, Thou art a priest for ever after the order of Melek Tsadiq (Melchizedek):)* (Hebrews 7:20-21). The word is the psalm''s own: *Yahuah (LORD) hath sworn, and will not repent, Thou art a priest for ever after the order of Melek Tsadiq (Melchizedek)* (Psalm 110:4). An oath that will not repent makes the testament sure: *by so much was Yahusha (Jesus) made a surety of a better testament* (Hebrews 7:22). And where the many Levitical priests *were not suffered to continue by reason of death* (Hebrews 7:23), this one *continueth ever, hath an unchangeable priesthood* (Hebrews 7:24). The same psalm that swore the priesthood had seated this Lord on high: *Yahuah (LORD) said unto my Lord, Sit thou at my right hand, until I make thine enemies thy footstool* (Psalm 110:1). Enthroned and undying, *he ever liveth to make intercession* — *wherefore he is able also to save them to the uttermost that come unto Elohim (God) by him* (Hebrews 7:25). The oath is the guarantee; the endless life is the power; the throne is the seat from which he pleads for his own.',
       sv.verse_id, ev.verse_id, 'free', 7944
  FROM _s222_h07_lookup sv, _s222_h07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=7 AND sv.verse_number=20
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=7 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-7-holy-harmless-undefiled-who-offered-up-himself-once',
       E'Holy, harmless, undefiled — who offered up himself once',
       E'The chapter closes on the kind of priest who befits the eternal order. *For such an high priest became us, who is holy, harmless, undefiled, separate from sinners, and made higher than the heavens* (Hebrews 7:26). Unlike the high priests who had first to offer for their own sins, this one had none: *who needeth not daily, as those high priests, to offer up sacrifice, first for his own sins, and then for the people''s: for this he did once, when he offered up himself* (Hebrews 7:27). The daily, repeated offerings of the Levitical order are gathered up and finished in a single offering — not the Torah annulled, but the sacrificial administration brought to its fulfilment in the priest who offered himself once for all. And the final word is the word of the oath: *for the law maketh men high priests which have infirmity; but the word of the oath, which was since the law, maketh the Son, who is consecrated for evermore* (Hebrews 7:28) — *Yahuah (LORD) hath sworn, and will not repent, Thou art a priest for ever after the order of Melek Tsadiq (Melchizedek)* (Psalm 110:4). The law made men of infirmity priests; the sworn word makes the Son, consecrated for evermore — the Formed one who has a Father, the priest who does not die and so does not need to be replaced.',
       sv.verse_id, ev.verse_id, 'free', 7945
  FROM _s222_h07_lookup sv, _s222_h07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=7 AND sv.verse_number=26
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=7 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: hebrews-7-melchizedek-king-of-salem-priest-of-el-elyon-blessed-abraham-genesis-14
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 14:18 — *Melek Tsadiq (Melchizedek) king of Salem brought forth bread and wine: and he was the priest of the El Elyon (most high God)* the priesthood older than Aaron, on which the whole chapter is built (Hebrews 7:1).'
  FROM cross_reference_threads t, cross_references x, _s222_h07_lookup sv, _s222_h07_lookup tv
 WHERE t.slug='hebrews-7-melchizedek-king-of-salem-priest-of-el-elyon-blessed-abraham-genesis-14'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=14 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 14:19 — *Blessed be Abram of the El Elyon (most high God), possessor of heaven and earth* the blessing flows from the greater priest to Abraham, *the less is blessed of the better* (Hebrews 7:1,7).'
  FROM cross_reference_threads t, cross_references x, _s222_h07_lookup sv, _s222_h07_lookup tv
 WHERE t.slug='hebrews-7-melchizedek-king-of-salem-priest-of-el-elyon-blessed-abraham-genesis-14'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=14 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 14:20 — *And he gave him tithes of all* Abraham, holder of the promises, paid the tenth to the King of righteousness and King of peace (Hebrews 7:2).'
  FROM cross_reference_threads t, cross_references x, _s222_h07_lookup sv, _s222_h07_lookup tv
 WHERE t.slug='hebrews-7-melchizedek-king-of-salem-priest-of-el-elyon-blessed-abraham-genesis-14'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=7 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=14 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jasher 16:11 — *Adonizedek king of Jerusalem... went out... with bread and wine* the Hebrew record of the same meeting at the valley of Melech (Hebrews 7:1).'
  FROM cross_reference_threads t, cross_references x, _s222_h07_lookup sv, _s222_h07_lookup tv
 WHERE t.slug='hebrews-7-melchizedek-king-of-salem-priest-of-el-elyon-blessed-abraham-genesis-14'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=16 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jasher 16:12 — *Adonizedek blessed Abram, and Abram gave him a tenth... for Adonizedek was a priest before Elohim (God)* the Hebrew record names the priesthood older than Levi that Abraham acknowledged (Hebrews 7:2).'
  FROM cross_reference_threads t, cross_references x, _s222_h07_lookup sv, _s222_h07_lookup tv
 WHERE t.slug='hebrews-7-melchizedek-king-of-salem-priest-of-el-elyon-blessed-abraham-genesis-14'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=7 AND sv.verse_number=2
   AND tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=16 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hebrews-7-the-priesthood-changed-a-priest-from-judah-after-the-order-of-melchizedek
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 110:4 — *Thou art a priest for ever after the order of Melek Tsadiq (Melchizedek)* the sworn word on which the change of priestly order turns (Hebrews 7:17).'
  FROM cross_reference_threads t, cross_references x, _s222_h07_lookup sv, _s222_h07_lookup tv
 WHERE t.slug='hebrews-7-the-priesthood-changed-a-priest-from-judah-after-the-order-of-melchizedek'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=7 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=110 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Zechariah 6:12 — *Behold the man whose name is The BRANCH; and he shall grow up out of his place* the prophet saw a priest from outside Aaron''s line, *our Lord sprang out of Juda* (Hebrews 7:14).'
  FROM cross_reference_threads t, cross_references x, _s222_h07_lookup sv, _s222_h07_lookup tv
 WHERE t.slug='hebrews-7-the-priesthood-changed-a-priest-from-judah-after-the-order-of-melchizedek'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=7 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=6 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Zechariah 6:13 — *he shall be a priest upon his throne: and the counsel of peace shall be between them both* king and priest joined in one, the order of Melek Tsadiq (Melchizedek) (Hebrews 7:15).'
  FROM cross_reference_threads t, cross_references x, _s222_h07_lookup sv, _s222_h07_lookup tv
 WHERE t.slug='hebrews-7-the-priesthood-changed-a-priest-from-judah-after-the-order-of-melchizedek'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=7 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=6 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hebrews-7-yahuah-sware-and-will-not-repent-the-oath-and-the-better-testament-psalm-110
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 110:4 — *Yahuah (LORD) hath sworn, and will not repent* the oath the Levitical priests never had, making the testament sure (Hebrews 7:21).'
  FROM cross_reference_threads t, cross_references x, _s222_h07_lookup sv, _s222_h07_lookup tv
 WHERE t.slug='hebrews-7-yahuah-sware-and-will-not-repent-the-oath-and-the-better-testament-psalm-110'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=7 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=110 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 110:1 — *Sit thou at my right hand* the enthroned, undying Lord who *ever liveth to make intercession* (Hebrews 7:25).'
  FROM cross_reference_threads t, cross_references x, _s222_h07_lookup sv, _s222_h07_lookup tv
 WHERE t.slug='hebrews-7-yahuah-sware-and-will-not-repent-the-oath-and-the-better-testament-psalm-110'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=7 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=110 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hebrews-7-holy-harmless-undefiled-who-offered-up-himself-once
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 110:4 — *the word of the oath, which was since the law, maketh the Son, who is consecrated for evermore* the sworn word makes the priest who offered himself once (Hebrews 7:28).'
  FROM cross_reference_threads t, cross_references x, _s222_h07_lookup sv, _s222_h07_lookup tv
 WHERE t.slug='hebrews-7-holy-harmless-undefiled-who-offered-up-himself-once'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=7 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=110 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
