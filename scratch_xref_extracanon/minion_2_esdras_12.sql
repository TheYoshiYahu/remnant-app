-- ----- fragment: minion_2esdras_12.sql (session253 2-esdras 12) -----
-- Source anchor: apocrypha/2-esdras ch12. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2esd12 (view _session253_2esd12_lookup). Sort band base 63275, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2esd12_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-esdras-12-lion-is-the-anointed
  ('apocrypha', '2-esdras', 12, 32, 'canon', 'genesis', 49, 9, 'free', E'Genesis 49:9 — *Yahudah (Judah) is a lion''s whelp: from the prey, my son, thou art gone up: he stooped down, he couched as a lion, and as an old lion; who shall rouse him up?* The roaring lion that rebukes the eagle is the whelp of Judah of Jacob''s blessing, the Anointed sprung from David''s tribe of 2 Esdras 12:32.'),
  ('apocrypha', '2-esdras', 12, 32, 'canon', 'genesis', 49, 10, 'free', E'Genesis 49:10 — *The sceptre shall not depart from Yahudah (Judah), nor a lawgiver from between his feet, until Shiloh come; and unto him shall the gathering of the people be.* The Anointed kept unto the end of 2 Esdras 12:32 is Shiloh, in whom the sceptre of Judah comes to rest and the people are gathered.'),
  ('apocrypha', '2-esdras', 12, 31, 'canon', 'revelation', 5, 5, 'free', E'Revelation 5:5 — *And one of the elders saith unto me, Weep not: behold, the Lion of the tribe of Juda, the Root of David, hath prevailed to open the book, and to loose the seven seals thereof.* The lion rising out of the wood and roaring against the eagle in 2 Esdras 12:31 is the very Lion of the tribe of Judah who prevails in John''s throne-vision.'),
  -- thread: 2-esdras-12-eagle-is-daniels-fourth-kingdom
  ('apocrypha', '2-esdras', 12, 11, 'canon', 'daniel', 7, 23, 'free', E'Daniel 7:23 — *Thus he said, The fourth beast shall be the fourth kingdom upon earth, which shall be diverse from all kingdoms, and shall devour the whole earth, and shall tread it down, and break it in pieces.* The angel ties the eagle from the sea directly to Daniel''s brother-vision in 2 Esdras 12:11 — both name the fourth, devouring kingdom of man.'),
  ('apocrypha', '2-esdras', 12, 13, 'canon', 'revelation', 13, 1, 'free', E'Revelation 13:1 — *And I stood upon the sand of the sea, and saw a beast rise up out of the sea, having seven heads and ten horns, and upon his horns ten crowns, and upon his heads the name of blasphemy.* The kingdom feared above all that rose up from the sea in 2 Esdras 12:13 is John''s many-headed beast risen from the same sea — the kingdom-system of man.'),
  -- thread: 2-esdras-12-beast-slain-kingdom-to-the-saints
  ('apocrypha', '2-esdras', 12, 3, 'canon', 'daniel', 7, 11, 'free', E'Daniel 7:11 — *I beheld then because of the voice of the great words which the horn spake: I beheld even till the beast was slain, and his body destroyed, and given to the burning flame.* The whole body of the eagle burnt in 2 Esdras 12:3 is Daniel''s beast slain and given to the burning flame — the same end of the kingdom of man.'),
  ('apocrypha', '2-esdras', 12, 33, 'canon', 'daniel', 7, 27, 'free', E'Daniel 7:27 — *And the kingdom and dominion, and the greatness of the kingdom under the whole heaven, shall be given to the people of the saints of the El Elyon (most High), whose kingdom is an everlasting kingdom, and all dominions shall serve and obey him.* After the Anointed sets the kingdoms before him in judgment in 2 Esdras 12:33, the dominion passes to the saints of the Most High.'),
  ('apocrypha', '2-esdras', 12, 33, 'canon', '2-thessalonians', 2, 8, 'free', E'2 Thessalonians 2:8 — *And then shall that Wicked be revealed, whom Yahuah (Lord) shall consume with the spirit of his mouth, and shall destroy with the brightness of his coming:* The Anointed who reproves and corrects the wicked kingdoms in 2 Esdras 12:33 is the One who consumes the Wicked with the breath of his mouth at his coming.'),
  -- thread: 2-esdras-12-rest-of-my-people-delivered
  ('apocrypha', '2-esdras', 12, 34, 'canon', 'isaiah', 11, 11, 'free', E'Isaiah 11:11 — *And it shall come to pass in that day, that Yahuah (Lord) shall set his hand again the second time to recover the remnant of his people, which shall be left, from Assyria, and from Egypt, and from Pathros, and from Cush, and from Elam, and from Shinar, and from Hamath, and from the islands of the sea.* The rest of the people delivered with mercy in 2 Esdras 12:34 is the remnant Yahuah recovers a second time from the lands of the dispersion.'),
  ('apocrypha', '2-esdras', 12, 34, 'canon', 'isaiah', 11, 12, 'free', E'Isaiah 11:12 — *And he shall set up an ensign for the nations, and shall assemble the outcasts of Yashar''el (Israel), and gather together the dispersed of Yahudah (Judah) from the four corners of the earth.* The mercy shown to the rest of the people in 2 Esdras 12:34 gathers both houses — outcast Israel and dispersed Judah — from the four corners.'),
  ('apocrypha', '2-esdras', 12, 34, 'canon', 'ezekiel', 37, 22, 'free', E'Ezekiel 37:22 — *And I will make them one nation in the land upon the mountains of Yashar''el (Israel); and one king shall be king to them all: and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all:* The rest of the people the Anointed makes joyful in 2 Esdras 12:34 are the two sticks joined into one nation under one King.'),
  -- thread: 2-esdras-12-write-in-a-book-and-seal-it
  ('apocrypha', '2-esdras', 12, 37, 'canon', 'daniel', 12, 4, 'free', E'Daniel 12:4 — *But thou, O Daniel, shut up the words, and seal the book, even to the time of the end: many shall run to and fro, and knowledge shall be increased.* The charge to write the vision in a book and hide it in 2 Esdras 12:37 echoes Daniel''s sealing of the words until the time of the end.'),
  ('apocrypha', '2-esdras', 12, 38, 'canon', 'daniel', 12, 9, 'free', E'Daniel 12:9 — *And he said, Go thy way, Daniel: for the words are closed up and sealed till the time of the end.* The secrets taught only to the wise who can keep them in 2 Esdras 12:38 are Daniel''s words closed and sealed for the latter days.'),
  -- thread: 2-esdras-12-day-of-judgment
  ('apocrypha', '2-esdras', 12, 34, 'canon', 'daniel', 12, 2, 'free', E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The coming day of judgment in 2 Esdras 12:34 is Daniel''s awakening of the sleepers in the dust to everlasting life or contempt.'),
  ('apocrypha', '2-esdras', 12, 34, 'canon', 'revelation', 20, 12, 'free', E'Revelation 20:12 — *And I saw the dead, small and great, stand before Elohim (God); and the books were opened: and another book was opened, which is the book of life: and the dead were judged out of those things which were written in the books, according to their works.* The day of judgment spoken from the beginning in 2 Esdras 12:34 is John''s great white throne, where the books are opened and the dead are judged.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2esd12_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2esd12_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-12-lion-is-the-anointed',
       E'The Lion is the Anointed — the Lion of Judah',
       E'Esdras hears the meaning of the lion that roared against the eagle: *This is the anointed, which the Highest has kept for them and for their wickedness to the end: he shall reprove them, and shall upbraid them with their cruelty.* (2 Esdras 12:32). 4 Ezra''s own messianism names him plainly — the kept Anointed One who springs from Judah. Come and see the lion of the dream: *Yahudah (Judah) is a lion''s whelp: from the prey, my son, thou art gone up: he stooped down, he couched as a lion, and as an old lion; who shall rouse him up?* (Genesis 49:9), and the sceptre that abides until Shiloh: *The sceptre shall not depart from Yahudah (Judah), nor a lawgiver from between his feet, until Shiloh come; and unto him shall the gathering of the people be.* (Genesis 49:10). John sees the same Lion prevail: *And one of the elders saith unto me, Weep not: behold, the Lion of the tribe of Juda, the Root of David, hath prevailed to open the book, and to loose the seven seals thereof.* (Revelation 5:5). It ain''t new — the kept Anointed of Esdras is the Lion of Judah, the Root of David, Yahusha.',
       sv.verse_id, ev.verse_id, 'extras', 63275
  FROM _session253_2esd12_lookup sv, _session253_2esd12_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=12 AND sv.verse_number=31
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=12 AND ev.verse_number=32
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-12-eagle-is-daniels-fourth-kingdom',
       E'The eagle is Daniel''s fourth kingdom',
       E'The angel unfolds the eagle to Esdras: *The eagle, whom you sawest come up from the sea, is the kingdom which was seen in the vision of your brother Daniel.* (2 Esdras 12:11), *Behold, the days will come, that there shall rise up a kingdom upon earth, and it shall be feared above all the kingdoms that were before it.* (2 Esdras 12:13). Come and see the brother-vision named: *Thus he said, The fourth beast shall be the fourth kingdom upon earth, which shall be diverse from all kingdoms, and shall devour the whole earth, and shall tread it down, and break it in pieces.* (Daniel 7:23). John watches the same kingdom-of-man rise: *And I stood upon the sand of the sea, and saw a beast rise up out of the sea, having seven heads and ten horns, and upon his horns ten crowns, and upon his heads the name of blasphemy.* (Revelation 13:1). The eagle is the beast-system from the sea — the kingdom of man dismantled, not Israel.',
       sv.verse_id, ev.verse_id, 'extras', 63278
  FROM _session253_2esd12_lookup sv, _session253_2esd12_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=12 AND sv.verse_number=11
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=12 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-12-beast-slain-kingdom-to-the-saints',
       E'The beast slain — the kingdom given to the saints',
       E'Esdras hears the eagle''s end and the Anointed''s judgment: *And I saw, and, behold, they appeared no more, and the whole body of the eagle was burnt so that the earth was in great fear* (2 Esdras 12:3); *For he shall set them before him alive in judgment, and shall rebuke them, and correct them.* (2 Esdras 12:33). Come and see Daniel: *I beheld even till the beast was slain, and his body destroyed, and given to the burning flame.* (Daniel 7:11); and the kingdom that follows: *And the kingdom and dominion, and the greatness of the kingdom under the whole heaven, shall be given to the people of the saints of the El Elyon (most High), whose kingdom is an everlasting kingdom, and all dominions shall serve and obey him.* (Daniel 7:27). Paul names the consuming of the Wicked: *And then shall that Wicked be revealed, whom Yahuah (Lord) shall consume with the spirit of his mouth, and shall destroy with the brightness of his coming* (2 Thessalonians 2:8). The burnt eagle, the slain beast, the Anointed''s word — one judgment, one everlasting kingdom for the saints.',
       sv.verse_id, ev.verse_id, 'extras', 63281
  FROM _session253_2esd12_lookup sv, _session253_2esd12_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=12 AND sv.verse_number=3
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=12 AND ev.verse_number=33
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-12-rest-of-my-people-delivered',
       E'The rest of my people delivered — the remnant of both houses',
       E'The Anointed''s work is not only to judge but to gather: *For the rest of my people shall he deliver with mercy, those that have been pressed upon my borders, and he shall make them joyful until the coming of the day of judgment, of which I have spoken to you from the beginning.* (2 Esdras 12:34). This is no church replacing Israel — it is the faithful remnant kept and regathered. Come and see Yahuah''s own hand to recover them: *And it shall come to pass in that day, that Yahuah (Lord) shall set his hand again the second time to recover the remnant of his people, which shall be left, from Assyria, and from Egypt, and from Pathros, and from Cush, and from Elam, and from Shinar, and from Hamath, and from the islands of the sea.* (Isaiah 11:11), *and shall assemble the outcasts of Yashar''el (Israel), and gather together the dispersed of Yahudah (Judah) from the four corners of the earth.* (Isaiah 11:12). Ezekiel makes the two houses one: *And I will make them one nation in the land upon the mountains of Yashar''el (Israel); and one king shall be king to them all: and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all* (Ezekiel 37:22). The rest delivered with mercy is the two-house remnant gathered under one King.',
       sv.verse_id, ev.verse_id, 'extras', 63284
  FROM _session253_2esd12_lookup sv, _session253_2esd12_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=12 AND sv.verse_number=34
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=12 AND ev.verse_number=34
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-12-write-in-a-book-and-seal-it',
       E'Write in a book and seal it — sealed till the time of the end',
       E'The Highest commands Esdras: *Therefore write all these things that you have seen in a book, and hide them* (2 Esdras 12:37), *And teach them to the wise of the people, whose hearts you know may comprehend and keep these secrets.* (2 Esdras 12:38). Come and see Daniel given the same charge: *But thou, O Daniel, shut up the words, and seal the book, even to the time of the end: many shall run to and fro, and knowledge shall be increased.* (Daniel 12:4), *And he said, Go thy way, Daniel: for the words are closed up and sealed till the time of the end.* (Daniel 12:9). The apocalyptic vision is written, sealed, and reserved for the wise of the latter days — it ain''t new, the seer of Esdras stands in Daniel''s office.',
       sv.verse_id, ev.verse_id, 'extras', 63287
  FROM _session253_2esd12_lookup sv, _session253_2esd12_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=12 AND sv.verse_number=37
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=12 AND ev.verse_number=38
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-12-day-of-judgment',
       E'Until the day of judgment — the books opened',
       E'Esdras hears the horizon of the vision: *and he shall make them joyful until the coming of the day of judgment, of which I have spoken to you from the beginning.* (2 Esdras 12:34). Come and see Daniel''s resurrection-judgment: *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* (Daniel 12:2). John sees the day come and the books opened: *And I saw the dead, small and great, stand before Elohim (God); and the books were opened: and another book was opened, which is the book of life: and the dead were judged out of those things which were written in the books, according to their works.* (Revelation 20:12). The day of judgment of which the Highest spoke from the beginning is the white-throne reckoning when the dead awake and the books are opened.',
       sv.verse_id, ev.verse_id, 'extras', 63290
  FROM _session253_2esd12_lookup sv, _session253_2esd12_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=12 AND sv.verse_number=34
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=12 AND ev.verse_number=34
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-esdras-12-lion-is-the-anointed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 49:9 — *Yahudah (Judah) is a lion''s whelp: from the prey, my son, thou art gone up: he stooped down, he couched as a lion, and as an old lion; who shall rouse him up?* The roaring lion that rebukes the eagle is the whelp of Judah of Jacob''s blessing, the Anointed sprung from David''s tribe of 2 Esdras 12:32.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd12_lookup sv, _session253_2esd12_lookup tv
 WHERE t.slug='2-esdras-12-lion-is-the-anointed'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=12 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 49:10 — *The sceptre shall not depart from Yahudah (Judah), nor a lawgiver from between his feet, until Shiloh come; and unto him shall the gathering of the people be.* The Anointed kept unto the end of 2 Esdras 12:32 is Shiloh, in whom the sceptre of Judah comes to rest and the people are gathered.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd12_lookup sv, _session253_2esd12_lookup tv
 WHERE t.slug='2-esdras-12-lion-is-the-anointed'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=12 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 5:5 — *And one of the elders saith unto me, Weep not: behold, the Lion of the tribe of Juda, the Root of David, hath prevailed to open the book, and to loose the seven seals thereof.* The lion rising out of the wood and roaring against the eagle in 2 Esdras 12:31 is the very Lion of the tribe of Judah who prevails in John''s throne-vision.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd12_lookup sv, _session253_2esd12_lookup tv
 WHERE t.slug='2-esdras-12-lion-is-the-anointed'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=12 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=5 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-12-eagle-is-daniels-fourth-kingdom
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 7:23 — *Thus he said, The fourth beast shall be the fourth kingdom upon earth, which shall be diverse from all kingdoms, and shall devour the whole earth, and shall tread it down, and break it in pieces.* The angel ties the eagle from the sea directly to Daniel''s brother-vision in 2 Esdras 12:11 — both name the fourth, devouring kingdom of man.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd12_lookup sv, _session253_2esd12_lookup tv
 WHERE t.slug='2-esdras-12-eagle-is-daniels-fourth-kingdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=12 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 13:1 — *And I stood upon the sand of the sea, and saw a beast rise up out of the sea, having seven heads and ten horns, and upon his horns ten crowns, and upon his heads the name of blasphemy.* The kingdom feared above all that rose up from the sea in 2 Esdras 12:13 is John''s many-headed beast risen from the same sea — the kingdom-system of man.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd12_lookup sv, _session253_2esd12_lookup tv
 WHERE t.slug='2-esdras-12-eagle-is-daniels-fourth-kingdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=12 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=13 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-12-beast-slain-kingdom-to-the-saints
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 7:11 — *I beheld then because of the voice of the great words which the horn spake: I beheld even till the beast was slain, and his body destroyed, and given to the burning flame.* The whole body of the eagle burnt in 2 Esdras 12:3 is Daniel''s beast slain and given to the burning flame — the same end of the kingdom of man.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd12_lookup sv, _session253_2esd12_lookup tv
 WHERE t.slug='2-esdras-12-beast-slain-kingdom-to-the-saints'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=12 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 7:27 — *And the kingdom and dominion, and the greatness of the kingdom under the whole heaven, shall be given to the people of the saints of the El Elyon (most High), whose kingdom is an everlasting kingdom, and all dominions shall serve and obey him.* After the Anointed sets the kingdoms before him in judgment in 2 Esdras 12:33, the dominion passes to the saints of the Most High.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd12_lookup sv, _session253_2esd12_lookup tv
 WHERE t.slug='2-esdras-12-beast-slain-kingdom-to-the-saints'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=12 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Thessalonians 2:8 — *And then shall that Wicked be revealed, whom Yahuah (Lord) shall consume with the spirit of his mouth, and shall destroy with the brightness of his coming:* The Anointed who reproves and corrects the wicked kingdoms in 2 Esdras 12:33 is the One who consumes the Wicked with the breath of his mouth at his coming.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd12_lookup sv, _session253_2esd12_lookup tv
 WHERE t.slug='2-esdras-12-beast-slain-kingdom-to-the-saints'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=12 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='2-thessalonians' AND tv.chapter_number=2 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-12-rest-of-my-people-delivered
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 11:11 — *And it shall come to pass in that day, that Yahuah (Lord) shall set his hand again the second time to recover the remnant of his people, which shall be left, from Assyria, and from Egypt, and from Pathros, and from Cush, and from Elam, and from Shinar, and from Hamath, and from the islands of the sea.* The rest of the people delivered with mercy in 2 Esdras 12:34 is the remnant Yahuah recovers a second time from the lands of the dispersion.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd12_lookup sv, _session253_2esd12_lookup tv
 WHERE t.slug='2-esdras-12-rest-of-my-people-delivered'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=12 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 11:12 — *And he shall set up an ensign for the nations, and shall assemble the outcasts of Yashar''el (Israel), and gather together the dispersed of Yahudah (Judah) from the four corners of the earth.* The mercy shown to the rest of the people in 2 Esdras 12:34 gathers both houses — outcast Israel and dispersed Judah — from the four corners.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd12_lookup sv, _session253_2esd12_lookup tv
 WHERE t.slug='2-esdras-12-rest-of-my-people-delivered'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=12 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 37:22 — *And I will make them one nation in the land upon the mountains of Yashar''el (Israel); and one king shall be king to them all: and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all:* The rest of the people the Anointed makes joyful in 2 Esdras 12:34 are the two sticks joined into one nation under one King.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd12_lookup sv, _session253_2esd12_lookup tv
 WHERE t.slug='2-esdras-12-rest-of-my-people-delivered'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=12 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-12-write-in-a-book-and-seal-it
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 12:4 — *But thou, O Daniel, shut up the words, and seal the book, even to the time of the end: many shall run to and fro, and knowledge shall be increased.* The charge to write the vision in a book and hide it in 2 Esdras 12:37 echoes Daniel''s sealing of the words until the time of the end.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd12_lookup sv, _session253_2esd12_lookup tv
 WHERE t.slug='2-esdras-12-write-in-a-book-and-seal-it'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=12 AND sv.verse_number=37
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 12:9 — *And he said, Go thy way, Daniel: for the words are closed up and sealed till the time of the end.* The secrets taught only to the wise who can keep them in 2 Esdras 12:38 are Daniel''s words closed and sealed for the latter days.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd12_lookup sv, _session253_2esd12_lookup tv
 WHERE t.slug='2-esdras-12-write-in-a-book-and-seal-it'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=12 AND sv.verse_number=38
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-12-day-of-judgment
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The coming day of judgment in 2 Esdras 12:34 is Daniel''s awakening of the sleepers in the dust to everlasting life or contempt.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd12_lookup sv, _session253_2esd12_lookup tv
 WHERE t.slug='2-esdras-12-day-of-judgment'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=12 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 20:12 — *And I saw the dead, small and great, stand before Elohim (God); and the books were opened: and another book was opened, which is the book of life: and the dead were judged out of those things which were written in the books, according to their works.* The day of judgment spoken from the beginning in 2 Esdras 12:34 is John''s great white throne, where the books are opened and the dead are judged.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd12_lookup sv, _session253_2esd12_lookup tv
 WHERE t.slug='2-esdras-12-day-of-judgment'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=12 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

