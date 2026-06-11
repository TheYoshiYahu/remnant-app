-- ----- fragment: minion_jasher_08.sql (session252 jasher 8) -----
-- Source anchor: jasher/jasher ch8. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja08 (view _session252_ja08_lookup). Sort band base 55175, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja08_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-8-the-star-and-the-magi
  ('jasher', 'jasher', 8, 2, 'canon', 'matthew', 2, 2, 'free', E'Matthew 2:2 — *Saying, Where is he that is born King of the Yahudim (Jews)? for we have seen his star in the east, and are come to worship him.* The same eastern stargazers reading a King''s birth in a star that Jasher sets over Abram''s cradle.'),
  ('jasher', 'jasher', 8, 2, 'canon', 'matthew', 2, 1, 'free', E'Matthew 2:1 — *Now when Yahusha (Jesus) was born in Bethlehem of Judaea in the days of Herod the king, behold, there came wise men from the east to Jerusalem.* The wise-men-from-the-east-at-a-royal-birth motif Jasher gives Abram is carried into the Messiah''s nativity.'),
  ('jasher', 'jasher', 8, 4, 'canon', 'genesis', 12, 2, 'free', E'Genesis 12:2 — *And I will make of thee a great nation, and I will bless thee, and make thy name great; and thou shalt be a blessing.* The destiny the magi read in the star is the very covenant Yahuah would speak over Abram.'),
  ('jasher', 'jasher', 8, 2, 'jubilees', 'jubilees', 12, 16, 'extras', E'Jubilees 12:16 — *And in the sixth week, in the fifth year thereof, Abram sat up throughout the night on the new moon of the seventh month to observe the stars from the evening to the morning, in order to see what would be the character of the year with regard to the rains, and he was alone as he sat and observed.* The same star-watching Chaldean world that frames Abram''s birth in Jasher; Jubilees has Abram himself reading the heavens.'),
  -- thread: jasher-8-nimrod-seeks-the-childs-life
  ('jasher', 'jasher', 8, 16, 'canon', 'exodus', 1, 22, 'free', E'Exodus 1:22 — *And Pharaoh charged all his people, saying, Every son that is born ye shall cast into the river, and every daughter ye shall save alive.* Pharaoh''s edict against the Hebrew sons is the same kingdom-of-man move Nimrod makes against the infant Abram.'),
  ('jasher', 'jasher', 8, 13, 'canon', 'matthew', 2, 16, 'free', E'Matthew 2:16 — *Then Herod, when he saw that he was mocked of the wise men, was exceeding wroth, and sent forth, and slew all the children that were in Bethlehem, and in all the coasts thereof, from two years old and under, according to the time which he had diligently enquired of the wise men.* Herod, warned by stargazers of a King''s birth, slays the children — Nimrod''s plot against Abram replayed against the Messiah.'),
  ('jasher', 'jasher', 8, 16, 'canon', 'exodus', 1, 16, 'free', E'Exodus 1:16 — *And he said, When ye do the office of a midwife to the Hebrew women, and see them upon the stools; if it be a son, then ye shall kill him: but if it be a daughter, then she shall live.* The tyrant-king ordering the slaying of the newborn son to crush the seed — the exact menace Nimrod presses on Terah.'),
  -- thread: jasher-8-nimrod-kingdom-of-man
  ('jasher', 'jasher', 8, 32, 'canon', 'genesis', 10, 8, 'free', E'Genesis 10:8 — *And Cush begat Nimrod: he began to be a mighty one in the earth.* The canon''s own naming of the tyrant whose murderous reach over Terah''s house Jasher dramatizes.'),
  ('jasher', 'jasher', 8, 32, 'canon', 'genesis', 10, 10, 'free', E'Genesis 10:10 — *And the beginning of his kingdom was Babel, and Erech, and Accad, and Calneh, in the land of Shinar.* Babel is Nimrod''s throne; the king threatening Terah is the founder of the kingdom-of-man.'),
  ('jasher', 'jasher', 8, 32, 'canon', 'genesis', 11, 4, 'free', E'Genesis 11:4 — *And they said, Go to, let us build us a city and a tower, whose top may reach unto heaven; and let us make us a name, lest we be scattered abroad upon the face of the whole earth.* The name-making rebellion of Babel is the spirit of Nimrod''s kingdom set against the chosen seed.'),
  ('jasher', 'jasher', 8, 32, 'jubilees', 'jubilees', 11, 2, 'extras', E'Jubilees 11:2 — *And the sons of Noah began to war on each other, to take captive and to slay each other, and to shed the blood of men on the earth, and to eat blood, and to build strong cities, and walls, and towers, and individuals (began) to exalt themselves above the nation, and to found the beginnings of kingdoms, and to go to war people against people, and nation against nation, and city against city, and all (began) to do evil.* The Jubilees portrait of the kingdoms-of-man rising in Nimrod''s generation — the very throne menacing Abram''s house.'),
  -- thread: jasher-8-yahuah-preserves-the-seed
  ('jasher', 'jasher', 8, 35, 'canon', 'exodus', 2, 2, 'free', E'Exodus 2:2 — *And the woman conceived, and bare a son: and when she saw him that he was a goodly child, she hid him three months.* Moses hidden from Pharaoh''s death-edict is the canon''s same deliverer-concealed pattern as Abram hidden in the cave from Nimrod.'),
  ('jasher', 'jasher', 8, 36, 'canon', 'matthew', 2, 14, 'free', E'Matthew 2:14 — *When he arose, he took the young child and his mother by night, and departed into Egypt.* The Messiah-child taken by night and hidden from the murdering king — Yahuah preserving the seed exactly as He hides Abram from Nimrod.'),
  ('jasher', 'jasher', 8, 34, 'canon', 'exodus', 2, 24, 'free', E'Exodus 2:24 — *And Elohim (God) heard their groaning, and Elohim (God) remembered his covenant with Abraham, with Isaac, and with Jacob.* The covenant Yahuah keeps in Exodus is the very seed He shields in the cave so Nimrod cannot end it before Abraham.'),
  -- thread: jasher-8-terah-the-idolater-father
  ('jasher', 'jasher', 8, 28, 'canon', 'joshua', 24, 2, 'free', E'Joshua 24:2 — *And Joshua said unto all the people, Thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel), Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods.* The canon confirms Jasher''s Terah — Nimrod''s idol-serving prince — as the house out of which Yahuah calls the chosen seed.'),
  ('jasher', 'jasher', 8, 28, 'jubilees', 'jubilees', 12, 2, 'extras', E'Jubilees 12:2 — *Worship the Elohim (God) of heaven, Who causes the rain and the dew to descend on the earth, And does everything upon the earth... Why do you worship things that have no spirit in them?* Jubilees gives the same father — an idolater Abram must rebuke — that Jasher shows bargaining with Nimrod.'),
  ('jasher', 'jasher', 8, 31, 'jubilees', 'jubilees', 12, 7, 'extras', E'Jubilees 12:7 — *And if I tell them the truth, they will slay me; for their soul cleaves to them to worship them and honour them. Keep silent, my son, lest they slay you.* Terah''s fear of the people matches Jasher''s Terah trembling before Nimrod''s threat over his household.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja08_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja08_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-8-the-star-and-the-magi',
       E'The star that swallowed four stars — the magi read a King''s birth',
       E'On the night Abram is born the wise men and conjurors of Nimrod *lifted up their eyes toward heaven that night to look at the stars, and they saw, and behold one very large star came from the east and ran in the heavens, and he swallowed up the four stars from the four sides of the heavens* (Jasher 8:2), and they read in it a child *who will grow up and be fruitful, and multiply, and possess all the earth, he and his children for ever* (Jasher 8:4). It ain''t new: the canon already knows this scene with the roles inverted toward the Seed of Abram. *Now when Yahusha (Jesus) was born in Bethlehem of Judaea in the days of Herod the king, behold, there came wise men from the east to Jerusalem* (Matthew 2:1) — eastern stargazers reading a royal birth in the heavens — *Saying, Where is he that is born King of the Yahudim (Jews)? for we have seen his star in the east, and are come to worship him* (Matthew 2:2). The covenant promise the star encodes is Genesis 12: *And I will make of thee a great nation, and I will bless thee, and make thy name great; and thou shalt be a blessing* (Genesis 12:2). Jubilees keeps the same astronomy-watching father-line, for Abram too *sat up throughout the night on the new moon of the seventh month to observe the stars from the evening to the morning* (Jubilees 12:16) — the heavens declaring the chosen seed.',
       sv.verse_id, ev.verse_id, 'extras', 55175
  FROM _session252_ja08_lookup sv, _session252_ja08_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=8 AND sv.verse_number=2
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=8 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-8-nimrod-seeks-the-childs-life',
       E'Nimrod demands the child be slain — the tyrant against the seed',
       E'Hearing the omen, Nimrod''s counsel is murder: *give me the child, that we may slay him before his evil springs up against us, and I will give you for his value, your house full of silver and gold* (Jasher 8:16). The kingdom-of-man moves to kill the chosen seed in the cradle — the antichrist pattern the canon repeats twice over. Pharaoh first: *And Pharaoh charged all his people, saying, Every son that is born ye shall cast into the river, and every daughter ye shall save alive* (Exodus 1:22), the tyrant slaying the Hebrew sons to choke the covenant nation. Then Herod, the wise men''s star turned against the child: *Then Herod, when he saw that he was mocked of the wise men, was exceeding wroth, and sent forth, and slew all the children that were in Bethlehem, and in all the coasts thereof, from two years old and under, according to the time which he had diligently enquired of the wise men* (Matthew 2:16). Nimrod, Pharaoh, Herod — one rebel kingdom-of-man across the ages, and each time the child it hunts is the one *whose top may reach unto heaven* in Yahuah''s purpose, not in Babel''s (Genesis 11:4). The tyrant strikes; the seed is preserved.',
       sv.verse_id, ev.verse_id, 'extras', 55178
  FROM _session252_ja08_lookup sv, _session252_ja08_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=8 AND sv.verse_number=13
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=8 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-8-nimrod-kingdom-of-man',
       E'Nimrod the rebel king — Babel''s builder against the chosen line',
       E'The whole scene turns on who Nimrod is: the king whose conjurors fear a rival, who buys infants for slaughter, the tyrant whose word is *should you not do this, I will send and slay all you have in your house, so that you shall not even have a dog remaining* (Jasher 8:32). The canon names him exactly — the first kingdom-of-man. *And Cush begat Nimrod: he began to be a mighty one in the earth* (Genesis 10:8), *And the beginning of his kingdom was Babel, and Erech, and Accad, and Calneh, in the land of Shinar* (Genesis 10:10): Babel is his throne. And Babel''s spirit is the name-making rebellion: *And they said, Go to, let us build us a city and a tower, whose top may reach unto heaven; and let us make us a name, lest we be scattered abroad upon the face of the whole earth* (Genesis 11:4). Jubilees frames the same hour — the rise of the kingdoms of man out of Noah''s sons: *individuals (began) to exalt themselves above the nation, and to found the beginnings of kingdoms, and to go to war people against people* (Jubilees 11:2). Nimrod is that exaltation made flesh, and the seed of Abram is the line Yahuah sets against it.',
       sv.verse_id, ev.verse_id, 'extras', 55181
  FROM _session252_ja08_lookup sv, _session252_ja08_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=8 AND sv.verse_number=32
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=8 AND ev.verse_number=34
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-8-yahuah-preserves-the-seed',
       E'Yahuah was with Terah — the chosen seed hidden and kept',
       E'The tyrant''s edict fails because election precedes everything: *And Yahuah (the Lord) was with Terah in this matter, that Nimrod might not cause Abram''s death... and this was concealed from him from that day... as it was the will of Providence not to suffer Abram''s death* (Jasher 8:34), and Abram is hidden in a cave where *Yahuah (the Lord) was with Abram in the cave and he grew up* (Jasher 8:36). The canon already keeps a hunted deliverer this exact way: *And the woman conceived, and bare a son: and when she saw him that he was a goodly child, she hid him three months* (Exodus 2:2). And the Messiah-child is hidden from the murdering king by the same hand: *When he arose, he took the young child and his mother by night, and departed into Egypt: And was there until the death of Herod* (Matthew 2:14-15). It ain''t new — Yahuah conceals and preserves the chosen seed under the tyrant''s nose, from Abram to Moses to the Messiah. The hiding is not retreat but election kept.',
       sv.verse_id, ev.verse_id, 'extras', 55184
  FROM _session252_ja08_lookup sv, _session252_ja08_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=8 AND sv.verse_number=34
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=8 AND ev.verse_number=36
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-8-terah-the-idolater-father',
       E'Terah before the king — the idol-serving father of the called seed',
       E'Jasher shows Terah as Nimrod''s man, *the prince of your host* (Jasher 8:9), bargaining with the tyrant and at last yielding *yea, even my son, he is in the king''s power* (Jasher 8:28) — the idolater father out of whom Yahuah will call the seed. The canon never hides this: *Thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel), Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods* (Joshua 24:2). Election runs through, not around, an idol-serving house. Jubilees presses the same point — Abram confronting his father: *Worship the Elohim (God) of heaven, Who causes the rain and the dew to descend on the earth... Why do you worship things that have no spirit in them?* (Jubilees 12:2), to which Terah answers that he serves idols only for fear of the people who *will slay me* (Jubilees 12:7). Out of that compromised house Yahuah takes Abram — election precedes the confession.',
       sv.verse_id, ev.verse_id, 'extras', 55187
  FROM _session252_ja08_lookup sv, _session252_ja08_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=8 AND sv.verse_number=28
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=8 AND ev.verse_number=31
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-8-the-star-and-the-magi
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 2:2 — *Saying, Where is he that is born King of the Yahudim (Jews)? for we have seen his star in the east, and are come to worship him.* The same eastern stargazers reading a King''s birth in a star that Jasher sets over Abram''s cradle.'
  FROM cross_reference_threads t, cross_references x, _session252_ja08_lookup sv, _session252_ja08_lookup tv
 WHERE t.slug='jasher-8-the-star-and-the-magi'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=8 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=2 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 2:1 — *Now when Yahusha (Jesus) was born in Bethlehem of Judaea in the days of Herod the king, behold, there came wise men from the east to Jerusalem.* The wise-men-from-the-east-at-a-royal-birth motif Jasher gives Abram is carried into the Messiah''s nativity.'
  FROM cross_reference_threads t, cross_references x, _session252_ja08_lookup sv, _session252_ja08_lookup tv
 WHERE t.slug='jasher-8-the-star-and-the-magi'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=8 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=2 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 12:2 — *And I will make of thee a great nation, and I will bless thee, and make thy name great; and thou shalt be a blessing.* The destiny the magi read in the star is the very covenant Yahuah would speak over Abram.'
  FROM cross_reference_threads t, cross_references x, _session252_ja08_lookup sv, _session252_ja08_lookup tv
 WHERE t.slug='jasher-8-the-star-and-the-magi'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=8 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 12:16 — *And in the sixth week, in the fifth year thereof, Abram sat up throughout the night on the new moon of the seventh month to observe the stars from the evening to the morning, in order to see what would be the character of the year with regard to the rains, and he was alone as he sat and observed.* The same star-watching Chaldean world that frames Abram''s birth in Jasher; Jubilees has Abram himself reading the heavens.'
  FROM cross_reference_threads t, cross_references x, _session252_ja08_lookup sv, _session252_ja08_lookup tv
 WHERE t.slug='jasher-8-the-star-and-the-magi'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=8 AND sv.verse_number=2
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=12 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-8-nimrod-seeks-the-childs-life
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 1:22 — *And Pharaoh charged all his people, saying, Every son that is born ye shall cast into the river, and every daughter ye shall save alive.* Pharaoh''s edict against the Hebrew sons is the same kingdom-of-man move Nimrod makes against the infant Abram.'
  FROM cross_reference_threads t, cross_references x, _session252_ja08_lookup sv, _session252_ja08_lookup tv
 WHERE t.slug='jasher-8-nimrod-seeks-the-childs-life'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=8 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 2:16 — *Then Herod, when he saw that he was mocked of the wise men, was exceeding wroth, and sent forth, and slew all the children that were in Bethlehem, and in all the coasts thereof, from two years old and under, according to the time which he had diligently enquired of the wise men.* Herod, warned by stargazers of a King''s birth, slays the children — Nimrod''s plot against Abram replayed against the Messiah.'
  FROM cross_reference_threads t, cross_references x, _session252_ja08_lookup sv, _session252_ja08_lookup tv
 WHERE t.slug='jasher-8-nimrod-seeks-the-childs-life'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=8 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=2 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 1:16 — *And he said, When ye do the office of a midwife to the Hebrew women, and see them upon the stools; if it be a son, then ye shall kill him: but if it be a daughter, then she shall live.* The tyrant-king ordering the slaying of the newborn son to crush the seed — the exact menace Nimrod presses on Terah.'
  FROM cross_reference_threads t, cross_references x, _session252_ja08_lookup sv, _session252_ja08_lookup tv
 WHERE t.slug='jasher-8-nimrod-seeks-the-childs-life'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=8 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-8-nimrod-kingdom-of-man
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 10:8 — *And Cush begat Nimrod: he began to be a mighty one in the earth.* The canon''s own naming of the tyrant whose murderous reach over Terah''s house Jasher dramatizes.'
  FROM cross_reference_threads t, cross_references x, _session252_ja08_lookup sv, _session252_ja08_lookup tv
 WHERE t.slug='jasher-8-nimrod-kingdom-of-man'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=8 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 10:10 — *And the beginning of his kingdom was Babel, and Erech, and Accad, and Calneh, in the land of Shinar.* Babel is Nimrod''s throne; the king threatening Terah is the founder of the kingdom-of-man.'
  FROM cross_reference_threads t, cross_references x, _session252_ja08_lookup sv, _session252_ja08_lookup tv
 WHERE t.slug='jasher-8-nimrod-kingdom-of-man'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=8 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 11:4 — *And they said, Go to, let us build us a city and a tower, whose top may reach unto heaven; and let us make us a name, lest we be scattered abroad upon the face of the whole earth.* The name-making rebellion of Babel is the spirit of Nimrod''s kingdom set against the chosen seed.'
  FROM cross_reference_threads t, cross_references x, _session252_ja08_lookup sv, _session252_ja08_lookup tv
 WHERE t.slug='jasher-8-nimrod-kingdom-of-man'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=8 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=11 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 11:2 — *And the sons of Noah began to war on each other, to take captive and to slay each other, and to shed the blood of men on the earth, and to eat blood, and to build strong cities, and walls, and towers, and individuals (began) to exalt themselves above the nation, and to found the beginnings of kingdoms, and to go to war people against people, and nation against nation, and city against city, and all (began) to do evil.* The Jubilees portrait of the kingdoms-of-man rising in Nimrod''s generation — the very throne menacing Abram''s house.'
  FROM cross_reference_threads t, cross_references x, _session252_ja08_lookup sv, _session252_ja08_lookup tv
 WHERE t.slug='jasher-8-nimrod-kingdom-of-man'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=8 AND sv.verse_number=32
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=11 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-8-yahuah-preserves-the-seed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 2:2 — *And the woman conceived, and bare a son: and when she saw him that he was a goodly child, she hid him three months.* Moses hidden from Pharaoh''s death-edict is the canon''s same deliverer-concealed pattern as Abram hidden in the cave from Nimrod.'
  FROM cross_reference_threads t, cross_references x, _session252_ja08_lookup sv, _session252_ja08_lookup tv
 WHERE t.slug='jasher-8-yahuah-preserves-the-seed'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=8 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=2 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 2:14 — *When he arose, he took the young child and his mother by night, and departed into Egypt.* The Messiah-child taken by night and hidden from the murdering king — Yahuah preserving the seed exactly as He hides Abram from Nimrod.'
  FROM cross_reference_threads t, cross_references x, _session252_ja08_lookup sv, _session252_ja08_lookup tv
 WHERE t.slug='jasher-8-yahuah-preserves-the-seed'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=8 AND sv.verse_number=36
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=2 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 2:24 — *And Elohim (God) heard their groaning, and Elohim (God) remembered his covenant with Abraham, with Isaac, and with Jacob.* The covenant Yahuah keeps in Exodus is the very seed He shields in the cave so Nimrod cannot end it before Abraham.'
  FROM cross_reference_threads t, cross_references x, _session252_ja08_lookup sv, _session252_ja08_lookup tv
 WHERE t.slug='jasher-8-yahuah-preserves-the-seed'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=8 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=2 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-8-terah-the-idolater-father
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joshua 24:2 — *And Joshua said unto all the people, Thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel), Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods.* The canon confirms Jasher''s Terah — Nimrod''s idol-serving prince — as the house out of which Yahuah calls the chosen seed.'
  FROM cross_reference_threads t, cross_references x, _session252_ja08_lookup sv, _session252_ja08_lookup tv
 WHERE t.slug='jasher-8-terah-the-idolater-father'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=8 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=24 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jubilees 12:2 — *Worship the Elohim (God) of heaven, Who causes the rain and the dew to descend on the earth, And does everything upon the earth... Why do you worship things that have no spirit in them?* Jubilees gives the same father — an idolater Abram must rebuke — that Jasher shows bargaining with Nimrod.'
  FROM cross_reference_threads t, cross_references x, _session252_ja08_lookup sv, _session252_ja08_lookup tv
 WHERE t.slug='jasher-8-terah-the-idolater-father'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=8 AND sv.verse_number=28
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 12:7 — *And if I tell them the truth, they will slay me; for their soul cleaves to them to worship them and honour them. Keep silent, my son, lest they slay you.* Terah''s fear of the people matches Jasher''s Terah trembling before Nimrod''s threat over his household.'
  FROM cross_reference_threads t, cross_references x, _session252_ja08_lookup sv, _session252_ja08_lookup tv
 WHERE t.slug='jasher-8-terah-the-idolater-father'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=8 AND sv.verse_number=31
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=12 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

