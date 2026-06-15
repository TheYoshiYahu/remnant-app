-- ----- fragment: minion_exodus_11.sql (Exodus 11) -----
-- Chapter: Exodus 11 — the announcement of the tenth plague (death of the firstborn);
--          the distinction Yahuah puts between Egypt and Yashar'el; the spoiling of Egypt.
-- Tag: ex11   Session prefix: s305   Sort band base: 29250 (step 3: 29250, 29253, 29256)
-- NOTE: the Passover/blood/firstborn-EXECUTION proper is ch12 (already built) — this chapter is
--       the ANNOUNCEMENT; threads anchor on the announced word, NOT on the ch12 Passover thread.
--
-- Exodus 11 coverage:
--   v.1  (one plague more; thrust you out)        NT: none warranted  Extras: none warranted  Tanakh: none warranted (setup line)
--   v.2-3 (borrow jewels of silver/gold; favour)  NT: none warranted  Extras: Jasher 80:59 (great riches per the oath to Abraham)
--                                                  Tanakh: Genesis 15:14 (come out with great substance) / Psalm 105:37 (forth with silver and gold)
--                                                  -> thread: exodus-11-they-spoiled-the-egyptians-with-jewels-of-silver-and-gold
--   v.4-6 (about midnight; all the firstborn die; great cry)
--                                                  NT: Hebrews 11:28 (he that destroyed the firstborn)
--                                                  Extras: Jubilees 49:2 (Mastema let loose to slay the firstborn) / Wisdom 18:5 (their children taken, measure-for-measure)
--                                                  Tanakh: Exodus 4:22-23 (Yashar'el my firstborn / I will slay thy firstborn) / Exodus 1:22 (every son into the river) / Psalm 78:51 / Psalm 105:36
--                                                  -> thread: exodus-11-and-all-the-firstborn-in-egypt-shall-die
--   v.7  (no dog move his tongue; Yahuah puts a difference between Egypt and Yashar'el)
--                                                  NT: Romans 9:4 (to whom pertaineth the adoption)
--                                                  Extras: Jubilees 49:4 (passed by Israel, neither cattle, man, nor dog) / Jasher 80:46 (dogs raked the firstborn of Egypt) / Wisdom 18:13 (acknowledged this people to be the sons of Yahuah)
--                                                  Tanakh: Exodus 8:23 (a division between my people and thy people) / Exodus 9:4 (sever between the cattle) / Malachi 3:18 (discern between him that serveth Elohim and him that serveth not) / Malachi 3:17 (my jewels; spare his own son that serveth him)
--                                                  -> thread: exodus-11-yahuah-puts-a-difference-between-egypt-and-yasharel
--   v.8  (servants bow; get thee out; great anger) NT: none warranted  Extras: none warranted  Tanakh: none warranted (narrative)
--   v.9-10 (Pharaoh shall not hearken; wonders multiplied; heart hardened)
--                                                  NT: none warranted  Extras: none warranted  Tanakh: covered by the hardening threads in earlier chapters (do not duplicate)
--
-- Threads (slug -> target libraries):
--   exodus-11-and-all-the-firstborn-in-egypt-shall-die                       [extras] Tanakh + NT + Jubilees + Wisdom of Solomon
--   exodus-11-yahuah-puts-a-difference-between-egypt-and-yasharel            [extras] Tanakh + NT + Jubilees + Jasher + Wisdom of Solomon
--   exodus-11-they-spoiled-the-egyptians-with-jewels-of-silver-and-gold     [extras] Tanakh + Jasher
--
-- Framework-load-bearing framing:
--   * v.4-6 framed as MEASURE-FOR-MEASURE against Exodus 4:22-23 (Yashar'el my son, my firstborn)
--     and Exodus 1:22 (Pharaoh's drowning of the Hebrew sons): Egypt struck at Yahuah's firstborn-son
--     people, so its own firstborn now fall. Wisdom 18:5 makes the reciprocity explicit. NO ch12 rebuild.
--   * v.7 framed as the REDEMPTIVE DISTINCTION on the one set-apart people (never replacement) —
--     Romans 9:4 keeps the adoption with Yashar'el, Malachi 3:18 carries the same dividing line forward.

CREATE TEMP VIEW _s305_ex11_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================================================================
-- B. cross_references
-- ============================================================================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: and all the firstborn in Egypt shall die (vv.4-6)
    ('canon','exodus',11,5,'canon','exodus',4,22,'free',
     E'*And thou shalt say unto Pharaoh, Thus saith Yahuah (LORD), Yashar''el (Israel) is my son, even my firstborn* (Exodus 4:22). The midnight word — *all the firstborn in the land of Egypt shall die, from the firstborn of Pharaoh that sitteth upon his throne* (Exodus 11:5) — falls as measure-for-measure: Egypt struck at Yahuah''s firstborn-son people, so the firstborn of Egypt are required.'),
    ('canon','exodus',11,5,'canon','exodus',4,23,'free',
     E'*And I say unto thee, Let my son go, that he may serve me: and if thou refuse to let him go, behold, I will slay thy son, even thy firstborn* (Exodus 4:23). The threat spoken at the burning-bush commission is now the announced deed: *all the firstborn in the land of Egypt shall die* (Exodus 11:5). The word does not return void.'),
    ('canon','exodus',11,6,'canon','exodus',1,22,'free',
     E'*And Pharaoh charged all his people, saying, Every son that is born ye shall cast into the river, and every daughter ye shall save alive* (Exodus 1:22). Egypt''s genocide of the Hebrew sons is answered in kind: *there shall be a great cry throughout all the land of Egypt, such as there was none like it* (Exodus 11:6). The river of drowned sons returns as the cry over Egypt''s own firstborn.'),
    ('canon','exodus',11,5,'canon','psalms',78,51,'free',
     E'*And smote all the firstborn in Egypt; the chief of their strength in the tabernacles of Ham* (Psalm 78:51). Asaph sings the night Moses here announces — *the firstborn of Pharaoh... even unto the firstborn of the maidservant* (Exodus 11:5) — naming the firstborn the very strength of the house of Ham.'),
    ('canon','exodus',11,5,'canon','psalms',105,36,'free',
     E'*He smote also all the firstborn in their land, the chief of all their strength* (Psalm 105:36). The Psalm rehearses Yahuah''s covenant-faithfulness through the plagues; the firstborn announced in *all the firstborn in the land of Egypt shall die* (Exodus 11:5) are sung as the chief of Egypt''s strength brought down.'),
    ('canon','exodus',11,4,'canon','hebrews',11,28,'free',
     E'*Through faith he kept the passover, and the sprinkling of blood, lest he that destroyed the firstborn should touch them* (Hebrews 11:28). The faith-roll names the destroyer announced in *About midnight will I go out into the midst of Egypt* (Exodus 11:4); the blood is the appointed distinction that holds back his hand from Yashar''el.'),
    ('canon','exodus',11,5,'jubilees','jubilees',49,2,'extras',
     E'*For on this night... when all the powers of Mastêmâ had been let loose to slay all the first-born in the land of Egypt, from the firstborn of Pharaoh to the first-born of the captive maidservant in the mill, and to the cattle* (Jubilees 49:2). Jubilees retells the same night, echoing Exodus almost word for word — *from the firstborn of Pharaoh that sitteth upon his throne, even unto the firstborn of the maidservant that is behind the mill; and all the firstborn of beasts* (Exodus 11:5) — and names the executing powers loosed under Mastema.'),
    ('canon','exodus',11,6,'apocrypha','the-wisdom-of-solomon',18,5,'extras',
     E'*And when they had determined to slay the babes of the saints, one child being cast forth, and saved, to reprove them, you tookest away the multitude of their children, and destroyedst them altogether in a mighty water* (Wisdom of Solomon 18:5). Wisdom reads the firstborn-cry — *a great cry throughout all the land of Egypt* (Exodus 11:6) — as the just recompense for Egypt''s slaughter of the Hebrew babes, the very measure-for-measure Exodus frames.'),

    -- THREAD 2: Yahuah puts a difference between Egypt and Yashar'el (v.7)
    ('canon','exodus',11,7,'canon','exodus',8,23,'free',
     E'*And I will put a division between my people and thy people: to morrow shall this sign be* (Exodus 8:23). The dividing line announced at the swarms is now sealed at the firstborn: *Yahuah (LORD) doth put a difference between the Egyptians and Yashar''el (Israel)* (Exodus 11:7). The same set-apart people, marked off through every plague.'),
    ('canon','exodus',11,7,'canon','exodus',9,4,'free',
     E'*And Yahuah (LORD) shall sever between the cattle of Yashar''el (Israel) and the cattle of Egypt: and there shall nothing die of all that is the children''s of Yashar''el (Israel)* (Exodus 9:4). The severing seen at the murrain reaches its sharpest edge here — *not a dog move his tongue, against man or beast* (Exodus 11:7) — the covenant people and even their beasts kept untouched.'),
    ('canon','exodus',11,7,'canon','malachi',3,18,'free',
     E'*Then shall ye return, and discern between the righteous and the wicked, between him that serveth Elohim (God) and him that serveth him not* (Malachi 3:18). The difference Yahuah puts *between the Egyptians and Yashar''el (Israel)* (Exodus 11:7) is the same dividing line the last prophet sets at the end — the served and the unserving, never erased.'),
    ('canon','exodus',11,7,'canon','malachi',3,17,'free',
     E'*And they shall be mine, saith Yahuah Tseva''ot (LORD of hosts), in that day when I make up my jewels; and I will spare them, as a man spareth his own son that serveth him* (Malachi 3:17). The sparing-of-the-firstborn-son distinction of *Yahuah... doth put a difference between the Egyptians and Yashar''el (Israel)* (Exodus 11:7) is gathered up here — Yahuah spares his own son who serves him, the firstborn-people kept as his jewels.'),
    ('canon','exodus',11,7,'canon','romans',9,4,'free',
     E'*Who are Israelites; to whom pertaineth the adoption, and the glory, and the covenants, and the giving of the law, and the service of Elohim (God), and the promises* (Romans 9:4). The difference put *between the Egyptians and Yashar''el (Israel)* (Exodus 11:7) is the adoption that still pertains to the same people — never transferred away, the firstborn-son nation kept.'),
    ('canon','exodus',11,7,'jubilees','jubilees',49,4,'extras',
     E'*And the powers of Yahuah (God) did everything according as Yahuah (God) commanded them, and they passed by all the children of Yashar’el (Israel), and the plague came not upon them to destroy from amongst them any soul either of cattle, or man, or dog* (Jubilees 49:4). Jubilees names the very distinction of *not a dog move his tongue, against man or beast* (Exodus 11:7) — the plague passing by Israel, sparing man, beast, and dog alike.'),
    ('canon','exodus',11,7,'jasher','jasher',80,46,'extras',
     E'*Even the bones of their first born who had died before this and whom they had buried in their houses, were raked up by the dogs of Egypt on that night and dragged before the Egyptians and cast before them* (Jasher 80:46). Jasher dramatizes the dog motif on Egypt''s side of the line; against Yashar''el — *shall not a dog move his tongue* (Exodus 11:7) — the same dogs are silent.'),
    ('canon','exodus',11,7,'apocrypha','the-wisdom-of-solomon',18,13,'extras',
     E'*For whereas they would not believe any thing by reason of the enchantments; upon the destruction of the firstborn, they acknowledged this people to be the sons of Yahuah (God)* (Wisdom of Solomon 18:13). Wisdom names the firstborn-night as the moment Egypt itself confessed the distinction — *Yahuah... doth put a difference between the Egyptians and Yashar''el (Israel)* (Exodus 11:7) — that Yashar''el are the sons of Yahuah.'),

    -- THREAD 3: they spoiled the Egyptians — jewels of silver and gold (vv.2-3)
    ('canon','exodus',11,2,'canon','genesis',15,14,'free',
     E'*And also that nation, whom they shall serve, will I judge: and afterward shall they come out with great substance* (Genesis 15:14). The borrowed *jewels of silver, and jewels of gold* (Exodus 11:2) are the promise to Abram coming due — the wages of four hundred years of bondage restored as Yashar''el comes out with great substance.'),
    ('canon','exodus',11,2,'canon','psalms',105,37,'free',
     E'*He brought them forth also with silver and gold: and there was not one feeble person among their tribes* (Psalm 105:37). The Psalm sings the fulfillment of the command to *borrow of his neighbour... jewels of silver, and jewels of gold* (Exodus 11:2) — Yashar''el led out laden, not one of them weak.'),
    ('canon','exodus',11,2,'jasher','jasher',80,59,'extras',
     E'*And all the Egyptians sent the Israelites forth, with great riches, sheep and oxen and precious things, according to the oath of Yahuah (the Lord) between him and our Father Abraham* (Jasher 80:59). Jasher binds the spoiling — *jewels of silver, and jewels of gold* (Exodus 11:2) — directly to the Abrahamic oath, the riches owed and now paid out at the going-forth.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s305_ex11_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s305_ex11_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================================================================
-- C. threads
-- ============================================================================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-11-and-all-the-firstborn-in-egypt-shall-die',
       E'And All the Firstborn in Egypt Shall Die — Measure for Measure',
       E'At midnight the word goes out: *And all the firstborn in the land of Egypt shall die, from the firstborn of Pharaoh that sitteth upon his throne, even unto the firstborn of the maidservant that is behind the mill; and all the firstborn of beasts* (Exodus 11:5), *and there shall be a great cry throughout all the land of Egypt, such as there was none like it, nor shall be like it any more* (Exodus 11:6). This is no arbitrary stroke. It is the measure of Egypt''s own crime returned upon its head. At the burning bush Yahuah had already spoken the charge and the sentence together: *Yashar''el (Israel) is my son, even my firstborn* (Exodus 4:22), *and if thou refuse to let him go, behold, I will slay thy son, even thy firstborn* (Exodus 4:23). Egypt had reached for Yahuah''s firstborn-son people — *Every son that is born ye shall cast into the river* (Exodus 1:22) — and now the river of drowned Hebrew sons returns as the cry over Egypt''s firstborn. The Apocrypha reads the night exactly so: *when they had determined to slay the babes of the saints... you tookest away the multitude of their children* (Wisdom of Solomon 18:5). The Psalms sing the deed — *He smote also all the firstborn in their land, the chief of all their strength* (Psalm 105:36); *And smote all the firstborn in Egypt; the chief of their strength in the tabernacles of Ham* (Psalm 78:51) — Egypt''s very strength struck at its root. Jubilees retells the same midnight in Exodus''s own words: *all the powers of Mastêmâ had been let loose to slay all the first-born in the land of Egypt, from the firstborn of Pharaoh to the first-born of the captive maidservant in the mill, and to the cattle* (Jubilees 49:2). And the faith-roll names the destroyer who walked that night and the blood that turned him aside: *Through faith he kept the passover, and the sprinkling of blood, lest he that destroyed the firstborn should touch them* (Hebrews 11:28). The announcement here is the threat made deed; the blood that distinguishes is unfolded in the next chapter.',
       sv.verse_id, ev.verse_id, 'extras', 29250
  FROM _s305_ex11_lookup sv, _s305_ex11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=11 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=11 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-11-yahuah-puts-a-difference-between-egypt-and-yasharel',
       E'Yahuah Puts a Difference Between Egypt and Yashar''el',
       E'*But against any of the children of Yashar''el (Israel) shall not a dog move his tongue, against man or beast: that ye may know how that Yahuah (LORD) doth put a difference between the Egyptians and Yashar''el (Israel)* (Exodus 11:7). The same dividing line has been drawn through plague after plague — *I will put a division between my people and thy people* (Exodus 8:23), *Yahuah (LORD) shall sever between the cattle of Yashar''el (Israel) and the cattle of Egypt* (Exodus 9:4) — and at the firstborn it is sealed so finely that not even a dog growls at the covenant people. This is the redemptive distinction set upon one set-apart nation, never a transfer to another. Jubilees names it in the same breath as the dog: *they passed by all the children of Yashar’el (Israel), and the plague came not upon them to destroy from amongst them any soul either of cattle, or man, or dog* (Jubilees 49:4). Jasher dramatizes the other side of the line, where the dogs are loud over Egypt''s dead: *the bones of their first born... were raked up by the dogs of Egypt on that night and dragged before the Egyptians and cast before them* (Jasher 80:46). And the Apocrypha names the moment Egypt itself confessed the difference: *upon the destruction of the firstborn, they acknowledged this people to be the sons of Yahuah (God)* (Wisdom of Solomon 18:13). The last prophet carries the same line to the end of the age — *discern between... him that serveth Elohim (God) and him that serveth him not* (Malachi 3:18) — and gathers the spared firstborn-son people as Yahuah''s own treasure: *they shall be mine... and I will spare them, as a man spareth his own son that serveth him* (Malachi 3:17). When the apostle reaches back, the adoption still belongs to the same people — *Who are Israelites; to whom pertaineth the adoption... and the covenants, and the giving of the law* (Romans 9:4). The difference Yahuah put that night is never undone.',
       sv.verse_id, ev.verse_id, 'extras', 29253
  FROM _s305_ex11_lookup sv, _s305_ex11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=11 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=11 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-11-they-spoiled-the-egyptians-with-jewels-of-silver-and-gold',
       E'Jewels of Silver and Gold — The Promise to Abraham Paid Out',
       E'*Speak now in the ears of the people, and let every man borrow of his neighbour, and every woman of her neighbour, jewels of silver, and jewels of gold* (Exodus 11:2), *and Yahuah (LORD) gave the people favour in the sight of the Egyptians* (Exodus 11:3). This is no theft and no afterthought — it is a covenant promise coming due. Centuries before, Yahuah had told Abram exactly how the bondage would end: *And also that nation, whom they shall serve, will I judge: and afterward shall they come out with great substance* (Genesis 15:14). The borrowed silver and gold are the wages of four hundred years of unpaid servitude, restored at the going-forth. The Psalm sings it fulfilled: *He brought them forth also with silver and gold: and there was not one feeble person among their tribes* (Psalm 105:37) — Yashar''el led out laden and whole, not one of them weak. And Jasher binds the spoiling straight to the oath that guaranteed it: *all the Egyptians sent the Israelites forth, with great riches, sheep and oxen and precious things, according to the oath of Yahuah (the Lord) between him and our Father Abraham* (Jasher 80:59). What Egypt withheld in bondage, Yahuah collects in full at the exodus — the word spoken to the fathers does not return void.',
       sv.verse_id, ev.verse_id, 'extras', 29256
  FROM _s305_ex11_lookup sv, _s305_ex11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=11 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=11 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- ============================================================================
-- D. thread_members
-- ============================================================================
-- THREAD 1: and all the firstborn in Egypt shall die
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    ('exodus',11,5,'canon','exodus',4,22,1,E'*Yashar''el (Israel) is my son, even my firstborn* (Exodus 4:22) — the burning-bush word that frames the whole stroke: Egypt struck at Yahuah''s firstborn-son people.'),
    ('exodus',11,5,'canon','exodus',4,23,2,E'*I will slay thy son, even thy firstborn* (Exodus 4:23) — the sentence first threatened at the commission, now announced as deed.'),
    ('exodus',11,6,'canon','exodus',1,22,3,E'*Every son that is born ye shall cast into the river* (Exodus 1:22) — Egypt''s drowning of the Hebrew sons answered by the great cry over its own firstborn.'),
    ('exodus',11,5,'canon','psalms',78,51,4,E'*And smote all the firstborn in Egypt; the chief of their strength in the tabernacles of Ham* (Psalm 78:51) — Asaph sings the firstborn as Egypt''s very strength struck down.'),
    ('exodus',11,5,'canon','psalms',105,36,5,E'*He smote also all the firstborn in their land, the chief of all their strength* (Psalm 105:36) — the Psalm of covenant-faithfulness rehearses the same blow.'),
    ('exodus',11,4,'canon','hebrews',11,28,6,E'*lest he that destroyed the firstborn should touch them* (Hebrews 11:28) — the destroyer announced at midnight, and the blood that turns him aside from Yashar''el.'),
    ('exodus',11,5,'jubilees','jubilees',49,2,7,E'*all the powers of Mastêmâ had been let loose to slay all the first-born... from the firstborn of Pharaoh to the first-born of the captive maidservant in the mill* (Jubilees 49:2) — the same night in Exodus''s own words.'),
    ('exodus',11,6,'apocrypha','the-wisdom-of-solomon',18,5,8,E'*you tookest away the multitude of their children* (Wisdom of Solomon 18:5) — Wisdom reads the firstborn-cry as just recompense for Egypt''s slaughter of the Hebrew babes.')
  ) AS m(src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN cross_reference_threads t ON t.slug='exodus-11-and-all-the-firstborn-in-egypt-shall-die'
  JOIN _s305_ex11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug=m.src_slug AND sv.chapter_number=m.src_ch AND sv.verse_number=m.src_v
  JOIN _s305_ex11_lookup tv ON tv.edition_slug=m.tgt_edition AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2: Yahuah puts a difference between Egypt and Yashar'el
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    ('exodus',11,7,'canon','exodus',8,23,1,E'*I will put a division between my people and thy people* (Exodus 8:23) — the dividing line drawn at the swarms, now sealed at the firstborn.'),
    ('exodus',11,7,'canon','exodus',9,4,2,E'*Yahuah (LORD) shall sever between the cattle of Yashar''el (Israel) and the cattle of Egypt* (Exodus 9:4) — the severing seen at the murrain, kept even over the beasts.'),
    ('exodus',11,7,'canon','malachi',3,18,3,E'*discern between... him that serveth Elohim (God) and him that serveth him not* (Malachi 3:18) — the same dividing line carried to the end of the age.'),
    ('exodus',11,7,'canon','malachi',3,17,4,E'*I will spare them, as a man spareth his own son that serveth him* (Malachi 3:17) — the spared firstborn-son people gathered as Yahuah''s jewels.'),
    ('exodus',11,7,'canon','romans',9,4,5,E'*to whom pertaineth the adoption... and the covenants, and the giving of the law* (Romans 9:4) — the adoption still belongs to the same Yashar''el, never transferred.'),
    ('exodus',11,7,'jubilees','jubilees',49,4,6,E'*the plague came not upon them to destroy... any soul either of cattle, or man, or dog* (Jubilees 49:4) — the dog-distinction named exactly, the plague passing by Israel.'),
    ('exodus',11,7,'jasher','jasher',80,46,7,E'*the bones of their first born... were raked up by the dogs of Egypt on that night* (Jasher 80:46) — the dogs loud over Egypt''s dead, silent against Yashar''el.'),
    ('exodus',11,7,'apocrypha','the-wisdom-of-solomon',18,13,8,E'*upon the destruction of the firstborn, they acknowledged this people to be the sons of Yahuah (God)* (Wisdom of Solomon 18:13) — Egypt itself confesses the difference Yahuah put.')
  ) AS m(src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN cross_reference_threads t ON t.slug='exodus-11-yahuah-puts-a-difference-between-egypt-and-yasharel'
  JOIN _s305_ex11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug=m.src_slug AND sv.chapter_number=m.src_ch AND sv.verse_number=m.src_v
  JOIN _s305_ex11_lookup tv ON tv.edition_slug=m.tgt_edition AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3: jewels of silver and gold — the promise to Abraham paid out
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    ('exodus',11,2,'canon','genesis',15,14,1,E'*afterward shall they come out with great substance* (Genesis 15:14) — the promise to Abram coming due: the wages of the bondage restored.'),
    ('exodus',11,2,'canon','psalms',105,37,2,E'*He brought them forth also with silver and gold: and there was not one feeble person among their tribes* (Psalm 105:37) — the spoiling sung as fulfilled, Yashar''el led out laden and whole.'),
    ('exodus',11,2,'jasher','jasher',80,59,3,E'*according to the oath of Yahuah (the Lord) between him and our Father Abraham* (Jasher 80:59) — the riches bound straight to the Abrahamic oath that guaranteed them.')
  ) AS m(src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN cross_reference_threads t ON t.slug='exodus-11-they-spoiled-the-egyptians-with-jewels-of-silver-and-gold'
  JOIN _s305_ex11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug=m.src_slug AND sv.chapter_number=m.src_ch AND sv.verse_number=m.src_v
  JOIN _s305_ex11_lookup tv ON tv.edition_slug=m.tgt_edition AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
