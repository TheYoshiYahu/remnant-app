-- ----- fragment: minion_jasher_48.sql (session252 jasher 48) -----
-- Source anchor: jasher/jasher ch48. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja48 (view _session252_ja48_lookup). Sort band base 56175, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja48_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-48-pharaohs-two-dreams
  ('jasher', 'jasher', 48, 2, 'canon', 'genesis', 41, 1, 'free', E'Genesis 41:1 — *And it came to pass at the end of two full years, that Pharaoh dreamed: and, behold, he stood by the river.* The very dream by the river that Jasher 48:2 sets at the throne of Egypt.'),
  ('jasher', 'jasher', 48, 4, 'canon', 'genesis', 41, 4, 'free', E'Genesis 41:4 — *And the ill favoured and leanfleshed kine did eat up the seven well favoured and fat kine. So Pharaoh awoke.* The lean kine swallowing the fat that Jasher 48:4 retells word for scene.'),
  ('jasher', 'jasher', 48, 5, 'canon', 'genesis', 41, 7, 'free', E'Genesis 41:7 — *And the seven thin ears devoured the seven rank and full ears. And Pharaoh awoke, and, behold, it was a dream.* The second dream of the ears that Jasher 48:5 records as the king waking.'),
  ('jasher', 'jasher', 48, 2, 'jubilees', 'jubilees', 40, 1, 'extras', E'Jubilees 40:1 — *And in those days Pharaoh dreamed two dreams in one night concerning a famine which was to be in all the land, and he awoke from his sleep and called all the interpreters of dreams that were in Egypt, and magicians, and told them his two dreams, and they were not able to declare (them).* The Jubilees apparatus carries the same two-dream famine, the same baffled interpreters as Jasher 48:2,6.'),
  -- thread: jasher-48-magicians-cannot-interpret
  ('jasher', 'jasher', 48, 6, 'canon', 'genesis', 41, 8, 'free', E'Genesis 41:8 — *And it came to pass in the morning that his spirit was troubled; and he sent and called for all the magicians of Egypt, and all the wise men thereof: and Pharaoh told them his dream; but there was none that could interpret them unto Pharaoh.* The summoning Jasher 48:6 expands into two failed companies of interpreters.'),
  ('jasher', 'jasher', 48, 25, 'canon', 'daniel', 2, 28, 'free', E'Daniel 2:28 — *But there is a Elohim (God) in heaven that revealeth secrets, and maketh known to the king Nebuchadnezzar what shall be in the latter days. Thy dream, and the visions of thy head upon thy bed, are these.* The same pattern Jasher 48:25 names — Yahuah frustrating Egypt''s wise men so His chosen interpreter alone holds the secret.'),
  -- thread: jasher-48-joseph-from-the-pit-exalted
  ('jasher', 'jasher', 48, 41, 'canon', 'genesis', 41, 14, 'free', E'Genesis 41:14 — *Then Pharaoh sent and called Joseph, and they brought him hastily out of the dungeon: and he shaved himself, and changed his raiment, and came in unto Pharaoh.* The hasty raising from the dungeon, the shaving, the changed garment that Jasher 48:41 retells exactly.'),
  ('jasher', 'jasher', 48, 33, 'canon', 'psalms', 105, 18, 'free', E'Psalms 105:18 — *Whose feet they hurt with fetters: he was laid in iron.* The house of confinement Jasher 48:33 names — the righteous one in irons before he is exalted.'),
  ('jasher', 'jasher', 48, 41, 'canon', 'psalms', 105, 20, 'free', E'Psalms 105:20 — *The king sent and loosed him; even the ruler of the people, and let him go free.* The king''s sending that frees Joseph from the dungeon in Jasher 48:41 — the cast-down one lifted up.'),
  ('jasher', 'jasher', 48, 33, 'canon', 'acts', 7, 9, 'free', E'Acts 7:9 — *And the patriarchs, moved with envy, sold Joseph into Egypt: but Elohim (God) was with him.* Stephen names the rejected-but-kept Hebrew servant of the prison whom Jasher 48:33 sets in confinement — the Messiah type, sold yet sustained.'),
  ('jasher', 'jasher', 48, 33, 'jubilees', 'jubilees', 40, 2, 'extras', E'Jubilees 40:2 — *And then the chief butler remembered Joseph and spake of him to the king, and he brought him forth from the prison, and he told his two dreams before him.* The Jubilees apparatus carries the same butler''s remembrance and bringing-forth from prison that Jasher 48:30-41 unfolds.'),
  -- thread: jasher-48-the-interpretation-belongs-to-god
  ('jasher', 'jasher', 48, 51, 'canon', 'genesis', 41, 16, 'free', E'Genesis 41:16 — *And Joseph answered Pharaoh, saying, It is not in me: Elohim (God) shall give Pharaoh an answer of peace.* Joseph''s same disclaimer in Jasher 48:51 — the interpretation belongs to Elohim, not to the man.'),
  ('jasher', 'jasher', 48, 52, 'canon', 'genesis', 41, 38, 'free', E'Genesis 41:38 — *And Pharaoh said unto his servants, Can we find such a one as this is, a man in whom the Spirit of Elohim (God) is?* Pharaoh''s recognition of the Spirit that Jasher 48:52 says clothed Joseph before the king.'),
  ('jasher', 'jasher', 48, 52, 'jubilees', 'jubilees', 40, 5, 'extras', E'Jubilees 40:5 — *And Yahuah (God) gave Joseph favour and mercy in the eyes of Pharaoh, and Pharaoh said to his servants: “We shall not find such a wise and discreet man as this man, for the spirit of Yahuah (God) is with him.”* The Jubilees apparatus names the same Spirit upon Joseph that Jasher 48:52 reports clothing him before the king.'),
  -- thread: jasher-48-seven-years-and-the-counsel-to-save
  ('jasher', 'jasher', 48, 54, 'canon', 'genesis', 41, 26, 'free', E'Genesis 41:26 — *The seven good kine are seven years; and the seven good ears are seven years: the dream is one.* The single interpretation of the doubled dream that Jasher 48:54 gives in the same words.'),
  ('jasher', 'jasher', 48, 57, 'canon', 'genesis', 41, 33, 'free', E'Genesis 41:33 — *Now therefore let Pharaoh look out a man discreet and wise, and set him over the land of Egypt.* Joseph''s counsel to appoint a discreet man, which Jasher 48:57 records in the same breath.'),
  ('jasher', 'jasher', 48, 57, 'canon', 'genesis', 45, 5, 'free', E'Genesis 45:5 — *Now therefore be not grieved, nor angry with yourselves, that ye sold me hither: for Elohim (God) did send me before you to preserve life.* The deliverance of souls Joseph offers in Jasher 48:57 is the very purpose he later confesses — Elohim sent him to preserve life.'),
  ('jasher', 'jasher', 48, 57, 'canon', 'genesis', 50, 20, 'free', E'Genesis 50:20 — *But as for you, ye thought evil against me; but Elohim (God) meant it unto good, to bring to pass, as it is this day, to save much people alive.* The famine-counsel of Jasher 48:57 is God''s design behind the brothers'' evil — meant unto good to save much people alive.'),
  ('jasher', 'jasher', 48, 55, 'jubilees', 'jubilees', 40, 3, 'extras', E'Jubilees 40:3 — *And he said before Pharaoh that his two dreams were one, and he said to him: “Seven years will come (in which there will be) plenty over all the land of Egypt, and after that seven years of famine, such a famine as has not been in all the land.”* The Jubilees apparatus gives the same one-dream reading of seven years'' plenty and seven of famine that Jasher 48:54-55 unfolds.'),
  -- thread: jasher-48-the-sign-of-the-newborn-son
  ('jasher', 'jasher', 48, 64, 'canon', 'genesis', 41, 13, 'free', E'Genesis 41:13 — *And it came to pass, as he interpreted to us, so it was; me he restored unto mine office, and him he hanged.* The canon''s witness that Joseph''s prison interpretations came true is the ground for the confirming sign Jasher 48:62-64 adds — his word does not fall.'),
  ('jasher', 'jasher', 48, 62, 'canon', 'daniel', 2, 28, 'free', E'Daniel 2:28 — *But there is a Elohim (God) in heaven that revealeth secrets, and maketh known to the king Nebuchadnezzar what shall be in the latter days. Thy dream, and the visions of thy head upon thy bed, are these.* The sign that vindicates Joseph''s word in Jasher 48:62 rests on the same heaven-given revelation Daniel later names before another king.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja48_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja48_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-48-pharaohs-two-dreams',
       E'Pharaoh''s two dreams — the kine and the ears',
       E'Jasher opens the famine cycle exactly where Genesis does: *At that time Pharaoh king of Egypt was sitting upon his throne in the land of Egypt, and lay in his bed and dreamed dreams, and Pharaoh saw in his dream that he was standing by the side of the river of Egypt* (Jasher 48:2), the seven fat kine swallowed by the lean (48:3-4) and the seven full ears devoured by the thin (48:5). This is no new tale — it is Moses'' own account retold. *And it came to pass at the end of two full years, that Pharaoh dreamed: and, behold, he stood by the river* (Genesis 41:1). The kine: *And the ill favoured and leanfleshed kine did eat up the seven well favoured and fat kine. So Pharaoh awoke* (Genesis 41:4). The ears: *And the seven thin ears devoured the seven rank and full ears. And Pharaoh awoke, and, behold, it was a dream* (Genesis 41:7). The same scene stands in the Jubilees apparatus: *And in those days Pharaoh dreamed two dreams in one night concerning a famine which was to be in all the land, and he awoke from his sleep and called all the interpreters of dreams that were in Egypt, and magicians, and told them his two dreams, and they were not able to declare (them)* (Jubilees 40:1). It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 56175
  FROM _session252_ja48_lookup sv, _session252_ja48_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=48 AND sv.verse_number=2
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=48 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-48-magicians-cannot-interpret',
       E'The wise men of Egypt cannot interpret',
       E'Jasher fills in what Genesis states in a line — the desperate parade of failed interpreters: *the king hastened and sent and called for all the magicians of Egypt, and the wise men, and they came and stood before Pharaoh* (Jasher 48:6), and after them a second company, all guessing falsely until none pleased the king. Genesis sets the same scene: *and he sent and called for all the magicians of Egypt, and all the wise men thereof: and Pharaoh told them his dream; but there was none that could interpret them unto Pharaoh* (Genesis 41:8). And Jasher names openly what the canon implies — this blindness was from heaven: *this was from Yahuah (the Lord) to frustrate the words of the wise men of Egypt, in order that Joseph might go forth from the house of confinement* (Jasher 48:25); the secret is reserved for the Elohim of heaven, as Daniel will later tell another pagan king: *But there is a Elohim (God) in heaven that revealeth secrets, and maketh known to the king Nebuchadnezzar what shall be in the latter days* (Daniel 2:28). The kingdom of man''s wisdom fails; the chosen one carries the word.',
       sv.verse_id, ev.verse_id, 'extras', 56178
  FROM _session252_ja48_lookup sv, _session252_ja48_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=48 AND sv.verse_number=6
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=48 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-48-joseph-from-the-pit-exalted',
       E'Joseph brought up from the dungeon',
       E'The chief butler at last remembers the Hebrew of the prison: *there was with us a Hebrew servant belonging to the captain of the guard, his name was Joseph... he interpreted to us our dreams, to each man according to his dream, did he correctly interpret* (Jasher 48:33,35), and the king sends: *And the king''s servants went to Joseph, and they brought him hastily out of the dungeon, and the king''s servants shaved him, and he changed his prison garment and he came before the king* (Jasher 48:41). Genesis tells it in the same words: *Then Pharaoh sent and called Joseph, and they brought him hastily out of the dungeon: and he shaved himself, and changed his raiment, and came in unto Pharaoh* (Genesis 41:14). This is the righteous one cast into the pit then lifted to save many — a Messiah type, rejected by his brethren yet preserving life. The Psalmist sings the very arc Jasher narrates: *He sent a man before them, even Joseph, who was sold for a servant: whose feet they hurt with fetters: he was laid in iron* (Psalms 105:17-18), *the king sent and loosed him; even the ruler of the people, and let him go free* (Psalms 105:20). Stephen carries it into the assembly''s witness: *And the patriarchs, moved with envy, sold Joseph into Egypt: but Elohim (God) was with him* (Acts 7:9).',
       sv.verse_id, ev.verse_id, 'extras', 56181
  FROM _session252_ja48_lookup sv, _session252_ja48_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=48 AND sv.verse_number=33
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=48 AND ev.verse_number=41
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-48-the-interpretation-belongs-to-god',
       E'The interpretation belongs to Elohim',
       E'Standing before the throne, Joseph claims nothing for himself: *Let Pharaoh relate his dreams that he dreamed; surely the interpretations belong to Elohim (God)* (Jasher 48:51), and then *Joseph was then clothed with the spirit of Elohim before the king, and he knew all the things that would befall the king from that day forward* (Jasher 48:52). Genesis gives the same humble disclaimer: *It is not in me: Elohim (God) shall give Pharaoh an answer of peace* (Genesis 41:16), and Pharaoh marvels: *Can we find such a one as this is, a man in whom the Spirit of Elohim (God) is?* (Genesis 41:38). The Jubilees apparatus records the same Spirit upon him: *We shall not find such a wise and discreet man as this man, for the spirit of Yahuah (God) is with him* (Jubilees 40:5). The chosen one bears the word of heaven, not the cleverness of Egypt — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 56184
  FROM _session252_ja48_lookup sv, _session252_ja48_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=48 AND sv.verse_number=51
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=48 AND ev.verse_number=53
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-48-seven-years-and-the-counsel-to-save',
       E'Seven years of plenty, seven of famine — counsel to save life',
       E'Joseph reads the doubled dream as one and gives the counsel that will keep a people alive: *Behold the seven years that are coming there will be a great plenty throughout the land, and after that the seven years of famine will follow them, a very grievous famine* (Jasher 48:55), and *I will give you counsel and deliver your soul and the souls of the inhabitants of the land from the evil of the famine, that you seek throughout your kingdom for a man very discreet and wise... and appoint him to superintend over the land of Egypt* (Jasher 48:57). Genesis frames it identically: *The seven good kine are seven years; and the seven good ears are seven years: the dream is one* (Genesis 41:26), and *Now therefore let Pharaoh look out a man discreet and wise, and set him over the land of Egypt* (Genesis 41:33). This is the deep design behind the brothers'' evil — preservation of life. Joseph will later confess it: *Now therefore be not grieved, nor angry with yourselves, that ye sold me hither: for Elohim (God) did send me before you to preserve life* (Genesis 45:5), and again at his father''s death: *as for you, ye thought evil against me; but Elohim (God) meant it unto good, to bring to pass, as it is this day, to save much people alive* (Genesis 50:20). God meant it for good — the gathering of grain a shadow of the gathering of the nation.',
       sv.verse_id, ev.verse_id, 'extras', 56187
  FROM _session252_ja48_lookup sv, _session252_ja48_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=48 AND sv.verse_number=54
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=48 AND ev.verse_number=61
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-48-the-sign-of-the-newborn-son',
       E'The sign of the king''s sons confirms the word',
       E'Jasher adds a legendary confirming sign the canon does not carry, yet anchors it to the canon''s own theme — the word that does not fall to the ground: *This shall be a sign for you respecting all my words, that they are true and that my advice is good for you... your first born son that has been born these two years back shall die, and you will be comforted in the child that will be born to you this day* (Jasher 48:62-63); and *when Joseph had gone out from the king''s presence, those signs which Joseph had spoken to the king came to pass on that day* (Jasher 48:64). The butler had already testified that Joseph''s prison interpretations never failed: *And it came to pass as he interpreted to us, so was the event; there fell not to the ground any of his words* (Jasher 48:36), echoing the canon''s record of those same dreams: *And it came to pass, as he interpreted to us, so it was; me he restored unto mine office, and him he hanged* (Genesis 41:13). The true word of the chosen interpreter is vindicated by its coming to pass — the secret-revealing Elohim of heaven standing behind it (Daniel 2:28).',
       sv.verse_id, ev.verse_id, 'extras', 56190
  FROM _session252_ja48_lookup sv, _session252_ja48_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=48 AND sv.verse_number=62
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=48 AND ev.verse_number=66
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-48-pharaohs-two-dreams
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 41:1 — *And it came to pass at the end of two full years, that Pharaoh dreamed: and, behold, he stood by the river.* The very dream by the river that Jasher 48:2 sets at the throne of Egypt.'
  FROM cross_reference_threads t, cross_references x, _session252_ja48_lookup sv, _session252_ja48_lookup tv
 WHERE t.slug='jasher-48-pharaohs-two-dreams'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=48 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=41 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 41:4 — *And the ill favoured and leanfleshed kine did eat up the seven well favoured and fat kine. So Pharaoh awoke.* The lean kine swallowing the fat that Jasher 48:4 retells word for scene.'
  FROM cross_reference_threads t, cross_references x, _session252_ja48_lookup sv, _session252_ja48_lookup tv
 WHERE t.slug='jasher-48-pharaohs-two-dreams'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=48 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=41 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 41:7 — *And the seven thin ears devoured the seven rank and full ears. And Pharaoh awoke, and, behold, it was a dream.* The second dream of the ears that Jasher 48:5 records as the king waking.'
  FROM cross_reference_threads t, cross_references x, _session252_ja48_lookup sv, _session252_ja48_lookup tv
 WHERE t.slug='jasher-48-pharaohs-two-dreams'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=48 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=41 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 40:1 — *And in those days Pharaoh dreamed two dreams in one night concerning a famine which was to be in all the land, and he awoke from his sleep and called all the interpreters of dreams that were in Egypt, and magicians, and told them his two dreams, and they were not able to declare (them).* The Jubilees apparatus carries the same two-dream famine, the same baffled interpreters as Jasher 48:2,6.'
  FROM cross_reference_threads t, cross_references x, _session252_ja48_lookup sv, _session252_ja48_lookup tv
 WHERE t.slug='jasher-48-pharaohs-two-dreams'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=48 AND sv.verse_number=2
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=40 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-48-magicians-cannot-interpret
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 41:8 — *And it came to pass in the morning that his spirit was troubled; and he sent and called for all the magicians of Egypt, and all the wise men thereof: and Pharaoh told them his dream; but there was none that could interpret them unto Pharaoh.* The summoning Jasher 48:6 expands into two failed companies of interpreters.'
  FROM cross_reference_threads t, cross_references x, _session252_ja48_lookup sv, _session252_ja48_lookup tv
 WHERE t.slug='jasher-48-magicians-cannot-interpret'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=48 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=41 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 2:28 — *But there is a Elohim (God) in heaven that revealeth secrets, and maketh known to the king Nebuchadnezzar what shall be in the latter days. Thy dream, and the visions of thy head upon thy bed, are these.* The same pattern Jasher 48:25 names — Yahuah frustrating Egypt''s wise men so His chosen interpreter alone holds the secret.'
  FROM cross_reference_threads t, cross_references x, _session252_ja48_lookup sv, _session252_ja48_lookup tv
 WHERE t.slug='jasher-48-magicians-cannot-interpret'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=48 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=2 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-48-joseph-from-the-pit-exalted
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 41:14 — *Then Pharaoh sent and called Joseph, and they brought him hastily out of the dungeon: and he shaved himself, and changed his raiment, and came in unto Pharaoh.* The hasty raising from the dungeon, the shaving, the changed garment that Jasher 48:41 retells exactly.'
  FROM cross_reference_threads t, cross_references x, _session252_ja48_lookup sv, _session252_ja48_lookup tv
 WHERE t.slug='jasher-48-joseph-from-the-pit-exalted'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=48 AND sv.verse_number=41
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=41 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalms 105:18 — *Whose feet they hurt with fetters: he was laid in iron.* The house of confinement Jasher 48:33 names — the righteous one in irons before he is exalted.'
  FROM cross_reference_threads t, cross_references x, _session252_ja48_lookup sv, _session252_ja48_lookup tv
 WHERE t.slug='jasher-48-joseph-from-the-pit-exalted'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=48 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=105 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalms 105:20 — *The king sent and loosed him; even the ruler of the people, and let him go free.* The king''s sending that frees Joseph from the dungeon in Jasher 48:41 — the cast-down one lifted up.'
  FROM cross_reference_threads t, cross_references x, _session252_ja48_lookup sv, _session252_ja48_lookup tv
 WHERE t.slug='jasher-48-joseph-from-the-pit-exalted'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=48 AND sv.verse_number=41
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=105 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Acts 7:9 — *And the patriarchs, moved with envy, sold Joseph into Egypt: but Elohim (God) was with him.* Stephen names the rejected-but-kept Hebrew servant of the prison whom Jasher 48:33 sets in confinement — the Messiah type, sold yet sustained.'
  FROM cross_reference_threads t, cross_references x, _session252_ja48_lookup sv, _session252_ja48_lookup tv
 WHERE t.slug='jasher-48-joseph-from-the-pit-exalted'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=48 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 40:2 — *And then the chief butler remembered Joseph and spake of him to the king, and he brought him forth from the prison, and he told his two dreams before him.* The Jubilees apparatus carries the same butler''s remembrance and bringing-forth from prison that Jasher 48:30-41 unfolds.'
  FROM cross_reference_threads t, cross_references x, _session252_ja48_lookup sv, _session252_ja48_lookup tv
 WHERE t.slug='jasher-48-joseph-from-the-pit-exalted'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=48 AND sv.verse_number=33
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=40 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-48-the-interpretation-belongs-to-god
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 41:16 — *And Joseph answered Pharaoh, saying, It is not in me: Elohim (God) shall give Pharaoh an answer of peace.* Joseph''s same disclaimer in Jasher 48:51 — the interpretation belongs to Elohim, not to the man.'
  FROM cross_reference_threads t, cross_references x, _session252_ja48_lookup sv, _session252_ja48_lookup tv
 WHERE t.slug='jasher-48-the-interpretation-belongs-to-god'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=48 AND sv.verse_number=51
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=41 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 41:38 — *And Pharaoh said unto his servants, Can we find such a one as this is, a man in whom the Spirit of Elohim (God) is?* Pharaoh''s recognition of the Spirit that Jasher 48:52 says clothed Joseph before the king.'
  FROM cross_reference_threads t, cross_references x, _session252_ja48_lookup sv, _session252_ja48_lookup tv
 WHERE t.slug='jasher-48-the-interpretation-belongs-to-god'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=48 AND sv.verse_number=52
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=41 AND tv.verse_number=38
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 40:5 — *And Yahuah (God) gave Joseph favour and mercy in the eyes of Pharaoh, and Pharaoh said to his servants: “We shall not find such a wise and discreet man as this man, for the spirit of Yahuah (God) is with him.”* The Jubilees apparatus names the same Spirit upon Joseph that Jasher 48:52 reports clothing him before the king.'
  FROM cross_reference_threads t, cross_references x, _session252_ja48_lookup sv, _session252_ja48_lookup tv
 WHERE t.slug='jasher-48-the-interpretation-belongs-to-god'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=48 AND sv.verse_number=52
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=40 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-48-seven-years-and-the-counsel-to-save
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 41:26 — *The seven good kine are seven years; and the seven good ears are seven years: the dream is one.* The single interpretation of the doubled dream that Jasher 48:54 gives in the same words.'
  FROM cross_reference_threads t, cross_references x, _session252_ja48_lookup sv, _session252_ja48_lookup tv
 WHERE t.slug='jasher-48-seven-years-and-the-counsel-to-save'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=48 AND sv.verse_number=54
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=41 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 41:33 — *Now therefore let Pharaoh look out a man discreet and wise, and set him over the land of Egypt.* Joseph''s counsel to appoint a discreet man, which Jasher 48:57 records in the same breath.'
  FROM cross_reference_threads t, cross_references x, _session252_ja48_lookup sv, _session252_ja48_lookup tv
 WHERE t.slug='jasher-48-seven-years-and-the-counsel-to-save'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=48 AND sv.verse_number=57
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=41 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 45:5 — *Now therefore be not grieved, nor angry with yourselves, that ye sold me hither: for Elohim (God) did send me before you to preserve life.* The deliverance of souls Joseph offers in Jasher 48:57 is the very purpose he later confesses — Elohim sent him to preserve life.'
  FROM cross_reference_threads t, cross_references x, _session252_ja48_lookup sv, _session252_ja48_lookup tv
 WHERE t.slug='jasher-48-seven-years-and-the-counsel-to-save'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=48 AND sv.verse_number=57
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=45 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 50:20 — *But as for you, ye thought evil against me; but Elohim (God) meant it unto good, to bring to pass, as it is this day, to save much people alive.* The famine-counsel of Jasher 48:57 is God''s design behind the brothers'' evil — meant unto good to save much people alive.'
  FROM cross_reference_threads t, cross_references x, _session252_ja48_lookup sv, _session252_ja48_lookup tv
 WHERE t.slug='jasher-48-seven-years-and-the-counsel-to-save'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=48 AND sv.verse_number=57
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=50 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 40:3 — *And he said before Pharaoh that his two dreams were one, and he said to him: “Seven years will come (in which there will be) plenty over all the land of Egypt, and after that seven years of famine, such a famine as has not been in all the land.”* The Jubilees apparatus gives the same one-dream reading of seven years'' plenty and seven of famine that Jasher 48:54-55 unfolds.'
  FROM cross_reference_threads t, cross_references x, _session252_ja48_lookup sv, _session252_ja48_lookup tv
 WHERE t.slug='jasher-48-seven-years-and-the-counsel-to-save'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=48 AND sv.verse_number=55
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=40 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-48-the-sign-of-the-newborn-son
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 41:13 — *And it came to pass, as he interpreted to us, so it was; me he restored unto mine office, and him he hanged.* The canon''s witness that Joseph''s prison interpretations came true is the ground for the confirming sign Jasher 48:62-64 adds — his word does not fall.'
  FROM cross_reference_threads t, cross_references x, _session252_ja48_lookup sv, _session252_ja48_lookup tv
 WHERE t.slug='jasher-48-the-sign-of-the-newborn-son'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=48 AND sv.verse_number=64
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=41 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 2:28 — *But there is a Elohim (God) in heaven that revealeth secrets, and maketh known to the king Nebuchadnezzar what shall be in the latter days. Thy dream, and the visions of thy head upon thy bed, are these.* The sign that vindicates Joseph''s word in Jasher 48:62 rests on the same heaven-given revelation Daniel later names before another king.'
  FROM cross_reference_threads t, cross_references x, _session252_ja48_lookup sv, _session252_ja48_lookup tv
 WHERE t.slug='jasher-48-the-sign-of-the-newborn-son'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=48 AND sv.verse_number=62
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=2 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

