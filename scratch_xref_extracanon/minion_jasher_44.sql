-- ----- fragment: minion_jasher_44.sql (session252 jasher 44) -----
-- Source anchor: jasher/jasher ch44. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja44 (view _session252_ja44_lookup). Sort band base 56075, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja44_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-44-sold-to-potiphar
  ('jasher', 'jasher', 44, 1, 'canon', 'genesis', 39, 1, 'free', E'Genesis 39:1 — *And Joseph was brought down to Egypt; and Potiphar, an officer of Pharaoh, captain of the guard, an Egyptian, bought him of the hands of the Ishmeelites, which had brought him down thither.* The canon names the same buyer and the same Ishmeelite hand Jasher 44:1-11 traces in expanded detail.'),
  ('jasher', 'jasher', 44, 11, 'canon', 'genesis', 39, 4, 'free', E'Genesis 39:4 — *And Joseph found grace in his sight, and he served him: and he made him overseer over his house, and all that he had he put into his hand.* The very wording of Jasher 44:11 — overseer, all delivered into his hand — is Genesis'' own.'),
  ('jasher', 'jasher', 44, 1, 'canon', 'genesis', 37, 28, 'free', E'Genesis 37:28 — *Then there passed by Midianites merchantmen; and they drew and lifted up Joseph out of the pit, and sold Joseph to the Ishmeelites for twenty pieces of silver: and they brought Joseph into Egypt.* Jasher 44:1 picks up the Ishmaelite caravan exactly where Genesis 37 hands Joseph off.'),
  ('jasher', 'jasher', 44, 11, 'jubilees', 'jubilees', 39, 3, 'extras', E'Jubilees 39:3 — *And he set Joseph over all his house, and the blessing of Yahuah (God) came upon the house of the Egyptian on account of Joseph, and Yahuah (God) prospered him in all that he did.* The live Jubilees apparatus narrates the same elevation in Potiphar''s house that Jasher 44:11 records.'),
  -- thread: jasher-44-yahuah-with-joseph
  ('jasher', 'jasher', 44, 12, 'canon', 'genesis', 39, 2, 'free', E'Genesis 39:2 — *And Yahuah (LORD) was with Joseph, and he was a prosperous man; and he was in the house of his master the Egyptian.* Jasher 44:12 quotes the canon''s own claim that Yahuah was with the sold-away son.'),
  ('jasher', 'jasher', 44, 12, 'canon', 'genesis', 39, 5, 'free', E'Genesis 39:5 — *And it came to pass from the time that he had made him overseer in his house, and over all that he had, that Yahuah (LORD) blessed the Egyptian''s house for Joseph''s sake; and the blessing of Yahuah (LORD) was upon all that he had in the house, and in the field.* The blessing-of-Potiphar''s-house in Jasher 44:12 is this verse retold.'),
  ('jasher', 'jasher', 44, 12, 'canon', 'acts', 7, 9, 'free', E'Acts 7:9 — *And the patriarchs, moved with envy, sold Joseph into Egypt: but Elohim (God) was with him,* Stephen''s gloss on the Joseph cycle — envy sells him, yet Elohim is with him — is the engine of Jasher 44:12.'),
  -- thread: jasher-44-purity-kept
  ('jasher', 'jasher', 44, 45, 'canon', 'genesis', 39, 9, 'free', E'Genesis 39:9 — *There is none greater in this house than I; neither hath he kept back any thing from me but thee, because thou art his wife: how then can I do this great wickedness, and sin against Elohim (God)?* Jasher 44:45 is this confession of trust-kept and fear-of-Elohim expanded almost clause for clause.'),
  ('jasher', 'jasher', 44, 78, 'jubilees', 'jubilees', 39, 6, 'extras', E'Jubilees 39:6 — *But he did not surrender his soul, and he remembered Yahuah (God) and the words which Jacob, his father, used to read from amongst the words of Abraham, that no man should commit fornication with a woman who has a husband; that for him the punishment of death has been ordained in the heavens before the El Elyon (Most High) Elohim (God), and the sin will be recorded against him in the eternal books continually before Yahuah (God). And Joseph remembered these words and refused to lie with her.* The live Jubilees apparatus grounds Joseph''s refusal in Jasher 44:78 on Torah his fathers kept before Sinai.'),
  ('jasher', 'jasher', 44, 45, 'canon', '1-corinthians', 6, 18, 'free', E'1 Corinthians 6:18 — *Flee fornication. Every sin that a man doeth is without the body; but he that committeth fornication sinneth against his own body.* Joseph''s flat refusal to sin against Elohim in Jasher 44:45 is the very flight Paul commands the assembly.'),
  -- thread: jasher-44-garment-false-witness
  ('jasher', 'jasher', 44, 54, 'canon', 'genesis', 39, 12, 'free', E'Genesis 39:12 — *And she caught him by his garment, saying, Lie with me: and he left his garment in her hand, and fled, and got him out.* The torn-garment flight of Jasher 44:54 is Genesis'' own image, only enlarged.'),
  ('jasher', 'jasher', 44, 57, 'canon', 'genesis', 39, 14, 'free', E'Genesis 39:14 — *That she called unto the men of her house, and spake unto them, saying, See, he hath brought in an Hebrew unto us to mock us; he came in unto me to lie with me, and I cried with a loud voice:* The ''see what a Hebrew'' accusation of Jasher 44:57 echoes this false witness word for word.'),
  ('jasher', 'jasher', 44, 54, 'jubilees', 'jubilees', 39, 9, 'extras', E'Jubilees 39:9 — *But she embraced him and held him fast in the house in order to force him to lie with her, and closed the doors of the house and held him fast; but he left his garment in her hands and broke through the door and fled without from her presence.* The live Jubilees text holds the same garment-in-her-hands flight as Jasher 44:54.'),
  -- thread: jasher-44-prison-innocent
  ('jasher', 'jasher', 44, 76, 'canon', 'genesis', 39, 20, 'free', E'Genesis 39:20 — *And Joseph''s master took him, and put him into the prison, a place where the king''s prisoners were bound: and he was there in the prison.* Jasher 44:76 names the same ''house of confinement, the place where the king''s prisoners are confined.'''),
  ('jasher', 'jasher', 44, 76, 'canon', 'genesis', 39, 21, 'free', E'Genesis 39:21 — *But Yahuah (LORD) was with Joseph, and shewed him mercy, and gave him favour in the sight of the keeper of the prison.* Against the twelve years of Jasher 44:76 the canon insists the favor of Yahuah followed Joseph into the cell.'),
  ('jasher', 'jasher', 44, 76, 'jubilees', 'jubilees', 39, 11, 'extras', E'Jubilees 39:11 — *And the Egyptian saw the garment of Joseph and the broken door, and heard the words of his wife, and cast Joseph into prison into the place where the prisoners were kept whom the king imprisoned. And he was there in the prison; and Yahuah (God) gave Joseph favour in the sight of the chief of the prison guards and compassion before him, for he saw that Yahuah (God) was with him, and that Yahuah (God) made all that he did to prosper.* The live Jubilees apparatus carries the same imprisonment-yet-favor of Jasher 44:76.'),
  -- thread: jasher-44-meant-for-good
  ('jasher', 'jasher', 44, 80, 'canon', 'genesis', 37, 34, 'free', E'Genesis 37:34 — *And Jacob rent his clothes, and put sackcloth upon his loins, and mourned for his son many days.* Jacob''s unbroken mourning in Jasher 44:80 is the grief the canon opened in Genesis 37, still unhealed while Joseph sits in the prison.'),
  ('jasher', 'jasher', 44, 80, 'canon', 'genesis', 45, 5, 'free', E'Genesis 45:5 — *Now therefore be not grieved, nor angry with yourselves, that ye sold me hither: for Elohim (God) did send me before you to preserve life.* Joseph''s own verdict on the cycle Jasher 44 narrates — the rejected one sent ahead to preserve life, the Messiah-type.'),
  ('jasher', 'jasher', 44, 80, 'canon', 'genesis', 50, 19, 'free', E'Genesis 50:19 — *And Joseph said unto them, Fear not: for am I in the place of Elohim (God)?* The end Jasher 44:80 is bending toward: the wronged one forgives, for Elohim meant it for good.'),
  ('jasher', 'jasher', 44, 80, 'canon', 'romans', 8, 28, 'free', E'Romans 8:28 — *And we know that all things work together for good to them that love Elohim (God), to them who are the called according to his purpose.* The pit, prison and false witness of Jasher 44 are the very pattern Paul names — all things worked toward the deliverance Elohim purposed.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja44_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja44_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-44-sold-to-potiphar',
       E'Sold down to Egypt — into Potiphar''s house',
       E'Jasher carries Joseph the last leg of his sale: *And the sons of Ishmael who had bought Joseph from the Midianites, who had bought him from his brethren, went to Egypt with Joseph, and they came upon the borders of Egypt...* (Jasher 44:1), and the boy is handed to Potiphar — *And Potiphar took Joseph and brought him to his house that he might serve him, and Joseph found favor in the sight of Potiphar, and he placed confidence in him, and made him overseer over his house, and all that belonged to him he delivered over into his hand* (Jasher 44:11). This is Genesis 39 told the long way. The canon opens the same scene — *And Joseph was brought down to Egypt; and Potiphar, an officer of Pharaoh, captain of the guard, an Egyptian, bought him of the hands of the Ishmeelites, which had brought him down thither* (Genesis 39:1) — and reaches the same trust: *And Joseph found grace in his sight, and he served him: and he made him overseer over his house, and all that he had he put into his hand* (Genesis 39:4). Jasher even keeps the sale-price the brethren set back in the pit — *and sold Joseph to the Ishmeelites for twenty pieces of silver: and they brought Joseph into Egypt* (Genesis 37:28). It ain''t new: the righteous one cast out by his brethren is carried down to the place where he will save many.',
       sv.verse_id, ev.verse_id, 'extras', 56075
  FROM _session252_ja44_lookup sv, _session252_ja44_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=44 AND sv.verse_number=1
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=44 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-44-yahuah-with-joseph',
       E'Yahuah was with Joseph — the house blessed for his sake',
       E'Jasher tells why the slave prospers: *And Yahuah (the Lord) was with Joseph and he became a prosperous man, and Yahuah (the Lord) blessed the house of Potiphar for the sake of Joseph* (Jasher 44:12). Word for word this is the canon''s refrain — *And Yahuah (LORD) was with Joseph, and he was a prosperous man; and he was in the house of his master the Egyptian* (Genesis 39:2) — and the blessing spills onto the Egyptian household: *that Yahuah (LORD) blessed the Egyptian''s house for Joseph''s sake; and the blessing of Yahuah (LORD) was upon all that he had in the house, and in the field* (Genesis 39:5). Stephen reads the whole arc the same way: *And the patriarchs, moved with envy, sold Joseph into Egypt: but Elohim (God) was with him,* (Acts 7:9). The election holds even in chains; the chosen seed is kept, and through him a Gentile house is blessed — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 56078
  FROM _session252_ja44_lookup sv, _session252_ja44_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=44 AND sv.verse_number=12
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=44 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-44-purity-kept',
       E'The seed kept pure — how can I sin against Elohim?',
       E'At the heart of the chapter the righteous one will not be moved. Zelicah entices day after day, and Joseph answers: *how then can you speak these words to me, and how can I do this great evil and sin to Elohim and to your husband?* (Jasher 44:45) and *It is better for me to remain in this house than to hearken to your words, to sin against Elohim* (Jasher 44:78). Genesis gives the same refusal in its tightest form — *There is none greater in this house than I; neither hath he kept back any thing from me but thee, because thou art his wife: how then can I do this great wickedness, and sin against Elohim (God)?* (Genesis 39:9). The purity is covenant fidelity, the seed-line kept: Jubilees says he held to the Torah-before-Sinai his fathers taught — *that no man should commit fornication with a woman who has a husband; that for him the punishment of death has been ordained in the heavens... And Joseph remembered these words and refused to lie with her* (Jubilees 39:6). Paul presses the same flight to the assembly: *Flee fornication. Every sin that a man doeth is without the body; but he that committeth fornication sinneth against his own body* (1 Corinthians 6:18). It ain''t new — Torah stood before Sinai, and the chosen one keeps it.',
       sv.verse_id, ev.verse_id, 'extras', 56081
  FROM _session252_ja44_lookup sv, _session252_ja44_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=44 AND sv.verse_number=45
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=44 AND ev.verse_number=78
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-44-garment-false-witness',
       E'The garment left behind — the false accusation',
       E'The frame turns on a torn garment. Joseph flees: *and in the terror of his flight the garment which Zelicah seized was torn, and Joseph left the garment in the hand of Zelicah, and he fled and got out, for he was in fear* (Jasher 44:54), and the lie is shouted: *See what a Hebrew your master has brought to me in the house, for he came this day to lie with me* (Jasher 44:57). The canon tells it in two sparse strokes — *and he left his garment in her hand, and fled, and got him out* (Genesis 39:12) — and the same slander against the Hebrew: *That she called unto the men of her house, and spake unto them, saying, See, he hath brought in an Hebrew unto us to mock us; he came in unto me to lie with me, and I cried with a loud voice:* (Genesis 39:14). Jubilees keeps both the garment and the calumny: *but he left his garment in her hands and broke through the door and fled without from her presence* (Jubilees 39:9). The righteous one is condemned on a false witness — the Messiah-pattern of the innocent handed over — yet it ain''t new; the canon already carries it.',
       sv.verse_id, ev.verse_id, 'extras', 56084
  FROM _session252_ja44_lookup sv, _session252_ja44_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=44 AND sv.verse_number=54
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=44 AND ev.verse_number=57
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-44-prison-innocent',
       E'Cast into the prison house — innocent, yet kept',
       E'On the strength of the lie Joseph is shut up: *And Potiphar heard their words, and he placed him in the prison house, the place where the king''s prisoners are confined, and Joseph was in the house of confinement twelve years* (Jasher 44:76) — though even under the lash he cries his innocence: *O Yahuah Elohim (O Lord God), you know that I am innocent of all these things, and why shall I die this day through falsehood, by the hand of these uncircumcised wicked men, whom you know?* (Jasher 44:63). Genesis puts him in the same place — *And Joseph''s master took him, and put him into the prison, a place where the king''s prisoners were bound: and he was there in the prison* (Genesis 39:20) — but immediately adds the mercy that never leaves him: *But Yahuah (LORD) was with Joseph, and shewed him mercy, and gave him favour in the sight of the keeper of the prison* (Genesis 39:21). Jubilees agrees the prison did not break the favor: *and Yahuah (God) gave Joseph favour in the sight of the chief of the prison guards... for he saw that Yahuah (God) was with him* (Jubilees 39:11). The innocent one descends to the pit and the prison before he is raised — the Messiah-type whom Elohim meant for good.',
       sv.verse_id, ev.verse_id, 'extras', 56087
  FROM _session252_ja44_lookup sv, _session252_ja44_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=44 AND sv.verse_number=63
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=44 AND ev.verse_number=76
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-44-meant-for-good',
       E'The rejected one whom Elohim meant for good',
       E'Jasher closes on the father''s unhealed grief while the son lies in chains: *And Jacob the father of Joseph, and all his brethren who were in the land of Canaan still mourned and wept in those days on account of Joseph, for Jacob refused to be comforted for his son Joseph, and Jacob cried aloud, and wept and mourned all those days* (Jasher 44:80). The reader who knows the end reads the whole Potiphar chapter as the deep of the descent before the rising. Joseph himself will name it the Messiah-pattern of one rejected yet sent to save: *Now therefore be not grieved, nor angry with yourselves, that ye sold me hither: for Elohim (God) did send me before you to preserve life* (Genesis 45:5), and again *And Joseph said unto them, Fear not: for am I in the place of Elohim (God)?* (Genesis 50:19). What the brethren and Zelicah meant for evil, Elohim meant for good — the assembly''s confidence: *And we know that all things work together for good to them that love Elohim (God), to them who are the called according to his purpose* (Romans 8:28). It ain''t new — the pit, the prison, the lie, the mourning, all bend toward the deliverance Elohim had purposed.',
       sv.verse_id, ev.verse_id, 'extras', 56090
  FROM _session252_ja44_lookup sv, _session252_ja44_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=44 AND sv.verse_number=80
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=44 AND ev.verse_number=80
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-44-sold-to-potiphar
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 39:1 — *And Joseph was brought down to Egypt; and Potiphar, an officer of Pharaoh, captain of the guard, an Egyptian, bought him of the hands of the Ishmeelites, which had brought him down thither.* The canon names the same buyer and the same Ishmeelite hand Jasher 44:1-11 traces in expanded detail.'
  FROM cross_reference_threads t, cross_references x, _session252_ja44_lookup sv, _session252_ja44_lookup tv
 WHERE t.slug='jasher-44-sold-to-potiphar'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=44 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=39 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 39:4 — *And Joseph found grace in his sight, and he served him: and he made him overseer over his house, and all that he had he put into his hand.* The very wording of Jasher 44:11 — overseer, all delivered into his hand — is Genesis'' own.'
  FROM cross_reference_threads t, cross_references x, _session252_ja44_lookup sv, _session252_ja44_lookup tv
 WHERE t.slug='jasher-44-sold-to-potiphar'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=44 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=39 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 37:28 — *Then there passed by Midianites merchantmen; and they drew and lifted up Joseph out of the pit, and sold Joseph to the Ishmeelites for twenty pieces of silver: and they brought Joseph into Egypt.* Jasher 44:1 picks up the Ishmaelite caravan exactly where Genesis 37 hands Joseph off.'
  FROM cross_reference_threads t, cross_references x, _session252_ja44_lookup sv, _session252_ja44_lookup tv
 WHERE t.slug='jasher-44-sold-to-potiphar'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=44 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=37 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 39:3 — *And he set Joseph over all his house, and the blessing of Yahuah (God) came upon the house of the Egyptian on account of Joseph, and Yahuah (God) prospered him in all that he did.* The live Jubilees apparatus narrates the same elevation in Potiphar''s house that Jasher 44:11 records.'
  FROM cross_reference_threads t, cross_references x, _session252_ja44_lookup sv, _session252_ja44_lookup tv
 WHERE t.slug='jasher-44-sold-to-potiphar'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=44 AND sv.verse_number=11
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=39 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-44-yahuah-with-joseph
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 39:2 — *And Yahuah (LORD) was with Joseph, and he was a prosperous man; and he was in the house of his master the Egyptian.* Jasher 44:12 quotes the canon''s own claim that Yahuah was with the sold-away son.'
  FROM cross_reference_threads t, cross_references x, _session252_ja44_lookup sv, _session252_ja44_lookup tv
 WHERE t.slug='jasher-44-yahuah-with-joseph'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=44 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=39 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 39:5 — *And it came to pass from the time that he had made him overseer in his house, and over all that he had, that Yahuah (LORD) blessed the Egyptian''s house for Joseph''s sake; and the blessing of Yahuah (LORD) was upon all that he had in the house, and in the field.* The blessing-of-Potiphar''s-house in Jasher 44:12 is this verse retold.'
  FROM cross_reference_threads t, cross_references x, _session252_ja44_lookup sv, _session252_ja44_lookup tv
 WHERE t.slug='jasher-44-yahuah-with-joseph'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=44 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=39 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 7:9 — *And the patriarchs, moved with envy, sold Joseph into Egypt: but Elohim (God) was with him,* Stephen''s gloss on the Joseph cycle — envy sells him, yet Elohim is with him — is the engine of Jasher 44:12.'
  FROM cross_reference_threads t, cross_references x, _session252_ja44_lookup sv, _session252_ja44_lookup tv
 WHERE t.slug='jasher-44-yahuah-with-joseph'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=44 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-44-purity-kept
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 39:9 — *There is none greater in this house than I; neither hath he kept back any thing from me but thee, because thou art his wife: how then can I do this great wickedness, and sin against Elohim (God)?* Jasher 44:45 is this confession of trust-kept and fear-of-Elohim expanded almost clause for clause.'
  FROM cross_reference_threads t, cross_references x, _session252_ja44_lookup sv, _session252_ja44_lookup tv
 WHERE t.slug='jasher-44-purity-kept'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=44 AND sv.verse_number=45
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=39 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jubilees 39:6 — *But he did not surrender his soul, and he remembered Yahuah (God) and the words which Jacob, his father, used to read from amongst the words of Abraham, that no man should commit fornication with a woman who has a husband; that for him the punishment of death has been ordained in the heavens before the El Elyon (Most High) Elohim (God), and the sin will be recorded against him in the eternal books continually before Yahuah (God). And Joseph remembered these words and refused to lie with her.* The live Jubilees apparatus grounds Joseph''s refusal in Jasher 44:78 on Torah his fathers kept before Sinai.'
  FROM cross_reference_threads t, cross_references x, _session252_ja44_lookup sv, _session252_ja44_lookup tv
 WHERE t.slug='jasher-44-purity-kept'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=44 AND sv.verse_number=78
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=39 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Corinthians 6:18 — *Flee fornication. Every sin that a man doeth is without the body; but he that committeth fornication sinneth against his own body.* Joseph''s flat refusal to sin against Elohim in Jasher 44:45 is the very flight Paul commands the assembly.'
  FROM cross_reference_threads t, cross_references x, _session252_ja44_lookup sv, _session252_ja44_lookup tv
 WHERE t.slug='jasher-44-purity-kept'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=44 AND sv.verse_number=45
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=6 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-44-garment-false-witness
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 39:12 — *And she caught him by his garment, saying, Lie with me: and he left his garment in her hand, and fled, and got him out.* The torn-garment flight of Jasher 44:54 is Genesis'' own image, only enlarged.'
  FROM cross_reference_threads t, cross_references x, _session252_ja44_lookup sv, _session252_ja44_lookup tv
 WHERE t.slug='jasher-44-garment-false-witness'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=44 AND sv.verse_number=54
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=39 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 39:14 — *That she called unto the men of her house, and spake unto them, saying, See, he hath brought in an Hebrew unto us to mock us; he came in unto me to lie with me, and I cried with a loud voice:* The ''see what a Hebrew'' accusation of Jasher 44:57 echoes this false witness word for word.'
  FROM cross_reference_threads t, cross_references x, _session252_ja44_lookup sv, _session252_ja44_lookup tv
 WHERE t.slug='jasher-44-garment-false-witness'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=44 AND sv.verse_number=57
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=39 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 39:9 — *But she embraced him and held him fast in the house in order to force him to lie with her, and closed the doors of the house and held him fast; but he left his garment in her hands and broke through the door and fled without from her presence.* The live Jubilees text holds the same garment-in-her-hands flight as Jasher 44:54.'
  FROM cross_reference_threads t, cross_references x, _session252_ja44_lookup sv, _session252_ja44_lookup tv
 WHERE t.slug='jasher-44-garment-false-witness'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=44 AND sv.verse_number=54
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=39 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-44-prison-innocent
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 39:20 — *And Joseph''s master took him, and put him into the prison, a place where the king''s prisoners were bound: and he was there in the prison.* Jasher 44:76 names the same ''house of confinement, the place where the king''s prisoners are confined.'''
  FROM cross_reference_threads t, cross_references x, _session252_ja44_lookup sv, _session252_ja44_lookup tv
 WHERE t.slug='jasher-44-prison-innocent'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=44 AND sv.verse_number=76
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=39 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 39:21 — *But Yahuah (LORD) was with Joseph, and shewed him mercy, and gave him favour in the sight of the keeper of the prison.* Against the twelve years of Jasher 44:76 the canon insists the favor of Yahuah followed Joseph into the cell.'
  FROM cross_reference_threads t, cross_references x, _session252_ja44_lookup sv, _session252_ja44_lookup tv
 WHERE t.slug='jasher-44-prison-innocent'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=44 AND sv.verse_number=76
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=39 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 39:11 — *And the Egyptian saw the garment of Joseph and the broken door, and heard the words of his wife, and cast Joseph into prison into the place where the prisoners were kept whom the king imprisoned. And he was there in the prison; and Yahuah (God) gave Joseph favour in the sight of the chief of the prison guards and compassion before him, for he saw that Yahuah (God) was with him, and that Yahuah (God) made all that he did to prosper.* The live Jubilees apparatus carries the same imprisonment-yet-favor of Jasher 44:76.'
  FROM cross_reference_threads t, cross_references x, _session252_ja44_lookup sv, _session252_ja44_lookup tv
 WHERE t.slug='jasher-44-prison-innocent'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=44 AND sv.verse_number=76
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=39 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-44-meant-for-good
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 37:34 — *And Jacob rent his clothes, and put sackcloth upon his loins, and mourned for his son many days.* Jacob''s unbroken mourning in Jasher 44:80 is the grief the canon opened in Genesis 37, still unhealed while Joseph sits in the prison.'
  FROM cross_reference_threads t, cross_references x, _session252_ja44_lookup sv, _session252_ja44_lookup tv
 WHERE t.slug='jasher-44-meant-for-good'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=44 AND sv.verse_number=80
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=37 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 45:5 — *Now therefore be not grieved, nor angry with yourselves, that ye sold me hither: for Elohim (God) did send me before you to preserve life.* Joseph''s own verdict on the cycle Jasher 44 narrates — the rejected one sent ahead to preserve life, the Messiah-type.'
  FROM cross_reference_threads t, cross_references x, _session252_ja44_lookup sv, _session252_ja44_lookup tv
 WHERE t.slug='jasher-44-meant-for-good'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=44 AND sv.verse_number=80
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=45 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 50:19 — *And Joseph said unto them, Fear not: for am I in the place of Elohim (God)?* The end Jasher 44:80 is bending toward: the wronged one forgives, for Elohim meant it for good.'
  FROM cross_reference_threads t, cross_references x, _session252_ja44_lookup sv, _session252_ja44_lookup tv
 WHERE t.slug='jasher-44-meant-for-good'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=44 AND sv.verse_number=80
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=50 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 8:28 — *And we know that all things work together for good to them that love Elohim (God), to them who are the called according to his purpose.* The pit, prison and false witness of Jasher 44 are the very pattern Paul names — all things worked toward the deliverance Elohim purposed.'
  FROM cross_reference_threads t, cross_references x, _session252_ja44_lookup sv, _session252_ja44_lookup tv
 WHERE t.slug='jasher-44-meant-for-good'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=44 AND sv.verse_number=80
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=8 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

