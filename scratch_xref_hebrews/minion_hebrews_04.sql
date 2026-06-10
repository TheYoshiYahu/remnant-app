-- ----- fragment: minion_hebrews_04.sql (S222 Hebrews 4) -----
-- =====================================================================
-- S222 minion — HEBREWS 4 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: HEBREWS 4.  Tag: h04 (temp view _s222_h04_lookup).  Sort band: 7921..7927, step 1.
-- Source is ALWAYS the canon Hebrews verse; targets span Tanakh + extra-canonical + NT.
-- Tiers per-row: canon target = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME — THE SABBATH-REST WATCHPOINT: Hebrews 4 AFFIRMS the Sabbath; it does NOT
-- abolish it. *There remaineth therefore a rest to the people of Elohim (God)* (4:9) — the word
-- is a keeping-of-sabbath, a sabbatismos. *For he that is entered into his rest, he also hath
-- ceased from his own works, as Elohim (God) did from his* (4:10), pointing straight back to
-- *And Elohim (God) did rest the seventh day from all his works* (4:4 / Genesis 2:2-3). The
-- weekly Sabbath that Elohim blessed and sanctified at creation is the sign and foretaste of the
-- eternal rest — the rest the Sabbath has always pointed to, never the commandment annulled. The
-- chapter continues the Psalm 95 *to day... harden not your hearts* warning from chapter 3
-- (4:3,5,7 / Psalm 95:7-11): the wilderness generation forfeited the rest through unbelief, so
-- the promise stands open still. Then the discerning word (4:12-13) and the great high priest
-- *touched with the feeling of our infirmities... yet without sin* (4:14-15) at the throne of
-- grace (4:16). Note on 4:8: the canon pull renders Yehoshua/Joshua as *Yahusha (Jesus)*; in
-- context it is Joshua son of Nun who led into the land but did not give the true rest — the prose
-- here does NOT make the Sabbath-rest thread turn on 4:8, and the quoted text is preserved exactly
-- as the pull returns it.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-3   let us fear lest we come short / we who believe enter into rest / as I have sworn in my wrath
--           Tanakh: Psalm 95:11 (I sware in my wrath they should not enter my rest)  Extras: none warranted  NT: none warranted (carried in the Psalm 95 thread)
--   v.4     he spake of the seventh day / Elohim did rest the seventh day from all his works
--           Tanakh: Genesis 2:2 (rested the seventh day), 2:3 (blessed and sanctified it)  Extras: Jubilees 2:1 (kept Sabbath and hallowed it for all ages, a sign)  NT: none warranted
--   v.5-9   it remaineth that some must enter / to day in David / there remaineth a rest (sabbath-keeping) to the people of Elohim
--           Tanakh: Genesis 2:3 (sanctified the seventh day — carried in the rest thread); Psalm 95:7-8 (to day, harden not — carried in the Psalm 95 thread)  Extras: Jubilees 2:19 (a people who keep the Sabbath sanctified to Himself), 2:30 (we kept Sabbath in the heavens)  NT: none warranted
--   v.10    he that is entered into his rest hath ceased from his own works, as Elohim did from his
--           Tanakh: Genesis 2:2 (rested from all his work)  Extras: Jubilees 2:1 (finished His works and kept Sabbath)  NT: none warranted (carried in the rest thread)
--   v.11    let us labour to enter that rest, lest any fall after the same example of unbelief
--           Tanakh: Psalm 95:11 (the forfeited rest — carried in the Psalm 95 thread)  Extras: none warranted  NT: none warranted
--   v.12-13 the word of Elohim is quick and powerful, sharper than a twoedged sword / all things naked and opened
--           Tanakh: Isaiah 49:2 (mouth like a sharp sword), Isaiah 55:11 (my word shall not return void)  Extras: none warranted  NT: none warranted
--   v.14-16 a great high priest passed into the heavens / touched with the feeling of our infirmities / throne of grace
--           Tanakh: Isaiah 53:3 (despised, acquainted with grief), 53:4 (he hath borne our griefs)  Extras: none warranted  NT: none warranted
--
--   Extras across the chapter: Jubilees 2 is the one load-bearing extra-canonical witness — the
--   seventh-day Sabbath sanctified at creation, hallowed for all ages, kept in the heavens before
--   it was made known to flesh, woven into the Sabbath-rest thread alongside Genesis 2. The
--   faith-cloud extras (1 Enoch, Sirach, 2 Maccabees) belong to Hebrews 11; the Melchizedek
--   tradition to chapters 5 and 7. Curated, not a dump.
--
-- THREADS (slug -> target libraries):
--   7921 hebrews-4-there-remaineth-a-rest-the-sabbath-keeping-of-the-people-of-elohim-genesis-2  (Tanakh + Extras)
--   7922 hebrews-4-to-day-if-ye-will-hear-his-voice-harden-not-your-hearts-psalm-95              (Tanakh)
--   7923 hebrews-4-the-word-of-elohim-is-quick-and-powerful-sharper-than-a-twoedged-sword         (Tanakh)
--   7924 hebrews-4-a-great-high-priest-touched-with-the-feeling-of-our-infirmities-the-throne-of-grace  (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s222_h04_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: hebrews-4-there-remaineth-a-rest-the-sabbath-keeping-of-the-people-of-elohim-genesis-2
  ('canon', 'hebrews', 4, 4, 'canon', 'genesis', 2, 2, 'free', E'*And on the seventh day Elohim (God) ended his work which he had made; and he rested on the seventh day from all his work which he had made.* (Genesis 2:2). The writer reaches back to creation for his proof: *For he spake in a certain place of the seventh day on this wise, And Elohim (God) did rest the seventh day from all his works* (Hebrews 4:4). The rest Hebrews holds out is no new thing — it is the rest Elohim (God) himself entered on the seventh day at the foundation of the world, the pattern set into creation before ever a commandment was written on stone.'),
  ('canon', 'hebrews', 4, 4, 'canon', 'genesis', 2, 3, 'free', E'*And Elohim (God) blessed the seventh day, and sanctified it: because that in it he had rested from all his work which Elohim (God) created and made.* (Genesis 2:3). Elohim (God) did not merely cease on the seventh day; he *blessed* it and *sanctified* it — set it apart. So when Hebrews says *there remaineth therefore a rest to the people of Elohim (God)* (Hebrews 4:9), the rest that remains is bound to the day Elohim hallowed at creation: the weekly Sabbath is the sign and foretaste of the eternal rest, not a shadow discarded.'),
  ('canon', 'hebrews', 4, 4, 'jubilees', 'jubilees', 2, 1, 'extras', E'*Write the complete history of the creation, how in six days Yahuah Elohim (the LORD God) finished all His works and all that He created, and kept Sabbath on the seventh day and hallowed it for all ages, and appointed it as a sign for all His works.* (Jubilees 2:1). The same creation Sabbath Hebrews appeals to — *Elohim (God) did rest the seventh day from all his works* (Hebrews 4:4) — is here named *hallowed for all ages* and *a sign for all His works.* The seventh-day rest was woven into creation as a perpetual sign, the very rest into which *he that is entered... hath ceased from his own works, as Elohim (God) did from his* (Hebrews 4:10).'),
  ('canon', 'hebrews', 4, 10, 'canon', 'genesis', 2, 2, 'free', E'*And on the seventh day Elohim (God) ended his work which he had made; and he rested on the seventh day from all his work which he had made.* (Genesis 2:2). *For he that is entered into his rest, he also hath ceased from his own works, as Elohim (God) did from his* (Hebrews 4:10). The believer''s entering rest is measured by the creation pattern itself — to cease from one''s own works *as Elohim (God) did* on the seventh day. The Sabbath rest of Genesis is the template; the eternal rest is its fulfilment, the day kept pointing to the rest that remains.'),
  ('canon', 'hebrews', 4, 9, 'jubilees', 'jubilees', 2, 19, 'extras', E'*Behold, I will separate to Myself a people from among all the peoples, and these will keep the Sabbath day, and I will sanctify them to Myself as My people, and will bless them; as I have sanctified the Sabbath day and do sanctify (it) to Myself, even so shall I bless them, and they will be My people and I shall be their Elohim (God).* (Jubilees 2:19). Hebrews says *there remaineth therefore a rest to the people of Elohim (God)* (Hebrews 4:9) — and here that very people is named as the people who *keep the Sabbath day,* sanctified to Elohim as his own. The keeping-of-sabbath and the people of Elohim are bound together: the Sabbath marks the people for whom the rest remains.'),
  ('canon', 'hebrews', 4, 9, 'jubilees', 'jubilees', 2, 30, 'extras', E'*for that day is more holy and blessed than any jubilee day of the jubilees: on this we kept Sabbath in the heavens before it was made known to any flesh to keep Sabbath thereon on the earth.* (Jubilees 2:30). The Sabbath was kept *in the heavens* before it was given to flesh on earth — a heavenly rest of which the earthly day is the appointed echo. So Hebrews can say *there remaineth therefore a rest to the people of Elohim (God)* (Hebrews 4:9): the weekly Sabbath was always the sign of a rest that reaches into the heavens, the eternal rest into which the believer enters.'),
  -- thread: hebrews-4-to-day-if-ye-will-hear-his-voice-harden-not-your-hearts-psalm-95
  ('canon', 'hebrews', 4, 3, 'canon', 'psalms', 95, 11, 'free', E'*Unto whom I sware in my wrath that they should not enter into my rest.* (Psalm 95:11). Hebrews quotes the oath directly: *For we which have believed do enter into rest, as he said, As I have sworn in my wrath, if they shall enter into my rest* (Hebrews 4:3). The wilderness generation was shut out of the rest by the oath of Elohim''s wrath — yet *the works were finished from the foundation of the world* (Hebrews 4:3), so the rest itself stood ready. The forfeit was theirs, not the rest''s; the promise remains open.'),
  ('canon', 'hebrews', 4, 7, 'canon', 'psalms', 95, 7, 'free', E'*For he is our Elohim (God); and we are the people of his pasture, and the sheep of his hand. To day if ye will hear his voice,* (Psalm 95:7). *Again, he limiteth a certain day, saying in David, To day, after so long a time; as it is said, To day if ye will hear his voice, harden not your hearts* (Hebrews 4:7). The psalm''s *to day* is still sounding — long after David spoke it, the day of hearing stands open. The sheep of his hand are summoned now, while it is called *to day,* before the heart hardens.'),
  ('canon', 'hebrews', 4, 7, 'canon', 'psalms', 95, 8, 'free', E'*Harden not your heart, as in the provocation, and as in the day of temptation in the wilderness:* (Psalm 95:8). The warning Hebrews carries from chapter 3 into chapter 4 — *To day if ye will hear his voice, harden not your hearts* (Hebrews 4:7) — is the psalm''s own charge against the wilderness hardening. The same unbelief that barred the fathers from the land threatens still: *let us labour therefore to enter into that rest, lest any man fall after the same example of unbelief* (Hebrews 4:11).'),
  -- thread: hebrews-4-the-word-of-elohim-is-quick-and-powerful-sharper-than-a-twoedged-sword
  ('canon', 'hebrews', 4, 12, 'canon', 'isaiah', 49, 2, 'free', E'*And he hath made my mouth like a sharp sword; in the shadow of his hand hath he hid me, and made me a polished shaft; in his quiver hath he hid me;* (Isaiah 49:2). *For the word of Elohim (God) is quick, and powerful, and sharper than any twoedged sword* (Hebrews 4:12). The servant''s mouth made *like a sharp sword* is the word that cuts; in Hebrews the word of Elohim is that very blade, *piercing even to the dividing asunder of soul and spirit* — the speech of Elohim is not dull or dead but a living edge.'),
  ('canon', 'hebrews', 4, 12, 'canon', 'isaiah', 55, 11, 'free', E'*So shall my word be that goeth forth out of my mouth: it shall not return unto me void, but it shall accomplish that which I please, and it shall prosper in the thing whereto I sent it.* (Isaiah 55:11). The word that *goeth forth* and accomplishes is the word Hebrews calls *quick, and powerful* (Hebrews 4:12). It does its work without fail — and that work reaches the inmost man, *a discerner of the thoughts and intents of the heart,* so that *all things are naked and opened unto the eyes of him with whom we have to do* (Hebrews 4:13).'),
  -- thread: hebrews-4-a-great-high-priest-touched-with-the-feeling-of-our-infirmities-the-throne-of-grace
  ('canon', 'hebrews', 4, 15, 'canon', 'isaiah', 53, 3, 'free', E'*He is despised and rejected of men; a man of sorrows, and acquainted with grief: and we hid as it were our faces from him; he was despised, and we esteemed him not.* (Isaiah 53:3). *For we have not an high priest which cannot be touched with the feeling of our infirmities; but was in all points tempted like as we are, yet without sin* (Hebrews 4:15). The priest who can be *touched with the feeling of our infirmities* is the servant who was *a man of sorrows, and acquainted with grief* — he knows the weakness of the flesh from within, having borne it himself, and so can succour those who carry it.'),
  ('canon', 'hebrews', 4, 15, 'canon', 'isaiah', 53, 4, 'free', E'*Surely he hath borne our griefs, and carried our sorrows: yet we did esteem him stricken, smitten of Elohim (God), and afflicted.* (Isaiah 53:4). The high priest *touched with the feeling of our infirmities* (Hebrews 4:15) is the one who *hath borne our griefs, and carried our sorrows.* Because he carried them, the call goes out: *Let us therefore come boldly unto the throne of grace, that we may obtain mercy, and find grace to help in time of need* (Hebrews 4:16) — the priest who bore our sorrows opens the way to the throne.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s222_h04_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s222_h04_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-4-there-remaineth-a-rest-the-sabbath-keeping-of-the-people-of-elohim-genesis-2',
       E'There remaineth a rest — the keeping of sabbath to the people of Elohim — Genesis 2',
       E'This is the chapter the pulpit has used to retire the Sabbath; read plainly, it does the opposite. *There remaineth therefore a rest to the people of Elohim (God)* (Hebrews 4:9) — the word is a keeping-of-sabbath, a sabbatismos — and the writer grounds it in creation itself: *For he spake in a certain place of the seventh day on this wise, And Elohim (God) did rest the seventh day from all his works* (Hebrews 4:4). That is Genesis word for word: *And on the seventh day Elohim (God) ended his work which he had made; and he rested on the seventh day from all his work which he had made* (Genesis 2:2). And Elohim did not merely cease — *And Elohim (God) blessed the seventh day, and sanctified it: because that in it he had rested from all his work which Elohim (God) created and made* (Genesis 2:3). The rest Hebrews holds out is the rest Elohim himself entered and hallowed at the foundation of the world. The measure of entering it is the creation pattern: *For he that is entered into his rest, he also hath ceased from his own works, as Elohim (God) did from his* (Hebrews 4:10). The witness of Jubilees says the same — the Sabbath was *hallowed for all ages, and appointed... a sign for all His works* (Jubilees 2:1); the people who *keep the Sabbath day* are the people Elohim *sanctified to Myself as My people* (Jubilees 2:19); and the day was kept *in the heavens before it was made known to any flesh to keep Sabbath thereon on the earth* (Jubilees 2:30). The weekly Sabbath is the sign and foretaste of the eternal rest — the rest the day has always pointed to. Hebrews does not annul the commandment; it tells the people of Elohim that the rest the Sabbath signs is still open, and bids them *labour therefore to enter into that rest, lest any man fall after the same example of unbelief* (Hebrews 4:11).',
       sv.verse_id, ev.verse_id, 'extras', 7921
  FROM _s222_h04_lookup sv, _s222_h04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=4 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=4 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-4-to-day-if-ye-will-hear-his-voice-harden-not-your-hearts-psalm-95',
       E'To day if ye will hear his voice, harden not your hearts — Psalm 95',
       E'The warning of Psalm 95 carries straight from chapter 3 into chapter 4, and the writer presses its urgency. The oath that shut the wilderness generation out is quoted first: *For we which have believed do enter into rest, as he said, As I have sworn in my wrath, if they shall enter into my rest: although the works were finished from the foundation of the world* (Hebrews 4:3), which is the psalm''s close — *Unto whom I sware in my wrath that they should not enter into my rest* (Psalm 95:11). The rest itself stood ready from creation; the fathers forfeited it not because the rest failed but because *the word preached did not profit them, not being mixed with faith* (Hebrews 4:2). So the *to day* still sounds: *Again, he limiteth a certain day, saying in David, To day, after so long a time; as it is said, To day if ye will hear his voice, harden not your hearts* (Hebrews 4:7) — the very words of the psalm, *For he is our Elohim (God); and we are the people of his pasture, and the sheep of his hand. To day if ye will hear his voice, Harden not your heart, as in the provocation, and as in the day of temptation in the wilderness* (Psalm 95:7-8). Long after David spoke it, the day of hearing stands open, and the same unbelief that barred the fathers threatens still. The summons is now, while it is called *to day,* before the heart hardens: *Let us labour therefore to enter into that rest, lest any man fall after the same example of unbelief* (Hebrews 4:11).',
       sv.verse_id, ev.verse_id, 'free', 7922
  FROM _s222_h04_lookup sv, _s222_h04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=4 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=4 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-4-the-word-of-elohim-is-quick-and-powerful-sharper-than-a-twoedged-sword',
       E'The word of Elohim is quick and powerful, sharper than a twoedged sword',
       E'The word that calls *to day* is no dead letter. *For the word of Elohim (God) is quick, and powerful, and sharper than any twoedged sword, piercing even to the dividing asunder of soul and spirit, and of the joints and marrow, and is a discerner of the thoughts and intents of the heart* (Hebrews 4:12). The prophets had already shown the word as a living blade: the servant says *he hath made my mouth like a sharp sword; in the shadow of his hand hath he hid me, and made me a polished shaft* (Isaiah 49:2) — the speech of Elohim cuts. And it never fails of its work: *So shall my word be that goeth forth out of my mouth: it shall not return unto me void, but it shall accomplish that which I please, and it shall prosper in the thing whereto I sent it* (Isaiah 55:11). That accomplishing word reaches the inmost man, so that *neither is there any creature that is not manifest in his sight: but all things are naked and opened unto the eyes of him with whom we have to do* (Hebrews 4:13). The same word that pierces and divides is the word that summons to the rest — and it discerns whether the hearing is mixed with faith or hardened in unbelief.',
       sv.verse_id, ev.verse_id, 'free', 7923
  FROM _s222_h04_lookup sv, _s222_h04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=4 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=4 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-4-a-great-high-priest-touched-with-the-feeling-of-our-infirmities-the-throne-of-grace',
       E'A great high priest touched with the feeling of our infirmities — the throne of grace',
       E'The chapter ends at the throne of grace, and the priest who stands there is the suffering servant of Isaiah. *Seeing then that we have a great high priest, that is passed into the heavens, Yahusha (Jesus) the Son of Elohim (God), let us hold fast our profession* (Hebrews 4:14). He is no remote priest: *For we have not an high priest which cannot be touched with the feeling of our infirmities; but was in all points tempted like as we are, yet without sin* (Hebrews 4:15). The one who can be touched with our infirmities is the servant who was *despised and rejected of men; a man of sorrows, and acquainted with grief* (Isaiah 53:3) — he knows the weakness of the flesh from within, having borne it. More than that, *Surely he hath borne our griefs, and carried our sorrows: yet we did esteem him stricken, smitten of Elohim (God), and afflicted* (Isaiah 53:4). Because he carried our griefs and was tempted in all points yet without sin, the way to the throne is opened: *Let us therefore come boldly unto the throne of grace, that we may obtain mercy, and find grace to help in time of need* (Hebrews 4:16). The merciful priest who bore the sorrows is the one through whom mercy and timely grace are found.',
       sv.verse_id, ev.verse_id, 'free', 7924
  FROM _s222_h04_lookup sv, _s222_h04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=4 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=4 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: hebrews-4-there-remaineth-a-rest-the-sabbath-keeping-of-the-people-of-elohim-genesis-2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 2:2 — *he rested on the seventh day from all his work which he had made* the creation rest Hebrews quotes as proof, Elohim resting the seventh day (Hebrews 4:4).'
  FROM cross_reference_threads t, cross_references x, _s222_h04_lookup sv, _s222_h04_lookup tv
 WHERE t.slug='hebrews-4-there-remaineth-a-rest-the-sabbath-keeping-of-the-people-of-elohim-genesis-2'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=4 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 2:3 — *Elohim (God) blessed the seventh day, and sanctified it* the day was hallowed and set apart, the sign of the rest that remains (Hebrews 4:9).'
  FROM cross_reference_threads t, cross_references x, _s222_h04_lookup sv, _s222_h04_lookup tv
 WHERE t.slug='hebrews-4-there-remaineth-a-rest-the-sabbath-keeping-of-the-people-of-elohim-genesis-2'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=4 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 2:1 — *kept Sabbath on the seventh day and hallowed it for all ages, and appointed it as a sign for all His works* the creation Sabbath named a perpetual sign (Hebrews 4:4).'
  FROM cross_reference_threads t, cross_references x, _s222_h04_lookup sv, _s222_h04_lookup tv
 WHERE t.slug='hebrews-4-there-remaineth-a-rest-the-sabbath-keeping-of-the-people-of-elohim-genesis-2'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=4 AND sv.verse_number=4
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=2 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 2:19 — *these will keep the Sabbath day, and I will sanctify them to Myself as My people* the people of Elohim are the Sabbath-keeping people for whom the rest remains (Hebrews 4:9).'
  FROM cross_reference_threads t, cross_references x, _s222_h04_lookup sv, _s222_h04_lookup tv
 WHERE t.slug='hebrews-4-there-remaineth-a-rest-the-sabbath-keeping-of-the-people-of-elohim-genesis-2'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=4 AND sv.verse_number=9
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=2 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 2:30 — *on this we kept Sabbath in the heavens before it was made known to any flesh* the heavenly rest the earthly day echoes, the rest that remains (Hebrews 4:9).'
  FROM cross_reference_threads t, cross_references x, _s222_h04_lookup sv, _s222_h04_lookup tv
 WHERE t.slug='hebrews-4-there-remaineth-a-rest-the-sabbath-keeping-of-the-people-of-elohim-genesis-2'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=4 AND sv.verse_number=9
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=2 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Genesis 2:2 — *he rested on the seventh day from all his work* the creation pattern measures the entering rest, to cease as Elohim did (Hebrews 4:10).'
  FROM cross_reference_threads t, cross_references x, _s222_h04_lookup sv, _s222_h04_lookup tv
 WHERE t.slug='hebrews-4-there-remaineth-a-rest-the-sabbath-keeping-of-the-people-of-elohim-genesis-2'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=4 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hebrews-4-to-day-if-ye-will-hear-his-voice-harden-not-your-hearts-psalm-95
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 95:11 — *I sware in my wrath that they should not enter into my rest* the oath that shut out the wilderness generation, quoted by Hebrews (Hebrews 4:3).'
  FROM cross_reference_threads t, cross_references x, _s222_h04_lookup sv, _s222_h04_lookup tv
 WHERE t.slug='hebrews-4-to-day-if-ye-will-hear-his-voice-harden-not-your-hearts-psalm-95'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=4 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=95 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 95:7 — *To day if ye will hear his voice* the day of hearing still open, the sheep of his hand summoned now (Hebrews 4:7).'
  FROM cross_reference_threads t, cross_references x, _s222_h04_lookup sv, _s222_h04_lookup tv
 WHERE t.slug='hebrews-4-to-day-if-ye-will-hear-his-voice-harden-not-your-hearts-psalm-95'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=4 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=95 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 95:8 — *Harden not your heart, as in the provocation* the wilderness hardening that barred the fathers, the warning carried into chapter 4 (Hebrews 4:7).'
  FROM cross_reference_threads t, cross_references x, _s222_h04_lookup sv, _s222_h04_lookup tv
 WHERE t.slug='hebrews-4-to-day-if-ye-will-hear-his-voice-harden-not-your-hearts-psalm-95'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=4 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=95 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hebrews-4-the-word-of-elohim-is-quick-and-powerful-sharper-than-a-twoedged-sword
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 49:2 — *he hath made my mouth like a sharp sword* the word as a living blade, sharper than any twoedged sword (Hebrews 4:12).'
  FROM cross_reference_threads t, cross_references x, _s222_h04_lookup sv, _s222_h04_lookup tv
 WHERE t.slug='hebrews-4-the-word-of-elohim-is-quick-and-powerful-sharper-than-a-twoedged-sword'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=4 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=49 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 55:11 — *my word... shall not return unto me void, but it shall accomplish that which I please* the word quick and powerful that does its work and discerns the heart (Hebrews 4:12-13).'
  FROM cross_reference_threads t, cross_references x, _s222_h04_lookup sv, _s222_h04_lookup tv
 WHERE t.slug='hebrews-4-the-word-of-elohim-is-quick-and-powerful-sharper-than-a-twoedged-sword'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=4 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=55 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hebrews-4-a-great-high-priest-touched-with-the-feeling-of-our-infirmities-the-throne-of-grace
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 53:3 — *a man of sorrows, and acquainted with grief* the priest touched with the feeling of our infirmities knows the flesh from within (Hebrews 4:15).'
  FROM cross_reference_threads t, cross_references x, _s222_h04_lookup sv, _s222_h04_lookup tv
 WHERE t.slug='hebrews-4-a-great-high-priest-touched-with-the-feeling-of-our-infirmities-the-throne-of-grace'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=4 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 53:4 — *Surely he hath borne our griefs, and carried our sorrows* because he carried our sorrows the way to the throne of grace is opened (Hebrews 4:16).'
  FROM cross_reference_threads t, cross_references x, _s222_h04_lookup sv, _s222_h04_lookup tv
 WHERE t.slug='hebrews-4-a-great-high-priest-touched-with-the-feeling-of-our-infirmities-the-throne-of-grace'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=4 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
