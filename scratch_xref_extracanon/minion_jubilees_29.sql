-- ----- fragment: minion_jubilees_29.sql (session251 jubilees 29) -----
-- Source anchor: jubilees/jubilees ch29. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ju29 (view _session251_ju29_lookup). Sort band base 53700, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session251_ju29_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jubilees-29-jacob-departs-laban
  ('jubilees', 'jubilees', 29, 2, 'canon', 'genesis', 31, 2, 'free', E'Genesis 31:2 — *And Jacob beheld the countenance of Laban, and, behold, it was not toward him as before.* The turn in Laban''s face is the same cause Jubilees gives for Jacob calling his wives to leave.'),
  ('jubilees', 'jubilees', 29, 2, 'canon', 'genesis', 31, 4, 'free', E'Genesis 31:4 — *And Jacob sent and called Rachel and Leah to the field unto his flock.* Genesis records the very summons Jubilees 29:2 retells, Jacob calling Leah and Rachel to him.'),
  ('jubilees', 'jubilees', 29, 3, 'canon', 'genesis', 31, 3, 'free', E'Genesis 31:3 — *And Yahuah (LORD) said unto Jacob, Return unto the land of thy fathers, and to thy kindred; and I will be with thee.* The dream Jubilees 29:3 reports is Yahuah''s spoken command to return home.'),
  ('jubilees', 'jubilees', 29, 3, 'jubilees', 'jubilees', 27, 26, 'extras', E'Jubilees 27:26 — *And Jacob vowed a vow to Yahuah (God), saying: ''If Yahuah (God) will be with me, and will keep me in this way that I go... so that I come again to my father''s house in peace, then shall Yahuah (God) be my Elohim (God)...''* The Bethel vow recorded earlier in Jubilees is exactly the return Jubilees 29:3 now sees fulfilled.'),
  -- thread: jubilees-29-heap-of-witness-gilead
  ('jubilees', 'jubilees', 29, 6, 'canon', 'genesis', 31, 44, 'free', E'Genesis 31:44 — *Now therefore come thou, let us make a covenant, I and thou; and let it be for a witness between me and thee.* Laban''s proposal is the covenant-oath Jubilees 29:6 says the two men swore.'),
  ('jubilees', 'jubilees', 29, 8, 'canon', 'genesis', 31, 48, 'free', E'Genesis 31:48 — *And Laban said, This heap is a witness between me and thee this day. Therefore was the name of it called Galeed.* The ''Heap of Witness'' Jubilees 29:8 names is Genesis'' Galeed.'),
  ('jubilees', 'jubilees', 29, 8, 'canon', 'genesis', 31, 49, 'free', E'Genesis 31:49 — *And Mizpah; for he said, Yahuah (LORD) watch between me and thee, when we are absent one from another.* The same heap carries the Mizpah watchword behind Jubilees 29:8''s witness.'),
  ('jubilees', 'jubilees', 29, 6, 'canon', 'genesis', 31, 52, 'free', E'Genesis 31:52 — *This heap be witness, and this pillar be witness, that I will not pass over this heap to thee, and that thou shalt not pass over this heap and this pillar unto me, for harm.* This is the exact non-crossing oath Jubilees 29:6 compresses into a single line.'),
  -- thread: jubilees-29-rephaim-giants-gilead
  ('jubilees', 'jubilees', 29, 11, 'canon', 'deuteronomy', 3, 11, 'free', E'Deuteronomy 3:11 — *For only Og king of Bashan remained of the remnant of giants; behold, his bedstead was a bedstead of iron; is it not in Rabbath of the children of Ammon? nine cubits was the length thereof, and four cubits the breadth of it, after the cubit of a man.* The Torah''s last giant-king is exactly the Rephaim Jubilees 29:9-11 says held that land.'),
  ('jubilees', 'jubilees', 29, 10, 'canon', 'joshua', 12, 4, 'free', E'Joshua 12:4 — *And the coast of Og king of Bashan, which was of the remnant of the giants, that dwelt at Ashtaroth and at Edrei.* Joshua seats the giants at Ashtaroth and Edrei, the very kingdom-seats named in Jubilees 29:10.'),
  ('jubilees', 'jubilees', 29, 11, 'canon', 'amos', 2, 9, 'free', E'Amos 2:9 — *Yet destroyed I the Amorite before them, whose height was like the height of the cedars, and he was strong as the oaks; yet I destroyed his fruit from above, and his roots from beneath.* The prophet sings Yahuah''s destroying of the towering Amorite that Jubilees 29:11 says replaced the Rephaim.'),
  -- thread: jubilees-29-esau-reconciled-seir
  ('jubilees', 'jubilees', 29, 11, 'canon', 'genesis', 33, 1, 'free', E'Genesis 33:1 — *And Jacob lifted up his eyes, and looked, and, behold, Esau came, and with him four hundred men. And he divided the children unto Leah, and unto Rachel, and unto the two handmaids.* Genesis fills out the meeting Jubilees 29:11 records as Esau coming to Jacob.'),
  ('jubilees', 'jubilees', 29, 11, 'canon', 'genesis', 33, 3, 'free', E'Genesis 33:3 — *And he passed over before them, and bowed himself to the ground seven times, until he came near to his brother.* Jacob''s bowing approach is the reconciliation Jubilees 29:11 names in a phrase.'),
  ('jubilees', 'jubilees', 29, 11, 'canon', 'genesis', 33, 16, 'free', E'Genesis 33:16 — *So Esau returned that day on his way unto Seir.* Genesis says exactly what Jubilees 29:11 says: Esau departed to the land of Seir.'),
  ('jubilees', 'jubilees', 29, 11, 'canon', 'genesis', 36, 8, 'free', E'Genesis 36:8 — *Thus dwelt Esau in mount Seir: Esau is Edom.* The Torah seals Esau''s settling in Seir that Jubilees 29:11 marks as his departure.'),
  -- thread: jubilees-29-provision-for-isaac
  ('jubilees', 'jubilees', 29, 15, 'canon', 'genesis', 28, 20, 'free', E'Genesis 28:20 — *And Jacob vowed a vow, saying, If Elohim (God) will be with me, and will keep me in this way that I go, and will give me bread to eat, and raiment to put on.* The bread and raiment Jacob asked at Bethel are exactly the food and clothing he sends Isaac in Jubilees 29:15.'),
  ('jubilees', 'jubilees', 29, 17, 'canon', 'genesis', 28, 21, 'free', E'Genesis 28:21 — *So that I come again to my father''s house in peace; then shall Yahuah (LORD) be my Elohim (God).* Isaac''s return to the tower of Abraham in Jubilees 29:17 is the father''s house Jacob vowed to come back to.'),
  ('jubilees', 'jubilees', 29, 20, 'canon', 'genesis', 28, 22, 'free', E'Genesis 28:22 — *And this stone, which I have set for a pillar, shall be Elohim''s (God''s) house: and of all that thou shalt give me I will surely give the tenth unto thee.* The tithe-pledge of the Bethel vow stands behind the giving and blessing of Jubilees 29:20.'),
  ('jubilees', 'jubilees', 29, 20, 'jubilees', 'jubilees', 27, 26, 'extras', E'Jubilees 27:26 — *...and of all that you give me, I shall give the tenth to you, my Elohim (God).* Earlier Jubilees ties Jacob''s vow to the tithe, the same covenant-keeping that closes Jubilees 29:20 in his parents'' blessing.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session251_ju29_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session251_ju29_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-29-jacob-departs-laban',
       E'Jacob departs Laban for Canaan — at the word of the dream',
       E'Jubilees opens chapter 29 with Jacob''s flight: *And Jacob saw that Laban was going to shear his sheep, and Jacob called Leah and Rachel, and spake kindly to them that they should come with him to the land of Canaan* (Jubilees 29:2), and *he told them how he had seen everything in a dream, even all that He had spoken to him that he should return to his father''s house* (Jubilees 29:3). This is the Genesis account retold beside itself. Genesis names the same trigger: *And Jacob beheld the countenance of Laban, and, behold, it was not toward him as before* (Genesis 31:2), and the same summons: *And Jacob sent and called Rachel and Leah to the field unto his flock* (Genesis 31:4). The dream Jubilees compresses is Yahuah''s own command — *And Yahuah (LORD) said unto Jacob, Return unto the land of thy fathers, and to thy kindred; and I will be with thee* (Genesis 31:3) — the very vow Jacob made at Bethel now bearing him home, which earlier Jubilees records word for word: *And Jacob vowed a vow to Yahuah (God), saying: ''If Yahuah (God) will be with me, and will keep me in this way that I go... so that I come again to my father''s house in peace, then shall Yahuah (God) be my Elohim (God)''* (Jubilees 27:26). It ain''t new — the return is the keeping of the covenant-oath.',
       sv.verse_id, ev.verse_id, 'extras', 53700
  FROM _session251_ju29_lookup sv, _session251_ju29_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=29 AND sv.verse_number=1
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=29 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-29-heap-of-witness-gilead',
       E'The Heap of Witness — the covenant at Gilead',
       E'Jubilees seals the parting with a covenant: *Jacob sware to Laban that day, and Laban also to Jacob, that neither should cross the mountain of Gilead to the other with evil purpose* (Jubilees 29:6), and *he made there a heap for a witness; wherefore the name of that place is called: ''The Heap of Witness,'' after this heap* (Jubilees 29:8). Genesis lays the same stones. Laban proposes it — *Now therefore come thou, let us make a covenant, I and thou; and let it be for a witness between me and thee* (Genesis 31:44) — and the heap is raised and named: *And Laban said, This heap is a witness between me and thee this day. Therefore was the name of it called Galeed* (Genesis 31:48), with the watchword *And Mizpah; for he said, Yahuah (LORD) watch between me and thee, when we are absent one from another* (Genesis 31:49). The oath against crossing for harm that Jubilees compresses is Genesis verbatim: *This heap be witness, and this pillar be witness, that I will not pass over this heap to thee, and that thou shalt not pass over this heap and this pillar unto me, for harm* (Genesis 31:52). The ''Heap of Witness'' is Galeed itself — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53703
  FROM _session251_ju29_lookup sv, _session251_ju29_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=29 AND sv.verse_number=5
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=29 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-29-rephaim-giants-gilead',
       E'The Rephaim of Gilead — the giants Yahuah destroyed',
       E'Jubilees pauses to mark the land itself: *before they used to call the land of Gilead the land of the Rephaim; for it was the land of the Rephaim, and the Rephaim were born (there), giants whose height was ten, nine, eight down to seven cubits* (Jubilees 29:9), whose *seats of their kingdom were Karnaim and Ashtaroth, and Edrei* (Jubilees 29:10), and *Yahuah (God) destroyed them because of the evil of their deeds; for they were very malignant, and the Amorites dwelt in their stead* (Jubilees 29:11). The Torah remembers these same giants in these same towns. Of Og the Torah says *For only Og king of Bashan remained of the remnant of giants; behold, his bedstead was a bedstead of iron... nine cubits was the length thereof* (Deuteronomy 3:11), and Joshua sets his throne where Jubilees does: *And the coast of Og king of Bashan, which was of the remnant of the giants, that dwelt at Ashtaroth and at Edrei* (Joshua 12:4). And Yahuah''s destroying of the giant-tall Amorite is sung by the prophet: *Yet destroyed I the Amorite before them, whose height was like the height of the cedars... yet I destroyed his fruit from above, and his roots from beneath* (Amos 2:9). The Rephaim of Jubilees stand in the canon''s own record — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53706
  FROM _session251_ju29_lookup sv, _session251_ju29_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=29 AND sv.verse_number=9
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=29 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-29-esau-reconciled-seir',
       E'Esau reconciled — and parts to Seir',
       E'Across the Jabbok the brothers meet: *And he passed over the Jabbok in the ninth month, on the eleventh thereof. And on that day Esau, his brother, came to him, and he was reconciled to him, and departed from him to the land of Seir, but Jacob dwelt in tents* (Jubilees 29:11). Genesis tells the same encounter in fuller scene — *And Jacob lifted up his eyes, and looked, and, behold, Esau came, and with him four hundred men* (Genesis 33:1), and Jacob *passed over before them, and bowed himself to the ground seven times, until he came near to his brother* (Genesis 33:3). The parting Jubilees notes is Genesis'' own: *So Esau returned that day on his way unto Seir* (Genesis 33:16), and Esau''s settling there is the Torah''s record — *Thus dwelt Esau in mount Seir: Esau is Edom* (Genesis 36:8). The reconciliation and the separation alike are already written in Genesis; Jubilees only sets them by their dates.',
       sv.verse_id, ev.verse_id, 'extras', 53709
  FROM _session251_ju29_lookup sv, _session251_ju29_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=29 AND sv.verse_number=11
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=29 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-29-provision-for-isaac',
       E'Provision for Isaac and Rebecca — bread to eat, raiment to put on',
       E'Jubilees closes the chapter with Jacob honoring his parents: *he sent to his father Isaac of all his substance, clothing, and food, and meat, and drink, and milk, and butter, and cheese, and some dates of the valley* (Jubilees 29:15), and to *his mother Rebecca also four times a year* (Jubilees 29:16), so that *they blessed Jacob with all their heart and with all their soul* (Jubilees 29:20). This quiet provision answers Jacob''s own Bethel vow, where the thing he asked of Yahuah was the very thing he now gives his father: *And Jacob vowed a vow, saying, If Elohim (God) will be with me... and will give me bread to eat, and raiment to put on* (Genesis 28:20), *So that I come again to my father''s house in peace; then shall Yahuah (LORD) be my Elohim (God)* (Genesis 28:21), pledging *of all that thou shalt give me I will surely give the tenth unto thee* (Genesis 28:22). The man kept by the covenant now keeps his father — and earlier Jubilees binds the same vow to the tithe: *of all that you give me, I shall give the tenth to you, my Elohim (God)* (Jubilees 27:26). It ain''t new — the patriarch''s provision is the covenant come round.',
       sv.verse_id, ev.verse_id, 'extras', 53712
  FROM _session251_ju29_lookup sv, _session251_ju29_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=29 AND sv.verse_number=15
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=29 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jubilees-29-jacob-departs-laban
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 31:2 — *And Jacob beheld the countenance of Laban, and, behold, it was not toward him as before.* The turn in Laban''s face is the same cause Jubilees gives for Jacob calling his wives to leave.'
  FROM cross_reference_threads t, cross_references x, _session251_ju29_lookup sv, _session251_ju29_lookup tv
 WHERE t.slug='jubilees-29-jacob-departs-laban'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=29 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=31 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 31:4 — *And Jacob sent and called Rachel and Leah to the field unto his flock.* Genesis records the very summons Jubilees 29:2 retells, Jacob calling Leah and Rachel to him.'
  FROM cross_reference_threads t, cross_references x, _session251_ju29_lookup sv, _session251_ju29_lookup tv
 WHERE t.slug='jubilees-29-jacob-departs-laban'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=29 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=31 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 31:3 — *And Yahuah (LORD) said unto Jacob, Return unto the land of thy fathers, and to thy kindred; and I will be with thee.* The dream Jubilees 29:3 reports is Yahuah''s spoken command to return home.'
  FROM cross_reference_threads t, cross_references x, _session251_ju29_lookup sv, _session251_ju29_lookup tv
 WHERE t.slug='jubilees-29-jacob-departs-laban'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=29 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=31 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 27:26 — *And Jacob vowed a vow to Yahuah (God), saying: ''If Yahuah (God) will be with me, and will keep me in this way that I go... so that I come again to my father''s house in peace, then shall Yahuah (God) be my Elohim (God)...''* The Bethel vow recorded earlier in Jubilees is exactly the return Jubilees 29:3 now sees fulfilled.'
  FROM cross_reference_threads t, cross_references x, _session251_ju29_lookup sv, _session251_ju29_lookup tv
 WHERE t.slug='jubilees-29-jacob-departs-laban'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=29 AND sv.verse_number=3
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=27 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-29-heap-of-witness-gilead
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 31:44 — *Now therefore come thou, let us make a covenant, I and thou; and let it be for a witness between me and thee.* Laban''s proposal is the covenant-oath Jubilees 29:6 says the two men swore.'
  FROM cross_reference_threads t, cross_references x, _session251_ju29_lookup sv, _session251_ju29_lookup tv
 WHERE t.slug='jubilees-29-heap-of-witness-gilead'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=29 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=31 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 31:48 — *And Laban said, This heap is a witness between me and thee this day. Therefore was the name of it called Galeed.* The ''Heap of Witness'' Jubilees 29:8 names is Genesis'' Galeed.'
  FROM cross_reference_threads t, cross_references x, _session251_ju29_lookup sv, _session251_ju29_lookup tv
 WHERE t.slug='jubilees-29-heap-of-witness-gilead'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=29 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=31 AND tv.verse_number=48
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 31:49 — *And Mizpah; for he said, Yahuah (LORD) watch between me and thee, when we are absent one from another.* The same heap carries the Mizpah watchword behind Jubilees 29:8''s witness.'
  FROM cross_reference_threads t, cross_references x, _session251_ju29_lookup sv, _session251_ju29_lookup tv
 WHERE t.slug='jubilees-29-heap-of-witness-gilead'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=29 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=31 AND tv.verse_number=49
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 31:52 — *This heap be witness, and this pillar be witness, that I will not pass over this heap to thee, and that thou shalt not pass over this heap and this pillar unto me, for harm.* This is the exact non-crossing oath Jubilees 29:6 compresses into a single line.'
  FROM cross_reference_threads t, cross_references x, _session251_ju29_lookup sv, _session251_ju29_lookup tv
 WHERE t.slug='jubilees-29-heap-of-witness-gilead'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=29 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=31 AND tv.verse_number=52
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-29-rephaim-giants-gilead
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 3:11 — *For only Og king of Bashan remained of the remnant of giants; behold, his bedstead was a bedstead of iron; is it not in Rabbath of the children of Ammon? nine cubits was the length thereof, and four cubits the breadth of it, after the cubit of a man.* The Torah''s last giant-king is exactly the Rephaim Jubilees 29:9-11 says held that land.'
  FROM cross_reference_threads t, cross_references x, _session251_ju29_lookup sv, _session251_ju29_lookup tv
 WHERE t.slug='jubilees-29-rephaim-giants-gilead'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=29 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=3 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Joshua 12:4 — *And the coast of Og king of Bashan, which was of the remnant of the giants, that dwelt at Ashtaroth and at Edrei.* Joshua seats the giants at Ashtaroth and Edrei, the very kingdom-seats named in Jubilees 29:10.'
  FROM cross_reference_threads t, cross_references x, _session251_ju29_lookup sv, _session251_ju29_lookup tv
 WHERE t.slug='jubilees-29-rephaim-giants-gilead'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=29 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=12 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Amos 2:9 — *Yet destroyed I the Amorite before them, whose height was like the height of the cedars, and he was strong as the oaks; yet I destroyed his fruit from above, and his roots from beneath.* The prophet sings Yahuah''s destroying of the towering Amorite that Jubilees 29:11 says replaced the Rephaim.'
  FROM cross_reference_threads t, cross_references x, _session251_ju29_lookup sv, _session251_ju29_lookup tv
 WHERE t.slug='jubilees-29-rephaim-giants-gilead'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=29 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-29-esau-reconciled-seir
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 33:1 — *And Jacob lifted up his eyes, and looked, and, behold, Esau came, and with him four hundred men. And he divided the children unto Leah, and unto Rachel, and unto the two handmaids.* Genesis fills out the meeting Jubilees 29:11 records as Esau coming to Jacob.'
  FROM cross_reference_threads t, cross_references x, _session251_ju29_lookup sv, _session251_ju29_lookup tv
 WHERE t.slug='jubilees-29-esau-reconciled-seir'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=29 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=33 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 33:3 — *And he passed over before them, and bowed himself to the ground seven times, until he came near to his brother.* Jacob''s bowing approach is the reconciliation Jubilees 29:11 names in a phrase.'
  FROM cross_reference_threads t, cross_references x, _session251_ju29_lookup sv, _session251_ju29_lookup tv
 WHERE t.slug='jubilees-29-esau-reconciled-seir'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=29 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=33 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 33:16 — *So Esau returned that day on his way unto Seir.* Genesis says exactly what Jubilees 29:11 says: Esau departed to the land of Seir.'
  FROM cross_reference_threads t, cross_references x, _session251_ju29_lookup sv, _session251_ju29_lookup tv
 WHERE t.slug='jubilees-29-esau-reconciled-seir'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=29 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=33 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 36:8 — *Thus dwelt Esau in mount Seir: Esau is Edom.* The Torah seals Esau''s settling in Seir that Jubilees 29:11 marks as his departure.'
  FROM cross_reference_threads t, cross_references x, _session251_ju29_lookup sv, _session251_ju29_lookup tv
 WHERE t.slug='jubilees-29-esau-reconciled-seir'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=29 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=36 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-29-provision-for-isaac
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 28:20 — *And Jacob vowed a vow, saying, If Elohim (God) will be with me, and will keep me in this way that I go, and will give me bread to eat, and raiment to put on.* The bread and raiment Jacob asked at Bethel are exactly the food and clothing he sends Isaac in Jubilees 29:15.'
  FROM cross_reference_threads t, cross_references x, _session251_ju29_lookup sv, _session251_ju29_lookup tv
 WHERE t.slug='jubilees-29-provision-for-isaac'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=29 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=28 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 28:21 — *So that I come again to my father''s house in peace; then shall Yahuah (LORD) be my Elohim (God).* Isaac''s return to the tower of Abraham in Jubilees 29:17 is the father''s house Jacob vowed to come back to.'
  FROM cross_reference_threads t, cross_references x, _session251_ju29_lookup sv, _session251_ju29_lookup tv
 WHERE t.slug='jubilees-29-provision-for-isaac'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=29 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=28 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 28:22 — *And this stone, which I have set for a pillar, shall be Elohim''s (God''s) house: and of all that thou shalt give me I will surely give the tenth unto thee.* The tithe-pledge of the Bethel vow stands behind the giving and blessing of Jubilees 29:20.'
  FROM cross_reference_threads t, cross_references x, _session251_ju29_lookup sv, _session251_ju29_lookup tv
 WHERE t.slug='jubilees-29-provision-for-isaac'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=29 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=28 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 27:26 — *...and of all that you give me, I shall give the tenth to you, my Elohim (God).* Earlier Jubilees ties Jacob''s vow to the tithe, the same covenant-keeping that closes Jubilees 29:20 in his parents'' blessing.'
  FROM cross_reference_threads t, cross_references x, _session251_ju29_lookup sv, _session251_ju29_lookup tv
 WHERE t.slug='jubilees-29-provision-for-isaac'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=29 AND sv.verse_number=20
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=27 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

