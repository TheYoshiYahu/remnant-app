-- ----- fragment: minion_1thessalonians_01.sql (S233 1 Thessalonians 1) -----
-- =====================================================================
-- S233 minion — 1 THESSALONIANS 1 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 1 THESSALONIANS 1 (10 verses) — the thanksgiving and the threefold remembrance:
--   election (v.4), turned from idols to the living and true Elohim (v.9), and the wait for his Son
--   from heaven whom the Father raised, who delivers from the wrath to come (v.10).
-- Tag: t101 (temp view _s233_t101_lookup).
-- Sort band: floor 8050, step 3 (8050, 8053, 8056 used; under 8075).
-- Source is ALWAYS the canon 1 Thessalonians verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME: Paul, Silvanus, and Timotheus write to the called-out ones at Thessalonica — the
-- gathered seed who *turned to Elohim (God) from idols to serve the living and true Elohim (God)*
-- (1:9). The thanksgiving rehearses the covenant pattern of Yashar'el (Israel): election (1:4), the
-- one living Elohim against the dead idols (1:9), and the hope that waits for the Son the Father
-- raised (1:10). Christology guard (the Formed): *wait for his Son from heaven, whom he raised from
-- the dead, even Yahusha (Jesus), which delivered us from the wrath to come* (1:10) — the FATHER
-- raised and sends the Son; the Son is the Formed, exalted, who returns to deliver. No co-equal-
-- persons grammar, no modalist collapse. The wrath-to-come is the day of Yahuah of the prophets, and
-- the deliverance is the protection of the elect in the day of tribulation. No replacement theology:
-- the election of v.4 is the same election of Yashar'el (Israel), now confessed by the grafted-in.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-3  greeting; work of faith, labour of love, patience of hope
--          Tanakh: none warranted   Extras: none warranted
--          NT: none warranted (the faith/love/hope triad is carried in the chapter's prose, not a
--              single load-bearing target verse)
--   v.4    your election of Elohim (God)
--          Tanakh: Deuteronomy 7:6 (Yahuah hath chosen thee to be a special people), 7:7 (not because
--                  ye were more in number), 7:8 (because Yahuah loved you)
--          Extras: none warranted   NT: none warranted (the election root is the Tanakh of Israel)
--   v.5-8  the gospel came in power and in the Ruach HaKodesh; ye became followers, ensamples; the
--          word of Yahuah sounded out
--          Tanakh: none warranted   Extras: none warranted   NT: none warranted (no single
--                  load-bearing parallel; the spreading word is reported, not quoted)
--   v.9    ye turned to Elohim (God) from idols to serve the living and true Elohim (God)
--          Tanakh: Jeremiah 10:10 (Yahuah is the true Elohim, the living Elohim), Isaiah 44:9-10
--                  (they that make a graven image are all of them vanity), Isaiah 44:17 (Deliver me;
--                  for thou art my god), Deuteronomy 32:39 (I, even I, am he, and there is no god
--                  with me)
--          Extras: none warranted   NT: none warranted (the idols-vs-living-Elohim root is Tanakh)
--   v.10   wait for his Son from heaven, whom he raised from the dead... which delivered us from the
--          wrath to come
--          Tanakh: Daniel 12:1 (thy people shall be delivered, written in the book), Daniel 12:2
--                  (many that sleep in the dust shall awake), Zephaniah 1:14-15 (the great day of
--                  Yahuah... a day of wrath)
--          Extras: 1 Enoch 1:8 (with the righteous He will make peace, and will protect the elect),
--                  1 Enoch 5:7 (to the righteous He will grant peace, and He will protect the elect)
--          NT: 1 Corinthians 1:7 (waiting for the coming of our Lord Yahusha HaMashiach)
--
-- THREADS (slug -> target libraries):
--   8050 1-thessalonians-1-your-election-of-elohim-the-chosen-and-special-people-deuteronomy-7  (Tanakh)
--   8053 1-thessalonians-1-turned-from-idols-to-the-living-and-true-elohim-jeremiah-10-isaiah-44  (Tanakh)
--   8056 1-thessalonians-1-wait-for-his-son-whom-he-raised-delivered-from-the-wrath-to-come-daniel-12-zephaniah-1  (Tanakh + Extras + NT)
-- =====================================================================

