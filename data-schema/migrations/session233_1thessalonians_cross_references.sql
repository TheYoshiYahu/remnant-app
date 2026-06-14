-- =====================================================================
-- Session 233 — 1 Thessalonians FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py data-schema/migrations/session233_1thessalonians_cross_references.sql
-- =====================================================================

\echo 'session233 — 1 Thessalonians cross-references starting...'
BEGIN;

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

-- ----- fragment: minion_1thessalonians_02.sql (S233 1 Thessalonians 2) -----
-- =====================================================================
-- S233 minion — 1 THESSALONIANS 2 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 1 THESSALONIANS 2 (20 verses) — the apostle's manner among them, the word received as
--   the word of Elohim, the ⚠ persecutors who killed the Lord and the prophets, the crown of
--   rejoicing at his coming.
-- Tag: t102 (temp view _s233_t102_lookup).
-- Sort band: floor 8075, step 3 (8075, 8078, 8081, 8084 used; under 8100).
-- Source is ALWAYS the canon 1-thessalonians verse; targets span Tanakh + NT (no extras warranted).
-- Tiers per-row: canon target (Tanakh + NT) = 'free'.
--
-- GOVERNING FRAME: Paul, Silvanus and Timotheus write to the called-out ones at Thessalonica —
--   Yashar'el (Israel) and the grafted-in seed of the nations. ⚠ The high watchpoint is 2:14-16, the
--   verse-block about *the Yahudim (Jews): Who both killed the Lord Yahusha (Lord Jesus), and their own
--   prophets, and have persecuted us... for the wrath is come upon them to the uttermost.* This is NOT
--   a blanket curse on the Jewish people and NOT replacement theology. Paul is himself a Yahudi (Jew)
--   writing of the SPECIFIC persecutors — the same prophets-killed pattern the Tanakh and the Messiah
--   name (Nehemiah 9:26, 2 Chronicles 36:16, Matthew 23:31-37, Acts 7:52). The wrath falls on the
--   persecuting opposition, not on Israel-as-such — *Elohim (God) hath not cast away his people*
--   (Romans 11:1-2), woven in as the explicit guard. DO NOT render as "the Jews rejected / the church
--   replaces Israel."
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-11  the apostle's gentle, blameless, fatherly manner among them (not flattering, not covetous)
--           Tanakh: none warranted (the manner is descriptive; no load-bearing parallel)
--           Extras: none warranted   NT: none warranted
--   v.12    walk worthy of Elohim, who hath called you unto his kingdom and glory
--           Tanakh: Daniel 7:18, 7:27 (the saints take and possess the everlasting kingdom)
--           Extras: none warranted   NT: none warranted (the kingdom-call carried by Daniel 7)
--   v.13    ye received... not as the word of men, but as it is in truth, the word of Elohim
--           Tanakh: Jeremiah 1:9 (Behold, I have put my words in thy mouth), Deuteronomy 18:18
--                   (will put my words in his mouth... speak all that I shall command), Jeremiah
--                   15:16 (Thy words were found, and I did eat them)
--           Extras: none warranted   NT: none warranted (the prophetic-word root is the Tanakh)
--   v.14-16 ⚠ the persecutors: killed the Lord and their own prophets; the wrath come to the uttermost
--           Tanakh: Nehemiah 9:26 (slew thy prophets which testified against them), 2 Chronicles
--                   36:16 (misused his prophets, until the wrath of Yahuah arose)
--           Extras: none warranted   NT: Matthew 23:31 (children of them which killed the prophets),
--                   Matthew 23:37 (O Jerusalem... thou that killest the prophets), Acts 7:52 (which
--                   of the prophets have not your fathers persecuted?), Romans 11:1-2 (GUARD: Elohim
--                   hath not cast away his people)
--   v.17-18 taken from you for a short time... Satan hindered us
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted
--   v.19-20 our hope, joy, crown of rejoicing... in the presence of our Lord at his coming (parousia)
--           Tanakh: Isaiah 62:3 (a crown of glory in the hand of Yahuah), Daniel 12:3 (they that be
--                   wise shall shine... they that turn many to righteousness as the stars)
--           Extras: none warranted   NT: Philippians 4:1 (my brethren... my joy and crown)
--
-- THREADS (slug -> target libraries):
--   8075 1-thessalonians-2-ye-received-it-as-the-word-of-elohim-jeremiah-1-deuteronomy-18  (Tanakh)
--   8078 1-thessalonians-2-who-killed-the-lord-and-their-own-prophets-the-wrath-nehemiah-9-romans-11  (Tanakh + NT)  [⚠ WATCHPOINT]
--   8081 1-thessalonians-2-called-unto-his-kingdom-and-glory-daniel-7  (Tanakh)
--   8084 1-thessalonians-2-our-crown-of-rejoicing-at-his-coming-isaiah-62-daniel-12  (Tanakh + NT)
-- =====================================================================

