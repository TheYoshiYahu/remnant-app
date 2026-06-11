-- ----- fragment: minion_1enoch_21.sql (session250 1-enoch 21) -----
-- Source anchor: enoch/1-enoch ch21. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en21 (view _session250_en21_lookup). Sort band base 50500, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en21_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-21-prison-of-the-stars
  ('enoch', '1-enoch', 21, 4, 'enoch', '1-enoch', 18, 12, 'extras', E'1 Enoch 18:12 — *I saw there seven stars like great burning mountains, and to me, when I inquired regarding them, the angel said: ’This place is the end of heaven and earth: this has become a prison for the stars and the host of heaven.* Enoch''s earlier journey shows the very same seven bound stars and the same prison-of-the-host that he revisits in 21:4-5.'),
  ('enoch', '1-enoch', 21, 5, 'canon', 'isaiah', 24, 21, 'free', E'Isaiah 24:21 — *And it shall come to pass in that day, that Yahuah (LORD) shall punish the host of the high ones that are on high, and the kings of the earth upon the earth.* Isaiah names the same rebel host on high that Enoch sees imprisoned at the end of heaven and earth.'),
  ('enoch', '1-enoch', 21, 6, 'canon', 'isaiah', 24, 22, 'free', E'Isaiah 24:22 — *And they shall be gathered together, as prisoners are gathered in the pit, and shall be shut up in the prison, and after many days shall they be visited.* The transgressing host is shut in the prison and held for a future visitation — exactly Enoch''s stars bound till their guilt is consummated.'),
  ('enoch', '1-enoch', 21, 6, 'canon', 'jude', 1, 13, 'free', E'Jude 1:13 — *Raging waves of the sea, foaming out their own shame; wandering stars, to whom is reserved the blackness of darkness for ever.* Jude''s ''wandering stars'' are Enoch''s stars that did not come forth at their appointed times, reserved for darkness.'),
  -- thread: 1-enoch-21-stars-out-of-their-appointed-times
  ('enoch', '1-enoch', 21, 6, 'canon', 'jude', 1, 13, 'free', E'Jude 1:13 — *Raging waves of the sea, foaming out their own shame; wandering stars, to whom is reserved the blackness of darkness for ever.* Jude calls the rebels ''wandering stars'' — the same image as Enoch''s stars that transgressed the commandment and did not keep their appointed times.'),
  ('enoch', '1-enoch', 21, 6, 'canon', '2-peter', 2, 4, 'free', E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment;* Peter ties the transgression directly to angels that sinned and are now held in chains till judgement, just as Enoch''s stars are bound for their guilt.'),
  -- thread: 1-enoch-21-prison-of-the-angels-for-ever
  ('enoch', '1-enoch', 21, 10, 'canon', 'jude', 1, 6, 'free', E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude describes precisely the prison of the angels Uriel shows Enoch — reserved in chains for the judgement.'),
  ('enoch', '1-enoch', 21, 10, 'canon', '2-peter', 2, 4, 'free', E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment;* Peter calls this same place the holding of the angels that sinned, cast down and reserved unto judgment — Enoch''s prison of the angels.'),
  ('enoch', '1-enoch', 21, 10, 'enoch', '1-enoch', 19, 1, 'extras', E'1 Enoch 19:1 — *And Uriel said to me: ’Here shall stand the angels who have connected themselves with women, and their spirits assuming many different forms are defiling mankind and shall lead them astray into sacrificing to demons as gods, here shall they stand, till the day of the great judgement in which they shall be judged till they are made an end of.* The same Uriel who guides Enoch names the term of this prison: the fallen angels stand here till the great judgement.'),
  ('enoch', '1-enoch', 21, 11, 'canon', 'isaiah', 24, 22, 'free', E'Isaiah 24:22 — *And they shall be gathered together, as prisoners are gathered in the pit, and shall be shut up in the prison, and after many days shall they be visited.* Isaiah''s prisoners shut in the pit and held for a later visitation match the angels imprisoned ''for ever'' until their reckoning.'),
  ('enoch', '1-enoch', 21, 11, 'canon', 'revelation', 20, 10, 'free', E'Revelation 20:10 — *And the devil that deceived them was cast into the lake of fire and brimstone, where the beast and the false prophet are, and shall be tormented day and night for ever and ever.* Revelation names the final destiny that Enoch''s burning, blazing prison foreshadows — the eternal lake at the great judgement.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en21_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en21_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-21-prison-of-the-stars',
       E'The prison for the stars and the host of heaven',
       E'Enoch is carried to the chaotic place at the edge of creation and shown the bound host: *’This place is the end of heaven and earth: this has become a prison for the stars and the host of heaven.* *And the stars which roll over the fire are they which have transgressed the commandment of Yahuah (God) in the beginning of their rising, because they did not come forth at their appointed times.* *And He was wroth with them, and bound them till the time when their guilt should be consummated (even) for ten thousand years.’* (1 Enoch 21:5-7). It ain''t new — Enoch has already seen this very place once before, and the wording is the same: *I saw there seven stars like great burning mountains, and to me, when I inquired regarding them, the angel said: ’This place is the end of heaven and earth: this has become a prison for the stars and the host of heaven.* (1 Enoch 18:12). The prophets carry the identical picture of a rebel host held in custody for the reckoning: *And it shall come to pass in that day, that Yahuah (LORD) shall punish the host of the high ones that are on high, and the kings of the earth upon the earth.* (Isaiah 24:21), *And they shall be gathered together, as prisoners are gathered in the pit, and shall be shut up in the prison, and after many days shall they be visited.* (Isaiah 24:22). Jude reads the same rebellion onto the false teachers, calling them *Raging waves of the sea, foaming out their own shame; wandering stars, to whom is reserved the blackness of darkness for ever.* (Jude 1:13). These are not stray myths but the canon''s own order: the Creator''s command stands, the rebel powers are bound, and the judgement is fixed.',
       sv.verse_id, ev.verse_id, 'extras', 50500
  FROM _session250_en21_lookup sv, _session250_en21_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=21 AND sv.verse_number=4
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=21 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-21-stars-out-of-their-appointed-times',
       E'The stars that did not come forth at their appointed times',
       E'The charge against the bound stars is precise — they broke the Creator''s appointed order: *And the stars which roll over the fire are they which have transgressed the commandment of Yahuah (God) in the beginning of their rising, because they did not come forth at their appointed times.* (1 Enoch 21:6). The lights were set for the order of the seasons from the beginning, and to step out of that order is rebellion against the One who fixed it. So Jude reads the very same transgression onto men who likewise leave their station: *Raging waves of the sea, foaming out their own shame; wandering stars, to whom is reserved the blackness of darkness for ever.* (Jude 1:13). The sin here is not law itself but the breaking of the appointed way; the Creator''s command over the times stands, and the host that abandoned its place is held for judgement.',
       sv.verse_id, ev.verse_id, 'extras', 50503
  FROM _session250_en21_lookup sv, _session250_en21_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=21 AND sv.verse_number=6
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=21 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-21-prison-of-the-angels-for-ever',
       E'The prison of the angels, kept till the eternal judgement',
       E'Enoch passes to a second, more terrible place and Uriel names it plainly: *’This place is the prison of the angels, and here they will be imprisoned for ever.’* (1 Enoch 21:10), set within *a great fire there which burnt and blazed, and the place was cleft as far as the abyss* (1 Enoch 21:8). This is the canon''s own holding-cell for the fallen Watchers. Jude says it of them exactly: *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* (Jude 1:6). Peter says the same: *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment;* (2 Peter 2:4). Enoch himself has already heard the term of their imprisonment named by the same angel — *here shall they stand, till the day of the great judgement in which they shall be judged till they are made an end of.* (1 Enoch 19:1). And the end of that custody is the lake fixed in Revelation: *And the devil that deceived them was cast into the lake of fire and brimstone, where the beast and the false prophet are, and shall be tormented day and night for ever and ever.* (Revelation 20:10). The bound host is real, held now, and reserved for a fixed reckoning — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 50506
  FROM _session250_en21_lookup sv, _session250_en21_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=21 AND sv.verse_number=8
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=21 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-21-prison-of-the-stars
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 18:12 — *I saw there seven stars like great burning mountains, and to me, when I inquired regarding them, the angel said: ’This place is the end of heaven and earth: this has become a prison for the stars and the host of heaven.* Enoch''s earlier journey shows the very same seven bound stars and the same prison-of-the-host that he revisits in 21:4-5.'
  FROM cross_reference_threads t, cross_references x, _session250_en21_lookup sv, _session250_en21_lookup tv
 WHERE t.slug='1-enoch-21-prison-of-the-stars'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=21 AND sv.verse_number=4
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=18 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 24:21 — *And it shall come to pass in that day, that Yahuah (LORD) shall punish the host of the high ones that are on high, and the kings of the earth upon the earth.* Isaiah names the same rebel host on high that Enoch sees imprisoned at the end of heaven and earth.'
  FROM cross_reference_threads t, cross_references x, _session250_en21_lookup sv, _session250_en21_lookup tv
 WHERE t.slug='1-enoch-21-prison-of-the-stars'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=21 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=24 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 24:22 — *And they shall be gathered together, as prisoners are gathered in the pit, and shall be shut up in the prison, and after many days shall they be visited.* The transgressing host is shut in the prison and held for a future visitation — exactly Enoch''s stars bound till their guilt is consummated.'
  FROM cross_reference_threads t, cross_references x, _session250_en21_lookup sv, _session250_en21_lookup tv
 WHERE t.slug='1-enoch-21-prison-of-the-stars'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=21 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=24 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jude 1:13 — *Raging waves of the sea, foaming out their own shame; wandering stars, to whom is reserved the blackness of darkness for ever.* Jude''s ''wandering stars'' are Enoch''s stars that did not come forth at their appointed times, reserved for darkness.'
  FROM cross_reference_threads t, cross_references x, _session250_en21_lookup sv, _session250_en21_lookup tv
 WHERE t.slug='1-enoch-21-prison-of-the-stars'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=21 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-21-stars-out-of-their-appointed-times
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jude 1:13 — *Raging waves of the sea, foaming out their own shame; wandering stars, to whom is reserved the blackness of darkness for ever.* Jude calls the rebels ''wandering stars'' — the same image as Enoch''s stars that transgressed the commandment and did not keep their appointed times.'
  FROM cross_reference_threads t, cross_references x, _session250_en21_lookup sv, _session250_en21_lookup tv
 WHERE t.slug='1-enoch-21-stars-out-of-their-appointed-times'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=21 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment;* Peter ties the transgression directly to angels that sinned and are now held in chains till judgement, just as Enoch''s stars are bound for their guilt.'
  FROM cross_reference_threads t, cross_references x, _session250_en21_lookup sv, _session250_en21_lookup tv
 WHERE t.slug='1-enoch-21-stars-out-of-their-appointed-times'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=21 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-21-prison-of-the-angels-for-ever
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude describes precisely the prison of the angels Uriel shows Enoch — reserved in chains for the judgement.'
  FROM cross_reference_threads t, cross_references x, _session250_en21_lookup sv, _session250_en21_lookup tv
 WHERE t.slug='1-enoch-21-prison-of-the-angels-for-ever'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=21 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment;* Peter calls this same place the holding of the angels that sinned, cast down and reserved unto judgment — Enoch''s prison of the angels.'
  FROM cross_reference_threads t, cross_references x, _session250_en21_lookup sv, _session250_en21_lookup tv
 WHERE t.slug='1-enoch-21-prison-of-the-angels-for-ever'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=21 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 19:1 — *And Uriel said to me: ’Here shall stand the angels who have connected themselves with women, and their spirits assuming many different forms are defiling mankind and shall lead them astray into sacrificing to demons as gods, here shall they stand, till the day of the great judgement in which they shall be judged till they are made an end of.* The same Uriel who guides Enoch names the term of this prison: the fallen angels stand here till the great judgement.'
  FROM cross_reference_threads t, cross_references x, _session250_en21_lookup sv, _session250_en21_lookup tv
 WHERE t.slug='1-enoch-21-prison-of-the-angels-for-ever'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=21 AND sv.verse_number=10
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=19 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 24:22 — *And they shall be gathered together, as prisoners are gathered in the pit, and shall be shut up in the prison, and after many days shall they be visited.* Isaiah''s prisoners shut in the pit and held for a later visitation match the angels imprisoned ''for ever'' until their reckoning.'
  FROM cross_reference_threads t, cross_references x, _session250_en21_lookup sv, _session250_en21_lookup tv
 WHERE t.slug='1-enoch-21-prison-of-the-angels-for-ever'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=21 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=24 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Revelation 20:10 — *And the devil that deceived them was cast into the lake of fire and brimstone, where the beast and the false prophet are, and shall be tormented day and night for ever and ever.* Revelation names the final destiny that Enoch''s burning, blazing prison foreshadows — the eternal lake at the great judgement.'
  FROM cross_reference_threads t, cross_references x, _session250_en21_lookup sv, _session250_en21_lookup tv
 WHERE t.slug='1-enoch-21-prison-of-the-angels-for-ever'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=21 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

