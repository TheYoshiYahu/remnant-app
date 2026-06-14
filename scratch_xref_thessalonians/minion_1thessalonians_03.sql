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
