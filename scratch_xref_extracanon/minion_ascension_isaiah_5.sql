-- ----- fragment: minion_ascensionisaiah_05.sql (session403 ascension-isaiah 5) -----
-- Source anchor: ascension-isaiah/ascension-isaiah ch5. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: asci5 (view _session403_asci5_lookup). Sort band base 67600, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session403_asci5_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ascension-isaiah-5-sawn-asunder
  ('ascension-isaiah', 'ascension-isaiah', 5, 11, 'canon', 'hebrews', 11, 37, 'free', E'Hebrews 11:37 — *They were stoned, they were sawn asunder, were tempted, were slain with the sword: they wandered about in sheepskins and goatskins; being destitute, afflicted, tormented;* The lone canon witness to the wood-saw martyrdom records exactly Isaiah''s death in 5:11.'),
  ('ascension-isaiah', 'ascension-isaiah', 5, 2, 'canon', 'matthew', 23, 31, 'free', E'Matthew 23:31 — *Wherefore ye be witnesses unto yourselves, that ye are the children of them which killed the prophets.* The false prophets laughing and rejoicing at Isaiah''s death (5:2) are the same lineage the Beloved indicts.'),
  ('ascension-isaiah', 'ascension-isaiah', 5, 12, 'canon', 'acts', 7, 52, 'free', E'Acts 7:52 — *Which of the prophets have not your fathers persecuted? and they have slain them which shewed before of the coming of the Just One; of whom ye have been now the betrayers and murderers:* Manasseh, the princes, and all the people looking on (5:12) stand in the company Stephen names before the council.'),
  ('ascension-isaiah', 'ascension-isaiah', 5, 14, 'canon', 'revelation', 6, 9, 'free', E'Revelation 6:9 — *And when he had opened the fifth seal, I saw under the altar the souls of them that were slain for the word of Elohim (God), and for the testimony which they held:* Isaiah''s lips speaking by the Ruach until the end (5:14) place him among the slain who keep the testimony.'),
  -- thread: ascension-isaiah-5-beliar-sammael-seed-war
  ('ascension-isaiah', 'ascension-isaiah', 5, 1, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Beliar dwelling in Manasseh''s heart to saw Isaiah (5:1) is the serpent''s enmity against the woman''s seed working in history.'),
  ('ascension-isaiah', 'ascension-isaiah', 5, 15, 'canon', '2-thessalonians', 2, 3, 'free', E'2 Thessalonians 2:3 — *Let no man deceive you by any means: for that day shall not come, except there come a falling away first, and that man of sin be revealed, the son of perdition;* The apostasy under Manasseh that Sammael drives (5:15) is the falling away whose pattern the man of sin fulfills.'),
  ('ascension-isaiah', 'ascension-isaiah', 5, 16, 'canon', '2-thessalonians', 2, 9, 'free', E'2 Thessalonians 2:9 — *Even him, whose coming is after the working of Satan with all power and signs and lying wonders,* Isaiah doing nothing and Beliar doing all ''according to the will of Satan'' (5:16) names the very engine Paul names.'),
  ('ascension-isaiah', 'ascension-isaiah', 5, 15, 'canon', 'revelation', 13, 7, 'free', E'Revelation 13:7 — *And it was given unto him to make war with the saints, and to overcome them: and power was given him over all kindreds, and tongues, and nations.* Sammael''s wrath against the saint who beheld the Beloved (5:15) is the beast''s war on the saints in seed-form.'),
  -- thread: ascension-isaiah-5-prophets-flee-remnant
  ('ascension-isaiah', 'ascension-isaiah', 5, 13, 'canon', '1-kings', 19, 18, 'free', E'1 Kings 19:18 — *Yet I have left me seven thousand in Yashar''el (Israel), all the knees which have not bowed unto Baal, and every mouth which hath not kissed him.* The prophets sent to Tyre and Sidon (5:13) are the preserved remnant who never bowed, as in Elijah''s day.'),
  ('ascension-isaiah', 'ascension-isaiah', 5, 13, 'canon', 'revelation', 12, 6, 'free', E'Revelation 12:6 — *And the woman fled into the wilderness, where she hath a place prepared of Elohim (God), that they should feed her there a thousand two hundred and threescore days.* The faithful fleeing the murderous city (5:13) is the woman fleeing to the place Elohim prepares.'),
  ('ascension-isaiah', 'ascension-isaiah', 5, 13, 'canon', 'hebrews', 11, 38, 'free', E'Hebrews 11:38 — *(Of whom the world was not worthy:) they wandered in deserts, and in mountains, and in dens and caves of the earth.* The scattered prophets of 5:13 are these wanderers the world was not worthy of, kin to the sawn-asunder of the next verse.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session403_asci5_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session403_asci5_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-5-sawn-asunder',
       E'They sawed him in sunder — the martyr-prophet',
       E'*And when Isaiah was being sawn in sunder, he neither cried aloud nor wept, but his lips spake with the Ruach HaKodesh (Holy Spirit) until he was sawn in twain.* (Ascension of Isaiah 5:14). It ain''t new: the roll of the faithful in Hebrews names this very death — *They were stoned, they were sawn asunder, were tempted, were slain with the sword: they wandered about in sheepskins and goatskins; being destitute, afflicted, tormented;* (Hebrews 11:37). The Beloved Himself names the slaying of the prophets as the city''s inheritance — *Wherefore ye be witnesses unto yourselves, that ye are the children of them which killed the prophets.* (Matthew 23:31). Stephen lays the same charge: *Which of the prophets have not your fathers persecuted? and they have slain them which shewed before of the coming of the Just One; of whom ye have been now the betrayers and murderers:* (Acts 7:52). And the souls under the altar still cry — *And when he had opened the fifth seal, I saw under the altar the souls of them that were slain for the word of Elohim (God), and for the testimony which they held:* (Revelation 6:9). Isaiah is one of these, foretelling the suffering Righteous One he would one day be joined to.',
       sv.verse_id, ev.verse_id, 'extras', 67600
  FROM _session403_asci5_lookup sv, _session403_asci5_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=5 AND sv.verse_number=11
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=5 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-5-beliar-sammael-seed-war',
       E'Beliar in the heart of Manasseh — the seed-war',
       E'*This, Beliar did to Isaiah through Belchira and Manasseh; for Sammael was very wrathful against Isaiah from the days of Hezekiah, king of Yahudah (Judah), on account of the things which he had seen regarding the Beloved.* (Ascension of Isaiah 5:15). The wrath of Sammael against the prophet who had seen the Beloved is the old enmity, decreed in the garden — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* (Genesis 3:15). The adversary dwelling in the heart of an apostate king and working through a false prophet is the pattern Paul calls the man of sin — *Let no man deceive you by any means: for that day shall not come, except there come a falling away first, and that man of sin be revealed, the son of perdition;* (2 Thessalonians 2:3) — *Even him, whose coming is after the working of Satan with all power and signs and lying wonders,* (2 Thessalonians 2:9). And John sees the same spirit given a mouth and a war — *And it was given unto him to make war with the saints, and to overcome them: and power was given him over all kindreds, and tongues, and nations.* (Revelation 13:7). Beliar/Sammael is ha-satan; the saw is one strike in the war on the seed.',
       sv.verse_id, ev.verse_id, 'extras', 67603
  FROM _session403_asci5_lookup sv, _session403_asci5_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=5 AND sv.verse_number=1
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=5 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-5-prophets-flee-remnant',
       E'Go ye to Tyre and Sidon — the remnant scattered',
       E'*And to the prophets who were with him he said before he had been sawn in sunder: "Go ye to the region of Tyre and Sidon; for for me only hath Elohim (God) mingled the cup."* (Ascension of Isaiah 5:13). The faithful prophets are sent away to live while the city kills its seer — the remnant that does not bow. It ain''t new: when Elijah thought himself alone, the answer was a hidden remnant — *Yet I have left me seven thousand in Yashar''el (Israel), all the knees which have not bowed unto Baal, and every mouth which hath not kissed him.* (1 Kings 19:18). The faithful flee the apostate city into the wilderness — *And the woman fled into the wilderness, where she hath a place prepared of Elohim (God), that they should feed her there a thousand two hundred and threescore days.* (Revelation 12:6) — the same of whom Hebrews says — *(Of whom the world was not worthy:) they wandered in deserts, and in mountains, and in dens and caves of the earth.* (Hebrews 11:38). Isaiah drinks the cup alone so the remnant may be preserved.',
       sv.verse_id, ev.verse_id, 'extras', 67606
  FROM _session403_asci5_lookup sv, _session403_asci5_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=5 AND sv.verse_number=13
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=5 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ascension-isaiah-5-sawn-asunder
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hebrews 11:37 — *They were stoned, they were sawn asunder, were tempted, were slain with the sword: they wandered about in sheepskins and goatskins; being destitute, afflicted, tormented;* The lone canon witness to the wood-saw martyrdom records exactly Isaiah''s death in 5:11.'
  FROM cross_reference_threads t, cross_references x, _session403_asci5_lookup sv, _session403_asci5_lookup tv
 WHERE t.slug='ascension-isaiah-5-sawn-asunder'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=5 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 23:31 — *Wherefore ye be witnesses unto yourselves, that ye are the children of them which killed the prophets.* The false prophets laughing and rejoicing at Isaiah''s death (5:2) are the same lineage the Beloved indicts.'
  FROM cross_reference_threads t, cross_references x, _session403_asci5_lookup sv, _session403_asci5_lookup tv
 WHERE t.slug='ascension-isaiah-5-sawn-asunder'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=5 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=23 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 7:52 — *Which of the prophets have not your fathers persecuted? and they have slain them which shewed before of the coming of the Just One; of whom ye have been now the betrayers and murderers:* Manasseh, the princes, and all the people looking on (5:12) stand in the company Stephen names before the council.'
  FROM cross_reference_threads t, cross_references x, _session403_asci5_lookup sv, _session403_asci5_lookup tv
 WHERE t.slug='ascension-isaiah-5-sawn-asunder'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=5 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=52
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 6:9 — *And when he had opened the fifth seal, I saw under the altar the souls of them that were slain for the word of Elohim (God), and for the testimony which they held:* Isaiah''s lips speaking by the Ruach until the end (5:14) place him among the slain who keep the testimony.'
  FROM cross_reference_threads t, cross_references x, _session403_asci5_lookup sv, _session403_asci5_lookup tv
 WHERE t.slug='ascension-isaiah-5-sawn-asunder'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=5 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=6 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-5-beliar-sammael-seed-war
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Beliar dwelling in Manasseh''s heart to saw Isaiah (5:1) is the serpent''s enmity against the woman''s seed working in history.'
  FROM cross_reference_threads t, cross_references x, _session403_asci5_lookup sv, _session403_asci5_lookup tv
 WHERE t.slug='ascension-isaiah-5-beliar-sammael-seed-war'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=5 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Thessalonians 2:3 — *Let no man deceive you by any means: for that day shall not come, except there come a falling away first, and that man of sin be revealed, the son of perdition;* The apostasy under Manasseh that Sammael drives (5:15) is the falling away whose pattern the man of sin fulfills.'
  FROM cross_reference_threads t, cross_references x, _session403_asci5_lookup sv, _session403_asci5_lookup tv
 WHERE t.slug='ascension-isaiah-5-beliar-sammael-seed-war'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=5 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='2-thessalonians' AND tv.chapter_number=2 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Thessalonians 2:9 — *Even him, whose coming is after the working of Satan with all power and signs and lying wonders,* Isaiah doing nothing and Beliar doing all ''according to the will of Satan'' (5:16) names the very engine Paul names.'
  FROM cross_reference_threads t, cross_references x, _session403_asci5_lookup sv, _session403_asci5_lookup tv
 WHERE t.slug='ascension-isaiah-5-beliar-sammael-seed-war'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=5 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='2-thessalonians' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 13:7 — *And it was given unto him to make war with the saints, and to overcome them: and power was given him over all kindreds, and tongues, and nations.* Sammael''s wrath against the saint who beheld the Beloved (5:15) is the beast''s war on the saints in seed-form.'
  FROM cross_reference_threads t, cross_references x, _session403_asci5_lookup sv, _session403_asci5_lookup tv
 WHERE t.slug='ascension-isaiah-5-beliar-sammael-seed-war'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=5 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=13 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-5-prophets-flee-remnant
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Kings 19:18 — *Yet I have left me seven thousand in Yashar''el (Israel), all the knees which have not bowed unto Baal, and every mouth which hath not kissed him.* The prophets sent to Tyre and Sidon (5:13) are the preserved remnant who never bowed, as in Elijah''s day.'
  FROM cross_reference_threads t, cross_references x, _session403_asci5_lookup sv, _session403_asci5_lookup tv
 WHERE t.slug='ascension-isaiah-5-prophets-flee-remnant'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=5 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=19 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 12:6 — *And the woman fled into the wilderness, where she hath a place prepared of Elohim (God), that they should feed her there a thousand two hundred and threescore days.* The faithful fleeing the murderous city (5:13) is the woman fleeing to the place Elohim prepares.'
  FROM cross_reference_threads t, cross_references x, _session403_asci5_lookup sv, _session403_asci5_lookup tv
 WHERE t.slug='ascension-isaiah-5-prophets-flee-remnant'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=5 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=12 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 11:38 — *(Of whom the world was not worthy:) they wandered in deserts, and in mountains, and in dens and caves of the earth.* The scattered prophets of 5:13 are these wanderers the world was not worthy of, kin to the sawn-asunder of the next verse.'
  FROM cross_reference_threads t, cross_references x, _session403_asci5_lookup sv, _session403_asci5_lookup tv
 WHERE t.slug='ascension-isaiah-5-prophets-flee-remnant'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=5 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=38
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