CREATE TEMP VIEW _s233_t102_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-thessalonians-2-ye-received-it-as-the-word-of-elohim-jeremiah-1-deuteronomy-18
  ('canon', '1-thessalonians', 2, 13, 'canon', 'jeremiah', 1, 9, 'free', E'*Then Yahuah (LORD) put forth his hand, and touched my mouth. And Yahuah (LORD) said unto me, Behold, I have put my words in thy mouth.* (Jeremiah 1:9). When Yahuah (LORD) called Jeremiah, the word in the prophet''s mouth was not the prophet''s own but Yahuah''s — *I have put my words in thy mouth.* This is why Paul gives thanks that the Thessalonians *received the word of Elohim (God) which ye heard of us, ye received it not as the word of men, but as it is in truth, the word of Elohim (God)* (1 Thessalonians 2:13). The apostle stands in the prophets'' line: what he speaks is the word Elohim (God) put in his mouth, and the hearers rightly took it as the word of Elohim (God), *which effectually worketh also in you that believe.*'),
  ('canon', '1-thessalonians', 2, 13, 'canon', 'deuteronomy', 18, 18, 'free', E'*I will raise them up a Prophet from among their brethren, like unto thee, and will put my words in his mouth; and he shall speak unto them all that I shall command him.* (Deuteronomy 18:18). The pattern of the true messenger is set at Horeb: Yahuah (LORD) *will put my words in his mouth,* and he speaks not his own but *all that I shall command him.* So the word the Thessalonians received through Paul was not the word of men: *ye received it not as the word of men, but as it is in truth, the word of Elohim (God)* (1 Thessalonians 2:13). The test of Deuteronomy is whether the word is Yahuah''s; the Thessalonians discerned rightly, and the word worked in them as the living word of Elohim (God), not the speech of a man.'),
  ('canon', '1-thessalonians', 2, 13, 'canon', 'jeremiah', 15, 16, 'free', E'*Thy words were found, and I did eat them; and thy word was unto me the joy and rejoicing of mine heart: for I am called by thy name, O Yahuah Elohim (LORD God) of hosts.* (Jeremiah 15:16). Jeremiah received the word of Yahuah (LORD) as food and as joy — *thy word was unto me the joy and rejoicing of mine heart.* The Thessalonians received the same way, taking it *not as the word of men, but as it is in truth, the word of Elohim (God), which effectually worketh also in you that believe* (1 Thessalonians 2:13). The word found and eaten becomes the joy of the heart and the power at work within; what the prophet knew, the gathered ones at Thessalonica knew, because the word is one and the same — the word of Elohim (God).'),
  -- thread: 1-thessalonians-2-who-killed-the-lord-and-their-own-prophets-the-wrath-nehemiah-9-romans-11  [⚠ WATCHPOINT]
  ('canon', '1-thessalonians', 2, 15, 'canon', 'nehemiah', 9, 26, 'free', E'*Nevertheless they were disobedient, and rebelled against thee, and cast thy law behind their backs, and slew thy prophets which testified against them to turn them to thee, and they wrought great provocations.* (Nehemiah 9:26). The Levites'' confession names an old and specific pattern: a rebellious party that *slew thy prophets which testified against them.* It is that very pattern Paul invokes of the persecutors who *both killed the Lord Yahusha (Lord Jesus), and their own prophets, and have persecuted us* (1 Thessalonians 2:15). Note what Nehemiah''s prayer also confesses — that Yahuah (LORD) *didst not utterly consume them, nor forsake them; for thou art a gracious and merciful Elohim (God)* (Nehemiah 9:31): the indictment falls on the prophet-killers, not on the people Yahuah (LORD) refuses to forsake. Paul, himself a Yahudi (Jew), names the same specific persecutors, not a curse on Yashar''el (Israel).'),
  ('canon', '1-thessalonians', 2, 16, 'canon', '2-chronicles', 36, 16, 'free', E'*But they mocked the messengers of Elohim (God), and despised his words, and misused his prophets, until the wrath of Yahuah (LORD) arose against his people, till there was no remedy.* (2 Chronicles 36:16). The chronicler shows the end of the pattern: when a generation *misused his prophets,* the *wrath of Yahuah (LORD) arose... till there was no remedy.* Paul speaks of the same mounting measure when the persecutors fill *up their sins alway: for the wrath is come upon them to the uttermost* (1 Thessalonians 2:16). The wrath is the just answer to the persecuting opposition who silence the messengers — the same word and the same wrath the Tanakh records — not a sentence pronounced over the covenant people as such.'),
  ('canon', '1-thessalonians', 2, 15, 'canon', 'matthew', 23, 31, 'free', E'*Wherefore ye be witnesses unto yourselves, that ye are the children of them which killed the prophets.* (Matthew 23:31). Yahusha (Jesus) named the persecuting party by the very pattern: *the children of them which killed the prophets,* who fill up *the measure of your fathers* (Matthew 23:32). Paul echoes his Master''s own words when he writes of those who *killed the Lord Yahusha (Lord Jesus), and their own prophets... to fill up their sins alway* (1 Thessalonians 2:15-16). It is the same indictment of the same prophet-killing opposition — the scribes and Pharisees Yahusha (Jesus) rebuked — not the nation of Yashar''el (Israel), to whom he longed to gather *thy children together, even as a hen gathereth her chickens* (Matthew 23:37).'),
  ('canon', '1-thessalonians', 2, 15, 'canon', 'matthew', 23, 37, 'free', E'*O Jerusalem, Jerusalem, thou that killest the prophets, and stonest them which are sent unto thee, how often would I have gathered thy children together, even as a hen gathereth her chickens under her wings, and ye would not!* (Matthew 23:37). Here is the heart of the matter and the guard against misreading it: the One who names *thou that killest the prophets* is the One who *would have gathered thy children together* — grief, not rejection. Paul writes in the same spirit of those who *killed the Lord Yahusha (Lord Jesus), and their own prophets, and have persecuted us* (1 Thessalonians 2:15). The lament falls on the prophet-killing resistance, while the yearning is to gather the children of Yashar''el (Israel); the wrath is for the persecutors, the longing is for the people.'),
  ('canon', '1-thessalonians', 2, 15, 'canon', 'acts', 7, 52, 'free', E'*Which of the prophets have not your fathers persecuted? and they have slain them which shewed before of the coming of the Just One; of whom ye have been now the betrayers and murderers:* (Acts 7:52). Stephen, a Yahudi (Jew) speaking to the council, frames the charge precisely as Paul will: *which of the prophets have not your fathers persecuted?* — the persecution of the prophets crowned by the killing of *the Just One.* Paul writes of those who *both killed the Lord Yahusha (Lord Jesus), and their own prophets, and have persecuted us* (1 Thessalonians 2:15). It is the one prophet-killed pattern, leveled at the specific persecutors who stoned Stephen and drove out the apostles — not a verdict against Israel, whom the same Stephen calls the people of the covenant and the living oracles.'),
  ('canon', '1-thessalonians', 2, 16, 'canon', 'romans', 11, 1, 'free', E'*I say then, Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham, of the tribe of Benjamin.* (Romans 11:1). This is the explicit guard over the hard words of 1 Thessalonians 2. The same Paul who wrote of the persecutors who *killed the Lord Yahusha (Lord Jesus), and their own prophets* (1 Thessalonians 2:15) flatly denies that Elohim (God) has cast off his people — *Elohim (God) forbid* — and points to himself, *I also am an Israelite, of the seed of Abraham.* The wrath that *is come upon them to the uttermost* (2:16) falls on the persecuting opposition, never on Yashar''el (Israel) as such; the apostle who names the persecutors is himself a son of that people Elohim (God) will not abandon.'),
  ('canon', '1-thessalonians', 2, 16, 'canon', 'romans', 11, 2, 'free', E'*Elohim (God) hath not cast away his people which he foreknew. Wot ye not what the scripture saith of Elias? how he maketh intercession to Elohim (God) against Yashar''el (Israel),* (Romans 11:2). Paul states the principle outright: *Elohim (God) hath not cast away his people which he foreknew.* Even when Elijah cried *they have killed thy prophets* (Romans 11:3), Yahuah (LORD) answered that he had *reserved... seven thousand* (Romans 11:4) — a remnant always remains. So the persecutors of 1 Thessalonians 2:15-16, who *killed the Lord Yahusha (Lord Jesus), and their own prophets,* and on whom *the wrath is come... to the uttermost,* are the prophet-killing opposition, not the foreknown people. The hard verse must be read inside this guard: the wrath is for the persecutors; the people are not cast away.'),
  -- thread: 1-thessalonians-2-called-unto-his-kingdom-and-glory-daniel-7
  ('canon', '1-thessalonians', 2, 12, 'canon', 'daniel', 7, 18, 'free', E'*But the saints of the El Elyon (most High) shall take the kingdom, and possess the kingdom for ever, even for ever and ever.* (Daniel 7:18). Daniel saw the destiny of the gathered righteous: *the saints of the El Elyon (most High) shall take the kingdom, and possess the kingdom for ever.* This is the kingdom into which Paul says the Thessalonians are summoned, charging them to *walk worthy of Elohim (God), who hath called you unto his kingdom and glory* (1 Thessalonians 2:12). The everlasting kingdom of Daniel''s vision is the kingdom and glory of the calling; to walk worthy is to walk as those appointed to possess it with the saints of the El Elyon (most High).'),
  ('canon', '1-thessalonians', 2, 12, 'canon', 'daniel', 7, 27, 'free', E'*And the kingdom and dominion, and the greatness of the kingdom under the whole heaven, shall be given to the people of the saints of the El Elyon (most High), whose kingdom is an everlasting kingdom, and all dominions shall serve and obey him.* (Daniel 7:27). The vision ends with the kingdom *given to the people of the saints of the El Elyon (most High), whose kingdom is an everlasting kingdom.* It is unto this very kingdom and glory that the called-out ones are summoned — Paul exhorts them to *walk worthy of Elohim (God), who hath called you unto his kingdom and glory* (1 Thessalonians 2:12). The kingdom Daniel saw given to the saints is the inheritance of the calling; the worthy walk is the manner of life that befits a people destined for an everlasting kingdom.'),
  -- thread: 1-thessalonians-2-our-crown-of-rejoicing-at-his-coming-isaiah-62-daniel-12
  ('canon', '1-thessalonians', 2, 19, 'canon', 'isaiah', 62, 3, 'free', E'*Thou shalt also be a crown of glory in the hand of Yahuah (LORD), and a royal diadem in the hand of thy Elohim (God).* (Isaiah 62:3). Isaiah promises restored Yashar''el (Israel) shall be *a crown of glory in the hand of Yahuah (LORD).* Paul speaks of his converts in the same key: *what is our hope, or joy, or crown of rejoicing? Are not even ye in the presence of our Lord Yahusha HaMashiach (Lord Jesus Christ) at his coming?* (1 Thessalonians 2:19). The gathered ones are the apostle''s crown as the redeemed people are Yahuah''s crown — held up not for self-glory but in the presence of the returning Lord at his coming. The crown is the redeemed people themselves, presented at the parousia.'),
  ('canon', '1-thessalonians', 2, 19, 'canon', 'daniel', 12, 3, 'free', E'*And they that be wise shall shine as the brightness of the firmament; and they that turn many to righteousness as the stars for ever and ever.* (Daniel 12:3). Daniel promises that *they that turn many to righteousness* shall shine *as the stars for ever and ever.* Paul, who turned the Thessalonians from idols to the living Elohim (God), names them his glory at the end: *what is our hope, or joy, or crown of rejoicing? Are not even ye in the presence of our Lord Yahusha HaMashiach (Lord Jesus Christ) at his coming? For ye are our glory and joy* (1 Thessalonians 2:19-20). Those turned to righteousness are the shining reward of the one who turned them; the crown of rejoicing is the gathered people, displayed in glory at his coming.'),
  ('canon', '1-thessalonians', 2, 19, 'canon', 'philippians', 4, 1, 'free', E'*Therefore, my brethren dearly beloved and longed for, my joy and crown, so stand fast in Yahuah (Lord), my dearly beloved.* (Philippians 4:1). Paul calls another assembly the same thing he calls the Thessalonians: *my joy and crown.* To the Thessalonians he asks, *what is our hope, or joy, or crown of rejoicing? Are not even ye in the presence of our Lord Yahusha HaMashiach (Lord Jesus Christ) at his coming?* (1 Thessalonians 2:19). The apostle''s crown is never a trophy of his own making but the people themselves, beloved and longed for, to be presented standing fast in Yahuah (Lord) at the coming of the Lord.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s233_t102_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s233_t102_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-thessalonians-2-ye-received-it-as-the-word-of-elohim-jeremiah-1-deuteronomy-18',
       E'Ye received it not as the word of men, but as the word of Elohim (God) (Jeremiah 1, Deuteronomy 18)',
       E'Paul gives thanks for a particular discernment in the Thessalonians: *when ye received the word of Elohim (God) which ye heard of us, ye received it not as the word of men, but as it is in truth, the word of Elohim (God), which effectually worketh also in you that believe* (1 Thessalonians 2:13). The apostle stands in the line of the prophets, and the mark of the true messenger is that the word in his mouth is not his own. At Horeb the pattern was set: Yahuah (LORD) *will raise them up a Prophet from among their brethren, like unto thee, and will put my words in his mouth; and he shall speak unto them all that I shall command him* (Deuteronomy 18:18). When Yahuah (LORD) called Jeremiah he did the same — *Then Yahuah (LORD) put forth his hand, and touched my mouth. And Yahuah (LORD) said unto me, Behold, I have put my words in thy mouth* (Jeremiah 1:9). And the prophet who eats that word knows it as life and joy: *Thy words were found, and I did eat them; and thy word was unto me the joy and rejoicing of mine heart* (Jeremiah 15:16). The word the Thessalonians received was this word — placed by Elohim (God) in the mouth of his messenger, taken in not as the speech of men but as the living word that works in those who believe. They discerned it rightly, and it bore its proper fruit in them.',
       sv.verse_id, ev.verse_id, 'free', 8075
  FROM _s233_t102_lookup sv, _s233_t102_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='1-thessalonians' AND ev.chapter_number=2 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-thessalonians-2-who-killed-the-lord-and-their-own-prophets-the-wrath-nehemiah-9-romans-11',
       E'Who killed the Lord and their own prophets — the prophets-killed pattern, not a curse on Israel (Nehemiah 9, Romans 11)',
       E'Paul writes the hardest words of the letter: the Thessalonians *have suffered like things of your own countrymen, even as they have of the Yahudim (Jews): Who both killed the Lord Yahusha (Lord Jesus), and their own prophets, and have persecuted us; and they please not Elohim (God), and are contrary to all men: Forbidding us to speak to the Gentiles that they might be saved, to fill up their sins alway: for the wrath is come upon them to the uttermost* (1 Thessalonians 2:14-16). Read this exactly as it stands: it is NOT a blanket curse on the Jewish people, and NOT replacement theology. Paul is himself a Yahudi (Jew); he names the SPECIFIC persecutors by the one pattern the Tanakh and the Messiah named — the killing of the prophets. The Levites confessed it of old: the rebellious party *slew thy prophets which testified against them to turn them to thee* (Nehemiah 9:26), yet the same prayer confesses that Yahuah (LORD) *didst not utterly consume them, nor forsake them* (Nehemiah 9:31). The chronicler shows where the pattern ends: when men *misused his prophets,* the *wrath of Yahuah (LORD) arose against his people, till there was no remedy* (2 Chronicles 36:16) — the very mounting measure Paul means when he says they *fill up their sins alway: for the wrath is come upon them to the uttermost.* Yahusha (Jesus) named the persecutors the same way: *ye are the children of them which killed the prophets* (Matthew 23:31), even as he wept, *O Jerusalem, Jerusalem, thou that killest the prophets... how often would I have gathered thy children together, even as a hen gathereth her chickens under her wings, and ye would not!* (Matthew 23:37) — grief, not rejection. Stephen, a Yahudi (Jew) before the council, charged the same: *which of the prophets have not your fathers persecuted? and they have slain them which shewed before of the coming of the Just One* (Acts 7:52). And the guard is set by Paul''s own hand: *Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham* (Romans 11:1); *Elohim (God) hath not cast away his people which he foreknew* (Romans 11:2). The wrath falls on the prophet-killing opposition that silenced the messengers and forbade the gospel to the nations — never on Yashar''el (Israel) as such. The apostle who names the persecutors is himself a son of the people Elohim (God) will not abandon.',
       sv.verse_id, ev.verse_id, 'free', 8078
  FROM _s233_t102_lookup sv, _s233_t102_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='1-thessalonians' AND ev.chapter_number=2 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-thessalonians-2-called-unto-his-kingdom-and-glory-daniel-7',
       E'Called unto his kingdom and glory — the saints take the everlasting kingdom (Daniel 7)',
       E'Paul charges the Thessalonians as a father his children, *That ye would walk worthy of Elohim (God), who hath called you unto his kingdom and glory* (1 Thessalonians 2:12). The kingdom and glory of the calling is no vague hope: Daniel saw it given to the gathered righteous. *The saints of the El Elyon (most High) shall take the kingdom, and possess the kingdom for ever, even for ever and ever* (Daniel 7:18); and again, *the kingdom and dominion, and the greatness of the kingdom under the whole heaven, shall be given to the people of the saints of the El Elyon (most High), whose kingdom is an everlasting kingdom, and all dominions shall serve and obey him* (Daniel 7:27). This is the kingdom into which the called-out ones are summoned — the everlasting kingdom of Daniel''s vision, the inheritance of the saints. To walk worthy of Elohim (God) is to walk as those appointed to possess that kingdom with the saints of the El Elyon (most High); the calling and the worthy walk belong together, for the people of the kingdom must live as the kingdom''s heirs.',
       sv.verse_id, ev.verse_id, 'free', 8081
  FROM _s233_t102_lookup sv, _s233_t102_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='1-thessalonians' AND ev.chapter_number=2 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-thessalonians-2-our-crown-of-rejoicing-at-his-coming-isaiah-62-daniel-12',
       E'Our hope, joy, and crown of rejoicing at his coming (Isaiah 62, Daniel 12)',
       E'Paul ends the chapter with the apostle''s reward laid up at the return of the Lord: *what is our hope, or joy, or crown of rejoicing? Are not even ye in the presence of our Lord Yahusha HaMashiach (Lord Jesus Christ) at his coming? For ye are our glory and joy* (1 Thessalonians 2:19-20). The crown of rejoicing is no trophy of his own making — it is the gathered people themselves, presented at his coming. Isaiah said the redeemed people are exactly that: restored Yashar''el (Israel) shall be *a crown of glory in the hand of Yahuah (LORD), and a royal diadem in the hand of thy Elohim (God)* (Isaiah 62:3). And those who turned them have their shining reward: *they that turn many to righteousness as the stars for ever and ever* (Daniel 12:3). Paul calls the Philippians the same — *my brethren dearly beloved and longed for, my joy and crown, so stand fast in Yahuah (Lord)* (Philippians 4:1). The crown is the people, beloved and longed for, the harvest of those turned from idols to the living Elohim (God) — to be displayed not for the apostle''s glory but in the presence of the Lord at his coming, the parousia toward which the whole letter leans.',
       sv.verse_id, ev.verse_id, 'free', 8084
  FROM _s233_t102_lookup sv, _s233_t102_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=19
   AND ev.edition_slug='canon' AND ev.book_slug='1-thessalonians' AND ev.chapter_number=2 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-thessalonians-2-ye-received-it-as-the-word-of-elohim-jeremiah-1-deuteronomy-18
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 1:9 — *Behold, I have put my words in thy mouth* the word in the prophet''s mouth is Yahuah''s own; the Thessalonians *received it not as the word of men, but... the word of Elohim (God)* (1 Thessalonians 2:13).'
  FROM cross_reference_threads t, cross_references x, _s233_t102_lookup sv, _s233_t102_lookup tv
 WHERE t.slug='1-thessalonians-2-ye-received-it-as-the-word-of-elohim-jeremiah-1-deuteronomy-18'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=1 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 18:18 — *will put my words in his mouth; and he shall speak... all that I shall command him* the Horeb pattern of the true messenger; the word received *not as the word of men* (1 Thessalonians 2:13).'
  FROM cross_reference_threads t, cross_references x, _s233_t102_lookup sv, _s233_t102_lookup tv
 WHERE t.slug='1-thessalonians-2-ye-received-it-as-the-word-of-elohim-jeremiah-1-deuteronomy-18'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=18 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 15:16 — *Thy words were found, and I did eat them; and thy word was unto me the joy and rejoicing of mine heart* the word eaten as joy and power; *which effectually worketh also in you that believe* (1 Thessalonians 2:13).'
  FROM cross_reference_threads t, cross_references x, _s233_t102_lookup sv, _s233_t102_lookup tv
 WHERE t.slug='1-thessalonians-2-ye-received-it-as-the-word-of-elohim-jeremiah-1-deuteronomy-18'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=15 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-thessalonians-2-who-killed-the-lord-and-their-own-prophets-the-wrath-nehemiah-9-romans-11
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Nehemiah 9:26 — *slew thy prophets which testified against them* the old prophets-killed pattern; the persecutors who *killed the Lord Yahusha (Lord Jesus), and their own prophets* (1 Thessalonians 2:15) — yet Yahuah *forsookest them not* (Nehemiah 9:31).'
  FROM cross_reference_threads t, cross_references x, _s233_t102_lookup sv, _s233_t102_lookup tv
 WHERE t.slug='1-thessalonians-2-who-killed-the-lord-and-their-own-prophets-the-wrath-nehemiah-9-romans-11'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=9 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Chronicles 36:16 — *misused his prophets, until the wrath of Yahuah (LORD) arose against his people, till there was no remedy* the mounting measure; *to fill up their sins alway: for the wrath is come upon them to the uttermost* (1 Thessalonians 2:16).'
  FROM cross_reference_threads t, cross_references x, _s233_t102_lookup sv, _s233_t102_lookup tv
 WHERE t.slug='1-thessalonians-2-who-killed-the-lord-and-their-own-prophets-the-wrath-nehemiah-9-romans-11'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=36 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 23:31 — *ye are the children of them which killed the prophets* Yahusha (Jesus) naming the persecuting party; Paul echoes his Master of those who *killed... their own prophets* (1 Thessalonians 2:15).'
  FROM cross_reference_threads t, cross_references x, _s233_t102_lookup sv, _s233_t102_lookup tv
 WHERE t.slug='1-thessalonians-2-who-killed-the-lord-and-their-own-prophets-the-wrath-nehemiah-9-romans-11'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=23 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 23:37 — *O Jerusalem... thou that killest the prophets... how often would I have gathered thy children together* the lament that is grief, not rejection; the wrath is for the persecutors, the longing is for the people (1 Thessalonians 2:15).'
  FROM cross_reference_threads t, cross_references x, _s233_t102_lookup sv, _s233_t102_lookup tv
 WHERE t.slug='1-thessalonians-2-who-killed-the-lord-and-their-own-prophets-the-wrath-nehemiah-9-romans-11'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=23 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Acts 7:52 — *which of the prophets have not your fathers persecuted? and they have slain them which shewed before of the coming of the Just One* Stephen, a Yahudi (Jew), naming the same pattern; those who *killed the Lord Yahusha... and their own prophets* (1 Thessalonians 2:15).'
  FROM cross_reference_threads t, cross_references x, _s233_t102_lookup sv, _s233_t102_lookup tv
 WHERE t.slug='1-thessalonians-2-who-killed-the-lord-and-their-own-prophets-the-wrath-nehemiah-9-romans-11'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=52
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Romans 11:1 — *Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite* the GUARD; the wrath of 1 Thessalonians 2:16 falls on the persecutors, never on Yashar''el (Israel), and Paul is himself a son of that people.'
  FROM cross_reference_threads t, cross_references x, _s233_t102_lookup sv, _s233_t102_lookup tv
 WHERE t.slug='1-thessalonians-2-who-killed-the-lord-and-their-own-prophets-the-wrath-nehemiah-9-romans-11'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Romans 11:2 — *Elohim (God) hath not cast away his people which he foreknew* the principle that fixes the reading; even Elijah''s *they have killed thy prophets* met a reserved remnant (Romans 11:3-4). The hard verse stands inside this guard (1 Thessalonians 2:16).'
  FROM cross_reference_threads t, cross_references x, _s233_t102_lookup sv, _s233_t102_lookup tv
 WHERE t.slug='1-thessalonians-2-who-killed-the-lord-and-their-own-prophets-the-wrath-nehemiah-9-romans-11'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-thessalonians-2-called-unto-his-kingdom-and-glory-daniel-7
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 7:18 — *the saints of the El Elyon (most High) shall take the kingdom, and possess the kingdom for ever* the everlasting kingdom of the calling; *who hath called you unto his kingdom and glory* (1 Thessalonians 2:12).'
  FROM cross_reference_threads t, cross_references x, _s233_t102_lookup sv, _s233_t102_lookup tv
 WHERE t.slug='1-thessalonians-2-called-unto-his-kingdom-and-glory-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 7:27 — *the kingdom... shall be given to the people of the saints of the El Elyon (most High), whose kingdom is an everlasting kingdom* the inheritance of the calling; walk worthy of *his kingdom and glory* (1 Thessalonians 2:12).'
  FROM cross_reference_threads t, cross_references x, _s233_t102_lookup sv, _s233_t102_lookup tv
 WHERE t.slug='1-thessalonians-2-called-unto-his-kingdom-and-glory-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-thessalonians-2-our-crown-of-rejoicing-at-his-coming-isaiah-62-daniel-12
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 62:3 — *Thou shalt also be a crown of glory in the hand of Yahuah (LORD), and a royal diadem* the redeemed people as Yahuah''s crown; the gathered ones are the apostle''s *crown of rejoicing... at his coming* (1 Thessalonians 2:19).'
  FROM cross_reference_threads t, cross_references x, _s233_t102_lookup sv, _s233_t102_lookup tv
 WHERE t.slug='1-thessalonians-2-our-crown-of-rejoicing-at-his-coming-isaiah-62-daniel-12'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=62 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 12:3 — *they that turn many to righteousness as the stars for ever and ever* the shining reward of the one who turns them; *ye are our glory and joy* (1 Thessalonians 2:20).'
  FROM cross_reference_threads t, cross_references x, _s233_t102_lookup sv, _s233_t102_lookup tv
 WHERE t.slug='1-thessalonians-2-our-crown-of-rejoicing-at-his-coming-isaiah-62-daniel-12'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Philippians 4:1 — *my brethren dearly beloved and longed for, my joy and crown* the apostle''s crown is the people themselves; *Are not even ye... at his coming?* (1 Thessalonians 2:19).'
  FROM cross_reference_threads t, cross_references x, _s233_t102_lookup sv, _s233_t102_lookup tv
 WHERE t.slug='1-thessalonians-2-our-crown-of-rejoicing-at-his-coming-isaiah-62-daniel-12'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=4 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1thessalonians_03.sql (S233 1 Thessalonians 3) -----
-- =====================================================================
-- S233 minion — 1 THESSALONIANS 3 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 1 THESSALONIANS 3 (13 verses) — Timothy sent to establish and comfort;
--   the appointed tribulation of the righteous; the coming of our Lord with all his saints.
-- Tag: t103 (temp view _s233_t103_lookup).
-- Sort band: floor 8100, step 3 (8100, 8103 used; under 8125).
-- Source is ALWAYS the canon 1 Thessalonians verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (the called-out ones at Thessalonica — Yashar'el and the grafted-in seed of the
-- nations — are stablished in their afflictions and bound to the day of his coming). This is a
-- shorter, warmer chapter: Paul, unable to forbear, sends Timotheus to *establish you, and to comfort
-- you concerning your faith* (3:2). Two load-bearing weaves carry the chapter. (1) ★ The coming with
-- all his saints (3:13): *To the end he may stablish your hearts unblameable in holiness before Elohim
-- (God), even our Father, at the coming of our Lord Yahusha HaMashiach (Lord Jesus Christ) with all
-- his saints* — this re-speaks Zechariah 14:5 (*Yahuah Elohai (the LORD my God) shall come, and all
-- the saints with thee*) and the Sinai theophany of Deuteronomy 33:2 (*he came with ten thousands of
-- saints*), the SAME coming Enoch prophesied and Jude quotes (1 Enoch 1:9 / Jude 14, *Behold, Yahuah
-- (Lord) cometh with ten thousands of his saints*). This is the one returning King gathering the one
-- people — NOT a secret rapture, NOT a church that replaced Yashar'el. (2) The appointed tribulation
-- of the righteous (3:3-4): *that no man should be moved by these afflictions: for yourselves know
-- that we are appointed thereunto* — the suffering of the elect is foretold and ordained, the pattern
-- of Enoch's blessing of *the elect and righteous, who will be living in the day of tribulation* (1
-- Enoch 1:1), and of the apostolic and Messianic word: *we must through much tribulation enter into
-- the kingdom of Elohim (God)* (Acts 14:22), *In the world ye shall have tribulation* (John 16:33),
-- *all that will live godly in HaMashiach Yahusha (Christ Jesus) shall suffer persecution* (2 Timothy
-- 3:12). No replacement theology, no law-vs-grace antithesis. Christology: the Father stablishes the
-- hearts of his people, and the Son — the Formed — is the One who comes with all his saints; keep the
-- Father the source and the Son the One who returns.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-2   Timothy sent to establish and comfort concerning your faith
--           Tanakh: none warranted (pastoral; the establish-and-comfort weight lands in the v.13 thread)
--           Extras: none warranted   NT: none warranted
--   v.3-4   that no man be moved by these afflictions: we are appointed thereunto; we told you we should
--           suffer tribulation
--           Tanakh: none warranted (no single load-bearing quote; the appointed-suffering pattern is
--                   carried by 1 Enoch 1:1 + the NT twins)
--           Extras: 1 Enoch 1:1 (the blessing of the elect and righteous living in the day of tribulation)
--           NT: Acts 14:22 (through much tribulation enter into the kingdom), John 16:33 (in the world
--                   ye shall have tribulation), 2 Timothy 3:12 (all that live godly shall suffer persecution)
--   v.5     the tempter; lest our labour be in vain
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted (carried in prose)
--   v.6-10  Timothy's good tidings; we live if ye stand fast in Yahuah; night and day praying
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted (pastoral warmth)
--   v.11-13 ★ Elohim our Father direct our way; increase and abound in love; stablish your hearts
--           unblameable in holiness at the coming of our Lord with all his saints
--           Tanakh: Zechariah 14:5 (Yahuah my Elohim shall come, and all the saints with thee),
--                   Deuteronomy 33:2 (he came with ten thousands of saints)
--           Extras: 1 Enoch 1:9 (He cometh with ten thousands of His set-apart ones to execute judgement)
--           NT: Jude 14 (Behold, Yahuah cometh with ten thousands of his saints)
--
-- THREADS (slug -> target libraries):
--   8100 1-thessalonians-3-the-coming-of-our-lord-with-all-his-saints-zechariah-14-deuteronomy-33   (Tanakh + Extras + NT)  [★ CENTERPIECE]
--   8103 1-thessalonians-3-the-appointed-tribulation-of-the-righteous-1-enoch-1-acts-14            (Extras + NT)
-- =====================================================================

