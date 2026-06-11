-- ----- fragment: minion_jasher_52.sql (session252 jasher 52) -----
-- Source anchor: jasher/jasher ch52. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja52 (view _session252_ja52_lookup). Sort band base 56275, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja52_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-52-returned-money-terror
  ('jasher', 'jasher', 52, 1, 'canon', 'genesis', 42, 35, 'free', E'Genesis 42:35 — *And it came to pass as they emptied their sacks, that, behold, every man’s bundle of money was in his sack: and when both they and their father saw the bundles of money, they were afraid.* The terror over the returned money in Jasher 52:1 is the canon scene retold.'),
  ('jasher', 'jasher', 52, 5, 'canon', 'genesis', 42, 38, 'free', E'Genesis 42:38 — *And he said, My son shall not go down with you; for his brother is dead, and he is left alone: if mischief befall him by the way in the which ye go, then shall ye bring down my gray hairs with sorrow to the grave.* Jacob''s refusal to send Benjamin in Jasher 52:5 is the same word given to Genesis.'),
  ('jasher', 'jasher', 52, 5, 'jubilees', 'jubilees', 42, 10, 'extras', E'Jubilees 42:10 — *And Jacob said: “Me have you bereaved of my children! Joseph is not and Simeon also is not, and you will take Benjamin away. On me has your wickedness come.”* Jubilees records the same grieving father at the same moment as Jasher 52:5.'),
  ('jasher', 'jasher', 52, 4, 'jubilees', 'jubilees', 42, 11, 'extras', E'Jubilees 42:11 — *And he said: “My son will not go down with you lest perchance he fall sick; for their mother gave birth to two sons, and one has perished, and this one also you will take from me. If perchance he took a fever on the road, you would bring down my old age with sorrow to death.” For he saw that their money had been returned to every man in his sack, and for this reason he feared to send him.* Jasher 52:4 carries Jacob''s same fear of losing the last son of Rachel.'),
  -- thread: jasher-52-judah-surety-benjamin
  ('jasher', 'jasher', 52, 19, 'canon', 'genesis', 43, 9, 'free', E'Genesis 43:9 — *I will be surety for him; of my hand shalt thou require him: if I bring him not unto thee, and set him before thee, then let me bear the blame for ever:* Judah''s pledge in Jasher 52:19 is the canon''s own word, nearly verbatim.'),
  ('jasher', 'jasher', 52, 19, 'canon', 'genesis', 44, 32, 'free', E'Genesis 44:32 — *For thy servant became surety for the lad unto my father, saying, If I bring him not unto thee, then I shall bear the blame to my father for ever.* Before Joseph''s throne Judah makes good the very surety he gives in Jasher 52:19.'),
  ('jasher', 'jasher', 52, 11, 'canon', 'genesis', 43, 5, 'free', E'Genesis 43:5 — *But if thou wilt not send him, we will not go down: for the man said unto us, Ye shall not see my face, except your brother be with you.* The condition Judah reports in Jasher 52:11 — no Benjamin, no audience — is the man''s word in Genesis.'),
  ('jasher', 'jasher', 52, 19, 'jubilees', 'jubilees', 43, 13, 'extras', E'Jubilees 43:13 — *Now rather let me, your servant, abide instead of the boy as a bondsman to my lord, and let the lad go with his brethren, for I became surety for him at the hand of your servant our father, and if I do not bring him back, your servant will bear the blame to our father for ever.* Jubilees carries Judah''s surety to its climax — offering himself a bondsman — the same pledge first given in Jasher 52:19.'),
  ('jasher', 'jasher', 52, 19, 'canon', 'genesis', 49, 10, 'free', E'Genesis 49:10 — *The sceptre shall not depart from Yahudah (Judah), nor a lawgiver from between his feet, until Shiloh come; and unto him shall the gathering of the people be.* Judah who bears the blame for his brother in Jasher 52:19 is the tribe of the sceptre, foreshadowing the Surety to come.'),
  -- thread: jasher-52-reuben-pledge-sons
  ('jasher', 'jasher', 52, 5, 'canon', 'genesis', 42, 37, 'free', E'Genesis 42:37 — *And Reuben spake unto his father, saying, Slay my two sons, if I bring him not to thee: deliver him into my hand, and I will bring him to thee again.* Reuben''s pledge of his two sons in Jasher 52:5 is the canon scene, word for word.'),
  ('jasher', 'jasher', 52, 5, 'jubilees', 'jubilees', 42, 18, 'extras', E'Jubilees 42:18 — *And Reuben said: “Give him into my hand, and if I do not bring him back to you, slay my two sons instead of his soul.” And he said to him He will not go with you."* Jubilees likewise records the firstborn''s rejected surety before Judah''s, matching Jasher 52:5.'),
  -- thread: jasher-52-jacob-prayer-covenant
  ('jasher', 'jasher', 52, 23, 'canon', 'genesis', 43, 14, 'free', E'Genesis 43:14 — *And El Shaddai (God Almighty) give you mercy before the man, that he may send away your other brother, and Benjamin. If I be bereaved of my children, I am bereaved.* Jacob''s El Shaddai blessing in Jasher 52:23 is the patriarchal benediction the canon records.'),
  ('jasher', 'jasher', 52, 26, 'canon', 'genesis', 15, 13, 'free', E'Genesis 15:13 — *And he said unto Abram, Know of a surety that thy seed shall be a stranger in a land that is not theirs, and shall serve them; and they shall afflict them four hundred years;* The covenant Jacob pleads in Jasher 52:26 is the one that already foretold this going-down and the bondage to come.'),
  ('jasher', 'jasher', 52, 26, 'canon', 'genesis', 15, 14, 'free', E'Genesis 15:14 — *And also that nation, whom they shall serve, will I judge: and afterward shall they come out with great substance.* The affliction Jacob fears in Jasher 52:26 is bounded by the same covenant''s promise of judgment and deliverance.'),
  -- thread: jasher-52-famine-seed-to-egypt
  ('jasher', 'jasher', 52, 7, 'jubilees', 'jubilees', 42, 4, 'extras', E'Jubilees 42:4 — *(Now the famine was very sore in the land of Canaan), and Jacob heard that there was food in Egypt, and he sent his ten sons that they should procure food for him in Egypt; but Benjamin he did not send, and (the ten sons of Jacob) arrived (in Egypt) among those that went (there.)* Jubilees opens the same famine and sending that drives Jasher 52:7.'),
  ('jasher', 'jasher', 52, 7, 'canon', 'psalms', 105, 16, 'free', E'Psalm 105:16 — *Moreover he called for a famine upon the land: he brake the whole staff of bread.* The psalm reads the famine of Jasher 52:7 as Yahuah''s own deliberate act.'),
  ('jasher', 'jasher', 52, 7, 'canon', 'psalms', 105, 17, 'free', E'Psalm 105:17 — *He sent a man before them, even Joseph, who was sold for a servant:* The famine that bends the seed toward Egypt in Jasher 52:7 is the providence that set Joseph ahead of them.'),
  ('jasher', 'jasher', 52, 10, 'canon', 'acts', 7, 12, 'free', E'Acts 7:12 — *But when Jacob heard that there was corn in Egypt, he sent out our fathers first.* Stephen retells the same sending for bread that Jacob commands in Jasher 52:10.'),
  -- thread: jasher-52-jacob-letter-fathers-deeds
  ('jasher', 'jasher', 52, 36, 'canon', 'genesis', 34, 25, 'free', E'Genesis 34:25 — *And it came to pass on the third day, when they were sore, that two of the sons of Jacob, Simeon and Levi, Dinah’s brethren, took each man his sword, and came upon the city boldly, and slew all the males.* The deed of Simeon and Levi that Jacob recalls in his letter (Jasher 52:36) is the Genesis scene at Shechem.'),
  ('jasher', 'jasher', 52, 35, 'canon', 'genesis', 14, 14, 'free', E'Genesis 14:14 — *And when Abram heard that his brother was taken captive, he armed his trained servants, born in his own house, three hundred and eighteen, and pursued them unto Dan.* Abraham smiting the kings with a few men, recalled in Jasher 52:35, is the canon''s own account of the rescue of Lot.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja52_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja52_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-52-returned-money-terror',
       E'The money returned in the sacks — and Jacob''s grief',
       E'Jasher 52 opens not with legend but with the canon''s own Joseph scene: *And they entered their house, and every man opened his sack and they saw and behold every man’s bundle of money was there, at which they and their father were greatly terrified.* (Jasher 52:1). This is Genesis retold almost word for word — *And it came to pass as they emptied their sacks, that, behold, every man’s bundle of money was in his sack: and when both they and their father saw the bundles of money, they were afraid.* (Genesis 42:35). Jacob''s anguish over his lost sons is the same in both books: *And Jacob said to his sons, Abide you here and do not go down to Egypt, for my son shall not go down with you to Egypt, nor die like his brother.* (Jasher 52:5) carries *And he said, My son shall not go down with you; for his brother is dead, and he is left alone: if mischief befall him by the way in the which ye go, then shall ye bring down my gray hairs with sorrow to the grave.* (Genesis 42:38). Jubilees narrates the very same hour: *And Jacob said: “Me have you bereaved of my children! Joseph is not and Simeon also is not, and you will take Benjamin away. On me has your wickedness come.”* (Jubilees 42:10). It ain''t new — three witnesses tell one story.',
       sv.verse_id, ev.verse_id, 'extras', 56275
  FROM _session252_ja52_lookup sv, _session252_ja52_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=52 AND sv.verse_number=1
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=52 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-52-judah-surety-benjamin',
       E'Judah''s surety for Benjamin',
       E'When Jacob will not let Benjamin go, it is Judah who stands surety — the tribe of the sceptre stepping forward for the brother: *And Judah said to Jacob his father, Give the lad into my care and we will rise up and go down to Egypt and buy corn, and then return, and it shall be when we return if the lad be not with us, then let me bear your blame forever.* (Jasher 52:19). This is Genesis spoken back to us: *And Yahudah (Judah) said unto Yashar''el (Israel) his father, Send the lad with me, and we will arise and go; that we may live, and not die, both we, and thou, and also our little ones.* (Genesis 43:8) — *I will be surety for him; of my hand shalt thou require him: if I bring him not unto thee, and set him before thee, then let me bear the blame for ever* (Genesis 43:9). Judah will make good that surety before Joseph''s throne: *For thy servant became surety for the lad unto my father, saying, If I bring him not unto thee, then I shall bear the blame to my father for ever.* (Genesis 44:32). Jubilees names the same man giving the same pledge: *And Yahudah (Judah) came near and said: “Send him with me, and if I do not bring him back to you, let me bear the blame before you all the days of my life.”* (Jubilees 42:19). The one who stands for his brother is the one of whom it is written, *The sceptre shall not depart from Yahudah (Judah), nor a lawgiver from between his feet, until Shiloh come; and unto him shall the gathering of the people be.* (Genesis 49:10) — Judah''s surety here foreshadows the Surety who would bear the blame forever.',
       sv.verse_id, ev.verse_id, 'extras', 56278
  FROM _session252_ja52_lookup sv, _session252_ja52_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=52 AND sv.verse_number=18
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=52 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-52-reuben-pledge-sons',
       E'Reuben''s rash pledge of his two sons',
       E'Before Judah, the firstborn tries his own surety — and it is rejected: *And Reuben said to his father, You shall slay my two sons if I do not bring your son and place him before you; and Jacob said to his sons, Abide you here and do not go down to Egypt, for my son shall not go down with you to Egypt, nor die like his brother.* (Jasher 52:5). Genesis gives the same offer and the same refusal: *And Reuben spake unto his father, saying, Slay my two sons, if I bring him not to thee: deliver him into my hand, and I will bring him to thee again.* (Genesis 42:37). Jubilees, too, records Reuben''s failed bid before Judah succeeds: *And Reuben said: “Give him into my hand, and if I do not bring him back to you, slay my two sons instead of his soul.” And he said to him He will not go with you."* (Jubilees 42:18). The firstborn''s word does not carry; the surety that holds is Judah''s — the seed-line''s order quietly turning toward the sceptre tribe.',
       sv.verse_id, ev.verse_id, 'extras', 56281
  FROM _session252_ja52_lookup sv, _session252_ja52_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=52 AND sv.verse_number=5
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=52 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-52-jacob-prayer-covenant',
       E'Jacob''s prayer — the covenant with Abraham remembered, the seed going down',
       E'Jasher expands the bare Genesis sending into a scene of intercession: *And Jacob rose up from his sons and spread forth his hands and he prayed to Yahuah (the Lord) on account of his sons, saying, O Yahuah Elohim (O Lord God) of heaven and earth, remember your covenant with our father Abraham, remember it with my father Isaac and deal kindly with my sons and deliver them not into the hands of the king of Egypt* (Jasher 52:26). The blessing Jacob speaks over them is the El Shaddai of the patriarchs: *Now therefore rise up and go to the man... and may the El Shaddai (Almighty God) give you mercy before him that he may send Benjamin and Simeon your brethren with you.* (Jasher 52:23) — the very benediction Genesis puts in Jacob''s mouth: *And El Shaddai (God Almighty) give you mercy before the man, that he may send away your other brother, and Benjamin. If I be bereaved of my children, I am bereaved.* (Genesis 43:14). And the covenant Jacob pleads is the one cut with Abraham, which already foretold this descent into Egypt and the bondage to follow: *And he said unto Abram, Know of a surety that thy seed shall be a stranger in a land that is not theirs, and shall serve them; and they shall afflict them four hundred years;* (Genesis 15:13). The fathers'' going-down for bread is the first step into the affliction promised — and into the great deliverance: *And also that nation, whom they shall serve, will I judge: and afterward shall they come out with great substance.* (Genesis 15:14). The covenant stands; the seed is kept; Torah-before-Sinai prays in the spread hands of Jacob.',
       sv.verse_id, ev.verse_id, 'extras', 56284
  FROM _session252_ja52_lookup sv, _session252_ja52_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=52 AND sv.verse_number=22
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=52 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-52-famine-seed-to-egypt',
       E'The famine drives the seed down to Egypt',
       E'The engine that moves the whole chapter is the famine that empties Canaan and bends the chosen seed toward Egypt: *And in those days the famine was sore throughout the land, and all the people of the earth went and came to Egypt to buy food, for the famine prevailed greatly amongst them, and the sons of Jacob remained in Canaan a year and two months until their corn was finished.* (Jasher 52:7). Jubilees opens the same scene: *(Now the famine was very sore in the land of Canaan), and Jacob heard that there was food in Egypt, and he sent his ten sons that they should procure food for him in Egypt; but Benjamin he did not send, and (the ten sons of Jacob) arrived (in Egypt) among those that went (there.)* (Jubilees 42:4). The psalmist reads this famine as Yahuah''s own hand setting His servant ahead of the seed: *Moreover he called for a famine upon the land: he brake the whole staff of bread.* (Psalm 105:16) — *He sent a man before them, even Joseph, who was sold for a servant:* (Psalm 105:17). Stephen tells it as the opening of Israel''s whole Egyptian sojourn: *Now there came a dearth over all the land of Egypt and Chanaan, and great affliction: and our fathers found no sustenance.* (Acts 7:11) — *But when Jacob heard that there was corn in Egypt, he sent out our fathers first.* (Acts 7:12). The hunger that drives Jacob''s sons down in Jasher 52:7 is the same hand that will plant the seventy in Egypt to multiply into the nation — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 56287
  FROM _session252_ja52_lookup sv, _session252_ja52_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=52 AND sv.verse_number=7
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=52 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-52-jacob-letter-fathers-deeds',
       E'Jacob''s letter — the fathers'' deeds recalled as warning',
       E'Jasher uniquely furnishes the letter Jacob sends to the king of Egypt, in which the old man recites the covenant power that has always guarded his house — each deed a genuine Genesis scene: *And also what my two sons Simeon and Levi did to the eight cities of the Amorites, how they destroyed them on account of their sister Dinah?* (Jasher 52:36). That is Genesis remembered: *And it came to pass on the third day, when they were sore, that two of the sons of Jacob, Simeon and Levi, Dinah’s brethren, took each man his sword, and came upon the city boldly, and slew all the males.* (Genesis 34:25). Jacob also recalls Abraham''s rescue of Lot from the eastern kings: *and also what our father Abraham did to the nine kings of Elam, how he smote them all with a few men that were with him?* (Jasher 52:35) — *And when Abram heard that his brother was taken captive, he armed his trained servants, born in his own house, three hundred and eighteen, and pursued them unto Dan.* (Genesis 14:14). The point of the letter is the seed-keeping covenant itself: *Dost you not know, O king of Egypt, that the power of Elohim is with us, and that also Elohim ever hears our prayers and forsakes us not all the days?* (Jasher 52:38). The fathers'' deeds Jasher recalls are the canon''s own — the chosen line kept and defended generation by generation.',
       sv.verse_id, ev.verse_id, 'extras', 56290
  FROM _session252_ja52_lookup sv, _session252_ja52_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=52 AND sv.verse_number=35
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=52 AND ev.verse_number=38
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-52-returned-money-terror
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 42:35 — *And it came to pass as they emptied their sacks, that, behold, every man’s bundle of money was in his sack: and when both they and their father saw the bundles of money, they were afraid.* The terror over the returned money in Jasher 52:1 is the canon scene retold.'
  FROM cross_reference_threads t, cross_references x, _session252_ja52_lookup sv, _session252_ja52_lookup tv
 WHERE t.slug='jasher-52-returned-money-terror'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=52 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=42 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 42:38 — *And he said, My son shall not go down with you; for his brother is dead, and he is left alone: if mischief befall him by the way in the which ye go, then shall ye bring down my gray hairs with sorrow to the grave.* Jacob''s refusal to send Benjamin in Jasher 52:5 is the same word given to Genesis.'
  FROM cross_reference_threads t, cross_references x, _session252_ja52_lookup sv, _session252_ja52_lookup tv
 WHERE t.slug='jasher-52-returned-money-terror'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=52 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=42 AND tv.verse_number=38
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 42:10 — *And Jacob said: “Me have you bereaved of my children! Joseph is not and Simeon also is not, and you will take Benjamin away. On me has your wickedness come.”* Jubilees records the same grieving father at the same moment as Jasher 52:5.'
  FROM cross_reference_threads t, cross_references x, _session252_ja52_lookup sv, _session252_ja52_lookup tv
 WHERE t.slug='jasher-52-returned-money-terror'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=52 AND sv.verse_number=5
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=42 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 42:11 — *And he said: “My son will not go down with you lest perchance he fall sick; for their mother gave birth to two sons, and one has perished, and this one also you will take from me. If perchance he took a fever on the road, you would bring down my old age with sorrow to death.” For he saw that their money had been returned to every man in his sack, and for this reason he feared to send him.* Jasher 52:4 carries Jacob''s same fear of losing the last son of Rachel.'
  FROM cross_reference_threads t, cross_references x, _session252_ja52_lookup sv, _session252_ja52_lookup tv
 WHERE t.slug='jasher-52-returned-money-terror'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=52 AND sv.verse_number=4
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=42 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-52-judah-surety-benjamin
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 43:9 — *I will be surety for him; of my hand shalt thou require him: if I bring him not unto thee, and set him before thee, then let me bear the blame for ever:* Judah''s pledge in Jasher 52:19 is the canon''s own word, nearly verbatim.'
  FROM cross_reference_threads t, cross_references x, _session252_ja52_lookup sv, _session252_ja52_lookup tv
 WHERE t.slug='jasher-52-judah-surety-benjamin'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=52 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=43 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 44:32 — *For thy servant became surety for the lad unto my father, saying, If I bring him not unto thee, then I shall bear the blame to my father for ever.* Before Joseph''s throne Judah makes good the very surety he gives in Jasher 52:19.'
  FROM cross_reference_threads t, cross_references x, _session252_ja52_lookup sv, _session252_ja52_lookup tv
 WHERE t.slug='jasher-52-judah-surety-benjamin'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=52 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=44 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 43:5 — *But if thou wilt not send him, we will not go down: for the man said unto us, Ye shall not see my face, except your brother be with you.* The condition Judah reports in Jasher 52:11 — no Benjamin, no audience — is the man''s word in Genesis.'
  FROM cross_reference_threads t, cross_references x, _session252_ja52_lookup sv, _session252_ja52_lookup tv
 WHERE t.slug='jasher-52-judah-surety-benjamin'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=52 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=43 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 43:13 — *Now rather let me, your servant, abide instead of the boy as a bondsman to my lord, and let the lad go with his brethren, for I became surety for him at the hand of your servant our father, and if I do not bring him back, your servant will bear the blame to our father for ever.* Jubilees carries Judah''s surety to its climax — offering himself a bondsman — the same pledge first given in Jasher 52:19.'
  FROM cross_reference_threads t, cross_references x, _session252_ja52_lookup sv, _session252_ja52_lookup tv
 WHERE t.slug='jasher-52-judah-surety-benjamin'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=52 AND sv.verse_number=19
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=43 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Genesis 49:10 — *The sceptre shall not depart from Yahudah (Judah), nor a lawgiver from between his feet, until Shiloh come; and unto him shall the gathering of the people be.* Judah who bears the blame for his brother in Jasher 52:19 is the tribe of the sceptre, foreshadowing the Surety to come.'
  FROM cross_reference_threads t, cross_references x, _session252_ja52_lookup sv, _session252_ja52_lookup tv
 WHERE t.slug='jasher-52-judah-surety-benjamin'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=52 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-52-reuben-pledge-sons
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 42:37 — *And Reuben spake unto his father, saying, Slay my two sons, if I bring him not to thee: deliver him into my hand, and I will bring him to thee again.* Reuben''s pledge of his two sons in Jasher 52:5 is the canon scene, word for word.'
  FROM cross_reference_threads t, cross_references x, _session252_ja52_lookup sv, _session252_ja52_lookup tv
 WHERE t.slug='jasher-52-reuben-pledge-sons'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=52 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=42 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jubilees 42:18 — *And Reuben said: “Give him into my hand, and if I do not bring him back to you, slay my two sons instead of his soul.” And he said to him He will not go with you."* Jubilees likewise records the firstborn''s rejected surety before Judah''s, matching Jasher 52:5.'
  FROM cross_reference_threads t, cross_references x, _session252_ja52_lookup sv, _session252_ja52_lookup tv
 WHERE t.slug='jasher-52-reuben-pledge-sons'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=52 AND sv.verse_number=5
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=42 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-52-jacob-prayer-covenant
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 43:14 — *And El Shaddai (God Almighty) give you mercy before the man, that he may send away your other brother, and Benjamin. If I be bereaved of my children, I am bereaved.* Jacob''s El Shaddai blessing in Jasher 52:23 is the patriarchal benediction the canon records.'
  FROM cross_reference_threads t, cross_references x, _session252_ja52_lookup sv, _session252_ja52_lookup tv
 WHERE t.slug='jasher-52-jacob-prayer-covenant'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=52 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=43 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 15:13 — *And he said unto Abram, Know of a surety that thy seed shall be a stranger in a land that is not theirs, and shall serve them; and they shall afflict them four hundred years;* The covenant Jacob pleads in Jasher 52:26 is the one that already foretold this going-down and the bondage to come.'
  FROM cross_reference_threads t, cross_references x, _session252_ja52_lookup sv, _session252_ja52_lookup tv
 WHERE t.slug='jasher-52-jacob-prayer-covenant'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=52 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 15:14 — *And also that nation, whom they shall serve, will I judge: and afterward shall they come out with great substance.* The affliction Jacob fears in Jasher 52:26 is bounded by the same covenant''s promise of judgment and deliverance.'
  FROM cross_reference_threads t, cross_references x, _session252_ja52_lookup sv, _session252_ja52_lookup tv
 WHERE t.slug='jasher-52-jacob-prayer-covenant'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=52 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-52-famine-seed-to-egypt
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jubilees 42:4 — *(Now the famine was very sore in the land of Canaan), and Jacob heard that there was food in Egypt, and he sent his ten sons that they should procure food for him in Egypt; but Benjamin he did not send, and (the ten sons of Jacob) arrived (in Egypt) among those that went (there.)* Jubilees opens the same famine and sending that drives Jasher 52:7.'
  FROM cross_reference_threads t, cross_references x, _session252_ja52_lookup sv, _session252_ja52_lookup tv
 WHERE t.slug='jasher-52-famine-seed-to-egypt'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=52 AND sv.verse_number=7
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=42 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 105:16 — *Moreover he called for a famine upon the land: he brake the whole staff of bread.* The psalm reads the famine of Jasher 52:7 as Yahuah''s own deliberate act.'
  FROM cross_reference_threads t, cross_references x, _session252_ja52_lookup sv, _session252_ja52_lookup tv
 WHERE t.slug='jasher-52-famine-seed-to-egypt'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=52 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=105 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 105:17 — *He sent a man before them, even Joseph, who was sold for a servant:* The famine that bends the seed toward Egypt in Jasher 52:7 is the providence that set Joseph ahead of them.'
  FROM cross_reference_threads t, cross_references x, _session252_ja52_lookup sv, _session252_ja52_lookup tv
 WHERE t.slug='jasher-52-famine-seed-to-egypt'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=52 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=105 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Acts 7:12 — *But when Jacob heard that there was corn in Egypt, he sent out our fathers first.* Stephen retells the same sending for bread that Jacob commands in Jasher 52:10.'
  FROM cross_reference_threads t, cross_references x, _session252_ja52_lookup sv, _session252_ja52_lookup tv
 WHERE t.slug='jasher-52-famine-seed-to-egypt'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=52 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-52-jacob-letter-fathers-deeds
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 34:25 — *And it came to pass on the third day, when they were sore, that two of the sons of Jacob, Simeon and Levi, Dinah’s brethren, took each man his sword, and came upon the city boldly, and slew all the males.* The deed of Simeon and Levi that Jacob recalls in his letter (Jasher 52:36) is the Genesis scene at Shechem.'
  FROM cross_reference_threads t, cross_references x, _session252_ja52_lookup sv, _session252_ja52_lookup tv
 WHERE t.slug='jasher-52-jacob-letter-fathers-deeds'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=52 AND sv.verse_number=36
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=34 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 14:14 — *And when Abram heard that his brother was taken captive, he armed his trained servants, born in his own house, three hundred and eighteen, and pursued them unto Dan.* Abraham smiting the kings with a few men, recalled in Jasher 52:35, is the canon''s own account of the rescue of Lot.'
  FROM cross_reference_threads t, cross_references x, _session252_ja52_lookup sv, _session252_ja52_lookup tv
 WHERE t.slug='jasher-52-jacob-letter-fathers-deeds'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=52 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=14 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

