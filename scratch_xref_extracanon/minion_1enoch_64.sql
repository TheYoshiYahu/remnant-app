-- ----- fragment: minion_1enoch_64.sql (session250 1-enoch 64) -----
-- Source anchor: enoch/1-enoch ch64. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en64 (view _session250_en64_lookup). Sort band base 51575, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en64_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-64-fallen-angels-bound-in-judgment
  ('enoch', '1-enoch', 64, 3, 'canon', 'jude', 1, 6, 'free', E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude, who quotes Enoch by name, holds the same fallen angels Enoch sees bound in the place of judgment, reserved for the same great day.'),
  ('enoch', '1-enoch', 64, 3, 'canon', '2-peter', 2, 4, 'free', E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment;* Peter names the chains of darkness and the reserved judgment that Enoch 64:3 sees enacted in the place of the bound fallen angels.'),
  ('enoch', '1-enoch', 64, 3, 'enoch', '1-enoch', 10, 12, 'extras', E'1 Enoch 10:12 — *And when their sons have slain one another, and they have seen the destruction of their beloved ones, bind them fast for seventy generations in the valleys of the earth, till the day of their judgement and of their consummation, till the judgement that is for ever and ever is consummated.* The sentence decreed in Enoch 10 is the very imprisonment Enoch now beholds carried out in 64:3.'),
  ('enoch', '1-enoch', 64, 3, 'canon', 'revelation', 20, 2, 'free', E'Revelation 20:2 — *And he laid hold on the dragon, that old serpent, which is the Devil, and Satan, and bound him a thousand years,* The same bind-and-reserve-until-judgement pattern that holds the Watchers in Enoch 64:3 closes the canon with the binding of the dragon himself.'),
  -- thread: 1-enoch-64-spirits-of-the-giants
  ('enoch', '1-enoch', 64, 4, 'canon', 'genesis', 6, 4, 'free', E'Genesis 6:4 — *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown.* The canon''s own giants, begotten when the sons of Elohim came in unto the daughters of men, are the very spirits Enoch 64:4 sees bound for judgment.'),
  ('enoch', '1-enoch', 64, 4, 'jubilees', 'jubilees', 5, 1, 'extras', E'Jubilees 5:1 — *And it came to pass when the children of men began to multiply on the face of the earth and daughters were born to them, that the angels of Elohim (God) saw them on a certain year of this jubilee, that they were beautiful to look upon; and they took themselves wives of all whom they chose, and they bare to them sons and they were giants.* Jubilees tells the same descent that produced the giants Enoch sees bound in 64:4.'),
  ('enoch', '1-enoch', 64, 4, 'enoch', '1-enoch', 15, 11, 'extras', E'1 Enoch 15:11 — *From the days of the slaughter and destruction and death of the giants, from the souls of whose flesh the spirits, having gone forth, shall destroy without incurring judgement—thus shall they destroy until the day of the consummation, the great judgement in which the age shall be consummated, over the Watchers and the godless, yea, shall be wholly consummated."’* Enoch 15 explains the origin and end of the very giant-spirits he sees bound until judgment in 64:4.'),
  -- thread: 1-enoch-64-watchers-descent-days-of-jared-hermon
  ('enoch', '1-enoch', 64, 6, 'enoch', '1-enoch', 6, 6, 'extras', E'1 Enoch 6:6 — *And they were in all two hundred; who descended in the days of Yered (Jared) on the summit of Mount Hermon, and they called it Mount Hermon, because they had sworn and bound themselves by mutual imprecations upon it.* The angel in 64:6 is identifying the very two hundred whose descent in the days of Jared on Hermon Enoch recorded at the opening of the Watchers'' book.'),
  ('enoch', '1-enoch', 64, 6, 'canon', 'genesis', 6, 2, 'free', E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* The canon''s terse "sons of Elohim" who took wives are the two hundred chiefs Enoch 64:6 names as having gone down and taught mankind sin.'),
  ('enoch', '1-enoch', 64, 6, 'canon', 'isaiah', 24, 21, 'free', E'Isaiah 24:21 — *And it shall come to pass in that day, that Yahuah (LORD) shall punish the host of the high ones that are on high, and the kings of the earth upon the earth.* Isaiah foresees the same heavenly host shut up and visited in that day that Enoch 64:6 sees bound until the great judgement.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en64_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en64_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-64-fallen-angels-bound-in-judgment',
       E'The fallen angels reserved in chains until the day of judgement',
       E'Enoch is shown the prison-house of the rebel Watchers: *And in that place I saw the spirits of the fallen angels who led astray, And they were bound there until the day of their judgment.* (1 Enoch 64:3) — the flaming forms standing guard *executed the punishment of the angels* (1 Enoch 64:1), and the human *sinners and blasphemers* who *work wickedness* make their habitation with them (1 Enoch 64:2). This is the very picture the canon carries forward: *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* (Jude 1:6) — Jude, who openly quotes Enoch, holds the same Watchers reserved for the same great day. Peter says it again: *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment;* (2 Peter 2:4). Enoch''s own earlier vision had decreed it — *bind them fast for seventy generations in the valleys of the earth, till the day of their judgement and of their consummation* (1 Enoch 10:12) — and the binding-then-loosing-then-judged pattern surfaces a last time when *he laid hold on the dragon, that old serpent, which is the Devil, and Satan, and bound him a thousand years,* (Revelation 20:2). The Watchers'' sin is rebellion against the Creator''s order; they are not free agents but prisoners awaiting sentence — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 51575
  FROM _session250_en64_lookup sv, _session250_en64_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=64 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=64 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-64-spirits-of-the-giants',
       E'The spirits of the giants begotten by the fallen angels',
       E'Among the bound, Enoch sees a distinct company: *And I saw there the spirits of the giants who were begotten by the fallen angels, And they were bound there until the day of their judgment.* (1 Enoch 64:4) — the offspring of the Watchers'' transgression, held in the same place. This is the canon''s own Genesis account stated plainly: *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown.* (Genesis 6:4). Jubilees, retelling the same descent, says the angels *bare to them sons and they were giants* (Jubilees 5:1), and that their spirits await *the day of the great condemnation when judgment is executed on all those who have corrupted their ways* (Jubilees 5:10). Enoch''s earlier word explains why their spirits roam and trouble the earth until that day — *From the days of the slaughter and destruction and death of the giants, from the souls of whose flesh the spirits, having gone forth, shall destroy without incurring judgement—thus shall they destroy until the day of the consummation, the great judgement* (1 Enoch 15:11). The giants are no myth; they are the seed-war Genesis names and Enoch unfolds — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 51578
  FROM _session250_en64_lookup sv, _session250_en64_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=64 AND sv.verse_number=4
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=64 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-64-watchers-descent-days-of-jared-hermon',
       E'The two hundred chiefs who descended in the days of Jared on Mount Hermon',
       E'The angel names the prisoners for Enoch: *These are the chiefs of the two hundred angels who went down in the days of Jared on the summit of Mount Hermon, And they taught mankind sin, And led them astray, And they were bound by Yahuah (God) of Spirits in the valleys of the earth Until the day of consummation, The great judgement in which they shall be judged.* (1 Enoch 64:6) — the same descent Enoch recorded at the start: *And they were in all two hundred; who descended in the days of Yered (Jared) on the summit of Mount Hermon, and they called it Mount Hermon, because they had sworn and bound themselves by mutual imprecations upon it.* (1 Enoch 6:6). Their sentence was decreed there too — *bind them fast for seventy generations in the valleys of the earth, till the day of their judgement* (1 Enoch 10:12). Genesis opens this door without naming the mountain: *And it came to pass, when men began to multiply on the face of the earth, and daughters were born unto them, That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* (Genesis 6:1-2). Isaiah sees the same host gathered and shut in the pit *in that day* — *And it shall come to pass in that day, that Yahuah (LORD) shall punish the host of the high ones that are on high* (Isaiah 24:21). The Watchers'' crime is rebellion against the Creator''s order and the teaching of forbidden things; the covenant-way still stands, and the judgement is for breaking it — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 51581
  FROM _session250_en64_lookup sv, _session250_en64_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=64 AND sv.verse_number=5
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=64 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-64-fallen-angels-bound-in-judgment
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude, who quotes Enoch by name, holds the same fallen angels Enoch sees bound in the place of judgment, reserved for the same great day.'
  FROM cross_reference_threads t, cross_references x, _session250_en64_lookup sv, _session250_en64_lookup tv
 WHERE t.slug='1-enoch-64-fallen-angels-bound-in-judgment'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=64 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment;* Peter names the chains of darkness and the reserved judgment that Enoch 64:3 sees enacted in the place of the bound fallen angels.'
  FROM cross_reference_threads t, cross_references x, _session250_en64_lookup sv, _session250_en64_lookup tv
 WHERE t.slug='1-enoch-64-fallen-angels-bound-in-judgment'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=64 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 10:12 — *And when their sons have slain one another, and they have seen the destruction of their beloved ones, bind them fast for seventy generations in the valleys of the earth, till the day of their judgement and of their consummation, till the judgement that is for ever and ever is consummated.* The sentence decreed in Enoch 10 is the very imprisonment Enoch now beholds carried out in 64:3.'
  FROM cross_reference_threads t, cross_references x, _session250_en64_lookup sv, _session250_en64_lookup tv
 WHERE t.slug='1-enoch-64-fallen-angels-bound-in-judgment'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=64 AND sv.verse_number=3
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 20:2 — *And he laid hold on the dragon, that old serpent, which is the Devil, and Satan, and bound him a thousand years,* The same bind-and-reserve-until-judgement pattern that holds the Watchers in Enoch 64:3 closes the canon with the binding of the dragon himself.'
  FROM cross_reference_threads t, cross_references x, _session250_en64_lookup sv, _session250_en64_lookup tv
 WHERE t.slug='1-enoch-64-fallen-angels-bound-in-judgment'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=64 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-64-spirits-of-the-giants
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:4 — *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown.* The canon''s own giants, begotten when the sons of Elohim came in unto the daughters of men, are the very spirits Enoch 64:4 sees bound for judgment.'
  FROM cross_reference_threads t, cross_references x, _session250_en64_lookup sv, _session250_en64_lookup tv
 WHERE t.slug='1-enoch-64-spirits-of-the-giants'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=64 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jubilees 5:1 — *And it came to pass when the children of men began to multiply on the face of the earth and daughters were born to them, that the angels of Elohim (God) saw them on a certain year of this jubilee, that they were beautiful to look upon; and they took themselves wives of all whom they chose, and they bare to them sons and they were giants.* Jubilees tells the same descent that produced the giants Enoch sees bound in 64:4.'
  FROM cross_reference_threads t, cross_references x, _session250_en64_lookup sv, _session250_en64_lookup tv
 WHERE t.slug='1-enoch-64-spirits-of-the-giants'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=64 AND sv.verse_number=4
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=5 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 15:11 — *From the days of the slaughter and destruction and death of the giants, from the souls of whose flesh the spirits, having gone forth, shall destroy without incurring judgement—thus shall they destroy until the day of the consummation, the great judgement in which the age shall be consummated, over the Watchers and the godless, yea, shall be wholly consummated."’* Enoch 15 explains the origin and end of the very giant-spirits he sees bound until judgment in 64:4.'
  FROM cross_reference_threads t, cross_references x, _session250_en64_lookup sv, _session250_en64_lookup tv
 WHERE t.slug='1-enoch-64-spirits-of-the-giants'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=64 AND sv.verse_number=4
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=15 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-64-watchers-descent-days-of-jared-hermon
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 6:6 — *And they were in all two hundred; who descended in the days of Yered (Jared) on the summit of Mount Hermon, and they called it Mount Hermon, because they had sworn and bound themselves by mutual imprecations upon it.* The angel in 64:6 is identifying the very two hundred whose descent in the days of Jared on Hermon Enoch recorded at the opening of the Watchers'' book.'
  FROM cross_reference_threads t, cross_references x, _session250_en64_lookup sv, _session250_en64_lookup tv
 WHERE t.slug='1-enoch-64-watchers-descent-days-of-jared-hermon'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=64 AND sv.verse_number=6
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=6 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* The canon''s terse "sons of Elohim" who took wives are the two hundred chiefs Enoch 64:6 names as having gone down and taught mankind sin.'
  FROM cross_reference_threads t, cross_references x, _session250_en64_lookup sv, _session250_en64_lookup tv
 WHERE t.slug='1-enoch-64-watchers-descent-days-of-jared-hermon'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=64 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 24:21 — *And it shall come to pass in that day, that Yahuah (LORD) shall punish the host of the high ones that are on high, and the kings of the earth upon the earth.* Isaiah foresees the same heavenly host shut up and visited in that day that Enoch 64:6 sees bound until the great judgement.'
  FROM cross_reference_threads t, cross_references x, _session250_en64_lookup sv, _session250_en64_lookup tv
 WHERE t.slug='1-enoch-64-watchers-descent-days-of-jared-hermon'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=64 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=24 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

