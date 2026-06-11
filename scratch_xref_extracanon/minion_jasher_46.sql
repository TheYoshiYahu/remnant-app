-- ----- fragment: minion_jasher_46.sql (session252 jasher 46) -----
-- Source anchor: jasher/jasher ch46. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja46 (view _session252_ja46_lookup). Sort band base 56125, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja46_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-46-joseph-in-the-prison-house
  ('jasher', 'jasher', 46, 1, 'canon', 'genesis', 39, 20, 'free', E'Genesis 39:20 — *And Joseph''s master took him, and put him into the prison, a place where the king''s prisoners were bound: and he was there in the prison.* Genesis names the same dungeon Jasher 46:1 keeps Joseph confined in.'),
  ('jasher', 'jasher', 46, 1, 'canon', 'genesis', 39, 21, 'free', E'Genesis 39:21 — *But Yahuah (LORD) was with Joseph, and shewed him mercy, and gave him favour in the sight of the keeper of the prison.* Behind Jasher''s bare ''still confined'' the canon shows Yahuah with the righteous one in his bonds.'),
  ('jasher', 'jasher', 46, 1, 'canon', 'psalms', 105, 17, 'free', E'Psalms 105:17 — *He sent a man before them, even Joseph, who was sold for a servant:* the Psalm reads Joseph''s descent of Jasher 46:1 as Elohim sending a man ahead to preserve the seed.'),
  ('jasher', 'jasher', 46, 1, 'canon', 'psalms', 105, 18, 'free', E'Psalms 105:18 — *Whose feet they hurt with fetters: he was laid in iron:* the Psalm puts the irons on the prisoner Jasher 46:1 leaves confined.'),
  -- thread: jasher-46-two-officers-dreams-belong-to-elohim
  ('jasher', 'jasher', 46, 6, 'canon', 'genesis', 40, 5, 'free', E'Genesis 40:5 — *And they dreamed a dream both of them, each man his dream in one night, each man according to the interpretation of his dream, the butler and the baker of the king of Egypt, which were bound in the prison.* The Genesis source of the one-night double dream Jasher 46:6 retells.'),
  ('jasher', 'jasher', 46, 7, 'canon', 'genesis', 40, 8, 'free', E'Genesis 40:8 — *And they said unto him, We have dreamed a dream, and there is no interpreter of it. And Joseph said unto them, Do not interpretations belong to Elohim (God)? tell me them, I pray you.* Joseph credits Elohim with the answer in both Jasher 46:7 and its Genesis source.'),
  ('jasher', 'jasher', 46, 6, 'jubilees', 'jubilees', 39, 15, 'extras', E'Jubilees 39:15 — *And the chief of the prison guards appointed Joseph to serve them; and he served before them.* Jubilees gives the same prison-attendant setting Jasher 46:6 places Joseph in among the two officers.'),
  -- thread: jasher-46-butler-vine-dream-restored
  ('jasher', 'jasher', 46, 8, 'canon', 'genesis', 40, 10, 'free', E'Genesis 40:10 — *And in the vine were three branches: and it was as though it budded, and her blossoms shot forth; and the clusters thereof brought forth ripe grapes:* the same vine and three branches the butler describes in Jasher 46:8.'),
  ('jasher', 'jasher', 46, 9, 'canon', 'genesis', 40, 12, 'free', E'Genesis 40:12 — *And Joseph said unto him, This is the interpretation of it: The three branches are three days:* Joseph''s reading of the three branches in Jasher 46:9 is the Genesis word.'),
  ('jasher', 'jasher', 46, 10, 'canon', 'genesis', 40, 13, 'free', E'Genesis 40:13 — *Yet within three days shall Pharaoh lift up thine head, and restore thee unto thy place: and thou shalt deliver Pharaoh''s cup into his hand, after the former manner when thou wast his butler.* the restoration in three days Joseph foretells in Jasher 46:10.'),
  -- thread: jasher-46-remember-me-purity-false-charge
  ('jasher', 'jasher', 46, 10, 'canon', 'genesis', 40, 14, 'free', E'Genesis 40:14 — *But think on me when it shall be well with thee, and shew kindness, I pray thee, unto me, and make mention of me unto Pharaoh, and bring me out of this house:* Joseph''s ''remember me when it is well with you'' of Jasher 46:10.'),
  ('jasher', 'jasher', 46, 10, 'canon', 'genesis', 40, 15, 'free', E'Genesis 40:15 — *For indeed I was stolen away out of the land of the Hebrews: and here also have I done nothing that they should put me into the dungeon.* the same ''stolen away, here for naught'' protest Joseph makes in Jasher 46:10-11.'),
  ('jasher', 'jasher', 46, 11, 'canon', 'genesis', 39, 9, 'free', E'Genesis 39:9 — *There is none greater in this house than I; neither hath he kept back any thing from me but thee, because thou art his wife: how then can I do this great wickedness, and sin against Elohim (God)?* the purity that makes the ''false'' charge of Jasher 46:11 false — the seed kept clean.'),
  ('jasher', 'jasher', 46, 11, 'canon', '1-corinthians', 6, 18, 'free', E'1 Corinthians 6:18 — *Flee fornication. Every sin that a man doeth is without the body; but he that committeth fornication sinneth against his own body.* the apostle commands the very fleeing Joseph chose, vindicating his protest in Jasher 46:11.'),
  ('jasher', 'jasher', 46, 11, 'jubilees', 'jubilees', 39, 6, 'extras', E'Jubilees 39:6 — *And Joseph remembered these words and refused to lie with her.* Jubilees records the refusal that made the wife''s accusation false, the ''false'' charge Joseph names in Jasher 46:11.'),
  -- thread: jasher-46-baker-baskets-dream-hanged
  ('jasher', 'jasher', 46, 13, 'canon', 'genesis', 40, 16, 'free', E'Genesis 40:16 — *When the chief baker saw that the interpretation was good, he said unto Joseph, I also was in my dream, and, behold, I had three white baskets on my head:* the same three white baskets the baker tells in Jasher 46:13.'),
  ('jasher', 'jasher', 46, 13, 'canon', 'genesis', 40, 17, 'free', E'Genesis 40:17 — *And in the uppermost basket there was of all manner of bakemeats for Pharaoh; and the birds did eat them out of the basket upon my head.* the bakemeats and birds of the baker''s dream in Jasher 46:13.'),
  ('jasher', 'jasher', 46, 14, 'canon', 'genesis', 40, 19, 'free', E'Genesis 40:19 — *Yet within three days shall Pharaoh lift up thy head from off thee, and shall hang thee on a tree; and the birds shall eat thy flesh from off thee.* the hanging-on-a-tree verdict Joseph speaks in Jasher 46:14.'),
  -- thread: jasher-46-butler-forgot-trusted-in-man-tried
  ('jasher', 'jasher', 46, 19, 'canon', 'genesis', 40, 23, 'free', E'Genesis 40:23 — *Yet did not the chief butler remember Joseph, but forgat him.* the same forgetting Jasher 46:19 records, which it reads as Yahuah''s discipline for trusting in man.'),
  ('jasher', 'jasher', 46, 19, 'canon', 'genesis', 41, 9, 'free', E'Genesis 41:9 — *Then spake the chief butler unto Pharaoh, saying, I do remember my faults this day:* the delayed remembering that follows the butler''s forgetting in Jasher 46:19.'),
  ('jasher', 'jasher', 46, 19, 'canon', 'psalms', 105, 19, 'free', E'Psalms 105:19 — *Until the time that his word came: the word of Yahuah (LORD) tried him.* the Psalm names the forgetting of Jasher 46:19 as Yahuah trying the righteous one until his hour.'),
  ('jasher', 'jasher', 46, 19, 'canon', 'acts', 7, 9, 'free', E'Acts 7:9 — *And the patriarchs, moved with envy, sold Joseph into Egypt: but Elohim (God) was with him,* Stephen reads the whole prison ordeal of Jasher 46:19 as Elohim being with the rejected one.'),
  ('jasher', 'jasher', 46, 19, 'jubilees', 'jubilees', 39, 18, 'extras', E'Jubilees 39:18 — *But the chief butler forgot Joseph in the prison, although he had informed him what would befall him, and did not remember to inform Pharaoh how Joseph had told him for he forgot.* Jubilees tells the same forgetting Jasher 46:19 attributes to Yahuah''s hand.'),
  -- thread: jasher-46-joseph-messiah-type-meant-for-good
  ('jasher', 'jasher', 46, 20, 'canon', 'genesis', 45, 5, 'free', E'Genesis 45:5 — *Now therefore be not grieved, nor angry with yourselves, that ye sold me hither: for Elohim (God) did send me before you to preserve life.* the prison years of Jasher 46:20 are the path by which the rejected one is kept to preserve life.'),
  ('jasher', 'jasher', 46, 20, 'canon', 'genesis', 50, 20, 'free', E'Genesis 50:20 — *But as for you, ye thought evil against me; but Elohim (God) meant it unto good, to bring to pass, as it is this day, to save much people alive.* the Messiah-type verdict over Joseph''s whole ordeal, including the dungeon years of Jasher 46:20.'),
  ('jasher', 'jasher', 46, 20, 'canon', 'romans', 8, 28, 'free', E'Romans 8:28 — *And we know that all things work together for good to them that love Elohim (God), to them who are the called according to his purpose.* the apostle gathers Joseph''s ''meant for good'' prison years of Jasher 46:20 into the promise over all the called.'),
  ('jasher', 'jasher', 46, 20, 'apocrypha', 'the-wisdom-of-solomon', 10, 14, 'extras', E'Wisdom of Solomon 10:14 — *And left him not in bonds, till she brought him the sceptre of the kingdom, and power against those that oppressed him: as for them that had accused him, she shewed them to be liars, and gave him perpetual glory.* reads the completed prison years of Jasher 46:20 as the road from bonds to the sceptre, the accusers shown to be liars.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja46_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja46_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-46-joseph-in-the-prison-house',
       E'Still confined in the prison house — yet Elohim was with him',
       E'Jasher opens the scene in the dungeon: *In those days Joseph was still confined in the prison house in the land of Egypt.* (Jasher 46:1) This is the very prison Genesis names, where the false charge of Potiphar''s wife had sent him: *And Joseph''s master took him, and put him into the prison, a place where the king''s prisoners were bound: and he was there in the prison.* (Genesis 39:20) But the canon insists the LORD never abandoned the righteous one in his pit — *But Yahuah (LORD) was with Joseph, and shewed him mercy, and gave him favour in the sight of the keeper of the prison.* (Genesis 39:21) The Psalmist sings the same descent: *He sent a man before them, even Joseph, who was sold for a servant:* (Psalms 105:17) and *Whose feet they hurt with fetters: he was laid in iron:* (Psalms 105:18). It ain''t new — the chosen seed goes down into bonds before he is lifted up.',
       sv.verse_id, ev.verse_id, 'extras', 56125
  FROM _session252_ja46_lookup sv, _session252_ja46_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=46 AND sv.verse_number=1
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=46 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-46-two-officers-dreams-belong-to-elohim',
       E'The two dreamers, and interpretations belong to Elohim',
       E'Pharaoh''s butler and baker are jailed beside Joseph, and on one night both dream: *And at the end of the year, they both dreamed dreams in one night, in the place of confinement where they were... and behold their countenances were dejected and sad.* (Jasher 46:6) Genesis tells it the same way — *And they dreamed a dream both of them, each man his dream in one night, each man according to the interpretation of his dream, the butler and the baker of the king of Egypt, which were bound in the prison.* (Genesis 40:5). When Joseph offers to interpret he gives the glory to Elohim, exactly as Jasher records — *and Joseph said to them, Relate, I pray you, your dream to me, and Elohim (God) shall give you an answer of peace as you desire.* (Jasher 46:7) — matching the canon''s confession: *And Joseph said unto them, Do not interpretations belong to Elohim (God)? tell me them, I pray you.* (Genesis 40:8). Jubilees narrates the same prison scene of the chosen seed: *And the chief of the prison guards appointed Joseph to serve them; and he served before them.* (Jubilees 39:15) — it ain''t new across the libraries.',
       sv.verse_id, ev.verse_id, 'extras', 56128
  FROM _session252_ja46_lookup sv, _session252_ja46_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=46 AND sv.verse_number=6
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=46 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-46-butler-vine-dream-restored',
       E'The butler''s vine — three branches, three days, restored',
       E'The butler tells his dream and Joseph reads it: *I saw in my dream, and behold a large vine was before me, and upon that vine I saw three branches... and its clusters were ripened and became grapes.* (Jasher 46:8) Genesis sets the same vine before us — *In my dream, behold, a vine was before me; And in the vine were three branches: and it was as though it budded, and her blossoms shot forth; and the clusters thereof brought forth ripe grapes:* (Genesis 40:9-10). Joseph''s verdict in Jasher — *The three branches that were upon the vine are three days* (Jasher 46:9) — is the canon''s word exactly: *And Joseph said unto him, This is the interpretation of it: The three branches are three days:* (Genesis 40:12). And the restoration he promises — *the king will order you to be brought out and he will restore you to your office* (Jasher 46:10) — is Genesis verbatim in sense: *Yet within three days shall Pharaoh lift up thine head, and restore thee unto thy place: and thou shalt deliver Pharaoh''s cup into his hand, after the former manner when thou wast his butler.* (Genesis 40:13). It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 56131
  FROM _session252_ja46_lookup sv, _session252_ja46_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=46 AND sv.verse_number=8
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=46 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-46-remember-me-purity-false-charge',
       E'Remember me — stolen from Canaan, the false charge, purity kept',
       E'Joseph pleads to be remembered and protests his innocence: *but let me find favor in your sight, that you shall remember me to Pharaoh when it will be well with you... for I was stolen away from the land of Canaan and was sold for a slave in this place.* (Jasher 46:10), adding *And also that which was told you concerning my master''s wife is false, for they placed me in this dungeon for naught* (Jasher 46:11). Genesis carries both the plea and the protest — *But think on me when it shall be well with thee, and shew kindness, I pray thee, unto me, and make mention of me unto Pharaoh, and bring me out of this house:* (Genesis 40:14) and *For indeed I was stolen away out of the land of the Hebrews: and here also have I done nothing that they should put me into the dungeon.* (Genesis 40:15). The ''false'' charge points back to the purity Joseph kept — *how then can I do this great wickedness, and sin against Elohim (God)?* (Genesis 39:9) — the seed kept clean, which the apostle commands of all: *Flee fornication. Every sin that a man doeth is without the body; but he that committeth fornication sinneth against his own body.* (1 Corinthians 6:18). Jubilees records the same refusal that landed him here: *And Joseph remembered these words and refused to lie with her.* (Jubilees 39:6).',
       sv.verse_id, ev.verse_id, 'extras', 56134
  FROM _session252_ja46_lookup sv, _session252_ja46_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=46 AND sv.verse_number=10
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=46 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-46-baker-baskets-dream-hanged',
       E'The baker''s three baskets — three days, hanged on a tree',
       E'The baker, encouraged by the good reading, tells his own dream: *In my dream I saw and behold three white baskets upon my head, and I looked, and behold there were in the upper-most basket all manner of baked meats for Pharaoh, and behold the birds were eating them from off my head.* (Jasher 46:13) Genesis sets the same baskets before us — *I also was in my dream, and, behold, I had three white baskets on my head: And in the uppermost basket there was of all manner of bakemeats for Pharaoh; and the birds did eat them out of the basket upon my head.* (Genesis 40:16-17). And Joseph''s hard word in Jasher — *yet within three days Pharaoh will take off your head, and hang you upon a tree, and the birds will eat your flesh from off you* (Jasher 46:14) — is the canon''s verdict: *Yet within three days shall Pharaoh lift up thy head from off thee, and shall hang thee on a tree; and the birds shall eat thy flesh from off thee.* (Genesis 40:19). The two readings, one to life and one to death, stand exactly as Genesis tells them.',
       sv.verse_id, ev.verse_id, 'extras', 56137
  FROM _session252_ja46_lookup sv, _session252_ja46_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=46 AND sv.verse_number=13
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=46 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-46-butler-forgot-trusted-in-man-tried',
       E'The butler forgot — discipline for trusting in man, the righteous tried',
       E'The butler is restored but forgets his deliverer: *And the butler, to whom Joseph had interpreted his dream, forgot Joseph, and he did not mention him to the king as he had promised, for this thing was from Yahuah (the Lord) in order to punish Joseph because he had trusted in man.* (Jasher 46:19) Genesis records the same forgetting — *Yet did not the chief butler remember Joseph, but forgat him.* (Genesis 40:23) — and only at the next year''s dreams does the memory return: *Then spake the chief butler unto Pharaoh, saying, I do remember my faults this day:* (Genesis 41:9). The Psalm names this stretch as the testing of the righteous one until his hour comes: *Until the time that his word came: the word of Yahuah (LORD) tried him.* (Psalms 105:19). And Stephen reads the whole arc as Elohim with Joseph through the affliction: *And the patriarchs, moved with envy, sold Joseph into Egypt: but Elohim (God) was with him,* (Acts 7:9). Jubilees tells the same forgetting: *But the chief butler forgot Joseph in the prison, although he had informed him what would befall him, and did not remember to inform Pharaoh how Joseph had told him for he forgot.* (Jubilees 39:18).',
       sv.verse_id, ev.verse_id, 'extras', 56140
  FROM _session252_ja46_lookup sv, _session252_ja46_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=46 AND sv.verse_number=19
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=46 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-46-joseph-messiah-type-meant-for-good',
       E'The two years completed — the rejected one kept to save many',
       E'Jasher closes Joseph''s prison years: *And Joseph remained after this in the prison house two years, until he had completed twelve years.* (Jasher 46:20) The whole descent of the rejected and falsely-charged son is the Messiah-type the canon unfolds: he is the one cast down whom Elohim raises to preserve life — *Now therefore be not grieved, nor angry with yourselves, that ye sold me hither: for Elohim (God) did send me before you to preserve life.* (Genesis 45:5), and *But as for you, ye thought evil against me; but Elohim (God) meant it unto good, to bring to pass, as it is this day, to save much people alive.* (Genesis 50:20). The apostle gathers it into the promise over all the called — *And we know that all things work together for good to them that love Elohim (God), to them who are the called according to his purpose.* (Romans 8:28). And Wisdom reads the prison years of Jasher 46:20 as the path to the sceptre: *And left him not in bonds, till she brought him the sceptre of the kingdom, and power against those that oppressed him: as for them that had accused him, she shewed them to be liars, and gave him perpetual glory.* (Wisdom of Solomon 10:14). It ain''t new — the rejected one is kept in the pit to save many alive.',
       sv.verse_id, ev.verse_id, 'extras', 56143
  FROM _session252_ja46_lookup sv, _session252_ja46_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=46 AND sv.verse_number=19
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=46 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-46-joseph-in-the-prison-house
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 39:20 — *And Joseph''s master took him, and put him into the prison, a place where the king''s prisoners were bound: and he was there in the prison.* Genesis names the same dungeon Jasher 46:1 keeps Joseph confined in.'
  FROM cross_reference_threads t, cross_references x, _session252_ja46_lookup sv, _session252_ja46_lookup tv
 WHERE t.slug='jasher-46-joseph-in-the-prison-house'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=46 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=39 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 39:21 — *But Yahuah (LORD) was with Joseph, and shewed him mercy, and gave him favour in the sight of the keeper of the prison.* Behind Jasher''s bare ''still confined'' the canon shows Yahuah with the righteous one in his bonds.'
  FROM cross_reference_threads t, cross_references x, _session252_ja46_lookup sv, _session252_ja46_lookup tv
 WHERE t.slug='jasher-46-joseph-in-the-prison-house'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=46 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=39 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalms 105:17 — *He sent a man before them, even Joseph, who was sold for a servant:* the Psalm reads Joseph''s descent of Jasher 46:1 as Elohim sending a man ahead to preserve the seed.'
  FROM cross_reference_threads t, cross_references x, _session252_ja46_lookup sv, _session252_ja46_lookup tv
 WHERE t.slug='jasher-46-joseph-in-the-prison-house'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=46 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=105 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalms 105:18 — *Whose feet they hurt with fetters: he was laid in iron:* the Psalm puts the irons on the prisoner Jasher 46:1 leaves confined.'
  FROM cross_reference_threads t, cross_references x, _session252_ja46_lookup sv, _session252_ja46_lookup tv
 WHERE t.slug='jasher-46-joseph-in-the-prison-house'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=46 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=105 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-46-two-officers-dreams-belong-to-elohim
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 40:5 — *And they dreamed a dream both of them, each man his dream in one night, each man according to the interpretation of his dream, the butler and the baker of the king of Egypt, which were bound in the prison.* The Genesis source of the one-night double dream Jasher 46:6 retells.'
  FROM cross_reference_threads t, cross_references x, _session252_ja46_lookup sv, _session252_ja46_lookup tv
 WHERE t.slug='jasher-46-two-officers-dreams-belong-to-elohim'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=46 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=40 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 40:8 — *And they said unto him, We have dreamed a dream, and there is no interpreter of it. And Joseph said unto them, Do not interpretations belong to Elohim (God)? tell me them, I pray you.* Joseph credits Elohim with the answer in both Jasher 46:7 and its Genesis source.'
  FROM cross_reference_threads t, cross_references x, _session252_ja46_lookup sv, _session252_ja46_lookup tv
 WHERE t.slug='jasher-46-two-officers-dreams-belong-to-elohim'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=46 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=40 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 39:15 — *And the chief of the prison guards appointed Joseph to serve them; and he served before them.* Jubilees gives the same prison-attendant setting Jasher 46:6 places Joseph in among the two officers.'
  FROM cross_reference_threads t, cross_references x, _session252_ja46_lookup sv, _session252_ja46_lookup tv
 WHERE t.slug='jasher-46-two-officers-dreams-belong-to-elohim'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=46 AND sv.verse_number=6
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=39 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-46-butler-vine-dream-restored
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 40:10 — *And in the vine were three branches: and it was as though it budded, and her blossoms shot forth; and the clusters thereof brought forth ripe grapes:* the same vine and three branches the butler describes in Jasher 46:8.'
  FROM cross_reference_threads t, cross_references x, _session252_ja46_lookup sv, _session252_ja46_lookup tv
 WHERE t.slug='jasher-46-butler-vine-dream-restored'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=46 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=40 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 40:12 — *And Joseph said unto him, This is the interpretation of it: The three branches are three days:* Joseph''s reading of the three branches in Jasher 46:9 is the Genesis word.'
  FROM cross_reference_threads t, cross_references x, _session252_ja46_lookup sv, _session252_ja46_lookup tv
 WHERE t.slug='jasher-46-butler-vine-dream-restored'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=46 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=40 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 40:13 — *Yet within three days shall Pharaoh lift up thine head, and restore thee unto thy place: and thou shalt deliver Pharaoh''s cup into his hand, after the former manner when thou wast his butler.* the restoration in three days Joseph foretells in Jasher 46:10.'
  FROM cross_reference_threads t, cross_references x, _session252_ja46_lookup sv, _session252_ja46_lookup tv
 WHERE t.slug='jasher-46-butler-vine-dream-restored'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=46 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=40 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-46-remember-me-purity-false-charge
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 40:14 — *But think on me when it shall be well with thee, and shew kindness, I pray thee, unto me, and make mention of me unto Pharaoh, and bring me out of this house:* Joseph''s ''remember me when it is well with you'' of Jasher 46:10.'
  FROM cross_reference_threads t, cross_references x, _session252_ja46_lookup sv, _session252_ja46_lookup tv
 WHERE t.slug='jasher-46-remember-me-purity-false-charge'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=46 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=40 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 40:15 — *For indeed I was stolen away out of the land of the Hebrews: and here also have I done nothing that they should put me into the dungeon.* the same ''stolen away, here for naught'' protest Joseph makes in Jasher 46:10-11.'
  FROM cross_reference_threads t, cross_references x, _session252_ja46_lookup sv, _session252_ja46_lookup tv
 WHERE t.slug='jasher-46-remember-me-purity-false-charge'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=46 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=40 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 39:9 — *There is none greater in this house than I; neither hath he kept back any thing from me but thee, because thou art his wife: how then can I do this great wickedness, and sin against Elohim (God)?* the purity that makes the ''false'' charge of Jasher 46:11 false — the seed kept clean.'
  FROM cross_reference_threads t, cross_references x, _session252_ja46_lookup sv, _session252_ja46_lookup tv
 WHERE t.slug='jasher-46-remember-me-purity-false-charge'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=46 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=39 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Corinthians 6:18 — *Flee fornication. Every sin that a man doeth is without the body; but he that committeth fornication sinneth against his own body.* the apostle commands the very fleeing Joseph chose, vindicating his protest in Jasher 46:11.'
  FROM cross_reference_threads t, cross_references x, _session252_ja46_lookup sv, _session252_ja46_lookup tv
 WHERE t.slug='jasher-46-remember-me-purity-false-charge'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=46 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=6 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 39:6 — *And Joseph remembered these words and refused to lie with her.* Jubilees records the refusal that made the wife''s accusation false, the ''false'' charge Joseph names in Jasher 46:11.'
  FROM cross_reference_threads t, cross_references x, _session252_ja46_lookup sv, _session252_ja46_lookup tv
 WHERE t.slug='jasher-46-remember-me-purity-false-charge'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=46 AND sv.verse_number=11
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=39 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-46-baker-baskets-dream-hanged
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 40:16 — *When the chief baker saw that the interpretation was good, he said unto Joseph, I also was in my dream, and, behold, I had three white baskets on my head:* the same three white baskets the baker tells in Jasher 46:13.'
  FROM cross_reference_threads t, cross_references x, _session252_ja46_lookup sv, _session252_ja46_lookup tv
 WHERE t.slug='jasher-46-baker-baskets-dream-hanged'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=46 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=40 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 40:17 — *And in the uppermost basket there was of all manner of bakemeats for Pharaoh; and the birds did eat them out of the basket upon my head.* the bakemeats and birds of the baker''s dream in Jasher 46:13.'
  FROM cross_reference_threads t, cross_references x, _session252_ja46_lookup sv, _session252_ja46_lookup tv
 WHERE t.slug='jasher-46-baker-baskets-dream-hanged'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=46 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=40 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 40:19 — *Yet within three days shall Pharaoh lift up thy head from off thee, and shall hang thee on a tree; and the birds shall eat thy flesh from off thee.* the hanging-on-a-tree verdict Joseph speaks in Jasher 46:14.'
  FROM cross_reference_threads t, cross_references x, _session252_ja46_lookup sv, _session252_ja46_lookup tv
 WHERE t.slug='jasher-46-baker-baskets-dream-hanged'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=46 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=40 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-46-butler-forgot-trusted-in-man-tried
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 40:23 — *Yet did not the chief butler remember Joseph, but forgat him.* the same forgetting Jasher 46:19 records, which it reads as Yahuah''s discipline for trusting in man.'
  FROM cross_reference_threads t, cross_references x, _session252_ja46_lookup sv, _session252_ja46_lookup tv
 WHERE t.slug='jasher-46-butler-forgot-trusted-in-man-tried'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=46 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=40 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 41:9 — *Then spake the chief butler unto Pharaoh, saying, I do remember my faults this day:* the delayed remembering that follows the butler''s forgetting in Jasher 46:19.'
  FROM cross_reference_threads t, cross_references x, _session252_ja46_lookup sv, _session252_ja46_lookup tv
 WHERE t.slug='jasher-46-butler-forgot-trusted-in-man-tried'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=46 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=41 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalms 105:19 — *Until the time that his word came: the word of Yahuah (LORD) tried him.* the Psalm names the forgetting of Jasher 46:19 as Yahuah trying the righteous one until his hour.'
  FROM cross_reference_threads t, cross_references x, _session252_ja46_lookup sv, _session252_ja46_lookup tv
 WHERE t.slug='jasher-46-butler-forgot-trusted-in-man-tried'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=46 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=105 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Acts 7:9 — *And the patriarchs, moved with envy, sold Joseph into Egypt: but Elohim (God) was with him,* Stephen reads the whole prison ordeal of Jasher 46:19 as Elohim being with the rejected one.'
  FROM cross_reference_threads t, cross_references x, _session252_ja46_lookup sv, _session252_ja46_lookup tv
 WHERE t.slug='jasher-46-butler-forgot-trusted-in-man-tried'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=46 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 39:18 — *But the chief butler forgot Joseph in the prison, although he had informed him what would befall him, and did not remember to inform Pharaoh how Joseph had told him for he forgot.* Jubilees tells the same forgetting Jasher 46:19 attributes to Yahuah''s hand.'
  FROM cross_reference_threads t, cross_references x, _session252_ja46_lookup sv, _session252_ja46_lookup tv
 WHERE t.slug='jasher-46-butler-forgot-trusted-in-man-tried'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=46 AND sv.verse_number=19
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=39 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-46-joseph-messiah-type-meant-for-good
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 45:5 — *Now therefore be not grieved, nor angry with yourselves, that ye sold me hither: for Elohim (God) did send me before you to preserve life.* the prison years of Jasher 46:20 are the path by which the rejected one is kept to preserve life.'
  FROM cross_reference_threads t, cross_references x, _session252_ja46_lookup sv, _session252_ja46_lookup tv
 WHERE t.slug='jasher-46-joseph-messiah-type-meant-for-good'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=46 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=45 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 50:20 — *But as for you, ye thought evil against me; but Elohim (God) meant it unto good, to bring to pass, as it is this day, to save much people alive.* the Messiah-type verdict over Joseph''s whole ordeal, including the dungeon years of Jasher 46:20.'
  FROM cross_reference_threads t, cross_references x, _session252_ja46_lookup sv, _session252_ja46_lookup tv
 WHERE t.slug='jasher-46-joseph-messiah-type-meant-for-good'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=46 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=50 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 8:28 — *And we know that all things work together for good to them that love Elohim (God), to them who are the called according to his purpose.* the apostle gathers Joseph''s ''meant for good'' prison years of Jasher 46:20 into the promise over all the called.'
  FROM cross_reference_threads t, cross_references x, _session252_ja46_lookup sv, _session252_ja46_lookup tv
 WHERE t.slug='jasher-46-joseph-messiah-type-meant-for-good'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=46 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=8 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Wisdom of Solomon 10:14 — *And left him not in bonds, till she brought him the sceptre of the kingdom, and power against those that oppressed him: as for them that had accused him, she shewed them to be liars, and gave him perpetual glory.* reads the completed prison years of Jasher 46:20 as the road from bonds to the sceptre, the accusers shown to be liars.'
  FROM cross_reference_threads t, cross_references x, _session252_ja46_lookup sv, _session252_ja46_lookup tv
 WHERE t.slug='jasher-46-joseph-messiah-type-meant-for-good'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=46 AND sv.verse_number=20
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=10 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

