-- ----- fragment: minion_jasher_15.sql (session252 jasher 15) -----
-- Source anchor: jasher/jasher ch15. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja15 (view _session252_ja15_lookup). Sort band base 55350, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja15_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-15-famine-down-to-egypt
  ('jasher', 'jasher', 15, 1, 'canon', 'genesis', 12, 10, 'free', E'Genesis 12:10 — *And there was a famine in the land: and Abram went down into Egypt to sojourn there; for the famine was grievous in the land.* The Genesis source of Jasher 15:1-2, the grievous Canaan famine that sends Abram to Egypt.'),
  ('jasher', 'jasher', 15, 1, 'canon', 'genesis', 26, 1, 'free', E'Genesis 26:1 — *And there was a famine in the land, beside the first famine that was in the days of Abraham. And Isaac went unto Abimelech king of the Philistines unto Gerar.* The same famine-driven sojourn recurs over Isaac, showing Jasher 15:1''s scene is a covenant pattern.'),
  ('jasher', 'jasher', 15, 2, 'canon', 'hebrews', 11, 9, 'free', E'Hebrews 11:9 — *By faith he sojourned in the land of promise, as in a strange country, dwelling in tabernacles with Isaac and Jacob, the heirs with him of the same promise.* Names the faith-posture of Abram''s descent in Jasher 15:2 — the elect seed sojourning among the nations.'),
  ('jasher', 'jasher', 15, 2, 'jubilees', 'jubilees', 13, 11, 'extras', E'Jubilees 13:11 — *And Abram went into Egypt in the third year of the week, and he dwelt in Egypt five years before his wife was torn away from him.* Jubilees retells the identical descent into Egypt that opens Jasher 15.'),
  -- thread: jasher-15-she-is-my-sister
  ('jasher', 'jasher', 15, 4, 'canon', 'genesis', 12, 11, 'free', E'Genesis 12:11 — *And it came to pass, when he was come near to enter into Egypt, that he said unto Sarai his wife, Behold now, I know that thou art a fair woman to look upon.* The Genesis source of Abram''s fear in Jasher 15:4 as Egypt nears.'),
  ('jasher', 'jasher', 15, 5, 'canon', 'genesis', 12, 13, 'free', E'Genesis 12:13 — *Say, I pray thee, thou art my sister: that it may be well with me for thy sake; and my soul shall live because of thee.* The exact instruction Jasher 15:5 expands — call yourself sister that it may be well with me.'),
  ('jasher', 'jasher', 15, 6, 'canon', 'genesis', 20, 2, 'free', E'Genesis 20:2 — *And Abraham said of Sarah his wife, She is my sister: and Abimelech king of Gerar sent, and took Sarah.* The same sister-stratagem returns at Gerar, showing Jasher 15:6''s command is a recurring pattern over the seed.'),
  ('jasher', 'jasher', 15, 5, 'canon', 'genesis', 26, 7, 'free', E'Genesis 26:7 — *And the men of the place asked him of his wife; and he said, She is my sister: for he feared to say, She is my wife; lest, said he, the men of the place should kill me for Rebekah; because she was fair to look upon.* Isaac repeats the very fear and stratagem of Jasher 15:5.'),
  -- thread: jasher-15-prayer-and-the-angel-delivers-sarai
  ('jasher', 'jasher', 15, 16, 'canon', 'genesis', 12, 15, 'free', E'Genesis 12:15 — *The princes also of Pharaoh saw her, and commended her before Pharaoh: and the woman was taken into Pharaoh''s house.* The Genesis source of Sarai being brought to Pharaoh''s house in Jasher 15:16.'),
  ('jasher', 'jasher', 15, 19, 'canon', 'psalms', 34, 7, 'free', E'Psalms 34:7 — *The angel of Yahuah (LORD) encampeth round about them that fear him, and delivereth them.* The canon''s word for the delivering angel Jasher 15:19 sends to rescue Sarai.'),
  ('jasher', 'jasher', 15, 16, 'canon', 'psalms', 105, 15, 'free', E'Psalms 105:15 — *Saying, Touch not mine anointed, and do my prophets no harm.* The covenant charter that guards Abram in Pharaoh''s house, the protection his prayer in Jasher 15:16 appeals to.'),
  -- thread: jasher-15-pharaoh-plagued-sarai-restored
  ('jasher', 'jasher', 15, 28, 'canon', 'genesis', 12, 17, 'free', E'Genesis 12:17 — *And Yahuah (LORD) plagued Pharaoh and his house with great plagues because of Sarai Abram''s wife.* The Genesis source of the plague on Pharaoh''s house in Jasher 15:28.'),
  ('jasher', 'jasher', 15, 30, 'canon', 'genesis', 12, 19, 'free', E'Genesis 12:19 — *Why saidst thou, She is my sister? so I might have taken her to me to wife: now therefore behold thy wife, take her, and go thy way.* Pharaoh''s dismissal of Abram and Sarai, expanded in Jasher 15:30.'),
  ('jasher', 'jasher', 15, 28, 'jubilees', 'jubilees', 13, 12, 'extras', E'Jubilees 13:12 — *And it came to pass when Pharaoh seized Sarai, the wife of Abram, that Yahuah (God) plagued Pharaoh and his house with great plagues because of Sarai, Abram''s wife.* Jubilees retells the very plague Jasher 15:28 says smote Pharaoh on Sarai''s account.'),
  ('jasher', 'jasher', 15, 30, 'jubilees', 'jubilees', 13, 15, 'extras', E'Jubilees 13:15 — *And Pharaoh gave back Sarai, the wife of Abram, and he sent him out of the land of Egypt, and he journeyed to the place where he had pitched his tent at the beginning.* The restoration and sending-out that Jasher 15:30 narrates.'),
  -- thread: jasher-15-abram-and-lot-separate
  ('jasher', 'jasher', 15, 36, 'canon', 'genesis', 13, 7, 'free', E'Genesis 13:7 — *And there was a strife between the herdmen of Abram''s cattle and the herdmen of Lot''s cattle: and the Canaanite and the Perizzite dwelled then in the land.* The Genesis source of the herdsmen''s quarrel in Jasher 15:36.'),
  ('jasher', 'jasher', 15, 41, 'canon', 'genesis', 13, 8, 'free', E'Genesis 13:8 — *And Abram said unto Lot, Let there be no strife, I pray thee, between me and thee, and between my herdmen and thy herdmen; for we be brethren.* Abram''s peace-making appeal, expanded in Jasher 15:41.'),
  ('jasher', 'jasher', 15, 46, 'canon', 'genesis', 13, 11, 'free', E'Genesis 13:11 — *Then Lot chose him all the plain of Jordan; and Lot journeyed east: and they separated themselves the one from the other.* Lot''s choice of the well-watered plain and departure, as in Jasher 15:46.'),
  ('jasher', 'jasher', 15, 46, 'jubilees', 'jubilees', 13, 17, 'extras', E'Jubilees 13:17 — *And in the fourth year of this week Lot parted from him, and Lot dwelt in Sodom, and the men of Sodom were sinners exceedingly.* Jubilees records the same parting of Lot to Sodom that closes Jasher 15:46.'),
  -- thread: jasher-15-abram-dwells-in-mamre-hebron
  ('jasher', 'jasher', 15, 47, 'canon', 'genesis', 13, 18, 'free', E'Genesis 13:18 — *Then Abram removed his tent, and came and dwelt in the plain of Mamre, which is in Hebron, and built there an altar unto Yahuah (LORD).* The exact Genesis place-note that Jasher 15:47 records — Mamre in Hebron.'),
  ('jasher', 'jasher', 15, 47, 'canon', 'genesis', 13, 15, 'free', E'Genesis 13:15 — *For all the land which thou seest, to thee will I give it, and to thy seed for ever.* The land-promise renewed to the seed just as Abram settles in the place where Jasher 15:47 leaves him dwelling.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja15_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja15_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-15-famine-down-to-egypt',
       E'The famine drives Abram down to Egypt',
       E'Jasher opens the cycle exactly where Genesis does: *And in that year there was a heavy famine throughout the land of Canaan, and the inhabitants of the land could not remain on account of the famine for it was very grievous. And Abram and all belonging to him rose and went down to Egypt on account of the famine* (Jasher 15:1-2). Genesis carries the same scene unembellished — *And there was a famine in the land: and Abram went down into Egypt to sojourn there; for the famine was grievous in the land* (Genesis 12:10). The very same famine recurs over Isaac a generation later — *And there was a famine in the land, beside the first famine that was in the days of Abraham. And Isaac went unto Abimelech king of the Philistines unto Gerar* (Genesis 26:1) — the chosen seed sojourning among the nations is a pattern, not a one-off. Hebrews names the posture: *By faith he sojourned in the land of promise, as in a strange country, dwelling in tabernacles with Isaac and Jacob, the heirs with him of the same promise* (Hebrews 11:9). And Jubilees retells the identical descent — *And Abram went into Egypt in the third year of the week, and he dwelt in Egypt five years before his wife was torn away from him* (Jubilees 13:11). It ain''t new — Jasher is repeating the canon''s own famine-and-sojourn.',
       sv.verse_id, ev.verse_id, 'extras', 55350
  FROM _session252_ja15_lookup sv, _session252_ja15_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=15 AND sv.verse_number=1
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=15 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-15-she-is-my-sister',
       E'Say you are my sister — fear of the nations',
       E'On the border of Egypt Abram, fearing the godless land, instructs Sarai: *And Abram said to his wife Sarai, Since Elohim (God) has created you with such a beautiful countenance, I am afraid of the Egyptians lest they should slay me and take you away, for the fear of Elohim is not in these places. Surely then you shall do this, Say you are my sister to all that may ask you* (Jasher 15:4-5). This is Genesis 12 word-for-word in substance — *Behold now, I know that thou art a fair woman to look upon... Say, I pray thee, thou art my sister: that it may be well with me for thy sake; and my soul shall live because of thee* (Genesis 12:11,13). The same stratagem returns at Gerar with Abimelech — *And Abraham said of Sarah his wife, She is my sister: and Abimelech king of Gerar sent, and took Sarah* (Genesis 20:2) — and again over Isaac and Rebekah — *and he said, She is my sister: for he feared to say, She is my wife; lest, said he, the men of the place should kill me for Rebekah* (Genesis 26:7). The patriarch''s fear of the nations who have no fear of Elohim is the recurring danger over the chosen seed; it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55353
  FROM _session252_ja15_lookup sv, _session252_ja15_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=15 AND sv.verse_number=3
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=15 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-15-prayer-and-the-angel-delivers-sarai',
       E'Sarai taken — Abram prays and the angel delivers',
       E'Sarai is carried into Pharaoh''s house and Abram cries out: *And the woman was then brought to Pharaoh''s house, and Abram grieved on account of his wife, and he prayed to Yahuah (the Lord) to deliver her from the hands of Pharaoh* (Jasher 15:16), and Yahuah answers — *And Yahuah (the Lord) hearkened to the voice of Sarai, and Yahuah (the Lord) sent an angel to deliver Sarai from the power of Pharaoh* (Jasher 15:19). Genesis states the taking plainly — *The princes also of Pharaoh saw her, and commended her before Pharaoh: and the woman was taken into Pharaoh''s house* (Genesis 12:15) — and the Psalms supply the deliverance Jasher dramatizes as an angel: *The angel of Yahuah (LORD) encampeth round about them that fear him, and delivereth them* (Psalms 34:7). The 105th Psalm makes it the very charter of Abram''s protection among the kings — *He suffered no man to do them wrong: yea, he reproved kings for their sakes; Saying, Touch not mine anointed, and do my prophets no harm* (Psalms 105:14-15). Where Jasher adds the standing angel, the canon already carries the deliverance: it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55356
  FROM _session252_ja15_lookup sv, _session252_ja15_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=15 AND sv.verse_number=16
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=15 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-15-pharaoh-plagued-sarai-restored',
       E'Pharaoh plagued; Sarai restored with gifts',
       E'The angel''s strokes fall on Pharaoh''s whole house until the king relents: *And Pharaoh knew that he was smitten on account of Sarai... in the morning the king called for Abram and said to him, What is this you have done to me?... Now therefore here is your wife, take her and go from our land lest we all die on her account* (Jasher 15:28-30), and the king loads Abram with cattle, servants, silver and gold (Jasher 15:30,33). Genesis is the spare original — *And Yahuah (LORD) plagued Pharaoh and his house with great plagues because of Sarai Abram''s wife* (Genesis 12:17), and *now therefore behold thy wife, take her, and go thy way* (Genesis 12:19). Jubilees narrates the same plague and restoration — *it came to pass when Pharaoh seized Sarai, the wife of Abram, that Yahuah (God) plagued Pharaoh and his house with great plagues because of Sarai, Abram''s wife* (Jubilees 13:12), and *And Pharaoh gave back Sarai, the wife of Abram, and he sent him out of the land of Egypt* (Jubilees 13:15). The kings-of-man are reproved for the seed''s sake; the same architecture runs through every retelling.',
       sv.verse_id, ev.verse_id, 'extras', 55359
  FROM _session252_ja15_lookup sv, _session252_ja15_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=15 AND sv.verse_number=28
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=15 AND ev.verse_number=33
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-15-abram-and-lot-separate',
       E'Abram and Lot separate in peace',
       E'Back in Canaan the substance grows too great and strife breaks out: *And when Abram was dwelling in the land the herdsmen of Lot quarrelled with the herdsmen of Abram, for their property was too great for them to remain together in the land* (Jasher 15:36), and Abram makes peace — *Now I beseech you let there be no more quarrelling between us, for we are kinsmen. But I pray you separate from me, go and choose a place where you may dwell* (Jasher 15:41-42). Genesis is the source, nearly verbatim — *And there was a strife between the herdmen of Abram''s cattle and the herdmen of Lot''s cattle* (Genesis 13:7), *Let there be no strife, I pray thee, between me and thee, and between my herdmen and thy herdmen; for we be brethren* (Genesis 13:8). Lot lifts his eyes to Jordan and chooses Sodom — *Then Lot chose him all the plain of Jordan; and Lot journeyed east: and they separated themselves the one from the other* (Genesis 13:11) — and Jubilees marks it: *And in the fourth year of this week Lot parted from him, and Lot dwelt in Sodom, and the men of Sodom were sinners exceedingly* (Jubilees 13:17).',
       sv.verse_id, ev.verse_id, 'extras', 55362
  FROM _session252_ja15_lookup sv, _session252_ja15_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=15 AND sv.verse_number=36
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=15 AND ev.verse_number=46
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-15-abram-dwells-in-mamre-hebron',
       E'Abram dwells in the plain of Mamre at Hebron',
       E'The chapter closes with Abram settled in the land of promise: *And Abram dwelt in the plain of Mamre, which is in Hebron, and he pitched his tent there, and Abram remained in that place many years* (Jasher 15:47). Genesis ends the Lot account in the very same place — *Then Abram removed his tent, and came and dwelt in the plain of Mamre, which is in Hebron, and built there an altar unto Yahuah (LORD)* (Genesis 13:18). And just after Lot''s departure the land-promise to the seed is renewed — *For all the land which thou seest, to thee will I give it, and to thy seed for ever. And I will make thy seed as the dust of the earth* (Genesis 13:15-16). The elect seed dwells in the land deeded forever; the promise to the fathers is the same promise carried through every telling — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55365
  FROM _session252_ja15_lookup sv, _session252_ja15_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=15 AND sv.verse_number=47
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=15 AND ev.verse_number=47
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-15-famine-down-to-egypt
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 12:10 — *And there was a famine in the land: and Abram went down into Egypt to sojourn there; for the famine was grievous in the land.* The Genesis source of Jasher 15:1-2, the grievous Canaan famine that sends Abram to Egypt.'
  FROM cross_reference_threads t, cross_references x, _session252_ja15_lookup sv, _session252_ja15_lookup tv
 WHERE t.slug='jasher-15-famine-down-to-egypt'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=15 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 26:1 — *And there was a famine in the land, beside the first famine that was in the days of Abraham. And Isaac went unto Abimelech king of the Philistines unto Gerar.* The same famine-driven sojourn recurs over Isaac, showing Jasher 15:1''s scene is a covenant pattern.'
  FROM cross_reference_threads t, cross_references x, _session252_ja15_lookup sv, _session252_ja15_lookup tv
 WHERE t.slug='jasher-15-famine-down-to-egypt'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=15 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=26 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 11:9 — *By faith he sojourned in the land of promise, as in a strange country, dwelling in tabernacles with Isaac and Jacob, the heirs with him of the same promise.* Names the faith-posture of Abram''s descent in Jasher 15:2 — the elect seed sojourning among the nations.'
  FROM cross_reference_threads t, cross_references x, _session252_ja15_lookup sv, _session252_ja15_lookup tv
 WHERE t.slug='jasher-15-famine-down-to-egypt'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=15 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 13:11 — *And Abram went into Egypt in the third year of the week, and he dwelt in Egypt five years before his wife was torn away from him.* Jubilees retells the identical descent into Egypt that opens Jasher 15.'
  FROM cross_reference_threads t, cross_references x, _session252_ja15_lookup sv, _session252_ja15_lookup tv
 WHERE t.slug='jasher-15-famine-down-to-egypt'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=15 AND sv.verse_number=2
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=13 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-15-she-is-my-sister
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 12:11 — *And it came to pass, when he was come near to enter into Egypt, that he said unto Sarai his wife, Behold now, I know that thou art a fair woman to look upon.* The Genesis source of Abram''s fear in Jasher 15:4 as Egypt nears.'
  FROM cross_reference_threads t, cross_references x, _session252_ja15_lookup sv, _session252_ja15_lookup tv
 WHERE t.slug='jasher-15-she-is-my-sister'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=15 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 12:13 — *Say, I pray thee, thou art my sister: that it may be well with me for thy sake; and my soul shall live because of thee.* The exact instruction Jasher 15:5 expands — call yourself sister that it may be well with me.'
  FROM cross_reference_threads t, cross_references x, _session252_ja15_lookup sv, _session252_ja15_lookup tv
 WHERE t.slug='jasher-15-she-is-my-sister'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=15 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 20:2 — *And Abraham said of Sarah his wife, She is my sister: and Abimelech king of Gerar sent, and took Sarah.* The same sister-stratagem returns at Gerar, showing Jasher 15:6''s command is a recurring pattern over the seed.'
  FROM cross_reference_threads t, cross_references x, _session252_ja15_lookup sv, _session252_ja15_lookup tv
 WHERE t.slug='jasher-15-she-is-my-sister'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=15 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=20 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 26:7 — *And the men of the place asked him of his wife; and he said, She is my sister: for he feared to say, She is my wife; lest, said he, the men of the place should kill me for Rebekah; because she was fair to look upon.* Isaac repeats the very fear and stratagem of Jasher 15:5.'
  FROM cross_reference_threads t, cross_references x, _session252_ja15_lookup sv, _session252_ja15_lookup tv
 WHERE t.slug='jasher-15-she-is-my-sister'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=15 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=26 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-15-prayer-and-the-angel-delivers-sarai
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 12:15 — *The princes also of Pharaoh saw her, and commended her before Pharaoh: and the woman was taken into Pharaoh''s house.* The Genesis source of Sarai being brought to Pharaoh''s house in Jasher 15:16.'
  FROM cross_reference_threads t, cross_references x, _session252_ja15_lookup sv, _session252_ja15_lookup tv
 WHERE t.slug='jasher-15-prayer-and-the-angel-delivers-sarai'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=15 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalms 34:7 — *The angel of Yahuah (LORD) encampeth round about them that fear him, and delivereth them.* The canon''s word for the delivering angel Jasher 15:19 sends to rescue Sarai.'
  FROM cross_reference_threads t, cross_references x, _session252_ja15_lookup sv, _session252_ja15_lookup tv
 WHERE t.slug='jasher-15-prayer-and-the-angel-delivers-sarai'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=15 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=34 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalms 105:15 — *Saying, Touch not mine anointed, and do my prophets no harm.* The covenant charter that guards Abram in Pharaoh''s house, the protection his prayer in Jasher 15:16 appeals to.'
  FROM cross_reference_threads t, cross_references x, _session252_ja15_lookup sv, _session252_ja15_lookup tv
 WHERE t.slug='jasher-15-prayer-and-the-angel-delivers-sarai'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=15 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=105 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-15-pharaoh-plagued-sarai-restored
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 12:17 — *And Yahuah (LORD) plagued Pharaoh and his house with great plagues because of Sarai Abram''s wife.* The Genesis source of the plague on Pharaoh''s house in Jasher 15:28.'
  FROM cross_reference_threads t, cross_references x, _session252_ja15_lookup sv, _session252_ja15_lookup tv
 WHERE t.slug='jasher-15-pharaoh-plagued-sarai-restored'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=15 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 12:19 — *Why saidst thou, She is my sister? so I might have taken her to me to wife: now therefore behold thy wife, take her, and go thy way.* Pharaoh''s dismissal of Abram and Sarai, expanded in Jasher 15:30.'
  FROM cross_reference_threads t, cross_references x, _session252_ja15_lookup sv, _session252_ja15_lookup tv
 WHERE t.slug='jasher-15-pharaoh-plagued-sarai-restored'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=15 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 13:12 — *And it came to pass when Pharaoh seized Sarai, the wife of Abram, that Yahuah (God) plagued Pharaoh and his house with great plagues because of Sarai, Abram''s wife.* Jubilees retells the very plague Jasher 15:28 says smote Pharaoh on Sarai''s account.'
  FROM cross_reference_threads t, cross_references x, _session252_ja15_lookup sv, _session252_ja15_lookup tv
 WHERE t.slug='jasher-15-pharaoh-plagued-sarai-restored'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=15 AND sv.verse_number=28
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=13 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 13:15 — *And Pharaoh gave back Sarai, the wife of Abram, and he sent him out of the land of Egypt, and he journeyed to the place where he had pitched his tent at the beginning.* The restoration and sending-out that Jasher 15:30 narrates.'
  FROM cross_reference_threads t, cross_references x, _session252_ja15_lookup sv, _session252_ja15_lookup tv
 WHERE t.slug='jasher-15-pharaoh-plagued-sarai-restored'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=15 AND sv.verse_number=30
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=13 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-15-abram-and-lot-separate
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 13:7 — *And there was a strife between the herdmen of Abram''s cattle and the herdmen of Lot''s cattle: and the Canaanite and the Perizzite dwelled then in the land.* The Genesis source of the herdsmen''s quarrel in Jasher 15:36.'
  FROM cross_reference_threads t, cross_references x, _session252_ja15_lookup sv, _session252_ja15_lookup tv
 WHERE t.slug='jasher-15-abram-and-lot-separate'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=15 AND sv.verse_number=36
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=13 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 13:8 — *And Abram said unto Lot, Let there be no strife, I pray thee, between me and thee, and between my herdmen and thy herdmen; for we be brethren.* Abram''s peace-making appeal, expanded in Jasher 15:41.'
  FROM cross_reference_threads t, cross_references x, _session252_ja15_lookup sv, _session252_ja15_lookup tv
 WHERE t.slug='jasher-15-abram-and-lot-separate'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=15 AND sv.verse_number=41
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=13 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 13:11 — *Then Lot chose him all the plain of Jordan; and Lot journeyed east: and they separated themselves the one from the other.* Lot''s choice of the well-watered plain and departure, as in Jasher 15:46.'
  FROM cross_reference_threads t, cross_references x, _session252_ja15_lookup sv, _session252_ja15_lookup tv
 WHERE t.slug='jasher-15-abram-and-lot-separate'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=15 AND sv.verse_number=46
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=13 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 13:17 — *And in the fourth year of this week Lot parted from him, and Lot dwelt in Sodom, and the men of Sodom were sinners exceedingly.* Jubilees records the same parting of Lot to Sodom that closes Jasher 15:46.'
  FROM cross_reference_threads t, cross_references x, _session252_ja15_lookup sv, _session252_ja15_lookup tv
 WHERE t.slug='jasher-15-abram-and-lot-separate'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=15 AND sv.verse_number=46
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=13 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-15-abram-dwells-in-mamre-hebron
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 13:18 — *Then Abram removed his tent, and came and dwelt in the plain of Mamre, which is in Hebron, and built there an altar unto Yahuah (LORD).* The exact Genesis place-note that Jasher 15:47 records — Mamre in Hebron.'
  FROM cross_reference_threads t, cross_references x, _session252_ja15_lookup sv, _session252_ja15_lookup tv
 WHERE t.slug='jasher-15-abram-dwells-in-mamre-hebron'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=15 AND sv.verse_number=47
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=13 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 13:15 — *For all the land which thou seest, to thee will I give it, and to thy seed for ever.* The land-promise renewed to the seed just as Abram settles in the place where Jasher 15:47 leaves him dwelling.'
  FROM cross_reference_threads t, cross_references x, _session252_ja15_lookup sv, _session252_ja15_lookup tv
 WHERE t.slug='jasher-15-abram-dwells-in-mamre-hebron'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=15 AND sv.verse_number=47
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=13 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

