-- ----- fragment: minion_jubilees_48.sql (session251 jubilees 48) -----
-- Source anchor: jubilees/jubilees ch48. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ju48 (view _session251_ju48_lookup). Sort band base 54175, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session251_ju48_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jubilees-48-bush-and-the-lodging-place
  ('jubilees', 'jubilees', 48, 2, 'canon', 'exodus', 4, 24, 'free', E'Exodus 4:24 — *And it came to pass by the way in the inn, that Yahuah (LORD) met him, and sought to kill him.* This is the lodging-place ambush Jubilees 48:2 names, unveiling prince Mastêmâ as the one who ''sought to slay you'' on the road back to Egypt.'),
  ('jubilees', 'jubilees', 48, 1, 'canon', 'exodus', 3, 2, 'free', E'Exodus 3:2 — *And the angel of Yahuah (LORD) appeared unto him in a flame of fire out of the midst of a bush: and he looked, and, behold, the bush burned with fire, and the bush was not consumed.* The bush at Sinai is where the return-from-Midian of Jubilees 48:1 begins in the source.'),
  ('jubilees', 'jubilees', 48, 3, 'canon', 'exodus', 3, 10, 'free', E'Exodus 3:10 — *Come now therefore, and I will send thee unto Pharaoh, that thou mayest bring forth my people the children of Yashar''el (Israel) out of Egypt.* This is the sending ''to execute judgment and vengeance on the Egyptians'' that Mastêmâ sought to abort in Jubilees 48:3.'),
  -- thread: jubilees-48-ten-plagues
  ('jubilees', 'jubilees', 48, 5, 'canon', 'exodus', 12, 29, 'free', E'Exodus 12:29 — *And it came to pass, that at midnight Yahuah (LORD) smote all the firstborn in the land of Egypt, from the firstborn of Pharaoh that sat on his throne unto the firstborn of the captive that was in the dungeon; and all the firstborn of cattle.* This is the tenth plague, ''the death of the first-born of men and animals,'' that closes the list in Jubilees 48:5.'),
  ('jubilees', 'jubilees', 48, 7, 'canon', 'romans', 9, 17, 'free', E'Romans 9:17 — *For the scripture saith unto Pharaoh, Even for this same purpose have I raised thee up, that I might shew my power in thee, and that my name might be declared throughout all the earth.* Paul reads the ''ten great and terrible judgments'' of Jubilees 48:7 as Yahuah declaring His name through Pharaoh.'),
  ('jubilees', 'jubilees', 48, 4, 'canon', 'exodus', 3, 12, 'free', E'Exodus 3:12 — *And he said, Certainly I will be with thee; and this shall be a token unto thee, that I have sent thee: When thou hast brought forth the people out of Egypt, ye shall serve Elohim (God) upon this mountain.* This is the promise behind ''I delivered you out of his hand, and you did perform the signs and wonders'' in Jubilees 48:4.'),
  ('jubilees', 'jubilees', 48, 7, 'jubilees', 'jubilees', 49, 2, 'extras', E'Jubilees 49:2 — *For on this night–the beginning of the festival and the beginning of the joy–you were eating the passover in Egypt, when all the powers of Mastêmâ had been let loose to slay all the first-born in the land of Egypt, from the firstborn of Pharaoh to the first-born of the captive maidservant in the mill, and to the cattle.* The next chapter ties the tenth of these ten judgments (Jubilees 48:7) to the eternal Passover night.'),
  -- thread: jubilees-48-mastema-and-the-magicians
  ('jubilees', 'jubilees', 48, 9, 'canon', 'exodus', 7, 11, 'free', E'Exodus 7:11 — *Then Pharaoh also called the wise men and the sorcerers: now the magicians of Egypt, they also did in like manner with their enchantments.* These are the ''Egyptian sorcerers'' Mastêmâ helped to stand and work before Moses in Jubilees 48:9.'),
  ('jubilees', 'jubilees', 48, 11, 'canon', 'exodus', 9, 11, 'free', E'Exodus 9:11 — *And the magicians could not stand before Moses because of the boils; for the boil was upon the magicians, and upon all the Egyptians.* This is the ''malignant ulcers'' that left the sorcerers unable to stand in Jubilees 48:11.'),
  ('jubilees', 'jubilees', 48, 9, 'canon', 'exodus', 7, 12, 'free', E'Exodus 7:12 — *For they cast down every man his rod, and they became serpents: but Aaron’s rod swallowed up their rods.* The sorcerers ''wrought before you'' (Jubilees 48:9), yet their signs were swallowed — heaven permitted the evil but not the victory (Jubilees 48:10).'),
  -- thread: jubilees-48-red-sea-host-drowned
  ('jubilees', 'jubilees', 48, 12, 'canon', 'exodus', 14, 19, 'free', E'Exodus 14:19 — *And the angel of Elohim (God), which went before the camp of Yashar''el (Israel), removed and went behind them; and the pillar of the cloud went from before their face, and stood behind them.* This is the ''I stood between the Egyptians and Yashar''el'' of Jubilees 48:12.'),
  ('jubilees', 'jubilees', 48, 12, 'canon', 'exodus', 14, 21, 'free', E'Exodus 14:21 — *And Moses stretched out his hand over the sea; and Yahuah (LORD) caused the sea to go back by a strong east wind all that night, and made the sea dry land, and the waters were divided.* This is the sea crossed ''as if it were dry land'' in Jubilees 48:12.'),
  ('jubilees', 'jubilees', 48, 14, 'canon', 'exodus', 14, 28, 'free', E'Exodus 14:28 — *And the waters returned, and covered the chariots, and the horsemen, and all the host of Pharaoh that came into the sea after them; there remained not so much as one of them.* This is the host Yahuah ''cast into the midst of the sea, into the depths of the abyss'' in Jubilees 48:14.'),
  ('jubilees', 'jubilees', 48, 14, 'apocrypha', 'the-wisdom-of-solomon', 18, 5, 'extras', E'Wisdom of Solomon 18:5 — *And when they had determined to slay the babes of the saints, one child being cast forth, and saved, to reprove them, you tookest away the multitude of their children, and destroyedst them altogether in a mighty water.* The ''mighty water'' measure-for-measure matches Jubilees 48:14, where the host drowns because Egypt had cast Israel''s children into the river.'),
  -- thread: jubilees-48-mastema-bound-and-the-spoiling
  ('jubilees', 'jubilees', 48, 17, 'canon', 'exodus', 4, 21, 'free', E'Exodus 4:21 — *And Yahuah (LORD) said unto Moses, When thou goest to return into Egypt, see that thou do all those wonders before Pharaoh, which I have put in thine hand: but I will harden his heart, that he shall not let the people go.* This is the ''device devised by Yahuah our Elohim'' that hardened Egypt''s heart in Jubilees 48:17.'),
  ('jubilees', 'jubilees', 48, 19, 'canon', 'exodus', 12, 36, 'free', E'Exodus 12:36 — *And Yahuah (LORD) gave the people favour in the sight of the Egyptians, so that they lent unto them such things as they required. And they spoiled the Egyptians.* This is why Israel went out ''not empty handed'' in Jubilees 48:19 — spoiling Egypt in return for the bondage.'),
  ('jubilees', 'jubilees', 48, 19, 'canon', 'exodus', 12, 35, 'free', E'Exodus 12:35 — *And the children of Yashar''el (Israel) did according to the word of Moses; and they borrowed of the Egyptians jewels of silver, and jewels of gold, and raiment.* These are the ''vessels of silver, and vessels of gold, and vessels of bronze'' of Jubilees 48:17, the despoiling that left Israel not empty-handed (Jubilees 48:19).'),
  ('jubilees', 'jubilees', 48, 16, 'canon', 'revelation', 15, 3, 'free', E'Revelation 15:3 — *And they sing the song of Moses the servant of Elohim (God), and the song of the Lamb, saying, Great and marvellous are thy works, Yahuah Elohim (Lord God) Almighty; just and true are thy ways, thou King of saints.* The deliverance through the sea, with the accuser bound and the host drowned (Jubilees 48:15-16), is the victory the redeemed sing forever.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session251_ju48_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session251_ju48_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-48-bush-and-the-lodging-place',
       E'Sent from Midian — Mastema at the lodging-place',
       E'Jubilees opens the deliverance where Exodus does, with Moses returning from Midian to a hostile road: *And in the sixth year of the third week of the forty-ninth jubilee you did depart and dwell in the land of Midian five weeks and one year. And you did return into Egypt in the second week in the second year in the fiftieth jubilee* (Jubilees 48:1). And it names the adversary on that road — *what prince Mastêmâ desired to do with you when you were returning into Egypt on the way when you did meet him at the lodging-place* (Jubilees 48:2). It ain''t new: Genesis-Exodus carries the same midnight ambush at the inn — *And it came to pass by the way in the inn, that Yahuah (LORD) met him, and sought to kill him* (Exodus 4:24) — Jubilees simply unveils the prince behind it. The same chapter sends him: *Come now therefore, and I will send thee unto Pharaoh, that thou mayest bring forth my people the children of Yashar''el (Israel) out of Egypt* (Exodus 3:10), with the bush as the sign — *And the angel of Yahuah (LORD) appeared unto him in a flame of fire out of the midst of a bush* (Exodus 3:2).',
       sv.verse_id, ev.verse_id, 'extras', 54175
  FROM _session251_ju48_lookup sv, _session251_ju48_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=48 AND sv.verse_number=1
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=48 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-48-ten-plagues',
       E'The signs and the ten great judgments',
       E'Jubilees lists the plagues in a single breath: *and smote them through (the plagues of) blood and frogs, lice and dog-flies, and malignant boils breaking forth in blains; and their cattle by death; and by hail-stones... and by locusts... and by darkness; and (by the death) of the first-born of men and animals* (Jubilees 48:5), summing them — *ten great and terrible judgments came on the land of Egypt* (Jubilees 48:7). It grounds the vengeance in covenant, not caprice — *according to His covenant, which He had ordained with Abraham* (Jubilees 48:7). And the climactic blow is Exodus 12''s midnight — *And it came to pass, that at midnight Yahuah (LORD) smote all the firstborn in the land of Egypt, from the firstborn of Pharaoh that sat on his throne unto the firstborn of the captive that was in the dungeon; and all the firstborn of cattle* (Exodus 12:29). Paul reads the whole drama as Yahuah''s self-revelation through Pharaoh — *Even for this same purpose have I raised thee up, that I might shew my power in thee, and that my name might be declared throughout all the earth* (Romans 9:17). It ain''t new; the apostle is reading Exodus aloud.',
       sv.verse_id, ev.verse_id, 'extras', 54178
  FROM _session251_ju48_lookup sv, _session251_ju48_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=48 AND sv.verse_number=4
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=48 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-48-mastema-and-the-magicians',
       E'Mastema helps the sorcerers — and is shamed',
       E'Jubilees lifts the veil on Pharaoh''s magicians: *And the prince of the Mastêmâ stood up against you, and sought to cast you into the hands of Pharaoh, and he helped the Egyptian sorcerers, and they stood up and wrought before you* (Jubilees 48:9). The duel of signs is Exodus 7 — *Then Pharaoh also called the wise men and the sorcerers: now the magicians of Egypt, they also did in like manner with their enchantments* (Exodus 7:11). But Jubilees names heaven''s limit on them — *The evils indeed we permitted them to work, but the remedies we did not allow to be wrought by their hands* (Jubilees 48:10) — and their collapse — *And Yahuah (God) smote them with malignant ulcers, and they were not able to stand* (Jubilees 48:11), exactly Exodus 9 — *And the magicians could not stand before Moses because of the boils; for the boil was upon the magicians, and upon all the Egyptians* (Exodus 9:11). Mastema is no rival power; he is the satan permitted to oppose, and bounded.',
       sv.verse_id, ev.verse_id, 'extras', 54181
  FROM _session251_ju48_lookup sv, _session251_ju48_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=48 AND sv.verse_number=9
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=48 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-48-red-sea-host-drowned',
       E'The sea — Pharaoh''s host cast into the deep',
       E'Mastema''s last device drives Pharaoh to the water: *he took courage and cried to the Egyptians to pursue after you with all the powers of the Egyptians, with their chariots, and with their horses... And I stood between the Egyptians and Yashar''el (Israel)... and Yahuah (God) brought them through the midst of the sea as if it were dry land* (Jubilees 48:12). The standing-between is Exodus 14 — *And the angel of Elohim (God), which went before the camp of Yashar''el (Israel), removed and went behind them* (Exodus 14:19) — and the dry path — *and made the sea dry land, and the waters were divided* (Exodus 14:21). Jubilees presses the measure-for-measure vengeance — *even as the people of Egypt had cast their children into the river* (Jubilees 48:14) — which the host''s drowning answers — *there remained not so much as one of them* (Exodus 14:28). The apocrypha sings the same justice: *one child being cast forth, and saved... you tookest away the multitude of their children, and destroyedst them altogether in a mighty water* (Wisdom of Solomon 18:5).',
       sv.verse_id, ev.verse_id, 'extras', 54184
  FROM _session251_ju48_lookup sv, _session251_ju48_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=48 AND sv.verse_number=12
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=48 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-48-mastema-bound-and-the-spoiling',
       E'Mastema bound — Israel spoils Egypt, not empty-handed',
       E'Jubilees gives the calendar of the binding: *And on the fourteenth day and on the fifteenth and on the sixteenth and on the seventeenth and on the eighteenth the prince of the Mastêmâ was bound and imprisoned behind the children of Yashar''el (Israel) that he might not accuse them* (Jubilees 48:15), loosed again to drive Egypt to ruin — *And on the nineteenth we let them loose that they might help the Egyptians and pursue the children of Yashar''el (Israel)* (Jubilees 48:16). The hardening is Yahuah''s own device — *And he hardened their hearts and made them stubborn, and the device was devised by Yahuah our Elohim (the LORD our God)* (Jubilees 48:17), as Exodus foretold — *I will harden his heart, that he shall not let the people go* (Exodus 4:21). And while the accuser is bound, Israel plunders Egypt — *We did not lead forth the children of Yashar''el (Israel) from Egypt empty handed* (Jubilees 48:19) — fulfilling Exodus 12 — *And they spoiled the Egyptians* (Exodus 12:36). The final word of the Exodus is the song the redeemed still sing — *And they sing the song of Moses the servant of Elohim (God), and the song of the Lamb* (Revelation 15:3).',
       sv.verse_id, ev.verse_id, 'extras', 54187
  FROM _session251_ju48_lookup sv, _session251_ju48_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=48 AND sv.verse_number=15
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=48 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jubilees-48-bush-and-the-lodging-place
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 4:24 — *And it came to pass by the way in the inn, that Yahuah (LORD) met him, and sought to kill him.* This is the lodging-place ambush Jubilees 48:2 names, unveiling prince Mastêmâ as the one who ''sought to slay you'' on the road back to Egypt.'
  FROM cross_reference_threads t, cross_references x, _session251_ju48_lookup sv, _session251_ju48_lookup tv
 WHERE t.slug='jubilees-48-bush-and-the-lodging-place'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=48 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=4 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 3:2 — *And the angel of Yahuah (LORD) appeared unto him in a flame of fire out of the midst of a bush: and he looked, and, behold, the bush burned with fire, and the bush was not consumed.* The bush at Sinai is where the return-from-Midian of Jubilees 48:1 begins in the source.'
  FROM cross_reference_threads t, cross_references x, _session251_ju48_lookup sv, _session251_ju48_lookup tv
 WHERE t.slug='jubilees-48-bush-and-the-lodging-place'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=48 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=3 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 3:10 — *Come now therefore, and I will send thee unto Pharaoh, that thou mayest bring forth my people the children of Yashar''el (Israel) out of Egypt.* This is the sending ''to execute judgment and vengeance on the Egyptians'' that Mastêmâ sought to abort in Jubilees 48:3.'
  FROM cross_reference_threads t, cross_references x, _session251_ju48_lookup sv, _session251_ju48_lookup tv
 WHERE t.slug='jubilees-48-bush-and-the-lodging-place'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=48 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=3 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-48-ten-plagues
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 12:29 — *And it came to pass, that at midnight Yahuah (LORD) smote all the firstborn in the land of Egypt, from the firstborn of Pharaoh that sat on his throne unto the firstborn of the captive that was in the dungeon; and all the firstborn of cattle.* This is the tenth plague, ''the death of the first-born of men and animals,'' that closes the list in Jubilees 48:5.'
  FROM cross_reference_threads t, cross_references x, _session251_ju48_lookup sv, _session251_ju48_lookup tv
 WHERE t.slug='jubilees-48-ten-plagues'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=48 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 9:17 — *For the scripture saith unto Pharaoh, Even for this same purpose have I raised thee up, that I might shew my power in thee, and that my name might be declared throughout all the earth.* Paul reads the ''ten great and terrible judgments'' of Jubilees 48:7 as Yahuah declaring His name through Pharaoh.'
  FROM cross_reference_threads t, cross_references x, _session251_ju48_lookup sv, _session251_ju48_lookup tv
 WHERE t.slug='jubilees-48-ten-plagues'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=48 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=9 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 3:12 — *And he said, Certainly I will be with thee; and this shall be a token unto thee, that I have sent thee: When thou hast brought forth the people out of Egypt, ye shall serve Elohim (God) upon this mountain.* This is the promise behind ''I delivered you out of his hand, and you did perform the signs and wonders'' in Jubilees 48:4.'
  FROM cross_reference_threads t, cross_references x, _session251_ju48_lookup sv, _session251_ju48_lookup tv
 WHERE t.slug='jubilees-48-ten-plagues'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=48 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=3 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 49:2 — *For on this night–the beginning of the festival and the beginning of the joy–you were eating the passover in Egypt, when all the powers of Mastêmâ had been let loose to slay all the first-born in the land of Egypt, from the firstborn of Pharaoh to the first-born of the captive maidservant in the mill, and to the cattle.* The next chapter ties the tenth of these ten judgments (Jubilees 48:7) to the eternal Passover night.'
  FROM cross_reference_threads t, cross_references x, _session251_ju48_lookup sv, _session251_ju48_lookup tv
 WHERE t.slug='jubilees-48-ten-plagues'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=48 AND sv.verse_number=7
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=49 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-48-mastema-and-the-magicians
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 7:11 — *Then Pharaoh also called the wise men and the sorcerers: now the magicians of Egypt, they also did in like manner with their enchantments.* These are the ''Egyptian sorcerers'' Mastêmâ helped to stand and work before Moses in Jubilees 48:9.'
  FROM cross_reference_threads t, cross_references x, _session251_ju48_lookup sv, _session251_ju48_lookup tv
 WHERE t.slug='jubilees-48-mastema-and-the-magicians'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=48 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=7 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 9:11 — *And the magicians could not stand before Moses because of the boils; for the boil was upon the magicians, and upon all the Egyptians.* This is the ''malignant ulcers'' that left the sorcerers unable to stand in Jubilees 48:11.'
  FROM cross_reference_threads t, cross_references x, _session251_ju48_lookup sv, _session251_ju48_lookup tv
 WHERE t.slug='jubilees-48-mastema-and-the-magicians'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=48 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=9 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 7:12 — *For they cast down every man his rod, and they became serpents: but Aaron’s rod swallowed up their rods.* The sorcerers ''wrought before you'' (Jubilees 48:9), yet their signs were swallowed — heaven permitted the evil but not the victory (Jubilees 48:10).'
  FROM cross_reference_threads t, cross_references x, _session251_ju48_lookup sv, _session251_ju48_lookup tv
 WHERE t.slug='jubilees-48-mastema-and-the-magicians'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=48 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=7 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-48-red-sea-host-drowned
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 14:19 — *And the angel of Elohim (God), which went before the camp of Yashar''el (Israel), removed and went behind them; and the pillar of the cloud went from before their face, and stood behind them.* This is the ''I stood between the Egyptians and Yashar''el'' of Jubilees 48:12.'
  FROM cross_reference_threads t, cross_references x, _session251_ju48_lookup sv, _session251_ju48_lookup tv
 WHERE t.slug='jubilees-48-red-sea-host-drowned'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=48 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=14 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 14:21 — *And Moses stretched out his hand over the sea; and Yahuah (LORD) caused the sea to go back by a strong east wind all that night, and made the sea dry land, and the waters were divided.* This is the sea crossed ''as if it were dry land'' in Jubilees 48:12.'
  FROM cross_reference_threads t, cross_references x, _session251_ju48_lookup sv, _session251_ju48_lookup tv
 WHERE t.slug='jubilees-48-red-sea-host-drowned'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=48 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=14 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 14:28 — *And the waters returned, and covered the chariots, and the horsemen, and all the host of Pharaoh that came into the sea after them; there remained not so much as one of them.* This is the host Yahuah ''cast into the midst of the sea, into the depths of the abyss'' in Jubilees 48:14.'
  FROM cross_reference_threads t, cross_references x, _session251_ju48_lookup sv, _session251_ju48_lookup tv
 WHERE t.slug='jubilees-48-red-sea-host-drowned'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=48 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=14 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Wisdom of Solomon 18:5 — *And when they had determined to slay the babes of the saints, one child being cast forth, and saved, to reprove them, you tookest away the multitude of their children, and destroyedst them altogether in a mighty water.* The ''mighty water'' measure-for-measure matches Jubilees 48:14, where the host drowns because Egypt had cast Israel''s children into the river.'
  FROM cross_reference_threads t, cross_references x, _session251_ju48_lookup sv, _session251_ju48_lookup tv
 WHERE t.slug='jubilees-48-red-sea-host-drowned'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=48 AND sv.verse_number=14
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=18 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-48-mastema-bound-and-the-spoiling
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 4:21 — *And Yahuah (LORD) said unto Moses, When thou goest to return into Egypt, see that thou do all those wonders before Pharaoh, which I have put in thine hand: but I will harden his heart, that he shall not let the people go.* This is the ''device devised by Yahuah our Elohim'' that hardened Egypt''s heart in Jubilees 48:17.'
  FROM cross_reference_threads t, cross_references x, _session251_ju48_lookup sv, _session251_ju48_lookup tv
 WHERE t.slug='jubilees-48-mastema-bound-and-the-spoiling'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=48 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=4 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 12:36 — *And Yahuah (LORD) gave the people favour in the sight of the Egyptians, so that they lent unto them such things as they required. And they spoiled the Egyptians.* This is why Israel went out ''not empty handed'' in Jubilees 48:19 — spoiling Egypt in return for the bondage.'
  FROM cross_reference_threads t, cross_references x, _session251_ju48_lookup sv, _session251_ju48_lookup tv
 WHERE t.slug='jubilees-48-mastema-bound-and-the-spoiling'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=48 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 12:35 — *And the children of Yashar''el (Israel) did according to the word of Moses; and they borrowed of the Egyptians jewels of silver, and jewels of gold, and raiment.* These are the ''vessels of silver, and vessels of gold, and vessels of bronze'' of Jubilees 48:17, the despoiling that left Israel not empty-handed (Jubilees 48:19).'
  FROM cross_reference_threads t, cross_references x, _session251_ju48_lookup sv, _session251_ju48_lookup tv
 WHERE t.slug='jubilees-48-mastema-bound-and-the-spoiling'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=48 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 15:3 — *And they sing the song of Moses the servant of Elohim (God), and the song of the Lamb, saying, Great and marvellous are thy works, Yahuah Elohim (Lord God) Almighty; just and true are thy ways, thou King of saints.* The deliverance through the sea, with the accuser bound and the host drowned (Jubilees 48:15-16), is the victory the redeemed sing forever.'
  FROM cross_reference_threads t, cross_references x, _session251_ju48_lookup sv, _session251_ju48_lookup tv
 WHERE t.slug='jubilees-48-mastema-bound-and-the-spoiling'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=48 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=15 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

