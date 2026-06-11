-- ----- fragment: minion_1enoch_107.sql (session250 1-enoch 107) -----
-- Source anchor: enoch/1-enoch ch107. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en107 (view _session250_en107_lookup). Sort band base 52650, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en107_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-107-noah-sign-of-salvation
  ('enoch', '1-enoch', 107, 5, 'canon', 'genesis', 6, 8, 'free', E'Genesis 6:8 — *But Noah found grace in the eyes of Yahuah (LORD).* The child born as a sign of salvation in Enoch 107:5 is the same Noah on whom grace already rests before the Flood falls.'),
  ('enoch', '1-enoch', 107, 7, 'canon', 'genesis', 6, 9, 'free', E'Genesis 6:9 — *These are the generations of Noah: Noah was a just man and perfect in his generations, and Noah walked with Elohim (God).* Enoch''s "he is righteous, And Elohim (God) has chosen him" (107:7) is Genesis'' "just man and perfect" — election precedes preservation.'),
  ('enoch', '1-enoch', 107, 7, 'canon', 'genesis', 7, 1, 'free', E'Genesis 7:1 — *And Yahuah (LORD) said unto Noah, Come thou and all thy house into the ark; for thee have I seen righteous before me in this generation.* Enoch''s "chosen him to be preserved When the earth is cleansed by water" (107:7) is the LORD''s own "thee have I seen righteous."'),
  ('enoch', '1-enoch', 107, 5, 'jubilees', 'jubilees', 5, 19, 'extras', E'Jubilees 5:19 — *And as for all those who corrupted their ways and their thoughts before the flood, no man''s person was accepted save that of Noah alone; for his person was accepted in behalf of his sons, whom Elohim (God) saved from the waters of the flood on his account; for his heart was righteous in all his ways, according as it was commanded regarding him, and he had not departed from aught that was ordained for him.* The same chosen-one-through-the-waters that Enoch announces at 107:5, with Noah''s sons preserved on his account.'),
  -- thread: 1-enoch-107-plant-of-righteousness-remnant
  ('enoch', '1-enoch', 107, 6, 'enoch', '1-enoch', 10, 16, 'extras', E'1 Enoch 10:16 — *Destroy all wrong from the face of the earth and let every evil work come to an end: and let the plant of righteousness and truth appear: and it shall prove a blessing; the works of righteousness and truth'' shall be planted in truth and joy for evermore.* The "plant of righteousness" promised at the Watchers'' judgement is the very seed Enoch now sees preserved in Noah (107:6).'),
  ('enoch', '1-enoch', 107, 9, 'canon', 'matthew', 24, 37, 'free', E'Matthew 24:37 — *But as the days of Noe were, so shall also the coming of the Son of Adam be.* Noah''s preserved remnant repopulating the earth with righteousness (107:9) becomes the Messiah''s sign of His own coming judgement and rescue.'),
  ('enoch', '1-enoch', 107, 6, 'canon', '2-peter', 2, 5, 'free', E'2 Peter 2:5 — *And spared not the old world, but saved Noah the eighth person, a preacher of righteousness, bringing in the flood upon the world of the ungodly;* Noah preserved with his seed as a righteous remnant (107:6) is the canon''s "preacher of righteousness" saved through the flood.'),
  -- thread: 1-enoch-107-watchers-violence-judgment
  ('enoch', '1-enoch', 107, 8, 'canon', 'genesis', 6, 11, 'free', E'Genesis 6:11 — *The earth also was corrupt before Elohim (God), and the earth was filled with violence.* Enoch''s "the earth is filled with violence because of them" (107:8) is Genesis'' identical indictment of the Watcher-corrupted world.'),
  ('enoch', '1-enoch', 107, 8, 'canon', 'genesis', 6, 13, 'free', E'Genesis 6:13 — *And Elohim (God) said unto Noah, The end of all flesh is come before me; for the earth is filled with violence through them; and, behold, I will destroy them with the earth.* The "judgment comes upon them and upon all flesh" of Enoch 107:8 is the LORD''s sentence of "the end of all flesh."'),
  ('enoch', '1-enoch', 107, 8, 'jubilees', 'jubilees', 5, 2, 'extras', E'Jubilees 5:2 — *And lawlessness increased on the earth and all flesh corrupted its way, alike men and cattle and beasts and birds and everything that walks on the earth-all of them corrupted their ways and their orders, and they began to devour each other, and lawlessness increased on the earth and every imagination of the thoughts of all men (was) thus evil continually.* The violence the Watchers bred in Enoch 107:8 is Jubilees'' rising lawlessness that triggers the Flood.'),
  -- thread: 1-enoch-107-this-one-shall-comfort-us
  ('enoch', '1-enoch', 107, 10, 'canon', 'genesis', 5, 29, 'free', E'Genesis 5:29 — *And he called his name Noah, saying, This same shall comfort us concerning our work and toil of our hands, because of the ground which Yahuah (LORD) hath cursed.* Lamech''s naming-speech in Enoch 107:10 is verbatim the Genesis naming of Noah.'),
  ('enoch', '1-enoch', 107, 10, 'jubilees', 'jubilees', 4, 28, 'extras', E'Jubilees 4:28 — *And in the fifteenth jubilee in the third week Lamech took to himself a wife, and her name was Bêtênôs the daughter of Bârâkî''îl, the daughter of his father''s brother, and in this week she bare him a son and he called his name Noah, saying, "This one will comfort me for my trouble and all my work, and for the ground which Yahuah (God) has cursed."* Jubilees gives the same Lamech naming-speech that crowns Enoch 107:10.'),
  ('enoch', '1-enoch', 107, 7, 'canon', 'hebrews', 11, 7, 'free', E'Hebrews 11:7 — *By faith Noah, being warned of Elohim (God) of things not seen as yet, moved with fear, prepared an ark to the saving of his house; by the which he condemned the world, and became heir of the righteousness which is by faith.* The righteous child chosen to be preserved (107:7) is the Noah Hebrews names "heir of the righteousness which is by faith."')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en107_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en107_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-107-noah-sign-of-salvation',
       E'A sign of salvation: the child preserved through the destruction',
       E'Enoch sends word back to Lamech through Methuselah: *"For this child is born to you as a sign of salvation, And he shall be preserved in the midst of the destruction Which is coming upon the whole earth because of all the sin And all the unrighteousness which shall be wrought upon it"* (1 Enoch 107:5). The strange wondrous child is no cause for fear but the very vessel of deliverance — the preserved righteous seed kept through the Flood. Genesis names the same grace: *"But Noah found grace in the eyes of Yahuah (LORD)"* (Genesis 6:8), and *"These are the generations of Noah: Noah was a just man and perfect in his generations, and Noah walked with Elohim (God)"* (Genesis 6:9). The verdict is pronounced over him face to face: *"And Yahuah (LORD) said unto Noah, Come thou and all thy house into the ark; for thee have I seen righteous before me in this generation"* (Genesis 7:1). Election precedes the rescue — Elohim chooses the righteous one and keeps him through the water, never frames the keeping as merit added after, but as grace already seen. Jubilees holds the same: *"no man''s person was accepted save that of Noah alone; for his person was accepted in behalf of his sons, whom Elohim (God) saved from the waters of the flood on his account; for his heart was righteous in all his ways"* (Jubilees 5:19).',
       sv.verse_id, ev.verse_id, 'extras', 52650
  FROM _session250_en107_lookup sv, _session250_en107_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=107 AND sv.verse_number=4
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=107 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-107-plant-of-righteousness-remnant',
       E'A righteous remnant and a plant of righteousness',
       E'Enoch names the child and his destiny in one breath: *"And the child shall be called Noah, And he shall be preserved, And his seed shall be preserved for generations, And from him shall come forth a righteous remnant And a plant of righteousness, And the earth shall be cleansed from all corruption"* (1 Enoch 107:6), and again *"But Noah and his seed shall be a remnant, And from them shall the earth be repopulated with righteousness"* (107:9). This is the eternal plant of righteousness already declared at the Watchers'' judgement: *"Destroy all wrong from the face of the earth and let every evil work come to an end: and let the plant of righteousness and truth appear: and it shall prove a blessing; the works of righteousness and truth'' shall be planted in truth and joy for evermore"* (1 Enoch 10:16). The seed-line of the elect runs through Noah — the remnant kept across the judgement, the line by which the earth is replanted. It is the same hope the Messiah set against His own coming: *"But as the days of Noe were, so shall also the coming of the Son of Adam be"* (Matthew 24:37) — one righteous house preserved while the flood takes all the rest.',
       sv.verse_id, ev.verse_id, 'extras', 52653
  FROM _session250_en107_lookup sv, _session250_en107_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=107 AND sv.verse_number=6
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=107 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-107-watchers-violence-judgment',
       E'The Watchers taught unrighteousness; the earth filled with violence',
       E'Enoch gives the reason the judgement must come: *"And the Watchers have taught unrighteousness, And the earth is filled with violence because of them, Therefore judgment comes upon them and upon all flesh"* (1 Enoch 107:8). This is the canon''s own Genesis 6 verdict, word for word in substance: *"The earth also was corrupt before Elohim (God), and the earth was filled with violence"* (Genesis 6:11), and the sentence that follows: *"And Elohim (God) said unto Noah, The end of all flesh is come before me; for the earth is filled with violence through them; and, behold, I will destroy them with the earth"* (Genesis 6:13). The Flood is not arbitrary wrath but the answer to the Watchers'' rebellion against the Creator''s order — the forbidden teaching that corrupted all flesh. Jubilees names the same flood-tide of lawlessness: *"And lawlessness increased on the earth and all flesh corrupted its way... and they began to devour each other, and lawlessness increased on the earth"* (Jubilees 5:2). The judgement falls on the corrupting system, and the one righteous house is kept through it.',
       sv.verse_id, ev.verse_id, 'extras', 52656
  FROM _session250_en107_lookup sv, _session250_en107_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=107 AND sv.verse_number=8
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=107 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-107-this-one-shall-comfort-us',
       E'This one shall comfort us: Lamech names Noah',
       E'When Methuselah carries Enoch''s word, Lamech''s fear turns to comfort and he names the child: *"And Methuselah went and told Lamech all that Enoch had spoken, And Lamech was comforted, And he named the child Noah, saying: ''This one shall comfort us concerning our work And the toil of our hands, Because of the ground which Yahuah (God) has cursed''"* (1 Enoch 107:10). This is the naming straight out of Genesis: *"And he called his name Noah, saying, This same shall comfort us concerning our work and toil of our hands, because of the ground which Yahuah (LORD) hath cursed"* (Genesis 5:29). Jubilees records the same words from Lamech''s mouth: *"and he called his name Noah, saying, ''This one will comfort me for my trouble and all my work, and for the ground which Yahuah (God) has cursed''"* (Jubilees 4:28). The righteous seed preserved through the Flood is also the comfort of the cursed ground — the line by which Hebrews says the world was condemned and the heir of righteousness named: *"By faith Noah, being warned of Elohim (God) of things not seen as yet, moved with fear, prepared an ark to the saving of his house; by the which he condemned the world, and became heir of the righteousness which is by faith"* (Hebrews 11:7).',
       sv.verse_id, ev.verse_id, 'extras', 52659
  FROM _session250_en107_lookup sv, _session250_en107_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=107 AND sv.verse_number=10
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=107 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-107-noah-sign-of-salvation
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:8 — *But Noah found grace in the eyes of Yahuah (LORD).* The child born as a sign of salvation in Enoch 107:5 is the same Noah on whom grace already rests before the Flood falls.'
  FROM cross_reference_threads t, cross_references x, _session250_en107_lookup sv, _session250_en107_lookup tv
 WHERE t.slug='1-enoch-107-noah-sign-of-salvation'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=107 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 6:9 — *These are the generations of Noah: Noah was a just man and perfect in his generations, and Noah walked with Elohim (God).* Enoch''s "he is righteous, And Elohim (God) has chosen him" (107:7) is Genesis'' "just man and perfect" — election precedes preservation.'
  FROM cross_reference_threads t, cross_references x, _session250_en107_lookup sv, _session250_en107_lookup tv
 WHERE t.slug='1-enoch-107-noah-sign-of-salvation'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=107 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 7:1 — *And Yahuah (LORD) said unto Noah, Come thou and all thy house into the ark; for thee have I seen righteous before me in this generation.* Enoch''s "chosen him to be preserved When the earth is cleansed by water" (107:7) is the LORD''s own "thee have I seen righteous."'
  FROM cross_reference_threads t, cross_references x, _session250_en107_lookup sv, _session250_en107_lookup tv
 WHERE t.slug='1-enoch-107-noah-sign-of-salvation'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=107 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=7 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 5:19 — *And as for all those who corrupted their ways and their thoughts before the flood, no man''s person was accepted save that of Noah alone; for his person was accepted in behalf of his sons, whom Elohim (God) saved from the waters of the flood on his account; for his heart was righteous in all his ways, according as it was commanded regarding him, and he had not departed from aught that was ordained for him.* The same chosen-one-through-the-waters that Enoch announces at 107:5, with Noah''s sons preserved on his account.'
  FROM cross_reference_threads t, cross_references x, _session250_en107_lookup sv, _session250_en107_lookup tv
 WHERE t.slug='1-enoch-107-noah-sign-of-salvation'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=107 AND sv.verse_number=5
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=5 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-107-plant-of-righteousness-remnant
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 10:16 — *Destroy all wrong from the face of the earth and let every evil work come to an end: and let the plant of righteousness and truth appear: and it shall prove a blessing; the works of righteousness and truth'' shall be planted in truth and joy for evermore.* The "plant of righteousness" promised at the Watchers'' judgement is the very seed Enoch now sees preserved in Noah (107:6).'
  FROM cross_reference_threads t, cross_references x, _session250_en107_lookup sv, _session250_en107_lookup tv
 WHERE t.slug='1-enoch-107-plant-of-righteousness-remnant'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=107 AND sv.verse_number=6
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 24:37 — *But as the days of Noe were, so shall also the coming of the Son of Adam be.* Noah''s preserved remnant repopulating the earth with righteousness (107:9) becomes the Messiah''s sign of His own coming judgement and rescue.'
  FROM cross_reference_threads t, cross_references x, _session250_en107_lookup sv, _session250_en107_lookup tv
 WHERE t.slug='1-enoch-107-plant-of-righteousness-remnant'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=107 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Peter 2:5 — *And spared not the old world, but saved Noah the eighth person, a preacher of righteousness, bringing in the flood upon the world of the ungodly;* Noah preserved with his seed as a righteous remnant (107:6) is the canon''s "preacher of righteousness" saved through the flood.'
  FROM cross_reference_threads t, cross_references x, _session250_en107_lookup sv, _session250_en107_lookup tv
 WHERE t.slug='1-enoch-107-plant-of-righteousness-remnant'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=107 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-107-watchers-violence-judgment
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:11 — *The earth also was corrupt before Elohim (God), and the earth was filled with violence.* Enoch''s "the earth is filled with violence because of them" (107:8) is Genesis'' identical indictment of the Watcher-corrupted world.'
  FROM cross_reference_threads t, cross_references x, _session250_en107_lookup sv, _session250_en107_lookup tv
 WHERE t.slug='1-enoch-107-watchers-violence-judgment'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=107 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 6:13 — *And Elohim (God) said unto Noah, The end of all flesh is come before me; for the earth is filled with violence through them; and, behold, I will destroy them with the earth.* The "judgment comes upon them and upon all flesh" of Enoch 107:8 is the LORD''s sentence of "the end of all flesh."'
  FROM cross_reference_threads t, cross_references x, _session250_en107_lookup sv, _session250_en107_lookup tv
 WHERE t.slug='1-enoch-107-watchers-violence-judgment'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=107 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 5:2 — *And lawlessness increased on the earth and all flesh corrupted its way, alike men and cattle and beasts and birds and everything that walks on the earth-all of them corrupted their ways and their orders, and they began to devour each other, and lawlessness increased on the earth and every imagination of the thoughts of all men (was) thus evil continually.* The violence the Watchers bred in Enoch 107:8 is Jubilees'' rising lawlessness that triggers the Flood.'
  FROM cross_reference_threads t, cross_references x, _session250_en107_lookup sv, _session250_en107_lookup tv
 WHERE t.slug='1-enoch-107-watchers-violence-judgment'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=107 AND sv.verse_number=8
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=5 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-107-this-one-shall-comfort-us
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 5:29 — *And he called his name Noah, saying, This same shall comfort us concerning our work and toil of our hands, because of the ground which Yahuah (LORD) hath cursed.* Lamech''s naming-speech in Enoch 107:10 is verbatim the Genesis naming of Noah.'
  FROM cross_reference_threads t, cross_references x, _session250_en107_lookup sv, _session250_en107_lookup tv
 WHERE t.slug='1-enoch-107-this-one-shall-comfort-us'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=107 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jubilees 4:28 — *And in the fifteenth jubilee in the third week Lamech took to himself a wife, and her name was Bêtênôs the daughter of Bârâkî''îl, the daughter of his father''s brother, and in this week she bare him a son and he called his name Noah, saying, "This one will comfort me for my trouble and all my work, and for the ground which Yahuah (God) has cursed."* Jubilees gives the same Lamech naming-speech that crowns Enoch 107:10.'
  FROM cross_reference_threads t, cross_references x, _session250_en107_lookup sv, _session250_en107_lookup tv
 WHERE t.slug='1-enoch-107-this-one-shall-comfort-us'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=107 AND sv.verse_number=10
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 11:7 — *By faith Noah, being warned of Elohim (God) of things not seen as yet, moved with fear, prepared an ark to the saving of his house; by the which he condemned the world, and became heir of the righteousness which is by faith.* The righteous child chosen to be preserved (107:7) is the Noah Hebrews names "heir of the righteousness which is by faith."'
  FROM cross_reference_threads t, cross_references x, _session250_en107_lookup sv, _session250_en107_lookup tv
 WHERE t.slug='1-enoch-107-this-one-shall-comfort-us'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=107 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

