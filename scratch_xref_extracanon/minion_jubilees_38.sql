-- ----- fragment: minion_jubilees_38.sql (session251 jubilees 38) -----
-- Source anchor: jubilees/jubilees ch38. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ju38 (view _session251_ju38_lookup). Sort band base 53925, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session251_ju38_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jubilees-38-judah-bow-esau-arrow
  ('jubilees', 'jubilees', 38, 1, 'jasher', 'jasher', 56, 9, 'extras', E'Jasher 56:9 — *Only teach your sons the bow and all the weapons of war, in order that they may fight the battles of their brother who will rule over his enemies* — Jasher’s Judah-and-the-bow tradition stands behind Yahudah’s counsel to bend the bow in Jubilees 38:1.'),
  ('jubilees', 'jubilees', 38, 1, 'jasher', 'jasher', 56, 8, 'extras', E'Jasher 56:8 — *And Jacob said to Judah, I know my son that you are a mighty man for your brethren; reign over them, and your sons shall reign over their sons forever* — the mighty Yahudah who speaks first in Jubilees 38:1 is the same warrior-prince Jacob blesses to lead his brethren in Jasher.'),
  ('jubilees', 'jubilees', 38, 2, 'canon', 'genesis', 27, 40, 'free', E'Genesis 27:40 — *And by thy sword shalt thou live, and shalt serve thy brother; and it shall come to pass when thou shalt have the dominion, that thou shalt break his yoke from off thy neck* — Isaac’s word over Esau, the sword and the servitude, is the prophecy Jacob’s arrow in Jubilees 38:2 begins to fulfil.'),
  ('jubilees', 'jubilees', 38, 2, 'canon', 'amos', 1, 11, 'free', E'Amos 1:11 — *Thus saith Yahuah (LORD); For three transgressions of Edom, and for four, I will not turn away the punishment thereof; because he did pursue his brother with the sword, and did cast off all pity, and his anger did tear perpetually, and he kept his wrath for ever:* — Amos indicts the very brother-against-brother sword-war that breaks open when Esau falls in Jubilees 38:2.'),
  -- thread: jubilees-38-elder-serves-younger
  ('jubilees', 'jubilees', 38, 10, 'canon', 'genesis', 25, 23, 'free', E'Genesis 25:23 — *And Yahuah (LORD) said unto her, Two nations are in thy womb, and two manner of people shall be separated from thy bowels; and the one people shall be stronger than the other people; and the elder shall serve the younger* — the necks bowed in Jubilees 38:10 are the elder Esau serving the younger Jacob exactly as Rebekah was told.'),
  ('jubilees', 'jubilees', 38, 11, 'canon', 'numbers', 24, 18, 'free', E'Numbers 24:18 — *And Edom shall be a possession, Seir also shall be a possession for his enemies; and Yashar’el (Israel) shall do valiantly* — Balaam’s oracle of Edom-as-possession is the standing yoke of tribute laid on Esau’s sons in Jubilees 38:11.'),
  ('jubilees', 'jubilees', 38, 11, 'canon', 'malachi', 1, 3, 'free', E'Malachi 1:3 — *And I hated Esau, and laid his mountains and his heritage waste for the dragons of the wilderness* — the love-of-Jacob, hatred-of-Esau election that grounds Jubilees 38:11 is the same Yahuah declares to Israel through Malachi.'),
  -- thread: jubilees-38-tribute-until-egypt
  ('jubilees', 'jubilees', 38, 14, 'canon', 'malachi', 1, 4, 'free', E'Malachi 1:4 — *Whereas Edom saith, We are impoverished, but we will return and build the desolate places; thus saith Yahuah Tseva’ot (LORD of hosts), They shall build, but I will throw down; and they shall call them, The border of wickedness, and, The people against whom Yahuah (LORD) hath indignation for ever* — the unending yoke of Jubilees 38:14 is Malachi’s “border of wickedness” against whom Yahuah’s indignation stands for ever.'),
  ('jubilees', 'jubilees', 38, 14, 'canon', 'obadiah', 1, 18, 'free', E'Obadiah 1:18 — *And the house of Jacob shall be a fire, and the house of Joseph a flame, and the house of Esau for stubble, and they shall kindle in them, and devour them; and there shall not be any remaining of the house of Esau; for Yahuah (LORD) hath spoken it* — the yoke Esau never escapes in Jubilees 38:14 ends in Obadiah with the house of Esau consumed as stubble.'),
  ('jubilees', 'jubilees', 38, 13, 'canon', 'obadiah', 1, 10, 'free', E'Obadiah 1:10 — *For thy violence against thy brother Jacob shame shall cover thee, and thou shalt be cut off for ever* — the violence of brother against brother that opens this chapter is why the tribute of Jubilees 38:13 hardens into Edom being cut off for ever.'),
  -- thread: jubilees-38-kings-of-edom
  ('jubilees', 'jubilees', 38, 14, 'canon', 'genesis', 36, 31, 'free', E'Genesis 36:31 — *And these are the kings that reigned in the land of Edom, before there reigned any king over the children of Yashar’el (Israel)* — Jubilees 38:14 carries Genesis’ own heading word for word, the kings of Edom before Israel had a king.'),
  ('jubilees', 'jubilees', 38, 16, 'canon', 'genesis', 36, 1, 'free', E'Genesis 36:1 — *Now these are the generations of Esau, who is Edom* — the king-list Jubilees 38:16 begins is the same generations-of-Esau record Genesis 36 sets down.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session251_ju38_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session251_ju38_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-38-judah-bow-esau-arrow',
       E'Judah, the bow, and the arrow that struck Esau',
       E'Yahudah counsels his father and Jacob looses the arrow: *And after that Yahudah (Judah) spake to Jacob, his father, and said to him: “Bend your bow, father, and send forth your arrows and cast down the adversary and slay the enemy…”* (Jubilees 38:1), *Then Jacob bent his bow and sent forth the arrow and struck Esau, his brother, (on his right breast) and slew him* (Jubilees 38:2). Jasher preserves the same family-tradition of Judah teaching the bow for the war with Esau’s house: *And Jacob said to Judah, I know my son that you are a mighty man for your brethren; reign over them, and your sons shall reign over their sons forever* (Jasher 56:8), *Only teach your sons the bow and all the weapons of war, in order that they may fight the battles of their brother who will rule over his enemies* (Jasher 56:9). The blood-feud was foretold from the womb in Genesis — *And by thy sword shalt thou live, and shalt serve thy brother; and it shall come to pass when thou shalt have the dominion, that thou shalt break his yoke from off thy neck* (Genesis 27:40) — and Amos names Edom’s sin as the unbroken pursuit of his brother: *Thus saith Yahuah (LORD); For three transgressions of Edom, and for four, I will not turn away the punishment thereof; because he did pursue his brother with the sword, and did cast off all pity, and his anger did tear perpetually, and he kept his wrath for ever:* (Amos 1:11). It ain’t new: the seed-war between Esau and Jacob runs from Genesis to the prophets.',
       sv.verse_id, ev.verse_id, 'extras', 53925
  FROM _session251_ju38_lookup sv, _session251_ju38_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=38 AND sv.verse_number=1
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=38 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-38-elder-serves-younger',
       E'Esau’s sons made tributary — the elder serves the younger',
       E'After the battle the sons of Esau are bowed under the yoke: *And the sons of Jacob pressed hard upon the sons of Esau in the mountains of Seir, and bowed their necks so that they became servants of the sons of Jacob* (Jubilees 38:10), and they *placed the yoke of servitude upon them, so that they paid tribute to Jacob and to his sons always* (Jubilees 38:11). This is the womb-oracle worked out in history. Genesis: *And Yahuah (LORD) said unto her, Two nations are in thy womb, and two manner of people shall be separated from thy bowels; and the one people shall be stronger than the other people; and the elder shall serve the younger* (Genesis 25:23). Balaam saw the same end — *And Edom shall be a possession, Seir also shall be a possession for his enemies; and Yashar’el (Israel) shall do valiantly* (Numbers 24:18) — and Yahuah set His love and election in the same place: *Was not Esau Jacob’s brother? saith Yahuah (LORD): yet I loved Jacob,* *And I hated Esau, and laid his mountains and his heritage waste for the dragons of the wilderness* (Malachi 1:3). Election precedes the conquest; the younger inherits because Yahuah chose, not because Jacob was greater.',
       sv.verse_id, ev.verse_id, 'extras', 53928
  FROM _session251_ju38_lookup sv, _session251_ju38_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=38 AND sv.verse_number=10
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=38 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-38-tribute-until-egypt',
       E'Tribute until Egypt — and Edom never quit of the yoke',
       E'Jubilees frames Edom’s subjection as an enduring, prophetic fact: *And they continued to pay tribute to Jacob until the day that he went down into Egypt* (Jubilees 38:13), *And the sons of Edom have not got quit of the yoke of servitude which the twelve sons of Jacob had imposed on them until this day* (Jubilees 38:14). The prophets carry that yoke to its consummation. Obadiah seals Esau’s ruin: *And the house of Jacob shall be a fire, and the house of Joseph a flame, and the house of Esau for stubble, and they shall kindle in them, and devour them; and there shall not be any remaining of the house of Esau; for Yahuah (LORD) hath spoken it* (Obadiah 1:18), and ends with the kingdom restored to Yahuah: *And saviours shall come up on mount Zion to judge the mount of Esau; and the kingdom shall be the LORD’S* (Obadiah 1:21). Malachi names Edom’s defiance and its border: *Whereas Edom saith, We are impoverished, but we will return and build the desolate places; thus saith Yahuah Tseva’ot (LORD of hosts), They shall build, but I will throw down; and they shall call them, The border of wickedness, and, The people against whom Yahuah (LORD) hath indignation for ever* (Malachi 1:4). The servitude Jubilees records “until this day” is the same enmity the prophets say Yahuah holds for ever.',
       sv.verse_id, ev.verse_id, 'extras', 53931
  FROM _session251_ju38_lookup sv, _session251_ju38_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=38 AND sv.verse_number=13
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=38 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-38-kings-of-edom',
       E'The kings who reigned in Edom before any king in Israel',
       E'Jubilees closes with the Edomite king-list, prefaced exactly as Genesis prefaces it: *And these are the kings that reigned in Edom before there reigned any king over the children of Yashar’el (Israel) until this day in the land of Edom* (Jubilees 38:14), then *And Bâlâq, the son of Beor, reigned in Edom, and the name of his city was Danâbâ* (Jubilees 38:16). Genesis 36 is the source, name for name: *And these are the kings that reigned in the land of Edom, before there reigned any king over the children of Yashar’el (Israel)* (Genesis 36:31), opening the same roll — *Now these are the generations of Esau, who is Edom* (Genesis 36:1). It ain’t new: Jubilees is not inventing history but retelling the Genesis record, the kings of Edom set down before Israel had a throne.',
       sv.verse_id, ev.verse_id, 'extras', 53934
  FROM _session251_ju38_lookup sv, _session251_ju38_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=38 AND sv.verse_number=16
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=38 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jubilees-38-judah-bow-esau-arrow
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jasher 56:9 — *Only teach your sons the bow and all the weapons of war, in order that they may fight the battles of their brother who will rule over his enemies* — Jasher’s Judah-and-the-bow tradition stands behind Yahudah’s counsel to bend the bow in Jubilees 38:1.'
  FROM cross_reference_threads t, cross_references x, _session251_ju38_lookup sv, _session251_ju38_lookup tv
 WHERE t.slug='jubilees-38-judah-bow-esau-arrow'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=38 AND sv.verse_number=1
   AND tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=56 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jasher 56:8 — *And Jacob said to Judah, I know my son that you are a mighty man for your brethren; reign over them, and your sons shall reign over their sons forever* — the mighty Yahudah who speaks first in Jubilees 38:1 is the same warrior-prince Jacob blesses to lead his brethren in Jasher.'
  FROM cross_reference_threads t, cross_references x, _session251_ju38_lookup sv, _session251_ju38_lookup tv
 WHERE t.slug='jubilees-38-judah-bow-esau-arrow'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=38 AND sv.verse_number=1
   AND tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=56 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 27:40 — *And by thy sword shalt thou live, and shalt serve thy brother; and it shall come to pass when thou shalt have the dominion, that thou shalt break his yoke from off thy neck* — Isaac’s word over Esau, the sword and the servitude, is the prophecy Jacob’s arrow in Jubilees 38:2 begins to fulfil.'
  FROM cross_reference_threads t, cross_references x, _session251_ju38_lookup sv, _session251_ju38_lookup tv
 WHERE t.slug='jubilees-38-judah-bow-esau-arrow'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=38 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=27 AND tv.verse_number=40
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Amos 1:11 — *Thus saith Yahuah (LORD); For three transgressions of Edom, and for four, I will not turn away the punishment thereof; because he did pursue his brother with the sword, and did cast off all pity, and his anger did tear perpetually, and he kept his wrath for ever:* — Amos indicts the very brother-against-brother sword-war that breaks open when Esau falls in Jubilees 38:2.'
  FROM cross_reference_threads t, cross_references x, _session251_ju38_lookup sv, _session251_ju38_lookup tv
 WHERE t.slug='jubilees-38-judah-bow-esau-arrow'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=38 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=1 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-38-elder-serves-younger
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 25:23 — *And Yahuah (LORD) said unto her, Two nations are in thy womb, and two manner of people shall be separated from thy bowels; and the one people shall be stronger than the other people; and the elder shall serve the younger* — the necks bowed in Jubilees 38:10 are the elder Esau serving the younger Jacob exactly as Rebekah was told.'
  FROM cross_reference_threads t, cross_references x, _session251_ju38_lookup sv, _session251_ju38_lookup tv
 WHERE t.slug='jubilees-38-elder-serves-younger'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=38 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=25 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 24:18 — *And Edom shall be a possession, Seir also shall be a possession for his enemies; and Yashar’el (Israel) shall do valiantly* — Balaam’s oracle of Edom-as-possession is the standing yoke of tribute laid on Esau’s sons in Jubilees 38:11.'
  FROM cross_reference_threads t, cross_references x, _session251_ju38_lookup sv, _session251_ju38_lookup tv
 WHERE t.slug='jubilees-38-elder-serves-younger'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=38 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=24 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Malachi 1:3 — *And I hated Esau, and laid his mountains and his heritage waste for the dragons of the wilderness* — the love-of-Jacob, hatred-of-Esau election that grounds Jubilees 38:11 is the same Yahuah declares to Israel through Malachi.'
  FROM cross_reference_threads t, cross_references x, _session251_ju38_lookup sv, _session251_ju38_lookup tv
 WHERE t.slug='jubilees-38-elder-serves-younger'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=38 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-38-tribute-until-egypt
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Malachi 1:4 — *Whereas Edom saith, We are impoverished, but we will return and build the desolate places; thus saith Yahuah Tseva’ot (LORD of hosts), They shall build, but I will throw down; and they shall call them, The border of wickedness, and, The people against whom Yahuah (LORD) hath indignation for ever* — the unending yoke of Jubilees 38:14 is Malachi’s “border of wickedness” against whom Yahuah’s indignation stands for ever.'
  FROM cross_reference_threads t, cross_references x, _session251_ju38_lookup sv, _session251_ju38_lookup tv
 WHERE t.slug='jubilees-38-tribute-until-egypt'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=38 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=1 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Obadiah 1:18 — *And the house of Jacob shall be a fire, and the house of Joseph a flame, and the house of Esau for stubble, and they shall kindle in them, and devour them; and there shall not be any remaining of the house of Esau; for Yahuah (LORD) hath spoken it* — the yoke Esau never escapes in Jubilees 38:14 ends in Obadiah with the house of Esau consumed as stubble.'
  FROM cross_reference_threads t, cross_references x, _session251_ju38_lookup sv, _session251_ju38_lookup tv
 WHERE t.slug='jubilees-38-tribute-until-egypt'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=38 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='obadiah' AND tv.chapter_number=1 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Obadiah 1:10 — *For thy violence against thy brother Jacob shame shall cover thee, and thou shalt be cut off for ever* — the violence of brother against brother that opens this chapter is why the tribute of Jubilees 38:13 hardens into Edom being cut off for ever.'
  FROM cross_reference_threads t, cross_references x, _session251_ju38_lookup sv, _session251_ju38_lookup tv
 WHERE t.slug='jubilees-38-tribute-until-egypt'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=38 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='obadiah' AND tv.chapter_number=1 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-38-kings-of-edom
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 36:31 — *And these are the kings that reigned in the land of Edom, before there reigned any king over the children of Yashar’el (Israel)* — Jubilees 38:14 carries Genesis’ own heading word for word, the kings of Edom before Israel had a king.'
  FROM cross_reference_threads t, cross_references x, _session251_ju38_lookup sv, _session251_ju38_lookup tv
 WHERE t.slug='jubilees-38-kings-of-edom'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=38 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=36 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 36:1 — *Now these are the generations of Esau, who is Edom* — the king-list Jubilees 38:16 begins is the same generations-of-Esau record Genesis 36 sets down.'
  FROM cross_reference_threads t, cross_references x, _session251_ju38_lookup sv, _session251_ju38_lookup tv
 WHERE t.slug='jubilees-38-kings-of-edom'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=38 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=36 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

