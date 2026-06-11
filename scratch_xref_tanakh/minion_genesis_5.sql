-- ----- fragment: minion_genesis_5.sql (Genesis 5) -----
-- Chapter: Genesis 5 (The book of the generations of Adam — the seed-line from Adam to Noah; Enoch translated)
-- Tag: ge05   Temp view: _s301_ge05_lookup
-- Sort band: base 20100, step 3 -> threads at 20100, 20103, 20106, 20109 (4 threads)
-- Source of EVERY row: 'canon','genesis',5,v
--
-- Genesis 5 coverage:
--   v.1-2  ("This is the book of the generations of Adam... in the likeness of Elohim made he him; Male and female created he them")
--        NT:     Luke 3:38 (which was the son of Seth, which was the son of Adam, which was the son of Elohim) — woven into THREAD 1
--        Extras: none warranted as MEMBER (Jubilees 4 retells the line but its distinctive witness is Enoch, carried in THREAD 2)
--        Tanakh: Genesis 1:26-27 (let us make man in our image); 1 Chronicles 1:1-4 (the same Adam-to-Noah line) — THREAD 1
--   v.3   (Adam begat a son in his own likeness, after his image; Seth)
--        NT:     Luke 3:38 (carried at THREAD 1)
--        Extras: none warranted distinct
--        Tanakh: Genesis 1:26 (the image carried down the seed-line) — THREAD 1
--   v.4-20 (the toledot refrain: Seth/Enos/Cainan/Mahalaleel/Jared — begat... and he died)
--        NT:     Romans 5:14 (death reigned from Adam to Moses) — THREAD 3, anchored across the refrain
--        Extras: none warranted (the year-totals are not a distinct framework witness)
--        Tanakh: Genesis 3:19 (dust to dust); Psalm 90:3 (Thou turnest man to destruction) — THREAD 3
--   v.5,8,11,14,17,20,27,31 ("and he died" — the refrain of death reigning)
--        NT:     Romans 5:14 — THREAD 3
--        Extras: none warranted as MEMBER (Jubilees 4:29-30 reflects on Adam's death lacking 70 of 1000 years; recorded, not quoted — apparatus-laced verse)
--        Tanakh: Genesis 3:19; Psalm 90:3 — THREAD 3
--   ★ v.21-24 (Enoch walked with Elohim; he was not, for Elohim took him — translation)
--        NT:     Hebrews 11:5 (by faith Enoch was translated... he pleased Elohim); Jude 14 (Enoch, the seventh from Adam, prophesied) — THREAD 2
--        Extras: 1 Enoch 12:1 (Enoch was hidden, no one knew where he abode); 1 Enoch 12:3 (Enoch the scribe of righteousness, the Watchers called me);
--                Jubilees 4:17 (first to learn writing, set in order the months/Sabbaths — the Appointed Times); Jubilees 4:22 (testified against the Watchers);
--                Jubilees 4:23 (taken into the Garden of Eden in majesty); Ecclesiasticus 44:16 (Enoch pleased Yahuah and was translated);
--                Ecclesiasticus 49:14 (no man created like Enoch; he was taken from the earth) — THREAD 2 (CENTERPIECE, extras-rich)
--        Tanakh: none warranted distinct (the translation is fulfilled FORWARD and OUT) — AVOIDED 1 Enoch ch25 (bad parse)
--   v.25-27 (Methuselah; the longevity; and he died — the longest-lived man dies the year of the flood by reckoning)
--        NT:     none warranted as its own thread (folded into the death refrain, THREAD 3)
--        Extras: none warranted distinct
--        Tanakh: none warranted distinct
--   v.28-29 (Lamech begat a son, called Noah: This same shall comfort us... because of the ground which Yahuah hath cursed)
--        NT:     none warranted (the hope of relief points to Noah/rest within the Tanakh)
--        Extras: Jubilees 4:28 (This one will comfort me... for the ground which Yahuah has cursed) — THREAD 4
--        Tanakh: Genesis 3:17 (cursed is the ground for thy sake) — THREAD 4
--   v.30-32 (Lamech's remaining years; Noah begat Shem, Ham, and Japheth — bridge to the flood)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: none warranted (genealogical bridge; the seed-line carried at THREAD 1)
--
-- Threads (slug — target libraries):
--   1. genesis-5-the-book-of-the-generations-of-adam-the-image-down-the-seed-line — NT (Luke) + Tanakh (Genesis, 1 Chronicles) [free]
--   2. genesis-5-enoch-walked-with-elohim-and-was-translated — NT (Hebrews, Jude) + Extras (1 Enoch, Jubilees, Ecclesiasticus) [extras] (CENTERPIECE)
--   3. genesis-5-and-he-died-death-reigned-from-adam — NT (Romans) + Tanakh (Genesis, Psalm) [free]
--   4. genesis-5-lamech-named-him-noah-comfort-from-the-cursed-ground — Tanakh (Genesis) + Extras (Jubilees) [extras]
--
-- Framing note: Genesis 5 is a genealogy, so the threads are curated, not name-by-name. The image of
-- Elohim runs down the toledot seed-line to the Son of Adam (Luke 3:38); the "and he died" refrain is the
-- wages of sin (Romans 5:14) read back to the ground-curse (Genesis 3:19); Enoch is the single exception
-- that points beyond death — translated, pleasing Elohim, the witness against the Watchers (Hebrews 11:5,
-- Jude 14, 1 Enoch, Jubilees 4, Ecclesiasticus 44/49) — and Lamech's hope names Noah as comfort from the
-- cursed ground. AVOIDED 1 Enoch ch25 (bad parse). Jubilees double-written 'jubilees','jubilees'.

CREATE TEMP VIEW _s301_ge05_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: the book of the generations of Adam — the image down the seed-line
    ('canon','genesis',5,1,'canon','luke',3,38,'free',
      E'*Which was the son of Enos, which was the son of Seth, which was the son of Adam, which was the son of Elohim (God)* (Luke 3:38). *This is the book of the generations of Adam. In the day that Elohim (God) created man, in the likeness of Elohim (God) made he him* (Genesis 5:1). The toledot that opens here — Adam, Seth, Enos, on down — is the very line the Spirit runs forward to the Son of Adam: the same names, in reverse, climbing back through Seth to Adam to *the son of Elohim (God)*. The book of the generations of Adam is the seed-line of promise, and it is running to Messiah.'),
    ('canon','genesis',5,1,'canon','genesis',1,26,'free',
      E'*And Elohim (God) said, Let us make man in our image, after our likeness* (Genesis 1:26). The toledot heading repeats the creation word: *in the likeness of Elohim (God) made he him* (Genesis 5:1). What was spoken at the beginning is now carried as a heading over the seed-line — the image of Elohim is not lost at the fall; it is handed down the generations of Adam.'),
    ('canon','genesis',5,3,'canon','genesis',1,26,'free',
      E'*And Elohim (God) said, Let us make man in our image, after our likeness* (Genesis 1:26). Adam *begat a son in his own likeness, after his image; and called his name Seth* (Genesis 5:3) — the same words *likeness* and *image* that named the making of man now name the begetting of the son. The image first stamped on Adam is transmitted by paternal bloodline down the line of promise.'),
    ('canon','genesis',5,3,'canon','1-chronicles',1,1,'free',
      E'*Adam, Sheth, Enosh* (1 Chronicles 1:1). The chronicler opens the whole genealogy of Yashar''el (Israel) by reciting the very line of Genesis 5 — *And Adam... begat a son... and called his name Seth* (Genesis 5:3) — Adam, Seth, Enos, on down to Noah. The seed-line of Genesis 5 is the trunk from which the covenant people are later numbered.'),

    -- THREAD 2 (CENTERPIECE): Enoch walked with Elohim and was translated
    ('canon','genesis',5,24,'canon','hebrews',11,5,'free',
      E'*By faith Enoch was translated that he should not see death; and was not found, because Elohim (God) had translated him: for before his translation he had this testimony, that he pleased Elohim (God)* (Hebrews 11:5). *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him* (Genesis 5:24). The one man in the whole death-chapter who does not die is read forward as the man of faith: he *was not found* because Elohim *translated him*, and the ground of it was that *he pleased Elohim* — the walk of Genesis 5:24 named as the faith that overcomes death.'),
    ('canon','genesis',5,22,'canon','hebrews',11,5,'free',
      E'*By faith Enoch was translated that he should not see death... he had this testimony, that he pleased Elohim (God)* (Hebrews 11:5). The verse that *Enoch walked with Elohim (God) after he begat Methuselah three hundred years* (Genesis 5:22) is the walk the NT calls faith that *pleased Elohim* — three centuries of walking, then taken.'),
    ('canon','genesis',5,24,'canon','jude',1,14,'free',
      E'*And Enoch also, the seventh from Adam, prophesied of these, saying, Behold, Yahuah (Lord) cometh with ten thousands of his saints* (Jude 14). The man who *walked with Elohim (God)* and *was not; for Elohim (God) took him* (Genesis 5:24) is named *the seventh from Adam* — counted right down the Genesis 5 line — and remembered as a prophet whose word stood. His walk was not silent; he testified, and Yahuah is coming as he said.'),
    ('canon','genesis',5,24,'enoch','1-enoch',12,1,'extras',
      E'*Before these things Enoch was hidden, and no one of the children of men knew where he was hidden, and where he abode, and what had become of him* (1 Enoch 12:1). This is the inside of *and he was not; for Elohim (God) took him* (Genesis 5:24): not death but hiddenness — none of the children of men could find where he had gone, because he had been taken.'),
    ('canon','genesis',5,24,'enoch','1-enoch',12,3,'extras',
      E'*And I Enoch was blessing Yahuah (God) of majesty and the King of the ages, and lo! the Watchers called me—Enoch the scribe—and said to me* (1 Enoch 12:3). The one who *walked with Elohim (God)* (Genesis 5:24) is the scribe of righteousness, set between heaven and the fallen Watchers to carry the word of judgment — the walk was a commission.'),
    ('canon','genesis',5,22,'jubilees','jubilees',4,17,'extras',
      E'*And he was the first among men that are born on earth who learnt writing and knowledge and wisdom and who wrote down the signs of heaven according to the order of their months in a book, that men might know the seasons of the years according to the order of their separate months... and set in order the months and recounted the Sabbaths of the years* (Jubilees 4:17). The walk of *Enoch... with Elohim (God)* (Genesis 5:22) included the keeping of the appointed times: he set in order the months and the Sabbaths so men might know the seasons of Yahuah''s calendar.'),
    ('canon','genesis',5,22,'jubilees','jubilees',4,22,'extras',
      E'*And he testified to the Watchers, who had sinned with the daughters of men... and Enoch testified against (them) all* (Jubilees 4:22). To *walk with Elohim (God)* (Genesis 5:22) in a generation of corruption was to bear witness against it; Enoch''s walk made him the witness against the Watchers.'),
    ('canon','genesis',5,24,'jubilees','jubilees',4,23,'extras',
      E'*And he was taken from amongst the children of men, and we conducted him into the Garden of Eden in majesty and honour, and behold there he writes down the condemnation and judgment of the world* (Jubilees 4:23). *And he was not; for Elohim (God) took him* (Genesis 5:24) — taken not into death but into the Garden, in majesty and honour, to keep writing the testimony.'),
    ('canon','genesis',5,24,'apocrypha','ecclesiasticus',44,16,'extras',
      E'*Enoch pleased Yahuah (God), and was translated, being an example of repentance to all generations* (Ecclesiasticus 44:16). The same two words the whole tradition hangs on Genesis 5:24 — *pleased* and *translated* — gathered into one line: *for Elohim (God) took him* is read as an example held up to every generation after.'),
    ('canon','genesis',5,24,'apocrypha','ecclesiasticus',49,14,'extras',
      E'*But upon the earth was no man created like Enoch; for he was taken from the earth* (Ecclesiasticus 49:14). In the long roll of the fathers Enoch stands alone — *no man created like* him — because of the single fact of Genesis 5:24: *Elohim (God) took him*, he was taken from the earth.'),

    -- THREAD 3: and he died — death reigned from Adam
    ('canon','genesis',5,5,'canon','romans',5,14,'free',
      E'*Nevertheless death reigned from Adam to Moses, even over them that had not sinned after the similitude of Adam''s transgression, who is the figure of him that was to come* (Romans 5:14). *And all the days that Adam lived were nine hundred and thirty years: and he died* (Genesis 5:5). The refrain that tolls through this chapter — *and he died, and he died* — is the reign Sha''ul names: death ruling *from Adam*, the wages of the one transgression passed down the whole line.'),
    ('canon','genesis',5,5,'canon','genesis',3,19,'free',
      E'*In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return* (Genesis 3:19). The sentence in the garden is paid out in full in this chapter: *and all the days that Adam lived were nine hundred and thirty years: and he died* (Genesis 5:5). The dust-return spoken to Adam becomes the refrain over every name in his line.'),
    ('canon','genesis',5,5,'canon','psalms',90,3,'free',
      E'*Thou turnest man to destruction; and sayest, Return, ye children of men* (Psalm 90:3). Mosheh''s (Moses'') psalm meditates on the very thing Genesis 5 records — man turned back to destruction, the *Return* of dust to dust — the same word of the ground-curse working itself out across the generations: *and he died* (Genesis 5:5).'),

    -- THREAD 4: Lamech named him Noah — comfort from the cursed ground
    ('canon','genesis',5,29,'canon','genesis',3,17,'free',
      E'*And unto Adam he said... cursed is the ground for thy sake; in sorrow shalt thou eat of it all the days of thy life* (Genesis 3:17). Lamech names his son in the hope of relief from exactly this curse: *This same shall comfort us concerning our work and toil of our hands, because of the ground which Yahuah (LORD) hath cursed* (Genesis 5:29). The toil under the cursed ground of the garden is what Noah is born to comfort — the first reaching toward rest from the fall.'),
    ('canon','genesis',5,29,'jubilees','jubilees',4,28,'extras',
      E'*and in this week she bare him a son and he called his name Noah, saying, "This one will comfort me for my trouble and all my work, and for the ground which Yahuah (God) has cursed."* (Jubilees 4:28). The same naming and the same hope are preserved here word for word: Noah named for comfort *for the ground which Yahuah has cursed* — the cry of Genesis 5:29 echoed in the restored witness.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s301_ge05_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s301_ge05_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-5-the-book-of-the-generations-of-adam-the-image-down-the-seed-line',
       E'The book of the generations of Adam — the image down the seed-line',
       E'The chapter opens as a heading over all that follows: *This is the book of the generations of Adam. In the day that Elohim (God) created man, in the likeness of Elohim (God) made he him* (Genesis 5:1). The making-word of the beginning — *Let us make man in our image, after our likeness* (Genesis 1:26) — is repeated, and then handed on by begetting: *And Adam lived an hundred and thirty years, and begat a son in his own likeness, after his image; and called his name Seth* (Genesis 5:3). The image of Elohim is not erased at the fall; it is carried down the seed-line of promise by paternal bloodline. The chronicler later opens the genealogy of the covenant people with this same trunk — *Adam, Sheth, Enosh* (1 Chronicles 1:1) — and the Spirit runs the line all the way forward to its end: *which was the son of Enos, which was the son of Seth, which was the son of Adam, which was the son of Elohim (God)* (Luke 3:38). The book of the generations of Adam is the line that runs to Messiah.',
       sv.verse_id, ev.verse_id, 'free', 20100
  FROM _s301_ge05_lookup sv, _s301_ge05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=5 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=5 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (CENTERPIECE)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-5-enoch-walked-with-elohim-and-was-translated',
       E'Enoch walked with Elohim and was translated',
       E'In a chapter where every name ends *and he died*, one man does not: *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him* (Genesis 5:24) — the seventh from Adam, who *walked with Elohim (God) after he begat Methuselah three hundred years* (Genesis 5:22). The NT reads this as the faith that overcomes death: *By faith Enoch was translated that he should not see death; and was not found, because Elohim (God) had translated him: for before his translation he had this testimony, that he pleased Elohim (God)* (Hebrews 11:5). And his walk was not silent — *And Enoch also, the seventh from Adam, prophesied of these, saying, Behold, Yahuah (Lord) cometh with ten thousands of his saints* (Jude 14). The restored witnesses unfold the same man. He was the scribe whose translation was hiddenness, not death: *Before these things Enoch was hidden, and no one of the children of men knew where he was hidden, and where he abode, and what had become of him* (1 Enoch 12:1); *the Watchers called me—Enoch the scribe* (1 Enoch 12:3). His walk kept the very calendar of Yahuah — *he was the first among men... who wrote down the signs of heaven according to the order of their months... and set in order the months and recounted the Sabbaths of the years* (Jubilees 4:17) — and made him the witness against the fallen ones: *and Enoch testified against (them) all* (Jubilees 4:22). When *Elohim took him* (Genesis 5:24), he was carried into the garden: *we conducted him into the Garden of Eden in majesty and honour* (Jubilees 4:23). The fathers'' praise gathers it into a word: *Enoch pleased Yahuah (God), and was translated, being an example of repentance to all generations* (Ecclesiasticus 44:16); *upon the earth was no man created like Enoch; for he was taken from the earth* (Ecclesiasticus 49:14). Enoch is the exception that points the whole death-chapter beyond death.',
       sv.verse_id, ev.verse_id, 'extras', 20103
  FROM _s301_ge05_lookup sv, _s301_ge05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=5 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=5 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-5-and-he-died-death-reigned-from-adam',
       E'And he died — death reigned from Adam',
       E'The toledot of Genesis 5 tolls one phrase over every patriarch: *and all the days that Adam lived were nine hundred and thirty years: and he died* (Genesis 5:5) — and Seth died, and Enos died, and so down the line. This is the ground-curse paid out in full: *for out of it wast thou taken: for dust thou art, and unto dust shalt thou return* (Genesis 3:19). Mosheh''s (Moses'') psalm names the same turning: *Thou turnest man to destruction; and sayest, Return, ye children of men* (Psalm 90:3). And Sha''ul gathers the whole refrain into a reign: *Nevertheless death reigned from Adam to Moses, even over them that had not sinned after the similitude of Adam''s transgression, who is the figure of him that was to come* (Romans 5:14). Death ruling from Adam down the generations is the wages of the one transgression — and Adam''s very name marks him as *the figure of him that was to come*, the last Adam who would break the reign.',
       sv.verse_id, ev.verse_id, 'free', 20106
  FROM _s301_ge05_lookup sv, _s301_ge05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=5 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=5 AND ev.verse_number=31
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-5-lamech-named-him-noah-comfort-from-the-cursed-ground',
       E'Lamech named him Noah — comfort from the cursed ground',
       E'Into the long refrain of death comes a single note of hope, and it reaches straight back to the garden. Lamech *called his name Noah, saying, This same shall comfort us concerning our work and toil of our hands, because of the ground which Yahuah (LORD) hath cursed* (Genesis 5:29). The ground he names is the ground of Genesis 3: *cursed is the ground for thy sake; in sorrow shalt thou eat of it all the days of thy life* (Genesis 3:17). Noah is born under the weight of the curse and named for the comfort of relief from it — the first reaching of the seed-line toward rest. The restored witness preserves the naming word for word: *he called his name Noah, saying, "This one will comfort me for my trouble and all my work, and for the ground which Yahuah (God) has cursed."* (Jubilees 4:28). The hope of comfort from the cursed ground is planted in the line that will carry the promise through the flood.',
       sv.verse_id, ev.verse_id, 'extras', 20109
  FROM _s301_ge05_lookup sv, _s301_ge05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=5 AND sv.verse_number=28
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=5 AND ev.verse_number=29
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*which was the son of Seth, which was the son of Adam, which was the son of Elohim (God)* (Luke 3:38) — the Genesis 5 line run forward, reverse, to Messiah and the Son of Elohim.'
  FROM cross_reference_threads t
  JOIN _s301_ge05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=5 AND sv.verse_number=1
  JOIN _s301_ge05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=3 AND tv.verse_number=38
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-5-the-book-of-the-generations-of-adam-the-image-down-the-seed-line'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Let us make man in our image, after our likeness* (Genesis 1:26) — the making-word repeated as the toledot heading: *in the likeness of Elohim made he him* (5:1).'
  FROM cross_reference_threads t
  JOIN _s301_ge05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=5 AND sv.verse_number=1
  JOIN _s301_ge05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-5-the-book-of-the-generations-of-adam-the-image-down-the-seed-line'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Let us make man in our image, after our likeness* (Genesis 1:26) — the image transmitted by begetting: Adam *begat a son in his own likeness, after his image* (5:3).'
  FROM cross_reference_threads t
  JOIN _s301_ge05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=5 AND sv.verse_number=3
  JOIN _s301_ge05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-5-the-book-of-the-generations-of-adam-the-image-down-the-seed-line'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Adam, Sheth, Enosh* (1 Chronicles 1:1) — the chronicler opens the covenant genealogy with the very Genesis 5 trunk.'
  FROM cross_reference_threads t
  JOIN _s301_ge05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=5 AND sv.verse_number=3
  JOIN _s301_ge05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=1 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-5-the-book-of-the-generations-of-adam-the-image-down-the-seed-line'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (CENTERPIECE)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*By faith Enoch was translated that he should not see death... he pleased Elohim (God)* (Hebrews 11:5) — the walk of 5:22 named as the faith that pleased Elohim.'
  FROM cross_reference_threads t
  JOIN _s301_ge05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=5 AND sv.verse_number=22
  JOIN _s301_ge05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-5-enoch-walked-with-elohim-and-was-translated'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*By faith Enoch was translated that he should not see death; and was not found, because Elohim (God) had translated him* (Hebrews 11:5) — *he was not; for Elohim took him* (5:24) read as the faith that overcomes death.'
  FROM cross_reference_threads t
  JOIN _s301_ge05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=5 AND sv.verse_number=24
  JOIN _s301_ge05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-5-enoch-walked-with-elohim-and-was-translated'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*And Enoch also, the seventh from Adam, prophesied* (Jude 14) — counted down the Genesis 5 line, his walk remembered as a standing prophecy.'
  FROM cross_reference_threads t
  JOIN _s301_ge05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=5 AND sv.verse_number=24
  JOIN _s301_ge05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-5-enoch-walked-with-elohim-and-was-translated'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Enoch was hidden, and no one of the children of men knew where he was hidden* (1 Enoch 12:1) — the inside of *he was not; for Elohim took him* (5:24): hiddenness, not death.'
  FROM cross_reference_threads t
  JOIN _s301_ge05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=5 AND sv.verse_number=24
  JOIN _s301_ge05_lookup tv ON tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=12 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-5-enoch-walked-with-elohim-and-was-translated'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*the Watchers called me—Enoch the scribe* (1 Enoch 12:3) — the one who walked with Elohim set as scribe of righteousness between heaven and the fallen.'
  FROM cross_reference_threads t
  JOIN _s301_ge05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=5 AND sv.verse_number=24
  JOIN _s301_ge05_lookup tv ON tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=12 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-5-enoch-walked-with-elohim-and-was-translated'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*the first among men... who wrote down the signs of heaven according to the order of their months... and set in order the months and... the Sabbaths of the years* (Jubilees 4:17) — the walk of 5:22 kept the appointed times of Yahuah.'
  FROM cross_reference_threads t
  JOIN _s301_ge05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=5 AND sv.verse_number=22
  JOIN _s301_ge05_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-5-enoch-walked-with-elohim-and-was-translated'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*and Enoch testified against (them) all* (Jubilees 4:22) — to walk with Elohim in a corrupt generation was to be the witness against the Watchers.'
  FROM cross_reference_threads t
  JOIN _s301_ge05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=5 AND sv.verse_number=22
  JOIN _s301_ge05_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-5-enoch-walked-with-elohim-and-was-translated'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*we conducted him into the Garden of Eden in majesty and honour* (Jubilees 4:23) — *Elohim took him* (5:24) into the garden, not into death.'
  FROM cross_reference_threads t
  JOIN _s301_ge05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=5 AND sv.verse_number=24
  JOIN _s301_ge05_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-5-enoch-walked-with-elohim-and-was-translated'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'*Enoch pleased Yahuah (God), and was translated, being an example of repentance to all generations* (Ecclesiasticus 44:16) — *pleased* and *translated* gathered into one line.'
  FROM cross_reference_threads t
  JOIN _s301_ge05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=5 AND sv.verse_number=24
  JOIN _s301_ge05_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=44 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-5-enoch-walked-with-elohim-and-was-translated'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 10, E'*upon the earth was no man created like Enoch; for he was taken from the earth* (Ecclesiasticus 49:14) — Enoch stands alone in the roll of the fathers, on the single fact of 5:24.'
  FROM cross_reference_threads t
  JOIN _s301_ge05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=5 AND sv.verse_number=24
  JOIN _s301_ge05_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=49 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-5-enoch-walked-with-elohim-and-was-translated'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*death reigned from Adam to Moses... who is the figure of him that was to come* (Romans 5:14) — the *and he died* refrain named as the reign of death from Adam.'
  FROM cross_reference_threads t
  JOIN _s301_ge05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=5 AND sv.verse_number=5
  JOIN _s301_ge05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=5 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-5-and-he-died-death-reigned-from-adam'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*dust thou art, and unto dust shalt thou return* (Genesis 3:19) — the ground-curse paid out as *and he died* (5:5).'
  FROM cross_reference_threads t
  JOIN _s301_ge05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=5 AND sv.verse_number=5
  JOIN _s301_ge05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-5-and-he-died-death-reigned-from-adam'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Thou turnest man to destruction; and sayest, Return, ye children of men* (Psalm 90:3) — Mosheh''s psalm on the same returning to dust that the chapter records.'
  FROM cross_reference_threads t
  JOIN _s301_ge05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=5 AND sv.verse_number=5
  JOIN _s301_ge05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=90 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-5-and-he-died-death-reigned-from-adam'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*cursed is the ground for thy sake; in sorrow shalt thou eat of it all the days of thy life* (Genesis 3:17) — the curse Noah is named to comfort (5:29).'
  FROM cross_reference_threads t
  JOIN _s301_ge05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=5 AND sv.verse_number=29
  JOIN _s301_ge05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-5-lamech-named-him-noah-comfort-from-the-cursed-ground'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*he called his name Noah, saying, "This one will comfort me... for the ground which Yahuah (God) has cursed"* (Jubilees 4:28) — the naming of 5:29 preserved word for word.'
  FROM cross_reference_threads t
  JOIN _s301_ge05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=5 AND sv.verse_number=29
  JOIN _s301_ge05_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-5-lamech-named-him-noah-comfort-from-the-cursed-ground'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
