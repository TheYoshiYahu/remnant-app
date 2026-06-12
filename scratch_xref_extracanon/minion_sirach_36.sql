-- ----- fragment: minion_ecclesiasticus_36.sql (session253 ecclesiasticus 36) -----
-- Source anchor: apocrypha/ecclesiasticus ch36. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: sir36 (view _session253_sir36_lookup). Sort band base 59175, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_sir36_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ecclesiasticus-36-gather-the-tribes-of-jacob
  ('apocrypha', 'ecclesiasticus', 36, 11, 'canon', 'isaiah', 11, 11, 'free', E'Isaiah 11:11 — *And it shall come to pass in that day, that Yahuah (Lord) shall set his hand again the second time to recover the remnant of his people, which shall be left, from Assyria, and from Egypt, and from Pathros, and from Cush, and from Elam, and from Shinar, and from Hamath, and from the islands of the sea.* The second-time recovery of the remnant is exactly Ben Sira''s plea to gather the tribes of Jacob as from the beginning.'),
  ('apocrypha', 'ecclesiasticus', 36, 11, 'canon', 'isaiah', 11, 12, 'free', E'Isaiah 11:12 — *And he shall set up an ensign for the nations, and shall assemble the outcasts of Yashar''el (Israel), and gather together the dispersed of Yahudah (Judah) from the four corners of the earth.* Both houses — Israel''s outcasts and Judah''s dispersed — are the tribes of Jacob Sirach 36:11 prays Yahuah will inherit again.'),
  ('apocrypha', 'ecclesiasticus', 36, 11, 'canon', 'ezekiel', 37, 21, 'free', E'Ezekiel 37:21 — *And say unto them, Thus saith Adonai Yahuah (the Lord GOD); Behold, I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side, and bring them into their own land:* The gathering on every side answers Sirach 36:11''s prayer to gather all the tribes of Jacob together.'),
  ('apocrypha', 'ecclesiasticus', 36, 11, 'canon', 'ezekiel', 37, 22, 'free', E'Ezekiel 37:22 — *And I will make them one nation in the land upon the mountains of Yashar''el (Israel); and one king shall be king to them all: and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all:* The tribes of Jacob in Sirach 36:11 are gathered into one nation — the two houses divided no more.'),
  ('apocrypha', 'ecclesiasticus', 36, 11, 'canon', 'deuteronomy', 30, 3, 'free', E'Deuteronomy 30:3 — *That then Yahuah Elohayka (the LORD thy God) will turn thy captivity, and have compassion upon thee, and will return and gather thee from all the nations, whither Yahuah Elohayka (the LORD thy God) hath scattered thee.* The Torah promise of regathering from all nations is the ground of Ben Sira''s prayer in Sirach 36:11.'),
  -- thread: ecclesiasticus-36-no-god-but-yahuah
  ('apocrypha', 'ecclesiasticus', 36, 6, 'canon', 'exodus', 7, 5, 'free', E'Exodus 7:5 — *And the Egyptians shall know that I am Yahuah (LORD), when I stretch forth mine hand upon Egypt, and bring out the children of Yashar''el (Israel) from among them.* The stretched-out hand and the heathen made to know Yahuah is exactly the new signs Sirach 36:6 prays for.'),
  ('apocrypha', 'ecclesiasticus', 36, 5, 'canon', 'joel', 3, 16, 'free', E'Joel 3:16 — *Yahuah (LORD) also shall roar out of Zion, and utter his voice from Jerusalem; and the heavens and the earth shall shake: but Yahuah (LORD) will be the hope of his people, and the strength of the children of Yashar''el (Israel).* The day Yahuah is shown to be the only God answers Sirach 36:5''s plea that the nations know there is no God but him.'),
  ('apocrypha', 'ecclesiasticus', 36, 5, 'apocrypha', '2-maccabees', 1, 27, 'extras', E'2 Maccabees 1:27 — *Gather those together that are scattered from us, deliver them that serve among the heathen, look upon them that are despised and abhorred, and let the heathen know that you are our Elohim (God).* The very same restored-library prayer — gather the scattered and let the heathen know Yahuah — stands beside Sirach 36:5.'),
  -- thread: ecclesiasticus-36-israel-my-firstborn
  ('apocrypha', 'ecclesiasticus', 36, 12, 'canon', 'exodus', 4, 22, 'free', E'Exodus 4:22 — *And thou shalt say unto Pharaoh, Thus saith Yahuah (LORD), Yashar''el (Israel) is my son, even my firstborn:* The firstborn title Sirach 36:12 pleads is Yahuah''s own declaration over Israel at the Exodus.'),
  ('apocrypha', 'ecclesiasticus', 36, 12, 'canon', 'jeremiah', 31, 9, 'free', E'Jeremiah 31:9 — *They shall come with weeping, and with supplications will I lead them: I will cause them to walk by the rivers of waters in a straight way, wherein they shall not stumble: for I am a father to Yashar''el (Israel), and Ephraim is my firstborn.* Yahuah keeps the firstborn name over the gathered house, the people called by his name in Sirach 36:12.'),
  ('apocrypha', 'ecclesiasticus', 36, 12, 'canon', 'hosea', 1, 10, 'free', E'Hosea 1:10 — *Yet the number of the children of Yashar''el (Israel) shall be as the sand of the sea, which cannot be measured nor numbered; and it shall come to pass, that in the place where it was said unto them, Ye are not my people, there it shall be said unto them, Ye are the sons of the living Elohim (God).* The people called by Yahuah''s name in Sirach 36:12 are owned again as sons of the living God.'),
  ('apocrypha', 'ecclesiasticus', 36, 12, 'apocrypha', 'ecclesiasticus', 24, 8, 'extras', E'Ecclesiasticus 24:8 — *So the Creator of all things gave me a commandment, and he that made me caused my tabernacle to rest, and said, Let your dwelling be in Jacob, and your inheritance in Yashar''el (Israel).* Wisdom''s inheritance in Israel matches the firstborn people Sirach 36:12 names as Yahuah''s own.'),
  -- thread: ecclesiasticus-36-build-up-zion-faithful-prophets
  ('apocrypha', 'ecclesiasticus', 36, 14, 'canon', 'psalms', 102, 13, 'free', E'Psalm 102:13 — *Thou shalt arise, and have mercy upon Zion: for the time to favour her, yea, the set time, is come.* The set time to favour Zion is the mercy on Jerusalem Sirach 36:13-14 prays Yahuah to grant.'),
  ('apocrypha', 'ecclesiasticus', 36, 14, 'canon', 'psalms', 102, 16, 'free', E'Psalm 102:16 — *When Yahuah (LORD) shall build up Zion, he shall appear in his glory.* Sion filled with Yahuah''s glory in Sirach 36:14 is the rebuilt Zion where he appears in his glory.'),
  ('apocrypha', 'ecclesiasticus', 36, 14, 'canon', 'isaiah', 60, 1, 'free', E'Isaiah 60:1 — *Arise, shine; for thy light is come, and the glory of Yahuah (LORD) is risen upon thee.* The glory that fills Sion in Sirach 36:14 is Isaiah''s risen glory upon the city.'),
  ('apocrypha', 'ecclesiasticus', 36, 17, 'canon', 'numbers', 6, 26, 'free', E'Numbers 6:26 — *Yahuah (LORD) lift up his countenance upon thee, and give thee peace.* Ben Sira closes the prayer with the blessing of Aaron, naming the very benediction of Numbers 6 in Sirach 36:17.'),
  ('apocrypha', 'ecclesiasticus', 36, 13, 'apocrypha', 'baruch-with-the-letter-of-jeremiah', 5, 5, 'extras', E'Baruch 5:5 — *Arise, O Jerusalem, and stand on high, and look about toward the east, and behold your children gathered from the west to the east by the word of the Holy One, rejoicing in the remembrance of Yahuah (God).* The mercy on Jerusalem in Sirach 36:13 is the regathered, rejoicing city of Baruch.'),
  -- thread: ecclesiasticus-36-a-wife-a-good-thing
  ('apocrypha', 'ecclesiasticus', 36, 24, 'canon', 'genesis', 2, 18, 'free', E'Genesis 2:18 — *And Yahuah Elohim (the LORD God) said, It is not good that the man should be alone; I will make him an help meet for him.* The help like to himself and pillar of rest in Sirach 36:24 is Eden''s help meet.'),
  ('apocrypha', 'ecclesiasticus', 36, 24, 'canon', 'proverbs', 18, 22, 'free', E'Proverbs 18:22 — *Whoso findeth a wife findeth a good thing, and obtaineth favour of Yahuah (LORD).* The wife as a possession begun in Sirach 36:24 is the good thing and favour from Yahuah.'),
  ('apocrypha', 'ecclesiasticus', 36, 24, 'canon', 'proverbs', 31, 10, 'free', E'Proverbs 31:10 — *Who can find a virtuous woman? for her price is far above rubies.* The pillar of rest Sirach 36:24 prizes is Proverbs'' virtuous woman, worth more than rubies.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_sir36_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_sir36_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-36-gather-the-tribes-of-jacob',
       E'Gather all the tribes of Jacob — the two-house ingathering prayer',
       E'Ben Sira''s prayer reaches its height in a plea that is pure Tanakh: *Gather all the tribes of Jacob together, and inherit you them, as from the beginning.* (Ecclesiasticus 36:11). This is no church-replacing-Israel hope but the recovery of the scattered house, the very thing Isaiah saw: *And it shall come to pass in that day, that Yahuah (Lord) shall set his hand again the second time to recover the remnant of his people, which shall be left...* (Isaiah 11:11), and *And he shall set up an ensign for the nations, and shall assemble the outcasts of Yashar''el (Israel), and gather together the dispersed of Yahudah (Judah) from the four corners of the earth.* (Isaiah 11:12). Ezekiel makes the two houses one again: *Behold, I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side, and bring them into their own land:* (Ezekiel 37:21) — *and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all:* (Ezekiel 37:22). Moses promised it before exile: *That then Yahuah Elohayka (the LORD thy God) will turn thy captivity... and will return and gather thee from all the nations, whither Yahuah Elohayka (the LORD thy God) hath scattered thee.* (Deuteronomy 30:3). Jeremiah names the Gatherer: *He that scattered Yashar''el (Israel) will gather him, and keep him, as a shepherd doth his flock.* (Jeremiah 31:10). And the restored library prays the same prayer — *Gather those together that are scattered from us, deliver them that serve among the heathen...* (2 Maccabees 1:27). It ain''t new: the deuterocanon carries the two-house gathering whole.',
       sv.verse_id, ev.verse_id, 'extras', 59175
  FROM _session253_sir36_lookup sv, _session253_sir36_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=36 AND sv.verse_number=11
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=36 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-36-no-god-but-yahuah',
       E'That the heathen may know there is no God but Yahuah — signs and wonders',
       E'Ben Sira asks that the nations be made to know the One they have ignored: *And let them know you, as we have known you, that there is no Yahuah (God) but only you, O Yahuah (God).* (Ecclesiasticus 36:5), and pleads for fresh signs — *Shew new signs, and make other strange wonders: glorify your hand and your right arm, that they may set forth your wondrous works.* (Ecclesiasticus 36:6). This is the Exodus pattern: *And the Egyptians shall know that I am Yahuah (LORD), when I stretch forth mine hand upon Egypt, and bring out the children of Yashar''el (Israel) from among them.* (Exodus 7:5). The same end crowns the gathering in Joel: *Yahuah (LORD) also shall roar out of Zion, and utter his voice from Jerusalem; and the heavens and the earth shall shake: but Yahuah (LORD) will be the hope of his people...* (Joel 3:16). And the deuterocanon prays it plainly: *...let the heathen know that you are our Elohim (God).* (2 Maccabees 1:27). The signs serve the testimony, not spectacle: that all may know there is no God but Yahuah.',
       sv.verse_id, ev.verse_id, 'extras', 59178
  FROM _session253_sir36_lookup sv, _session253_sir36_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=36 AND sv.verse_number=5
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=36 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-36-israel-my-firstborn',
       E'Israel called by his name, named his firstborn',
       E'The prayer leans on covenant election: *O Yahuah (God), have mercy upon the people that is called by your name, and upon Yashar''el (Israel), whom you have named your firstborn.* (Ecclesiasticus 36:12). The title is Moses'' own word to Pharaoh: *And thou shalt say unto Pharaoh, Thus saith Yahuah (LORD), Yashar''el (Israel) is my son, even my firstborn:* (Exodus 4:22). Jeremiah keeps the name through exile: *...for I am a father to Yashar''el (Israel), and Ephraim is my firstborn.* (Jeremiah 31:9). And the gathered houses are renamed sons of the living God: *...in the place where it was said unto them, Ye are not my people, there it shall be said unto them, Ye are the sons of the living Elohim (God).* (Hosea 1:10). Election is not abolished; the firstborn is owned and gathered. Within the restored library Wisdom herself is given the same inheritance — *Let your dwelling be in Jacob, and your inheritance in Yashar''el (Israel).* (Ecclesiasticus 24:8).',
       sv.verse_id, ev.verse_id, 'extras', 59181
  FROM _session253_sir36_lookup sv, _session253_sir36_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=36 AND sv.verse_number=12
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=36 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-36-build-up-zion-faithful-prophets',
       E'Mercy on Jerusalem, glory filling Zion, the prophets found faithful',
       E'The prayer turns to the holy city: *O be merciful to Jerusalem, your holy city, the place of your rest.* (Ecclesiasticus 36:13), then to the glory and the prophets — *Fill Sion with your unspeakable oracles, and your people with your glory:* (Ecclesiasticus 36:14), *Reward them that wait for you, and let your prophets be found faithful.* (Ecclesiasticus 36:16). Psalm 102 sings the set time for Zion: *Thou shalt arise, and have mercy upon Zion: for the time to favour her, yea, the set time, is come.* (Psalm 102:13), *When Yahuah (LORD) shall build up Zion, he shall appear in his glory.* (Psalm 102:16). Isaiah fills her with light: *Arise, shine; for thy light is come, and the glory of Yahuah (LORD) is risen upon thee.* (Isaiah 60:1). The prayer closes under Aaron''s blessing — *that all they which dwell upon the earth may know that you are Yahuah (God), the eternal Yahuah (God).* (Ecclesiasticus 36:17) — the very benediction of Numbers: *Yahuah (LORD) lift up his countenance upon thee, and give thee peace.* (Numbers 6:26). And the restored library answers: *When Yahuah (LORD) shall build up Zion...* is the regathered, rejoicing city of *Arise, O Jerusalem, and stand on high... and behold your children gathered from the west to the east...* (Baruch 5:5).',
       sv.verse_id, ev.verse_id, 'extras', 59184
  FROM _session253_sir36_lookup sv, _session253_sir36_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=36 AND sv.verse_number=13
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=36 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-36-a-wife-a-good-thing',
       E'He that getteth a wife begins a possession — a help meet, a pillar of rest',
       E'The chapter''s wisdom counsel honours the gift of a good wife: *He that getteth a wife begins a possession, a help like to himself, and a pillar of rest.* (Ecclesiasticus 36:24), and warns of the lack — *...he that has no wife will wander up and down mourning.* (Ecclesiasticus 36:25). This is Eden''s own word: *And Yahuah Elohim (the LORD God) said, It is not good that the man should be alone; I will make him an help meet for him.* (Genesis 2:18). Proverbs makes it a gift from Yahuah''s hand: *Whoso findeth a wife findeth a good thing, and obtaineth favour of Yahuah (LORD).* (Proverbs 18:22), and *Who can find a virtuous woman? for her price is far above rubies.* (Proverbs 31:10). It ain''t new: Ben Sira''s marriage wisdom is the Torah''s help meet and Proverbs'' good thing, restated.',
       sv.verse_id, ev.verse_id, 'extras', 59187
  FROM _session253_sir36_lookup sv, _session253_sir36_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=36 AND sv.verse_number=24
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=36 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ecclesiasticus-36-gather-the-tribes-of-jacob
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 11:11 — *And it shall come to pass in that day, that Yahuah (Lord) shall set his hand again the second time to recover the remnant of his people, which shall be left, from Assyria, and from Egypt, and from Pathros, and from Cush, and from Elam, and from Shinar, and from Hamath, and from the islands of the sea.* The second-time recovery of the remnant is exactly Ben Sira''s plea to gather the tribes of Jacob as from the beginning.'
  FROM cross_reference_threads t, cross_references x, _session253_sir36_lookup sv, _session253_sir36_lookup tv
 WHERE t.slug='ecclesiasticus-36-gather-the-tribes-of-jacob'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=36 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 11:12 — *And he shall set up an ensign for the nations, and shall assemble the outcasts of Yashar''el (Israel), and gather together the dispersed of Yahudah (Judah) from the four corners of the earth.* Both houses — Israel''s outcasts and Judah''s dispersed — are the tribes of Jacob Sirach 36:11 prays Yahuah will inherit again.'
  FROM cross_reference_threads t, cross_references x, _session253_sir36_lookup sv, _session253_sir36_lookup tv
 WHERE t.slug='ecclesiasticus-36-gather-the-tribes-of-jacob'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=36 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 37:21 — *And say unto them, Thus saith Adonai Yahuah (the Lord GOD); Behold, I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side, and bring them into their own land:* The gathering on every side answers Sirach 36:11''s prayer to gather all the tribes of Jacob together.'
  FROM cross_reference_threads t, cross_references x, _session253_sir36_lookup sv, _session253_sir36_lookup tv
 WHERE t.slug='ecclesiasticus-36-gather-the-tribes-of-jacob'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=36 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ezekiel 37:22 — *And I will make them one nation in the land upon the mountains of Yashar''el (Israel); and one king shall be king to them all: and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all:* The tribes of Jacob in Sirach 36:11 are gathered into one nation — the two houses divided no more.'
  FROM cross_reference_threads t, cross_references x, _session253_sir36_lookup sv, _session253_sir36_lookup tv
 WHERE t.slug='ecclesiasticus-36-gather-the-tribes-of-jacob'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=36 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Deuteronomy 30:3 — *That then Yahuah Elohayka (the LORD thy God) will turn thy captivity, and have compassion upon thee, and will return and gather thee from all the nations, whither Yahuah Elohayka (the LORD thy God) hath scattered thee.* The Torah promise of regathering from all nations is the ground of Ben Sira''s prayer in Sirach 36:11.'
  FROM cross_reference_threads t, cross_references x, _session253_sir36_lookup sv, _session253_sir36_lookup tv
 WHERE t.slug='ecclesiasticus-36-gather-the-tribes-of-jacob'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=36 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-36-no-god-but-yahuah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 7:5 — *And the Egyptians shall know that I am Yahuah (LORD), when I stretch forth mine hand upon Egypt, and bring out the children of Yashar''el (Israel) from among them.* The stretched-out hand and the heathen made to know Yahuah is exactly the new signs Sirach 36:6 prays for.'
  FROM cross_reference_threads t, cross_references x, _session253_sir36_lookup sv, _session253_sir36_lookup tv
 WHERE t.slug='ecclesiasticus-36-no-god-but-yahuah'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=36 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=7 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Joel 3:16 — *Yahuah (LORD) also shall roar out of Zion, and utter his voice from Jerusalem; and the heavens and the earth shall shake: but Yahuah (LORD) will be the hope of his people, and the strength of the children of Yashar''el (Israel).* The day Yahuah is shown to be the only God answers Sirach 36:5''s plea that the nations know there is no God but him.'
  FROM cross_reference_threads t, cross_references x, _session253_sir36_lookup sv, _session253_sir36_lookup tv
 WHERE t.slug='ecclesiasticus-36-no-god-but-yahuah'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=36 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=3 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Maccabees 1:27 — *Gather those together that are scattered from us, deliver them that serve among the heathen, look upon them that are despised and abhorred, and let the heathen know that you are our Elohim (God).* The very same restored-library prayer — gather the scattered and let the heathen know Yahuah — stands beside Sirach 36:5.'
  FROM cross_reference_threads t, cross_references x, _session253_sir36_lookup sv, _session253_sir36_lookup tv
 WHERE t.slug='ecclesiasticus-36-no-god-but-yahuah'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=36 AND sv.verse_number=5
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=1 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-36-israel-my-firstborn
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 4:22 — *And thou shalt say unto Pharaoh, Thus saith Yahuah (LORD), Yashar''el (Israel) is my son, even my firstborn:* The firstborn title Sirach 36:12 pleads is Yahuah''s own declaration over Israel at the Exodus.'
  FROM cross_reference_threads t, cross_references x, _session253_sir36_lookup sv, _session253_sir36_lookup tv
 WHERE t.slug='ecclesiasticus-36-israel-my-firstborn'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=36 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=4 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 31:9 — *They shall come with weeping, and with supplications will I lead them: I will cause them to walk by the rivers of waters in a straight way, wherein they shall not stumble: for I am a father to Yashar''el (Israel), and Ephraim is my firstborn.* Yahuah keeps the firstborn name over the gathered house, the people called by his name in Sirach 36:12.'
  FROM cross_reference_threads t, cross_references x, _session253_sir36_lookup sv, _session253_sir36_lookup tv
 WHERE t.slug='ecclesiasticus-36-israel-my-firstborn'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=36 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hosea 1:10 — *Yet the number of the children of Yashar''el (Israel) shall be as the sand of the sea, which cannot be measured nor numbered; and it shall come to pass, that in the place where it was said unto them, Ye are not my people, there it shall be said unto them, Ye are the sons of the living Elohim (God).* The people called by Yahuah''s name in Sirach 36:12 are owned again as sons of the living God.'
  FROM cross_reference_threads t, cross_references x, _session253_sir36_lookup sv, _session253_sir36_lookup tv
 WHERE t.slug='ecclesiasticus-36-israel-my-firstborn'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=36 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=1 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ecclesiasticus 24:8 — *So the Creator of all things gave me a commandment, and he that made me caused my tabernacle to rest, and said, Let your dwelling be in Jacob, and your inheritance in Yashar''el (Israel).* Wisdom''s inheritance in Israel matches the firstborn people Sirach 36:12 names as Yahuah''s own.'
  FROM cross_reference_threads t, cross_references x, _session253_sir36_lookup sv, _session253_sir36_lookup tv
 WHERE t.slug='ecclesiasticus-36-israel-my-firstborn'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=36 AND sv.verse_number=12
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=24 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-36-build-up-zion-faithful-prophets
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 102:13 — *Thou shalt arise, and have mercy upon Zion: for the time to favour her, yea, the set time, is come.* The set time to favour Zion is the mercy on Jerusalem Sirach 36:13-14 prays Yahuah to grant.'
  FROM cross_reference_threads t, cross_references x, _session253_sir36_lookup sv, _session253_sir36_lookup tv
 WHERE t.slug='ecclesiasticus-36-build-up-zion-faithful-prophets'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=36 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=102 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 102:16 — *When Yahuah (LORD) shall build up Zion, he shall appear in his glory.* Sion filled with Yahuah''s glory in Sirach 36:14 is the rebuilt Zion where he appears in his glory.'
  FROM cross_reference_threads t, cross_references x, _session253_sir36_lookup sv, _session253_sir36_lookup tv
 WHERE t.slug='ecclesiasticus-36-build-up-zion-faithful-prophets'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=36 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=102 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 60:1 — *Arise, shine; for thy light is come, and the glory of Yahuah (LORD) is risen upon thee.* The glory that fills Sion in Sirach 36:14 is Isaiah''s risen glory upon the city.'
  FROM cross_reference_threads t, cross_references x, _session253_sir36_lookup sv, _session253_sir36_lookup tv
 WHERE t.slug='ecclesiasticus-36-build-up-zion-faithful-prophets'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=36 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=60 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Numbers 6:26 — *Yahuah (LORD) lift up his countenance upon thee, and give thee peace.* Ben Sira closes the prayer with the blessing of Aaron, naming the very benediction of Numbers 6 in Sirach 36:17.'
  FROM cross_reference_threads t, cross_references x, _session253_sir36_lookup sv, _session253_sir36_lookup tv
 WHERE t.slug='ecclesiasticus-36-build-up-zion-faithful-prophets'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=36 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=6 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Baruch 5:5 — *Arise, O Jerusalem, and stand on high, and look about toward the east, and behold your children gathered from the west to the east by the word of the Holy One, rejoicing in the remembrance of Yahuah (God).* The mercy on Jerusalem in Sirach 36:13 is the regathered, rejoicing city of Baruch.'
  FROM cross_reference_threads t, cross_references x, _session253_sir36_lookup sv, _session253_sir36_lookup tv
 WHERE t.slug='ecclesiasticus-36-build-up-zion-faithful-prophets'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=36 AND sv.verse_number=13
   AND tv.edition_slug='apocrypha' AND tv.book_slug='baruch-with-the-letter-of-jeremiah' AND tv.chapter_number=5 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-36-a-wife-a-good-thing
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 2:18 — *And Yahuah Elohim (the LORD God) said, It is not good that the man should be alone; I will make him an help meet for him.* The help like to himself and pillar of rest in Sirach 36:24 is Eden''s help meet.'
  FROM cross_reference_threads t, cross_references x, _session253_sir36_lookup sv, _session253_sir36_lookup tv
 WHERE t.slug='ecclesiasticus-36-a-wife-a-good-thing'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=36 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 18:22 — *Whoso findeth a wife findeth a good thing, and obtaineth favour of Yahuah (LORD).* The wife as a possession begun in Sirach 36:24 is the good thing and favour from Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session253_sir36_lookup sv, _session253_sir36_lookup tv
 WHERE t.slug='ecclesiasticus-36-a-wife-a-good-thing'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=36 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=18 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 31:10 — *Who can find a virtuous woman? for her price is far above rubies.* The pillar of rest Sirach 36:24 prizes is Proverbs'' virtuous woman, worth more than rubies.'
  FROM cross_reference_threads t, cross_references x, _session253_sir36_lookup sv, _session253_sir36_lookup tv
 WHERE t.slug='ecclesiasticus-36-a-wife-a-good-thing'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=36 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=31 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

