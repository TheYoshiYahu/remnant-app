-- ----- fragment: minion_jasher_13.sql (session252 jasher 13) -----
-- Source anchor: jasher/jasher ch13. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja13 (view _session252_ja13_lookup). Sort band base 55300, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja13_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-13-out-of-haran
  ('jasher', 'jasher', 13, 1, 'canon', 'acts', 7, 2, 'free', E'Acts 7:2 — *And he said, Men, brethren, and fathers, hearken; The Elohim (God) of glory appeared unto our father Abraham, when he was in Mesopotamia, before he dwelt in Charran* — Stephen sets the same Ur-to-Haran migration that opens Jasher 13:1 at the head of the gospel story.'),
  ('jasher', 'jasher', 13, 1, 'canon', 'acts', 7, 4, 'free', E'Acts 7:4 — *Then came he out of the land of the Chaldæans, and dwelt in Charran: and from thence, when his father was dead, he removed him into this land, wherein ye now dwell* — the very Ur-Casdim-to-Haran-to-Canaan route Terah''s household travels in Jasher 13:1.'),
  ('jasher', 'jasher', 13, 2, 'canon', 'joshua', 24, 2, 'free', E'Joshua 24:2 — *And Joshua said unto all the people, Thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel), Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods* — names the idolatry the seed Abram teaches against in Haran (Jasher 13:2) was called out of.'),
  ('jasher', 'jasher', 13, 5, 'canon', 'joshua', 24, 3, 'free', E'Joshua 24:3 — *And I took your father Abraham from the other side of the flood, and led him throughout all the land of Canaan, and multiplied his seed, and gave him Isaac* — election precedes confession: the same going-up to Canaan Abram makes at Yahuah''s word in Jasher 13:5.'),
  ('jasher', 'jasher', 13, 1, 'jubilees', 'jubilees', 12, 28, 'extras', E'Jubilees 12:28 — *And it came to pass in the seventh year of the sixth week that he spoke to his father, and informed him that he would leave Haran to go into the land of Canaan to see it and return to him...* — the Jubilees apparatus keeps the same Haran stop on the road to Canaan that opens Jasher 13:1.'),
  -- thread: jasher-13-keep-my-commandments
  ('jasher', 'jasher', 13, 4, 'canon', 'genesis', 15, 5, 'free', E'Genesis 15:5 — *And he brought him forth abroad, and said, Look now toward heaven, and tell the stars, if thou be able to number them: and he said unto him, So shall thy seed be* — the seed-like-the-stars promise Yahuah binds to keeping his commandments in Jasher 13:4.'),
  ('jasher', 'jasher', 13, 4, 'canon', 'genesis', 15, 6, 'free', E'Genesis 15:6 — *And he believed in Yahuah (LORD); and he counted it to him for righteousness* — Abram''s faith answers the same star-multiplied promise spoken over him in Jasher 13:4.'),
  ('jasher', 'jasher', 13, 4, 'canon', 'hebrews', 11, 8, 'free', E'Hebrews 11:8 — *By faith Abraham, when he was called to go out into a place which he should after receive for an inheritance, obeyed; and he went out, not knowing whither he went* — the obedience to Yahuah''s voice that Jasher 13:4 lays as the condition of the blessing.'),
  ('jasher', 'jasher', 13, 8, 'canon', 'genesis', 12, 7, 'free', E'Genesis 12:7 — *And Yahuah (LORD) appeared unto Abram, and said, Unto thy seed will I give this land: and there builded he an altar unto Yahuah (LORD), who appeared unto him* — the same altar Abram builds and calls on the Name in Jasher 13:8.'),
  -- thread: jasher-13-this-land-to-thy-seed
  ('jasher', 'jasher', 13, 7, 'canon', 'genesis', 12, 7, 'free', E'Genesis 12:7 — *And Yahuah (LORD) appeared unto Abram, and said, Unto thy seed will I give this land: and there builded he an altar unto Yahuah (LORD), who appeared unto him* — the same land-to-your-seed word Yahuah speaks at Abram''s entry into Canaan in Jasher 13:7.'),
  ('jasher', 'jasher', 13, 7, 'canon', 'genesis', 13, 15, 'free', E'Genesis 13:15 — *For all the land which thou seest, to thee will I give it, and to thy seed for ever* — the all-the-lands-which-you-see inheritance forever of Jasher 13:7.'),
  ('jasher', 'jasher', 13, 18, 'canon', 'genesis', 15, 18, 'free', E'Genesis 15:18 — *In the same day Yahuah (LORD) made a covenant with Abram, saying, Unto thy seed have I given this land, from the river of Egypt unto the great river, the river Euphrates* — the very river-to-river boundary Yahuah draws for the seed in Jasher 13:18.'),
  ('jasher', 'jasher', 13, 7, 'jubilees', 'jubilees', 13, 2, 'extras', E'Jubilees 13:2 — *...And Yahuah (God) said to him: “To you and to your seed will I give this land.”* — the Jubilees apparatus carries the same land-grant to the seed at Abram''s entry that Jasher 13:7 records.'),
  -- thread: jasher-13-nimrod-chedorlaomer-war
  ('jasher', 'jasher', 13, 12, 'canon', 'genesis', 10, 8, 'free', E'Genesis 10:8 — *And Cush begat Nimrod: he began to be a mighty one in the earth* — the canon names Nimrod the first tyrant-king of Shinar whose war Jasher 13:12 recounts.'),
  ('jasher', 'jasher', 13, 13, 'canon', 'genesis', 11, 8, 'free', E'Genesis 11:8 — *So Yahuah (LORD) scattered them abroad from thence upon the face of all the earth: and they left off to build the city* — the dispersal of the tower-host that Jasher 13:13 says scattered Chedorlaomer to Elam.'),
  ('jasher', 'jasher', 13, 11, 'canon', 'genesis', 14, 4, 'free', E'Genesis 14:4 — *Twelve years they served Chedorlaomer, and in the thirteenth year they rebelled* — the same twelve-year service and thirteenth-year revolt against Chedorlaomer that Jasher 13:11 dates to Abram''s fifth year in Canaan.'),
  ('jasher', 'jasher', 13, 16, 'canon', 'genesis', 14, 1, 'free', E'Genesis 14:1 — *And it came to pass in the days of Amraphel king of Shinar, Arioch king of Ellasar, Chedorlaomer king of Elam, and Tidal king of nations* — the same Arioch and Tidal Chedorlaomer covenants with in Jasher 13:16.'),
  -- thread: jasher-13-go-forth-great-nation
  ('jasher', 'jasher', 13, 23, 'canon', 'genesis', 12, 1, 'free', E'Genesis 12:1 — *Now Yahuah (LORD) had said unto Abram, Get thee out of thy country, and from thy kindred, and from thy father’s house, unto a land that I will shew thee* — the founding go-forth call Yahuah renews in Jasher 13:23.'),
  ('jasher', 'jasher', 13, 23, 'canon', 'genesis', 12, 2, 'free', E'Genesis 12:2 — *And I will make of thee a great nation, and I will bless thee, and make thy name great; and thou shalt be a blessing* — the great-nation, great-name blessing Jasher 13:23 quotes back to Abram.'),
  ('jasher', 'jasher', 13, 23, 'canon', 'genesis', 12, 3, 'free', E'Genesis 12:3 — *And I will bless them that bless thee, and curse him that curseth thee: and in thee shall all families of the earth be blessed* — the families-of-the-earth blessing Jasher 13:23 carries verbatim.'),
  ('jasher', 'jasher', 13, 26, 'canon', 'genesis', 12, 4, 'free', E'Genesis 12:4 — *So Abram departed, as Yahuah (LORD) had spoken unto him; and Lot went with him: and Abram was seventy and five years old when he departed out of Haran* — the same seventy-five-year-old Abram leaving Haran with Lot in Jasher 13:26.'),
  -- thread: jasher-13-death-of-noah
  ('jasher', 'jasher', 13, 9, 'canon', 'genesis', 9, 28, 'free', E'Genesis 9:28 — *And Noah lived after the flood three hundred and fifty years* — the canon''s count that closes Noah''s nine hundred and fifty years just as Jasher 13:9 marks his death in Abram''s fifty-eighth year.'),
  ('jasher', 'jasher', 13, 9, 'canon', 'hebrews', 11, 7, 'free', E'Hebrews 11:7 — *By faith Noah, being warned of Elohim (God) of things not seen as yet, moved with fear, prepared an ark to the saving of his house; by the which he condemned the world, and became heir of the righteousness which is by faith* — keeps the same Noah whose death Jasher 13:9 records in the roll of faith that runs into Abram''s call.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja13_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja13_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-13-out-of-haran',
       E'Out of Haran — the call to go to Canaan',
       E'Jasher opens with the chosen seed pulled out of the idol-world: *And Terah took his son Abram and his grandson Lot, the son of Haran, and Sarai his daughter-in-law, the wife of his son Abram, and all the souls of his household and went with them from Ur Casdim to go to the land of Canaan. And when they came as far as the land of Haran they remained there, for it was exceedingly good land for pasture* (Jasher 13:1). This is the very migration Stephen sets at the head of the whole story: *And he said, Men, brethren, and fathers, hearken; The Elohim (God) of glory appeared unto our father Abraham, when he was in Mesopotamia, before he dwelt in Charran* (Acts 7:2), and *Then came he out of the land of the Chaldæans, and dwelt in Charran: and from thence, when his father was dead, he removed him into this land, wherein ye now dwell* (Acts 7:4). Joshua names the idolatry the seed was called out of: *Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods* (Joshua 24:2). Election precedes confession — Yahuah took Abram out before he could choose: *And I took your father Abraham from the other side of the flood, and led him throughout all the land of Canaan, and multiplied his seed, and gave him Isaac* (Joshua 24:3). Jubilees keeps the same stop at Haran and the father''s blessing to go: *And it came to pass in the seventh year of the sixth week that he spoke to his father, and informed him that he would leave Haran to go into the land of Canaan to see it and return to him* (Jubilees 12:28). It ain''t new — the canon already carries the call out of Chaldea.',
       sv.verse_id, ev.verse_id, 'extras', 55300
  FROM _session252_ja13_lookup sv, _session252_ja13_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=13 AND sv.verse_number=1
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=13 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-13-keep-my-commandments',
       E'Hearken to my voice and keep my commandments — Torah before Sinai',
       E'Yahuah meets Abram in Haran and binds the promise to obedience long before Sinai: *And now therefore if you will hearken to my voice and keep my commandments, my statutes and my laws, then will I cause your enemies to fall before you, and I will multiply your seed like the stars of heaven, and I will send my blessing upon all the works of your hands, and you shall lack nothing* (Jasher 13:4). The fathers kept the way; the law was not a curse hung on Israel at Horeb but the path the chosen seed already walked — it ain''t new. And the seed-like-the-stars word is the canon''s own: *And he brought him forth abroad, and said, Look now toward heaven, and tell the stars, if thou be able to number them: and he said unto him, So shall thy seed be* (Genesis 15:5), which Abram answered with the faith that anchors the whole covenant: *And he believed in Yahuah (LORD); and he counted it to him for righteousness* (Genesis 15:6). Jasher''s altar-builder is the canon''s: *And Abram built an altar in the place where Elohim had spoken to him, and Abram there called upon the name of Yahuah (the Lord)* (Jasher 13:8) — *and there builded he an altar unto Yahuah (LORD), who appeared unto him* (Genesis 12:7). Hebrews names the faith that obeyed the call: *By faith Abraham, when he was called to go out into a place which he should after receive for an inheritance, obeyed; and he went out, not knowing whither he went* (Hebrews 11:8).',
       sv.verse_id, ev.verse_id, 'extras', 55303
  FROM _session252_ja13_lookup sv, _session252_ja13_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=13 AND sv.verse_number=4
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=13 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-13-this-land-to-thy-seed',
       E'This is the land I give to your seed forever',
       E'Arriving in Canaan, Abram receives the land-grant that frames the whole Torah: *And Yahuah (the Lord) appeared to Abram when he came to the land of Canaan, and said to him, This is the land which I gave to you and to your seed after you forever, and I will make your seed like the stars of heaven, and I will give to your seed for an inheritance all the lands which you see* (Jasher 13:7). The canon speaks it word for word: *And Yahuah (LORD) appeared unto Abram, and said, Unto thy seed will I give this land* (Genesis 12:7), and again *For all the land which thou seest, to thee will I give it, and to thy seed for ever* (Genesis 13:15). The boundaries Jasher draws — *Now therefore walk before me and be perfect and keep my commands, for to you and to your seed I will give this land for an inheritance, from the river Mitzraim to the great river Euphrates* (Jasher 13:18) — are the cut-covenant of Genesis: *In the same day Yahuah (LORD) made a covenant with Abram, saying, Unto thy seed have I given this land, from the river of Egypt unto the great river, the river Euphrates* (Genesis 15:18). This is the twelve-tribe inheritance kept and chosen, not a spiritual category. Jubilees holds the same grant on the same hill: *And Yahuah (God) said to him: “To you and to your seed will I give this land”* (Jubilees 13:2).',
       sv.verse_id, ev.verse_id, 'extras', 55306
  FROM _session252_ja13_lookup sv, _session252_ja13_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=13 AND sv.verse_number=7
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=13 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-13-nimrod-chedorlaomer-war',
       E'Nimrod king of Shinar wars with Chedorlaomer — the kingdom of man',
       E'Jasher fills in the back-story of the war Genesis only names: *And in the tenth year of Abram’s dwelling in the land of Canaan there was war between Nimrod king of Shinar and Chedorlaomer king of Elam, and Nimrod came to fight with Chedorlaomer and to subdue him* (Jasher 13:12). This is the rebel kingdom-of-man at its own throat — the Babel-builder whose tower-host scattered: *For Chedorlaomer was at that time one of the princes of the hosts of Nimrod, and when all the people at the tower were dispersed and those that remained were also scattered upon the face of the earth, Chedorlaomer went to the land of Elam and reigned over it and rebelled against his Lord* (Jasher 13:13). The canon names Nimrod the first tyrant-king: *And Cush begat Nimrod: he began to be a mighty one in the earth* (Genesis 10:8), *He was a mighty hunter before Yahuah (LORD): wherefore it is said, Even as Nimrod the mighty hunter before Yahuah (LORD)* (Genesis 10:9) — and scatters his tower: *So Yahuah (LORD) scattered them abroad from thence upon the face of all the earth: and they left off to build the city* (Genesis 11:8). Genesis carries the same Chedorlaomer revolt Jasher times to Abram''s fifth year (Jasher 13:11): *Twelve years they served Chedorlaomer, and in the thirteenth year they rebelled* (Genesis 14:4), with the same Arioch and Tidal of Jasher 13:16: *And it came to pass in the days of Amraphel king of Shinar, Arioch king of Ellasar, Chedorlaomer king of Elam, and Tidal king of nations* (Genesis 14:1). The kingdom of man rises and tears itself; the seed sits quiet in Canaan.',
       sv.verse_id, ev.verse_id, 'extras', 55309
  FROM _session252_ja13_lookup sv, _session252_ja13_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=13 AND sv.verse_number=11
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=13 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-13-go-forth-great-nation',
       E'Go forth from your land — in you shall the families of the earth be blessed',
       E'After the war and the altars, Yahuah renews the founding call of Genesis 12, which Jasher quotes almost word for word: *Behold, I spoke to you these twenty years back saying, Go forth from your land, from your birth-place and from your father’s house, to the land which I have shown you to give it to you and to your children, for there in that land will I bless you, and make you a great nation, and make your name great, and in you shall the families of the earth be blessed* (Jasher 13:22-23). The canon''s own first words to Abram: *Now Yahuah (LORD) had said unto Abram, Get thee out of thy country, and from thy kindred, and from thy father’s house, unto a land that I will shew thee* (Genesis 12:1), *And I will make of thee a great nation, and I will bless thee, and make thy name great; and thou shalt be a blessing* (Genesis 12:2), *And I will bless them that bless thee, and curse him that curseth thee: and in thee shall all families of the earth be blessed* (Genesis 12:3). And Jasher''s seventy-five-year-old who returns to Canaan with Lot — *and Abram was seventy-five years old when he went forth from Haran to return to the land of Canaan* (Jasher 13:26) — is the canon''s exactly: *So Abram departed, as Yahuah (LORD) had spoken unto him; and Lot went with him: and Abram was seventy and five years old when he departed out of Haran* (Genesis 12:4). It ain''t new — the families-of-the-earth blessing was already spoken over the chosen seed.',
       sv.verse_id, ev.verse_id, 'extras', 55312
  FROM _session252_ja13_lookup sv, _session252_ja13_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=13 AND sv.verse_number=22
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=13 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-13-death-of-noah',
       E'Noah died — nine hundred and fifty years',
       E'Jasher marks the seed-line''s generations by their deaths, and here the ark-father passes in Abram''s lifetime: *At that time, at the end of three years of Abram’s dwelling in the land of Canaan, in that year Noah died, which was the fifty-eighth year of the life of Abram; and all the days that Noah lived were nine hundred and fifty years and he died* (Jasher 13:9). The canon closes Noah''s nine-hundred-fifty exactly there: *And Noah lived after the flood three hundred and fifty years* (Genesis 9:28) — the same total the genealogy of the chosen line records. And Hebrews keeps Noah in the very roll of faith that runs straight into Abram''s call, the seed kept generation to generation: *By faith Noah, being warned of Elohim (God) of things not seen as yet, moved with fear, prepared an ark to the saving of his house; by the which he condemned the world, and became heir of the righteousness which is by faith* (Hebrews 11:7). Adam to Seth to Noah to Shem to Abraham — Jasher traces the line death by death; it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55315
  FROM _session252_ja13_lookup sv, _session252_ja13_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=13 AND sv.verse_number=9
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=13 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-13-out-of-haran
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Acts 7:2 — *And he said, Men, brethren, and fathers, hearken; The Elohim (God) of glory appeared unto our father Abraham, when he was in Mesopotamia, before he dwelt in Charran* — Stephen sets the same Ur-to-Haran migration that opens Jasher 13:1 at the head of the gospel story.'
  FROM cross_reference_threads t, cross_references x, _session252_ja13_lookup sv, _session252_ja13_lookup tv
 WHERE t.slug='jasher-13-out-of-haran'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=13 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Acts 7:4 — *Then came he out of the land of the Chaldæans, and dwelt in Charran: and from thence, when his father was dead, he removed him into this land, wherein ye now dwell* — the very Ur-Casdim-to-Haran-to-Canaan route Terah''s household travels in Jasher 13:1.'
  FROM cross_reference_threads t, cross_references x, _session252_ja13_lookup sv, _session252_ja13_lookup tv
 WHERE t.slug='jasher-13-out-of-haran'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=13 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Joshua 24:2 — *And Joshua said unto all the people, Thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel), Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods* — names the idolatry the seed Abram teaches against in Haran (Jasher 13:2) was called out of.'
  FROM cross_reference_threads t, cross_references x, _session252_ja13_lookup sv, _session252_ja13_lookup tv
 WHERE t.slug='jasher-13-out-of-haran'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=13 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=24 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Joshua 24:3 — *And I took your father Abraham from the other side of the flood, and led him throughout all the land of Canaan, and multiplied his seed, and gave him Isaac* — election precedes confession: the same going-up to Canaan Abram makes at Yahuah''s word in Jasher 13:5.'
  FROM cross_reference_threads t, cross_references x, _session252_ja13_lookup sv, _session252_ja13_lookup tv
 WHERE t.slug='jasher-13-out-of-haran'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=13 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=24 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 12:28 — *And it came to pass in the seventh year of the sixth week that he spoke to his father, and informed him that he would leave Haran to go into the land of Canaan to see it and return to him...* — the Jubilees apparatus keeps the same Haran stop on the road to Canaan that opens Jasher 13:1.'
  FROM cross_reference_threads t, cross_references x, _session252_ja13_lookup sv, _session252_ja13_lookup tv
 WHERE t.slug='jasher-13-out-of-haran'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=13 AND sv.verse_number=1
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=12 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-13-keep-my-commandments
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 15:5 — *And he brought him forth abroad, and said, Look now toward heaven, and tell the stars, if thou be able to number them: and he said unto him, So shall thy seed be* — the seed-like-the-stars promise Yahuah binds to keeping his commandments in Jasher 13:4.'
  FROM cross_reference_threads t, cross_references x, _session252_ja13_lookup sv, _session252_ja13_lookup tv
 WHERE t.slug='jasher-13-keep-my-commandments'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=13 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 15:6 — *And he believed in Yahuah (LORD); and he counted it to him for righteousness* — Abram''s faith answers the same star-multiplied promise spoken over him in Jasher 13:4.'
  FROM cross_reference_threads t, cross_references x, _session252_ja13_lookup sv, _session252_ja13_lookup tv
 WHERE t.slug='jasher-13-keep-my-commandments'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=13 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 11:8 — *By faith Abraham, when he was called to go out into a place which he should after receive for an inheritance, obeyed; and he went out, not knowing whither he went* — the obedience to Yahuah''s voice that Jasher 13:4 lays as the condition of the blessing.'
  FROM cross_reference_threads t, cross_references x, _session252_ja13_lookup sv, _session252_ja13_lookup tv
 WHERE t.slug='jasher-13-keep-my-commandments'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=13 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 12:7 — *And Yahuah (LORD) appeared unto Abram, and said, Unto thy seed will I give this land: and there builded he an altar unto Yahuah (LORD), who appeared unto him* — the same altar Abram builds and calls on the Name in Jasher 13:8.'
  FROM cross_reference_threads t, cross_references x, _session252_ja13_lookup sv, _session252_ja13_lookup tv
 WHERE t.slug='jasher-13-keep-my-commandments'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=13 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-13-this-land-to-thy-seed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 12:7 — *And Yahuah (LORD) appeared unto Abram, and said, Unto thy seed will I give this land: and there builded he an altar unto Yahuah (LORD), who appeared unto him* — the same land-to-your-seed word Yahuah speaks at Abram''s entry into Canaan in Jasher 13:7.'
  FROM cross_reference_threads t, cross_references x, _session252_ja13_lookup sv, _session252_ja13_lookup tv
 WHERE t.slug='jasher-13-this-land-to-thy-seed'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=13 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 13:15 — *For all the land which thou seest, to thee will I give it, and to thy seed for ever* — the all-the-lands-which-you-see inheritance forever of Jasher 13:7.'
  FROM cross_reference_threads t, cross_references x, _session252_ja13_lookup sv, _session252_ja13_lookup tv
 WHERE t.slug='jasher-13-this-land-to-thy-seed'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=13 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=13 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 15:18 — *In the same day Yahuah (LORD) made a covenant with Abram, saying, Unto thy seed have I given this land, from the river of Egypt unto the great river, the river Euphrates* — the very river-to-river boundary Yahuah draws for the seed in Jasher 13:18.'
  FROM cross_reference_threads t, cross_references x, _session252_ja13_lookup sv, _session252_ja13_lookup tv
 WHERE t.slug='jasher-13-this-land-to-thy-seed'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=13 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 13:2 — *...And Yahuah (God) said to him: “To you and to your seed will I give this land.”* — the Jubilees apparatus carries the same land-grant to the seed at Abram''s entry that Jasher 13:7 records.'
  FROM cross_reference_threads t, cross_references x, _session252_ja13_lookup sv, _session252_ja13_lookup tv
 WHERE t.slug='jasher-13-this-land-to-thy-seed'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=13 AND sv.verse_number=7
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=13 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-13-nimrod-chedorlaomer-war
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 10:8 — *And Cush begat Nimrod: he began to be a mighty one in the earth* — the canon names Nimrod the first tyrant-king of Shinar whose war Jasher 13:12 recounts.'
  FROM cross_reference_threads t, cross_references x, _session252_ja13_lookup sv, _session252_ja13_lookup tv
 WHERE t.slug='jasher-13-nimrod-chedorlaomer-war'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=13 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 11:8 — *So Yahuah (LORD) scattered them abroad from thence upon the face of all the earth: and they left off to build the city* — the dispersal of the tower-host that Jasher 13:13 says scattered Chedorlaomer to Elam.'
  FROM cross_reference_threads t, cross_references x, _session252_ja13_lookup sv, _session252_ja13_lookup tv
 WHERE t.slug='jasher-13-nimrod-chedorlaomer-war'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=13 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=11 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 14:4 — *Twelve years they served Chedorlaomer, and in the thirteenth year they rebelled* — the same twelve-year service and thirteenth-year revolt against Chedorlaomer that Jasher 13:11 dates to Abram''s fifth year in Canaan.'
  FROM cross_reference_threads t, cross_references x, _session252_ja13_lookup sv, _session252_ja13_lookup tv
 WHERE t.slug='jasher-13-nimrod-chedorlaomer-war'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=13 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=14 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 14:1 — *And it came to pass in the days of Amraphel king of Shinar, Arioch king of Ellasar, Chedorlaomer king of Elam, and Tidal king of nations* — the same Arioch and Tidal Chedorlaomer covenants with in Jasher 13:16.'
  FROM cross_reference_threads t, cross_references x, _session252_ja13_lookup sv, _session252_ja13_lookup tv
 WHERE t.slug='jasher-13-nimrod-chedorlaomer-war'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=13 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=14 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-13-go-forth-great-nation
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 12:1 — *Now Yahuah (LORD) had said unto Abram, Get thee out of thy country, and from thy kindred, and from thy father’s house, unto a land that I will shew thee* — the founding go-forth call Yahuah renews in Jasher 13:23.'
  FROM cross_reference_threads t, cross_references x, _session252_ja13_lookup sv, _session252_ja13_lookup tv
 WHERE t.slug='jasher-13-go-forth-great-nation'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=13 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 12:2 — *And I will make of thee a great nation, and I will bless thee, and make thy name great; and thou shalt be a blessing* — the great-nation, great-name blessing Jasher 13:23 quotes back to Abram.'
  FROM cross_reference_threads t, cross_references x, _session252_ja13_lookup sv, _session252_ja13_lookup tv
 WHERE t.slug='jasher-13-go-forth-great-nation'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=13 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 12:3 — *And I will bless them that bless thee, and curse him that curseth thee: and in thee shall all families of the earth be blessed* — the families-of-the-earth blessing Jasher 13:23 carries verbatim.'
  FROM cross_reference_threads t, cross_references x, _session252_ja13_lookup sv, _session252_ja13_lookup tv
 WHERE t.slug='jasher-13-go-forth-great-nation'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=13 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 12:4 — *So Abram departed, as Yahuah (LORD) had spoken unto him; and Lot went with him: and Abram was seventy and five years old when he departed out of Haran* — the same seventy-five-year-old Abram leaving Haran with Lot in Jasher 13:26.'
  FROM cross_reference_threads t, cross_references x, _session252_ja13_lookup sv, _session252_ja13_lookup tv
 WHERE t.slug='jasher-13-go-forth-great-nation'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=13 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-13-death-of-noah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 9:28 — *And Noah lived after the flood three hundred and fifty years* — the canon''s count that closes Noah''s nine hundred and fifty years just as Jasher 13:9 marks his death in Abram''s fifty-eighth year.'
  FROM cross_reference_threads t, cross_references x, _session252_ja13_lookup sv, _session252_ja13_lookup tv
 WHERE t.slug='jasher-13-death-of-noah'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=13 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 11:7 — *By faith Noah, being warned of Elohim (God) of things not seen as yet, moved with fear, prepared an ark to the saving of his house; by the which he condemned the world, and became heir of the righteousness which is by faith* — keeps the same Noah whose death Jasher 13:9 records in the roll of faith that runs into Abram''s call.'
  FROM cross_reference_threads t, cross_references x, _session252_ja13_lookup sv, _session252_ja13_lookup tv
 WHERE t.slug='jasher-13-death-of-noah'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=13 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

