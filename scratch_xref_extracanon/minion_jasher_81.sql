-- ----- fragment: minion_jasher_81.sql (session252 jasher 81) -----
-- Source anchor: jasher/jasher ch81. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja81 (view _session252_ja81_lookup). Sort band base 57000, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja81_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-81-exodus-spoiling
  ('jasher', 'jasher', 81, 1, 'canon', 'exodus', 12, 37, 'free', E'Exodus 12:37 — *And the children of Yashar''el (Israel) journeyed from Rameses to Succoth, about six hundred thousand on foot that were men, beside children.* The canon gives the identical muster and route that opens Jasher 81:1.'),
  ('jasher', 'jasher', 81, 2, 'canon', 'exodus', 12, 38, 'free', E'Exodus 12:38 — *And a mixed multitude went up also with them; and flocks, and herds, even very much cattle.* The mixed multitude and the much cattle of Jasher 81:2 are Exodus verbatim.'),
  ('jasher', 'jasher', 81, 4, 'canon', 'genesis', 15, 14, 'free', E'Genesis 15:14 — *And also that nation, whom they shall serve, will I judge: and afterward shall they come out with great substance.* The bringing-out with a strong hand in Jasher 81:4 keeps the word sworn to Abraham.'),
  ('jasher', 'jasher', 81, 2, 'canon', 'exodus', 12, 36, 'free', E'Exodus 12:36 — *And Yahuah (LORD) gave the people favour in the sight of the Egyptians, so that they lent unto them such things as they required. And they spoiled the Egyptians.* The substance carried out with the multitude of Jasher 81:2 is the canon''s spoiling of Egypt.'),
  ('jasher', 'jasher', 81, 4, 'jubilees', 'jubilees', 48, 19, 'extras', E'Jubilees 48:19 — *And we did not lead forth the children of Yashar''el (Israel) from Egypt empty handed.* The Jubilees apparatus narrates the same delivered seed that Jasher 81:4 brings out with a strong hand.'),
  -- thread: jasher-81-pharaoh-pursues
  ('jasher', 'jasher', 81, 6, 'canon', 'numbers', 33, 4, 'free', E'Numbers 33:4 — *For the Egyptians buried all their firstborn, which Yahuah (LORD) had smitten among them: upon their gods also Yahuah (LORD) executed judgments.* The three-day burial of Jasher 81:6 is the canon''s judgment on the gods of Egypt.'),
  ('jasher', 'jasher', 81, 21, 'canon', 'exodus', 14, 14, 'free', E'Exodus 14:14 — *Yahuah (LORD) shall fight for you, and ye shall hold your peace.* Jasher 81:21 has Yahuah harden Egypt only to overthrow her — the battle the canon promises is His.'),
  ('jasher', 'jasher', 81, 22, 'canon', 'exodus', 14, 12, 'free', E'Exodus 14:12 — *Is not this the word that we did tell thee in Egypt, saying, Let us alone, that we may serve the Egyptians? For it had been better for us to serve the Egyptians, than that we should die in the wilderness.* The mustered host bearing down on Israel in Jasher 81:22 is the dread the canon records at the sea.'),
  ('jasher', 'jasher', 81, 24, 'jubilees', 'jubilees', 48, 12, 'extras', E'Jubilees 48:12 — *the prince of the Mastêmâ ... cried to the Egyptians to pursue after you with all the powers of the Egyptians, with their chariots, and with their horses ... And I stood between the Egyptians and Yashar''el (Israel), and we delivered Yashar''el (Israel) out of his hand ... and Yahuah (God) brought them through the midst of the sea as if it were dry land.* Jubilees tells the same pursuit that overtakes Israel at the sea in Jasher 81:24.'),
  -- thread: jasher-81-red-sea-divided
  ('jasher', 'jasher', 81, 28, 'canon', 'exodus', 14, 13, 'free', E'Exodus 14:13 — *And Moses said unto the people, Fear ye not, stand still, and see the salvation of Yahuah (LORD), which he will shew to you to day: for the Egyptians whom ye have seen to day, ye shall see them again no more for ever.* Moses'' charge in Jasher 81:28 is the canon''s stand-still word verbatim in substance.'),
  ('jasher', 'jasher', 81, 37, 'canon', 'exodus', 14, 21, 'free', E'Exodus 14:21 — *And Moses stretched out his hand over the sea; and Yahuah (LORD) caused the sea to go back by a strong east wind all that night, and made the sea dry land, and the waters were divided.* The rod lifted and the sea divided in Jasher 81:37 is the canon''s parting.'),
  ('jasher', 'jasher', 81, 40, 'canon', 'exodus', 14, 28, 'free', E'Exodus 14:28 — *And the waters returned, and covered the chariots, and the horsemen, and all the host of Pharaoh that came into the sea after them; there remained not so much as one of them.* The waters resuming on the Egyptians in Jasher 81:40 is the canon''s drowning of the host.'),
  ('jasher', 'jasher', 81, 42, 'canon', 'exodus', 14, 30, 'free', E'Exodus 14:30 — *Thus Yahuah (LORD) saved Yashar''el (Israel) that day out of the hand of the Egyptians; and Yashar''el (Israel) saw the Egyptians dead upon the sea shore.* Jasher 81:42 has Israel behold the great hand of Yahuah exactly as the canon''s deliverance day.'),
  ('jasher', 'jasher', 81, 40, 'jubilees', 'jubilees', 48, 14, 'extras', E'Jubilees 48:14 — *And all the peoples whom he brought to pursue after Yashar''el (Israel), Yahuah our Elohim (the LORD our God) cast them into the midst of the sea, into the depths of the abyss beneath the children of Yashar''el (Israel)...* Jubilees narrates the same sinking host that Jasher 81:40 says sank in the water.'),
  -- thread: jasher-81-song-of-moses
  ('jasher', 'jasher', 81, 44, 'canon', 'exodus', 15, 1, 'free', E'Exodus 15:1 — *Then sang Moses and the children of Yashar''el (Israel) this song unto Yahuah (LORD), and spake, saying, I will sing unto Yahuah (LORD), for he hath triumphed gloriously: the horse and his rider hath he thrown into the sea.* Jasher 81:44 sings the canon''s song of the sea word for word.'),
  ('jasher', 'jasher', 81, 43, 'canon', 'revelation', 15, 3, 'free', E'Revelation 15:3 — *And they sing the song of Moses the servant of Elohim (God), and the song of the Lamb, saying, Great and marvellous are thy works, Yahuah Elohim (Lord God) Almighty; just and true are thy ways, thou King of saints.* The song Moses sings in Jasher 81:43 is sung again over the last enemy at the sea of glass.'),
  -- thread: jasher-81-marah-manna
  ('jasher', 'jasher', 81, 45, 'canon', 'exodus', 15, 25, 'free', E'Exodus 15:25 — *And he cried unto Yahuah (LORD); and Yahuah (LORD) shewed him a tree, which when he had cast into the waters, the waters were made sweet: there he made for them a statute and an ordinance, and there he proved them,* Jasher 81:45 names the same Marah where Yahuah gave statutes and judgments.'),
  ('jasher', 'jasher', 81, 48, 'canon', 'exodus', 16, 4, 'free', E'Exodus 16:4 — *Then said Yahuah (LORD) unto Moses, Behold, I will rain bread from heaven for you; and the people shall go out and gather a certain rate every day, that I may prove them, whether they will walk in my law, or no.* The food rained day by day in Jasher 81:48 is the canon''s manna that proves whether Israel will walk in His law.'),
  -- thread: jasher-81-amalek
  ('jasher', 'jasher', 81, 52, 'canon', 'exodus', 17, 8, 'free', E'Exodus 17:8 — *Then came Amalek, and fought with Yashar''el (Israel) in Rephidim.* Jasher 81:52 names the same Amalek warring with Israel at Rephidim.'),
  ('jasher', 'jasher', 81, 56, 'canon', 'exodus', 17, 14, 'free', E'Exodus 17:14 — *And Yahuah (LORD) said unto Moses, Write this for a memorial in a book, and rehearse it in the ears of Joshua: for I will utterly put out the remembrance of Amalek from under heaven.* The memorial book placed in Joshua''s hand in Jasher 81:56 is the canon''s command verbatim.'),
  ('jasher', 'jasher', 81, 59, 'canon', 'deuteronomy', 25, 18, 'free', E'Deuteronomy 25:18 — *How he met thee by the way, and smote the hindmost of thee, even all that were feeble behind thee, when thou wast faint and weary; and he feared not Elohim (God).* The words Moses writes in Jasher 81:59 are Deuteronomy''s charge about Amalek smiting the feeble behind.'),
  ('jasher', 'jasher', 81, 60, 'canon', 'deuteronomy', 25, 19, 'free', E'Deuteronomy 25:19 — *Therefore it shall be, when Yahuah Elohayka (the LORD thy God) hath given thee rest from all thine enemies round about, in the land which Yahuah Elohayka (the LORD thy God) giveth thee for an inheritance to possess it, that thou shalt blot out the remembrance of Amalek from under heaven; thou shalt not forget it.* Jasher 81:60''s blotting-out in the land of inheritance is Deuteronomy''s charge word for word.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja81_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja81_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-81-exodus-spoiling',
       E'Out of Egypt with a strong hand — the seed delivered and the Egyptians spoiled',
       E'Jasher closes the book with the Exodus itself: *And the children of Israel journeyed from Rameses to Succoth, about six hundred thousand men on foot, besides the little ones and their wives.* (Jasher 81:1) *And at the end of two hundred and ten years, Yahuah (the Lord) brought forth the children of Israel from Egypt with a strong hand.* (Jasher 81:4) This is Exodus told beat for beat — *And the children of Yashar''el (Israel) journeyed from Rameses to Succoth, about six hundred thousand on foot that were men, beside children.* (Exodus 12:37) — and the going-out is the keeping of the covenant word given centuries before to Abraham: *And also that nation, whom they shall serve, will I judge: and afterward shall they come out with great substance.* (Genesis 15:14) The mixed multitude and the great substance match the canon''s own spoiling of Egypt, *And Yahuah (LORD) gave the people favour in the sight of the Egyptians, so that they lent unto them such things as they required. And they spoiled the Egyptians.* (Exodus 12:36) — and Jubilees tells the very same deliverance, *And we did not lead forth the children of Yashar''el (Israel) from Egypt empty handed.* (Jubilees 48:19). It ain''t new: the seed-line is brought out, with a high hand, exactly as Yahuah swore.',
       sv.verse_id, ev.verse_id, 'extras', 57000
  FROM _session252_ja81_lookup sv, _session252_ja81_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=81 AND sv.verse_number=1
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=81 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-81-pharaoh-pursues',
       E'Egypt buries her firstborn and Pharaoh musters to pursue',
       E'Jasher lingers on Egypt''s grief and her renewed hardness: *And the Egyptians buried all their first born whom Yahuah (the Lord) had smitten, and all the Egyptians buried their slain for three days.* (Jasher 81:6) The canon names that burial as Yahuah''s verdict on Egypt''s gods — *For the Egyptians buried all their firstborn, which Yahuah (LORD) had smitten among them: upon their gods also Yahuah (LORD) executed judgments.* (Numbers 33:4) Then Pharaoh hardens and harnesses: *And Pharaoh rose up and harnessed his chariot, and he ordered all the Egyptians to assemble, not one man was left excepting the little ones and the women.* (Jasher 81:22) Jasher even names the divine purpose behind the pursuit — *And Yahuah (the Lord) strengthened the hearts of all the Egyptians to pursue the Israelites, for Yahuah (the Lord) desired to overthrow the Egyptians in the Red Sea.* (Jasher 81:21) Jubilees frames the same chase as the work of the adversary turned to Yahuah''s deliverance: *the prince of the Mastêmâ ... cried to the Egyptians to pursue after you with all the powers of the Egyptians, with their chariots, and with their horses ... And I stood between the Egyptians and Yashar''el (Israel), and we delivered Yashar''el (Israel) out of his hand* (Jubilees 48:12). The plague on the gods of Egypt, the hardened pursuit — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 57003
  FROM _session252_ja81_lookup sv, _session252_ja81_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=81 AND sv.verse_number=6
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=81 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-81-red-sea-divided',
       E'Stand still and see the salvation — the sea divided, Pharaoh''s host drowned',
       E'At the sea Jasher gives Moses the canon''s own charge: *And Moses said to them, Fear not, stand still and see the salvation of Yahuah (the Lord) which He will effect this day for you.* (Jasher 81:28) — *And Moses said unto the people, Fear ye not, stand still, and see the salvation of Yahuah (LORD), which he will shew to you to day: for the Egyptians whom ye have seen to day, ye shall see them again no more for ever.* (Exodus 14:13) Then the deliverance: *And Moses did so, and he lifted up his rod upon the sea and divided it.* (Jasher 81:37) — *And Moses stretched out his hand over the sea; and Yahuah (LORD) caused the sea to go back by a strong east wind all that night, and made the sea dry land, and the waters were divided.* (Exodus 14:21) And the host of Egypt is swallowed: *And the waters returned, and covered the chariots, and the horsemen, and all the host of Pharaoh that came into the sea after them; there remained not so much as one of them.* (Exodus 14:28) — so that Israel saw, as Jasher 81:42 says, the great hand of Yahuah: *Thus Yahuah (LORD) saved Yashar''el (Israel) that day out of the hand of the Egyptians; and Yashar''el (Israel) saw the Egyptians dead upon the sea shore.* (Exodus 14:30) Jubilees tells the same drowning, *Yahuah our Elohim (the LORD our God) cast them into the midst of the sea, into the depths of the abyss* (Jubilees 48:14). The seed crosses dry-shod; Egypt''s chariots sink — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 57006
  FROM _session252_ja81_lookup sv, _session252_ja81_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=81 AND sv.verse_number=28
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=81 AND ev.verse_number=42
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-81-song-of-moses',
       E'Then sang Moses — the song of Moses and the song of the Lamb',
       E'Jasher records the song at the sea and even names the book it is written in: *Then sang Moses and the children of Israel this song to Yahuah (the Lord), on the day when Yahuah (the Lord) caused the Egyptians to fall before them.* (Jasher 81:43) *And all Israel sang in concert, saying, I will sing to Yahuah (the Lord) for He is greatly exalted, the horse and his rider has he cast into the sea; behold it is written in the book of the law of Elohim.* (Jasher 81:44) That is Exodus word for word: *Then sang Moses and the children of Yashar''el (Israel) this song unto Yahuah (LORD), and spake, saying, I will sing unto Yahuah (LORD), for he hath triumphed gloriously: the horse and his rider hath he thrown into the sea.* (Exodus 15:1) And the song does not stay at the Red Sea — the Revelation gives it again at the last sea of glass: *And they sing the song of Moses the servant of Elohim (God), and the song of the Lamb, saying, Great and marvellous are thy works, Yahuah Elohim (Lord God) Almighty; just and true are thy ways, thou King of saints.* (Revelation 15:3) The deliverance song of the seed at the Red Sea is the same song sung over the last enemy. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 57009
  FROM _session252_ja81_lookup sv, _session252_ja81_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=81 AND sv.verse_number=43
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=81 AND ev.verse_number=44
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-81-marah-manna',
       E'Marah and the manna — statutes given, bread rained from heaven',
       E'Past the sea Jasher follows the wilderness stations: *After this the children of Israel proceeded on their journey, and encamped in Marah, and Yahuah (the Lord) gave to the children of Israel statutes and judgments in that place in Marah, and Yahuah (the Lord) commanded the children of Israel to walk in all his ways and to serve him.* (Jasher 81:45) The canon names Marah as the place of the statute: *there he made for them a statute and an ordinance, and there he proved them* (Exodus 15:25). Then the manna: *At that time Yahuah (the Lord) gave the manna to the children of Israel to eat, and Yahuah (the Lord) caused food to rain from heaven for the children of Israel day by day.* (Jasher 81:48) — *Then said Yahuah (LORD) unto Moses, Behold, I will rain bread from heaven for you; and the people shall go out and gather a certain rate every day, that I may prove them, whether they will walk in my law, or no.* (Exodus 16:4) The statute given at Marah and the bread that proves whether Israel will walk in His law are one purpose: Torah is the way of the delivered seed, given before Sinai and standing. It ain''t new — not law-as-curse but the way to walk and live.',
       sv.verse_id, ev.verse_id, 'extras', 57012
  FROM _session252_ja81_lookup sv, _session252_ja81_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=81 AND sv.verse_number=45
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=81 AND ev.verse_number=49
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-81-amalek',
       E'Amalek at Rephidim — the memorial written, the remembrance to be blotted out',
       E'The book of Jasher ends on Amalek''s war and the memorial Moses writes against him: *And when the children of Israel were in Rephidim, Amalek the son of Eliphaz, the son of Esau, the brother of Zepho, came to fight with Israel.* (Jasher 81:52) — *Then came Amalek, and fought with Yashar''el (Israel) in Rephidim.* (Exodus 17:8) Yahuah delivers Amalek into the hand of Joshua and commands the memorial: *And Yahuah (the Lord) said to Moses, Write this thing as a memorial for you in a book, and place it in the hand of Joshua, the son of Nun, your servant...* (Jasher 81:56) — *And Yahuah (LORD) said unto Moses, Write this for a memorial in a book, and rehearse it in the ears of Joshua: for I will utterly put out the remembrance of Amalek from under heaven.* (Exodus 17:14) The words Jasher has Moses write are Deuteronomy''s own charge: *Remember what Amalek did unto thee by the way, when ye were come forth out of Egypt; How he met thee by the way, and smote the hindmost of thee, even all that were feeble behind thee...* (Deuteronomy 25:17-18) — *that thou shalt blot out the remembrance of Amalek from under heaven; thou shalt not forget it.* (Deuteronomy 25:19) Jasher''s last act is Moses writing the Torah-charge into a book; the conquest it points toward is Joshua''s. It ain''t new — the upright record ends pointing the seed forward to its inheritance.',
       sv.verse_id, ev.verse_id, 'extras', 57015
  FROM _session252_ja81_lookup sv, _session252_ja81_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=81 AND sv.verse_number=52
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=81 AND ev.verse_number=62
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-81-exodus-spoiling
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 12:37 — *And the children of Yashar''el (Israel) journeyed from Rameses to Succoth, about six hundred thousand on foot that were men, beside children.* The canon gives the identical muster and route that opens Jasher 81:1.'
  FROM cross_reference_threads t, cross_references x, _session252_ja81_lookup sv, _session252_ja81_lookup tv
 WHERE t.slug='jasher-81-exodus-spoiling'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=81 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 12:38 — *And a mixed multitude went up also with them; and flocks, and herds, even very much cattle.* The mixed multitude and the much cattle of Jasher 81:2 are Exodus verbatim.'
  FROM cross_reference_threads t, cross_references x, _session252_ja81_lookup sv, _session252_ja81_lookup tv
 WHERE t.slug='jasher-81-exodus-spoiling'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=81 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=38
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 15:14 — *And also that nation, whom they shall serve, will I judge: and afterward shall they come out with great substance.* The bringing-out with a strong hand in Jasher 81:4 keeps the word sworn to Abraham.'
  FROM cross_reference_threads t, cross_references x, _session252_ja81_lookup sv, _session252_ja81_lookup tv
 WHERE t.slug='jasher-81-exodus-spoiling'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=81 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Exodus 12:36 — *And Yahuah (LORD) gave the people favour in the sight of the Egyptians, so that they lent unto them such things as they required. And they spoiled the Egyptians.* The substance carried out with the multitude of Jasher 81:2 is the canon''s spoiling of Egypt.'
  FROM cross_reference_threads t, cross_references x, _session252_ja81_lookup sv, _session252_ja81_lookup tv
 WHERE t.slug='jasher-81-exodus-spoiling'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=81 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 48:19 — *And we did not lead forth the children of Yashar''el (Israel) from Egypt empty handed.* The Jubilees apparatus narrates the same delivered seed that Jasher 81:4 brings out with a strong hand.'
  FROM cross_reference_threads t, cross_references x, _session252_ja81_lookup sv, _session252_ja81_lookup tv
 WHERE t.slug='jasher-81-exodus-spoiling'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=81 AND sv.verse_number=4
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=48 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-81-pharaoh-pursues
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 33:4 — *For the Egyptians buried all their firstborn, which Yahuah (LORD) had smitten among them: upon their gods also Yahuah (LORD) executed judgments.* The three-day burial of Jasher 81:6 is the canon''s judgment on the gods of Egypt.'
  FROM cross_reference_threads t, cross_references x, _session252_ja81_lookup sv, _session252_ja81_lookup tv
 WHERE t.slug='jasher-81-pharaoh-pursues'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=81 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=33 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 14:14 — *Yahuah (LORD) shall fight for you, and ye shall hold your peace.* Jasher 81:21 has Yahuah harden Egypt only to overthrow her — the battle the canon promises is His.'
  FROM cross_reference_threads t, cross_references x, _session252_ja81_lookup sv, _session252_ja81_lookup tv
 WHERE t.slug='jasher-81-pharaoh-pursues'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=81 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=14 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 14:12 — *Is not this the word that we did tell thee in Egypt, saying, Let us alone, that we may serve the Egyptians? For it had been better for us to serve the Egyptians, than that we should die in the wilderness.* The mustered host bearing down on Israel in Jasher 81:22 is the dread the canon records at the sea.'
  FROM cross_reference_threads t, cross_references x, _session252_ja81_lookup sv, _session252_ja81_lookup tv
 WHERE t.slug='jasher-81-pharaoh-pursues'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=81 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=14 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 48:12 — *the prince of the Mastêmâ ... cried to the Egyptians to pursue after you with all the powers of the Egyptians, with their chariots, and with their horses ... And I stood between the Egyptians and Yashar''el (Israel), and we delivered Yashar''el (Israel) out of his hand ... and Yahuah (God) brought them through the midst of the sea as if it were dry land.* Jubilees tells the same pursuit that overtakes Israel at the sea in Jasher 81:24.'
  FROM cross_reference_threads t, cross_references x, _session252_ja81_lookup sv, _session252_ja81_lookup tv
 WHERE t.slug='jasher-81-pharaoh-pursues'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=81 AND sv.verse_number=24
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=48 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-81-red-sea-divided
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 14:13 — *And Moses said unto the people, Fear ye not, stand still, and see the salvation of Yahuah (LORD), which he will shew to you to day: for the Egyptians whom ye have seen to day, ye shall see them again no more for ever.* Moses'' charge in Jasher 81:28 is the canon''s stand-still word verbatim in substance.'
  FROM cross_reference_threads t, cross_references x, _session252_ja81_lookup sv, _session252_ja81_lookup tv
 WHERE t.slug='jasher-81-red-sea-divided'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=81 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=14 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 14:21 — *And Moses stretched out his hand over the sea; and Yahuah (LORD) caused the sea to go back by a strong east wind all that night, and made the sea dry land, and the waters were divided.* The rod lifted and the sea divided in Jasher 81:37 is the canon''s parting.'
  FROM cross_reference_threads t, cross_references x, _session252_ja81_lookup sv, _session252_ja81_lookup tv
 WHERE t.slug='jasher-81-red-sea-divided'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=81 AND sv.verse_number=37
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=14 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 14:28 — *And the waters returned, and covered the chariots, and the horsemen, and all the host of Pharaoh that came into the sea after them; there remained not so much as one of them.* The waters resuming on the Egyptians in Jasher 81:40 is the canon''s drowning of the host.'
  FROM cross_reference_threads t, cross_references x, _session252_ja81_lookup sv, _session252_ja81_lookup tv
 WHERE t.slug='jasher-81-red-sea-divided'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=81 AND sv.verse_number=40
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=14 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Exodus 14:30 — *Thus Yahuah (LORD) saved Yashar''el (Israel) that day out of the hand of the Egyptians; and Yashar''el (Israel) saw the Egyptians dead upon the sea shore.* Jasher 81:42 has Israel behold the great hand of Yahuah exactly as the canon''s deliverance day.'
  FROM cross_reference_threads t, cross_references x, _session252_ja81_lookup sv, _session252_ja81_lookup tv
 WHERE t.slug='jasher-81-red-sea-divided'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=81 AND sv.verse_number=42
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=14 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 48:14 — *And all the peoples whom he brought to pursue after Yashar''el (Israel), Yahuah our Elohim (the LORD our God) cast them into the midst of the sea, into the depths of the abyss beneath the children of Yashar''el (Israel)...* Jubilees narrates the same sinking host that Jasher 81:40 says sank in the water.'
  FROM cross_reference_threads t, cross_references x, _session252_ja81_lookup sv, _session252_ja81_lookup tv
 WHERE t.slug='jasher-81-red-sea-divided'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=81 AND sv.verse_number=40
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=48 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-81-song-of-moses
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 15:1 — *Then sang Moses and the children of Yashar''el (Israel) this song unto Yahuah (LORD), and spake, saying, I will sing unto Yahuah (LORD), for he hath triumphed gloriously: the horse and his rider hath he thrown into the sea.* Jasher 81:44 sings the canon''s song of the sea word for word.'
  FROM cross_reference_threads t, cross_references x, _session252_ja81_lookup sv, _session252_ja81_lookup tv
 WHERE t.slug='jasher-81-song-of-moses'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=81 AND sv.verse_number=44
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=15 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 15:3 — *And they sing the song of Moses the servant of Elohim (God), and the song of the Lamb, saying, Great and marvellous are thy works, Yahuah Elohim (Lord God) Almighty; just and true are thy ways, thou King of saints.* The song Moses sings in Jasher 81:43 is sung again over the last enemy at the sea of glass.'
  FROM cross_reference_threads t, cross_references x, _session252_ja81_lookup sv, _session252_ja81_lookup tv
 WHERE t.slug='jasher-81-song-of-moses'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=81 AND sv.verse_number=43
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=15 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-81-marah-manna
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 15:25 — *And he cried unto Yahuah (LORD); and Yahuah (LORD) shewed him a tree, which when he had cast into the waters, the waters were made sweet: there he made for them a statute and an ordinance, and there he proved them,* Jasher 81:45 names the same Marah where Yahuah gave statutes and judgments.'
  FROM cross_reference_threads t, cross_references x, _session252_ja81_lookup sv, _session252_ja81_lookup tv
 WHERE t.slug='jasher-81-marah-manna'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=81 AND sv.verse_number=45
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=15 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 16:4 — *Then said Yahuah (LORD) unto Moses, Behold, I will rain bread from heaven for you; and the people shall go out and gather a certain rate every day, that I may prove them, whether they will walk in my law, or no.* The food rained day by day in Jasher 81:48 is the canon''s manna that proves whether Israel will walk in His law.'
  FROM cross_reference_threads t, cross_references x, _session252_ja81_lookup sv, _session252_ja81_lookup tv
 WHERE t.slug='jasher-81-marah-manna'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=81 AND sv.verse_number=48
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=16 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-81-amalek
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 17:8 — *Then came Amalek, and fought with Yashar''el (Israel) in Rephidim.* Jasher 81:52 names the same Amalek warring with Israel at Rephidim.'
  FROM cross_reference_threads t, cross_references x, _session252_ja81_lookup sv, _session252_ja81_lookup tv
 WHERE t.slug='jasher-81-amalek'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=81 AND sv.verse_number=52
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=17 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 17:14 — *And Yahuah (LORD) said unto Moses, Write this for a memorial in a book, and rehearse it in the ears of Joshua: for I will utterly put out the remembrance of Amalek from under heaven.* The memorial book placed in Joshua''s hand in Jasher 81:56 is the canon''s command verbatim.'
  FROM cross_reference_threads t, cross_references x, _session252_ja81_lookup sv, _session252_ja81_lookup tv
 WHERE t.slug='jasher-81-amalek'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=81 AND sv.verse_number=56
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=17 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 25:18 — *How he met thee by the way, and smote the hindmost of thee, even all that were feeble behind thee, when thou wast faint and weary; and he feared not Elohim (God).* The words Moses writes in Jasher 81:59 are Deuteronomy''s charge about Amalek smiting the feeble behind.'
  FROM cross_reference_threads t, cross_references x, _session252_ja81_lookup sv, _session252_ja81_lookup tv
 WHERE t.slug='jasher-81-amalek'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=81 AND sv.verse_number=59
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=25 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Deuteronomy 25:19 — *Therefore it shall be, when Yahuah Elohayka (the LORD thy God) hath given thee rest from all thine enemies round about, in the land which Yahuah Elohayka (the LORD thy God) giveth thee for an inheritance to possess it, that thou shalt blot out the remembrance of Amalek from under heaven; thou shalt not forget it.* Jasher 81:60''s blotting-out in the land of inheritance is Deuteronomy''s charge word for word.'
  FROM cross_reference_threads t, cross_references x, _session252_ja81_lookup sv, _session252_ja81_lookup tv
 WHERE t.slug='jasher-81-amalek'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=81 AND sv.verse_number=60
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=25 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

