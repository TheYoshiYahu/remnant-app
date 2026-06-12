-- ----- fragment: minion_judith_05.sql (session253 judith 5) -----
-- Source anchor: apocrypha/judith ch5. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: jdt5 (view _session253_jdt5_lookup). Sort band base 60100, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_jdt5_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: judith-5-seed-of-the-chaldees
  ('apocrypha', 'judith', 5, 7, 'canon', 'joshua', 24, 2, 'free', E'Joshua 24:2 — *And Joshua said unto all the people, Thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel), Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods.* Achior''s Chaldea-and-idols opening is the very credo Joshua sets before the tribes.'),
  ('apocrypha', 'judith', 5, 8, 'canon', 'joshua', 24, 3, 'free', E'Joshua 24:3 — *And I took your father Abraham from the other side of the flood, and led him throughout all the land of Canaan, and multiplied his seed, and gave him Isaac.* The God whom they knew drew them out of Chaldea exactly as Joshua says He took Abraham from beyond the river.'),
  ('apocrypha', 'judith', 5, 9, 'canon', 'genesis', 12, 1, 'free', E'Genesis 12:1 — *Now Yahuah (LORD) had said unto Abram, Get thee out of thy country, and from thy kindred, and from thy father''s house, unto a land that I will shew thee:* the command to depart for Canaan that Achior reports is the founding call of Abram.'),
  -- thread: judith-5-bondage-and-the-red-sea
  ('apocrypha', 'judith', 5, 11, 'canon', 'exodus', 1, 11, 'free', E'Exodus 1:11 — *Therefore they did set over them taskmasters to afflict them with their burdens. And they built for Pharaoh treasure cities, Pithom and Raamses.* Achior''s brought low with labouring in brick names the same Egyptian bondage.'),
  ('apocrypha', 'judith', 5, 12, 'canon', 'deuteronomy', 26, 7, 'free', E'Deuteronomy 26:7 — *And when we cried unto Yahuah Elohim (the LORD God) of our fathers, Yahuah (LORD) heard our voice, and looked on our affliction, and our labour, and our oppression:* the cry that brings the plagues in Judith is the credo''s own cry of the afflicted.'),
  ('apocrypha', 'judith', 5, 13, 'canon', 'exodus', 14, 14, 'free', E'Exodus 14:14 — *Yahuah (LORD) shall fight for you, and ye shall hold your peace.* When Achior says God dried the Red sea before them, he confesses the war was Yahuah''s, not Israel''s.'),
  ('apocrypha', 'judith', 5, 13, 'canon', 'deuteronomy', 26, 8, 'free', E'Deuteronomy 26:8 — *And Yahuah (LORD) brought us forth out of Egypt with a mighty hand, and with an outstretched arm, and with great terribleness, and with signs, and with wonders:* the mighty-hand deliverance that the drying of the sea seals.'),
  -- thread: judith-5-land-not-by-their-sword
  ('apocrypha', 'judith', 5, 16, 'canon', 'joshua', 24, 13, 'free', E'Joshua 24:13 — *And I have given you a land for which ye did not labour, and cities which ye built not, and ye dwell in them; of the vineyards and oliveyards which ye planted not do ye eat.* The hill country Achior says they possessed was given, not earned.'),
  ('apocrypha', 'judith', 5, 15, 'canon', 'psalms', 44, 3, 'free', E'Psalm 44:3 — *For they got not the land in possession by their own sword, neither did their own arm save them: but thy right hand, and thine arm, and the light of thy countenance, because thou hadst a favour unto them.* Where Achior credits their strength, the fathers'' psalm credits Yahuah''s right hand alone.'),
  ('apocrypha', 'judith', 5, 14, 'canon', 'deuteronomy', 26, 9, 'free', E'Deuteronomy 26:9 — *And he hath brought us into this place, and hath given us this land, even a land that floweth with milk and honey.* The wilderness-to-inheritance arc Achior traces is the credo''s confession of a given land.'),
  -- thread: judith-5-the-shield-that-sin-breaks
  ('apocrypha', 'judith', 5, 17, 'canon', 'deuteronomy', 28, 7, 'free', E'Deuteronomy 28:7 — *Yahuah (LORD) shall cause thine enemies that rise up against thee to be smitten before thy face: they shall come out against thee one way, and flee before thee seven ways.* While they sinned not they prospered — exactly the blessing on the obedient covenant people.'),
  ('apocrypha', 'judith', 5, 18, 'canon', 'deuteronomy', 28, 15, 'free', E'Deuteronomy 28:15 — *But it shall come to pass, if thou wilt not hearken unto the voice of Yahuah Elohayka (the LORD thy God), to observe to do all his commandments and his statutes which I command thee this day; that all these curses shall come upon thee, and overtake thee:* the captivity and the cast-down temple Achior reports are the covenant curse for departing the way.'),
  ('apocrypha', 'judith', 5, 20, 'canon', 'joshua', 24, 20, 'free', E'Joshua 24:20 — *If ye forsake Yahuah (LORD), and serve strange gods, then he will turn and do you hurt, and consume you, after that he hath done you good.* Achior''s if they sin against their Elohim, this shall be their ruin is Joshua''s own warning to the tribes.'),
  ('apocrypha', 'judith', 5, 21, 'canon', 'deuteronomy', 28, 1, 'free', E'Deuteronomy 28:1 — *And it shall come to pass, if thou shalt hearken diligently unto the voice of Yahuah Elohayka (the LORD thy God), to observe and to do all his commandments which I command thee this day, that Yahuah Elohayka (the LORD thy God) will set thee on high above all nations of the earth:* if there be no iniquity, their God will defend them — the blessing side of the same covenant condition.'),
  -- thread: judith-5-the-weak-confound-the-mighty
  ('apocrypha', 'judith', 5, 23, 'canon', 'psalms', 44, 6, 'free', E'Psalm 44:6 — *For I will not trust in my bow, neither shall my sword save me.* The court trusts in Holofernes'' army, but the fathers'' psalm renounces exactly that confidence in sword and bow.'),
  ('apocrypha', 'judith', 5, 24, 'canon', 'judges', 4, 9, 'free', E'Judges 4:9 — *And she said, I will surely go with thee: notwithstanding the journey that thou takest shall not be for thine honour; for Yahuah (LORD) shall sell Sisera into the hand of a woman. And Deborah arose, and went with Barak to Kedesh.* The army that means to devour Israel will fall as Sisera did, by a woman''s hand — the pattern Judith fulfils.'),
  ('apocrypha', 'judith', 5, 24, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The proud army''s boast meets the oldest promise: the serpent''s head is bruised by the seed of the woman, the weak confounding the mighty.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_jdt5_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_jdt5_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-5-seed-of-the-chaldees',
       E'The seed that would not follow idols',
       E'Achior rehearses Israel''s beginning to the tyrant: *This people are descended of the Chaldeans: And they sojourned heretofore in Mesopotamia, because they would not follow the gods of their fathers, which were in the land of Chaldea. For they left the way of their ancestors, and worshipped Yahuah (God) of heaven, Yahuah (God) whom they knew... Then their Elohim (God) commanded them to depart from the place where they sojourned, and to go into the land of Chanaan* (Judith 5:6-9). This is the credo every Israelite confessed at Shechem — that the fathers were idolaters across the river, and Yahuah took one man out of that house: *Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham... and they served other gods. And I took your father Abraham from the other side of the flood* (Joshua 24:2-3). It is the call of Genesis 12: *Get thee out of thy country, and from thy kindred, and from thy father''s house, unto a land that I will shew thee* (Genesis 12:1). Election, not pedigree — a people made by a God who calls.',
       sv.verse_id, ev.verse_id, 'extras', 60100
  FROM _session253_jdt5_lookup sv, _session253_jdt5_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=5 AND sv.verse_number=6
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=5 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-5-bondage-and-the-red-sea',
       E'Brought low in Egypt, dried the sea before them',
       E'Achior carries the history down into the iron furnace: *Therefore the king of Egypt rose up against them, and dealt subtilly with them, and brought them low with labouring in brick, and made them slaves. Then they cried to their Elohim (God), and he struck all the land of Egypt with incurable plagues... And Yahuah (God) dried the Red sea before them* (Judith 5:11-13). This is the wandering-Aramean confession itself: *A Syrian ready to perish was my father, and he went down into Egypt... And the Egyptians evil entreated us, and afflicted us, and laid upon us hard bondage... And Yahuah (LORD) brought us forth out of Egypt with a mighty hand* (Deuteronomy 26:5-8). The brick-labour is Exodus 1: *they did set over them taskmasters to afflict them with their burdens* (Exodus 1:11). And the sea was no feat of theirs — it was His war: *Yahuah (LORD) shall fight for you, and ye shall hold your peace* (Exodus 14:14). Holofernes is told plainly: this people has a God who fights.',
       sv.verse_id, ev.verse_id, 'extras', 60103
  FROM _session253_jdt5_lookup sv, _session253_jdt5_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=5 AND sv.verse_number=10
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=5 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-5-land-not-by-their-sword',
       E'The land given, not won by their own arm',
       E'Achior tells how the wilderness gave way to inheritance: *So they dwelt in the land of the Amorites, and they destroyed by their strength all them of Esebon, and passing over Jordan they possessed all the hill country. And they cast forth before them the Chanaanite, the Pherezite, the Jebusite* (Judith 5:15-16). Yet the deeper witness corrects even Achior''s their strength — the conquest was a gift: *And I have given you a land for which ye did not labour, and cities which ye built not, and ye dwell in them; of the vineyards and oliveyards which ye planted not do ye eat* (Joshua 24:13). The psalm of the fathers makes it the song of every generation: *For they got not the land in possession by their own sword, neither did their own arm save them: but thy right hand, and thine arm, and the light of thy countenance, because thou hadst a favour unto them* (Psalm 44:3). The land flows from the sworn promise: *he hath brought us into this place, and hath given us this land* (Deuteronomy 26:9).',
       sv.verse_id, ev.verse_id, 'extras', 60106
  FROM _session253_jdt5_lookup sv, _session253_jdt5_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=5 AND sv.verse_number=14
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=5 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-5-the-shield-that-sin-breaks',
       E'Their God defends them — unless they sin',
       E'Here is the hinge of Achior''s whole speech, and the law Holofernes cannot outflank: *And while they sinned not before their Elohim (God), they prospered, because Yahuah (God) that hates iniquity was with them. But when they departed from the way which he appointed them, they were destroyed in many battles very sore, and were led captives... if there be any error against this people, and they sin against their Elohim (God), let us consider that this shall be their ruin... But if there be no iniquity in their nation, let my lord now pass by, lest their Elohim (God) defend them* (Judith 5:17-21). This is the two-tablet covenant of Deuteronomy 28 spoken to a pagan general: *if thou shalt hearken diligently unto the voice of Yahuah Elohayka... Yahuah (LORD) shall cause thine enemies that rise up against thee to be smitten before thy face* (Deuteronomy 28:1,7) — *But it shall come to pass, if thou wilt not hearken... that all these curses shall come upon thee* (Deuteronomy 28:15). Joshua warned the same: *If ye forsake Yahuah (LORD), and serve strange gods, then he will turn and do you hurt* (Joshua 24:20). The shield is Torah-faithfulness; sin, not the enemy''s sword, is the only thing that can defeat Israel.',
       sv.verse_id, ev.verse_id, 'extras', 60109
  FROM _session253_jdt5_lookup sv, _session253_jdt5_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=5 AND sv.verse_number=17
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=5 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-5-the-weak-confound-the-mighty',
       E'A people of no strength — and the war is God''s',
       E'The tyrant''s court despises the warning: *we will not be afraid of the face of the children of Yashar''el (Israel): for, lo, it is a people that have no strength nor power for a strong battle. Now therefore, lord Holofernes, we will go up, and they shall be a prey to be devoured of all your army* (Judith 5:23-24). They reckon by chariots and numbers, as Sisera once did — and the book of Judith answers them as Yahuah always has: by a woman''s hand. The fathers confessed it: *For I will not trust in my bow, neither shall my sword save me* (Psalm 44:6). And the pattern was set when Deborah told Barak the captain would fall not to an army but to a woman: *for Yahuah (LORD) shall sell Sisera into the hand of a woman* (Judges 4:9) — the very victory toward which Judith bends. Behind it all stands the first promise, the woman''s seed who crushes the head of the serpent: *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel* (Genesis 3:15). The kingdom-of-man that demands Nebuchadnezzar be feared as God will be undone — not by sword or bow, but by the weak whom Yahuah lifts to confound the mighty.',
       sv.verse_id, ev.verse_id, 'extras', 60112
  FROM _session253_jdt5_lookup sv, _session253_jdt5_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=5 AND sv.verse_number=22
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=5 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: judith-5-seed-of-the-chaldees
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joshua 24:2 — *And Joshua said unto all the people, Thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel), Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods.* Achior''s Chaldea-and-idols opening is the very credo Joshua sets before the tribes.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt5_lookup sv, _session253_jdt5_lookup tv
 WHERE t.slug='judith-5-seed-of-the-chaldees'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=5 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=24 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Joshua 24:3 — *And I took your father Abraham from the other side of the flood, and led him throughout all the land of Canaan, and multiplied his seed, and gave him Isaac.* The God whom they knew drew them out of Chaldea exactly as Joshua says He took Abraham from beyond the river.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt5_lookup sv, _session253_jdt5_lookup tv
 WHERE t.slug='judith-5-seed-of-the-chaldees'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=5 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=24 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 12:1 — *Now Yahuah (LORD) had said unto Abram, Get thee out of thy country, and from thy kindred, and from thy father''s house, unto a land that I will shew thee:* the command to depart for Canaan that Achior reports is the founding call of Abram.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt5_lookup sv, _session253_jdt5_lookup tv
 WHERE t.slug='judith-5-seed-of-the-chaldees'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=5 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-5-bondage-and-the-red-sea
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 1:11 — *Therefore they did set over them taskmasters to afflict them with their burdens. And they built for Pharaoh treasure cities, Pithom and Raamses.* Achior''s brought low with labouring in brick names the same Egyptian bondage.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt5_lookup sv, _session253_jdt5_lookup tv
 WHERE t.slug='judith-5-bondage-and-the-red-sea'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=5 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 26:7 — *And when we cried unto Yahuah Elohim (the LORD God) of our fathers, Yahuah (LORD) heard our voice, and looked on our affliction, and our labour, and our oppression:* the cry that brings the plagues in Judith is the credo''s own cry of the afflicted.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt5_lookup sv, _session253_jdt5_lookup tv
 WHERE t.slug='judith-5-bondage-and-the-red-sea'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=5 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=26 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 14:14 — *Yahuah (LORD) shall fight for you, and ye shall hold your peace.* When Achior says God dried the Red sea before them, he confesses the war was Yahuah''s, not Israel''s.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt5_lookup sv, _session253_jdt5_lookup tv
 WHERE t.slug='judith-5-bondage-and-the-red-sea'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=5 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=14 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Deuteronomy 26:8 — *And Yahuah (LORD) brought us forth out of Egypt with a mighty hand, and with an outstretched arm, and with great terribleness, and with signs, and with wonders:* the mighty-hand deliverance that the drying of the sea seals.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt5_lookup sv, _session253_jdt5_lookup tv
 WHERE t.slug='judith-5-bondage-and-the-red-sea'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=5 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=26 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-5-land-not-by-their-sword
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joshua 24:13 — *And I have given you a land for which ye did not labour, and cities which ye built not, and ye dwell in them; of the vineyards and oliveyards which ye planted not do ye eat.* The hill country Achior says they possessed was given, not earned.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt5_lookup sv, _session253_jdt5_lookup tv
 WHERE t.slug='judith-5-land-not-by-their-sword'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=5 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=24 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 44:3 — *For they got not the land in possession by their own sword, neither did their own arm save them: but thy right hand, and thine arm, and the light of thy countenance, because thou hadst a favour unto them.* Where Achior credits their strength, the fathers'' psalm credits Yahuah''s right hand alone.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt5_lookup sv, _session253_jdt5_lookup tv
 WHERE t.slug='judith-5-land-not-by-their-sword'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=5 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=44 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 26:9 — *And he hath brought us into this place, and hath given us this land, even a land that floweth with milk and honey.* The wilderness-to-inheritance arc Achior traces is the credo''s confession of a given land.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt5_lookup sv, _session253_jdt5_lookup tv
 WHERE t.slug='judith-5-land-not-by-their-sword'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=5 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=26 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-5-the-shield-that-sin-breaks
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 28:7 — *Yahuah (LORD) shall cause thine enemies that rise up against thee to be smitten before thy face: they shall come out against thee one way, and flee before thee seven ways.* While they sinned not they prospered — exactly the blessing on the obedient covenant people.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt5_lookup sv, _session253_jdt5_lookup tv
 WHERE t.slug='judith-5-the-shield-that-sin-breaks'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=5 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 28:15 — *But it shall come to pass, if thou wilt not hearken unto the voice of Yahuah Elohayka (the LORD thy God), to observe to do all his commandments and his statutes which I command thee this day; that all these curses shall come upon thee, and overtake thee:* the captivity and the cast-down temple Achior reports are the covenant curse for departing the way.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt5_lookup sv, _session253_jdt5_lookup tv
 WHERE t.slug='judith-5-the-shield-that-sin-breaks'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=5 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Joshua 24:20 — *If ye forsake Yahuah (LORD), and serve strange gods, then he will turn and do you hurt, and consume you, after that he hath done you good.* Achior''s if they sin against their Elohim, this shall be their ruin is Joshua''s own warning to the tribes.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt5_lookup sv, _session253_jdt5_lookup tv
 WHERE t.slug='judith-5-the-shield-that-sin-breaks'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=5 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=24 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Deuteronomy 28:1 — *And it shall come to pass, if thou shalt hearken diligently unto the voice of Yahuah Elohayka (the LORD thy God), to observe and to do all his commandments which I command thee this day, that Yahuah Elohayka (the LORD thy God) will set thee on high above all nations of the earth:* if there be no iniquity, their God will defend them — the blessing side of the same covenant condition.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt5_lookup sv, _session253_jdt5_lookup tv
 WHERE t.slug='judith-5-the-shield-that-sin-breaks'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=5 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-5-the-weak-confound-the-mighty
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 44:6 — *For I will not trust in my bow, neither shall my sword save me.* The court trusts in Holofernes'' army, but the fathers'' psalm renounces exactly that confidence in sword and bow.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt5_lookup sv, _session253_jdt5_lookup tv
 WHERE t.slug='judith-5-the-weak-confound-the-mighty'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=5 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=44 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Judges 4:9 — *And she said, I will surely go with thee: notwithstanding the journey that thou takest shall not be for thine honour; for Yahuah (LORD) shall sell Sisera into the hand of a woman. And Deborah arose, and went with Barak to Kedesh.* The army that means to devour Israel will fall as Sisera did, by a woman''s hand — the pattern Judith fulfils.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt5_lookup sv, _session253_jdt5_lookup tv
 WHERE t.slug='judith-5-the-weak-confound-the-mighty'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=5 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=4 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The proud army''s boast meets the oldest promise: the serpent''s head is bruised by the seed of the woman, the weak confounding the mighty.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt5_lookup sv, _session253_jdt5_lookup tv
 WHERE t.slug='judith-5-the-weak-confound-the-mighty'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=5 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

