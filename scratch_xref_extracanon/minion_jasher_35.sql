-- ----- fragment: minion_jasher_35.sql (session252 jasher 35) -----
-- Source anchor: jasher/jasher ch35. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja35 (view _session252_ja35_lookup). Sort band base 55850, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja35_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-35-shechem-terror-of-elohim
  ('jasher', 'jasher', 35, 1, 'canon', 'genesis', 35, 5, 'free', E'Genesis 35:5 — *And they journeyed: and the terror of Elohim (God) was upon the cities that were round about them, and they did not pursue after the sons of Jacob.* The canon supplies exactly the dread Jasher 35:1-2 narrates the Amorite kings consulting under — the cities round about do not pursue.'),
  ('jasher', 'jasher', 35, 2, 'canon', 'exodus', 23, 27, 'free', E'Exodus 23:27 — *I will send my fear before thee, and will destroy all the people to whom thou shalt come, and I will make all thine enemies turn their backs unto thee.* The fear Yahuah pours into the kings'' advisers in Jasher 35:2 is the same covenant weapon He promises Israel.'),
  -- thread: jasher-35-abraham-nimrod-fire
  ('jasher', 'jasher', 35, 7, 'jasher', 'jasher', 12, 24, 'extras', E'Jasher 12:24 — *And Yahuah (the Lord) loved Abram and he had compassion over him, and Yahuah (the Lord) came down and delivered Abram from the fire and he was not burned.* The deliverance the counsellors cite in Jasher 35:7 is the very rescue Jasher''s own earlier chapter narrates.'),
  ('jasher', 'jasher', 35, 6, 'canon', 'joshua', 24, 2, 'free', E'Joshua 24:2 — *And Joshua said unto all the people, Thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel), Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods.* The canon frames Abraham''s call as the seed drawn out of Nimrod''s idolatry that Jasher 35:6 recalls.'),
  -- thread: jasher-35-abraham-smote-kings-elam
  ('jasher', 'jasher', 35, 9, 'canon', 'genesis', 14, 14, 'free', E'Genesis 14:14 — *And when Abram heard that his brother was taken captive, he armed his trained servants, born in his own house, three hundred and eighteen, and pursued them unto Dan.* The few faithful men of Abraham''s house pursuing by night in Jasher 35:9 is the canon''s own account of the war on the kings.'),
  ('jasher', 'jasher', 35, 8, 'canon', 'genesis', 14, 16, 'free', E'Genesis 14:16 — *And he brought back all the goods, and also brought again his brother Lot, and his goods, and the women also, and the people.* Jasher 35:8-9 names the rescued kinsman in Sodom and his restored property exactly as Genesis records of Lot.'),
  -- thread: jasher-35-binding-of-isaac-oath
  ('jasher', 'jasher', 35, 11, 'canon', 'genesis', 22, 12, 'free', E'Genesis 22:12 — *And he said, Lay not thine hand upon the lad, neither do thou any thing unto him: for now I know that thou fearest Elohim (God), seeing thou hast not withheld thy son, thine only son from me.* Jasher 35:11''s note that Elohim prevented the offering matches the canon''s stayed hand and tested fear of Elohim.'),
  ('jasher', 'jasher', 35, 12, 'canon', 'genesis', 22, 17, 'free', E'Genesis 22:17 — *That in blessing I will bless thee, and in multiplying I will multiply thy seed as the stars of the heaven, and as the sand which is upon the sea shore; and thy seed shall possess the gate of his enemies.* The promise to deliver Abraham''s seed from every trouble in Jasher 35:12 is the canon''s sworn blessing on the akedah.'),
  ('jasher', 'jasher', 35, 11, 'jubilees', 'jubilees', 17, 16, 'extras', E'Jubilees 17:16 — *And the prince Mastêmâ came and said before Elohim (God), "Behold, Abraham loves Isaac his son, and he delights in him above all things else; bid him offer him as a burnt-offering on the altar, and You will see if he will do this command, and You will know if he is faithful in everything wherein You do try him."* Jasher 35:11''s love-driven offering of the only son is the same trial Jubilees frames as the testing of Abraham''s faithfulness.'),
  -- thread: jasher-35-sister-pharaoh-abimelech
  ('jasher', 'jasher', 35, 13, 'canon', 'genesis', 12, 17, 'free', E'Genesis 12:17 — *And Yahuah (LORD) plagued Pharaoh and his house with great plagues because of Sarai Abram''s wife.* Jasher 35:13''s memory of what Elohim did to Pharaoh over Abraham''s wife is the canon''s plague-judgment on Egypt''s house.'),
  ('jasher', 'jasher', 35, 13, 'canon', 'genesis', 20, 2, 'free', E'Genesis 20:2 — *And Abraham said of Sarah his wife, She is my sister: and Abimelech king of Gerar sent, and took Sarah.* The ''she is my sister'' and the king of Gerar named in Jasher 35:13 are taken straight from Genesis.'),
  ('jasher', 'jasher', 35, 13, 'canon', 'genesis', 20, 17, 'free', E'Genesis 20:17 — *So Abraham prayed unto Elohim (God): and Elohim (God) healed Abimelech, and his wife, and his maidservants; and they bare children.* The judgment on Abimelech''s people that Jasher 35:13 alludes to is the canon''s affliction lifted only by Abraham''s prayer.'),
  -- thread: jasher-35-esau-four-hundred-men
  ('jasher', 'jasher', 35, 14, 'canon', 'genesis', 32, 6, 'free', E'Genesis 32:6 — *And the messengers returned to Jacob, saying, We came to thy brother Esau, and also he cometh to meet thee, and four hundred men with him.* The four hundred men coming with Esau in Jasher 35:14 is the canon''s own report to Jacob.'),
  ('jasher', 'jasher', 35, 15, 'canon', 'genesis', 33, 1, 'free', E'Genesis 33:1 — *And Jacob lifted up his eyes, and looked, and, behold, Esau came, and with him four hundred men. And he divided the children unto Leah, and unto Rachel, and unto the two handmaids.* The deliverance from Esau''s hand that Jasher 35:15 cites is the canon''s encounter where the four hundred do no harm.'),
  -- thread: jasher-35-war-with-their-elohim
  ('jasher', 'jasher', 35, 19, 'canon', 'exodus', 23, 27, 'free', E'Exodus 23:27 — *I will send my fear before thee, and will destroy all the people to whom thou shalt come, and I will make all thine enemies turn their backs unto thee.* The kings warring against Israel''s Elohim in Jasher 35:19 face the very dread Yahuah promises to send before His people.'),
  ('jasher', 'jasher', 35, 23, 'canon', 'joshua', 2, 9, 'free', E'Joshua 2:9 — *And she said unto the men, I know that Yahuah (LORD) hath given you the land, and that your terror is fallen upon us, and that all the inhabitants of the land faint because of you.* The Amorite kings'' melting hearts in Jasher 35:23 are Rahab''s confession in advance — the inhabitants faint before the chosen seed.'),
  ('jasher', 'jasher', 35, 24, 'canon', 'genesis', 35, 5, 'free', E'Genesis 35:5 — *And they journeyed: and the terror of Elohim (God) was upon the cities that were round about them, and they did not pursue after the sons of Jacob.* That the kings'' restraint proceeded from Yahuah in Jasher 35:24 is the canon''s same statement that the terror of Elohim, not the sons'' strength, stayed the cities.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja35_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja35_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-35-shechem-terror-of-elohim',
       E'Two slew Shechem, and the terror of Elohim fell on the cities',
       E'The Amorite kings take counsel against Jacob''s sons after the slaughter at Shechem, and Yahuah turns their hearts to fear: *And all the kings of the Amorites came and took their stand in the field to consult with their counsellors what was to be done with the sons of Jacob, for they were still afraid of them, saying, Behold, two of them slew the whole of the city of Shechem* (Jasher 35:1); *And Yahuah (the Lord) heard the prayers of Isaac and Jacob, and he filled the hearts of all these kings'' advisers with great fear and terror* (Jasher 35:2). It ain''t new — this is the canon''s own scene drawn out. Genesis names the two who took Shechem and the dread that fell after: *And they journeyed: and the terror of Elohim (God) was upon the cities that were round about them, and they did not pursue after the sons of Jacob* (Genesis 35:5). The same supernatural fear that guards the seed at the Exodus and the conquest is already at work around the patriarch.',
       sv.verse_id, ev.verse_id, 'extras', 55850
  FROM _session252_ja35_lookup sv, _session252_ja35_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=35 AND sv.verse_number=1
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=35 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-35-abraham-nimrod-fire',
       E'He delivered Abraham from Nimrod and from the fire',
       E'The counsellors recount the seed''s whole deliverance-history to dissuade the kings: *Surely he delivered their father Abraham, the Hebrew, from the hand of Nimrod, and from the hand of all his people who had many times sought to slay him* (Jasher 35:6); *He delivered him also from the fire in which king Nimrod had cast him, and his Elohim delivered him from it* (Jasher 35:7). Jasher tells the furnace-rescue at length earlier in its own scroll: *And Yahuah (the Lord) loved Abram and he had compassion over him, and Yahuah (the Lord) came down and delivered Abram from the fire and he was not burned* (Jasher 12:25). The canon itself remembers the line as called out of idolatry — the kingdom of man (Nimrod, Babel) versus the chosen seed: *Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods* (Joshua 24:2). Election, not the church; the seed kept from the tyrant''s hand.',
       sv.verse_id, ev.verse_id, 'extras', 55853
  FROM _session252_ja35_lookup sv, _session252_ja35_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=35 AND sv.verse_number=6
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=35 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-35-abraham-smote-kings-elam',
       E'Abraham slew the kings of Elam and rescued his brother''s son',
       E'The advisers press on with the war against the eastern kings: *surely it was Abraham who slew the five kings of Elam, when they had touched his brother''s son who in those days dwelt in Sodom* (Jasher 35:8); *And took his servant that was faithful in his house and a few of his men, and they pursued the kings of Elam in one night and killed them, and restored to his brother''s son all his property which they had taken from him* (Jasher 35:9). This is Genesis 14 retold — the night pursuit, the few men, the recovered captive: *And when Abram heard that his brother was taken captive, he armed his trained servants, born in his own house, three hundred and eighteen, and pursued them unto Dan* (Genesis 14:14); *And he brought back all the goods, and also brought again his brother Lot, and his goods, and the women also, and the people* (Genesis 14:16). The argument is plain — a handful with their Elohim already overthrew kings; how shall the Amorites stand?',
       sv.verse_id, ev.verse_id, 'extras', 55856
  FROM _session252_ja35_lookup sv, _session252_ja35_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=35 AND sv.verse_number=8
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=35 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-35-binding-of-isaac-oath',
       E'The only son offered, and the oath sworn over the seed',
       E'The counsellors reach the akedah as the supreme proof of Yahuah''s bond with this seed: *And behold through his love toward his Elohim, Abraham took his only and precious son and intended to bring him up as a burnt offering to his Elohim* (Jasher 35:11); *And Elohim saw all his works, and swore to him, and promised him that he would deliver his sons and all his seed from every trouble that would befall them* (Jasher 35:12). Genesis records both the stayed hand and the sworn deliverance: *And he said, Lay not thine hand upon the lad, neither do thou any thing unto him: for now I know that thou fearest Elohim (God), seeing thou hast not withheld thy son, thine only son from me* (Genesis 22:12); *That in blessing I will bless thee, and in multiplying I will multiply thy seed as the stars of the heaven... and thy seed shall possess the gate of his enemies* (Genesis 22:17). The Jubilees apparatus tells the same trial as a faithfulness tested before the heavenly court: *And the prince Mastêmâ came and said before Elohim (God), "Behold, Abraham loves Isaac his son, and he delights in him above all things else; bid him offer him as a burnt-offering on the altar, and You will see if he will do this command..."* (Jubilees 17:14). The oath over the seed is why the kings dare not touch the sons of Jacob.',
       sv.verse_id, ev.verse_id, 'extras', 55859
  FROM _session252_ja35_lookup sv, _session252_ja35_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=35 AND sv.verse_number=11
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=35 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-35-sister-pharaoh-abimelech',
       E'She is my sister — what Elohim did to Pharaoh and Abimelech',
       E'The counsellors recall the protection of the matriarch in foreign courts: *And have you not heard what their Elohim did to Pharaoh king of Egypt, and to Abimelech king of Gerar, through taking Abraham''s wife, who said of her, She is my sister, lest they might slay him on account of her... and Elohim did to them and their people all that you heard of* (Jasher 35:13). Both episodes stand in Genesis. Of Pharaoh: *And Yahuah (LORD) plagued Pharaoh and his house with great plagues because of Sarai Abram''s wife* (Genesis 12:17). Of Abimelech: *And Abraham said of Sarah his wife, She is my sister: and Abimelech king of Gerar sent, and took Sarah* (Genesis 20:2), and the healing only when Abraham prayed — *So Abraham prayed unto Elohim (God): and Elohim (God) healed Abimelech, and his wife, and his maidservants; and they bare children* (Genesis 20:17). Kings who reached for what guarded the seed were struck; the Amorite kings are warned by it.',
       sv.verse_id, ev.verse_id, 'extras', 55862
  FROM _session252_ja35_lookup sv, _session252_ja35_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=35 AND sv.verse_number=13
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=35 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-35-esau-four-hundred-men',
       E'Esau came with four hundred men, and Elohim delivered Jacob',
       E'The freshest proof in the counsellors'' mouths is Esau''s failed ambush: *And behold, we ourselves saw with our eyes that Esau, the brother of Jacob, came to him with four hundred men, with the intention of slaying him, for he called to mind that he had taken away from him his father''s blessing* (Jasher 35:14); *and who delivered him from his hands but his Elohim in whom he trusted? he delivered him from the hand of his brother and also from the hands of his enemies, and surely he again will protect them* (Jasher 35:15). Genesis sets the four hundred and the dread: *And the messengers returned to Jacob, saying, We came to thy brother Esau, and also he cometh to meet thee, and four hundred men with him* (Genesis 32:6); *And Jacob lifted up his eyes, and looked, and, behold, Esau came, and with him four hundred men* (Genesis 33:1). The brother who came to smite turned to embrace — the seed kept again, and the kings reason from it.',
       sv.verse_id, ev.verse_id, 'extras', 55865
  FROM _session252_ja35_lookup sv, _session252_ja35_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=35 AND sv.verse_number=14
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=35 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-35-war-with-their-elohim',
       E'You war not with men but with their Elohim who chose them',
       E'The counsellors'' conclusion turns the whole recital into a warning, and the kings melt: *Surely you know and understand that you do not come to fight with them, but you come to war with their Elohim who made choice of them, and you have therefore all come this day to be destroyed* (Jasher 35:19); *And the kings turned and refrained from the sons of Jacob, for they durst not approach them to make war with them, for they were greatly afraid of them, and their hearts melted within them from their fear of them* (Jasher 35:23); *For this proceeded from Yahuah (the Lord) to them, for he heard the prayers of his servants Isaac and Jacob* (Jasher 35:24). This is the conquest-pattern before the conquest: the dread that empties the enemy''s heart is Yahuah''s own gift — *I will send my fear before thee... and I will make all thine enemies turn their backs unto thee* (Exodus 23:27), and Rahab confesses it of Israel: *I know that Yahuah (LORD) hath given you the land, and that your terror is fallen upon us, and that all the inhabitants of the land faint because of you* (Joshua 2:9). The election precedes the confession — to war with the chosen seed is to war with their Elohim.',
       sv.verse_id, ev.verse_id, 'extras', 55868
  FROM _session252_ja35_lookup sv, _session252_ja35_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=35 AND sv.verse_number=19
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=35 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-35-shechem-terror-of-elohim
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 35:5 — *And they journeyed: and the terror of Elohim (God) was upon the cities that were round about them, and they did not pursue after the sons of Jacob.* The canon supplies exactly the dread Jasher 35:1-2 narrates the Amorite kings consulting under — the cities round about do not pursue.'
  FROM cross_reference_threads t, cross_references x, _session252_ja35_lookup sv, _session252_ja35_lookup tv
 WHERE t.slug='jasher-35-shechem-terror-of-elohim'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=35 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=35 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 23:27 — *I will send my fear before thee, and will destroy all the people to whom thou shalt come, and I will make all thine enemies turn their backs unto thee.* The fear Yahuah pours into the kings'' advisers in Jasher 35:2 is the same covenant weapon He promises Israel.'
  FROM cross_reference_threads t, cross_references x, _session252_ja35_lookup sv, _session252_ja35_lookup tv
 WHERE t.slug='jasher-35-shechem-terror-of-elohim'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=35 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=23 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-35-abraham-nimrod-fire
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jasher 12:24 — *And Yahuah (the Lord) loved Abram and he had compassion over him, and Yahuah (the Lord) came down and delivered Abram from the fire and he was not burned.* The deliverance the counsellors cite in Jasher 35:7 is the very rescue Jasher''s own earlier chapter narrates.'
  FROM cross_reference_threads t, cross_references x, _session252_ja35_lookup sv, _session252_ja35_lookup tv
 WHERE t.slug='jasher-35-abraham-nimrod-fire'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=35 AND sv.verse_number=7
   AND tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=12 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Joshua 24:2 — *And Joshua said unto all the people, Thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel), Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods.* The canon frames Abraham''s call as the seed drawn out of Nimrod''s idolatry that Jasher 35:6 recalls.'
  FROM cross_reference_threads t, cross_references x, _session252_ja35_lookup sv, _session252_ja35_lookup tv
 WHERE t.slug='jasher-35-abraham-nimrod-fire'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=35 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=24 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-35-abraham-smote-kings-elam
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 14:14 — *And when Abram heard that his brother was taken captive, he armed his trained servants, born in his own house, three hundred and eighteen, and pursued them unto Dan.* The few faithful men of Abraham''s house pursuing by night in Jasher 35:9 is the canon''s own account of the war on the kings.'
  FROM cross_reference_threads t, cross_references x, _session252_ja35_lookup sv, _session252_ja35_lookup tv
 WHERE t.slug='jasher-35-abraham-smote-kings-elam'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=35 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=14 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 14:16 — *And he brought back all the goods, and also brought again his brother Lot, and his goods, and the women also, and the people.* Jasher 35:8-9 names the rescued kinsman in Sodom and his restored property exactly as Genesis records of Lot.'
  FROM cross_reference_threads t, cross_references x, _session252_ja35_lookup sv, _session252_ja35_lookup tv
 WHERE t.slug='jasher-35-abraham-smote-kings-elam'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=35 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=14 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-35-binding-of-isaac-oath
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 22:12 — *And he said, Lay not thine hand upon the lad, neither do thou any thing unto him: for now I know that thou fearest Elohim (God), seeing thou hast not withheld thy son, thine only son from me.* Jasher 35:11''s note that Elohim prevented the offering matches the canon''s stayed hand and tested fear of Elohim.'
  FROM cross_reference_threads t, cross_references x, _session252_ja35_lookup sv, _session252_ja35_lookup tv
 WHERE t.slug='jasher-35-binding-of-isaac-oath'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=35 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 22:17 — *That in blessing I will bless thee, and in multiplying I will multiply thy seed as the stars of the heaven, and as the sand which is upon the sea shore; and thy seed shall possess the gate of his enemies.* The promise to deliver Abraham''s seed from every trouble in Jasher 35:12 is the canon''s sworn blessing on the akedah.'
  FROM cross_reference_threads t, cross_references x, _session252_ja35_lookup sv, _session252_ja35_lookup tv
 WHERE t.slug='jasher-35-binding-of-isaac-oath'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=35 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 17:16 — *And the prince Mastêmâ came and said before Elohim (God), "Behold, Abraham loves Isaac his son, and he delights in him above all things else; bid him offer him as a burnt-offering on the altar, and You will see if he will do this command, and You will know if he is faithful in everything wherein You do try him."* Jasher 35:11''s love-driven offering of the only son is the same trial Jubilees frames as the testing of Abraham''s faithfulness.'
  FROM cross_reference_threads t, cross_references x, _session252_ja35_lookup sv, _session252_ja35_lookup tv
 WHERE t.slug='jasher-35-binding-of-isaac-oath'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=35 AND sv.verse_number=11
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=17 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-35-sister-pharaoh-abimelech
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 12:17 — *And Yahuah (LORD) plagued Pharaoh and his house with great plagues because of Sarai Abram''s wife.* Jasher 35:13''s memory of what Elohim did to Pharaoh over Abraham''s wife is the canon''s plague-judgment on Egypt''s house.'
  FROM cross_reference_threads t, cross_references x, _session252_ja35_lookup sv, _session252_ja35_lookup tv
 WHERE t.slug='jasher-35-sister-pharaoh-abimelech'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=35 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 20:2 — *And Abraham said of Sarah his wife, She is my sister: and Abimelech king of Gerar sent, and took Sarah.* The ''she is my sister'' and the king of Gerar named in Jasher 35:13 are taken straight from Genesis.'
  FROM cross_reference_threads t, cross_references x, _session252_ja35_lookup sv, _session252_ja35_lookup tv
 WHERE t.slug='jasher-35-sister-pharaoh-abimelech'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=35 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=20 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 20:17 — *So Abraham prayed unto Elohim (God): and Elohim (God) healed Abimelech, and his wife, and his maidservants; and they bare children.* The judgment on Abimelech''s people that Jasher 35:13 alludes to is the canon''s affliction lifted only by Abraham''s prayer.'
  FROM cross_reference_threads t, cross_references x, _session252_ja35_lookup sv, _session252_ja35_lookup tv
 WHERE t.slug='jasher-35-sister-pharaoh-abimelech'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=35 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=20 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-35-esau-four-hundred-men
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 32:6 — *And the messengers returned to Jacob, saying, We came to thy brother Esau, and also he cometh to meet thee, and four hundred men with him.* The four hundred men coming with Esau in Jasher 35:14 is the canon''s own report to Jacob.'
  FROM cross_reference_threads t, cross_references x, _session252_ja35_lookup sv, _session252_ja35_lookup tv
 WHERE t.slug='jasher-35-esau-four-hundred-men'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=35 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=32 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 33:1 — *And Jacob lifted up his eyes, and looked, and, behold, Esau came, and with him four hundred men. And he divided the children unto Leah, and unto Rachel, and unto the two handmaids.* The deliverance from Esau''s hand that Jasher 35:15 cites is the canon''s encounter where the four hundred do no harm.'
  FROM cross_reference_threads t, cross_references x, _session252_ja35_lookup sv, _session252_ja35_lookup tv
 WHERE t.slug='jasher-35-esau-four-hundred-men'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=35 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=33 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-35-war-with-their-elohim
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 23:27 — *I will send my fear before thee, and will destroy all the people to whom thou shalt come, and I will make all thine enemies turn their backs unto thee.* The kings warring against Israel''s Elohim in Jasher 35:19 face the very dread Yahuah promises to send before His people.'
  FROM cross_reference_threads t, cross_references x, _session252_ja35_lookup sv, _session252_ja35_lookup tv
 WHERE t.slug='jasher-35-war-with-their-elohim'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=35 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=23 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Joshua 2:9 — *And she said unto the men, I know that Yahuah (LORD) hath given you the land, and that your terror is fallen upon us, and that all the inhabitants of the land faint because of you.* The Amorite kings'' melting hearts in Jasher 35:23 are Rahab''s confession in advance — the inhabitants faint before the chosen seed.'
  FROM cross_reference_threads t, cross_references x, _session252_ja35_lookup sv, _session252_ja35_lookup tv
 WHERE t.slug='jasher-35-war-with-their-elohim'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=35 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 35:5 — *And they journeyed: and the terror of Elohim (God) was upon the cities that were round about them, and they did not pursue after the sons of Jacob.* That the kings'' restraint proceeded from Yahuah in Jasher 35:24 is the canon''s same statement that the terror of Elohim, not the sons'' strength, stayed the cities.'
  FROM cross_reference_threads t, cross_references x, _session252_ja35_lookup sv, _session252_ja35_lookup tv
 WHERE t.slug='jasher-35-war-with-their-elohim'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=35 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=35 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

