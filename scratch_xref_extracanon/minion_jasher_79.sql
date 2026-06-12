-- ----- fragment: minion_jasher_79.sql (session252 jasher 79) -----
-- Source anchor: jasher/jasher ch79. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja79 (view _session252_ja79_lookup). Sort band base 56950, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja79_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-79-burning-bush-the-call
  ('jasher', 'jasher', 79, 3, 'canon', 'exodus', 3, 2, 'free', E'Exodus 3:2 — *And the angel of Yahuah (LORD) appeared unto him in a flame of fire out of the midst of a bush: and he looked, and, behold, the bush burned with fire, and the bush was not consumed.* The canon scene Jasher 79:3 retells — the bush burns yet the fire has no power to consume it.'),
  ('jasher', 'jasher', 79, 4, 'canon', 'exodus', 3, 6, 'free', E'Exodus 3:6 — *Moreover he said, I am the Elohim (God) of thy father, the Elohim (God) of Abraham, the Elohim (God) of Isaac, and the Elohim (God) of Jacob. And Moses hid his face; for he was afraid to look upon Elohim (God).* The One who calls Moses out of the fire in Jasher 79:4 is the covenant Elohim of the fathers, not a new god.'),
  ('jasher', 'jasher', 79, 4, 'canon', 'acts', 7, 30, 'free', E'Acts 7:30 — *And when forty years were expired, there appeared to him in the wilderness of mount Sina an angel of Yahuah (Lord) in a flame of fire in a bush.* Stephen recounts the same Horeb fire and commission to Egypt that Jasher 79:4 narrates.'),
  ('jasher', 'jasher', 79, 5, 'canon', 'acts', 7, 34, 'free', E'Acts 7:34 — *I have seen, I have seen the affliction of my people which is in Egypt, and I have heard their groaning, and am come down to deliver them. And now come, I will send thee into Egypt.* The word that returns Moses to Egypt in Jasher 79:5 is the I AM come down to deliver the chosen people.'),
  ('jasher', 'jasher', 79, 6, 'canon', 'exodus', 3, 20, 'free', E'Exodus 3:20 — *And I will stretch out my hand, and smite Egypt with all my wonders which I will do in the midst thereof: and after that he will let you go.* The signs and wonders Yahuah shows Moses in Jasher 79:6 are the wonders by which Egypt will be smitten and the seed set free.'),
  -- thread: jasher-79-angel-at-the-inn-circumcision
  ('jasher', 'jasher', 79, 8, 'canon', 'exodus', 4, 24, 'free', E'Exodus 4:24 — *And it came to pass by the way in the inn, that Yahuah (LORD) met him, and sought to kill him.* The terse canon verse that Jasher 79:8 unfolds — the angel meeting Moses at the inn to take his life.'),
  ('jasher', 'jasher', 79, 12, 'canon', 'exodus', 4, 25, 'free', E'Exodus 4:25 — *Then Zipporah took a sharp stone, and cut off the foreskin of her son, and cast it at his feet, and said, Surely a bloody husband art thou to me.* Zipporah''s sharp-rock circumcision in Jasher 79:12 is the canon act that delivers husband and son from the angel.'),
  ('jasher', 'jasher', 79, 9, 'canon', 'genesis', 17, 14, 'free', E'Genesis 17:14 — *And the uncircumcised man child whose flesh of his foreskin is not circumcised, that soul shall be cut off from his people; he hath broken my covenant.* The covenant of Abraham that Jasher 79:9 says Moses transgressed by leaving Gershom uncircumcised.'),
  ('jasher', 'jasher', 79, 8, 'jubilees', 'jubilees', 48, 2, 'extras', E'Jubilees 48:2 — *And you yourself know what He spake to you on Mount Sinai, and what prince Mastêmâ desired to do with you when you were returning into Egypt on the way when you did meet him at the lodging-place.* Jubilees names the very lodging-place attack of Jasher 79:8 as the work of Mastêmâ against the returning deliverer.'),
  ('jasher', 'jasher', 79, 12, 'jubilees', 'jubilees', 48, 3, 'extras', E'Jubilees 48:3 — *Did he not with all his power seek to slay you and deliver the Egyptians out of your hand when he saw that you were sent to execute judgment and vengeance on the Egyptians?* The deliverance from the inn-angel in Jasher 79:12 is Jubilees'' account of Moses rescued from the one who sought to slay him.'),
  -- thread: jasher-79-aaron-meets-moses
  ('jasher', 'jasher', 79, 14, 'canon', 'exodus', 4, 27, 'free', E'Exodus 4:27 — *And Yahuah (LORD) said to Aaron, Go into the wilderness to meet Moses. And he went, and met him in the mount of Elohim (God), and kissed him.* The very meeting at the mountain of Elohim that Jasher 79:14 narrates, kiss and all.'),
  ('jasher', 'jasher', 79, 19, 'canon', 'exodus', 4, 28, 'free', E'Exodus 4:28 — *And Moses told Aaron all the words of Yahuah (LORD) who had sent him, and all the signs which he had commanded him.* The words of Yahuah that Moses and Aaron speak to Israel in Jasher 79:19 are the words and signs Moses received at the bush.'),
  ('jasher', 'jasher', 79, 19, 'canon', 'exodus', 4, 31, 'free', E'Exodus 4:31 — *And the people believed: and when they heard that Yahuah (LORD) had visited the children of Yashar''el (Israel), and that he had looked upon their affliction, then they bowed their heads and worshipped.* The exceeding great rejoicing of the people in Jasher 79:19 is the canon''s believing, head-bowed worship of the chosen nation.'),
  -- thread: jasher-79-rod-and-serpent-sign
  ('jasher', 'jasher', 79, 36, 'canon', 'exodus', 7, 10, 'free', E'Exodus 7:10 — *And Moses and Aaron went in unto Pharaoh, and they did so as Yahuah (LORD) had commanded: and Aaron cast down his rod before Pharaoh, and before his servants, and it became a serpent.* The exact rod-into-serpent sign Aaron performs before Pharaoh in Jasher 79:36.'),
  ('jasher', 'jasher', 79, 42, 'canon', 'exodus', 7, 12, 'free', E'Exodus 7:12 — *For they cast down every man his rod, and they became serpents: but Aaron’s rod swallowed up their rods.* The swallowing of the sorcerers'' rods in Jasher 79:42 is the canon''s own verdict — the counterfeit is consumed.'),
  ('jasher', 'jasher', 79, 36, 'canon', 'exodus', 4, 3, 'free', E'Exodus 4:3 — *And he said, Cast it on the ground. And he cast it on the ground, and it became a serpent; and Moses fled from before it.* The rod of Elohim wielded in Jasher 79:36 is the same staff first turned serpent before Moses at Horeb.'),
  ('jasher', 'jasher', 79, 37, 'jubilees', 'jubilees', 48, 9, 'extras', E'Jubilees 48:9 — *And the prince of the Mastêmâ stood up against you, and sought to cast you into the hands of Pharaoh, and he helped the Egyptian sorcerers, and they stood up and wrought before you.* The sorcerers who cast their rods in Jasher 79:37 are, in Jubilees, helped by Mastêmâ to work before Moses.'),
  -- thread: jasher-79-who-is-yahuah-let-my-people-go
  ('jasher', 'jasher', 79, 46, 'canon', 'exodus', 5, 2, 'free', E'Exodus 5:2 — *And Pharaoh said, Who is Yahuah (LORD), that I should obey his voice to let Yashar''el (Israel) go? I know not Yahuah (LORD), neither will I let Yashar''el (Israel) go.* Pharaoh''s ''I know not Yahuah'' in Jasher 79:46 is the canon''s defining refusal of the I AM.'),
  ('jasher', 'jasher', 79, 25, 'canon', 'exodus', 5, 1, 'free', E'Exodus 5:1 — *And afterward Moses and Aaron went in, and told Pharaoh, Thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel), Let my people go, that they may hold a feast unto me in the wilderness.* The ''send forth my people that they may serve me'' of Jasher 79:25 is Exodus'' own demand to let the nation go and keep the feast.'),
  ('jasher', 'jasher', 79, 48, 'canon', 'exodus', 5, 3, 'free', E'Exodus 5:3 — *And they said, The Elohim (God) of the Hebrews hath met with us: let us go, we pray thee, three days’ journey into the desert, and sacrifice unto Yahuah Eloheinu (the LORD our God); lest he fall upon us with pestilence, or with the sword.* The three-days'' journey to sacrifice in Jasher 79:48 is the canon''s same plea, with the same warning of plague and sword.'),
  ('jasher', 'jasher', 79, 47, 'canon', 'exodus', 3, 15, 'free', E'Exodus 3:15 — *And Elohim (God) said moreover unto Moses... Yahuah Elohim (The LORD God) of your fathers, the Elohim (God) of Abraham, the Elohim (God) of Isaac, and the Elohim (God) of Jacob, hath sent me unto you: this is my name for ever, and this is my memorial unto all generations.* The Name proclaimed from the days of the ancestors in Jasher 79:47 is the everlasting memorial-name given at the bush.'),
  -- thread: jasher-79-heavier-burden-plagues-coming
  ('jasher', 'jasher', 79, 52, 'canon', 'exodus', 5, 9, 'free', E'Exodus 5:9 — *Let there more work be laid upon the men, that they may labour therein; and let them not regard vain words.* Pharaoh''s harsher labor in Jasher 79:52 is the canon''s straw-and-bricks decree to crush the people''s hope.'),
  ('jasher', 'jasher', 79, 55, 'canon', 'exodus', 3, 20, 'free', E'Exodus 3:20 — *And I will stretch out my hand, and smite Egypt with all my wonders which I will do in the midst thereof: and after that he will let you go.* Yahuah''s promise of an outstretched hand and heavy plagues in Jasher 79:55 is the canon''s own pledge to smite Egypt and free the people.'),
  ('jasher', 'jasher', 79, 55, 'canon', 'exodus', 12, 12, 'free', E'Exodus 12:12 — *For I will pass through the land of Egypt this night, and will smite all the firstborn in the land of Egypt, both man and beast; and against all the gods of Egypt I will execute judgment: I am Yahuah (LORD).* The heavy plagues foretold in Jasher 79:55 are Yahuah''s judgment on the gods of Egypt.'),
  ('jasher', 'jasher', 79, 55, 'jubilees', 'jubilees', 48, 5, 'extras', E'Jubilees 48:5 — *And Yahuah (God) executed a great vengeance on them for Yashar’el’s (Israel’s) sake, and smote them through (the plagues of) blood and frogs, lice and dog-flies... and on all their idols Yahuah (God) took vengeance and burned them with fire.* The plagues that begin to be promised in Jasher 79:55 are Jubilees'' great covenant vengeance on Egypt and her idols.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja79_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja79_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-79-burning-bush-the-call',
       E'The bush that burned and was not consumed — the I AM calls Moses',
       E'Jasher sets Moses back at Reuel''s flock when the fire finds him: *And it came to pass one day that a kid of goats strayed from the flock, and Moses pursued it and it came to the mountain of Elohim (God) to Horeb.* *And when he came to Horeb, Yahuah (the Lord) appeared there to him in the bush, and he found the bush burning with fire, but the fire had no power over the bush to consume it.* It ain''t new — this is Exodus'' own scene: *And the angel of Yahuah (LORD) appeared unto him in a flame of fire out of the midst of a bush: and he looked, and, behold, the bush burned with fire, and the bush was not consumed* (Exodus 3:2). The voice that speaks is the covenant Elohim remembering the fathers — *Moreover he said, I am the Elohim (God) of thy father, the Elohim (God) of Abraham, the Elohim (God) of Isaac, and the Elohim (God) of Jacob...* (Exodus 3:6) — the same I AM whose memorial-name stands for ever (Exodus 3:15). Stephen carries the same fire forty years on: *And when forty years were expired, there appeared to him in the wilderness of mount Sina an angel of Yahuah (Lord) in a flame of fire in a bush* (Acts 7:30); and the word from the fire is a word of deliverance — *I have come down to deliver* (Acts 7:34). The call is to go down to Egypt and bring forth the chosen seed; Torah''s God is the one who keeps His covenant.',
       sv.verse_id, ev.verse_id, 'extras', 56950
  FROM _session252_ja79_lookup sv, _session252_ja79_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=79 AND sv.verse_number=1
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=79 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-79-angel-at-the-inn-circumcision',
       E'The angel at the inn — Zipporah keeps the covenant of Abraham',
       E'On the road back to Egypt the deliverer is himself nearly slain: *And Moses rose up to go to Egypt, and he took his wife and sons with him, and he was at an inn in the road, and an angel of Elohim came down, and sought an occasion against him.* Jasher names the offence plainly — *he wished to kill him on account of his first born son, because he had not circumcised him, and had transgressed the covenant which Yahuah (the Lord) had made with Abraham.* This is Exodus'' starkest half-verse unfolded: *And it came to pass by the way in the inn, that Yahuah (LORD) met him, and sought to kill him* (Exodus 4:24). And Zipporah does what Moses had failed to do: *Then Zipporah took a sharp stone, and cut off the foreskin of her son, and cast it at his feet, and said, Surely a bloody husband art thou to me* (Exodus 4:25). It ain''t new and it isn''t optional — the sign of Abraham''s covenant stands even on the man sent to bring the nation out; Torah-before-Sinai is no light thing. Jubilees frames the same lodging-place encounter as the work of Mastêmâ against the deliverer (Jubilees 48:2-3), and bears witness that Yahuah delivered Moses out of his hand.',
       sv.verse_id, ev.verse_id, 'extras', 56953
  FROM _session252_ja79_lookup sv, _session252_ja79_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=79 AND sv.verse_number=8
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=79 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-79-aaron-meets-moses',
       E'Aaron sent to the mount — the brothers meet and the words are spoken',
       E'The call provides its own mouth: *And Yahuah (the Lord) appeared to him in that place, and he said to him, Go now toward Moses in the wilderness, and he went and met him in the mountain of Elohim, and he kissed him.* This is Exodus exactly: *And Yahuah (LORD) said to Aaron, Go into the wilderness to meet Moses. And he went, and met him in the mount of Elohim (God), and kissed him* (Exodus 4:27). Then the two carry the word to the people: *And Moses and Aaron came to Egypt to the community of the children of Israel, and they spoke to them all the words of Yahuah (the Lord), and the people rejoiced an exceeding great rejoicing* — answering *And Moses told Aaron all the words of Yahuah (LORD) who had sent him, and all the signs which he had commanded him* (Exodus 4:28). It ain''t new: the deliverance comes to the twelve-tribe covenant people, and they believe and rejoice.',
       sv.verse_id, ev.verse_id, 'extras', 56956
  FROM _session252_ja79_lookup sv, _session252_ja79_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=79 AND sv.verse_number=13
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=79 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-79-rod-and-serpent-sign',
       E'The rod that became a serpent — Aaron''s rod swallows the sorcerers''',
       E'Before Pharaoh the sign is given: *And Aaron hastened and threw the rod out of his hand before Pharaoh and before his servants, and the rod turned into a serpent.* The magicians answer in kind — *And the sorcerers saw this and they cast each man his rod upon the ground and they became serpents* — but the contest has only one end: *And when they were restored to rods, the rod of Aaron swallowed up their rods.* This is Exodus 7 set down whole: *And Moses and Aaron went in unto Pharaoh, and they did so as Yahuah (LORD) had commanded: and Aaron cast down his rod before Pharaoh, and before his servants, and it became a serpent* (Exodus 7:10); *For they cast down every man his rod, and they became serpents: but Aaron’s rod swallowed up their rods* (Exodus 7:12). The rod is the rod of Elohim — the same staff that first turned serpent at Horeb: *And he cast it on the ground, and it became a serpent; and Moses fled from before it* (Exodus 4:3). It ain''t new: the kingdom of man''s counterfeit power is swallowed up by the one true sign that Yahuah''s hand is in His sent ones. Jubilees adds that the sorcerers were permitted their works but undone before the deliverer (Jubilees 48:9).',
       sv.verse_id, ev.verse_id, 'extras', 56959
  FROM _session252_ja79_lookup sv, _session252_ja79_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=79 AND sv.verse_number=36
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=79 AND ev.verse_number=42
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-79-who-is-yahuah-let-my-people-go',
       E'Let my people go — ''who is Yahuah?'' Pharaoh hardens',
       E'The demand and the defiance are the heart of the chapter: *Yahuah Elohim (Lord God) of the Hebrews has sent us to you, to say, Send forth my people that they may serve me*, and again *Thus said Yahuah Elohim (the Lord God) of the Hebrews, Send my people that they may serve me.* Pharaoh''s answer is the canon''s defining blasphemy: *Pharaoh turned to Moses and Aaron and said to them, I know not Yahuah (the Lord) whom you have declared, neither will I send his people.* This is Exodus 5 verbatim in spirit: *And Pharaoh said, Who is Yahuah (LORD), that I should obey his voice to let Yashar''el (Israel) go? I know not Yahuah (LORD), neither will I let Yashar''el (Israel) go* (Exodus 5:2) — set against Israel''s true plea, *And they said, The Elohim (God) of the Hebrews hath met with us: let us go, we pray thee, three days’ journey into the desert, and sacrifice unto Yahuah Eloheinu (the LORD our God)...* (Exodus 5:3). And Pharaoh''s boast — *my river is mine own, and I have made it for myself* — is the kingdom-of-man exalting itself against the Maker of heaven and earth (Jasher 79:49). It ain''t new: the issue is whether the nations'' gods or the I AM is Elohim, and the plea is to go and sacrifice — to keep the worship Torah requires.',
       sv.verse_id, ev.verse_id, 'extras', 56962
  FROM _session252_ja79_lookup sv, _session252_ja79_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=79 AND sv.verse_number=25
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=79 AND ev.verse_number=51
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-79-heavier-burden-plagues-coming',
       E'The burden made heavier — and the plagues that are coming',
       E'Pharaoh''s first answer is not release but oppression: *he ordered the labor upon Israel to be more severe than it was yesterday and before*, and *as for the children of Israel the Egyptians embittered their lives, with the heavy work which they imposed upon them.* This is Exodus 5''s straw-and-bricks decree: *Let there more work be laid upon the men, that they may labour therein; and let them not regard vain words* (Exodus 5:9). But Yahuah''s word to the discouraged Moses turns the night toward dawn: *And Yahuah (the Lord) said to Moses, Behold you will see that with an outstretched hand and heavy plagues, Pharaoh will send the children of Israel from his land* — the canon''s own pledge: *And I will stretch out my hand, and smite Egypt with all my wonders which I will do in the midst thereof: and after that he will let you go* (Exodus 3:20). It ain''t new: the plagues that begin here are Yahuah''s judgment on the gods of Egypt — *and against all the gods of Egypt I will execute judgment: I am Yahuah (LORD)* (Exodus 12:12). Jubilees gathers the whole ten into one covenant vengeance for Israel''s sake (Jubilees 48:5).',
       sv.verse_id, ev.verse_id, 'extras', 56965
  FROM _session252_ja79_lookup sv, _session252_ja79_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=79 AND sv.verse_number=52
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=79 AND ev.verse_number=57
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-79-burning-bush-the-call
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 3:2 — *And the angel of Yahuah (LORD) appeared unto him in a flame of fire out of the midst of a bush: and he looked, and, behold, the bush burned with fire, and the bush was not consumed.* The canon scene Jasher 79:3 retells — the bush burns yet the fire has no power to consume it.'
  FROM cross_reference_threads t, cross_references x, _session252_ja79_lookup sv, _session252_ja79_lookup tv
 WHERE t.slug='jasher-79-burning-bush-the-call'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=79 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=3 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 3:6 — *Moreover he said, I am the Elohim (God) of thy father, the Elohim (God) of Abraham, the Elohim (God) of Isaac, and the Elohim (God) of Jacob. And Moses hid his face; for he was afraid to look upon Elohim (God).* The One who calls Moses out of the fire in Jasher 79:4 is the covenant Elohim of the fathers, not a new god.'
  FROM cross_reference_threads t, cross_references x, _session252_ja79_lookup sv, _session252_ja79_lookup tv
 WHERE t.slug='jasher-79-burning-bush-the-call'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=79 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=3 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 7:30 — *And when forty years were expired, there appeared to him in the wilderness of mount Sina an angel of Yahuah (Lord) in a flame of fire in a bush.* Stephen recounts the same Horeb fire and commission to Egypt that Jasher 79:4 narrates.'
  FROM cross_reference_threads t, cross_references x, _session252_ja79_lookup sv, _session252_ja79_lookup tv
 WHERE t.slug='jasher-79-burning-bush-the-call'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=79 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Acts 7:34 — *I have seen, I have seen the affliction of my people which is in Egypt, and I have heard their groaning, and am come down to deliver them. And now come, I will send thee into Egypt.* The word that returns Moses to Egypt in Jasher 79:5 is the I AM come down to deliver the chosen people.'
  FROM cross_reference_threads t, cross_references x, _session252_ja79_lookup sv, _session252_ja79_lookup tv
 WHERE t.slug='jasher-79-burning-bush-the-call'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=79 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Exodus 3:20 — *And I will stretch out my hand, and smite Egypt with all my wonders which I will do in the midst thereof: and after that he will let you go.* The signs and wonders Yahuah shows Moses in Jasher 79:6 are the wonders by which Egypt will be smitten and the seed set free.'
  FROM cross_reference_threads t, cross_references x, _session252_ja79_lookup sv, _session252_ja79_lookup tv
 WHERE t.slug='jasher-79-burning-bush-the-call'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=79 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=3 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-79-angel-at-the-inn-circumcision
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 4:24 — *And it came to pass by the way in the inn, that Yahuah (LORD) met him, and sought to kill him.* The terse canon verse that Jasher 79:8 unfolds — the angel meeting Moses at the inn to take his life.'
  FROM cross_reference_threads t, cross_references x, _session252_ja79_lookup sv, _session252_ja79_lookup tv
 WHERE t.slug='jasher-79-angel-at-the-inn-circumcision'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=79 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=4 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 4:25 — *Then Zipporah took a sharp stone, and cut off the foreskin of her son, and cast it at his feet, and said, Surely a bloody husband art thou to me.* Zipporah''s sharp-rock circumcision in Jasher 79:12 is the canon act that delivers husband and son from the angel.'
  FROM cross_reference_threads t, cross_references x, _session252_ja79_lookup sv, _session252_ja79_lookup tv
 WHERE t.slug='jasher-79-angel-at-the-inn-circumcision'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=79 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=4 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 17:14 — *And the uncircumcised man child whose flesh of his foreskin is not circumcised, that soul shall be cut off from his people; he hath broken my covenant.* The covenant of Abraham that Jasher 79:9 says Moses transgressed by leaving Gershom uncircumcised.'
  FROM cross_reference_threads t, cross_references x, _session252_ja79_lookup sv, _session252_ja79_lookup tv
 WHERE t.slug='jasher-79-angel-at-the-inn-circumcision'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=79 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 48:2 — *And you yourself know what He spake to you on Mount Sinai, and what prince Mastêmâ desired to do with you when you were returning into Egypt on the way when you did meet him at the lodging-place.* Jubilees names the very lodging-place attack of Jasher 79:8 as the work of Mastêmâ against the returning deliverer.'
  FROM cross_reference_threads t, cross_references x, _session252_ja79_lookup sv, _session252_ja79_lookup tv
 WHERE t.slug='jasher-79-angel-at-the-inn-circumcision'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=79 AND sv.verse_number=8
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=48 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 48:3 — *Did he not with all his power seek to slay you and deliver the Egyptians out of your hand when he saw that you were sent to execute judgment and vengeance on the Egyptians?* The deliverance from the inn-angel in Jasher 79:12 is Jubilees'' account of Moses rescued from the one who sought to slay him.'
  FROM cross_reference_threads t, cross_references x, _session252_ja79_lookup sv, _session252_ja79_lookup tv
 WHERE t.slug='jasher-79-angel-at-the-inn-circumcision'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=79 AND sv.verse_number=12
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=48 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-79-aaron-meets-moses
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 4:27 — *And Yahuah (LORD) said to Aaron, Go into the wilderness to meet Moses. And he went, and met him in the mount of Elohim (God), and kissed him.* The very meeting at the mountain of Elohim that Jasher 79:14 narrates, kiss and all.'
  FROM cross_reference_threads t, cross_references x, _session252_ja79_lookup sv, _session252_ja79_lookup tv
 WHERE t.slug='jasher-79-aaron-meets-moses'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=79 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=4 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 4:28 — *And Moses told Aaron all the words of Yahuah (LORD) who had sent him, and all the signs which he had commanded him.* The words of Yahuah that Moses and Aaron speak to Israel in Jasher 79:19 are the words and signs Moses received at the bush.'
  FROM cross_reference_threads t, cross_references x, _session252_ja79_lookup sv, _session252_ja79_lookup tv
 WHERE t.slug='jasher-79-aaron-meets-moses'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=79 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=4 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 4:31 — *And the people believed: and when they heard that Yahuah (LORD) had visited the children of Yashar''el (Israel), and that he had looked upon their affliction, then they bowed their heads and worshipped.* The exceeding great rejoicing of the people in Jasher 79:19 is the canon''s believing, head-bowed worship of the chosen nation.'
  FROM cross_reference_threads t, cross_references x, _session252_ja79_lookup sv, _session252_ja79_lookup tv
 WHERE t.slug='jasher-79-aaron-meets-moses'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=79 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=4 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-79-rod-and-serpent-sign
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 7:10 — *And Moses and Aaron went in unto Pharaoh, and they did so as Yahuah (LORD) had commanded: and Aaron cast down his rod before Pharaoh, and before his servants, and it became a serpent.* The exact rod-into-serpent sign Aaron performs before Pharaoh in Jasher 79:36.'
  FROM cross_reference_threads t, cross_references x, _session252_ja79_lookup sv, _session252_ja79_lookup tv
 WHERE t.slug='jasher-79-rod-and-serpent-sign'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=79 AND sv.verse_number=36
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=7 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 7:12 — *For they cast down every man his rod, and they became serpents: but Aaron’s rod swallowed up their rods.* The swallowing of the sorcerers'' rods in Jasher 79:42 is the canon''s own verdict — the counterfeit is consumed.'
  FROM cross_reference_threads t, cross_references x, _session252_ja79_lookup sv, _session252_ja79_lookup tv
 WHERE t.slug='jasher-79-rod-and-serpent-sign'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=79 AND sv.verse_number=42
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=7 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 4:3 — *And he said, Cast it on the ground. And he cast it on the ground, and it became a serpent; and Moses fled from before it.* The rod of Elohim wielded in Jasher 79:36 is the same staff first turned serpent before Moses at Horeb.'
  FROM cross_reference_threads t, cross_references x, _session252_ja79_lookup sv, _session252_ja79_lookup tv
 WHERE t.slug='jasher-79-rod-and-serpent-sign'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=79 AND sv.verse_number=36
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=4 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 48:9 — *And the prince of the Mastêmâ stood up against you, and sought to cast you into the hands of Pharaoh, and he helped the Egyptian sorcerers, and they stood up and wrought before you.* The sorcerers who cast their rods in Jasher 79:37 are, in Jubilees, helped by Mastêmâ to work before Moses.'
  FROM cross_reference_threads t, cross_references x, _session252_ja79_lookup sv, _session252_ja79_lookup tv
 WHERE t.slug='jasher-79-rod-and-serpent-sign'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=79 AND sv.verse_number=37
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=48 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-79-who-is-yahuah-let-my-people-go
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 5:2 — *And Pharaoh said, Who is Yahuah (LORD), that I should obey his voice to let Yashar''el (Israel) go? I know not Yahuah (LORD), neither will I let Yashar''el (Israel) go.* Pharaoh''s ''I know not Yahuah'' in Jasher 79:46 is the canon''s defining refusal of the I AM.'
  FROM cross_reference_threads t, cross_references x, _session252_ja79_lookup sv, _session252_ja79_lookup tv
 WHERE t.slug='jasher-79-who-is-yahuah-let-my-people-go'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=79 AND sv.verse_number=46
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=5 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 5:1 — *And afterward Moses and Aaron went in, and told Pharaoh, Thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel), Let my people go, that they may hold a feast unto me in the wilderness.* The ''send forth my people that they may serve me'' of Jasher 79:25 is Exodus'' own demand to let the nation go and keep the feast.'
  FROM cross_reference_threads t, cross_references x, _session252_ja79_lookup sv, _session252_ja79_lookup tv
 WHERE t.slug='jasher-79-who-is-yahuah-let-my-people-go'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=79 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=5 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 5:3 — *And they said, The Elohim (God) of the Hebrews hath met with us: let us go, we pray thee, three days’ journey into the desert, and sacrifice unto Yahuah Eloheinu (the LORD our God); lest he fall upon us with pestilence, or with the sword.* The three-days'' journey to sacrifice in Jasher 79:48 is the canon''s same plea, with the same warning of plague and sword.'
  FROM cross_reference_threads t, cross_references x, _session252_ja79_lookup sv, _session252_ja79_lookup tv
 WHERE t.slug='jasher-79-who-is-yahuah-let-my-people-go'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=79 AND sv.verse_number=48
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=5 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Exodus 3:15 — *And Elohim (God) said moreover unto Moses... Yahuah Elohim (The LORD God) of your fathers, the Elohim (God) of Abraham, the Elohim (God) of Isaac, and the Elohim (God) of Jacob, hath sent me unto you: this is my name for ever, and this is my memorial unto all generations.* The Name proclaimed from the days of the ancestors in Jasher 79:47 is the everlasting memorial-name given at the bush.'
  FROM cross_reference_threads t, cross_references x, _session252_ja79_lookup sv, _session252_ja79_lookup tv
 WHERE t.slug='jasher-79-who-is-yahuah-let-my-people-go'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=79 AND sv.verse_number=47
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-79-heavier-burden-plagues-coming
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 5:9 — *Let there more work be laid upon the men, that they may labour therein; and let them not regard vain words.* Pharaoh''s harsher labor in Jasher 79:52 is the canon''s straw-and-bricks decree to crush the people''s hope.'
  FROM cross_reference_threads t, cross_references x, _session252_ja79_lookup sv, _session252_ja79_lookup tv
 WHERE t.slug='jasher-79-heavier-burden-plagues-coming'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=79 AND sv.verse_number=52
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=5 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 3:20 — *And I will stretch out my hand, and smite Egypt with all my wonders which I will do in the midst thereof: and after that he will let you go.* Yahuah''s promise of an outstretched hand and heavy plagues in Jasher 79:55 is the canon''s own pledge to smite Egypt and free the people.'
  FROM cross_reference_threads t, cross_references x, _session252_ja79_lookup sv, _session252_ja79_lookup tv
 WHERE t.slug='jasher-79-heavier-burden-plagues-coming'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=79 AND sv.verse_number=55
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=3 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 12:12 — *For I will pass through the land of Egypt this night, and will smite all the firstborn in the land of Egypt, both man and beast; and against all the gods of Egypt I will execute judgment: I am Yahuah (LORD).* The heavy plagues foretold in Jasher 79:55 are Yahuah''s judgment on the gods of Egypt.'
  FROM cross_reference_threads t, cross_references x, _session252_ja79_lookup sv, _session252_ja79_lookup tv
 WHERE t.slug='jasher-79-heavier-burden-plagues-coming'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=79 AND sv.verse_number=55
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 48:5 — *And Yahuah (God) executed a great vengeance on them for Yashar’el’s (Israel’s) sake, and smote them through (the plagues of) blood and frogs, lice and dog-flies... and on all their idols Yahuah (God) took vengeance and burned them with fire.* The plagues that begin to be promised in Jasher 79:55 are Jubilees'' great covenant vengeance on Egypt and her idols.'
  FROM cross_reference_threads t, cross_references x, _session252_ja79_lookup sv, _session252_ja79_lookup tv
 WHERE t.slug='jasher-79-heavier-burden-plagues-coming'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=79 AND sv.verse_number=55
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=48 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

