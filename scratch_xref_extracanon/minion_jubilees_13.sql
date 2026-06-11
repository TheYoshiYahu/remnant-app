-- ----- fragment: minion_jubilees_13.sql (session251 jubilees 13) -----
-- Source anchor: jubilees/jubilees ch13. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ju13 (view _session251_ju13_lookup). Sort band base 53300, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session251_ju13_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jubilees-13-bethel-altar-call-name
  ('jubilees', 'jubilees', 13, 1, 'canon', 'genesis', 12, 6, 'free', E'Genesis 12:6 — *And Abram passed through the land unto the place of Sichem, unto the plain of Moreh. And the Canaanite was then in the land.* Jubilees 13:1 retells the same journey to Shechem by the lofty oak.'),
  ('jubilees', 'jubilees', 13, 2, 'canon', 'genesis', 12, 7, 'free', E'Genesis 12:7 — *And Yahuah (LORD) appeared unto Abram, and said, Unto thy seed will I give this land: and there builded he an altar unto Yahuah (LORD), who appeared unto him.* The land-and-seed promise and the altar of Jubilees 13:2,4 are Genesis verbatim.'),
  ('jubilees', 'jubilees', 13, 7, 'canon', 'genesis', 12, 8, 'free', E'Genesis 12:8 — *And he removed from thence unto a mountain on the east of Beth-el, and pitched his tent, having Beth-el on the west, and Hai on the east: and there he builded an altar unto Yahuah (LORD), and called upon the name of Yahuah (LORD).* Jubilees 13:7 has Abram between Bethel and Ai building the altar and calling on the Name.'),
  -- thread: jubilees-13-egypt-sarai-pharaoh-plagued
  ('jubilees', 'jubilees', 13, 11, 'canon', 'genesis', 12, 10, 'free', E'Genesis 12:10 — *And there was a famine in the land: and Abram went down into Egypt to sojourn there; for the famine was grievous in the land.* Jubilees 13:11 sends Abram down to Egypt by the same famine.'),
  ('jubilees', 'jubilees', 13, 12, 'canon', 'genesis', 12, 17, 'free', E'Genesis 12:17 — *And Yahuah (LORD) plagued Pharaoh and his house with great plagues because of Sarai Abram''s wife.* Jubilees 13:12 carries the plaguing of Pharaoh''s house verbatim — Yahuah guards the seed-bearing wife.'),
  ('jubilees', 'jubilees', 13, 15, 'canon', 'genesis', 12, 19, 'free', E'Genesis 12:19 — *Why saidst thou, She is my sister? so I might have taken her to me to wife: now therefore behold thy wife, take her, and go thy way.* The restoration of Sarai and Abram''s sending out of Egypt in Jubilees 13:15 answers this Genesis scene.'),
  ('jubilees', 'jubilees', 13, 15, 'canon', 'genesis', 13, 4, 'free', E'Genesis 13:4 — *Unto the place of the altar, which he had made there at the first: and there Abram called on the name of Yahuah (LORD).* Jubilees 13:15 returns Abram to that same altar between Ai and Bethel where he again blesses and calls on the Name.'),
  -- thread: jubilees-13-lot-parts-land-seed-promise-renewed
  ('jubilees', 'jubilees', 13, 17, 'canon', 'genesis', 13, 11, 'free', E'Genesis 13:11 — *Then Lot chose him all the plain of Jordan; and Lot journeyed east: and they separated themselves the one from the other.* Jubilees 13:17 has Lot part and settle in Sodom.'),
  ('jubilees', 'jubilees', 13, 19, 'canon', 'genesis', 13, 14, 'free', E'Genesis 13:14 — *And Yahuah (LORD) said unto Abram, after that Lot was separated from him, Lift up now thine eyes, and look from the place where thou art northward, and southward, and eastward, and westward.* Jubilees 13:19 renews the promise in these exact words once Lot has parted.'),
  ('jubilees', 'jubilees', 13, 20, 'canon', 'genesis', 13, 15, 'free', E'Genesis 13:15 — *For all the land which thou seest, to thee will I give it, and to thy seed for ever.* The land-to-the-seed-for-ever of Jubilees 13:20 is the Genesis grant verbatim.'),
  ('jubilees', 'jubilees', 13, 20, 'canon', 'galatians', 3, 16, 'free', E'Galatians 3:16 — *Now to Abraham and his seed were the promises made. He saith not, And to seeds, as of many; but as of one, And to thy seed, which is Messiah (Christ).* The seed-promise renewed in Jubilees 13:20 rides on the single Seed.'),
  ('jubilees', 'jubilees', 13, 20, 'canon', 'romans', 4, 3, 'free', E'Romans 4:3 — *For what saith the scripture? Abraham believed Elohim (God), and it was counted unto him for righteousness.* Abram''s faith, not law-as-curse, secures the inheritance promised in Jubilees 13:20.'),
  -- thread: jubilees-13-kings-war-lot-captive
  ('jubilees', 'jubilees', 13, 20, 'canon', 'genesis', 14, 1, 'free', E'Genesis 14:1 — *And it came to pass in the days of Amraphel king of Shinar, Arioch king of Ellasar, Chedorlaomer king of Elam, and Tidal king of nations.* Jubilees 13:20 names the same coalition of kings.'),
  ('jubilees', 'jubilees', 13, 23, 'canon', 'genesis', 14, 12, 'free', E'Genesis 14:12 — *And they took Lot, Abram''s brother''s son, who dwelt in Sodom, and his goods, and departed.* Jubilees 13:23 has Lot taken captive with Sodom verbatim.'),
  ('jubilees', 'jubilees', 13, 24, 'canon', 'genesis', 14, 13, 'free', E'Genesis 14:13 — *And there came one that had escaped, and told Abram the Hebrew; for he dwelt in the plain of Mamre the Amorite, brother of Eshcol, and brother of Aner: and these were confederate with Abram.* The escapee bringing word in Jubilees 13:24 is the Genesis account.'),
  ('jubilees', 'jubilees', 13, 24, 'canon', 'genesis', 14, 14, 'free', E'Genesis 14:14 — *And when Abram heard that his brother was taken captive, he armed his trained servants, born in his own house, three hundred and eighteen, and pursued them unto Dan.* Abram arming his household in Jubilees 13:24 and pursuing to Dan matches Genesis exactly.'),
  -- thread: jubilees-13-tithe-ordinance-for-ever
  ('jubilees', 'jubilees', 13, 26, 'canon', 'genesis', 14, 20, 'free', E'Genesis 14:20 — *And blessed be the El Elyon (most high God), which hath delivered thine enemies into thy hand. And he gave him tithes of all.* Abram''s tenth in Jubilees 13:26 is the Genesis tithe to the priest of the Most High.'),
  ('jubilees', 'jubilees', 13, 26, 'canon', 'leviticus', 27, 30, 'free', E'Leviticus 27:30 — *And all the tithe of the land, whether of the seed of the land, or of the fruit of the tree, is the LORD''S: it is holy unto Yahuah (LORD).* The Torah keeps the tenth of seed and fruit holy, the very ordinance Jubilees 13:26 calls for ever.'),
  ('jubilees', 'jubilees', 13, 26, 'canon', 'numbers', 18, 21, 'free', E'Numbers 18:21 — *And, behold, I have given the children of Levi all the tenth in Yashar''el (Israel) for an inheritance, for their service which they serve, even the service of the tabernacle of the congregation.* The priestly tenth for ever in Jubilees 13:26 is given to Levi in the Torah.'),
  ('jubilees', 'jubilees', 13, 26, 'canon', 'hebrews', 7, 2, 'free', E'Hebrews 7:2 — *To whom also Abraham gave a tenth part of all; first being by interpretation King of righteousness, and after that also King of Salem, which is, King of peace.* Hebrews reads Abram''s tithe of Jubilees 13:26 as the priesthood that foreshadows Messiah.'),
  ('jubilees', 'jubilees', 13, 29, 'canon', 'genesis', 14, 23, 'free', E'Genesis 14:23 — *That I will not take from a thread even to a shoelatchet, and that I will not take any thing that is thine, lest thou shouldest say, I have made Abram rich.* Abram''s refusal of Sodom''s spoil in Jubilees 13:29 is the Genesis oath verbatim.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session251_ju13_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session251_ju13_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-13-bethel-altar-call-name',
       E'Bethel, the altar, and calling on the Name — it ain''t new',
       E'Jubilees opens Abram''s life in the land exactly where Genesis sets it: *And Abram journeyed from Haran, and he took Sarai, his wife, and Lot his brother Haran''s son, to the land of Canaan, and he came into Asshur, and proceeded to Shechem, and dwelt near a lofty oak* (Jubilees 13:1), and there *Yahuah (God) said to him: "To you and to your seed will I give this land"* (Jubilees 13:2), so *he built an altar there, and he offered thereon a burnt sacrifice to Yahuah (God), who had appeared to him* (Jubilees 13:4). This is the Genesis account retold word for word — *And Abram passed through the land unto the place of Sichem, unto the plain of Moreh* (Genesis 12:6), *And Yahuah (LORD) appeared unto Abram, and said, Unto thy seed will I give this land: and there builded he an altar unto Yahuah (LORD), who appeared unto him* (Genesis 12:7). Jubilees then plants Abram between Bethel and Ai and has him build a second altar and *called on the name of Yahuah (God)* (Jubilees 13:7) — the same posture Genesis records: *and there he builded an altar unto Yahuah (LORD), and called upon the name of Yahuah (LORD)* (Genesis 12:8). Worship at the altar, calling on the Name, the land-and-seed promise — none of it is later invention; it is the patriarch''s own walk, woven into the canon from the first.',
       sv.verse_id, ev.verse_id, 'extras', 53300
  FROM _session251_ju13_lookup sv, _session251_ju13_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=13 AND sv.verse_number=1
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=13 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-13-egypt-sarai-pharaoh-plagued',
       E'Down to Egypt — Sarai taken, Pharaoh plagued, the wife restored',
       E'The famine drives Abram down to Egypt in both books: *And Abram went into Egypt in the third year of the week, and he dwelt in Egypt five years before his wife was torn away from him* (Jubilees 13:11), which Genesis tells as *And there was a famine in the land: and Abram went down into Egypt to sojourn there; for the famine was grievous in the land* (Genesis 12:10). When Pharaoh seizes Sarai, Jubilees says *that Yahuah (God) plagued Pharaoh and his house with great plagues because of Sarai, Abram''s wife* (Jubilees 13:12) — the very wording of *And Yahuah (LORD) plagued Pharaoh and his house with great plagues because of Sarai Abram''s wife* (Genesis 12:17). And the deliverance is the same: *And Pharaoh gave back Sarai, the wife of Abram, and he sent him out of the land of Egypt* (Jubilees 13:15) answers *Why saidst thou, She is my sister? so I might have taken her to me to wife: now therefore behold thy wife, take her, and go thy way* (Genesis 12:19). Yahuah guards the seed-bearing wife and brings Abram out of Egypt enriched — the first faint sketch of the Exodus pattern, kept and answered in the canon.',
       sv.verse_id, ev.verse_id, 'extras', 53303
  FROM _session251_ju13_lookup sv, _session251_ju13_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=13 AND sv.verse_number=10
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=13 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-13-lot-parts-land-seed-promise-renewed',
       E'Lot parts and the land-and-seed promise is renewed',
       E'Lot separates from Abram and chooses Sodom — *And in the fourth year of this week Lot parted from him, and Lot dwelt in Sodom, and the men of Sodom were sinners exceedingly* (Jubilees 13:17) — exactly as Genesis: *Then Lot chose him all the plain of Jordan; and Lot journeyed east: and they separated themselves the one from the other* (Genesis 13:11), *But the men of Sodom were wicked and sinners before Yahuah (LORD) exceedingly* (Genesis 13:13). With Lot gone, Yahuah renews the promise to the seed: *"Lift up your eyes from the place where you are dwelling, northward and southward, and westward and eastward* (Jubilees 13:19), *For all the land which you see I shall give to you and to your seed for ever, and I shall make your seed as the sand of the sea* (Jubilees 13:20) — the canon''s *Lift up now thine eyes... For all the land which thou seest, to thee will I give it, and to thy seed for ever. And I will make thy seed as the dust of the earth* (Genesis 13:14-16). The promise rides on a single Seed and on faith counted righteous: *Now to Abraham and his seed were the promises made... but as of one, And to thy seed, which is Messiah (Christ)* (Galatians 3:16), and *Abraham believed Elohim (God), and it was counted unto him for righteousness* (Romans 4:3). Election and faith, not later law-as-curse, secure the inheritance — *And if ye be Messiah''s (Christ''s), then are ye Abraham''s seed, and heirs according to the promise* (Galatians 3:29).',
       sv.verse_id, ev.verse_id, 'extras', 53306
  FROM _session251_ju13_lookup sv, _session251_ju13_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=13 AND sv.verse_number=17
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=13 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-13-kings-war-lot-captive',
       E'The four kings, the war, and Lot taken captive',
       E'Jubilees compresses the war of the kings into a single sweep: *And in this year came Chedorlaomer, king of Elam, and Amraphel, king of Shinar, and Arioch, king of Sêllâsar and Têrgâl, king of nations, and slew the king of Gomorrah, and the king of Sodom fled, and many fell through wounds in the vale of Siddim, by the Salt Sea* (Jubilees 13:20) — the same alliance Genesis names: *And it came to pass in the days of Amraphel king of Shinar, Arioch king of Ellasar, Chedorlaomer king of Elam, and Tidal king of nations* (Genesis 14:1). Lot is swept up with Sodom — *And they took captive Sodom and Adam and Zeboim, and they took captive Lot also, the son of Abram''s brother, and all his possessions* (Jubilees 13:23), as in *And they took Lot, Abram''s brother''s son, who dwelt in Sodom, and his goods, and departed* (Genesis 14:12). One escapee brings word and Abram arms his house — *And one who had escaped came and told Abram that his brother''s son had been taken captive and (Abram) armed his household servants* (Jubilees 13:24) — the canon''s *And there came one that had escaped, and told Abram the Hebrew... And when Abram heard that his brother was taken captive, he armed his trained servants* (Genesis 14:13-14). The narrative is one with Genesis; Jubilees only frames it by jubilee and week.',
       sv.verse_id, ev.verse_id, 'extras', 53309
  FROM _session251_ju13_lookup sv, _session251_ju13_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=13 AND sv.verse_number=20
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=13 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-13-tithe-ordinance-for-ever',
       E'The tithe ordained for ever — and Abram''s refusal of Sodom''s spoil',
       E'Out of the rescue Jubilees grounds the tithe in the patriarch and the heavenly tablets: *a tenth of the first-fruits to Yahuah (God), and Yahuah (God) ordained it as an ordinance for ever that they should give it to the priests who served before Him, that they should possess it for ever* (Jubilees 13:25), *And to this law there is no limit of days; for He has ordained it for the generations for ever that they should give to Yahuah (God) the tenth of everything, of the seed and of the wine and of the oil and of the cattle and of the sheep* (Jubilees 13:26). This is the Genesis tithe to the priest-king — *And he gave him tithes of all* (Genesis 14:20) — read as an eternal ordinance, not a later levy. The Torah keeps it the same: *And all the tithe of the land, whether of the seed of the land, or of the fruit of the tree, is the LORD''S: it is holy unto Yahuah (LORD)* (Leviticus 27:30), and Numbers gives it to the priesthood for ever: *I have given the children of Levi all the tenth in Yashar''el (Israel) for an inheritance* (Numbers 18:21). The book of Hebrews reads Abram''s tithe as the older, greater priesthood foreshadowing Messiah: *To whom also Abraham gave a tenth part of all... made like unto the Son of Elohim (God); abideth a priest continually* (Hebrews 7:2-3). And Abram takes nothing of Sodom''s spoil — *"I lift up my hands to the El Elyon (Most High) Elohim (God), that from a thread to a shoe-latchet I shall not take aught that is your"* (Jubilees 13:29) — the canon''s *I will not take from a thread even to a shoelatchet... lest thou shouldest say, I have made Abram rich* (Genesis 14:23). The tithe and the patriarch''s holiness are ancient and engraved; it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53312
  FROM _session251_ju13_lookup sv, _session251_ju13_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=13 AND sv.verse_number=26
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=13 AND ev.verse_number=29
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jubilees-13-bethel-altar-call-name
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 12:6 — *And Abram passed through the land unto the place of Sichem, unto the plain of Moreh. And the Canaanite was then in the land.* Jubilees 13:1 retells the same journey to Shechem by the lofty oak.'
  FROM cross_reference_threads t, cross_references x, _session251_ju13_lookup sv, _session251_ju13_lookup tv
 WHERE t.slug='jubilees-13-bethel-altar-call-name'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=13 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 12:7 — *And Yahuah (LORD) appeared unto Abram, and said, Unto thy seed will I give this land: and there builded he an altar unto Yahuah (LORD), who appeared unto him.* The land-and-seed promise and the altar of Jubilees 13:2,4 are Genesis verbatim.'
  FROM cross_reference_threads t, cross_references x, _session251_ju13_lookup sv, _session251_ju13_lookup tv
 WHERE t.slug='jubilees-13-bethel-altar-call-name'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=13 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 12:8 — *And he removed from thence unto a mountain on the east of Beth-el, and pitched his tent, having Beth-el on the west, and Hai on the east: and there he builded an altar unto Yahuah (LORD), and called upon the name of Yahuah (LORD).* Jubilees 13:7 has Abram between Bethel and Ai building the altar and calling on the Name.'
  FROM cross_reference_threads t, cross_references x, _session251_ju13_lookup sv, _session251_ju13_lookup tv
 WHERE t.slug='jubilees-13-bethel-altar-call-name'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=13 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-13-egypt-sarai-pharaoh-plagued
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 12:10 — *And there was a famine in the land: and Abram went down into Egypt to sojourn there; for the famine was grievous in the land.* Jubilees 13:11 sends Abram down to Egypt by the same famine.'
  FROM cross_reference_threads t, cross_references x, _session251_ju13_lookup sv, _session251_ju13_lookup tv
 WHERE t.slug='jubilees-13-egypt-sarai-pharaoh-plagued'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=13 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 12:17 — *And Yahuah (LORD) plagued Pharaoh and his house with great plagues because of Sarai Abram''s wife.* Jubilees 13:12 carries the plaguing of Pharaoh''s house verbatim — Yahuah guards the seed-bearing wife.'
  FROM cross_reference_threads t, cross_references x, _session251_ju13_lookup sv, _session251_ju13_lookup tv
 WHERE t.slug='jubilees-13-egypt-sarai-pharaoh-plagued'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=13 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 12:19 — *Why saidst thou, She is my sister? so I might have taken her to me to wife: now therefore behold thy wife, take her, and go thy way.* The restoration of Sarai and Abram''s sending out of Egypt in Jubilees 13:15 answers this Genesis scene.'
  FROM cross_reference_threads t, cross_references x, _session251_ju13_lookup sv, _session251_ju13_lookup tv
 WHERE t.slug='jubilees-13-egypt-sarai-pharaoh-plagued'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=13 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 13:4 — *Unto the place of the altar, which he had made there at the first: and there Abram called on the name of Yahuah (LORD).* Jubilees 13:15 returns Abram to that same altar between Ai and Bethel where he again blesses and calls on the Name.'
  FROM cross_reference_threads t, cross_references x, _session251_ju13_lookup sv, _session251_ju13_lookup tv
 WHERE t.slug='jubilees-13-egypt-sarai-pharaoh-plagued'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=13 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=13 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-13-lot-parts-land-seed-promise-renewed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 13:11 — *Then Lot chose him all the plain of Jordan; and Lot journeyed east: and they separated themselves the one from the other.* Jubilees 13:17 has Lot part and settle in Sodom.'
  FROM cross_reference_threads t, cross_references x, _session251_ju13_lookup sv, _session251_ju13_lookup tv
 WHERE t.slug='jubilees-13-lot-parts-land-seed-promise-renewed'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=13 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=13 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 13:14 — *And Yahuah (LORD) said unto Abram, after that Lot was separated from him, Lift up now thine eyes, and look from the place where thou art northward, and southward, and eastward, and westward.* Jubilees 13:19 renews the promise in these exact words once Lot has parted.'
  FROM cross_reference_threads t, cross_references x, _session251_ju13_lookup sv, _session251_ju13_lookup tv
 WHERE t.slug='jubilees-13-lot-parts-land-seed-promise-renewed'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=13 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=13 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 13:15 — *For all the land which thou seest, to thee will I give it, and to thy seed for ever.* The land-to-the-seed-for-ever of Jubilees 13:20 is the Genesis grant verbatim.'
  FROM cross_reference_threads t, cross_references x, _session251_ju13_lookup sv, _session251_ju13_lookup tv
 WHERE t.slug='jubilees-13-lot-parts-land-seed-promise-renewed'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=13 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=13 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Galatians 3:16 — *Now to Abraham and his seed were the promises made. He saith not, And to seeds, as of many; but as of one, And to thy seed, which is Messiah (Christ).* The seed-promise renewed in Jubilees 13:20 rides on the single Seed.'
  FROM cross_reference_threads t, cross_references x, _session251_ju13_lookup sv, _session251_ju13_lookup tv
 WHERE t.slug='jubilees-13-lot-parts-land-seed-promise-renewed'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=13 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=3 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Romans 4:3 — *For what saith the scripture? Abraham believed Elohim (God), and it was counted unto him for righteousness.* Abram''s faith, not law-as-curse, secures the inheritance promised in Jubilees 13:20.'
  FROM cross_reference_threads t, cross_references x, _session251_ju13_lookup sv, _session251_ju13_lookup tv
 WHERE t.slug='jubilees-13-lot-parts-land-seed-promise-renewed'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=13 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=4 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-13-kings-war-lot-captive
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 14:1 — *And it came to pass in the days of Amraphel king of Shinar, Arioch king of Ellasar, Chedorlaomer king of Elam, and Tidal king of nations.* Jubilees 13:20 names the same coalition of kings.'
  FROM cross_reference_threads t, cross_references x, _session251_ju13_lookup sv, _session251_ju13_lookup tv
 WHERE t.slug='jubilees-13-kings-war-lot-captive'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=13 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=14 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 14:12 — *And they took Lot, Abram''s brother''s son, who dwelt in Sodom, and his goods, and departed.* Jubilees 13:23 has Lot taken captive with Sodom verbatim.'
  FROM cross_reference_threads t, cross_references x, _session251_ju13_lookup sv, _session251_ju13_lookup tv
 WHERE t.slug='jubilees-13-kings-war-lot-captive'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=13 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=14 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 14:13 — *And there came one that had escaped, and told Abram the Hebrew; for he dwelt in the plain of Mamre the Amorite, brother of Eshcol, and brother of Aner: and these were confederate with Abram.* The escapee bringing word in Jubilees 13:24 is the Genesis account.'
  FROM cross_reference_threads t, cross_references x, _session251_ju13_lookup sv, _session251_ju13_lookup tv
 WHERE t.slug='jubilees-13-kings-war-lot-captive'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=13 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=14 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 14:14 — *And when Abram heard that his brother was taken captive, he armed his trained servants, born in his own house, three hundred and eighteen, and pursued them unto Dan.* Abram arming his household in Jubilees 13:24 and pursuing to Dan matches Genesis exactly.'
  FROM cross_reference_threads t, cross_references x, _session251_ju13_lookup sv, _session251_ju13_lookup tv
 WHERE t.slug='jubilees-13-kings-war-lot-captive'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=13 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=14 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-13-tithe-ordinance-for-ever
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 14:20 — *And blessed be the El Elyon (most high God), which hath delivered thine enemies into thy hand. And he gave him tithes of all.* Abram''s tenth in Jubilees 13:26 is the Genesis tithe to the priest of the Most High.'
  FROM cross_reference_threads t, cross_references x, _session251_ju13_lookup sv, _session251_ju13_lookup tv
 WHERE t.slug='jubilees-13-tithe-ordinance-for-ever'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=13 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=14 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 27:30 — *And all the tithe of the land, whether of the seed of the land, or of the fruit of the tree, is the LORD''S: it is holy unto Yahuah (LORD).* The Torah keeps the tenth of seed and fruit holy, the very ordinance Jubilees 13:26 calls for ever.'
  FROM cross_reference_threads t, cross_references x, _session251_ju13_lookup sv, _session251_ju13_lookup tv
 WHERE t.slug='jubilees-13-tithe-ordinance-for-ever'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=13 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=27 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Numbers 18:21 — *And, behold, I have given the children of Levi all the tenth in Yashar''el (Israel) for an inheritance, for their service which they serve, even the service of the tabernacle of the congregation.* The priestly tenth for ever in Jubilees 13:26 is given to Levi in the Torah.'
  FROM cross_reference_threads t, cross_references x, _session251_ju13_lookup sv, _session251_ju13_lookup tv
 WHERE t.slug='jubilees-13-tithe-ordinance-for-ever'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=13 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=18 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Hebrews 7:2 — *To whom also Abraham gave a tenth part of all; first being by interpretation King of righteousness, and after that also King of Salem, which is, King of peace.* Hebrews reads Abram''s tithe of Jubilees 13:26 as the priesthood that foreshadows Messiah.'
  FROM cross_reference_threads t, cross_references x, _session251_ju13_lookup sv, _session251_ju13_lookup tv
 WHERE t.slug='jubilees-13-tithe-ordinance-for-ever'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=13 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=7 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Genesis 14:23 — *That I will not take from a thread even to a shoelatchet, and that I will not take any thing that is thine, lest thou shouldest say, I have made Abram rich.* Abram''s refusal of Sodom''s spoil in Jubilees 13:29 is the Genesis oath verbatim.'
  FROM cross_reference_threads t, cross_references x, _session251_ju13_lookup sv, _session251_ju13_lookup tv
 WHERE t.slug='jubilees-13-tithe-ordinance-for-ever'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=13 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=14 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

