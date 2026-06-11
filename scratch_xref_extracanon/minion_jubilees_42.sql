-- ----- fragment: minion_jubilees_42.sql (session251 jubilees 42) -----
-- Source anchor: jubilees/jubilees ch42. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ju42 (view _session251_ju42_lookup). Sort band base 54025, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session251_ju42_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jubilees-42-famine-ten-go-down
  ('jubilees', 'jubilees', 42, 1, 'canon', 'genesis', 42, 1, 'free', E'Genesis 42:1 — *Now when Jacob saw that there was corn in Egypt, Jacob said unto his sons, Why do ye look one upon another?* The famine that opens Jubilees 42:1 is the same that drives Jacob to send his sons in Genesis.'),
  ('jubilees', 'jubilees', 42, 4, 'canon', 'genesis', 42, 3, 'free', E'Genesis 42:3 — *And Joseph’s ten brethren went down to buy corn in Egypt.* Jubilees 42:4''s ten sons sent for food are Genesis'' ten brethren going down.'),
  ('jubilees', 'jubilees', 42, 4, 'canon', 'genesis', 42, 4, 'free', E'Genesis 42:4 — *But Benjamin, Joseph’s brother, Jacob sent not with his brethren; for he said, Lest peradventure mischief befall him.* The held-back Benjamin of Jubilees 42:4 is Genesis'' Benjamin kept home against mischief.'),
  ('jubilees', 'jubilees', 42, 4, 'jasher', 'jasher', 51, 5, 'extras', E'Jasher 51:5 — *And the sons of Jacob went forth and they went to Egypt, and the sons of Jacob did all as their father had commanded them, and Jacob did not send Benjamin, for he said, Lest an accident might befall him on the road like his brother; and ten of Jacob’s sons went forth.* Jasher matches Jubilees 42:4 down to Benjamin held back and the ten going.'),
  -- thread: jubilees-42-joseph-knew-them-spies
  ('jubilees', 'jubilees', 42, 5, 'canon', 'genesis', 42, 8, 'free', E'Genesis 42:8 — *And Joseph knew his brethren, but they knew not him.* This is exactly the recognition asymmetry of Jubilees 42:5, where Joseph recognizes them and they do not recognize him.'),
  ('jubilees', 'jubilees', 42, 5, 'canon', 'genesis', 42, 9, 'free', E'Genesis 42:9 — *And Joseph remembered the dreams which he dreamed of them, and said unto them, Ye are spies; to see the nakedness of the land ye are come.* The spy-accusation of Jubilees 42:5 is Joseph''s charge in Genesis, rooted in the dreams now fulfilled.'),
  ('jubilees', 'jubilees', 42, 5, 'jasher', 'jasher', 51, 20, 'extras', E'Jasher 51:20 — *And Joseph saw his brethren, and he knew them, but they knew him not, for Joseph was very great in their eyes, therefore they knew him not.* Jasher gives the reason behind Jubilees 42:5: his greatness blinded them to the brother they had cast off.'),
  ('jubilees', 'jubilees', 42, 5, 'canon', 'acts', 7, 9, 'free', E'Acts 7:9 — *And the patriarchs, moved with envy, sold Joseph into Egypt: but Elohim (God) was with him.* Stephen frames the man now accusing them in Jubilees 42:5 as the rejected one whom Elohim was with — the deliverer pattern.'),
  -- thread: jubilees-42-simeon-bound-money-returned
  ('jubilees', 'jubilees', 42, 6, 'canon', 'genesis', 42, 24, 'free', E'Genesis 42:24 — *And he turned himself about from them, and wept; and returned to them again, and communed with them, and took from them Simeon, and bound him before their eyes.* The detained Simeon of Jubilees 42:6 is Genesis'' Simeon bound, with Joseph''s secret weeping behind it.'),
  ('jubilees', 'jubilees', 42, 6, 'canon', 'genesis', 42, 25, 'free', E'Genesis 42:25 — *Then Joseph commanded to fill their sacks with corn, and to restore every man’s money into his sack, and to give them provision for the way: and thus did he unto them.* The gold put back in the sacks unknown in Jubilees 42:6 is Genesis'' restored money.'),
  ('jubilees', 'jubilees', 42, 9, 'canon', 'genesis', 42, 30, 'free', E'Genesis 42:30 — *The man, who is the lord of the land, spake roughly to us, and took us for spies of the country.* The report carried back to the father in Jubilees 42:9 is the brothers'' own telling in Genesis.'),
  -- thread: jubilees-42-jacob-grief-against-me
  ('jubilees', 'jubilees', 42, 10, 'canon', 'genesis', 42, 36, 'free', E'Genesis 42:36 — *And Jacob their father said unto them, Me have ye bereaved of my children: Joseph is not, and Simeon is not, and ye will take Benjamin away: all these things are against me.* This is verbatim the lament Jubilees 42:10 puts on Jacob — bereaved, and all against him.'),
  ('jubilees', 'jubilees', 42, 11, 'canon', 'genesis', 42, 35, 'free', E'Genesis 42:35 — *And it came to pass as they emptied their sacks, that, behold, every man’s bundle of money was in his sack: and when both they and their father saw the bundles of money, they were afraid.* The returned money that makes Jacob fear to send Benjamin in Jubilees 42:11 is the silver discovered in Genesis.'),
  ('jubilees', 'jubilees', 42, 11, 'canon', 'genesis', 42, 38, 'free', E'Genesis 42:38 — *And he said, My son shall not go down with you; for his brother is dead, and he is left alone: if mischief befall him by the way in the which ye go, then shall ye bring down my gray hairs with sorrow to the grave.* Jacob''s refusal in Jubilees 42:11 is his very words in Genesis, dreading sorrow to death.'),
  -- thread: jubilees-42-judah-surety-benjamin
  ('jubilees', 'jubilees', 42, 19, 'canon', 'genesis', 43, 8, 'free', E'Genesis 43:8 — *And Yahudah (Judah) said unto Yashar''el (Israel) his father, Send the lad with me, and we will arise and go; that we may live, and not die, both we, and thou, and also our little ones.* Judah''s surety in Jubilees 42:19 is the kingly tribe''s pledge in Genesis to live and not die.'),
  ('jubilees', 'jubilees', 42, 18, 'canon', 'genesis', 42, 37, 'free', E'Genesis 42:37 — *And Reuben spake unto his father, saying, Slay my two sons, if I bring him not to thee: deliver him into my hand, and I will bring him to thee again.* Reuben''s rejected offer in Jubilees 42:18 is his very pledge in Genesis, set against Judah''s accepted surety.'),
  ('jubilees', 'jubilees', 42, 15, 'canon', 'genesis', 42, 2, 'free', E'Genesis 42:2 — *And he said, Behold, I have heard that there is corn in Egypt: get you down thither, and buy for us from thence; that we may live, and not die.* Israel''s renewed sending in Jubilees 42:15, that we die not, repeats Jacob''s command in Genesis to live and not die.'),
  ('jubilees', 'jubilees', 42, 19, 'canon', 'matthew', 1, 3, 'free', E'Matthew 1:3 — *And Judas begat Phares and Zara of Thamar; and Phares begat Esrom; and Esrom begat Aram;* The Judah who stands surety in Jubilees 42:19 is the Judah of the Messianic line, Perez of Tamar carried down to Messiah.'),
  -- thread: jubilees-42-benjamin-feast-portion
  ('jubilees', 'jubilees', 42, 21, 'canon', 'genesis', 43, 29, 'free', E'Genesis 43:29 — *And he lifted up his eyes, and saw his brother Benjamin, his mother’s son, and said, Is this your younger brother, of whom ye spake unto me? And he said, Elohim (God) be gracious unto thee, my son.* Joseph''s gracious word over Benjamin in Jubilees 42:21 is his blessing in Genesis.'),
  ('jubilees', 'jubilees', 42, 20, 'jasher', 'jasher', 51, 19, 'extras', E'Jasher 51:19 — *And the sons of Jacob saw Joseph, and his figure and comeliness and dignity of countenance seemed wonderful in their eyes, and they again bowed down to him to the ground.* The brothers standing before Joseph in Jubilees 42:20-21 bow before the throne in Jasher, the dreams fulfilled.'),
  ('jubilees', 'jubilees', 42, 21, 'canon', 'genesis', 50, 20, 'free', E'Genesis 50:20 — *But as for you, ye thought evil against me; but Elohim (God) meant it unto good, to bring to pass, as it is this day, to save much people alive.* The feast Joseph spreads in Jubilees 42:21 foreshadows his final word: the evil done him was meant by Elohim for good, to save much people alive.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session251_ju42_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session251_ju42_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-42-famine-ten-go-down',
       E'The famine, and the ten go down to Egypt',
       E'Jubilees dates and retells the opening of Genesis 42: *And in the first year of the third week of the forty-fifth jubilee the famine began to come into the land, and the rain refused to be given to the earth, for none whatever fell* (Jubilees 42:1), so that *Jacob heard that there was food in Egypt, and he sent his ten sons that they should procure food for him in Egypt; but Benjamin he did not send* (Jubilees 42:4). This is the Genesis account told beside itself — *Now when Jacob saw that there was corn in Egypt, Jacob said unto his sons, Why do ye look one upon another?* (Genesis 42:1), and *Joseph''s ten brethren went down to buy corn in Egypt* (Genesis 42:3), while *Benjamin, Joseph''s brother, Jacob sent not with his brethren; for he said, Lest peradventure mischief befall him* (Genesis 42:4). Jasher tells the same descent, even adding the brothers'' secret hope: *And the sons of Jacob went forth and they went to Egypt... and Jacob did not send Benjamin, for he said, Lest an accident might befall him on the road like his brother; and ten of Jacob''s sons went forth* (Jasher 51:5). It ain''t new — Jubilees, Genesis, and Jasher carry one famine and one company of ten.',
       sv.verse_id, ev.verse_id, 'extras', 54025
  FROM _session251_ju42_lookup sv, _session251_ju42_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=42 AND sv.verse_number=1
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=42 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-42-joseph-knew-them-spies',
       E'Joseph knew them, but they knew not him',
       E'The rejected brother now stands exalted and unrecognized: *And Joseph recognized them, but they did not recognize him, and he spake to them and questioned them, and he said to them: “Are you not spies, and have you not come to explore the approaches of the land?” And he put them in ward* (Jubilees 42:5). Genesis tells it twice over — *And Joseph saw his brethren, and he knew them, but made himself strange unto them, and spake roughly unto them* (Genesis 42:7), and plainly: *And Joseph knew his brethren, but they knew not him* (Genesis 42:8); *And Joseph remembered the dreams which he dreamed of them, and said unto them, Ye are spies; to see the nakedness of the land ye are come* (Genesis 42:9). Jasher carries the same charge: *And Joseph saw his brethren, and he knew them, but they knew him not, for Joseph was very great in their eyes, therefore they knew him not* (Jasher 51:20). This is the framework''s deliverer rejected then exalted — the patriarchs who once sold him now bow before him and do not see him; Stephen names the wound by name: *And the patriarchs, moved with envy, sold Joseph into Egypt: but Elohim (God) was with him* (Acts 7:9).',
       sv.verse_id, ev.verse_id, 'extras', 54028
  FROM _session251_ju42_lookup sv, _session251_ju42_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=42 AND sv.verse_number=5
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=42 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-42-simeon-bound-money-returned',
       E'Simeon detained, the money in the sacks',
       E'Joseph keeps one brother as a pledge and secretly restores their silver: *And after that he set them free again, and detained Simeon alone and sent off his nine brothers. And he filled their sacks with corn, and he put their gold in their sacks, and they did not know* (Jubilees 42:6); and at home *they told their father all that had befallen them, and how the lord of the country had spoken roughly to them, and had seized Simeon till they should bring Benjamin* (Jubilees 42:9). Genesis tells the binding and the hidden money: *And he turned himself about from them, and wept; and returned to them again, and communed with them, and took from them Simeon, and bound him before their eyes* (Genesis 42:24); *Then Joseph commanded to fill their sacks with corn, and to restore every man''s money into his sack, and to give them provision for the way: and thus did he unto them* (Genesis 42:25). The brothers'' dread is the deliverer''s hidden providence at work — the very mercy looks like a trap.',
       sv.verse_id, ev.verse_id, 'extras', 54031
  FROM _session251_ju42_lookup sv, _session251_ju42_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=42 AND sv.verse_number=6
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=42 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-42-jacob-grief-against-me',
       E'Jacob''s grief: on me your wickedness has come',
       E'The father''s lament is one of Scripture''s bitterest: *And Jacob said: “Me have you bereaved of my children! Joseph is not and Simeon also is not, and you will take Benjamin away. On me has your wickedness come.”* (Jubilees 42:10), and he refuses Benjamin *For he saw that their money had been returned to every man in his sack, and for this reason he feared to send him* (Jubilees 42:11). Genesis sets the same words on Jacob''s lips: *And Jacob their father said unto them, Me have ye bereaved of my children: Joseph is not, and Simeon is not, and ye will take Benjamin away: all these things are against me* (Genesis 42:36). And Reuben''s desperate pledge stands in both books — *And Reuben said: “Give him into my hand, and if I do not bring him back to you, slay my two sons instead of his soul.”* (Jubilees 42:18) answers *And Reuben spake unto his father, saying, Slay my two sons, if I bring him not to thee: deliver him into my hand, and I will bring him to thee again* (Genesis 42:37). Jacob, blind to the providence, cries that all is against him — yet the famine is bending the whole house toward the deliverer it does not recognize.',
       sv.verse_id, ev.verse_id, 'extras', 54034
  FROM _session251_ju42_lookup sv, _session251_ju42_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=42 AND sv.verse_number=10
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=42 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-42-judah-surety-benjamin',
       E'Judah''s surety: send him with me',
       E'Where Reuben fails, the Messianic son steps forward: *And Yahudah (Judah) came near and said: “Send him with me, and if I do not bring him back to you, let me bear the blame before you all the days of my life.”* (Jubilees 42:19). This is Genesis'' Judah, the one through whom the seed runs to David and to Messiah, standing surety: *And Yahudah (Judah) said unto Yashar''el (Israel) his father, Send the lad with me, and we will arise and go; that we may live, and not die, both we, and thou, and also our little ones* (Genesis 43:8). It is the same Judah who in the chapter before (Jubilees 41 / Genesis 38) carried the line through Tamar to Perez — and from Perez to David and to Messiah (Matthew 1:3). When Israel relents in Jubilees 42:15 — *Go again, and procure food for us that we die not* — he echoes Judah''s own plea that we live and not die. The pledge that frees Benjamin is borne by the kingly tribe; the seed that saves is carried by the one who offers himself as surety.',
       sv.verse_id, ev.verse_id, 'extras', 54037
  FROM _session251_ju42_lookup sv, _session251_ju42_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=42 AND sv.verse_number=15
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=42 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-42-benjamin-feast-portion',
       E'Benjamin brought, the feast and the seven-fold portion',
       E'Benjamin comes, and the hidden deliverer blesses him: *And they went and stood before Joseph, and he saw Benjamin his brother, and he knew him, and said to them: “Is this your youngest brother?”... And he said: “Yahuah (God) be gracious to you, my son!”... and he made a feast for them* (Jubilees 42:21), and *the portion of Benjamin was seven times larger than that of any of theirs* (Jubilees 42:23). Genesis matches the gracious word and the favored portion in the chapter that follows — *And he lifted up his eyes, and saw his brother Benjamin... and said, Elohim (God) be gracious unto thee, my son* (Genesis 43:29). Jasher tells the same descent and standing before the throne: *And the sons of Jacob saw Joseph, and his figure and comeliness and dignity of countenance seemed wonderful in their eyes, and they again bowed down to him to the ground* (Jasher 51:19). The brothers bow, the dreams stand fulfilled, and the deliverer feasts the ones who sold him — the table of the rejected-then-exalted brother.',
       sv.verse_id, ev.verse_id, 'extras', 54040
  FROM _session251_ju42_lookup sv, _session251_ju42_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=42 AND sv.verse_number=20
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=42 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jubilees-42-famine-ten-go-down
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 42:1 — *Now when Jacob saw that there was corn in Egypt, Jacob said unto his sons, Why do ye look one upon another?* The famine that opens Jubilees 42:1 is the same that drives Jacob to send his sons in Genesis.'
  FROM cross_reference_threads t, cross_references x, _session251_ju42_lookup sv, _session251_ju42_lookup tv
 WHERE t.slug='jubilees-42-famine-ten-go-down'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=42 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=42 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 42:3 — *And Joseph’s ten brethren went down to buy corn in Egypt.* Jubilees 42:4''s ten sons sent for food are Genesis'' ten brethren going down.'
  FROM cross_reference_threads t, cross_references x, _session251_ju42_lookup sv, _session251_ju42_lookup tv
 WHERE t.slug='jubilees-42-famine-ten-go-down'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=42 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=42 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 42:4 — *But Benjamin, Joseph’s brother, Jacob sent not with his brethren; for he said, Lest peradventure mischief befall him.* The held-back Benjamin of Jubilees 42:4 is Genesis'' Benjamin kept home against mischief.'
  FROM cross_reference_threads t, cross_references x, _session251_ju42_lookup sv, _session251_ju42_lookup tv
 WHERE t.slug='jubilees-42-famine-ten-go-down'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=42 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=42 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jasher 51:5 — *And the sons of Jacob went forth and they went to Egypt, and the sons of Jacob did all as their father had commanded them, and Jacob did not send Benjamin, for he said, Lest an accident might befall him on the road like his brother; and ten of Jacob’s sons went forth.* Jasher matches Jubilees 42:4 down to Benjamin held back and the ten going.'
  FROM cross_reference_threads t, cross_references x, _session251_ju42_lookup sv, _session251_ju42_lookup tv
 WHERE t.slug='jubilees-42-famine-ten-go-down'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=42 AND sv.verse_number=4
   AND tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=51 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-42-joseph-knew-them-spies
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 42:8 — *And Joseph knew his brethren, but they knew not him.* This is exactly the recognition asymmetry of Jubilees 42:5, where Joseph recognizes them and they do not recognize him.'
  FROM cross_reference_threads t, cross_references x, _session251_ju42_lookup sv, _session251_ju42_lookup tv
 WHERE t.slug='jubilees-42-joseph-knew-them-spies'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=42 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=42 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 42:9 — *And Joseph remembered the dreams which he dreamed of them, and said unto them, Ye are spies; to see the nakedness of the land ye are come.* The spy-accusation of Jubilees 42:5 is Joseph''s charge in Genesis, rooted in the dreams now fulfilled.'
  FROM cross_reference_threads t, cross_references x, _session251_ju42_lookup sv, _session251_ju42_lookup tv
 WHERE t.slug='jubilees-42-joseph-knew-them-spies'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=42 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=42 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jasher 51:20 — *And Joseph saw his brethren, and he knew them, but they knew him not, for Joseph was very great in their eyes, therefore they knew him not.* Jasher gives the reason behind Jubilees 42:5: his greatness blinded them to the brother they had cast off.'
  FROM cross_reference_threads t, cross_references x, _session251_ju42_lookup sv, _session251_ju42_lookup tv
 WHERE t.slug='jubilees-42-joseph-knew-them-spies'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=42 AND sv.verse_number=5
   AND tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=51 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Acts 7:9 — *And the patriarchs, moved with envy, sold Joseph into Egypt: but Elohim (God) was with him.* Stephen frames the man now accusing them in Jubilees 42:5 as the rejected one whom Elohim was with — the deliverer pattern.'
  FROM cross_reference_threads t, cross_references x, _session251_ju42_lookup sv, _session251_ju42_lookup tv
 WHERE t.slug='jubilees-42-joseph-knew-them-spies'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=42 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-42-simeon-bound-money-returned
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 42:24 — *And he turned himself about from them, and wept; and returned to them again, and communed with them, and took from them Simeon, and bound him before their eyes.* The detained Simeon of Jubilees 42:6 is Genesis'' Simeon bound, with Joseph''s secret weeping behind it.'
  FROM cross_reference_threads t, cross_references x, _session251_ju42_lookup sv, _session251_ju42_lookup tv
 WHERE t.slug='jubilees-42-simeon-bound-money-returned'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=42 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=42 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 42:25 — *Then Joseph commanded to fill their sacks with corn, and to restore every man’s money into his sack, and to give them provision for the way: and thus did he unto them.* The gold put back in the sacks unknown in Jubilees 42:6 is Genesis'' restored money.'
  FROM cross_reference_threads t, cross_references x, _session251_ju42_lookup sv, _session251_ju42_lookup tv
 WHERE t.slug='jubilees-42-simeon-bound-money-returned'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=42 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=42 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 42:30 — *The man, who is the lord of the land, spake roughly to us, and took us for spies of the country.* The report carried back to the father in Jubilees 42:9 is the brothers'' own telling in Genesis.'
  FROM cross_reference_threads t, cross_references x, _session251_ju42_lookup sv, _session251_ju42_lookup tv
 WHERE t.slug='jubilees-42-simeon-bound-money-returned'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=42 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=42 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-42-jacob-grief-against-me
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 42:36 — *And Jacob their father said unto them, Me have ye bereaved of my children: Joseph is not, and Simeon is not, and ye will take Benjamin away: all these things are against me.* This is verbatim the lament Jubilees 42:10 puts on Jacob — bereaved, and all against him.'
  FROM cross_reference_threads t, cross_references x, _session251_ju42_lookup sv, _session251_ju42_lookup tv
 WHERE t.slug='jubilees-42-jacob-grief-against-me'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=42 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=42 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 42:35 — *And it came to pass as they emptied their sacks, that, behold, every man’s bundle of money was in his sack: and when both they and their father saw the bundles of money, they were afraid.* The returned money that makes Jacob fear to send Benjamin in Jubilees 42:11 is the silver discovered in Genesis.'
  FROM cross_reference_threads t, cross_references x, _session251_ju42_lookup sv, _session251_ju42_lookup tv
 WHERE t.slug='jubilees-42-jacob-grief-against-me'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=42 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=42 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 42:38 — *And he said, My son shall not go down with you; for his brother is dead, and he is left alone: if mischief befall him by the way in the which ye go, then shall ye bring down my gray hairs with sorrow to the grave.* Jacob''s refusal in Jubilees 42:11 is his very words in Genesis, dreading sorrow to death.'
  FROM cross_reference_threads t, cross_references x, _session251_ju42_lookup sv, _session251_ju42_lookup tv
 WHERE t.slug='jubilees-42-jacob-grief-against-me'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=42 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=42 AND tv.verse_number=38
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-42-judah-surety-benjamin
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 43:8 — *And Yahudah (Judah) said unto Yashar''el (Israel) his father, Send the lad with me, and we will arise and go; that we may live, and not die, both we, and thou, and also our little ones.* Judah''s surety in Jubilees 42:19 is the kingly tribe''s pledge in Genesis to live and not die.'
  FROM cross_reference_threads t, cross_references x, _session251_ju42_lookup sv, _session251_ju42_lookup tv
 WHERE t.slug='jubilees-42-judah-surety-benjamin'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=42 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=43 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 42:37 — *And Reuben spake unto his father, saying, Slay my two sons, if I bring him not to thee: deliver him into my hand, and I will bring him to thee again.* Reuben''s rejected offer in Jubilees 42:18 is his very pledge in Genesis, set against Judah''s accepted surety.'
  FROM cross_reference_threads t, cross_references x, _session251_ju42_lookup sv, _session251_ju42_lookup tv
 WHERE t.slug='jubilees-42-judah-surety-benjamin'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=42 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=42 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 42:2 — *And he said, Behold, I have heard that there is corn in Egypt: get you down thither, and buy for us from thence; that we may live, and not die.* Israel''s renewed sending in Jubilees 42:15, that we die not, repeats Jacob''s command in Genesis to live and not die.'
  FROM cross_reference_threads t, cross_references x, _session251_ju42_lookup sv, _session251_ju42_lookup tv
 WHERE t.slug='jubilees-42-judah-surety-benjamin'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=42 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=42 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 1:3 — *And Judas begat Phares and Zara of Thamar; and Phares begat Esrom; and Esrom begat Aram;* The Judah who stands surety in Jubilees 42:19 is the Judah of the Messianic line, Perez of Tamar carried down to Messiah.'
  FROM cross_reference_threads t, cross_references x, _session251_ju42_lookup sv, _session251_ju42_lookup tv
 WHERE t.slug='jubilees-42-judah-surety-benjamin'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=42 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-42-benjamin-feast-portion
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 43:29 — *And he lifted up his eyes, and saw his brother Benjamin, his mother’s son, and said, Is this your younger brother, of whom ye spake unto me? And he said, Elohim (God) be gracious unto thee, my son.* Joseph''s gracious word over Benjamin in Jubilees 42:21 is his blessing in Genesis.'
  FROM cross_reference_threads t, cross_references x, _session251_ju42_lookup sv, _session251_ju42_lookup tv
 WHERE t.slug='jubilees-42-benjamin-feast-portion'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=42 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=43 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jasher 51:19 — *And the sons of Jacob saw Joseph, and his figure and comeliness and dignity of countenance seemed wonderful in their eyes, and they again bowed down to him to the ground.* The brothers standing before Joseph in Jubilees 42:20-21 bow before the throne in Jasher, the dreams fulfilled.'
  FROM cross_reference_threads t, cross_references x, _session251_ju42_lookup sv, _session251_ju42_lookup tv
 WHERE t.slug='jubilees-42-benjamin-feast-portion'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=42 AND sv.verse_number=20
   AND tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=51 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 50:20 — *But as for you, ye thought evil against me; but Elohim (God) meant it unto good, to bring to pass, as it is this day, to save much people alive.* The feast Joseph spreads in Jubilees 42:21 foreshadows his final word: the evil done him was meant by Elohim for good, to save much people alive.'
  FROM cross_reference_threads t, cross_references x, _session251_ju42_lookup sv, _session251_ju42_lookup tv
 WHERE t.slug='jubilees-42-benjamin-feast-portion'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=42 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=50 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