CREATE TEMP VIEW _s233_t101_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-thessalonians-1-your-election-of-elohim-the-chosen-and-special-people-deuteronomy-7
  ('canon', '1-thessalonians', 1, 4, 'canon', 'deuteronomy', 7, 6, 'free', E'*For thou art an holy people unto Yahuah Elohayka (the LORD thy God): Yahuah Elohayka (the LORD thy God) hath chosen thee to be a special people unto himself, above all people that are upon the face of the earth.* (Deuteronomy 7:6). Paul says he knows the Thessalonians'' *election of Elohim (God)* (1 Thessalonians 1:4) — and election is the covenant word spoken over Yashar''el (Israel) from the beginning: Yahuah (LORD) *hath chosen thee to be a special people unto himself.* The grafted-in seed at Thessalonica are brought into the same choosing; this is not a new people displacing Yashar''el (Israel) but the called-out ones gathered into the election of Yashar''el (Israel).'),
  ('canon', '1-thessalonians', 1, 4, 'canon', 'deuteronomy', 7, 7, 'free', E'*Yahuah (LORD) did not set his love upon you, nor choose you, because ye were more in number than any people; for ye were the fewest of all people:* (Deuteronomy 7:7). The election Paul names — *your election of Elohim (God)* (1 Thessalonians 1:4) — rests on nothing in the chosen themselves; Yahuah (LORD) *did not... choose you, because ye were more in number,* but for his own love. So the Thessalonians are chosen not by their worth but by the same free love that set itself on Yashar''el (Israel), confirmed in *power, and in the Ruach HaKodesh (Holy Spirit)* (1 Thessalonians 1:5).'),
  ('canon', '1-thessalonians', 1, 4, 'canon', 'deuteronomy', 7, 8, 'free', E'*But because Yahuah (LORD) loved you, and because he would keep the oath which he had sworn unto your fathers, hath Yahuah (LORD) brought you out with a mighty hand, and redeemed you out of the house of bondmen, from the hand of Pharaoh king of Egypt.* (Deuteronomy 7:8). The ground of election is the love and the sworn oath of Yahuah (LORD): *because Yahuah (LORD) loved you, and because he would keep the oath which he had sworn unto your fathers.* Paul names the Thessalonians *brethren beloved* and knows *your election of Elohim (God)* (1 Thessalonians 1:4) — beloved and chosen on the same ground, the love of Elohim (God) and the covenant kept, the redeeming hand that brought Yashar''el (Israel) out of bondage now gathering the nations into the elect.'),
  -- thread: 1-thessalonians-1-turned-from-idols-to-the-living-and-true-elohim-jeremiah-10-isaiah-44
  ('canon', '1-thessalonians', 1, 9, 'canon', 'jeremiah', 10, 10, 'free', E'*But Yahuah (LORD) is the true Elohim (God), he is the living Elohim (God), and an everlasting king: at his wrath the earth shall tremble, and the nations shall not be able to abide his indignation.* (Jeremiah 10:10). Paul reports how the Thessalonians *turned to Elohim (God) from idols to serve the living and true Elohim (God)* (1 Thessalonians 1:9) — the very confession of Jeremiah against the idols of the nations: *Yahuah (LORD) is the true Elohim (God), he is the living Elohim (God), and an everlasting king.* The turning from idols to the living Elohim (God) is the turning Jeremiah preached; the living-and-true Elohim (God) they now serve is the One whose wrath makes the earth tremble — the wrath from which the next verse says the Son delivers (1 Thessalonians 1:10).'),
  ('canon', '1-thessalonians', 1, 9, 'canon', 'isaiah', 44, 9, 'free', E'*They that make a graven image are all of them vanity; and their delectable things shall not profit; and they are their own witnesses; they see not, nor know; that they may be ashamed.* (Isaiah 44:9). The idols the Thessalonians abandoned are the very vanities Isaiah exposes: *they that make a graven image are all of them vanity... they see not, nor know.* To *turn to Elohim (God) from idols to serve the living and true Elohim (God)* (1 Thessalonians 1:9) is to forsake the blind, dead images of the workman''s hands — things that cannot see, cannot know, cannot save — for the One who is living and true.'),
  ('canon', '1-thessalonians', 1, 9, 'canon', 'isaiah', 44, 17, 'free', E'*And the residue thereof he maketh a god, even his graven image: he falleth down unto it, and worshippeth it, and prayeth unto it, and saith, Deliver me; for thou art my god.* (Isaiah 44:17). Isaiah lays bare the folly of idolatry: a man burns half a log for fire and from the rest *maketh a god... and prayeth unto it, and saith, Deliver me; for thou art my god.* This is the idol-bondage the Thessalonians left when they *turned to Elohim (God) from idols to serve the living and true Elohim (God)* (1 Thessalonians 1:9). The block of wood that cannot deliver is exchanged for the living Elohim (God) whose Son *delivered us from the wrath to come* (1 Thessalonians 1:10) — true deliverance for the false.'),
  ('canon', '1-thessalonians', 1, 9, 'canon', 'deuteronomy', 32, 39, 'free', E'*See now that I, even I, am he, and there is no god with me: I kill, and I make alive; I wound, and I heal: neither is there any that can deliver out of my hand.* (Deuteronomy 32:39). The Song of Moses sets the living Elohim (God) over against the dead gods of the nations: *I, even I, am he, and there is no god with me... I kill, and I make alive.* When the Thessalonians *turned to Elohim (God) from idols to serve the living and true Elohim (God)* (1 Thessalonians 1:9), they turned to this One — the only One who makes alive, the same Elohim (God) who *raised* the Son *from the dead* (1 Thessalonians 1:10); the idols neither kill nor make alive, but the living Elohim (God) does both.'),
  -- thread: 1-thessalonians-1-wait-for-his-son-whom-he-raised-delivered-from-the-wrath-to-come-daniel-12-zephaniah-1
  ('canon', '1-thessalonians', 1, 10, 'canon', 'daniel', 12, 1, 'free', E'*And at that time shall Michael stand up, the great prince which standeth for the children of thy people: and there shall be a time of trouble, such as never was since there was a nation even to that same time: and at that time thy people shall be delivered, every one that shall be found written in the book.* (Daniel 12:1). The wait of the Thessalonians — *to wait for his Son from heaven... which delivered us from the wrath to come* (1 Thessalonians 1:10) — is the deliverance Daniel saw at the end: *at that time thy people shall be delivered, every one that shall be found written in the book.* The wrath-to-come is the *time of trouble, such as never was,* and the Son from heaven is the One who delivers the people written in the book; the deliverance Paul preaches is the deliverance of Daniel''s prophecy.'),
  ('canon', '1-thessalonians', 1, 10, 'canon', 'daniel', 12, 2, 'free', E'*And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* (Daniel 12:2). The Son the Thessalonians wait for is the One *whom he raised from the dead* (1 Thessalonians 1:10) — the firstfruits of the resurrection Daniel foretold: *many of them that sleep in the dust of the earth shall awake.* The Father raised the Son first, and in him the sleeping dust shall awake to everlasting life. To wait for the Son from heaven is to wait in the hope of this awakening — the resurrection of Daniel, opened by the One the Father raised.'),
  ('canon', '1-thessalonians', 1, 10, 'canon', 'zephaniah', 1, 15, 'free', E'*That day is a day of wrath, a day of trouble and distress, a day of wasteness and desolation, a day of darkness and gloominess, a day of clouds and thick darkness,* (Zephaniah 1:15). The *wrath to come* from which the Son delivers (1 Thessalonians 1:10) is the day of Yahuah (LORD) the prophets named: *that day is a day of wrath, a day of trouble and distress... a day of darkness and gloominess.* The Thessalonians wait for the Son from heaven precisely as those *delivered... from the wrath to come* — kept through the day of wrath that falls on the ungodly, the great and terrible day of Yahuah (LORD).'),
  ('canon', '1-thessalonians', 1, 10, 'enoch', '1-enoch', 1, 8, 'extras', E'*But with the righteous He will make peace. And will protect the elect, And mercy shall be upon them. And they shall all belong to Elohim (God), And they shall be prospered, And they shall all be blessed. And He will help them all, And light shall appear unto them, And He will make peace with them.* (1 Enoch 1:8). The Hebrew library knew the same hope: in the day of judgment, when the wicked are removed, *with the righteous He will make peace, And will protect the elect.* The Thessalonians, *delivered... from the wrath to come* (1 Thessalonians 1:10), are the protected elect of Enoch''s blessing — the wrath consumes the ungodly, but the elect are kept, blessed, and given light. The wait for the Son from heaven is the wait for that protecting peace.'),
  ('canon', '1-thessalonians', 1, 10, 'enoch', '1-enoch', 5, 7, 'extras', E'*But to the righteous and holy He will grant peace, and He will protect the elect, and compassion shall be upon them; and they shall all belong to Elohim (God), and they shall be prospered, and they shall all be blessed. And He will help them all, and light shall appear unto them, and He will make peace with them.* (1 Enoch 5:7). Set against the hard-hearted who *shall find no peace,* the library promises that *to the righteous and holy He will grant peace, and He will protect the elect.* This is the deliverance the Thessalonians await — *his Son from heaven... which delivered us from the wrath to come* (1 Thessalonians 1:10). The elect are not appointed to the wrath but to be protected through it; the Son the Father raised is the One who brings the promised peace and light to those who belong to Elohim (God).'),
  ('canon', '1-thessalonians', 1, 10, 'canon', '1-corinthians', 1, 7, 'free', E'*So that ye come behind in no gift; waiting for the coming of our Lord Yahusha HaMashiach (Lord Jesus Christ):* (1 Corinthians 1:7). Paul gives the assemblies the same posture everywhere — *waiting for the coming of our Lord Yahusha HaMashiach (Lord Jesus Christ).* The Thessalonians too *wait for his Son from heaven... even Yahusha (Jesus)* (1 Thessalonians 1:10); the called-out ones are a people who wait, looking for the Son the Father raised and exalted, who returns to deliver from the wrath to come. The same hope, the same Son, the same expectant waiting.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s233_t101_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s233_t101_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-thessalonians-1-your-election-of-elohim-the-chosen-and-special-people-deuteronomy-7',
       E'Your election of Elohim (God) — the chosen and special people (Deuteronomy 7)',
       E'Paul tells the Thessalonians he knows *brethren beloved, your election of Elohim (God)* (1 Thessalonians 1:4). Election is no new thing spoken over a new people; it is the covenant word Yahuah (LORD) spoke over Yashar''el (Israel) at the founding: *thou art an holy people unto Yahuah Elohayka (the LORD thy God): Yahuah Elohayka (the LORD thy God) hath chosen thee to be a special people unto himself, above all people that are upon the face of the earth* (Deuteronomy 7:6). And the ground of that choosing was never worth or number: *Yahuah (LORD) did not set his love upon you, nor choose you, because ye were more in number than any people; for ye were the fewest of all people* (Deuteronomy 7:7); rather, *because Yahuah (LORD) loved you, and because he would keep the oath which he had sworn unto your fathers* (Deuteronomy 7:8). So the grafted-in seed at Thessalonica are *beloved* and *chosen* on the same ground that Yashar''el (Israel) was — the free love of Elohim (God) and the covenant kept, confirmed not in word only but *in power, and in the Ruach HaKodesh (Holy Spirit), and in much assurance* (1 Thessalonians 1:5). This is not a people displacing Yashar''el (Israel); it is the called-out ones gathered into the election of Yashar''el (Israel), the same special people unto himself.',
       sv.verse_id, ev.verse_id, 'free', 8050
  FROM _s233_t101_lookup sv, _s233_t101_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=1 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='1-thessalonians' AND ev.chapter_number=1 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-thessalonians-1-turned-from-idols-to-the-living-and-true-elohim-jeremiah-10-isaiah-44',
       E'Turned from idols to serve the living and true Elohim (God) (Jeremiah 10, Isaiah 44)',
       E'The mark of the Thessalonians'' conversion is the great prophetic turning: *ye turned to Elohim (God) from idols to serve the living and true Elohim (God)* (1 Thessalonians 1:9). This is the confession Jeremiah set against the dead gods of the nations: *Yahuah (LORD) is the true Elohim (God), he is the living Elohim (God), and an everlasting king: at his wrath the earth shall tremble* (Jeremiah 10:10) — the living and true Elohim (God) over against the idols that are the work of the workman''s hands. Isaiah lays bare their emptiness: *they that make a graven image are all of them vanity... they see not, nor know* (Isaiah 44:9), and the idolater takes a block of wood and *maketh a god... and prayeth unto it, and saith, Deliver me; for thou art my god* (Isaiah 44:17) — crying for deliverance to a thing that cannot deliver. And the Song of Moses draws the line sharpest: *I, even I, am he, and there is no god with me: I kill, and I make alive; I wound, and I heal: neither is there any that can deliver out of my hand* (Deuteronomy 32:39). To turn from idols to the living Elohim (God) is to turn from the dead and blind to the One who alone makes alive — the same Elohim (God) who *raised* his Son *from the dead,* whose living Son *delivered us from the wrath to come* (1 Thessalonians 1:10). The block of wood that cannot save is exchanged for the living Elohim (God) who does.',
       sv.verse_id, ev.verse_id, 'free', 8053
  FROM _s233_t101_lookup sv, _s233_t101_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=1 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='1-thessalonians' AND ev.chapter_number=1 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-thessalonians-1-wait-for-his-son-whom-he-raised-delivered-from-the-wrath-to-come-daniel-12-zephaniah-1',
       E'Wait for his Son whom he raised — delivered from the wrath to come (Daniel 12, Zephaniah 1, 1 Enoch)',
       E'The thanksgiving closes on the hope that defines the called-out ones: *to wait for his Son from heaven, whom he raised from the dead, even Yahusha (Jesus), which delivered us from the wrath to come* (1 Thessalonians 1:10). Mark the Christology: the FATHER raised the Son and sends him from heaven; the Son is the Formed, exalted, returning to deliver — not a co-equal person but the One whom Elohim (God) *raised from the dead.* And the Son the Father raised is the firstfruits of the resurrection Daniel foretold: *many of them that sleep in the dust of the earth shall awake, some to everlasting life* (Daniel 12:2); to wait for the Son from heaven is to wait in the hope of that awakening. The *wrath to come* is the day of Yahuah (LORD) the prophets named — *that day is a day of wrath, a day of trouble and distress, a day of wasteness and desolation, a day of darkness and gloominess* (Zephaniah 1:15) — and the deliverance is Daniel''s: *at that time thy people shall be delivered, every one that shall be found written in the book* (Daniel 12:1), kept through the time of trouble such as never was. The Hebrew library held the same hope: when the wicked and godless are removed, *with the righteous He will make peace, And will protect the elect, And mercy shall be upon them* (1 Enoch 1:8); *to the righteous and holy He will grant peace, and He will protect the elect* (1 Enoch 5:7) — the elect are not appointed to the wrath but protected through it. So the assemblies everywhere take the same posture, *waiting for the coming of our Lord Yahusha HaMashiach (Lord Jesus Christ)* (1 Corinthians 1:7): a people who wait for the Son the Father raised, looking for the deliverance of the people written in the book, kept from the wrath that consumes the ungodly.',
       sv.verse_id, ev.verse_id, 'extras', 8056
  FROM _s233_t101_lookup sv, _s233_t101_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=1 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='1-thessalonians' AND ev.chapter_number=1 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-thessalonians-1-your-election-of-elohim-the-chosen-and-special-people-deuteronomy-7
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 7:6 — *Yahuah Elohayka (the LORD thy God) hath chosen thee to be a special people unto himself* the covenant election of Yashar''el (Israel), into which the grafted-in are gathered; *your election of Elohim (God)* (1 Thessalonians 1:4).'
  FROM cross_reference_threads t, cross_references x, _s233_t101_lookup sv, _s233_t101_lookup tv
 WHERE t.slug='1-thessalonians-1-your-election-of-elohim-the-chosen-and-special-people-deuteronomy-7'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=1 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 7:7 — *did not... choose you, because ye were more in number* election rests on no worth in the chosen; the Thessalonians chosen by the same free love (1 Thessalonians 1:4-5).'
  FROM cross_reference_threads t, cross_references x, _s233_t101_lookup sv, _s233_t101_lookup tv
 WHERE t.slug='1-thessalonians-1-your-election-of-elohim-the-chosen-and-special-people-deuteronomy-7'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=1 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 7:8 — *because Yahuah (LORD) loved you, and because he would keep the oath* the love and sworn oath that ground election; *brethren beloved, your election of Elohim (God)* (1 Thessalonians 1:4).'
  FROM cross_reference_threads t, cross_references x, _s233_t101_lookup sv, _s233_t101_lookup tv
 WHERE t.slug='1-thessalonians-1-your-election-of-elohim-the-chosen-and-special-people-deuteronomy-7'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=1 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-thessalonians-1-turned-from-idols-to-the-living-and-true-elohim-jeremiah-10-isaiah-44
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 10:10 — *Yahuah (LORD) is the true Elohim (God), he is the living Elohim (God), and an everlasting king* the prophetic confession behind *the living and true Elohim (God)* (1 Thessalonians 1:9).'
  FROM cross_reference_threads t, cross_references x, _s233_t101_lookup sv, _s233_t101_lookup tv
 WHERE t.slug='1-thessalonians-1-turned-from-idols-to-the-living-and-true-elohim-jeremiah-10-isaiah-44'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=1 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=10 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 44:9 — *they that make a graven image are all of them vanity... they see not, nor know* the blind dead idols forsaken in the turning to the living Elohim (God) (1 Thessalonians 1:9).'
  FROM cross_reference_threads t, cross_references x, _s233_t101_lookup sv, _s233_t101_lookup tv
 WHERE t.slug='1-thessalonians-1-turned-from-idols-to-the-living-and-true-elohim-jeremiah-10-isaiah-44'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=1 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 44:17 — *maketh a god... and prayeth unto it, and saith, Deliver me; for thou art my god* the idol that cannot deliver, exchanged for the living Elohim (God) whose Son delivers (1 Thessalonians 1:9-10).'
  FROM cross_reference_threads t, cross_references x, _s233_t101_lookup sv, _s233_t101_lookup tv
 WHERE t.slug='1-thessalonians-1-turned-from-idols-to-the-living-and-true-elohim-jeremiah-10-isaiah-44'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=1 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Deuteronomy 32:39 — *I, even I, am he, and there is no god with me: I kill, and I make alive* the living Elohim (God) who alone makes alive, the One who raised the Son (1 Thessalonians 1:9-10).'
  FROM cross_reference_threads t, cross_references x, _s233_t101_lookup sv, _s233_t101_lookup tv
 WHERE t.slug='1-thessalonians-1-turned-from-idols-to-the-living-and-true-elohim-jeremiah-10-isaiah-44'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=1 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=39
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-thessalonians-1-wait-for-his-son-whom-he-raised-delivered-from-the-wrath-to-come-daniel-12-zephaniah-1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 12:1 — *at that time thy people shall be delivered, every one that shall be found written in the book* the deliverance through the time of trouble; *delivered us from the wrath to come* (1 Thessalonians 1:10).'
  FROM cross_reference_threads t, cross_references x, _s233_t101_lookup sv, _s233_t101_lookup tv
 WHERE t.slug='1-thessalonians-1-wait-for-his-son-whom-he-raised-delivered-from-the-wrath-to-come-daniel-12-zephaniah-1'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=1 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 12:2 — *many of them that sleep in the dust of the earth shall awake* the resurrection the Father opened in the Son *whom he raised from the dead* (1 Thessalonians 1:10).'
  FROM cross_reference_threads t, cross_references x, _s233_t101_lookup sv, _s233_t101_lookup tv
 WHERE t.slug='1-thessalonians-1-wait-for-his-son-whom-he-raised-delivered-from-the-wrath-to-come-daniel-12-zephaniah-1'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=1 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Zephaniah 1:15 — *that day is a day of wrath, a day of trouble and distress... a day of darkness and gloominess* the day of Yahuah (LORD), the *wrath to come* from which the Son delivers (1 Thessalonians 1:10).'
  FROM cross_reference_threads t, cross_references x, _s233_t101_lookup sv, _s233_t101_lookup tv
 WHERE t.slug='1-thessalonians-1-wait-for-his-son-whom-he-raised-delivered-from-the-wrath-to-come-daniel-12-zephaniah-1'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=1 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='zephaniah' AND tv.chapter_number=1 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 1:8 — *with the righteous He will make peace, And will protect the elect, And mercy shall be upon them* the elect protected when the wicked are removed; *delivered... from the wrath to come* (1 Thessalonians 1:10).'
  FROM cross_reference_threads t, cross_references x, _s233_t101_lookup sv, _s233_t101_lookup tv
 WHERE t.slug='1-thessalonians-1-wait-for-his-son-whom-he-raised-delivered-from-the-wrath-to-come-daniel-12-zephaniah-1'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=1 AND sv.verse_number=10
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=1 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Enoch 5:7 — *to the righteous and holy He will grant peace, and He will protect the elect* set against the hard-hearted who find no peace; the elect kept through the wrath (1 Thessalonians 1:10).'
  FROM cross_reference_threads t, cross_references x, _s233_t101_lookup sv, _s233_t101_lookup tv
 WHERE t.slug='1-thessalonians-1-wait-for-his-son-whom-he-raised-delivered-from-the-wrath-to-come-daniel-12-zephaniah-1'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=1 AND sv.verse_number=10
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=5 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'1 Corinthians 1:7 — *waiting for the coming of our Lord Yahusha HaMashiach (Lord Jesus Christ)* the same expectant posture of the called-out ones; *to wait for his Son from heaven* (1 Thessalonians 1:10).'
  FROM cross_reference_threads t, cross_references x, _s233_t101_lookup sv, _s233_t101_lookup tv
 WHERE t.slug='1-thessalonians-1-wait-for-his-son-whom-he-raised-delivered-from-the-wrath-to-come-daniel-12-zephaniah-1'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=1 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=1 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