CREATE TEMP VIEW _s233_t103_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-thessalonians-3-the-coming-of-our-lord-with-all-his-saints-zechariah-14-deuteronomy-33  [★ CENTERPIECE]
  ('canon', '1-thessalonians', 3, 13, 'canon', 'zechariah', 14, 5, 'free', E'*And ye shall flee to the valley of the mountains; for the valley of the mountains shall reach unto Azal: yea, ye shall flee, like as ye fled from before the earthquake in the days of Uzziah king of Yahudah (Judah): and Yahuah Elohai (the LORD my God) shall come, and all the saints with thee.* (Zechariah 14:5). This is the prophetic word Paul re-speaks when he prays that the Father may *stablish your hearts unblameable in holiness before Elohim (God)... at the coming of our Lord Yahusha HaMashiach (Lord Jesus Christ) with all his saints* (1 Thessalonians 3:13). Zechariah names the day Yahuah (LORD) comes and *all the saints with thee* — the same day on the same mount of Olives where *his feet shall stand* and Yahuah (LORD) becomes *king over all the earth.* The coming of our Lord with all his saints is no new program but the day of Yahuah the prophets foretold; the Formed who returns is the One whose feet stand on the mount, gathering his set-apart ones.'),
  ('canon', '1-thessalonians', 3, 13, 'canon', 'deuteronomy', 33, 2, 'free', E'*And he said, Yahuah (LORD) came from Sinai, and rose up from Seir unto them; he shined forth from mount Paran, and he came with ten thousands of saints: from his right hand went a fiery law for them.* (Deuteronomy 33:2). Moses sang of Yahuah (LORD) coming *with ten thousands of saints,* his fiery law going out from his right hand — the Sinai theophany that sets the pattern Paul invokes: the coming of our Lord *with all his saints* (1 Thessalonians 3:13). The same Yahuah (LORD) who descended on Sinai surrounded by his holy ones is the One who returns surrounded by them; the law that went forth at the first coming and the holiness in which the hearts are stablished at the last are one covenant, not two. The host that came with him to Sinai comes with him at the end.'),
  ('canon', '1-thessalonians', 3, 13, 'enoch', '1-enoch', 1, 9, 'extras', E'*And behold! He cometh with ten thousands of His set-apart ones To execute judgement upon all, And to destroy all the ungodly: And to convict all flesh Of all the works of their ungodliness which they have ungodly committed, And of all the hard things which ungodly sinners have spoken against Him.* (1 Enoch 1:9). The Hebrew library carried this same coming-with-the-saints word long before Thessalonica: *He cometh with ten thousands of His set-apart ones.* It is the very prophecy Paul leans on praying for hearts *unblameable in holiness... at the coming of our Lord Yahusha HaMashiach (Lord Jesus Christ) with all his saints* (1 Thessalonians 3:13) — and the very prophecy Jude quotes by name as Enoch''s. The day the saints accompany the returning One is the day of judgement on the ungodly; the same event Zechariah and Moses sang, held in one voice across the whole library.'),
  ('canon', '1-thessalonians', 3, 13, 'canon', 'jude', 1, 14, 'free', E'*And Enoch also, the seventh from Adam, prophesied of these, saying, Behold, Yahuah (Lord) cometh with ten thousands of his saints,* (Jude 14). Jude names the source: the coming-with-the-saints word is Enoch''s prophecy, *Behold, Yahuah (Lord) cometh with ten thousands of his saints.* This is the same coming Paul sets before the Thessalonians — *the coming of our Lord Yahusha HaMashiach (Lord Jesus Christ) with all his saints* (1 Thessalonians 3:13). The host of holy ones who attend the returning Lord in Zechariah, in Moses'' song, and in Enoch''s prophecy is the host Paul names; the day of his coming is one day, witnessed by the whole library, when the saints accompany the Formed who returns to gather and to judge.'),
  -- thread: 1-thessalonians-3-the-appointed-tribulation-of-the-righteous-1-enoch-1-acts-14
  ('canon', '1-thessalonians', 3, 3, 'enoch', '1-enoch', 1, 1, 'extras', E'*The words of the blessing of Enoch, wherewith he blessed the elect and righteous, who will be living in the day of tribulation, when all the wicked and godless are to be removed.* (1 Enoch 1:1). Enoch''s blessing falls on *the elect and righteous, who will be living in the day of tribulation* — the very condition Paul names when he steadies the Thessalonians *that no man should be moved by these afflictions: for yourselves know that we are appointed thereunto* (1 Thessalonians 3:3). The tribulation of the righteous is not a sign of rejection but the appointed lot of the elect, foretold from of old; the same blessing that rests on those who endure the day of tribulation rests on the assembly Paul comforts, who are appointed to suffer before the wicked are removed.'),
  ('canon', '1-thessalonians', 3, 3, 'canon', 'acts', 14, 22, 'free', E'*Confirming the souls of the disciples, and exhorting them to continue in the faith, and that we must through much tribulation enter into the kingdom of Elohim (God).* (Acts 14:22). Paul himself, confirming the souls of the disciples, taught *that we must through much tribulation enter into the kingdom of Elohim (God)* — the same word he writes to Thessalonica: *we are appointed thereunto* (1 Thessalonians 3:3), *we told you before that we should suffer tribulation; even as it came to pass* (1 Thessalonians 3:4). The affliction is the appointed road into the kingdom, not a detour from it; Timothy is sent *to establish you, and to comfort you* (3:2) precisely so that no man be moved when the foretold tribulation comes.'),
  ('canon', '1-thessalonians', 3, 4, 'canon', 'john', 16, 33, 'free', E'*These things I have spoken unto you, that in me ye might have peace. In the world ye shall have tribulation: but be of good cheer; I have overcome the world.* (John 16:33). Yahusha (Jesus) told his own before it came: *In the world ye shall have tribulation.* Paul echoes the same forewarning to the assembly: *when we were with you, we told you before that we should suffer tribulation; even as it came to pass, and ye know* (1 Thessalonians 3:4). The tribulation is foretold so the righteous are not moved by it; the peace held in him and the *be of good cheer* of the Lord are the comfort Timothy is sent to renew, the overcoming already secured by the One who comes with all his saints.'),
  ('canon', '1-thessalonians', 3, 3, 'canon', '2-timothy', 3, 12, 'free', E'*Yea, and all that will live godly in HaMashiach Yahusha (Christ Jesus) shall suffer persecution.* (2 Timothy 3:12). Paul states the rule plainly: *all that will live godly in HaMashiach Yahusha (Christ Jesus) shall suffer persecution.* This is why he can say of the afflicted Thessalonians *we are appointed thereunto* (1 Thessalonians 3:3) — the suffering is bound to godly life, the appointed portion of the elect, not a sign that they have been forsaken. The afflictions that might move them are in truth the mark that they walk the narrow way; the comfort is that the appointment is the Father''s, and the end of it is the coming of the Lord with all his saints.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s233_t103_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s233_t103_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-thessalonians-3-the-coming-of-our-lord-with-all-his-saints-zechariah-14-deuteronomy-33',
       E'The coming of our Lord with all his saints (Zechariah 14, Deuteronomy 33)',
       E'Paul closes the chapter with a prayer that the Father may *stablish your hearts unblameable in holiness before Elohim (God), even our Father, at the coming of our Lord Yahusha HaMashiach (Lord Jesus Christ) with all his saints* (1 Thessalonians 3:13). The phrase *with all his saints* is not a new revelation but a word the whole library already carried. Zechariah named the day: *Yahuah Elohai (the LORD my God) shall come, and all the saints with thee* (Zechariah 14:5) — the day Yahuah (LORD) stands on the mount of Olives and becomes *king over all the earth.* Moses sang of it at the first: *Yahuah (LORD) came from Sinai... and he came with ten thousands of saints: from his right hand went a fiery law for them* (Deuteronomy 33:2) — the same Yahuah (LORD) surrounded by his holy ones, the same covenant of holiness in which the hearts are now stablished. And the Hebrew library held it as prophecy: *behold! He cometh with ten thousands of His set-apart ones To execute judgement upon all* (1 Enoch 1:9) — the very word Jude quotes by name, *And Enoch also, the seventh from Adam, prophesied of these, saying, Behold, Yahuah (Lord) cometh with ten thousands of his saints* (Jude 14). One coming, one host of holy ones, one day witnessed across Zechariah, Moses, Enoch, and Jude. This is the returning King gathering the one people, the Formed who comes with the saints to judge the ungodly and to receive his own — not a secret rapture severed from Yashar''el (Israel), and not a church that replaced her, but the day of Yahuah the prophets foretold, for which the Father stablishes his people unblameable in holiness. The Father is the One who stablishes; the Son is the One who comes; the saints are the host that attends him.',
       sv.verse_id, ev.verse_id, 'extras', 8100
  FROM _s233_t103_lookup sv, _s233_t103_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=3 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='1-thessalonians' AND ev.chapter_number=3 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-thessalonians-3-the-appointed-tribulation-of-the-righteous-1-enoch-1-acts-14',
       E'We are appointed thereunto: the tribulation of the righteous foretold (1 Enoch 1, Acts 14)',
       E'Timothy is sent *to establish you, and to comfort you concerning your faith: That no man should be moved by these afflictions: for yourselves know that we are appointed thereunto* (1 Thessalonians 3:2-3), and Paul reminds them, *when we were with you, we told you before that we should suffer tribulation; even as it came to pass, and ye know* (1 Thessalonians 3:4). The afflictions of the called-out ones are not a sign of rejection but their appointed portion, foretold from of old. Enoch''s blessing rests on exactly such a people: *the elect and righteous, who will be living in the day of tribulation, when all the wicked and godless are to be removed* (1 Enoch 1:1) — the tribulation is the lot of the elect before the wicked are taken away. Paul himself taught it on his journeys, *that we must through much tribulation enter into the kingdom of Elohim (God)* (Acts 14:22): the affliction is the road into the kingdom, not a detour from it. Yahusha (Jesus) had forewarned his own in the same way, *In the world ye shall have tribulation: but be of good cheer; I have overcome the world* (John 16:33); and Paul states the rule without exception, *all that will live godly in HaMashiach Yahusha (Christ Jesus) shall suffer persecution* (2 Timothy 3:12). So the comfort Timothy carries is not that the suffering is a mistake but that it is appointed by the Father, foretold by the Messiah and the apostles, the shared portion of the righteous from Enoch onward — and its end is the coming of the Lord with all his saints. No man need be moved by what he was told beforehand would come.',
       sv.verse_id, ev.verse_id, 'extras', 8103
  FROM _s233_t103_lookup sv, _s233_t103_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=3 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='1-thessalonians' AND ev.chapter_number=3 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-thessalonians-3-the-coming-of-our-lord-with-all-his-saints-zechariah-14-deuteronomy-33
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Zechariah 14:5 — *Yahuah Elohai (the LORD my God) shall come, and all the saints with thee* the day Yahuah (LORD) comes with his holy ones and stands on the mount of Olives; the coming of our Lord *with all his saints* (1 Thessalonians 3:13).'
  FROM cross_reference_threads t, cross_references x, _s233_t103_lookup sv, _s233_t103_lookup tv
 WHERE t.slug='1-thessalonians-3-the-coming-of-our-lord-with-all-his-saints-zechariah-14-deuteronomy-33'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=3 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=14 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 33:2 — *he came with ten thousands of saints: from his right hand went a fiery law for them* the Sinai theophany of Yahuah (LORD) surrounded by his holy ones; the same coming pattern *with all his saints* (1 Thessalonians 3:13).'
  FROM cross_reference_threads t, cross_references x, _s233_t103_lookup sv, _s233_t103_lookup tv
 WHERE t.slug='1-thessalonians-3-the-coming-of-our-lord-with-all-his-saints-zechariah-14-deuteronomy-33'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=3 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=33 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 1:9 — *He cometh with ten thousands of His set-apart ones To execute judgement upon all* the library''s coming-with-the-saints prophecy, the word behind hearts stablished *at the coming of our Lord... with all his saints* (1 Thessalonians 3:13).'
  FROM cross_reference_threads t, cross_references x, _s233_t103_lookup sv, _s233_t103_lookup tv
 WHERE t.slug='1-thessalonians-3-the-coming-of-our-lord-with-all-his-saints-zechariah-14-deuteronomy-33'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=3 AND sv.verse_number=13
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=1 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jude 14 — *Behold, Yahuah (Lord) cometh with ten thousands of his saints* Jude names Enoch''s prophecy as the source; the same coming Paul sets before the assembly *with all his saints* (1 Thessalonians 3:13).'
  FROM cross_reference_threads t, cross_references x, _s233_t103_lookup sv, _s233_t103_lookup tv
 WHERE t.slug='1-thessalonians-3-the-coming-of-our-lord-with-all-his-saints-zechariah-14-deuteronomy-33'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=3 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-thessalonians-3-the-appointed-tribulation-of-the-righteous-1-enoch-1-acts-14
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 1:1 — *the blessing of Enoch, wherewith he blessed the elect and righteous, who will be living in the day of tribulation* the tribulation as the appointed lot of the elect; *we are appointed thereunto* (1 Thessalonians 3:3).'
  FROM cross_reference_threads t, cross_references x, _s233_t103_lookup sv, _s233_t103_lookup tv
 WHERE t.slug='1-thessalonians-3-the-appointed-tribulation-of-the-righteous-1-enoch-1-acts-14'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=3 AND sv.verse_number=3
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Acts 14:22 — *we must through much tribulation enter into the kingdom of Elohim (God)* Paul''s own teaching that affliction is the road into the kingdom; *we are appointed thereunto* (1 Thessalonians 3:3).'
  FROM cross_reference_threads t, cross_references x, _s233_t103_lookup sv, _s233_t103_lookup tv
 WHERE t.slug='1-thessalonians-3-the-appointed-tribulation-of-the-righteous-1-enoch-1-acts-14'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=3 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=14 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 16:33 — *In the world ye shall have tribulation: but be of good cheer; I have overcome the world* Yahusha (Jesus) forewarning his own; Paul echoes *we told you before that we should suffer tribulation; even as it came to pass* (1 Thessalonians 3:4).'
  FROM cross_reference_threads t, cross_references x, _s233_t103_lookup sv, _s233_t103_lookup tv
 WHERE t.slug='1-thessalonians-3-the-appointed-tribulation-of-the-righteous-1-enoch-1-acts-14'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=3 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=16 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Timothy 3:12 — *all that will live godly in HaMashiach Yahusha (Christ Jesus) shall suffer persecution* the rule without exception; the suffering is bound to godly life, the appointed portion *we are appointed thereunto* (1 Thessalonians 3:3).'
  FROM cross_reference_threads t, cross_references x, _s233_t103_lookup sv, _s233_t103_lookup tv
 WHERE t.slug='1-thessalonians-3-the-appointed-tribulation-of-the-righteous-1-enoch-1-acts-14'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=3 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='2-timothy' AND tv.chapter_number=3 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1thessalonians_04.sql (S233 1 Thessalonians 4) -----
-- =====================================================================
-- S233 minion — 1 THESSALONIANS 4 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 1 THESSALONIANS 4 (18 verses) — ★★ HIGH watchpoint / BLESSING:
--   sanctification (4:3-7), taught-of-Elohim to love (4:9), and THE RESURRECTION
--   AND THE GATHERING at the trump of Elohim (4:13-18).
-- Tag: t104 (temp view _s233_t104_lookup).
-- Sort band: floor 8125, step 3 (8125, 8128, 8131, 8134 used; under 8150).
-- Source is ALWAYS the canon 1 Thessalonians verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME: 1 Thess 4 is the apostle's great early eschatology. The will of Elohim is
-- sanctification — the holiness code of Leviticus 18-20 re-spoken, not abolished; brotherly love is
-- the Torah written on the heart (Jeremiah 31:33). And the resurrection of 4:13-18 is THE ONE GREAT
-- RESURRECTION-INGATHERING at the last trump: the dead in Messiah raised, the living caught up
-- together with them to meet the returning King — the same event as Isaiah 27:13 (the great trumpet,
-- the outcasts regathered), Daniel 12:2 / Ezekiel 37:12-14 / Isaiah 26:19 (the graves opened, the
-- two-house people raised), 1 Corinthians 15:51-52 (the last trump), and Matthew 24:31 (the trumpet
-- gathers the elect). The *caught up together... to meet Yahuah in the air* is the gathered
-- commonwealth of Yashar'el (Israel) + the grafted-in meeting the King — NOT a secret pre-trib
-- rapture severed from Israel, NOT a separate program for a church that replaced Israel.
--
-- 1 Thessalonians 4 coverage:
--   v.3-7  sanctification / abstain from fornication / holiness not uncleanness
--          Tanakh: Leviticus 18:30 (keep mine ordinance, defile not yourselves), Leviticus 19:2
--                  (Ye shall be holy: for I Yahuah am holy), Leviticus 20:26 (be holy... severed you
--                  from other people)
--          Extras: none warranted   NT: none warranted (the holiness-code root carries it)
--   v.9    taught of Elohim to love one another
--          Tanakh: Jeremiah 31:33 (I will put my law in their inward parts, and write it in their hearts)
--          Extras: none warranted   NT: none warranted (the law-on-the-heart root carries it)
--   v.13-18 ★★ the dead in Messiah rise first / caught up to meet Yahuah / the trump of Elohim
--          Tanakh: Isaiah 27:13 (the great trumpet shall be blown... the outcasts... shall worship
--                  Yahuah), Daniel 12:2 (many that sleep in the dust shall awake), Ezekiel 37:12
--                  (I will open your graves... bring you into the land), Ezekiel 37:14 (put my spirit
--                  in you, and ye shall live), Isaiah 26:19 (Thy dead men shall live... Awake and sing,
--                  ye that dwell in dust)
--          Extras: 2 Esdras 7:32 (the earth shall restore those that are asleep in her), 1 Enoch 51:1
--                  (Sheol shall give back that which it has received... the Elect One shall arise)
--          NT: 1 Corinthians 15:51-52 (at the last trump... the dead shall be raised), Matthew 24:31
--              (a great sound of a trumpet... gather together his elect from the four winds)
--   v.1-2,8,10-12 walk to please Elohim / commandments given / work with your own hands
--          Tanakh: none warranted (general exhortation; the sanctification root is carried at v.3-7)
--          Extras: none warranted   NT: none warranted
--
-- THREADS (slug -> target libraries):
--   1-thessalonians-4-sanctification-abstain-from-fornication-the-holiness-code-leviticus-18-20  (Tanakh; free)
--   1-thessalonians-4-taught-of-elohim-to-love-the-law-written-on-the-heart-jeremiah-31          (Tanakh; free)
--   1-thessalonians-4-the-dead-in-messiah-rise-the-trump-of-gathering-isaiah-27-daniel-12         (Tanakh + NT; free)
--   1-thessalonians-4-the-earth-gives-back-her-dead-the-day-of-resurrection-2-esdras-7-1-enoch-51 (extras; extras)

CREATE TEMP VIEW _s233_t104_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1',
   'pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ----- cross_references -----
WITH input(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note) AS (VALUES
  -- thread: 1-thessalonians-4-sanctification-abstain-from-fornication-the-holiness-code-leviticus-18-20
  ('canon','1-thessalonians',4,3,'canon','leviticus',19,2,'free', E'*Speak unto all the congregation of the children of Yashar''el (Israel), and say unto them, Ye shall be holy: for I Yahuah Elohaychem (the LORD your God) am holy.* (Leviticus 19:2). The whole holiness code opens with this charge, and Paul speaks it again to Thessalonica: *this is the will of Elohim (God), even your sanctification, that ye should abstain from fornication* (1 Thessalonians 4:3). *Be ye holy, for I am holy* is the ground of the will of Elohim (God) — sanctification is not a new demand but the standing word of Yahuah (LORD) to his congregation, the Torah of holiness carried into the assembly of the called-out.'),
  ('canon','1-thessalonians',4,3,'canon','leviticus',18,30,'free', E'*Therefore shall ye keep mine ordinance, that ye commit not any one of these abominable customs, which were committed before you, and that ye defile not yourselves therein: I am Yahuah Elohaychem (the LORD your God).* (Leviticus 18:30). The Leviticus holiness code closes its catalogue of forbidden unions with this guard against the *abominable customs* of the nations. Paul re-speaks it: *abstain from fornication... not in the lust of concupiscence, even as the Gentiles which know not Elohim (God)* (1 Thessalonians 4:3,5). The defilement Yahuah (LORD) forbade his people, the apostle forbids the gathered seed; *that ye defile not yourselves* is the very ordinance that sets Israel apart from the doings of the land.'),
  ('canon','1-thessalonians',4,7,'canon','leviticus',20,26,'free', E'*And ye shall be holy unto me: for I Yahuah (LORD) am holy, and have severed you from other people, that ye should be mine.* (Leviticus 20:26). Yahuah (LORD) severed his people *from other people* unto holiness, *that ye should be mine.* Paul names the same calling: *For Elohim (God) hath not called us unto uncleanness, but unto holiness* (1 Thessalonians 4:7). The severing-unto-holiness of Leviticus is the calling of the assembly; *not unto uncleanness, but unto holiness* is the holiness code spoken to the called-out, who are Yahuah''s (LORD''s) own, separated from the uncleanness of the nations that know not Elohim (God).'),
  -- thread: 1-thessalonians-4-taught-of-elohim-to-love-the-law-written-on-the-heart-jeremiah-31
  ('canon','1-thessalonians',4,9,'canon','jeremiah',31,33,'free', E'*But this shall be the covenant that I will make with the house of Yashar''el (Israel); After those days, saith Yahuah (LORD), I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people.* (Jeremiah 31:33). Yahuah (LORD) promised a covenant with the house of Yashar''el (Israel) in which his law would be *written in their hearts.* Paul says it is come: *as touching brotherly love ye need not that I write unto you: for ye yourselves are taught of Elohim (God) to love one another* (1 Thessalonians 4:9). To be *taught of Elohim (God)* is to have the law written on the heart — not the law abolished but the same Torah of love put within, the new covenant of Jeremiah inscribed in the gathered people so that they need no outward writing to know to love.'),
  -- thread: 1-thessalonians-4-the-dead-in-messiah-rise-the-trump-of-gathering-isaiah-27-daniel-12
  ('canon','1-thessalonians',4,16,'canon','isaiah',27,13,'free', E'*And it shall come to pass in that day, that the great trumpet shall be blown, and they shall come which were ready to perish in the land of Assyria, and the outcasts in the land of Egypt, and shall worship Yahuah (LORD) in the holy mount at Jerusalem.* (Isaiah 27:13). The trump of the gathering is Isaiah''s: *the great trumpet shall be blown,* and the scattered outcasts of Yashar''el (Israel) *shall come* to worship Yahuah (LORD). This is the trumpet behind *Yahuah (Lord) himself shall descend from heaven with a shout... and with the trump of Elohim (God): and the dead in Messiah (Christ) shall rise first* (1 Thessalonians 4:16). The great trumpet that regathers the ready-to-perish is the trump of Elohim (God) that raises the dead in Messiah (Christ) — one and the same ingathering of the scattered people, not a secret summons severed from Yashar''el (Israel) but the regathering Isaiah foretold.'),
  ('canon','1-thessalonians',4,16,'canon','daniel',12,2,'free', E'*And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* (Daniel 12:2). Daniel saw the resurrection: *many of them that sleep in the dust of the earth shall awake.* Paul writes of *them which are asleep* and says *the dead in Messiah (Christ) shall rise first* (1 Thessalonians 4:13,16). The sleepers in the dust who awake in Daniel are the dead in Messiah (Christ) who rise at the trump — the same awakening from the dust, the resurrection of the Tanakh now named as the rising of those asleep in Yahusha (Jesus), that they sorrow not as others which have no hope.'),
  ('canon','1-thessalonians',4,16,'canon','ezekiel',37,12,'free', E'*Therefore prophesy and say unto them, Thus saith Adonai Yahuah (the Lord GOD); Behold, O my people, I will open your graves, and cause you to come up out of your graves, and bring you into the land of Yashar''el (Israel).* (Ezekiel 37:12). To the whole house of Yashar''el (Israel), the dried bones, Yahuah (LORD) promised: *I will open your graves, and cause you to come up out of your graves.* This is the resurrection-and-gathering Paul declares: *the dead in Messiah (Christ) shall rise first: Then we which are alive and remain shall be caught up together with them* (1 Thessalonians 4:16-17). The opened graves of the two-house people, brought up and gathered into the land, are the dead in Messiah (Christ) raised and caught up together — the one resurrection of the regathered house, not a rapture detached from Yashar''el (Israel) but its very fulfilment.'),
  ('canon','1-thessalonians',4,17,'canon','ezekiel',37,14,'free', E'*And shall put my spirit in you, and ye shall live, and I shall place you in your own land: then shall ye know that I Yahuah (LORD) have spoken it, and performed it, saith Yahuah (LORD).* (Ezekiel 37:14). Yahuah (LORD) seals the vision of the opened graves: *I will put my spirit in you, and ye shall live, and I shall place you in your own land.* Paul says the raised and the living *shall be caught up together with them in the clouds, to meet Yahuah (Lord) in the air: and so shall we ever be with Yahuah (Lord)* (1 Thessalonians 4:17). The Spirit-given life and the placing of the people with Yahuah (LORD) is the *ever be with Yahuah (Lord)* of the gathering — the regathered house brought to dwell with their Elohim (God), the promise Ezekiel sealed performed at the trump.'),
  ('canon','1-thessalonians',4,16,'canon','isaiah',26,19,'free', E'*Thy dead men shall live, together with my dead body shall they arise. Awake and sing, ye that dwell in dust: for thy dew is as the dew of herbs, and the earth shall cast out the dead.* (Isaiah 26:19). Isaiah''s song of resurrection: *Thy dead men shall live... Awake and sing, ye that dwell in dust... the earth shall cast out the dead.* This is the rising Paul proclaims — *the dead in Messiah (Christ) shall rise first* (1 Thessalonians 4:16). The dwellers in dust who awake and sing, the earth giving back her dead, are the dead in Messiah (Christ) raised at the descending of Yahuah (Lord); the comfort Isaiah sang to the mourners is the comfort Paul gives, *Wherefore comfort one another with these words* (1 Thessalonians 4:18).'),
  ('canon','1-thessalonians',4,16,'canon','1-corinthians',15,52,'free', E'*In a moment, in the twinkling of an eye, at the last trump: for the trumpet shall sound, and the dead shall be raised incorruptible, and we shall be changed.* (1 Corinthians 15:52). Paul names the same trumpet to the Corinthians: *at the last trump... the dead shall be raised incorruptible, and we shall be changed.* It is the exact twin of *the trump of Elohim (God): and the dead in Messiah (Christ) shall rise first* (1 Thessalonians 4:16). The last trump that raises the dead incorruptible is the trump of Elohim (God) that raises the dead in Messiah (Christ) — one trumpet, one resurrection, the single great ingathering at the end, not two separate events but the one last-trump rising of the asleep.'),
  ('canon','1-thessalonians',4,17,'canon','matthew',24,31,'free', E'*And he shall send his angels with a great sound of a trumpet, and they shall gather together his elect from the four winds, from one end of heaven to the other.* (Matthew 24:31). Yahusha (Jesus) foretold the gathering at the trumpet: *a great sound of a trumpet, and they shall gather together his elect from the four winds.* This is the gathering Paul describes: *we which are alive and remain shall be caught up together with them in the clouds, to meet Yahuah (Lord) in the air* (1 Thessalonians 4:17). The trumpet that gathers the elect from the four winds is the trump of Elohim (God) that catches up the living together with the raised — the one ingathering of the scattered people to meet the returning King, the Olivet word and the apostolic word naming one event.'),
  -- thread: 1-thessalonians-4-the-earth-gives-back-her-dead-the-day-of-resurrection-2-esdras-7-1-enoch-51
  ('canon','1-thessalonians',4,16,'apocrypha','2-esdras',7,32,'extras', E'*And the earth shall restore those that are asleep in her, and so shall the dust those that dwell in silence, and the secret places shall deliver those souls that were committed to them.* (2 Esdras 7:32). The restored library held the same hope of resurrection: *the earth shall restore those that are asleep in her... and the secret places shall deliver those souls.* This is the rising Paul declares — *them which are asleep... the dead in Messiah (Christ) shall rise first* (1 Thessalonians 4:13,16). The earth restoring the asleep and the dust giving up those who dwell in silence is the dead in Messiah (Christ) raised at the trump; the Hebrew witness names the one day the earth gives back her dead before the seat of judgment.'),
  ('canon','1-thessalonians',4,16,'enoch','1-enoch',51,1,'extras', E'*And in those days shall the earth also give back that which has been entrusted to it, And Sheol also shall give back that which it has received, And hell shall give back that which it owes. For in those days the Elect One shall arise,* (1 Enoch 51:1). The library beholds the day of resurrection: *the earth shall give back that which has been entrusted to it, And Sheol also shall give back that which it has received,* and *the Elect One shall arise.* This is the day Paul names — *Yahuah (Lord) himself shall descend from heaven with a shout... and the dead in Messiah (Christ) shall rise first* (1 Thessalonians 4:16). Sheol giving back what it received at the arising of the Elect One is the dead in Messiah (Christ) raised at the descending of the King; the one ingathering when the earth and the grave surrender the asleep, that the chosen should be saved.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s233_t104_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s233_t104_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-thessalonians-4-sanctification-abstain-from-fornication-the-holiness-code-leviticus-18-20',
       E'The will of Elohim, your sanctification: the holiness code (Leviticus 18-20)',
       E'Paul names the will of Elohim (God) plainly: *this is the will of Elohim (God), even your sanctification, that ye should abstain from fornication... not in the lust of concupiscence, even as the Gentiles which know not Elohim (God)... For Elohim (God) hath not called us unto uncleanness, but unto holiness* (1 Thessalonians 4:3,5,7). This is the holiness code of Leviticus carried into the assembly, not a new ethic invented for the nations. The ground of it is Yahuah''s (LORD''s) own charge: *Ye shall be holy: for I Yahuah Elohaychem (the LORD your God) am holy* (Leviticus 19:2). The forbidden uncleanness is the *abominable customs* against which Leviticus guards — *that ye defile not yourselves therein: I am Yahuah Elohaychem (the LORD your God)* (Leviticus 18:30) — the doings of the land that know not Elohim (God). And the calling unto holiness is the severing of the people unto Yahuah (LORD): *ye shall be holy unto me: for I Yahuah (LORD) am holy, and have severed you from other people, that ye should be mine* (Leviticus 20:26). The sanctification the apostle commands is the Torah of holiness spoken to the called-out — to be holy because Yahuah (LORD) is holy, severed from uncleanness, the same standard given at Sinai now written upon the gathered seed.',
       sv.verse_id, ev.verse_id, 'free', 8125
  FROM _s233_t104_lookup sv, _s233_t104_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=4 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='1-thessalonians' AND ev.chapter_number=4 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-thessalonians-4-taught-of-elohim-to-love-the-law-written-on-the-heart-jeremiah-31',
       E'Taught of Elohim to love one another: the law written on the heart (Jeremiah 31)',
       E'*As touching brotherly love ye need not that I write unto you: for ye yourselves are taught of Elohim (God) to love one another* (1 Thessalonians 4:9). To be *taught of Elohim (God)* — needing no outward writing — is the very promise of the new covenant Yahuah (LORD) made with the house of Yashar''el (Israel): *I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people* (Jeremiah 31:33). The law of love is not abolished and replaced; it is the same Torah put within, inscribed on the heart so that the gathered people know to love one another without an outward command. The apostle does not set love against the law but names the law fulfilled in the heart — the new covenant of Jeremiah come, the people who are taught of Elohim (God) because his Torah is written in their inward parts.',
       sv.verse_id, ev.verse_id, 'free', 8128
  FROM _s233_t104_lookup sv, _s233_t104_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=4 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='1-thessalonians' AND ev.chapter_number=4 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-thessalonians-4-the-dead-in-messiah-rise-the-trump-of-gathering-isaiah-27-daniel-12',
       E'The dead in Messiah rise first: the trump of the gathering (Isaiah 27, Daniel 12, Ezekiel 37)',
       E'This is the apostle''s great word of the resurrection and the gathering: *I would not have you to be ignorant, brethren, concerning them which are asleep, that ye sorrow not, even as others which have no hope... Yahuah (Lord) himself shall descend from heaven with a shout, with the voice of the archangel, and with the trump of Elohim (God): and the dead in Messiah (Christ) shall rise first: Then we which are alive and remain shall be caught up together with them in the clouds, to meet Yahuah (Lord) in the air: and so shall we ever be with Yahuah (Lord)* (1 Thessalonians 4:13,16-17). Read it through the whole library, for it is the ONE great resurrection-ingathering at the last trump — not a secret, pre-tribulation rapture severed from Yashar''el (Israel), and not a separate program for a church that replaced Israel. The *trump of Elohim (God)* is the trumpet of Isaiah: *the great trumpet shall be blown, and they shall come which were ready to perish... and the outcasts... and shall worship Yahuah (LORD) in the holy mount at Jerusalem* (Isaiah 27:13) — the regathering of the scattered outcasts of Yashar''el (Israel). The rising of *the dead in Messiah (Christ)* is the resurrection of the Tanakh: *many of them that sleep in the dust of the earth shall awake* (Daniel 12:2); *Thy dead men shall live... Awake and sing, ye that dwell in dust... and the earth shall cast out the dead* (Isaiah 26:19); and the opened graves of the whole house of Yashar''el (Israel) — *I will open your graves, and cause you to come up out of your graves, and bring you into the land of Yashar''el (Israel)* (Ezekiel 37:12), *I will put my spirit in you, and ye shall live, and I shall place you in your own land* (Ezekiel 37:14). The *caught up together... to meet Yahuah (Lord) in the air* is that opened-grave people brought up and placed with their Elohim (God) — *so shall we ever be with Yahuah (Lord).* And the New Testament names the same trumpet and the same gathering: *at the last trump: for the trumpet shall sound, and the dead shall be raised incorruptible, and we shall be changed* (1 Corinthians 15:52), and *a great sound of a trumpet, and they shall gather together his elect from the four winds, from one end of heaven to the other* (Matthew 24:31). One trumpet, one resurrection, one ingathering: the gathered commonwealth of Yashar''el (Israel) and the grafted-in of the nations, the raised dead and the living changed, caught up together to meet the returning King. *Wherefore comfort one another with these words* (1 Thessalonians 4:18).',
       sv.verse_id, ev.verse_id, 'free', 8131
  FROM _s233_t104_lookup sv, _s233_t104_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=4 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='1-thessalonians' AND ev.chapter_number=4 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-thessalonians-4-the-earth-gives-back-her-dead-the-day-of-resurrection-2-esdras-7-1-enoch-51',
       E'The earth gives back her dead: the day of resurrection in the Hebrew library (2 Esdras 7, 1 Enoch 51)',
       E'The hope Paul preached — *the dead in Messiah (Christ) shall rise first* (1 Thessalonians 4:16) — the restored library held before him, beholding the one day the earth and the grave surrender the asleep. The seer of Esdras saw it: *the earth shall restore those that are asleep in her, and so shall the dust those that dwell in silence, and the secret places shall deliver those souls that were committed to them* (2 Esdras 7:32). And Enoch beheld the same: *in those days shall the earth also give back that which has been entrusted to it, And Sheol also shall give back that which it has received, And hell shall give back that which it owes. For in those days the Elect One shall arise* (1 Enoch 51:1). The earth restoring the asleep, Sheol giving back what it received at the arising of the Elect One — this is *Yahuah (Lord) himself shall descend from heaven... and the dead in Messiah (Christ) shall rise first.* The Hebrew witness frames it rightly: this is the one great day of resurrection-ingathering, when the chosen are saved and the earth gives up her dead at the appearing of the King — not a secret snatching severed from the people, but the one day the asleep are raised and gathered to their Elohim (God).',
       sv.verse_id, ev.verse_id, 'extras', 8134
  FROM _s233_t104_lookup sv, _s233_t104_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=4 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='1-thessalonians' AND ev.chapter_number=4 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-thessalonians-4-sanctification-abstain-from-fornication-the-holiness-code-leviticus-18-20
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 19:2 — *Ye shall be holy: for I Yahuah Elohaychem (the LORD your God) am holy* the ground of sanctification; *this is the will of Elohim (God), even your sanctification* (1 Thessalonians 4:3).'
  FROM cross_reference_threads t, cross_references x, _s233_t104_lookup sv, _s233_t104_lookup tv
 WHERE t.slug='1-thessalonians-4-sanctification-abstain-from-fornication-the-holiness-code-leviticus-18-20'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=4 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 18:30 — *that ye defile not yourselves therein: I am Yahuah Elohaychem (the LORD your God)* the guard against the abominable customs of the nations; *abstain from fornication... even as the Gentiles which know not Elohim (God)* (1 Thessalonians 4:3,5).'
  FROM cross_reference_threads t, cross_references x, _s233_t104_lookup sv, _s233_t104_lookup tv
 WHERE t.slug='1-thessalonians-4-sanctification-abstain-from-fornication-the-holiness-code-leviticus-18-20'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=4 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=18 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 20:26 — *ye shall be holy unto me... and have severed you from other people, that ye should be mine* the severing unto holiness; *Elohim (God) hath not called us unto uncleanness, but unto holiness* (1 Thessalonians 4:7).'
  FROM cross_reference_threads t, cross_references x, _s233_t104_lookup sv, _s233_t104_lookup tv
 WHERE t.slug='1-thessalonians-4-sanctification-abstain-from-fornication-the-holiness-code-leviticus-18-20'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=4 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=20 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-thessalonians-4-taught-of-elohim-to-love-the-law-written-on-the-heart-jeremiah-31
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 31:33 — *I will put my law in their inward parts, and write it in their hearts* the new covenant Torah within; *ye yourselves are taught of Elohim (God) to love one another* (1 Thessalonians 4:9).'
  FROM cross_reference_threads t, cross_references x, _s233_t104_lookup sv, _s233_t104_lookup tv
 WHERE t.slug='1-thessalonians-4-taught-of-elohim-to-love-the-law-written-on-the-heart-jeremiah-31'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=4 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-thessalonians-4-the-dead-in-messiah-rise-the-trump-of-gathering-isaiah-27-daniel-12
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 27:13 — *the great trumpet shall be blown, and they shall come which were ready to perish... and the outcasts... and shall worship Yahuah (LORD)* the trump that regathers the scattered; *with the trump of Elohim (God): and the dead in Messiah (Christ) shall rise first* (1 Thessalonians 4:16).'
  FROM cross_reference_threads t, cross_references x, _s233_t104_lookup sv, _s233_t104_lookup tv
 WHERE t.slug='1-thessalonians-4-the-dead-in-messiah-rise-the-trump-of-gathering-isaiah-27-daniel-12'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=4 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=27 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 12:2 — *many of them that sleep in the dust of the earth shall awake* the resurrection of the Tanakh; *them which are asleep... the dead in Messiah (Christ) shall rise first* (1 Thessalonians 4:13,16).'
  FROM cross_reference_threads t, cross_references x, _s233_t104_lookup sv, _s233_t104_lookup tv
 WHERE t.slug='1-thessalonians-4-the-dead-in-messiah-rise-the-trump-of-gathering-isaiah-27-daniel-12'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=4 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 37:12 — *I will open your graves, and cause you to come up out of your graves, and bring you into the land of Yashar''el (Israel)* the two-house people raised; *the dead in Messiah (Christ) shall rise first* (1 Thessalonians 4:16).'
  FROM cross_reference_threads t, cross_references x, _s233_t104_lookup sv, _s233_t104_lookup tv
 WHERE t.slug='1-thessalonians-4-the-dead-in-messiah-rise-the-trump-of-gathering-isaiah-27-daniel-12'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=4 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ezekiel 37:14 — *I will put my spirit in you, and ye shall live, and I shall place you in your own land* the people brought to dwell with Yahuah (LORD); *and so shall we ever be with Yahuah (Lord)* (1 Thessalonians 4:17).'
  FROM cross_reference_threads t, cross_references x, _s233_t104_lookup sv, _s233_t104_lookup tv
 WHERE t.slug='1-thessalonians-4-the-dead-in-messiah-rise-the-trump-of-gathering-isaiah-27-daniel-12'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=4 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Isaiah 26:19 — *Thy dead men shall live... Awake and sing, ye that dwell in dust... and the earth shall cast out the dead* the song of resurrection; *the dead in Messiah (Christ) shall rise first* (1 Thessalonians 4:16).'
  FROM cross_reference_threads t, cross_references x, _s233_t104_lookup sv, _s233_t104_lookup tv
 WHERE t.slug='1-thessalonians-4-the-dead-in-messiah-rise-the-trump-of-gathering-isaiah-27-daniel-12'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=4 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=26 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'1 Corinthians 15:52 — *at the last trump: for the trumpet shall sound, and the dead shall be raised incorruptible* the exact resurrection-trump twin; *with the trump of Elohim (God): and the dead in Messiah (Christ) shall rise first* (1 Thessalonians 4:16).'
  FROM cross_reference_threads t, cross_references x, _s233_t104_lookup sv, _s233_t104_lookup tv
 WHERE t.slug='1-thessalonians-4-the-dead-in-messiah-rise-the-trump-of-gathering-isaiah-27-daniel-12'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=4 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=52
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Matthew 24:31 — *a great sound of a trumpet, and they shall gather together his elect from the four winds* the Olivet trumpet-gathering; *caught up together with them in the clouds, to meet Yahuah (Lord) in the air* (1 Thessalonians 4:17).'
  FROM cross_reference_threads t, cross_references x, _s233_t104_lookup sv, _s233_t104_lookup tv
 WHERE t.slug='1-thessalonians-4-the-dead-in-messiah-rise-the-trump-of-gathering-isaiah-27-daniel-12'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=4 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-thessalonians-4-the-earth-gives-back-her-dead-the-day-of-resurrection-2-esdras-7-1-enoch-51
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Esdras 7:32 — *the earth shall restore those that are asleep in her... and the secret places shall deliver those souls* the day the earth gives back her dead; *the dead in Messiah (Christ) shall rise first* (1 Thessalonians 4:16).'
  FROM cross_reference_threads t, cross_references x, _s233_t104_lookup sv, _s233_t104_lookup tv
 WHERE t.slug='1-thessalonians-4-the-earth-gives-back-her-dead-the-day-of-resurrection-2-esdras-7-1-enoch-51'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=4 AND sv.verse_number=16
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=7 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 51:1 — *the earth shall give back that which has been entrusted to it, And Sheol also shall give back that which it has received... the Elect One shall arise* the grave surrenders the asleep at the arising of the Elect One; *Yahuah (Lord) himself shall descend from heaven... and the dead in Messiah (Christ) shall rise first* (1 Thessalonians 4:16).'
  FROM cross_reference_threads t, cross_references x, _s233_t104_lookup sv, _s233_t104_lookup tv
 WHERE t.slug='1-thessalonians-4-the-earth-gives-back-her-dead-the-day-of-resurrection-2-esdras-7-1-enoch-51'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=4 AND sv.verse_number=16
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=51 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1thessalonians_05.sql (S233 1 Thessalonians 5) -----
-- =====================================================================
-- S233 minion — 1 THESSALONIANS 5 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 1 THESSALONIANS 5 (28 verses) — ★ HIGH watchpoint / BLESSING (the day of Yahuah).
-- Tag: t105 (temp view _s233_t105_lookup).
-- Sort band: floor 8150, step 3 (8150, 8153, 8156, 8159 used; under 8175).
-- Source is ALWAYS the canon 1-thessalonians verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME: the day of Yahuah, the children of light, and the armour of righteousness belong to
-- the one olive tree — the regathered house of Yashar'el (Israel) and the grafted-in nations who turned
-- from idols to the living Elohim (God). The day of Yahuah is no new apostolic invention but the prophets'
-- own day of darkness (Joel/Amos/Zephaniah/Malachi); it comes as a thief on the night-children, but the
-- children of light are not overtaken. No replacement theology, no law-vs-grace antithesis: *I am Yahuah
-- which sanctify you* (Leviticus 20:8) is the same Elohim (God) of peace who sanctifies the assembly
-- wholly. Christology — the Formed: salvation is *by our Lord Yahusha HaMashiach (Lord Jesus Christ)*
-- (5:9), the Son the Father appointed, who died for us; the coming (5:23) is his parousia. Names quoted
-- EXACTLY as dump_canon returns: the day-of-Yahuah texts render *Yahuah (LORD)* / *Yahuah (Lord)*; the
-- titular references render *Lord* (*over you in Yahuah (Lord)*, *our Lord Yahusha HaMashiach*).
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-3   the day of Yahuah cometh as a thief in the night; sudden destruction
--           Tanakh: Joel 2:1 (blow the trumpet... the day of Yahuah cometh), Joel 2:2 (a day of
--                   darkness), Joel 2:31 (sun darkened... the great and terrible day), Amos 5:18 +
--                   5:20 (the day of Yahuah is darkness, and not light), Zephaniah 1:14 + 1:15 (the
--                   great day of Yahuah... a day of wrath), Malachi 4:1 (the day cometh, that shall
--                   burn as an oven)
--           Extras: none warranted (this edition's 1 Enoch 108 lacks a clean day-of-darkness witness;
--                   the prophets carry the full weight)
--           NT: Matthew 24:43 (the thief in the watch), 2 Peter 3:10 (the day of Yahuah will come as
--               a thief in the night), Revelation 16:15 (Behold, I come as a thief)
--   v.4-5   ye are not in darkness; children of light, and children of the day
--           Tanakh: Isaiah 60:1 (Arise, shine; for thy light is come), Isaiah 60:2 (darkness shall
--                   cover the earth... but Yahuah shall arise upon thee)
--           Extras: 1 Enoch 58:3 (the righteous in the light of the sun... the darkness is past),
--                   1 Enoch 58:6 (the light established for ever... the darkness destroyed)
--           NT: none warranted (the light root is the Tanakh witness; carried in prose)
--   v.6-7   let us not sleep, but watch and be sober (night vs day)
--           Tanakh / Extras / NT: none warranted as a separate thread — folded into the day-of-Yahuah
--                   and children-of-light weaves (the thief overtakes the sleeping night-children)
--   v.8     the breastplate of faith and love; for an helmet, the hope of salvation
--           Tanakh: Isaiah 59:17 (he put on righteousness as a breastplate, and an helmet of salvation)
--           Extras: Wisdom of Solomon 5:18 (He shall put on righteousness as a breastplate, and true
--                   judgment instead of an helmet)
--           NT: Ephesians 6:14 (the breastplate of righteousness), Ephesians 6:16 (the shield of
--               faith), Ephesians 6:17 (the helmet of salvation)
--   v.9-15  not appointed to wrath but to salvation; comfort; esteem the labourers; follow the good
--           Tanakh / Extras / NT: none warranted (pastoral exhortation; the wrath/salvation antithesis
--                   is carried in the day-of-Yahuah thread)
--   v.16-22 rejoice / pray / give thanks / quench not the Spirit / prove all things
--           Tanakh / Extras / NT: none warranted — a string of brief imperatives with no single
--                   load-bearing parallel; verbal echoes (Ps 34:1 etc.) lack framework weight, so per
--                   the curated standard no thread is forced here
--   v.23    the very Elohim of peace sanctify you wholly; whole spirit and soul and body preserved
--           Tanakh: Leviticus 20:8 (I am Yahuah which sanctify you), Psalm 121:7 (Yahuah shall preserve
--                   thy soul), Numbers 6:24 + 6:26 (Yahuah bless thee, and keep thee... give thee peace)
--           Extras: none warranted   NT: none warranted (the sanctify/preserve root is the Tanakh)
--   v.24-28 faithful is he that calleth; greet the brethren; grace be with you
--           Tanakh / Extras / NT: none warranted (epistolary close)
--
-- THREADS (slug -> target libraries):
--   8150 1-thessalonians-5-the-day-of-yahuah-as-a-thief-in-the-night-joel-2-amos-5  (Tanakh + NT)  [★ BLESSING]
--   8153 1-thessalonians-5-children-of-light-and-of-the-day-isaiah-60-1-enoch-58    (Tanakh + Extras)
--   8156 1-thessalonians-5-the-breastplate-of-faith-and-the-helmet-of-salvation-isaiah-59-ephesians-6  (Tanakh + Extras + NT)
--   8159 1-thessalonians-5-the-elohim-of-peace-sanctify-and-preserve-you-wholly-leviticus-20-psalm-121  (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s233_t105_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-thessalonians-5-the-day-of-yahuah-as-a-thief-in-the-night-joel-2-amos-5  [★ BLESSING]
  ('canon', '1-thessalonians', 5, 2, 'canon', 'joel', 2, 1, 'free', E'*Blow ye the trumpet in Zion, and sound an alarm in my holy mountain: let all the inhabitants of the land tremble: for the day of Yahuah (LORD) cometh, for it is nigh at hand;* (Joel 2:1). Paul speaks no new thing when he writes that *the day of Yahuah (Lord) so cometh as a thief in the night* (1 Thessalonians 5:2). The day is the prophets'' own day — Joel sounds the alarm in Zion because *the day of Yahuah (LORD) cometh,* nigh at hand. The apostle takes the prophetic day of Yahuah and presses its nearness on the assembly: it comes, and the night-children do not see it draw near.'),
  ('canon', '1-thessalonians', 5, 2, 'canon', 'joel', 2, 31, 'free', E'*The sun shall be turned into darkness, and the moon into blood, before the great and the terrible day of Yahuah (LORD) come.* (Joel 2:31). The day of Yahuah comes wrapped in darkness — *the sun... turned into darkness, and the moon into blood.* So Paul writes of *the day of Yahuah (Lord)* coming *as a thief in the night* (1 Thessalonians 5:2): it is a night-day, a day of sudden overtaking, the great and terrible day the prophets named long before the apostle wrote.'),
  ('canon', '1-thessalonians', 5, 4, 'canon', 'joel', 2, 2, 'free', E'*A day of darkness and of gloominess, a day of clouds and of thick darkness, as the morning spread upon the mountains: a great people and a strong; there hath not been ever the like, neither shall be any more after it, even to the years of many generations.* (Joel 2:2). The day of Yahuah is *a day of darkness and of gloominess.* This is why Paul can say *But ye, brethren, are not in darkness, that that day should overtake you as a thief* (1 Thessalonians 5:4): the day is darkness to the night-children, but those who are of the light are not swallowed in it. The darkness of Joel''s day is the very thing the children of the day are delivered from.'),
  ('canon', '1-thessalonians', 5, 2, 'canon', 'amos', 5, 18, 'free', E'*Woe unto you that desire the day of Yahuah (LORD)! to what end is it for you? the day of Yahuah (LORD) is darkness, and not light.* (Amos 5:18). Amos warns those who long carelessly for the day: *the day of Yahuah (LORD) is darkness, and not light.* Paul builds the same contrast — *the day of Yahuah (Lord) so cometh as a thief in the night* (1 Thessalonians 5:2) — and then divides the assembly from that darkness: those who *are all the children of light, and the children of the day* (1 Thessalonians 5:5) are not the ones for whom the day is darkness. The apostle takes Amos''s word and shows for whom the day is light and for whom it is night.'),
  ('canon', '1-thessalonians', 5, 4, 'canon', 'amos', 5, 20, 'free', E'*Shall not the day of Yahuah (LORD) be darkness, and not light? even very dark, and no brightness in it?* (Amos 5:20). Amos presses it again: the day of Yahuah is *very dark, and no brightness in it.* Paul answers across the centuries — *ye, brethren, are not in darkness, that that day should overtake you as a thief* (1 Thessalonians 5:4). The day that is unrelieved darkness to the sinner does not overtake the children of the day as a thief, for they are awake and clothed with light.'),
  ('canon', '1-thessalonians', 5, 2, 'canon', 'zephaniah', 1, 14, 'free', E'*The great day of Yahuah (LORD) is near, it is near, and hasteth greatly, even the voice of the day of Yahuah (LORD): the mighty man shall cry there bitterly.* (Zephaniah 1:14). Zephaniah cries that *the great day of Yahuah (LORD) is near... and hasteth greatly.* Paul says the same of *the day of Yahuah (Lord)* coming *as a thief in the night* (1 Thessalonians 5:2): its nearness and its suddenness are the prophet''s own, the day that hastes upon the careless before they cry *Peace and safety* (1 Thessalonians 5:3).'),
  ('canon', '1-thessalonians', 5, 3, 'canon', 'zephaniah', 1, 15, 'free', E'*That day is a day of wrath, a day of trouble and distress, a day of wasteness and desolation, a day of darkness and gloominess, a day of clouds and thick darkness,* (Zephaniah 1:15). The day of Yahuah is *a day of wrath... a day of darkness and gloominess.* Paul describes its onset upon the secure: *when they shall say, Peace and safety; then sudden destruction cometh upon them, as travail upon a woman with child; and they shall not escape* (1 Thessalonians 5:3). The wrath and the desolation Zephaniah names break out as the sudden travail the apostle warns of — the day from which the night-dwellers cannot flee.'),
  ('canon', '1-thessalonians', 5, 3, 'canon', 'malachi', 4, 1, 'free', E'*For, behold, the day cometh, that shall burn as an oven; and all the proud, yea, and all that do wickedly, shall be stubble: and the day that cometh shall burn them up, saith Yahuah Tseva''ot (LORD of hosts), that it shall leave them neither root nor branch.* (Malachi 4:1). Malachi closes the prophets with the day that *shall burn as an oven,* consuming the proud and the wicked as stubble. This is the *sudden destruction* that *cometh upon them* who say *Peace and safety* (1 Thessalonians 5:3); the day that leaves the wicked neither root nor branch is the day Paul says shall not escape those who sleep in the night.'),
  ('canon', '1-thessalonians', 5, 2, 'canon', 'matthew', 24, 43, 'free', E'*But know this, that if the goodman of the house had known in what watch the thief would come, he would have watched, and would not have suffered his house to be broken up.* (Matthew 24:43). Yahusha (Jesus) gave the very figure Paul uses: the day comes like *the thief* in an unknown watch, so the householder must watch. Paul echoes the Master''s parable — *the day of Yahuah (Lord) so cometh as a thief in the night* (1 Thessalonians 5:2) — and draws the same charge: *let us watch and be sober* (1 Thessalonians 5:6). The thief-in-the-night of the Olivet teaching is the day of Yahuah of the prophets, one and the same warning.'),
  ('canon', '1-thessalonians', 5, 2, 'canon', '2-peter', 3, 10, 'free', E'*But the day of Yahuah (Lord) will come as a thief in the night; in the which the heavens shall pass away with a great noise, and the elements shall melt with fervent heat, the earth also and the works that are therein shall be burned up.* (2 Peter 3:10). Peter speaks the same word as Paul, almost letter for letter: *the day of Yahuah (Lord) will come as a thief in the night.* Two apostles, one testimony — *the day of Yahuah (Lord) so cometh as a thief in the night* (1 Thessalonians 5:2). And Peter unfolds what that day burns: the heavens pass, the elements melt, as Malachi''s oven burns the stubble. The apostolic day of Yahuah is the prophets'' day of fire and darkness.'),
  ('canon', '1-thessalonians', 5, 4, 'canon', 'revelation', 16, 15, 'free', E'*Behold, I come as a thief. Blessed is he that watcheth, and keepeth his garments, lest he walk naked, and they see his shame.* (Revelation 16:15). The returning Yahusha (Jesus) takes the figure to himself: *Behold, I come as a thief.* The blessing falls on the one who *watcheth, and keepeth his garments* — the very wakefulness Paul commends, for *ye, brethren, are not in darkness, that that day should overtake you as a thief* (1 Thessalonians 5:4). The thief-coming of the day of Yahuah does not surprise the watching, garment-clad children of the day, who *let us watch and be sober* (1 Thessalonians 5:6).'),
  -- thread: 1-thessalonians-5-children-of-light-and-of-the-day-isaiah-60-1-enoch-58
  ('canon', '1-thessalonians', 5, 5, 'canon', 'isaiah', 60, 1, 'free', E'*Arise, shine; for thy light is come, and the glory of Yahuah (LORD) is risen upon thee.* (Isaiah 60:1). Isaiah calls the gathered to rise into the risen light of Yahuah (LORD): *Arise, shine; for thy light is come.* Paul declares it accomplished in the assembly — *Ye are all the children of light, and the children of the day: we are not of the night, nor of darkness* (1 Thessalonians 5:5). The light come upon Zion is the light the children of the day now walk in; they are of the day because the glory of Yahuah (LORD) has risen upon them.'),
  ('canon', '1-thessalonians', 5, 5, 'canon', 'isaiah', 60, 2, 'free', E'*For, behold, the darkness shall cover the earth, and gross darkness the people: but Yahuah (LORD) shall arise upon thee, and his glory shall be seen upon thee.* (Isaiah 60:2). Isaiah sets the two peoples side by side: *darkness shall cover the earth, and gross darkness the people: but Yahuah (LORD) shall arise upon thee.* This is precisely Paul''s division — the children *of the night, nor of darkness* against those who *are all the children of light, and the children of the day* (1 Thessalonians 5:5). While gross darkness covers the earth, Yahuah (LORD) arises upon his own; the children of light are those upon whom his glory is seen.'),
  ('canon', '1-thessalonians', 5, 5, 'enoch', '1-enoch', 58, 3, 'extras', E'*And the righteous shall be in the light of the sun, And the elect in the light of eternal life: The days of their life shall be unending, And the days of the holy and elect shall be without number.* (1 Enoch 58:3). The Hebrew library sees the same destiny of the righteous: they *shall be in the light of the sun,* the elect *in the light of eternal life.* This is the lot of those Paul names *the children of light, and the children of the day... not of the night, nor of darkness* (1 Thessalonians 5:5) — the elect whose portion is light without end, set apart from the night that overtakes the sleeping.'),
  ('canon', '1-thessalonians', 5, 5, 'enoch', '1-enoch', 58, 6, 'extras', E'*And there shall be no limit to the light Which shall never cease; For the darkness shall be destroyed, And the light established for ever and ever before Yahuah (God) of Spirits.* (1 Enoch 58:6). The library promises a light that *shall never cease* while *the darkness shall be destroyed.* Paul stands the assembly on the day-side of that final division: *we are not of the night, nor of darkness* (1 Thessalonians 5:5). The light established for ever is the children of the day''s inheritance; the destroyed darkness is the night from which they have been delivered.'),
  -- thread: 1-thessalonians-5-the-breastplate-of-faith-and-the-helmet-of-salvation-isaiah-59-ephesians-6
  ('canon', '1-thessalonians', 5, 8, 'canon', 'isaiah', 59, 17, 'free', E'*For he put on righteousness as a breastplate, and an helmet of salvation upon his head; and he put on the garments of vengeance for clothing, and was clad with zeal as a cloke.* (Isaiah 59:17). Isaiah shows Yahuah (LORD) himself armed for deliverance — *he put on righteousness as a breastplate, and an helmet of salvation upon his head.* Paul puts that same armour on the children of the day: *putting on the breastplate of faith and love; and for an helmet, the hope of salvation* (1 Thessalonians 5:8). The breastplate and the helmet of salvation that Yahuah (LORD) wears to save are given to his people to wear as they watch for the day; what is the Deliverer''s own armour becomes the soldier''s.'),
  ('canon', '1-thessalonians', 5, 8, 'apocrypha', 'the-wisdom-of-solomon', 5, 18, 'extras', E'*He shall put on righteousness as a breastplate, and true judgment instead of an helmet.* (Wisdom of Solomon 5:18). The Hebrew library re-speaks Isaiah''s armour-of-Yahuah: *He shall put on righteousness as a breastplate, and true judgment instead of an helmet,* taking holiness for a shield and wrath for a sword to fight against the unwise. Paul hands the same panoply to the watchman: *putting on the breastplate of faith and love; and for an helmet, the hope of salvation* (1 Thessalonians 5:8). The breastplate and helmet the righteous Deliverer wears in the wisdom-tradition are the armour the children of the day put on to stand in the night.'),
  ('canon', '1-thessalonians', 5, 8, 'canon', 'ephesians', 6, 14, 'free', E'*Stand therefore, having your loins girt about with truth, and having on the breastplate of righteousness;* (Ephesians 6:14). To another assembly Paul names the same armour: *the breastplate of righteousness.* Here he writes *putting on the breastplate of faith and love* (1 Thessalonians 5:8) — the one Isaiah-rooted breastplate, named for the graces that fasten it. The apostle clothes both bodies of the called-out in the armour of Yahuah (LORD) of Isaiah 59, the breastplate that guards the heart of the watching soldier.'),
  ('canon', '1-thessalonians', 5, 8, 'canon', 'ephesians', 6, 16, 'free', E'*Above all, taking the shield of faith, wherewith ye shall be able to quench all the fiery darts of the wicked.* (Ephesians 6:16). In the fuller armour Paul gives faith its own piece — *the shield of faith.* In Thessalonica he weaves faith into the breastplate itself: *putting on the breastplate of faith and love* (1 Thessalonians 5:8). One apostle, one armoury drawn from Isaiah 59: faith girds and guards the child of the day against the darts of the night.'),
  ('canon', '1-thessalonians', 5, 8, 'canon', 'ephesians', 6, 17, 'free', E'*And take the helmet of salvation, and the sword of the Spirit, which is the word of Elohim (God):* (Ephesians 6:17). Paul names *the helmet of salvation* — the very helmet of Isaiah 59:17 — and to the Thessalonians he gives the same crown of the head: *for an helmet, the hope of salvation* (1 Thessalonians 5:8). The helmet that Yahuah (LORD) wore to deliver, that the apostle commands the Ephesian assembly to take, is the hope of salvation that guards the mind of the watching children of the day.'),
  -- thread: 1-thessalonians-5-the-elohim-of-peace-sanctify-and-preserve-you-wholly-leviticus-20-psalm-121
  ('canon', '1-thessalonians', 5, 23, 'canon', 'leviticus', 20, 8, 'free', E'*And ye shall keep my statutes, and do them: I am Yahuah (LORD) which sanctify you.* (Leviticus 20:8). The sanctifying is Yahuah''s (LORD''s) own work, declared in the holiness code: *I am Yahuah (LORD) which sanctify you.* Paul prays it for the assembly — *the very Elohim (God) of peace sanctify you wholly* (1 Thessalonians 5:23). The Elohim (God) who set apart Yashar''el (Israel) by his statutes is the same Elohim (God) who sanctifies the gathered wholly; this is no new sanctification severed from the Torah, but the one Yahuah (LORD) who sanctifies completing his work in his people.'),
  ('canon', '1-thessalonians', 5, 23, 'canon', 'psalms', 121, 7, 'free', E'*Yahuah (LORD) shall preserve thee from all evil: he shall preserve thy soul.* (Psalm 121:7). The psalm of ascents trusts that *Yahuah (LORD)... shall preserve thy soul.* Paul prays exactly this preservation upon the whole person: *your whole spirit and soul and body be preserved blameless unto the coming of our Lord Yahusha HaMashiach (Lord Jesus Christ)* (1 Thessalonians 5:23). The keeper of Yashar''el (Israel) who preserves the soul is the One who will preserve the assembly entire and blameless until the day they watch for.'),
  ('canon', '1-thessalonians', 5, 23, 'canon', 'numbers', 6, 26, 'free', E'*Yahuah (LORD) lift up his countenance upon thee, and give thee peace.* (Numbers 6:26). The priestly blessing ends in peace — *Yahuah (LORD)... give thee peace.* Paul names that same Yahuah (LORD) *the very Elohim (God) of peace* who sanctifies and preserves the assembly (1 Thessalonians 5:23). The Elohim (God) of peace who blesses and keeps Yashar''el (Israel) in the Aaronic benediction is the One Paul invokes to keep the whole spirit and soul and body blameless unto the coming.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s233_t105_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s233_t105_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-thessalonians-5-the-day-of-yahuah-as-a-thief-in-the-night-joel-2-amos-5',
       E'The day of Yahuah cometh as a thief in the night (Joel 2, Amos 5)',
       E'*For yourselves know perfectly that the day of Yahuah (Lord) so cometh as a thief in the night* (1 Thessalonians 5:2). Paul invents no new doctrine here; he presses on the assembly the prophets'' own day of Yahuah. Joel sounds the alarm — *Blow ye the trumpet in Zion... for the day of Yahuah (LORD) cometh, for it is nigh at hand* (Joel 2:1) — and names its character, *A day of darkness and of gloominess, a day of clouds and of thick darkness* (Joel 2:2), *The sun shall be turned into darkness, and the moon into blood, before the great and the terrible day of Yahuah (LORD) come* (Joel 2:31). Amos sets the same word against false security: *Woe unto you that desire the day of Yahuah (LORD)!... the day of Yahuah (LORD) is darkness, and not light* (Amos 5:18), *Shall not the day of Yahuah (LORD) be darkness, and not light? even very dark, and no brightness in it?* (Amos 5:20). Zephaniah cries its nearness and its wrath — *The great day of Yahuah (LORD) is near... and hasteth greatly* (Zephaniah 1:14), *That day is a day of wrath, a day of trouble and distress... a day of darkness and gloominess* (Zephaniah 1:15) — and Malachi seals the prophets with its fire: *behold, the day cometh, that shall burn as an oven; and all the proud, yea, and all that do wickedly, shall be stubble* (Malachi 4:1). This is the day Paul says comes upon the careless *when they shall say, Peace and safety; then sudden destruction cometh upon them, as travail upon a woman with child; and they shall not escape* (1 Thessalonians 5:3). Yahusha (Jesus) himself gave the thief-figure — *if the goodman of the house had known in what watch the thief would come, he would have watched* (Matthew 24:43) — and Peter speaks Paul''s very words: *the day of Yahuah (Lord) will come as a thief in the night; in the which the heavens shall pass away with a great noise, and the elements shall melt with fervent heat* (2 Peter 3:10), and the returning King declares *Behold, I come as a thief. Blessed is he that watcheth, and keepeth his garments* (Revelation 16:15). The day of darkness overtakes the night-children as a thief; but Paul adds the deliverance — *ye, brethren, are not in darkness, that that day should overtake you as a thief* (1 Thessalonians 5:4) — and the charge, *Therefore let us not sleep, as do others; but let us watch and be sober* (1 Thessalonians 5:6). The prophets'' day of Yahuah and the apostolic thief in the night are one and the same warning, sounded from Zion to Thessalonica.',
       sv.verse_id, ev.verse_id, 'free', 8150
  FROM _s233_t105_lookup sv, _s233_t105_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=5 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='1-thessalonians' AND ev.chapter_number=5 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-thessalonians-5-children-of-light-and-of-the-day-isaiah-60-1-enoch-58',
       E'Ye are all the children of light, and the children of the day (Isaiah 60, 1 Enoch 58)',
       E'*Ye are all the children of light, and the children of the day: we are not of the night, nor of darkness* (1 Thessalonians 5:5). Against the day of darkness that overtakes the sleeping, Paul sets the assembly on the day-side of the great division — and that division is Isaiah''s. *Arise, shine; for thy light is come, and the glory of Yahuah (LORD) is risen upon thee* (Isaiah 60:1); and the contrast: *For, behold, the darkness shall cover the earth, and gross darkness the people: but Yahuah (LORD) shall arise upon thee, and his glory shall be seen upon thee* (Isaiah 60:2). While gross darkness covers the peoples, Yahuah (LORD) rises upon his own — and those upon whom his glory is seen are the children of light, the children of the day. The Hebrew library holds the same hope: the righteous *shall be in the light of the sun, And the elect in the light of eternal life* (1 Enoch 58:3), for in the end *there shall be no limit to the light Which shall never cease; For the darkness shall be destroyed, And the light established for ever and ever before Yahuah (God) of Spirits* (1 Enoch 58:6). The portion of the elect is unceasing light; the night is destroyed. So Paul reasons from the assembly''s identity to its conduct: *Therefore let us not sleep, as do others; but let us watch and be sober* (1 Thessalonians 5:6), *For they that sleep sleep in the night; and they that be drunken are drunken in the night* (1 Thessalonians 5:7). Sleep and drunkenness belong to the night; watchfulness and sobriety to the day. Because the glory of Yahuah (LORD) has risen upon them, the children of the day are not overtaken by the day of darkness.',
       sv.verse_id, ev.verse_id, 'extras', 8153
  FROM _s233_t105_lookup sv, _s233_t105_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=5 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='1-thessalonians' AND ev.chapter_number=5 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-thessalonians-5-the-breastplate-of-faith-and-the-helmet-of-salvation-isaiah-59-ephesians-6',
       E'The breastplate of faith and the helmet of the hope of salvation (Isaiah 59, Ephesians 6)',
       E'*But let us, who are of the day, be sober, putting on the breastplate of faith and love; and for an helmet, the hope of salvation* (1 Thessalonians 5:8). The armour Paul hands the watching child of the day is the armour Yahuah (LORD) himself wears to deliver. Isaiah saw it on the Deliverer: *For he put on righteousness as a breastplate, and an helmet of salvation upon his head; and he put on the garments of vengeance for clothing, and was clad with zeal as a cloke* (Isaiah 59:17). The breastplate and the helmet of salvation are Yahuah''s (LORD''s) own; the apostle gives them to his people to wear in the night. The wisdom-tradition re-speaks the same panoply: *He shall put on righteousness as a breastplate, and true judgment instead of an helmet* (Wisdom of Solomon 5:18), taking holiness for a shield. And to the assembly at Ephesus Paul lays out the whole armour from the same Isaiah root — *having on the breastplate of righteousness* (Ephesians 6:14), *taking the shield of faith, wherewith ye shall be able to quench all the fiery darts of the wicked* (Ephesians 6:16), *And take the helmet of salvation, and the sword of the Spirit, which is the word of Elohim (God)* (Ephesians 6:17). One Deliverer''s armour, one apostolic armoury: the breastplate that guards the heart and the helmet that guards the mind, fastened in Thessalonica with faith and love and the hope of salvation. The child of the day is sober because he is armed, clothed in the very righteousness and salvation that Yahuah (LORD) put on to save.',
       sv.verse_id, ev.verse_id, 'extras', 8156
  FROM _s233_t105_lookup sv, _s233_t105_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=5 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='1-thessalonians' AND ev.chapter_number=5 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-thessalonians-5-the-elohim-of-peace-sanctify-and-preserve-you-wholly-leviticus-20-psalm-121',
       E'The Elohim of peace sanctify you wholly and preserve you blameless (Leviticus 20, Psalm 121)',
       E'*And the very Elohim (God) of peace sanctify you wholly; and I pray Elohim (God) your whole spirit and soul and body be preserved blameless unto the coming of our Lord Yahusha HaMashiach (Lord Jesus Christ)* (1 Thessalonians 5:23). Paul''s closing prayer rests on the Tanakh''s own Elohim (God), the one Yahuah (LORD) who sanctifies and who keeps. The sanctifying is his work, declared in the holiness code: *And ye shall keep my statutes, and do them: I am Yahuah (LORD) which sanctify you* (Leviticus 20:8) — no new sanctification cut off from the Torah, but the same Yahuah (LORD) who set apart Yashar''el (Israel) now setting apart the gathered assembly wholly. The preserving is his too: *Yahuah (LORD) shall preserve thee from all evil: he shall preserve thy soul* (Psalm 121:7), the keeper of Yashar''el (Israel) who guards the whole person. And the title Paul gives him — *the very Elohim (God) of peace* — is the priestly benediction''s own: *Yahuah (LORD) lift up his countenance upon thee, and give thee peace* (Numbers 6:26). The Elohim (God) who blesses, keeps, and gives peace to Yashar''el (Israel) is the One the apostle invokes to keep spirit and soul and body blameless until the coming. *Faithful is he that calleth you, who also will do it* (1 Thessalonians 5:24): the One who sanctifies is the One who will preserve, and he does not fail.',
       sv.verse_id, ev.verse_id, 'free', 8159
  FROM _s233_t105_lookup sv, _s233_t105_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=5 AND sv.verse_number=23
   AND ev.edition_slug='canon' AND ev.book_slug='1-thessalonians' AND ev.chapter_number=5 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-thessalonians-5-the-day-of-yahuah-as-a-thief-in-the-night-joel-2-amos-5
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joel 2:1 — *Blow ye the trumpet in Zion... for the day of Yahuah (LORD) cometh, for it is nigh at hand* the prophets'' day of Yahuah Paul presses on the assembly; *the day of Yahuah (Lord) so cometh as a thief in the night* (1 Thessalonians 5:2).'
  FROM cross_reference_threads t, cross_references x, _s233_t105_lookup sv, _s233_t105_lookup tv
 WHERE t.slug='1-thessalonians-5-the-day-of-yahuah-as-a-thief-in-the-night-joel-2-amos-5'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=5 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Joel 2:31 — *The sun shall be turned into darkness, and the moon into blood, before the great and the terrible day of Yahuah (LORD) come* the night-day of sudden overtaking; *as a thief in the night* (1 Thessalonians 5:2).'
  FROM cross_reference_threads t, cross_references x, _s233_t105_lookup sv, _s233_t105_lookup tv
 WHERE t.slug='1-thessalonians-5-the-day-of-yahuah-as-a-thief-in-the-night-joel-2-amos-5'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=5 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Joel 2:2 — *A day of darkness and of gloominess, a day of clouds and of thick darkness* the day''s character; *ye, brethren, are not in darkness, that that day should overtake you as a thief* (1 Thessalonians 5:4).'
  FROM cross_reference_threads t, cross_references x, _s233_t105_lookup sv, _s233_t105_lookup tv
 WHERE t.slug='1-thessalonians-5-the-day-of-yahuah-as-a-thief-in-the-night-joel-2-amos-5'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=5 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Amos 5:18 — *the day of Yahuah (LORD) is darkness, and not light* woe on those who carelessly desire it; the day Paul says comes as a thief (1 Thessalonians 5:2).'
  FROM cross_reference_threads t, cross_references x, _s233_t105_lookup sv, _s233_t105_lookup tv
 WHERE t.slug='1-thessalonians-5-the-day-of-yahuah-as-a-thief-in-the-night-joel-2-amos-5'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=5 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=5 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Amos 5:20 — *Shall not the day of Yahuah (LORD) be darkness, and not light? even very dark, and no brightness in it?* the day from which the children of the day are not overtaken (1 Thessalonians 5:4).'
  FROM cross_reference_threads t, cross_references x, _s233_t105_lookup sv, _s233_t105_lookup tv
 WHERE t.slug='1-thessalonians-5-the-day-of-yahuah-as-a-thief-in-the-night-joel-2-amos-5'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=5 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=5 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Zephaniah 1:14 — *The great day of Yahuah (LORD) is near, it is near, and hasteth greatly* its nearness and suddenness; the day that comes as a thief (1 Thessalonians 5:2).'
  FROM cross_reference_threads t, cross_references x, _s233_t105_lookup sv, _s233_t105_lookup tv
 WHERE t.slug='1-thessalonians-5-the-day-of-yahuah-as-a-thief-in-the-night-joel-2-amos-5'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=5 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='zephaniah' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Zephaniah 1:15 — *That day is a day of wrath, a day of trouble and distress... a day of darkness and gloominess* the wrath that breaks as sudden travail; *sudden destruction cometh upon them... they shall not escape* (1 Thessalonians 5:3).'
  FROM cross_reference_threads t, cross_references x, _s233_t105_lookup sv, _s233_t105_lookup tv
 WHERE t.slug='1-thessalonians-5-the-day-of-yahuah-as-a-thief-in-the-night-joel-2-amos-5'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=5 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='zephaniah' AND tv.chapter_number=1 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 8, E'Malachi 4:1 — *behold, the day cometh, that shall burn as an oven; and all the proud... shall be stubble* the consuming day; the sudden destruction upon those who say Peace and safety (1 Thessalonians 5:3).'
  FROM cross_reference_threads t, cross_references x, _s233_t105_lookup sv, _s233_t105_lookup tv
 WHERE t.slug='1-thessalonians-5-the-day-of-yahuah-as-a-thief-in-the-night-joel-2-amos-5'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=5 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=4 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 9, E'Matthew 24:43 — *if the goodman of the house had known in what watch the thief would come, he would have watched* Yahusha (Jesus)''s own thief-figure; *the day of Yahuah (Lord) so cometh as a thief in the night* (1 Thessalonians 5:2).'
  FROM cross_reference_threads t, cross_references x, _s233_t105_lookup sv, _s233_t105_lookup tv
 WHERE t.slug='1-thessalonians-5-the-day-of-yahuah-as-a-thief-in-the-night-joel-2-amos-5'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=5 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=43
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 10, E'2 Peter 3:10 — *the day of Yahuah (Lord) will come as a thief in the night; in the which the heavens shall pass away* Peter''s testimony almost word for word with Paul (1 Thessalonians 5:2); the day burns as Malachi''s oven.'
  FROM cross_reference_threads t, cross_references x, _s233_t105_lookup sv, _s233_t105_lookup tv
 WHERE t.slug='1-thessalonians-5-the-day-of-yahuah-as-a-thief-in-the-night-joel-2-amos-5'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=5 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=3 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 11, E'Revelation 16:15 — *Behold, I come as a thief. Blessed is he that watcheth, and keepeth his garments* the returning King takes the figure; the watching child of the day is not overtaken (1 Thessalonians 5:4).'
  FROM cross_reference_threads t, cross_references x, _s233_t105_lookup sv, _s233_t105_lookup tv
 WHERE t.slug='1-thessalonians-5-the-day-of-yahuah-as-a-thief-in-the-night-joel-2-amos-5'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=5 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=16 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-thessalonians-5-children-of-light-and-of-the-day-isaiah-60-1-enoch-58
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 60:1 — *Arise, shine; for thy light is come, and the glory of Yahuah (LORD) is risen upon thee* the risen light Paul declares accomplished; *ye are all the children of light, and the children of the day* (1 Thessalonians 5:5).'
  FROM cross_reference_threads t, cross_references x, _s233_t105_lookup sv, _s233_t105_lookup tv
 WHERE t.slug='1-thessalonians-5-children-of-light-and-of-the-day-isaiah-60-1-enoch-58'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=5 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=60 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 60:2 — *the darkness shall cover the earth... but Yahuah (LORD) shall arise upon thee, and his glory shall be seen upon thee* the two peoples divided; the children of light against those of the night (1 Thessalonians 5:5).'
  FROM cross_reference_threads t, cross_references x, _s233_t105_lookup sv, _s233_t105_lookup tv
 WHERE t.slug='1-thessalonians-5-children-of-light-and-of-the-day-isaiah-60-1-enoch-58'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=5 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=60 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 58:3 — *the righteous shall be in the light of the sun, And the elect in the light of eternal life* the elect''s portion of light; the children of the day, not of the night nor of darkness (1 Thessalonians 5:5).'
  FROM cross_reference_threads t, cross_references x, _s233_t105_lookup sv, _s233_t105_lookup tv
 WHERE t.slug='1-thessalonians-5-children-of-light-and-of-the-day-isaiah-60-1-enoch-58'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=5 AND sv.verse_number=5
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=58 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 58:6 — *there shall be no limit to the light Which shall never cease; For the darkness shall be destroyed* the unceasing light, the destroyed night; the day-side division Paul sets the assembly on (1 Thessalonians 5:5).'
  FROM cross_reference_threads t, cross_references x, _s233_t105_lookup sv, _s233_t105_lookup tv
 WHERE t.slug='1-thessalonians-5-children-of-light-and-of-the-day-isaiah-60-1-enoch-58'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=5 AND sv.verse_number=5
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=58 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-thessalonians-5-the-breastplate-of-faith-and-the-helmet-of-salvation-isaiah-59-ephesians-6
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 59:17 — *he put on righteousness as a breastplate, and an helmet of salvation upon his head* the Deliverer''s own armour, given to the watchman; *the breastplate of faith and love; and for an helmet, the hope of salvation* (1 Thessalonians 5:8).'
  FROM cross_reference_threads t, cross_references x, _s233_t105_lookup sv, _s233_t105_lookup tv
 WHERE t.slug='1-thessalonians-5-the-breastplate-of-faith-and-the-helmet-of-salvation-isaiah-59-ephesians-6'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=5 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=59 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Wisdom of Solomon 5:18 — *He shall put on righteousness as a breastplate, and true judgment instead of an helmet* the wisdom-tradition''s armour-of-the-righteous; the same breastplate and helmet the children of the day put on (1 Thessalonians 5:8).'
  FROM cross_reference_threads t, cross_references x, _s233_t105_lookup sv, _s233_t105_lookup tv
 WHERE t.slug='1-thessalonians-5-the-breastplate-of-faith-and-the-helmet-of-salvation-isaiah-59-ephesians-6'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=5 AND sv.verse_number=8
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=5 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ephesians 6:14 — *having on the breastplate of righteousness* the same Isaiah-rooted breastplate; in Thessalonica named for its graces, *the breastplate of faith and love* (1 Thessalonians 5:8).'
  FROM cross_reference_threads t, cross_references x, _s233_t105_lookup sv, _s233_t105_lookup tv
 WHERE t.slug='1-thessalonians-5-the-breastplate-of-faith-and-the-helmet-of-salvation-isaiah-59-ephesians-6'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=5 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=6 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ephesians 6:16 — *taking the shield of faith, wherewith ye shall be able to quench all the fiery darts of the wicked* faith its own piece there; woven into the breastplate here (1 Thessalonians 5:8).'
  FROM cross_reference_threads t, cross_references x, _s233_t105_lookup sv, _s233_t105_lookup tv
 WHERE t.slug='1-thessalonians-5-the-breastplate-of-faith-and-the-helmet-of-salvation-isaiah-59-ephesians-6'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=5 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=6 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Ephesians 6:17 — *take the helmet of salvation, and the sword of the Spirit, which is the word of Elohim (God)* the same helmet of Isaiah 59:17; the hope of salvation that guards the mind (1 Thessalonians 5:8).'
  FROM cross_reference_threads t, cross_references x, _s233_t105_lookup sv, _s233_t105_lookup tv
 WHERE t.slug='1-thessalonians-5-the-breastplate-of-faith-and-the-helmet-of-salvation-isaiah-59-ephesians-6'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=5 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=6 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-thessalonians-5-the-elohim-of-peace-sanctify-and-preserve-you-wholly-leviticus-20-psalm-121
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 20:8 — *ye shall keep my statutes, and do them: I am Yahuah (LORD) which sanctify you* the sanctifying is Yahuah''s (LORD''s) own work; *the very Elohim (God) of peace sanctify you wholly* (1 Thessalonians 5:23).'
  FROM cross_reference_threads t, cross_references x, _s233_t105_lookup sv, _s233_t105_lookup tv
 WHERE t.slug='1-thessalonians-5-the-elohim-of-peace-sanctify-and-preserve-you-wholly-leviticus-20-psalm-121'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=5 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=20 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 121:7 — *Yahuah (LORD) shall preserve thee from all evil: he shall preserve thy soul* the keeper of Yashar''el (Israel); *your whole spirit and soul and body be preserved blameless* (1 Thessalonians 5:23).'
  FROM cross_reference_threads t, cross_references x, _s233_t105_lookup sv, _s233_t105_lookup tv
 WHERE t.slug='1-thessalonians-5-the-elohim-of-peace-sanctify-and-preserve-you-wholly-leviticus-20-psalm-121'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=5 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=121 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Numbers 6:26 — *Yahuah (LORD) lift up his countenance upon thee, and give thee peace* the priestly benediction''s peace; *the very Elohim (God) of peace* who keeps the assembly blameless (1 Thessalonians 5:23).'
  FROM cross_reference_threads t, cross_references x, _s233_t105_lookup sv, _s233_t105_lookup tv
 WHERE t.slug='1-thessalonians-5-the-elohim-of-peace-sanctify-and-preserve-you-wholly-leviticus-20-psalm-121'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=5 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=6 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session233 — 1 Thessalonians cross-references complete.'
