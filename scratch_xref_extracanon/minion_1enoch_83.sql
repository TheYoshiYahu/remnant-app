-- ----- fragment: minion_1enoch_83.sql (session250 1-enoch 83) -----
-- Source anchor: enoch/1-enoch ch83. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en83 (view _session250_en83_lookup). Sort band base 52050, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en83_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-83-flood-earth-swallowed
  ('enoch', '1-enoch', 83, 5, 'canon', 'genesis', 6, 11, 'free', E'Genesis 6:11 — *The earth also was corrupt before Elohim (God), and the earth was filled with violence.* The violence that fills the earth is the corruption Enoch sees punished when the earth is swallowed in the abyss at 83:5.'),
  ('enoch', '1-enoch', 83, 7, 'canon', 'genesis', 6, 13, 'free', E'Genesis 6:13 — *And Elohim (God) said unto Noah, The end of all flesh is come before me; for the earth is filled with violence through them; and, behold, I will destroy them with the earth.* Enoch''s "all that was upon the earth perished" (83:7) is this very decree against all flesh.'),
  ('enoch', '1-enoch', 83, 5, 'canon', 'genesis', 7, 11, 'free', E'Genesis 7:11 — *In the six hundredth year of Noah''s life, in the second month, the seventeenth day of the month, the same day were all the fountains of the great deep broken up, and the windows of heaven were opened.* The broken-up deep is the great abyss that swallows the earth in Enoch''s vision (83:5).'),
  ('enoch', '1-enoch', 83, 7, 'canon', 'genesis', 7, 23, 'free', E'Genesis 7:23 — *And every living substance was destroyed which was upon the face of the ground, both man, and cattle, and the creeping things, and the fowl of the heaven; and they were destroyed from the earth: and Noah only remained alive, and they that were with him in the ark.* Enoch''s "all that was upon the earth perished" (83:7) is the deluge that left only Noah''s house alive.'),
  ('enoch', '1-enoch', 83, 4, 'enoch', '1-enoch', 10, 2, 'extras', E'1 Enoch 10:2 — *And said to him: ''Go to Noah and tell him in My Name "Hide thyself!" and reveal to him the end that is approaching: that the whole earth will be destroyed, and a deluge is about to come upon the whole earth, and will destroy all that is on it.* The Flood Enoch now sees collapse from heaven (83:4) is the same judgment his book already announced to Noah.'),
  -- thread: 1-enoch-83-heaven-rolled-scroll
  ('enoch', '1-enoch', 83, 10, 'canon', 'isaiah', 34, 4, 'free', E'Isaiah 34:4 — *And all the host of heaven shall be dissolved, and the heavens shall be rolled together as a scroll: and all their host shall fall down, as the leaf falleth off from the vine, and as a falling fig from the fig tree.* Enoch''s heaven "rolled up like a scroll" with the luminaries falling (83:10) is Isaiah''s Day-of-Yahuah unmaking of the host of heaven.'),
  ('enoch', '1-enoch', 83, 10, 'canon', 'revelation', 6, 14, 'free', E'Revelation 6:14 — *And the heaven departed as a scroll when it is rolled together; and every mountain and island were moved out of their places.* The sixth seal repeats Enoch''s scroll-rolled heaven (83:10) and the mountains displaced from his vision (83:5).'),
  ('enoch', '1-enoch', 83, 12, 'canon', '2-peter', 3, 6, 'free', E'2 Peter 3:6 — *Whereby the world that then was, being overflowed with water, perished.* Peter names the very deluge Enoch''s vision dissolves (83:12) as the pattern of the world that perished.'),
  ('enoch', '1-enoch', 83, 12, 'canon', '2-peter', 3, 7, 'free', E'2 Peter 3:7 — *But the heavens and the earth, which are now, by the same word are kept in store, reserved unto fire against the day of judgment and perdition of ungodly men.* The dissolving earth of Enoch''s vision (83:12) is the type of the heavens and earth reserved unto the final fire.'),
  -- thread: 1-enoch-83-enoch-intercessor-spare-earth
  ('enoch', '1-enoch', 83, 9, 'enoch', '1-enoch', 84, 10, 'extras', E'1 Enoch 84:10 — *And now I beseech Thee, O Yahuah (God) of Spirits, To have mercy upon the children of men, And not to destroy the whole race of men, But to preserve a seed from them for the righteous.* The very next chapter unfolds the prayer Enoch begins in 83:9 — that the whole earth not be destroyed but a righteous seed preserved.'),
  ('enoch', '1-enoch', 83, 14, 'canon', 'genesis', 18, 23, 'free', E'Genesis 18:23 — *And Abraham drew near, and said, Wilt thou also destroy the righteous with the wicked?* Abraham''s plea over Sodom is the same intercessor''s posture as Enoch''s prayer that Yahuah not destroy the whole earth (83:14).'),
  ('enoch', '1-enoch', 83, 14, 'canon', 'exodus', 32, 12, 'free', E'Exodus 32:12 — *Wherefore should the Egyptians speak, and say, For mischief did he bring them out, to slay them in the mountains, and to consume them from the face of the earth? Turn from thy fierce wrath, and repent of this evil against thy people.* Moses standing in the breach turns wrath just as Enoch pleads against total destruction (83:14).'),
  ('enoch', '1-enoch', 83, 9, 'canon', 'amos', 7, 5, 'free', E'Amos 7:5 — *Then said I, O Yahuah (Lord) GOD, cease, I beseech thee: by whom shall Jacob arise? for he is small.* The prophet''s intercession for the small remnant echoes Enoch praying that the whole earth not be destroyed (83:9).'),
  ('enoch', '1-enoch', 83, 9, 'canon', 'amos', 7, 6, 'free', E'Amos 7:6 — *Yahuah (LORD) repented for this: This also shall not be, saith Adonai Yahuah (the Lord GOD).* Yahuah relents at the prophet''s plea, the very answer Enoch''s intercession seeks when he prays the earth be spared (83:9).'),
  -- thread: 1-enoch-83-flood-type-coming-of-son-of-adam
  ('enoch', '1-enoch', 83, 6, 'canon', 'matthew', 24, 37, 'free', E'Matthew 24:37 — *But as the days of Noe were, so shall also the coming of the Son of Adam be.* Yahusha makes the Flood Enoch sees in his vision (83:6) the very type of the coming of the Son of Adam.'),
  ('enoch', '1-enoch', 83, 7, 'canon', 'matthew', 24, 39, 'free', E'Matthew 24:39 — *And knew not until the flood came, and took them all away; so shall also the coming of the Son of Adam be.* The Flood that takes all away is Enoch''s "all that was upon the earth perished" (83:7), made the figure of the last day.'),
  ('enoch', '1-enoch', 83, 9, 'canon', 'genesis', 8, 1, 'free', E'Genesis 8:1 — *And Elohim (God) remembered Noah, and every living thing, and all the cattle that was with him in the ark: and Elohim (God) made a wind to pass over the earth, and the waters asswaged.* The remembering of Noah is the answer to Enoch''s prayer that the whole earth not be destroyed (83:9) — a seed preserved through the waters.'),
  ('enoch', '1-enoch', 83, 6, 'canon', '2-peter', 3, 11, 'free', E'2 Peter 3:11 — *Seeing then that all these things shall be dissolved, what manner of persons ought ye to be in all holy conversation and godliness.* Peter turns the dissolving earth of Enoch''s vision (83:6) toward holy living, not toward law-as-curse.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en83_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en83_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-83-flood-earth-swallowed',
       E'The heaven cast down, the earth swallowed — the deluge foreseen',
       E'Enoch''s first dream-vision is the Flood: *And when it fell to the earth I saw how the earth was swallowed up in a great abyss, and mountains were suspended on mountains* (1 Enoch 83:5), and *the earth was rent asunder, and all that was upon the earth perished, and the earth was dissolved* (1 Enoch 83:7). It ain''t new — this is Genesis read from heaven. The corruption that brings it is the very violence Yahuah names to Noah: *The earth also was corrupt before Elohim (God), and the earth was filled with violence* (Genesis 6:11), so that *Elohim (God) said unto Noah, The end of all flesh is come before me; for the earth is filled with violence through them; and, behold, I will destroy them with the earth* (Genesis 6:13). The vision''s swallowing abyss is the very mechanism of the deluge: *the same day were all the fountains of the great deep broken up, and the windows of heaven were opened* (Genesis 7:11), until *every living substance was destroyed which was upon the face of the ground... and Noah only remained alive, and they that were with him in the ark* (Genesis 7:23). Enoch within his own book had already heard the Watcher-judgment announced to Noah: *reveal to him the end that is approaching: that the whole earth will be destroyed, and a deluge is about to come upon the whole earth* (1 Enoch 10:2) — the seed-war of Genesis 6 closing in water.',
       sv.verse_id, ev.verse_id, 'extras', 52050
  FROM _session250_en83_lookup sv, _session250_en83_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=83 AND sv.verse_number=4
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=83 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-83-heaven-rolled-scroll',
       E'The heaven rolled up like a scroll, the luminaries fall',
       E'In the second movement of the vision the cosmos itself comes undone: *And again I saw in a vision, and behold the heaven was rolled up like a scroll, and all the luminaries fell down* (1 Enoch 83:10). It ain''t new — the prophets and the Revelation see the same unmaking of the heavens on the Day of Yahuah. Isaiah: *And all the host of heaven shall be dissolved, and the heavens shall be rolled together as a scroll: and all their host shall fall down, as the leaf falleth off from the vine, and as a falling fig from the fig tree* (Isaiah 34:4). The Lamb''s sixth seal answers it word for word: *And the heaven departed as a scroll when it is rolled together; and every mountain and island were moved out of their places* (Revelation 6:14) — and Enoch''s mountains "suspended on mountains" (83:5) are these mountains moved out of place. Peter binds the Flood-of-water to the coming judgment-by-fire as one pattern: *Whereby the world that then was, being overflowed with water, perished* (2 Peter 3:6), so that now *the heavens and the earth, which are now, by the same word are kept in store, reserved unto fire against the day of judgment* (2 Peter 3:7). The first dissolution prefigures the last; the same Word that drowned the old order keeps the present one for the day Enoch''s scroll-vision foreshadows.',
       sv.verse_id, ev.verse_id, 'extras', 52053
  FROM _session250_en83_lookup sv, _session250_en83_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=83 AND sv.verse_number=10
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=83 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-83-enoch-intercessor-spare-earth',
       E'Enoch the intercessor — that He would not destroy the whole earth',
       E'Twice in the vision Enoch falls on his face and pleads: *And I prayed to Yahuah (God) of Spirits that He would not destroy the whole earth* (1 Enoch 83:9), and again *I prayed to Yahuah (God) of Spirits that He would not destroy the whole earth* (1 Enoch 83:14). It ain''t new — Enoch stands in the office every true prophet fills: the man who stands in the breach. The next chapter resolves the prayer he begins here, asking not for the wicked but for a remnant: *And now I beseech Thee, O Yahuah (God) of Spirits, To have mercy upon the children of men, And not to destroy the whole race of men, But to preserve a seed from them for the righteous* (1 Enoch 84:10). Abraham bargains the same way before Sodom: *And Abraham drew near, and said, Wilt thou also destroy the righteous with the wicked?* (Genesis 18:23). Moses turns wrath at Sinai: *Turn from thy fierce wrath, and repent of this evil against thy people* (Exodus 32:12). And Amos cries the prophet''s plea for the small remnant: *O Yahuah (Lord) GOD, cease, I beseech thee: by whom shall Jacob arise? for he is small* (Amos 7:5) — and *Yahuah (LORD) repented for this: This also shall not be* (Amos 7:6). Enoch is the first in this line of intercessors; Torah''s mercy and the prophets'' standing-in-the-gap are already here.',
       sv.verse_id, ev.verse_id, 'extras', 52056
  FROM _session250_en83_lookup sv, _session250_en83_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=83 AND sv.verse_number=9
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=83 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-83-flood-type-coming-of-son-of-adam',
       E'The days of Noah — the Flood as type of the coming judgment',
       E'Enoch''s terror — *O Yahuah (God) of Spirits, what is this terrible thing that Thou hast done to the earth?* (1 Enoch 83:6) — sets the Flood as the pattern for the end. It ain''t new — Yahusha (Jesus) makes the deluge the very figure of His coming: *But as the days of Noe were, so shall also the coming of the Son of Adam be* (Matthew 24:37), for *they knew not until the flood came, and took them all away; so shall also the coming of the Son of Adam be* (Matthew 24:39). Note the title stands plainly here — "the coming of the Son of Adam" — the Formed Son whom Enoch''s own Parables name. Peter draws the same line and presses it toward holiness: *Seeing then that all these things shall be dissolved, what manner of persons ought ye to be in all holy conversation and godliness* (2 Peter 3:11). And when the Flood has done its work, the covenant mercy turns: *And Elohim (God) remembered Noah, and every living thing, and all the cattle that was with him in the ark: and Elohim (God) made a wind to pass over the earth, and the waters asswaged* (Genesis 8:1) — the remembering that answers Enoch''s plea (83:9, 14) that a seed be preserved. The judgment is real, but it is for a corrupted, violent generation; the righteous are remembered and kept, never the law made a curse.',
       sv.verse_id, ev.verse_id, 'extras', 52059
  FROM _session250_en83_lookup sv, _session250_en83_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=83 AND sv.verse_number=6
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=83 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-83-flood-earth-swallowed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:11 — *The earth also was corrupt before Elohim (God), and the earth was filled with violence.* The violence that fills the earth is the corruption Enoch sees punished when the earth is swallowed in the abyss at 83:5.'
  FROM cross_reference_threads t, cross_references x, _session250_en83_lookup sv, _session250_en83_lookup tv
 WHERE t.slug='1-enoch-83-flood-earth-swallowed'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=83 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 6:13 — *And Elohim (God) said unto Noah, The end of all flesh is come before me; for the earth is filled with violence through them; and, behold, I will destroy them with the earth.* Enoch''s "all that was upon the earth perished" (83:7) is this very decree against all flesh.'
  FROM cross_reference_threads t, cross_references x, _session250_en83_lookup sv, _session250_en83_lookup tv
 WHERE t.slug='1-enoch-83-flood-earth-swallowed'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=83 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 7:11 — *In the six hundredth year of Noah''s life, in the second month, the seventeenth day of the month, the same day were all the fountains of the great deep broken up, and the windows of heaven were opened.* The broken-up deep is the great abyss that swallows the earth in Enoch''s vision (83:5).'
  FROM cross_reference_threads t, cross_references x, _session250_en83_lookup sv, _session250_en83_lookup tv
 WHERE t.slug='1-enoch-83-flood-earth-swallowed'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=83 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=7 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 7:23 — *And every living substance was destroyed which was upon the face of the ground, both man, and cattle, and the creeping things, and the fowl of the heaven; and they were destroyed from the earth: and Noah only remained alive, and they that were with him in the ark.* Enoch''s "all that was upon the earth perished" (83:7) is the deluge that left only Noah''s house alive.'
  FROM cross_reference_threads t, cross_references x, _session250_en83_lookup sv, _session250_en83_lookup tv
 WHERE t.slug='1-enoch-83-flood-earth-swallowed'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=83 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=7 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Enoch 10:2 — *And said to him: ''Go to Noah and tell him in My Name "Hide thyself!" and reveal to him the end that is approaching: that the whole earth will be destroyed, and a deluge is about to come upon the whole earth, and will destroy all that is on it.* The Flood Enoch now sees collapse from heaven (83:4) is the same judgment his book already announced to Noah.'
  FROM cross_reference_threads t, cross_references x, _session250_en83_lookup sv, _session250_en83_lookup tv
 WHERE t.slug='1-enoch-83-flood-earth-swallowed'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=83 AND sv.verse_number=4
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-83-heaven-rolled-scroll
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 34:4 — *And all the host of heaven shall be dissolved, and the heavens shall be rolled together as a scroll: and all their host shall fall down, as the leaf falleth off from the vine, and as a falling fig from the fig tree.* Enoch''s heaven "rolled up like a scroll" with the luminaries falling (83:10) is Isaiah''s Day-of-Yahuah unmaking of the host of heaven.'
  FROM cross_reference_threads t, cross_references x, _session250_en83_lookup sv, _session250_en83_lookup tv
 WHERE t.slug='1-enoch-83-heaven-rolled-scroll'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=83 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=34 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 6:14 — *And the heaven departed as a scroll when it is rolled together; and every mountain and island were moved out of their places.* The sixth seal repeats Enoch''s scroll-rolled heaven (83:10) and the mountains displaced from his vision (83:5).'
  FROM cross_reference_threads t, cross_references x, _session250_en83_lookup sv, _session250_en83_lookup tv
 WHERE t.slug='1-enoch-83-heaven-rolled-scroll'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=83 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=6 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Peter 3:6 — *Whereby the world that then was, being overflowed with water, perished.* Peter names the very deluge Enoch''s vision dissolves (83:12) as the pattern of the world that perished.'
  FROM cross_reference_threads t, cross_references x, _session250_en83_lookup sv, _session250_en83_lookup tv
 WHERE t.slug='1-enoch-83-heaven-rolled-scroll'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=83 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=3 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Peter 3:7 — *But the heavens and the earth, which are now, by the same word are kept in store, reserved unto fire against the day of judgment and perdition of ungodly men.* The dissolving earth of Enoch''s vision (83:12) is the type of the heavens and earth reserved unto the final fire.'
  FROM cross_reference_threads t, cross_references x, _session250_en83_lookup sv, _session250_en83_lookup tv
 WHERE t.slug='1-enoch-83-heaven-rolled-scroll'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=83 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=3 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-83-enoch-intercessor-spare-earth
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 84:10 — *And now I beseech Thee, O Yahuah (God) of Spirits, To have mercy upon the children of men, And not to destroy the whole race of men, But to preserve a seed from them for the righteous.* The very next chapter unfolds the prayer Enoch begins in 83:9 — that the whole earth not be destroyed but a righteous seed preserved.'
  FROM cross_reference_threads t, cross_references x, _session250_en83_lookup sv, _session250_en83_lookup tv
 WHERE t.slug='1-enoch-83-enoch-intercessor-spare-earth'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=83 AND sv.verse_number=9
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=84 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 18:23 — *And Abraham drew near, and said, Wilt thou also destroy the righteous with the wicked?* Abraham''s plea over Sodom is the same intercessor''s posture as Enoch''s prayer that Yahuah not destroy the whole earth (83:14).'
  FROM cross_reference_threads t, cross_references x, _session250_en83_lookup sv, _session250_en83_lookup tv
 WHERE t.slug='1-enoch-83-enoch-intercessor-spare-earth'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=83 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=18 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 32:12 — *Wherefore should the Egyptians speak, and say, For mischief did he bring them out, to slay them in the mountains, and to consume them from the face of the earth? Turn from thy fierce wrath, and repent of this evil against thy people.* Moses standing in the breach turns wrath just as Enoch pleads against total destruction (83:14).'
  FROM cross_reference_threads t, cross_references x, _session250_en83_lookup sv, _session250_en83_lookup tv
 WHERE t.slug='1-enoch-83-enoch-intercessor-spare-earth'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=83 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=32 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Amos 7:5 — *Then said I, O Yahuah (Lord) GOD, cease, I beseech thee: by whom shall Jacob arise? for he is small.* The prophet''s intercession for the small remnant echoes Enoch praying that the whole earth not be destroyed (83:9).'
  FROM cross_reference_threads t, cross_references x, _session250_en83_lookup sv, _session250_en83_lookup tv
 WHERE t.slug='1-enoch-83-enoch-intercessor-spare-earth'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=83 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=7 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Amos 7:6 — *Yahuah (LORD) repented for this: This also shall not be, saith Adonai Yahuah (the Lord GOD).* Yahuah relents at the prophet''s plea, the very answer Enoch''s intercession seeks when he prays the earth be spared (83:9).'
  FROM cross_reference_threads t, cross_references x, _session250_en83_lookup sv, _session250_en83_lookup tv
 WHERE t.slug='1-enoch-83-enoch-intercessor-spare-earth'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=83 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=7 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-83-flood-type-coming-of-son-of-adam
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 24:37 — *But as the days of Noe were, so shall also the coming of the Son of Adam be.* Yahusha makes the Flood Enoch sees in his vision (83:6) the very type of the coming of the Son of Adam.'
  FROM cross_reference_threads t, cross_references x, _session250_en83_lookup sv, _session250_en83_lookup tv
 WHERE t.slug='1-enoch-83-flood-type-coming-of-son-of-adam'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=83 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 24:39 — *And knew not until the flood came, and took them all away; so shall also the coming of the Son of Adam be.* The Flood that takes all away is Enoch''s "all that was upon the earth perished" (83:7), made the figure of the last day.'
  FROM cross_reference_threads t, cross_references x, _session250_en83_lookup sv, _session250_en83_lookup tv
 WHERE t.slug='1-enoch-83-flood-type-coming-of-son-of-adam'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=83 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=39
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 8:1 — *And Elohim (God) remembered Noah, and every living thing, and all the cattle that was with him in the ark: and Elohim (God) made a wind to pass over the earth, and the waters asswaged.* The remembering of Noah is the answer to Enoch''s prayer that the whole earth not be destroyed (83:9) — a seed preserved through the waters.'
  FROM cross_reference_threads t, cross_references x, _session250_en83_lookup sv, _session250_en83_lookup tv
 WHERE t.slug='1-enoch-83-flood-type-coming-of-son-of-adam'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=83 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=8 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Peter 3:11 — *Seeing then that all these things shall be dissolved, what manner of persons ought ye to be in all holy conversation and godliness.* Peter turns the dissolving earth of Enoch''s vision (83:6) toward holy living, not toward law-as-curse.'
  FROM cross_reference_threads t, cross_references x, _session250_en83_lookup sv, _session250_en83_lookup tv
 WHERE t.slug='1-enoch-83-flood-type-coming-of-son-of-adam'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=83 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=3 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

