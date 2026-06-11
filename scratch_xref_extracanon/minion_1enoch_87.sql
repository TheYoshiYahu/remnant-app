-- ----- fragment: minion_1enoch_87.sql (session250 1-enoch 87) -----
-- Source anchor: enoch/1-enoch ch87. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en87 (view _session250_en87_lookup). Sort band base 52150, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en87_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-87-white-ones-bind-the-stars
  ('enoch', '1-enoch', 87, 2, 'enoch', '1-enoch', 10, 11, 'extras', E'1 Enoch 10:11 — *And Yahuah (God) said unto Michael: ''Go, bind Semjâzâ and his associates who have united themselves with women so as to have defiled themselves with them in all their uncleanness.* The white ones who descend in 87:2 are the archangels first commissioned to bind the Watchers.'),
  ('enoch', '1-enoch', 87, 2, 'enoch', '1-enoch', 10, 12, 'extras', E'1 Enoch 10:12 — *And when their sons have slain one another, and they have seen the destruction of their beloved ones, bind them fast for seventy generations in the valleys of the earth, till the day of their judgement and of their consummation, till the judgement that is for ever and ever is consummated.* The descent in 87:2 enacts the binding-command Enoch already received in ch10.'),
  ('enoch', '1-enoch', 87, 2, 'canon', 'daniel', 4, 13, 'free', E'Daniel 4:13 — *I saw in the visions of my head upon my bed, and, behold, a watcher and an holy one came down from heaven;* Daniel''s night-vision shows the same heavenly white one descending that Enoch sees in 87:2.'),
  ('enoch', '1-enoch', 87, 4, 'canon', 'daniel', 4, 17, 'free', E'Daniel 4:17 — *This matter is by the decree of the watchers, and the demand by the word of the holy ones: to the intent that the living may know that the El Elyon (most High) ruleth in the kingdom of men, and giveth it to whomsoever he will, and setteth up over it the basest of men.* The watchers who carry out the Most High''s decree are the appointed ministers stationed to watch in 87:4.'),
  -- thread: 1-enoch-87-the-host-bound-in-the-pit
  ('enoch', '1-enoch', 87, 2, 'canon', 'jude', 1, 6, 'free', E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude carries Enoch''s binding-of-the-Watchers into canon as the reason the white ones descend in 87:2.'),
  ('enoch', '1-enoch', 87, 2, 'canon', '2-peter', 2, 4, 'free', E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment;* Peter confirms the chains-of-darkness sentence the descending white ones execute in 87:2.'),
  ('enoch', '1-enoch', 87, 1, 'canon', 'isaiah', 24, 21, 'free', E'Isaiah 24:21 — *And it shall come to pass in that day, that Yahuah (LORD) shall punish the host of the high ones that are on high, and the kings of the earth upon the earth.* Isaiah names the high host that, with the goring beasts of 87:1, comes under the same judgement.'),
  ('enoch', '1-enoch', 87, 1, 'canon', 'isaiah', 24, 22, 'free', E'Isaiah 24:22 — *And they shall be gathered together, as prisoners are gathered in the pit, and shall be shut up in the prison, and after many days shall they be visited.* The shutting-up of the high ones in the pit is the very binding the white ones carry out beginning in 87:1.'),
  ('enoch', '1-enoch', 87, 2, 'canon', 'revelation', 20, 3, 'free', E'Revelation 20:3 — *And cast him into the bottomless pit, and shut him up, and set a seal upon him, that he should deceive the nations no more, till the thousand years should be fulfilled: and after that he must be loosed a little season.* John shows the same binding-until-the-judgement that the descending white ones begin in 87:2.'),
  -- thread: 1-enoch-87-enoch-taken-up-to-the-tower
  ('enoch', '1-enoch', 87, 3, 'canon', 'genesis', 5, 24, 'free', E'Genesis 5:24 — *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him.* The taking-up away from the generations of the earth in 87:3 is the canon''s record of Enoch''s translation.'),
  ('enoch', '1-enoch', 87, 5, 'canon', 'genesis', 6, 2, 'free', E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* The spirits of the departed giants crying out in 87:5 are the offspring of the union Genesis 6 records.'),
  ('enoch', '1-enoch', 87, 5, 'enoch', '1-enoch', 10, 9, 'extras', E'1 Enoch 10:9 — *And to Gabriel said Yahuah (God): ''Proceed against the bastards and the reprobates, and against the children of fornication: and destroy [the children of fornication and] the children of the Watchers from amongst men [and cause them to go forth]: send them one against the other that they may destroy each other in battle: for length of days shall they not have.* The departed giants whose spirits cry in 87:5 are the children of the Watchers Enoch was told would destroy one another.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en87_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en87_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-87-white-ones-bind-the-stars',
       E'The white ones come down to bind the fallen stars',
       E'In the Animal Apocalypse the heavens split and the archangels descend in human likeness: *And I raised mine eyes again to heaven, And I saw in the vision, and behold there came forth from heaven beings who were like white men: And four went forth from that place And three with them.* (1 Enoch 87:2). These are the same holy ones first sent to bind the rebel Watchers and their offspring, the command Enoch already heard plainly: *And Yahuah (God) said unto Michael: ''Go, bind Semjâzâ and his associates who have united themselves with women so as to have defiled themselves with them in all their uncleanness.* (1 Enoch 10:11) — *And when their sons have slain one another, and they have seen the destruction of their beloved ones, bind them fast for seventy generations in the valleys of the earth, till the day of their judgement and of their consummation, till the judgement that is for ever and ever is consummated.* (1 Enoch 10:12). Daniel saw one of these very beings descend in his own night-vision: *I saw in the visions of my head upon my bed, and, behold, a watcher and an holy one came down from heaven;* (Daniel 4:13), and named their office: *This matter is by the decree of the watchers, and the demand by the word of the holy ones: to the intent that the living may know that the El Elyon (most High) ruleth in the kingdom of men, and giveth it to whomsoever he will, and setteth up over it the basest of men.* (Daniel 4:17). It ain''t new: the white men of Enoch''s vision are the watchers and holy ones of Daniel, the appointed ministers who carry out the Most High''s decree of binding.',
       sv.verse_id, ev.verse_id, 'extras', 52150
  FROM _session250_en87_lookup sv, _session250_en87_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=87 AND sv.verse_number=2
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=87 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-87-the-host-bound-in-the-pit',
       E'The host of the high ones reserved in chains for judgement',
       E'The descent of the white ones is for one purpose — to chain the fallen powers until the day of judgement, exactly as the canon and the parallel chapters of Enoch testify. The earth that *began to cry aloud* (1 Enoch 87:1) under the goring of the beasts is the corrupted earth Enoch was shown would be healed only when the rebels are bound: *And to Gabriel said Yahuah (God): ''Proceed against the bastards and the reprobates, and against the children of fornication: and destroy the children of the Watchers from amongst men send them one against the other that they may destroy each other in battle: for length of days shall they not have.* (1 Enoch 10:9). Isaiah saw the same sentence on the high host: *And it shall come to pass in that day, that Yahuah (LORD) shall punish the host of the high ones that are on high, and the kings of the earth upon the earth.* (Isaiah 24:21) — *And they shall be gathered together, as prisoners are gathered in the pit, and shall be shut up in the prison, and after many days shall they be visited.* (Isaiah 24:22). Jude carries it forward as canon: *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* (Jude 1:6), and Peter agrees: *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment;* (2 Peter 2:4). The Watchers'' sin is rebellion against the Creator''s order — not Torah broken by the righteous but the heavenly order broken by the proud — and their binding stands until the great day.',
       sv.verse_id, ev.verse_id, 'extras', 52153
  FROM _session250_en87_lookup sv, _session250_en87_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=87 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=87 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-87-enoch-taken-up-to-the-tower',
       E'Enoch taken up to the tower to behold the end',
       E'One of the three white ones takes Enoch from among men and sets him on a height to watch: *And those three that had last come forth grasped me by my right hand And took me up away from the generations of the earth, And raised me up to a lofty place, And showed me a tower raised high above the earth, And all the hills were lower.* (1 Enoch 87:3), and the charge is given: *And one said unto me: ''Remain here till thou seest everything That befalls those elephants, camels, and asses, And the stars and the oxen, and all of them.''* (1 Enoch 87:4). This is the same Enoch the canon records was carried off from the generations of the earth: *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him.* (Genesis 5:24). He is set above to see the whole symbolic history play out — the giants whose spirits still cry, the fallen stars, and the oxen of the patriarchal line: *And I beheld the spirits of the departed giants, And they were standing in the vision, And their voices went forth to heaven, And they cried aloud.* (1 Enoch 87:5), the residue of the children of the Watchers whose origin Enoch already learned: *And it came to pass, when men began to multiply on the face of the earth, and daughters were born unto them, That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* (Genesis 6:2). It ain''t new: the seed-war Enoch is lifted up to watch begins in Genesis 6, runs through the goring beasts, and ends only at the binding the white ones now carry down.',
       sv.verse_id, ev.verse_id, 'extras', 52156
  FROM _session250_en87_lookup sv, _session250_en87_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=87 AND sv.verse_number=3
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=87 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-87-white-ones-bind-the-stars
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 10:11 — *And Yahuah (God) said unto Michael: ''Go, bind Semjâzâ and his associates who have united themselves with women so as to have defiled themselves with them in all their uncleanness.* The white ones who descend in 87:2 are the archangels first commissioned to bind the Watchers.'
  FROM cross_reference_threads t, cross_references x, _session250_en87_lookup sv, _session250_en87_lookup tv
 WHERE t.slug='1-enoch-87-white-ones-bind-the-stars'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=87 AND sv.verse_number=2
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 10:12 — *And when their sons have slain one another, and they have seen the destruction of their beloved ones, bind them fast for seventy generations in the valleys of the earth, till the day of their judgement and of their consummation, till the judgement that is for ever and ever is consummated.* The descent in 87:2 enacts the binding-command Enoch already received in ch10.'
  FROM cross_reference_threads t, cross_references x, _session250_en87_lookup sv, _session250_en87_lookup tv
 WHERE t.slug='1-enoch-87-white-ones-bind-the-stars'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=87 AND sv.verse_number=2
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 4:13 — *I saw in the visions of my head upon my bed, and, behold, a watcher and an holy one came down from heaven;* Daniel''s night-vision shows the same heavenly white one descending that Enoch sees in 87:2.'
  FROM cross_reference_threads t, cross_references x, _session250_en87_lookup sv, _session250_en87_lookup tv
 WHERE t.slug='1-enoch-87-white-ones-bind-the-stars'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=87 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=4 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Daniel 4:17 — *This matter is by the decree of the watchers, and the demand by the word of the holy ones: to the intent that the living may know that the El Elyon (most High) ruleth in the kingdom of men, and giveth it to whomsoever he will, and setteth up over it the basest of men.* The watchers who carry out the Most High''s decree are the appointed ministers stationed to watch in 87:4.'
  FROM cross_reference_threads t, cross_references x, _session250_en87_lookup sv, _session250_en87_lookup tv
 WHERE t.slug='1-enoch-87-white-ones-bind-the-stars'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=87 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=4 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-87-the-host-bound-in-the-pit
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude carries Enoch''s binding-of-the-Watchers into canon as the reason the white ones descend in 87:2.'
  FROM cross_reference_threads t, cross_references x, _session250_en87_lookup sv, _session250_en87_lookup tv
 WHERE t.slug='1-enoch-87-the-host-bound-in-the-pit'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=87 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment;* Peter confirms the chains-of-darkness sentence the descending white ones execute in 87:2.'
  FROM cross_reference_threads t, cross_references x, _session250_en87_lookup sv, _session250_en87_lookup tv
 WHERE t.slug='1-enoch-87-the-host-bound-in-the-pit'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=87 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 24:21 — *And it shall come to pass in that day, that Yahuah (LORD) shall punish the host of the high ones that are on high, and the kings of the earth upon the earth.* Isaiah names the high host that, with the goring beasts of 87:1, comes under the same judgement.'
  FROM cross_reference_threads t, cross_references x, _session250_en87_lookup sv, _session250_en87_lookup tv
 WHERE t.slug='1-enoch-87-the-host-bound-in-the-pit'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=87 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=24 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 24:22 — *And they shall be gathered together, as prisoners are gathered in the pit, and shall be shut up in the prison, and after many days shall they be visited.* The shutting-up of the high ones in the pit is the very binding the white ones carry out beginning in 87:1.'
  FROM cross_reference_threads t, cross_references x, _session250_en87_lookup sv, _session250_en87_lookup tv
 WHERE t.slug='1-enoch-87-the-host-bound-in-the-pit'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=87 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=24 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Revelation 20:3 — *And cast him into the bottomless pit, and shut him up, and set a seal upon him, that he should deceive the nations no more, till the thousand years should be fulfilled: and after that he must be loosed a little season.* John shows the same binding-until-the-judgement that the descending white ones begin in 87:2.'
  FROM cross_reference_threads t, cross_references x, _session250_en87_lookup sv, _session250_en87_lookup tv
 WHERE t.slug='1-enoch-87-the-host-bound-in-the-pit'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=87 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-87-enoch-taken-up-to-the-tower
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 5:24 — *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him.* The taking-up away from the generations of the earth in 87:3 is the canon''s record of Enoch''s translation.'
  FROM cross_reference_threads t, cross_references x, _session250_en87_lookup sv, _session250_en87_lookup tv
 WHERE t.slug='1-enoch-87-enoch-taken-up-to-the-tower'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=87 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* The spirits of the departed giants crying out in 87:5 are the offspring of the union Genesis 6 records.'
  FROM cross_reference_threads t, cross_references x, _session250_en87_lookup sv, _session250_en87_lookup tv
 WHERE t.slug='1-enoch-87-enoch-taken-up-to-the-tower'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=87 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 10:9 — *And to Gabriel said Yahuah (God): ''Proceed against the bastards and the reprobates, and against the children of fornication: and destroy [the children of fornication and] the children of the Watchers from amongst men [and cause them to go forth]: send them one against the other that they may destroy each other in battle: for length of days shall they not have.* The departed giants whose spirits cry in 87:5 are the children of the Watchers Enoch was told would destroy one another.'
  FROM cross_reference_threads t, cross_references x, _session250_en87_lookup sv, _session250_en87_lookup tv
 WHERE t.slug='1-enoch-87-enoch-taken-up-to-the-tower'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=87 AND sv.verse_number=5
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

