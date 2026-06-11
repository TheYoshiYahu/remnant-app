-- ----- fragment: minion_jasher_63.sql (session252 jasher 63) -----
-- Source anchor: jasher/jasher ch63. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja63 (view _session252_ja63_lookup). Sort band base 56550, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja63_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-63-brethren-die-bondage-begins
  ('jasher', 'jasher', 63, 2, 'canon', 'exodus', 1, 6, 'free', E'Exodus 1:6 — *And Joseph died, and all his brethren, and all that generation.* The canon marks the very hinge Jasher names — once the brethren of Joseph were dead, Egypt turned on Israel (Jasher 63:2).'),
  ('jasher', 'jasher', 63, 3, 'canon', 'exodus', 1, 14, 'free', E'Exodus 1:14 — *And they made their lives bitter with hard bondage, in morter, and in brick, and in all manner of service in the field: all their service, wherein they made them serve, was with rigour.* The same embittering Jasher reports that wearied Israel of their lives (Jasher 63:3).'),
  ('jasher', 'jasher', 63, 2, 'canon', 'genesis', 15, 13, 'free', E'Genesis 15:13 — *And he said unto Abram, Know of a surety that thy seed shall be a stranger in a land that is not theirs, and shall serve them; and they shall afflict them four hundred years;* the affliction ''from that day to the day of their going forth'' (Jasher 63:2) is the bondage foretold to Abraham.'),
  ('jasher', 'jasher', 63, 3, 'jubilees', 'jubilees', 46, 15, 'extras', E'Jubilees 46:15 — *And they made them serve with rigour, and the more they dealt evilly with them, the more they increased and multiplied.* Jubilees tells the same affliction after Joseph''s generation passed that Jasher 63:3 records.'),
  -- thread: jasher-63-new-king-knew-not-joseph
  ('jasher', 'jasher', 63, 4, 'canon', 'exodus', 1, 8, 'free', E'Exodus 1:8 — *Now there arose up a new king over Egypt, which knew not Joseph.* Jasher 63:4 names him Melol son of the dead Pharaoh, the generation that knew Joseph having passed.'),
  ('jasher', 'jasher', 63, 5, 'canon', 'acts', 7, 18, 'free', E'Acts 7:18 — *Till another king arose, which knew not Joseph.* Stephen names the same risen generation Jasher 63:5 describes as not knowing the sons of Jacob.'),
  ('jasher', 'jasher', 63, 6, 'canon', 'acts', 7, 19, 'free', E'Acts 7:19 — *The same dealt subtilly with our kindred, and evil entreated our fathers, so that they cast out their young children, to the end they might not live.* The embittering Jasher 63:6 says began ''from that day forth'' against the sons of Jacob.'),
  ('jasher', 'jasher', 63, 6, 'jubilees', 'jubilees', 46, 13, 'extras', E'Jubilees 46:13 — *“Behold the people of the children of Yashar’el (Israel) have increased and multiplied more than we. Come and let us deal wisely with them before they become too many, and let us afflict them with slavery before war come upon us and before they too fight against us; else they will join themselves to our enemies and get them up out of our land, for their hearts and faces are towards the land of Canaan.”* The same forgetting-king''s counsel to afflict the seed Jasher 63:6 records.'),
  -- thread: jasher-63-yahuah-purposes-the-affliction
  ('jasher', 'jasher', 63, 7, 'canon', 'genesis', 50, 20, 'free', E'Genesis 50:20 — *But as for you, ye thought evil against me; but Elohim (God) meant it unto good, to bring to pass, as it is this day, to save much people alive.* Joseph''s evil-meant-for-good is the same reading Jasher 63:7 gives the bondage itself.'),
  ('jasher', 'jasher', 63, 8, 'canon', 'acts', 7, 6, 'free', E'Acts 7:6 — *And Elohim (God) spake on this wise, That his seed should sojourn in a strange land; and that they should bring them into bondage, and entreat them evil four hundred years.* The bondage Jasher 63:8 says was ''from Yahuah'' to teach Israel His wonders is the sojourn foretold to Abraham.'),
  -- thread: jasher-63-bones-of-the-fathers
  ('jasher', 'jasher', 63, 1, 'canon', 'genesis', 50, 26, 'free', E'Genesis 50:26 — *So Joseph died, being an hundred and ten years old: and they embalmed him, and he was put in a coffin in Egypt.* Joseph''s coffin in Egypt mirrors Levi laid in a coffin and given to his children (Jasher 63:1).'),
  ('jasher', 'jasher', 63, 1, 'canon', 'exodus', 13, 19, 'free', E'Exodus 13:19 — *And Moses took the bones of Joseph with him: for he had straitly sworn the children of Yashar''el (Israel), saying, Elohim (God) will surely visit you; and ye shall carry up my bones away hence with you.* The fathers'' coffins Jasher 63:1 records are the bones carried up at the visitation.'),
  ('jasher', 'jasher', 63, 1, 'canon', 'hebrews', 11, 22, 'free', E'Hebrews 11:22 — *By faith Joseph, when he died, made mention of the departing of the children of Yashar''el (Israel); and gave commandment concerning his bones.* The faith that keeps a coffin against the visitation, of which Levi''s coffin (Jasher 63:1) is one.'),
  ('jasher', 'jasher', 63, 1, 'jubilees', 'jubilees', 46, 5, 'extras', E'Jubilees 46:5 — *And he commanded the children of Yashar’el (Israel) before he died that they should carry his bones with them when they went forth from the land of Egypt.* The same bones-oath that frames the fathers'' burials in Jasher 63:1.'),
  -- thread: jasher-63-esau-edom-set-apart
  ('jasher', 'jasher', 63, 19, 'canon', 'genesis', 36, 31, 'free', E'Genesis 36:31 — *And these are the kings that reigned in the land of Edom, before there reigned any king over the children of Yashar''el (Israel).* The Edomite kingship Jasher 63:19 dates ''from the days of Bela the first king'' is the canon''s record of Edom''s kings before Israel''s.'),
  ('jasher', 'jasher', 63, 19, 'canon', 'genesis', 36, 32, 'free', E'Genesis 36:32 — *And Bela the son of Beor reigned in Edom: and the name of his city was Dinhabah.* The very ''Bela the first king'' of Edom whom Jasher 63:19 names as the founder of Esau''s covenant of peace.'),
  ('jasher', 'jasher', 63, 16, 'canon', 'malachi', 1, 2, 'free', E'Malachi 1:2 — *I have loved you, saith Yahuah (LORD). Yet ye say, Wherein hast thou loved us? Was not Esau Jacob’s brother? saith Yahuah (LORD): yet I loved Jacob,* the election that sets apart the children of Esau (Jasher 63:16) from the chosen seed.'),
  ('jasher', 'jasher', 63, 16, 'canon', 'obadiah', 1, 10, 'free', E'Obadiah 1:10 — *For thy violence against thy brother Jacob shame shall cover thee, and thou shalt be cut off for ever.* The prophetic word over the Edom/Esau line whose kings Jasher 63:16 sets among the nations.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja63_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja63_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-63-brethren-die-bondage-begins',
       E'The brethren die and the bondage begins',
       E'Jasher closes the generation of Jacob''s sons and opens the affliction: *And it came to pass after the death of Levi, when all Egypt saw that the sons of Jacob the brethren of Joseph were dead, all the Egyptians began to afflict the children of Jacob, and to embitter their lives from that day to the day of their going forth from Egypt* (Jasher 63:2), and *the Egyptians injured the Israelites until the children of Israel were wearied of their lives on account of the Egyptians* (Jasher 63:3). This is Exodus 1 told from the inside. The canon marks the same hinge — the death of the founding generation: *And Joseph died, and all his brethren, and all that generation* (Exodus 1:6) — and then the same bitterness: *And they made their lives bitter with hard bondage, in morter, and in brick, and in all manner of service in the field: all their service, wherein they made them serve, was with rigour* (Exodus 1:14). Jubilees narrates the identical turn after Joseph''s death: *And they made them serve with rigour, and the more they dealt evilly with them, the more they increased and multiplied* (Jubilees 46:15). It ain''t new — the affliction Jasher dates ''from that day to the day of their going forth'' is the four-hundred-year bondage Yahuah had already sworn to Abram: *Know of a surety that thy seed shall be a stranger in a land that is not theirs, and shall serve them; and they shall afflict them four hundred years* (Genesis 15:13). The covenant seed is kept even under the lash.',
       sv.verse_id, ev.verse_id, 'extras', 56550
  FROM _session252_ja63_lookup sv, _session252_ja63_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=63 AND sv.verse_number=2
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=63 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-63-new-king-knew-not-joseph',
       E'A generation that knew not the sons of Jacob',
       E'Jasher names the king and the forgetting: *that Pharaoh king of Egypt died, and Melol his son reigned in his stead, and all the mighty men of Egypt and all that generation which knew Joseph and his brethren died in those days* (Jasher 63:4), *And another generation rose up in their stead, which had not known the sons of Jacob and all the good which they had done to them, and all their might in Egypt* (Jasher 63:5). The canon says it in one stroke: *Now there arose up a new king over Egypt, which knew not Joseph* (Exodus 1:8). Stephen rehearses the same in Acts: *Till another king arose, which knew not Joseph* (Acts 7:18), and *The same dealt subtilly with our kindred, and evil entreated our fathers* (Acts 7:19) — Jasher''s ''began from that day forth to embitter the lives of the sons of Jacob'' (63:6). Jubilees too marks the new king and the wise dealing: *Behold the people of the children of Yashar''el (Israel) have increased and multiplied more than we. Come and let us deal wisely with them before they become too many, and let us afflict them with slavery before war come upon us...* (Jubilees 46:13). The kingdom of man forgets the seed it once welcomed; the covenant does not forget.',
       sv.verse_id, ev.verse_id, 'extras', 56553
  FROM _session252_ja63_lookup sv, _session252_ja63_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=63 AND sv.verse_number=4
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=63 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-63-yahuah-purposes-the-affliction',
       E'The affliction was also from Yahuah, to His people''s good',
       E'Jasher reads the bondage with the eyes of faith: *And this was also from Yahuah (the Lord), for the children of Israel, to benefit them in their latter days, in order that all the children of Israel might know Yahuah their Elohim (the Lord their God)* (Jasher 63:7), *And in order to know the signs and mighty wonders which Yahuah (the Lord) would do in Egypt on account of his people Israel...that the children of Israel might fear Yahuah Elohim (the Lord God) of their ancestors, and walk in all his ways, they and their seed after them all the days* (Jasher 63:8). This is Joseph''s own theology of evil-meant-for-good carried forward: *But as for you, ye thought evil against me; but Elohim (God) meant it unto good, to bring to pass, as it is this day, to save much people alive* (Genesis 50:20). And it is the affliction Abram was shown would end in deliverance, that the seed might fear and walk in His ways — *that his seed should sojourn in a strange land; and that they should bring them into bondage, and entreat them evil four hundred years* (Acts 7:6). Even the iron furnace is election keeping its people; Torah and the walk in His ways stand on the far side of it.',
       sv.verse_id, ev.verse_id, 'extras', 56556
  FROM _session252_ja63_lookup sv, _session252_ja63_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=63 AND sv.verse_number=7
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=63 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-63-bones-of-the-fathers',
       E'Levi laid in a coffin, the fathers'' bones kept for the visitation',
       E'Jasher opens with a burial: *And in the ninety-third year died Levi, the son of Jacob, in Egypt...and they put him into a coffin and he was given into the hands of his children* (Jasher 63:1). Joseph''s own burial in the canon ends the same way, and binds the bones to the promised visitation: *So Joseph died, being an hundred and ten years old: and they embalmed him, and he was put in a coffin in Egypt* (Genesis 50:26), having charged — *Elohim (God) will surely visit you, and ye shall carry up my bones from hence* (Genesis 50:25). The oath was kept at the Exodus: *And Moses took the bones of Joseph with him: for he had straitly sworn the children of Yashar''el (Israel), saying, Elohim (God) will surely visit you; and ye shall carry up my bones away hence with you* (Exodus 13:19). The letter to the Hebrews crowns it as faith reaching past the grave to the promise: *By faith Joseph, when he died, made mention of the departing of the children of Yashar''el (Israel); and gave commandment concerning his bones* (Hebrews 11:22). Jubilees keeps the same oath: *And he commanded the children of Yashar’el (Israel) before he died that they should carry his bones with them when they went forth from the land of Egypt* (Jubilees 46:5). The coffin in Egypt is not an ending — it is a deposit on the visitation.',
       sv.verse_id, ev.verse_id, 'extras', 56559
  FROM _session252_ja63_lookup sv, _session252_ja63_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=63 AND sv.verse_number=1
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=63 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-63-esau-edom-set-apart',
       E'The children of Esau and Edom''s kings, set apart',
       E'Jasher''s long war-legend (Zepho son of Eliphaz, Angeas of Africa, the children of Chittim) is its own expansion with no canon scene behind it; but where it touches the line of Esau it touches genuine canon. Zepho appeals to Edom: *And the children of Esau sent a letter to the children of Chittim and to Zepho their king, saying, We cannot fight against Angeas and his people for a covenant of peace has been between us these many years, from the days of Bela the first king...* (Jasher 63:19) — and the canon already records that Edom had crowned kings before Israel did: *And these are the kings that reigned in the land of Edom, before there reigned any king over the children of Yashar''el (Israel)* (Genesis 36:31), *And Bela the son of Beor reigned in Edom: and the name of his city was Dinhabah* (Genesis 36:32). This is the line of Esau set apart from the elect seed — *I have loved you, saith Yahuah (LORD). Yet ye say, Wherein hast thou loved us? Was not Esau Jacob’s brother? saith Yahuah (LORD): yet I loved Jacob,* (Malachi 1:2) — and reserved for the prophets'' word against Edom: *For thy violence against thy brother Jacob shame shall cover thee, and thou shalt be cut off for ever* (Obadiah 1:10). Election precedes the wars: the seed Jasher follows into Egypt is Jacob''s, not Esau''s.',
       sv.verse_id, ev.verse_id, 'extras', 56562
  FROM _session252_ja63_lookup sv, _session252_ja63_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=63 AND sv.verse_number=16
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=63 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-63-brethren-die-bondage-begins
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 1:6 — *And Joseph died, and all his brethren, and all that generation.* The canon marks the very hinge Jasher names — once the brethren of Joseph were dead, Egypt turned on Israel (Jasher 63:2).'
  FROM cross_reference_threads t, cross_references x, _session252_ja63_lookup sv, _session252_ja63_lookup tv
 WHERE t.slug='jasher-63-brethren-die-bondage-begins'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=63 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 1:14 — *And they made their lives bitter with hard bondage, in morter, and in brick, and in all manner of service in the field: all their service, wherein they made them serve, was with rigour.* The same embittering Jasher reports that wearied Israel of their lives (Jasher 63:3).'
  FROM cross_reference_threads t, cross_references x, _session252_ja63_lookup sv, _session252_ja63_lookup tv
 WHERE t.slug='jasher-63-brethren-die-bondage-begins'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=63 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 15:13 — *And he said unto Abram, Know of a surety that thy seed shall be a stranger in a land that is not theirs, and shall serve them; and they shall afflict them four hundred years;* the affliction ''from that day to the day of their going forth'' (Jasher 63:2) is the bondage foretold to Abraham.'
  FROM cross_reference_threads t, cross_references x, _session252_ja63_lookup sv, _session252_ja63_lookup tv
 WHERE t.slug='jasher-63-brethren-die-bondage-begins'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=63 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 46:15 — *And they made them serve with rigour, and the more they dealt evilly with them, the more they increased and multiplied.* Jubilees tells the same affliction after Joseph''s generation passed that Jasher 63:3 records.'
  FROM cross_reference_threads t, cross_references x, _session252_ja63_lookup sv, _session252_ja63_lookup tv
 WHERE t.slug='jasher-63-brethren-die-bondage-begins'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=63 AND sv.verse_number=3
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=46 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-63-new-king-knew-not-joseph
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 1:8 — *Now there arose up a new king over Egypt, which knew not Joseph.* Jasher 63:4 names him Melol son of the dead Pharaoh, the generation that knew Joseph having passed.'
  FROM cross_reference_threads t, cross_references x, _session252_ja63_lookup sv, _session252_ja63_lookup tv
 WHERE t.slug='jasher-63-new-king-knew-not-joseph'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=63 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Acts 7:18 — *Till another king arose, which knew not Joseph.* Stephen names the same risen generation Jasher 63:5 describes as not knowing the sons of Jacob.'
  FROM cross_reference_threads t, cross_references x, _session252_ja63_lookup sv, _session252_ja63_lookup tv
 WHERE t.slug='jasher-63-new-king-knew-not-joseph'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=63 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 7:19 — *The same dealt subtilly with our kindred, and evil entreated our fathers, so that they cast out their young children, to the end they might not live.* The embittering Jasher 63:6 says began ''from that day forth'' against the sons of Jacob.'
  FROM cross_reference_threads t, cross_references x, _session252_ja63_lookup sv, _session252_ja63_lookup tv
 WHERE t.slug='jasher-63-new-king-knew-not-joseph'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=63 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 46:13 — *“Behold the people of the children of Yashar’el (Israel) have increased and multiplied more than we. Come and let us deal wisely with them before they become too many, and let us afflict them with slavery before war come upon us and before they too fight against us; else they will join themselves to our enemies and get them up out of our land, for their hearts and faces are towards the land of Canaan.”* The same forgetting-king''s counsel to afflict the seed Jasher 63:6 records.'
  FROM cross_reference_threads t, cross_references x, _session252_ja63_lookup sv, _session252_ja63_lookup tv
 WHERE t.slug='jasher-63-new-king-knew-not-joseph'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=63 AND sv.verse_number=6
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=46 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-63-yahuah-purposes-the-affliction
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 50:20 — *But as for you, ye thought evil against me; but Elohim (God) meant it unto good, to bring to pass, as it is this day, to save much people alive.* Joseph''s evil-meant-for-good is the same reading Jasher 63:7 gives the bondage itself.'
  FROM cross_reference_threads t, cross_references x, _session252_ja63_lookup sv, _session252_ja63_lookup tv
 WHERE t.slug='jasher-63-yahuah-purposes-the-affliction'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=63 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=50 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Acts 7:6 — *And Elohim (God) spake on this wise, That his seed should sojourn in a strange land; and that they should bring them into bondage, and entreat them evil four hundred years.* The bondage Jasher 63:8 says was ''from Yahuah'' to teach Israel His wonders is the sojourn foretold to Abraham.'
  FROM cross_reference_threads t, cross_references x, _session252_ja63_lookup sv, _session252_ja63_lookup tv
 WHERE t.slug='jasher-63-yahuah-purposes-the-affliction'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=63 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-63-bones-of-the-fathers
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 50:26 — *So Joseph died, being an hundred and ten years old: and they embalmed him, and he was put in a coffin in Egypt.* Joseph''s coffin in Egypt mirrors Levi laid in a coffin and given to his children (Jasher 63:1).'
  FROM cross_reference_threads t, cross_references x, _session252_ja63_lookup sv, _session252_ja63_lookup tv
 WHERE t.slug='jasher-63-bones-of-the-fathers'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=63 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=50 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 13:19 — *And Moses took the bones of Joseph with him: for he had straitly sworn the children of Yashar''el (Israel), saying, Elohim (God) will surely visit you; and ye shall carry up my bones away hence with you.* The fathers'' coffins Jasher 63:1 records are the bones carried up at the visitation.'
  FROM cross_reference_threads t, cross_references x, _session252_ja63_lookup sv, _session252_ja63_lookup tv
 WHERE t.slug='jasher-63-bones-of-the-fathers'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=63 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=13 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 11:22 — *By faith Joseph, when he died, made mention of the departing of the children of Yashar''el (Israel); and gave commandment concerning his bones.* The faith that keeps a coffin against the visitation, of which Levi''s coffin (Jasher 63:1) is one.'
  FROM cross_reference_threads t, cross_references x, _session252_ja63_lookup sv, _session252_ja63_lookup tv
 WHERE t.slug='jasher-63-bones-of-the-fathers'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=63 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 46:5 — *And he commanded the children of Yashar’el (Israel) before he died that they should carry his bones with them when they went forth from the land of Egypt.* The same bones-oath that frames the fathers'' burials in Jasher 63:1.'
  FROM cross_reference_threads t, cross_references x, _session252_ja63_lookup sv, _session252_ja63_lookup tv
 WHERE t.slug='jasher-63-bones-of-the-fathers'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=63 AND sv.verse_number=1
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=46 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-63-esau-edom-set-apart
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 36:31 — *And these are the kings that reigned in the land of Edom, before there reigned any king over the children of Yashar''el (Israel).* The Edomite kingship Jasher 63:19 dates ''from the days of Bela the first king'' is the canon''s record of Edom''s kings before Israel''s.'
  FROM cross_reference_threads t, cross_references x, _session252_ja63_lookup sv, _session252_ja63_lookup tv
 WHERE t.slug='jasher-63-esau-edom-set-apart'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=63 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=36 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 36:32 — *And Bela the son of Beor reigned in Edom: and the name of his city was Dinhabah.* The very ''Bela the first king'' of Edom whom Jasher 63:19 names as the founder of Esau''s covenant of peace.'
  FROM cross_reference_threads t, cross_references x, _session252_ja63_lookup sv, _session252_ja63_lookup tv
 WHERE t.slug='jasher-63-esau-edom-set-apart'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=63 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=36 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Malachi 1:2 — *I have loved you, saith Yahuah (LORD). Yet ye say, Wherein hast thou loved us? Was not Esau Jacob’s brother? saith Yahuah (LORD): yet I loved Jacob,* the election that sets apart the children of Esau (Jasher 63:16) from the chosen seed.'
  FROM cross_reference_threads t, cross_references x, _session252_ja63_lookup sv, _session252_ja63_lookup tv
 WHERE t.slug='jasher-63-esau-edom-set-apart'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=63 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=1 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Obadiah 1:10 — *For thy violence against thy brother Jacob shame shall cover thee, and thou shalt be cut off for ever.* The prophetic word over the Edom/Esau line whose kings Jasher 63:16 sets among the nations.'
  FROM cross_reference_threads t, cross_references x, _session252_ja63_lookup sv, _session252_ja63_lookup tv
 WHERE t.slug='jasher-63-esau-edom-set-apart'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=63 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='obadiah' AND tv.chapter_number=1 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

