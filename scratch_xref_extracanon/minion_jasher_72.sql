-- ----- fragment: minion_jasher_72.sql (session252 jasher 72) -----
-- Source anchor: jasher/jasher ch72. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja72 (view _session252_ja72_lookup). Sort band base 56775, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja72_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-72-moses-flees-egypt
  ('jasher', 'jasher', 72, 21, 'canon', 'exodus', 2, 12, 'free', E'Exodus 2:12 — *And he looked this way and that way, and when he saw that there was no man, he slew the Egyptian, and hid him in the sand.* The slaying for which Pharaoh sought Moses'' life in Jasher 72:21 is the canon scene Jasher''s war-flight expands.'),
  ('jasher', 'jasher', 72, 21, 'canon', 'exodus', 2, 15, 'free', E'Exodus 2:15 — *Now when Pharaoh heard this thing, he sought to slay Moses. But Moses fled from the face of Pharaoh, and dwelt in the land of Midian: and he sat down by a well.* Exodus, like Jasher 72:21-22, has Pharaoh seek Moses'' life and Moses flee Egypt''s presence.'),
  ('jasher', 'jasher', 72, 22, 'canon', 'acts', 7, 24, 'free', E'Acts 7:24 — *And seeing one of them suffer wrong, he defended him, and avenged him that was oppressed, and smote the Egyptian:* Stephen names the very deed behind Moses'' flight in Jasher 72:22.'),
  ('jasher', 'jasher', 72, 22, 'canon', 'acts', 7, 29, 'free', E'Acts 7:29 — *Then fled Moses at this saying, and was a stranger in the land of Madian, where he begat two sons.* The flight from Egypt in Jasher 72:22 is the same flight Acts records, ending in Midian.'),
  ('jasher', 'jasher', 72, 22, 'canon', 'hebrews', 11, 27, 'free', E'Hebrews 11:27 — *By faith he forsook Egypt, not fearing the wrath of the king: for he endured, as seeing him who is invisible.* Hebrews reads Moses'' flight in Jasher 72:22 as faith forsaking Pharaoh''s kingdom, the deliverer preserved.'),
  ('jasher', 'jasher', 72, 21, 'jubilees', 'jubilees', 47, 10, 'extras', E'Jubilees 47:10 — *And you were three weeks of years at court until the time when you did go forth from the royal court and did see an Egyptian smiting your friend who was of the children of Yashar''el (Israel), and you did slay him and hide him in the sand.* The Jubilees apparatus retells the same slaying that drives Moses'' flight in Jasher 72:21.'),
  ('jasher', 'jasher', 72, 22, 'jubilees', 'jubilees', 48, 1, 'extras', E'Jubilees 48:1 — *And in the sixth year of the third week of the forty-ninth jubilee you did depart and dwell in the land of Midian five weeks and one year. And you did return into Egypt in the second week in the second year in the fiftieth jubilee.* Jubilees has Moses depart to Midian where Jasher 72:22 has him flee Egypt — the same exile.'),
  -- thread: jasher-72-balaam-son-of-beor
  ('jasher', 'jasher', 72, 6, 'canon', 'numbers', 22, 5, 'free', E'Numbers 22:5 — *He sent messengers therefore unto Balaam the son of Beor to Pethor, which is by the river of the land of the children of his people, to call him, saying, Behold, there is a people come out from Egypt: behold, they cover the face of the earth, and they abide over against me:* The canon names the same Balaam the son of Beor that Jasher 72:6 makes a sorcerer-king of Cush.'),
  ('jasher', 'jasher', 72, 6, 'canon', '2-peter', 2, 15, 'free', E'2 Peter 2:15 — *Which have forsaken the right way, and are gone astray, following the way of Balaam the son of Bosor, who loved the wages of unrighteousness;* Peter''s way of Balaam fits the treacherous self-exalting Balaam of Jasher 72:6 who seizes a throne by revolt.'),
  ('jasher', 'jasher', 72, 6, 'canon', 'jude', 1, 11, 'free', E'Jude 11 — *Woe unto them! for they have gone in the way of Cain, and ran greedily after the error of Balaam for reward, and perished in the gainsaying of Core.* Jude''s error of Balaam matches the grasping rebel of Jasher 72:6.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja72_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja72_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-72-moses-flees-egypt',
       E'Moses flees Egypt for the slain Egyptian — by faith he forsook the king',
       E'Jasher cuts away from the legendary Cushite war to fix a single canon hinge: *At that time that the war and the siege were against Cush, Moses fled from Egypt from Pharaoh who sought to kill him for having slain the Egyptian* (Jasher 72:21), and *Moses was eighteen years old when he fled from Egypt from the presence of Pharaoh, and he fled and escaped to the camp of Kikianus, which at that time was besieging Cush* (Jasher 72:22). The flight is canon; the Cushite kingship that follows is Jasher''s own legendary expansion — but the SCENE Jasher is expanding stands written in Exodus, where Moses *spied an Egyptian smiting an Hebrew, one of his brethren* and *slew the Egyptian, and hid him in the sand* (Exodus 2:11-12), and then *when Pharaoh heard this thing, he sought to slay Moses. But Moses fled from the face of Pharaoh, and dwelt in the land of Midian* (Exodus 2:15). Stephen tells it the same: Moses, *seeing one of them suffer wrong, he defended him, and avenged him that was oppressed, and smote the Egyptian* (Acts 7:24), and *Then fled Moses at this saying, and was a stranger in the land of Madian* (Acts 7:29). Hebrews reads the flight not as cowardice but as faith refusing the kingdom-of-man: *By faith he forsook Egypt, not fearing the wrath of the king: for he endured, as seeing him who is invisible* (Hebrews 11:27) — the deliverer preserved out of Pharaoh''s hand, the same pattern as the child kept from Nimrod and from Herod. Jubilees carries the identical scene: *you did see an Egyptian smiting your friend who was of the children of Yashar''el (Israel), and you did slay him and hide him in the sand* (Jubilees 47:10), and afterward *you did depart and dwell in the land of Midian five weeks and one year* (Jubilees 48:1). It ain''t new — three witnesses and two extra-canon retellings stand behind Jasher''s one verse.',
       sv.verse_id, ev.verse_id, 'extras', 56775
  FROM _session252_ja72_lookup sv, _session252_ja72_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=72 AND sv.verse_number=21
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=72 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-72-balaam-son-of-beor',
       E'Balaam the son of Beor — the way of Balaam, named before Numbers',
       E'Jasher leaves Balaam to guard Cush — *And when Kikianus went out, he left Balaam the magician, with his two sons, to guard the city, and the lowest sort of the people of the land* (Jasher 72:3) — and Balaam seizes the throne by treachery: *And Balaam the son of Beor, when the king of Cush had left him to guard the city and the poor of the city, he rose up and advised with the people of the land to rebel against king Kikianus, not to let him enter the city when he should come home* (Jasher 72:6). Jasher''s portrait of Balaam as a Cushite sorcerer-king is its own legendary expansion, but the name is the canon''s name: *Balaam the son of Beor* (Jasher 72:6) is the very diviner Balak hires in Numbers, where *He sent messengers therefore unto Balaam the son of Beor to Pethor, which is by the river of the land of the children of his people, to call him* (Numbers 22:5). The apostles make him the type of the hireling who trades the right way for reward — *Which have forsaken the right way, and are gone astray, following the way of Balaam the son of Bosor, who loved the wages of unrighteousness* (2 Peter 2:15) — and *Woe unto them! for they have gone in the way of Cain, and ran greedily after the error of Balaam for reward, and perished in the gainsaying of Core* (Jude 11). Here in Jasher he is already the magician who grasps a kingdom not his own by enchantment and revolt — the way of Balaam read backward into Cush. The fidelity caution holds: this is genuinely *Balaam the son of Beor*, not a homonym, so the canonical Balaam thread is honestly anchored, even where the surrounding Cushite war is pure legend.',
       sv.verse_id, ev.verse_id, 'extras', 56778
  FROM _session252_ja72_lookup sv, _session252_ja72_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=72 AND sv.verse_number=3
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=72 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-72-moses-flees-egypt
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 2:12 — *And he looked this way and that way, and when he saw that there was no man, he slew the Egyptian, and hid him in the sand.* The slaying for which Pharaoh sought Moses'' life in Jasher 72:21 is the canon scene Jasher''s war-flight expands.'
  FROM cross_reference_threads t, cross_references x, _session252_ja72_lookup sv, _session252_ja72_lookup tv
 WHERE t.slug='jasher-72-moses-flees-egypt'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=72 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=2 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 2:15 — *Now when Pharaoh heard this thing, he sought to slay Moses. But Moses fled from the face of Pharaoh, and dwelt in the land of Midian: and he sat down by a well.* Exodus, like Jasher 72:21-22, has Pharaoh seek Moses'' life and Moses flee Egypt''s presence.'
  FROM cross_reference_threads t, cross_references x, _session252_ja72_lookup sv, _session252_ja72_lookup tv
 WHERE t.slug='jasher-72-moses-flees-egypt'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=72 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=2 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 7:24 — *And seeing one of them suffer wrong, he defended him, and avenged him that was oppressed, and smote the Egyptian:* Stephen names the very deed behind Moses'' flight in Jasher 72:22.'
  FROM cross_reference_threads t, cross_references x, _session252_ja72_lookup sv, _session252_ja72_lookup tv
 WHERE t.slug='jasher-72-moses-flees-egypt'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=72 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Acts 7:29 — *Then fled Moses at this saying, and was a stranger in the land of Madian, where he begat two sons.* The flight from Egypt in Jasher 72:22 is the same flight Acts records, ending in Midian.'
  FROM cross_reference_threads t, cross_references x, _session252_ja72_lookup sv, _session252_ja72_lookup tv
 WHERE t.slug='jasher-72-moses-flees-egypt'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=72 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Hebrews 11:27 — *By faith he forsook Egypt, not fearing the wrath of the king: for he endured, as seeing him who is invisible.* Hebrews reads Moses'' flight in Jasher 72:22 as faith forsaking Pharaoh''s kingdom, the deliverer preserved.'
  FROM cross_reference_threads t, cross_references x, _session252_ja72_lookup sv, _session252_ja72_lookup tv
 WHERE t.slug='jasher-72-moses-flees-egypt'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=72 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Jubilees 47:10 — *And you were three weeks of years at court until the time when you did go forth from the royal court and did see an Egyptian smiting your friend who was of the children of Yashar''el (Israel), and you did slay him and hide him in the sand.* The Jubilees apparatus retells the same slaying that drives Moses'' flight in Jasher 72:21.'
  FROM cross_reference_threads t, cross_references x, _session252_ja72_lookup sv, _session252_ja72_lookup tv
 WHERE t.slug='jasher-72-moses-flees-egypt'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=72 AND sv.verse_number=21
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=47 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Jubilees 48:1 — *And in the sixth year of the third week of the forty-ninth jubilee you did depart and dwell in the land of Midian five weeks and one year. And you did return into Egypt in the second week in the second year in the fiftieth jubilee.* Jubilees has Moses depart to Midian where Jasher 72:22 has him flee Egypt — the same exile.'
  FROM cross_reference_threads t, cross_references x, _session252_ja72_lookup sv, _session252_ja72_lookup tv
 WHERE t.slug='jasher-72-moses-flees-egypt'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=72 AND sv.verse_number=22
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=48 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-72-balaam-son-of-beor
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 22:5 — *He sent messengers therefore unto Balaam the son of Beor to Pethor, which is by the river of the land of the children of his people, to call him, saying, Behold, there is a people come out from Egypt: behold, they cover the face of the earth, and they abide over against me:* The canon names the same Balaam the son of Beor that Jasher 72:6 makes a sorcerer-king of Cush.'
  FROM cross_reference_threads t, cross_references x, _session252_ja72_lookup sv, _session252_ja72_lookup tv
 WHERE t.slug='jasher-72-balaam-son-of-beor'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=72 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=22 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Peter 2:15 — *Which have forsaken the right way, and are gone astray, following the way of Balaam the son of Bosor, who loved the wages of unrighteousness;* Peter''s way of Balaam fits the treacherous self-exalting Balaam of Jasher 72:6 who seizes a throne by revolt.'
  FROM cross_reference_threads t, cross_references x, _session252_ja72_lookup sv, _session252_ja72_lookup tv
 WHERE t.slug='jasher-72-balaam-son-of-beor'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=72 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jude 11 — *Woe unto them! for they have gone in the way of Cain, and ran greedily after the error of Balaam for reward, and perished in the gainsaying of Core.* Jude''s error of Balaam matches the grasping rebel of Jasher 72:6.'
  FROM cross_reference_threads t, cross_references x, _session252_ja72_lookup sv, _session252_ja72_lookup tv
 WHERE t.slug='jasher-72-balaam-son-of-beor'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=72 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

