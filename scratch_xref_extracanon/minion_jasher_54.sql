-- ----- fragment: minion_jasher_54.sql (session252 jasher 54) -----
-- Source anchor: jasher/jasher ch54. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja54 (view _session252_ja54_lookup). Sort band base 56325, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja54_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-54-judah-surety-benjamin
  ('jasher', 'jasher', 54, 57, 'canon', 'genesis', 44, 32, 'free', E'Genesis 44:32 — *For thy servant became surety for the lad unto my father, saying, If I bring him not unto thee, then I shall bear the blame to my father for ever.* The same surety-oath Jasher 54:57 puts in Yahudah''s mouth before Joseph.'),
  ('jasher', 'jasher', 54, 58, 'canon', 'genesis', 44, 33, 'free', E'Genesis 44:33 — *Now therefore, I pray thee, let thy servant abide instead of the lad a bondman to my lord; and let the lad go up with his brethren.* Yahudah''s offer in Jasher 54:58 to remain as a substitute for Benjamin is the canon''s own substitution plea.'),
  ('jasher', 'jasher', 54, 57, 'jubilees', 'jubilees', 43, 13, 'extras', E'Jubilees 43:13 — *Now rather let me, your servant, abide instead of the boy as a bondsman to my lord, and let the lad go with his brethren, for I became surety for him at the hand of your servant our father, and if I do not bring him back, your servant will bear the blame to our father for ever.* The Jubilees apparatus carries Yahudah''s surety-plea word for word beside Jasher 54:57-58.'),
  -- thread: jasher-54-joseph-made-known
  ('jasher', 'jasher', 54, 69, 'canon', 'genesis', 45, 3, 'free', E'Genesis 45:3 — *And Joseph said unto his brethren, I am Joseph; doth my father yet live? And his brethren could not answer him; for they were troubled at his presence.* Joseph''s self-disclosure in Jasher 54:69 is the canon''s own "I am Joseph."'),
  ('jasher', 'jasher', 54, 69, 'canon', 'genesis', 45, 7, 'free', E'Genesis 45:7 — *And Elohim (God) sent me before you to preserve you a posterity in the earth, and to save your lives by a great deliverance.* The providence Jasher 54:69 confesses — Elohim sent him before them — kept the covenant seed alive through the famine.'),
  ('jasher', 'jasher', 54, 69, 'canon', 'genesis', 45, 8, 'free', E'Genesis 45:8 — *So now it was not you that sent me hither, but Elohim (God): and he hath made me a father to Pharaoh, and lord of all his house, and a ruler throughout all the land of Egypt.* Jasher 54:69 names the same hand: not the brothers but Elohim set Joseph before them.'),
  ('jasher', 'jasher', 54, 69, 'jubilees', 'jubilees', 43, 14, 'extras', E'Jubilees 43:14 — *And Joseph saw that they were all accordant in goodness one with another, and he could not refrain himself, and he told them that he was Joseph.* The Jubilees apparatus times the disclosure exactly as Jasher 54:69 does.'),
  ('jasher', 'jasher', 54, 69, 'canon', 'acts', 7, 13, 'free', E'Acts 7:13 — *And at the second time Joseph was made known to his brethren; and Joseph''s kindred was made known unto Pharaoh.* Stephen rehearses the very making-known Jasher 54:69 dramatizes.'),
  -- thread: jasher-54-judah-lion-strength
  ('jasher', 'jasher', 54, 6, 'canon', 'genesis', 49, 8, 'free', E'Genesis 49:8 — *Yahudah (Judah), thou art he whom thy brethren shall praise: thy hand shall be in the neck of thine enemies; thy father''s children shall bow down before thee.* Jasher 54:6 magnifies the very might Jacob blessed onto the sceptre-tribe.'),
  ('jasher', 'jasher', 54, 46, 'canon', 'genesis', 49, 9, 'free', E'Genesis 49:9 — *Yahudah (Judah) is a lion''s whelp: from the prey, my son, thou art gone up: he stooped down, he couched as a lion, and as an old lion; who shall rouse him up?* Yahudah roaring like a lion in Jasher 54:46 is the canon''s own lion''s-whelp blessing made vivid.'),
  -- thread: jasher-54-twenty-pieces-silver
  ('jasher', 'jasher', 54, 19, 'canon', 'genesis', 37, 28, 'free', E'Genesis 37:28 — *Then there passed by Midianites merchantmen; and they drew and lifted up Joseph out of the pit, and sold Joseph to the Ishmeelites for twenty pieces of silver: and they brought Joseph into Egypt.* Jasher 54:19 names the same twenty pieces of silver Genesis records.'),
  ('jasher', 'jasher', 54, 24, 'canon', 'acts', 7, 9, 'free', E'Acts 7:9 — *And the patriarchs, moved with envy, sold Joseph into Egypt: but Elohim (God) was with him,* The selling Joseph throws back at his brothers in Jasher 54:24 is the patriarchs'' sin Stephen names.'),
  ('jasher', 'jasher', 54, 24, 'canon', 'genesis', 50, 20, 'free', E'Genesis 50:20 — *But as for you, ye thought evil against me; but Elohim (God) meant it unto good, to bring to pass, as it is this day, to save much people alive.* The crime rehearsed in Jasher 54:24 is the evil Elohim bent to keep the seed alive.'),
  -- thread: jasher-54-sarah-pharaoh-plagues
  ('jasher', 'jasher', 54, 7, 'canon', 'genesis', 12, 17, 'free', E'Genesis 12:17 — *And Yahuah (LORD) plagued Pharaoh and his house with great plagues because of Sarai Abram''s wife.* The plaguing of Pharaoh "on account of Sarah" that Yahudah cites in Jasher 54:7 is this Genesis scene.'),
  ('jasher', 'jasher', 54, 7, 'canon', 'genesis', 15, 13, 'free', E'Genesis 15:13 — *And he said unto Abram, Know of a surety that thy seed shall be a stranger in a land that is not theirs, and shall serve them; and they shall afflict them four hundred years;* The covenant with Abraham that Yahudah trusts Elohim to remember in Jasher 54:7 is the same covenant that foretold the bondage in Egypt.'),
  -- thread: jasher-54-jacobs-spirit-revived
  ('jasher', 'jasher', 54, 103, 'canon', 'genesis', 45, 26, 'free', E'Genesis 45:26 — *And told him, saying, Joseph is yet alive, and he is governor over all the land of Egypt. And Jacob''s heart fainted, for he believed them not.* Jacob''s heart palpitating and his disbelief in Jasher 54:103 is the canon''s own "his heart fainted, for he believed them not."'),
  ('jasher', 'jasher', 54, 103, 'canon', 'genesis', 45, 27, 'free', E'Genesis 45:27 — *And they told him all the words of Joseph, which he had said unto them: and when he saw the wagons which Joseph had sent to carry him, the spirit of Jacob their father revived:* Jacob believing only when he saw what Joseph sent (Jasher 54:103) is the reviving of his spirit Genesis records.'),
  ('jasher', 'jasher', 54, 105, 'canon', 'genesis', 45, 28, 'free', E'Genesis 45:28 — *And Yashar''el (Israel) said, It is enough; Joseph my son is yet alive: I will go and see him before I die.* Jacob''s resolve in Jasher 54:105 is the canon''s own "It is enough... I will go and see him before I die."'),
  -- thread: jasher-54-abraham-smote-the-kings
  ('jasher', 'jasher', 54, 60, 'canon', 'genesis', 14, 14, 'free', E'Genesis 14:14 — *And when Abram heard that his brother was taken captive, he armed his trained servants, born in his own house, three hundred and eighteen, and pursued them unto Dan.* Abraham''s rescue Yahudah recalls in Jasher 54:60 is this Genesis muster of the fathers'' strength.'),
  ('jasher', 'jasher', 54, 60, 'canon', 'genesis', 14, 15, 'free', E'Genesis 14:15 — *And he divided himself against them, he and his servants, by night, and smote them, and pursued them unto Hobah, which is on the left hand of Damascus.* The night-victory "in one night" Yahudah cites in Jasher 54:60 is Genesis''s own account of Abram smiting the kings by night.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja54_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja54_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-54-judah-surety-benjamin',
       E'Yahudah stands surety for the lad',
       E'Jasher gives Judah''s own words: *And Judah answered Joseph, saying, Surely you must know that I was security for the lad to his father, saying, If I brought him not to him I should bear his blame forever* (Jasher 54:57), and he offers himself in the boy''s place — *now therefore may I find grace in your sight that you shall send him to go with us, and behold I will remain as a substitute for him, to serve you in whatever you desire* (Jasher 54:58). This is the very plea Genesis sets on the page: *For thy servant became surety for the lad unto my father, saying, If I bring him not unto thee, then I shall bear the blame to my father for ever* (Genesis 44:32), and *Now therefore, I pray thee, let thy servant abide instead of the lad a bondman to my lord; and let the lad go up with his brethren* (Genesis 44:33). The Jubilees apparatus narrates the same offer: *Now rather let me, your servant, abide instead of the boy as a bondsman to my lord, and let the lad go with his brethren, for I became surety for him at the hand of your servant our father, and if I do not bring him back, your servant will bear the blame to our father for ever.* (Jubilees 43:13). It ain''t new — Judah''s substitution for his brother is the canon''s own scene, the sceptre-tribe already standing in another''s place.',
       sv.verse_id, ev.verse_id, 'extras', 56325
  FROM _session252_ja54_lookup sv, _session252_ja54_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=54 AND sv.verse_number=57
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=54 AND ev.verse_number=58
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-54-joseph-made-known',
       E'I am Joseph — sent before you to preserve',
       E'The crisis breaks when Joseph can hold back no longer: *I am Joseph whom you sold to Egypt, now therefore let it not grieve you that you sold me, for as a support during the famine did Elohim send me before you* (Jasher 54:69). Genesis sets the same revelation and the same theology of providence on the page: *And Joseph said unto his brethren, I am Joseph; doth my father yet live? And his brethren could not answer him; for they were troubled at his presence* (Genesis 45:3), and *And Elohim (God) sent me before you to preserve you a posterity in the earth, and to save your lives by a great deliverance* (Genesis 45:7), for *it was not you that sent me hither, but Elohim (God): and he hath made me a father to Pharaoh, and lord of all his house, and a ruler throughout all the land of Egypt* (Genesis 45:8). Jubilees tells it the same: *And Joseph saw that they were all accordant in goodness one with another, and he could not refrain himself, and he told them that he was Joseph* (Jubilees 43:14). And Stephen rehearses it in Acts: *And at the second time Joseph was made known to his brethren; and Joseph''s kindred was made known unto Pharaoh* (Acts 7:13). The evil meant against the seed Elohim bends to keep the seed alive — election standing.',
       sv.verse_id, ev.verse_id, 'extras', 56328
  FROM _session252_ja54_lookup sv, _session252_ja54_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=54 AND sv.verse_number=69
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=54 AND ev.verse_number=69
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-54-judah-lion-strength',
       E'The lion''s whelp — Yahudah''s might over his brethren',
       E'Jasher''s legendary expansion magnifies Judah''s strength against Egypt — *I with my strength, who am greater and mightier than both of them, come this day upon you and your land if you are unwilling to send our brother* (Jasher 54:6) — and the brothers fear his roaring: *Judah again sat before Joseph and roared at him like a lion, and gave a great and tremendous shriek at him* (Jasher 54:46). This is Jasher amplifying the canon''s own blessing on the sceptre-tribe. Jacob had already named Yahudah the lion whom his brethren praise and before whom they bow: *Yahudah (Judah), thou art he whom thy brethren shall praise: thy hand shall be in the neck of thine enemies; thy father''s children shall bow down before thee* (Genesis 49:8), *Yahudah (Judah) is a lion''s whelp: from the prey, my son, thou art gone up: he stooped down, he couched as a lion, and as an old lion; who shall rouse him up?* (Genesis 49:9). The legend is honestly an expansion of a real blessing — the same sceptre-line whose hand is on the enemies'' neck, the lion who will not be roused. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 56331
  FROM _session252_ja54_lookup sv, _session252_ja54_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=54 AND sv.verse_number=6
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=54 AND ev.verse_number=46
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-54-twenty-pieces-silver',
       E'Sold for twenty pieces of silver',
       E'Joseph throws their old crime back at them: *And why did you forsake your brother and sell him for twenty pieces of silver to this day* (Jasher 54:19), naming the sum again — *all of you sold him to the Midianites for twenty pieces of silver, and you all denied it to your father and said to him, An evil beast has devoured him* (Jasher 54:24). Genesis fixes the price and the buyers exactly: *Then there passed by Midianites merchantmen; and they drew and lifted up Joseph out of the pit, and sold Joseph to the Ishmeelites for twenty pieces of silver: and they brought Joseph into Egypt* (Genesis 37:28). Stephen names the sin plainly: *And the patriarchs, moved with envy, sold Joseph into Egypt: but Elohim (God) was with him* (Acts 7:9). The brothers'' guilt is real, yet Joseph reads it as Elohim''s keeping — *ye thought evil against me; but Elohim (God) meant it unto good* (Genesis 50:20). The seed was sold, but the seed was kept.',
       sv.verse_id, ev.verse_id, 'extras', 56334
  FROM _session252_ja54_lookup sv, _session252_ja54_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=54 AND sv.verse_number=19
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=54 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-54-sarah-pharaoh-plagues',
       E'What Elohim did to Pharaoh on account of Sarah',
       E'Judah warns Joseph by invoking the fathers'' history: *Have you not heard what our Elohim (God) who made choice of us did to Pharaoh on account of Sarah our mother, whom he took away from our father, that he smote him and his household with heavy plagues... so will our Elohim do to you on account of Benjamin* (Jasher 54:7). Jasher leans on a canon scene the reader can turn to: *And Yahuah (LORD) plagued Pharaoh and his house with great plagues because of Sarai Abram''s wife* (Genesis 12:17). The same covenant-keeping Elohim who guarded Sarah will, Judah argues, remember His covenant with Abraham — the bondage and deliverance already promised: *Know of a surety that thy seed shall be a stranger in a land that is not theirs, and shall serve them; and they shall afflict them four hundred years* (Genesis 15:13). Election precedes the threat: the God who *made choice of us* keeps His own.',
       sv.verse_id, ev.verse_id, 'extras', 56337
  FROM _session252_ja54_lookup sv, _session252_ja54_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=54 AND sv.verse_number=7
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=54 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-54-jacobs-spirit-revived',
       E'It is enough — Jacob''s spirit revives',
       E'When the sons reach Canaan and prove Joseph lives, *Jacob heard all the words of his sons, and his heart palpitated at their words, for he could not believe them until he saw all that Joseph had given them* (Jasher 54:103), and then resolves, *It is enough for me that my son Joseph is still living, I will go and see him before I die* (Jasher 54:105). Genesis sets the same disbelief, the same reviving, and the same resolve on the page: *And told him, saying, Joseph is yet alive, and he is governor over all the land of Egypt. And Jacob''s heart fainted, for he believed them not* (Genesis 45:26); *And they told him all the words of Joseph, which he had said unto them: and when he saw the wagons which Joseph had sent to carry him, the spirit of Jacob their father revived* (Genesis 45:27); *And Yashar''el (Israel) said, It is enough; Joseph my son is yet alive: I will go and see him before I die* (Genesis 45:28). Jasher''s Serach-with-the-harp is added color, but the father''s reviving and resolve are the canon''s own — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 56340
  FROM _session252_ja54_lookup sv, _session252_ja54_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=54 AND sv.verse_number=103
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=54 AND ev.verse_number=105
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-54-abraham-smote-the-kings',
       E'Abraham smote the kings — the fathers'' strength inherited',
       E'Judah grounds the family''s might in Abraham''s victory: *Dost you not know or have you not heard that our father Abraham with his servant Eliezer smote all the kings of Elam with their hosts in one night, they left not one remaining? and ever since that day our father''s strength was given to us for an inheritance, for us and our seed forever* (Jasher 54:60). Genesis records that night-battle exactly: *And when Abram heard that his brother was taken captive, he armed his trained servants, born in his own house, three hundred and eighteen, and pursued them unto Dan* (Genesis 14:14), *And he divided himself against them, he and his servants, by night, and smote them, and pursued them unto Hobah, which is on the left hand of Damascus* (Genesis 14:15). Jasher claims the patriarch''s strength as a covenant inheritance for the seed — the same chosen line, kept and equipped from the fathers.',
       sv.verse_id, ev.verse_id, 'extras', 56343
  FROM _session252_ja54_lookup sv, _session252_ja54_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=54 AND sv.verse_number=60
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=54 AND ev.verse_number=60
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-54-judah-surety-benjamin
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 44:32 — *For thy servant became surety for the lad unto my father, saying, If I bring him not unto thee, then I shall bear the blame to my father for ever.* The same surety-oath Jasher 54:57 puts in Yahudah''s mouth before Joseph.'
  FROM cross_reference_threads t, cross_references x, _session252_ja54_lookup sv, _session252_ja54_lookup tv
 WHERE t.slug='jasher-54-judah-surety-benjamin'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=54 AND sv.verse_number=57
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=44 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 44:33 — *Now therefore, I pray thee, let thy servant abide instead of the lad a bondman to my lord; and let the lad go up with his brethren.* Yahudah''s offer in Jasher 54:58 to remain as a substitute for Benjamin is the canon''s own substitution plea.'
  FROM cross_reference_threads t, cross_references x, _session252_ja54_lookup sv, _session252_ja54_lookup tv
 WHERE t.slug='jasher-54-judah-surety-benjamin'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=54 AND sv.verse_number=58
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=44 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 43:13 — *Now rather let me, your servant, abide instead of the boy as a bondsman to my lord, and let the lad go with his brethren, for I became surety for him at the hand of your servant our father, and if I do not bring him back, your servant will bear the blame to our father for ever.* The Jubilees apparatus carries Yahudah''s surety-plea word for word beside Jasher 54:57-58.'
  FROM cross_reference_threads t, cross_references x, _session252_ja54_lookup sv, _session252_ja54_lookup tv
 WHERE t.slug='jasher-54-judah-surety-benjamin'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=54 AND sv.verse_number=57
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=43 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-54-joseph-made-known
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 45:3 — *And Joseph said unto his brethren, I am Joseph; doth my father yet live? And his brethren could not answer him; for they were troubled at his presence.* Joseph''s self-disclosure in Jasher 54:69 is the canon''s own "I am Joseph."'
  FROM cross_reference_threads t, cross_references x, _session252_ja54_lookup sv, _session252_ja54_lookup tv
 WHERE t.slug='jasher-54-joseph-made-known'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=54 AND sv.verse_number=69
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=45 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 45:7 — *And Elohim (God) sent me before you to preserve you a posterity in the earth, and to save your lives by a great deliverance.* The providence Jasher 54:69 confesses — Elohim sent him before them — kept the covenant seed alive through the famine.'
  FROM cross_reference_threads t, cross_references x, _session252_ja54_lookup sv, _session252_ja54_lookup tv
 WHERE t.slug='jasher-54-joseph-made-known'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=54 AND sv.verse_number=69
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=45 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 45:8 — *So now it was not you that sent me hither, but Elohim (God): and he hath made me a father to Pharaoh, and lord of all his house, and a ruler throughout all the land of Egypt.* Jasher 54:69 names the same hand: not the brothers but Elohim set Joseph before them.'
  FROM cross_reference_threads t, cross_references x, _session252_ja54_lookup sv, _session252_ja54_lookup tv
 WHERE t.slug='jasher-54-joseph-made-known'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=54 AND sv.verse_number=69
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=45 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 43:14 — *And Joseph saw that they were all accordant in goodness one with another, and he could not refrain himself, and he told them that he was Joseph.* The Jubilees apparatus times the disclosure exactly as Jasher 54:69 does.'
  FROM cross_reference_threads t, cross_references x, _session252_ja54_lookup sv, _session252_ja54_lookup tv
 WHERE t.slug='jasher-54-joseph-made-known'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=54 AND sv.verse_number=69
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=43 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Acts 7:13 — *And at the second time Joseph was made known to his brethren; and Joseph''s kindred was made known unto Pharaoh.* Stephen rehearses the very making-known Jasher 54:69 dramatizes.'
  FROM cross_reference_threads t, cross_references x, _session252_ja54_lookup sv, _session252_ja54_lookup tv
 WHERE t.slug='jasher-54-joseph-made-known'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=54 AND sv.verse_number=69
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-54-judah-lion-strength
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 49:8 — *Yahudah (Judah), thou art he whom thy brethren shall praise: thy hand shall be in the neck of thine enemies; thy father''s children shall bow down before thee.* Jasher 54:6 magnifies the very might Jacob blessed onto the sceptre-tribe.'
  FROM cross_reference_threads t, cross_references x, _session252_ja54_lookup sv, _session252_ja54_lookup tv
 WHERE t.slug='jasher-54-judah-lion-strength'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=54 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 49:9 — *Yahudah (Judah) is a lion''s whelp: from the prey, my son, thou art gone up: he stooped down, he couched as a lion, and as an old lion; who shall rouse him up?* Yahudah roaring like a lion in Jasher 54:46 is the canon''s own lion''s-whelp blessing made vivid.'
  FROM cross_reference_threads t, cross_references x, _session252_ja54_lookup sv, _session252_ja54_lookup tv
 WHERE t.slug='jasher-54-judah-lion-strength'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=54 AND sv.verse_number=46
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-54-twenty-pieces-silver
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 37:28 — *Then there passed by Midianites merchantmen; and they drew and lifted up Joseph out of the pit, and sold Joseph to the Ishmeelites for twenty pieces of silver: and they brought Joseph into Egypt.* Jasher 54:19 names the same twenty pieces of silver Genesis records.'
  FROM cross_reference_threads t, cross_references x, _session252_ja54_lookup sv, _session252_ja54_lookup tv
 WHERE t.slug='jasher-54-twenty-pieces-silver'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=54 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=37 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Acts 7:9 — *And the patriarchs, moved with envy, sold Joseph into Egypt: but Elohim (God) was with him,* The selling Joseph throws back at his brothers in Jasher 54:24 is the patriarchs'' sin Stephen names.'
  FROM cross_reference_threads t, cross_references x, _session252_ja54_lookup sv, _session252_ja54_lookup tv
 WHERE t.slug='jasher-54-twenty-pieces-silver'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=54 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 50:20 — *But as for you, ye thought evil against me; but Elohim (God) meant it unto good, to bring to pass, as it is this day, to save much people alive.* The crime rehearsed in Jasher 54:24 is the evil Elohim bent to keep the seed alive.'
  FROM cross_reference_threads t, cross_references x, _session252_ja54_lookup sv, _session252_ja54_lookup tv
 WHERE t.slug='jasher-54-twenty-pieces-silver'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=54 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=50 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-54-sarah-pharaoh-plagues
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 12:17 — *And Yahuah (LORD) plagued Pharaoh and his house with great plagues because of Sarai Abram''s wife.* The plaguing of Pharaoh "on account of Sarah" that Yahudah cites in Jasher 54:7 is this Genesis scene.'
  FROM cross_reference_threads t, cross_references x, _session252_ja54_lookup sv, _session252_ja54_lookup tv
 WHERE t.slug='jasher-54-sarah-pharaoh-plagues'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=54 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 15:13 — *And he said unto Abram, Know of a surety that thy seed shall be a stranger in a land that is not theirs, and shall serve them; and they shall afflict them four hundred years;* The covenant with Abraham that Yahudah trusts Elohim to remember in Jasher 54:7 is the same covenant that foretold the bondage in Egypt.'
  FROM cross_reference_threads t, cross_references x, _session252_ja54_lookup sv, _session252_ja54_lookup tv
 WHERE t.slug='jasher-54-sarah-pharaoh-plagues'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=54 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-54-jacobs-spirit-revived
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 45:26 — *And told him, saying, Joseph is yet alive, and he is governor over all the land of Egypt. And Jacob''s heart fainted, for he believed them not.* Jacob''s heart palpitating and his disbelief in Jasher 54:103 is the canon''s own "his heart fainted, for he believed them not."'
  FROM cross_reference_threads t, cross_references x, _session252_ja54_lookup sv, _session252_ja54_lookup tv
 WHERE t.slug='jasher-54-jacobs-spirit-revived'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=54 AND sv.verse_number=103
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=45 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 45:27 — *And they told him all the words of Joseph, which he had said unto them: and when he saw the wagons which Joseph had sent to carry him, the spirit of Jacob their father revived:* Jacob believing only when he saw what Joseph sent (Jasher 54:103) is the reviving of his spirit Genesis records.'
  FROM cross_reference_threads t, cross_references x, _session252_ja54_lookup sv, _session252_ja54_lookup tv
 WHERE t.slug='jasher-54-jacobs-spirit-revived'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=54 AND sv.verse_number=103
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=45 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 45:28 — *And Yashar''el (Israel) said, It is enough; Joseph my son is yet alive: I will go and see him before I die.* Jacob''s resolve in Jasher 54:105 is the canon''s own "It is enough... I will go and see him before I die."'
  FROM cross_reference_threads t, cross_references x, _session252_ja54_lookup sv, _session252_ja54_lookup tv
 WHERE t.slug='jasher-54-jacobs-spirit-revived'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=54 AND sv.verse_number=105
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=45 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-54-abraham-smote-the-kings
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 14:14 — *And when Abram heard that his brother was taken captive, he armed his trained servants, born in his own house, three hundred and eighteen, and pursued them unto Dan.* Abraham''s rescue Yahudah recalls in Jasher 54:60 is this Genesis muster of the fathers'' strength.'
  FROM cross_reference_threads t, cross_references x, _session252_ja54_lookup sv, _session252_ja54_lookup tv
 WHERE t.slug='jasher-54-abraham-smote-the-kings'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=54 AND sv.verse_number=60
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=14 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 14:15 — *And he divided himself against them, he and his servants, by night, and smote them, and pursued them unto Hobah, which is on the left hand of Damascus.* The night-victory "in one night" Yahudah cites in Jasher 54:60 is Genesis''s own account of Abram smiting the kings by night.'
  FROM cross_reference_threads t, cross_references x, _session252_ja54_lookup sv, _session252_ja54_lookup tv
 WHERE t.slug='jasher-54-abraham-smote-the-kings'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=54 AND sv.verse_number=60
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=14 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

