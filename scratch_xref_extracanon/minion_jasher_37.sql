-- ----- fragment: minion_jasher_37.sql (session252 jasher 37) -----
-- Source anchor: jasher/jasher ch37. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja37 (view _session252_ja37_lookup). Sort band base 55900, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja37_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-37-kings-of-canaan-gather-against-the-seed
  ('jasher', 'jasher', 37, 6, 'canon', 'genesis', 34, 25, 'free', E'Genesis 34:25 — *And it came to pass on the third day, when they were sore, that two of the sons of Jacob, Simeon and Levi, Dinah’s brethren, took each man his sword, and came upon the city boldly, and slew all the males.* The smiting of Shechem in Genesis is the wound the kings of Canaan now rise to avenge in Jasher 37:6.'),
  ('jasher', 'jasher', 37, 11, 'canon', 'genesis', 34, 30, 'free', E'Genesis 34:30 — *And Jacob said to Simeon and Levi, Ye have troubled me to make me to stink among the inhabitants of the land, among the Canaanites and the Perizzites: and I being few in number, they shall gather themselves together against me, and slay me; and I shall be destroyed, I and my house.* Jacob''s very fear in Genesis — the land gathering against his few — is the war the kings declare in Jasher 37:11.'),
  ('jasher', 'jasher', 37, 8, 'canon', 'genesis', 48, 22, 'free', E'Genesis 48:22 — *Moreover I have given to thee one portion above thy brethren, which I took out of the hand of the Amorite with my sword and with my bow.* The canon keeps the memory of these very Amorite wars Jasher 37:8 expands, in Jacob''s dying word to Joseph.'),
  ('jasher', 'jasher', 37, 6, 'jubilees', 'jubilees', 34, 2, 'extras', E'Jubilees 34:2 — *And the seven kings of the Amorites assembled themselves together against them, to slay them, hiding themselves under the trees, and to take their cattle as a prey.* Jubilees narrates the identical gathering of the Amorite kings against the sons of Jacob that Jasher 37:6 sets at Shechem.'),
  -- thread: jasher-37-jacob-prays-the-few-from-the-many
  ('jasher', 'jasher', 37, 14, 'canon', 'genesis', 32, 11, 'free', E'Genesis 32:11 — *Deliver me, I pray thee, from the hand of my brother, from the hand of Esau: for I fear him, lest he will come and smite me, and the mother with the children.* The same Jacob who prayed for deliverance at the Jabbok spreads his hands again in Jasher 37:14 to save his sons from the hand of the kings.'),
  ('jasher', 'jasher', 37, 14, 'canon', 'deuteronomy', 20, 4, 'free', E'Deuteronomy 20:4 — *For Yahuah Elohaychem (the LORD your God) is he that goeth with you, to fight for you against your enemies, to save you.* Jacob''s confession that power to save the few from the many is in Yahuah''s hand (Jasher 37:14) is the Torah law of battle.'),
  ('jasher', 'jasher', 37, 16, 'canon', '2-chronicles', 14, 11, 'free', E'2 Chronicles 14:11 — *And Asa cried unto Yahuah Elohav (the LORD his God), and said, Yahuah (LORD), it is nothing with thee to help, whether with many, or with them that have no power: help us, O Yahuah (LORD) our Elohim (God); for we rest on thee, and in thy name we go against this multitude. O Yahuah (LORD), thou art our Elohim (God); let not man prevail against thee.* Asa''s cry repeats Jacob''s surrender in Jasher 37:16 — the outnumbered seed resting wholly on Yahuah.'),
  ('jasher', 'jasher', 37, 14, 'canon', 'psalms', 33, 16, 'free', E'Psalms 33:16 — *There is no king saved by the multitude of an host: a mighty man is not delivered by much strength.* The Psalm states plainly the truth Jacob prays in Jasher 37:14 — Yahuah, not the size of the army, saves.'),
  -- thread: jasher-37-terror-of-elohim-on-the-nations
  ('jasher', 'jasher', 37, 17, 'canon', 'genesis', 35, 5, 'free', E'Genesis 35:5 — *And they journeyed: and the terror of Elohim (God) was upon the cities that were round about them, and they did not pursue after the sons of Jacob.* The canon''s terror of Elohim on the cities around Shechem is the very consternation that seizes the kings when Jacob ceases praying in Jasher 37:17.'),
  ('jasher', 'jasher', 37, 19, 'canon', 'exodus', 15, 16, 'free', E'Exodus 15:16 — *Fear and dread shall fall upon them; by the greatness of thine arm they shall be as still as a stone; till thy people pass over, O Yahuah (LORD), till the people pass over, which thou hast purchased.* The dread Yahuah pours on the kings by the phantom voice of chariots in Jasher 37:19 is the same fear the Song of the Sea sings over Canaan.'),
  ('jasher', 'jasher', 37, 19, 'canon', 'joshua', 24, 12, 'free', E'Joshua 24:12 — *And I sent the hornet before you, which drave them out from before you, even the two kings of the Amorites; but not with thy sword, nor with thy bow.* Joshua''s witness that the Amorite kings fell by Yahuah''s terror, not the seed''s blade, matches the unearthly army-voice of Jasher 37:19.'),
  -- thread: jasher-37-judah-runs-first-the-lion
  ('jasher', 'jasher', 37, 26, 'canon', 'genesis', 49, 8, 'free', E'Genesis 49:8 — *Yahudah (Judah), thou art he whom thy brethren shall praise: thy hand shall be in the neck of thine enemies; thy father’s children shall bow down before thee.* Jacob''s blessing that Judah''s hand would be on the neck of his enemies is enacted as Judah runs first before his brethren against the kings in Jasher 37:26.'),
  ('jasher', 'jasher', 37, 39, 'canon', 'genesis', 49, 9, 'free', E'Genesis 49:9 — *Yahudah (Judah) is a lion’s whelp: from the prey, my son, thou art gone up: he stooped down, he couched as a lion, and as an old lion; who shall rouse him up?* The lion''s whelp risen from the prey is Judah felling and beheading Jashub king of Tapnach in Jasher 37:39-40.'),
  ('jasher', 'jasher', 37, 40, 'canon', 'revelation', 5, 5, 'free', E'Revelation 5:5 — *And one of the elders saith unto me, Weep not: behold, the Lion of the tribe of Juda, the Root of David, hath prevailed to open the book, and to loose the seven seals thereof.* The same tribe of the lion that triumphs through Judah in Jasher 37:40 prevails at the last as the Lion of the tribe of Judah.'),
  ('jasher', 'jasher', 37, 26, 'canon', 'psalms', 60, 12, 'free', E'Psalms 60:12 — *Through Elohim (God) we shall do valiantly: for he it is that shall tread down our enemies.* Judah''s valor before the kings in Jasher 37:26 is the doing-valiantly the Psalm credits to Elohim treading down the enemy.'),
  -- thread: jasher-37-levi-guards-the-rear-the-zeal
  ('jasher', 'jasher', 37, 49, 'canon', 'genesis', 49, 5, 'free', E'Genesis 49:5 — *Simeon and Levi are brethren; instruments of cruelty are in their habitations.* The Levi who again takes up the sword against Elon in Jasher 37:49 is the same brother whose fierceness Jacob marks in the blessing.'),
  ('jasher', 'jasher', 37, 50, 'canon', 'genesis', 49, 7, 'free', E'Genesis 49:7 — *Cursed be their anger, for it was fierce; and their wrath, for it was cruel: I will divide them in Jacob, and scatter them in Yashar''el (Israel).* Levi''s fierce slaughter of Elon and his captains in Jasher 37:50 is the wrath Jacob prophesied would be divided and scattered, yet kept within the covenant nation.'),
  ('jasher', 'jasher', 37, 50, 'jubilees', 'jubilees', 34, 6, 'extras', E'Jubilees 34:6 — *And he arose from his housel he and his three sons and all the servants of his father, and his own servants, and he went against them with six thousand men, who carried swords. And he slew them in the pastures of Shechem, and pursued those who fled, and he slew them with the edge of the sword, and he slew ’Arêsa and Tâphû and Sarêgân and Sêlô and ’Amânîsakîr and Gâgâ’as, and he recovered his herds.* Jubilees compresses the whole battle Jasher 37:50 narrates king by king into one rout of the Amorite kings in the pastures of Shechem.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja37_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja37_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-37-kings-of-canaan-gather-against-the-seed',
       E'The kings of Canaan gather against the sons of Jacob at Shechem',
       E'Jasher returns to Shechem after Dinah and the sword of Simeon and Levi, and the nations gather to avenge that city: *And all the kings of Canaan again assembled, and they came together to make war with Jacob and his sons* (Jasher 37:6) — *And they sent a declaration to Jacob and his son, saying, Come you all forth to us that we may have an interview together in the plain, and revenge the cause of the men of Shechem whom you slew in their city* (Jasher 37:11). This is the canon''s own Shechem set on the page beside its expansion: *And it came to pass on the third day, when they were sore, that two of the sons of Jacob, Simeon and Levi, Dinah’s brethren, took each man his sword, and came upon the city boldly, and slew all the males* (Genesis 34:25). Jacob had feared this very gathering: *And Jacob said to Simeon and Levi, Ye have troubled me to make me to stink among the inhabitants of the land, among the Canaanites and the Perizzites: and I being few in number, they shall gather themselves together against me, and slay me; and I shall be destroyed, I and my house* (Genesis 34:30). The canon even keeps the memory of these wars in Jacob''s own dying word: *Moreover I have given to thee one portion above thy brethren, which I took out of the hand of the Amorite with my sword and with my bow* (Genesis 48:22). And Jubilees tells the very same scene — *And the seven kings of the Amorites assembled themselves together against them, to slay them, hiding themselves under the trees, and to take their cattle as a prey* (Jubilees 34:2). It ain''t new: the seed is hated and surrounded by the nations, and yet kept.',
       sv.verse_id, ev.verse_id, 'extras', 55900
  FROM _session252_ja37_lookup sv, _session252_ja37_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=37 AND sv.verse_number=6
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=37 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-37-jacob-prays-the-few-from-the-many',
       E'Jacob spreads his hands — the few delivered from the many',
       E'Before the battle Jacob lifts his hands as his fathers did: *And Jacob prayed to Yahuah (the Lord) for his sons, and he spread forth his hands to Yahuah (the Lord), and he said, O Elohim (God), you are an El Shaddai (Almighty God), you are our father, you did form us and we are the works of your hands... for in your hand is power and might, to save the few from the many* (Jasher 37:14). This is the same Jacob who prayed at the Jabbok crossing: *And Jacob said, O Elohim (God) of my father Abraham, and Elohim (God) of my father Isaac, Yahuah (LORD) which saidst unto me, Return unto thy country, and to thy kindred, and I will deal well with thee* (Genesis 32:9), pleading *Deliver me, I pray thee, from the hand of my brother* (Genesis 32:11). The confession that the few are saved not by their own arm is Torah''s own: *For Yahuah Elohaychem (the LORD your God) is he that goeth with you, to fight for you against your enemies, to save you* (Deuteronomy 20:4); and the song of Asa is the same cry — *Yahuah (LORD), it is nothing with thee to help, whether with many, or with them that have no power: help us, O Yahuah (LORD) our Elohim (God); for we rest on thee... let not man prevail against thee* (2 Chronicles 14:11). The Psalmist seals it: *There is no king saved by the multitude of an host: a mighty man is not delivered by much strength* (Psalms 33:16). It ain''t new — election and deliverance are by Yahuah''s hand, not the number of the host.',
       sv.verse_id, ev.verse_id, 'extras', 55903
  FROM _session252_ja37_lookup sv, _session252_ja37_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=37 AND sv.verse_number=14
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=37 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-37-terror-of-elohim-on-the-nations',
       E'The terror of Elohim falls on the kings — chariots heard',
       E'When Jacob ceased praying the dread of Yahuah fell on the host: *And when Jacob ceased praying to Yahuah (the Lord) the earth shook from its place, and the sun darkened, and all these kings were terrified and a great consternation seized them* (Jasher 37:17) — *For Yahuah (the Lord) caused them to hear the voice of chariots, and the voice of mighty horses from the sons of Jacob, and the voice of a great army accompanying them* (Jasher 37:19). The canon names this same terror at the very journey out of Shechem: *And they journeyed: and the terror of Elohim (God) was upon the cities that were round about them, and they did not pursue after the sons of Jacob* (Genesis 35:5). The Song of the Sea sings it over the nations of Canaan: *Fear and dread shall fall upon them; by the greatness of thine arm they shall be as still as a stone; till thy people pass over, O Yahuah (LORD)* (Exodus 15:16). And Joshua confesses the conquest was never won by the seed''s own blade: *And I sent the hornet before you, which drave them out from before you, even the two kings of the Amorites; but not with thy sword, nor with thy bow* (Joshua 24:12). It ain''t new — the LORD himself goes before the seed and melts the nations.',
       sv.verse_id, ev.verse_id, 'extras', 55906
  FROM _session252_ja37_lookup sv, _session252_ja37_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=37 AND sv.verse_number=17
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=37 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-37-judah-runs-first-the-lion',
       E'Judah runs first — the lion''s whelp from the prey',
       E'Out before all his brethren goes Judah, and the king of Tapnach falls under his hand: *And Judah, the son of Jacob, ran first before his brethren, and ten of his servants with him, and he went toward these kings* (Jasher 37:26); *And when Judah saw that his shield was split, he hastily drew his sword and smote Jashub at his ankles, and cut off his feet that Jashub fell upon the ground... And Judah hastily picked up Jashub’s spear, with which he severed his head and cast it next to his feet* (Jasher 37:39-40). Jacob''s blessing already crowned Judah for exactly this: *Yahudah (Judah), thou art he whom thy brethren shall praise: thy hand shall be in the neck of thine enemies; thy father’s children shall bow down before thee* (Genesis 49:8) — *Yahudah (Judah) is a lion’s whelp: from the prey, my son, thou art gone up: he stooped down, he couched as a lion* (Genesis 49:9). The whelp rising from the prey is the same tribe whose Root prevails at the end: *behold, the Lion of the tribe of Juda, the Root of David, hath prevailed to open the book* (Revelation 5:5). And the victory is Yahuah''s giving: *Through Elohim (God) we shall do valiantly: for he it is that shall tread down our enemies* (Psalms 60:12). It ain''t new — Judah the foremost, the favored war-seed, carries the Messianic line.',
       sv.verse_id, ev.verse_id, 'extras', 55909
  FROM _session252_ja37_lookup sv, _session252_ja37_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=37 AND sv.verse_number=26
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=37 AND ev.verse_number=40
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-37-levi-guards-the-rear-the-zeal',
       E'Levi turns and smites in the rear — the brothers divided in Jacob',
       E'As Judah leads, Levi is set upon from behind and turns to cut down Elon king of Gaash: *And Levi saw Elon, king of Gaash, advancing toward him, with his fourteen captains to smite him, but Levi did not know it for certain* (Jasher 37:49); *And Elon with his captains approached nearer, and Levi looked back and saw that battle was given him in the rear, and Levi ran with twelve of his servants, and they went and slew Elon and his captains with the edge of the sword* (Jasher 37:50). This is the same Levi whose sword at Shechem drew Jacob''s prophecy: *Simeon and Levi are brethren; instruments of cruelty are in their habitations* (Genesis 49:5) — *Cursed be their anger, for it was fierce; and their wrath, for it was cruel: I will divide them in Jacob, and scatter them in Yashar''el (Israel)* (Genesis 49:7). Jubilees gathers the whole war into one line of deliverance: *And he arose... and he went against them with six thousand men, who carried swords. And he slew them in the pastures of Shechem, and pursued those who fled, and he slew them with the edge of the sword* (Jubilees 34:6). It ain''t new — the zeal of Levi, even when scattered as a tribe, defends the kept seed.',
       sv.verse_id, ev.verse_id, 'extras', 55912
  FROM _session252_ja37_lookup sv, _session252_ja37_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=37 AND sv.verse_number=49
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=37 AND ev.verse_number=50
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-37-kings-of-canaan-gather-against-the-seed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 34:25 — *And it came to pass on the third day, when they were sore, that two of the sons of Jacob, Simeon and Levi, Dinah’s brethren, took each man his sword, and came upon the city boldly, and slew all the males.* The smiting of Shechem in Genesis is the wound the kings of Canaan now rise to avenge in Jasher 37:6.'
  FROM cross_reference_threads t, cross_references x, _session252_ja37_lookup sv, _session252_ja37_lookup tv
 WHERE t.slug='jasher-37-kings-of-canaan-gather-against-the-seed'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=37 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=34 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 34:30 — *And Jacob said to Simeon and Levi, Ye have troubled me to make me to stink among the inhabitants of the land, among the Canaanites and the Perizzites: and I being few in number, they shall gather themselves together against me, and slay me; and I shall be destroyed, I and my house.* Jacob''s very fear in Genesis — the land gathering against his few — is the war the kings declare in Jasher 37:11.'
  FROM cross_reference_threads t, cross_references x, _session252_ja37_lookup sv, _session252_ja37_lookup tv
 WHERE t.slug='jasher-37-kings-of-canaan-gather-against-the-seed'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=37 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=34 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 48:22 — *Moreover I have given to thee one portion above thy brethren, which I took out of the hand of the Amorite with my sword and with my bow.* The canon keeps the memory of these very Amorite wars Jasher 37:8 expands, in Jacob''s dying word to Joseph.'
  FROM cross_reference_threads t, cross_references x, _session252_ja37_lookup sv, _session252_ja37_lookup tv
 WHERE t.slug='jasher-37-kings-of-canaan-gather-against-the-seed'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=37 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=48 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 34:2 — *And the seven kings of the Amorites assembled themselves together against them, to slay them, hiding themselves under the trees, and to take their cattle as a prey.* Jubilees narrates the identical gathering of the Amorite kings against the sons of Jacob that Jasher 37:6 sets at Shechem.'
  FROM cross_reference_threads t, cross_references x, _session252_ja37_lookup sv, _session252_ja37_lookup tv
 WHERE t.slug='jasher-37-kings-of-canaan-gather-against-the-seed'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=37 AND sv.verse_number=6
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=34 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-37-jacob-prays-the-few-from-the-many
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 32:11 — *Deliver me, I pray thee, from the hand of my brother, from the hand of Esau: for I fear him, lest he will come and smite me, and the mother with the children.* The same Jacob who prayed for deliverance at the Jabbok spreads his hands again in Jasher 37:14 to save his sons from the hand of the kings.'
  FROM cross_reference_threads t, cross_references x, _session252_ja37_lookup sv, _session252_ja37_lookup tv
 WHERE t.slug='jasher-37-jacob-prays-the-few-from-the-many'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=37 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=32 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 20:4 — *For Yahuah Elohaychem (the LORD your God) is he that goeth with you, to fight for you against your enemies, to save you.* Jacob''s confession that power to save the few from the many is in Yahuah''s hand (Jasher 37:14) is the Torah law of battle.'
  FROM cross_reference_threads t, cross_references x, _session252_ja37_lookup sv, _session252_ja37_lookup tv
 WHERE t.slug='jasher-37-jacob-prays-the-few-from-the-many'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=37 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=20 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Chronicles 14:11 — *And Asa cried unto Yahuah Elohav (the LORD his God), and said, Yahuah (LORD), it is nothing with thee to help, whether with many, or with them that have no power: help us, O Yahuah (LORD) our Elohim (God); for we rest on thee, and in thy name we go against this multitude. O Yahuah (LORD), thou art our Elohim (God); let not man prevail against thee.* Asa''s cry repeats Jacob''s surrender in Jasher 37:16 — the outnumbered seed resting wholly on Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session252_ja37_lookup sv, _session252_ja37_lookup tv
 WHERE t.slug='jasher-37-jacob-prays-the-few-from-the-many'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=37 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=14 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalms 33:16 — *There is no king saved by the multitude of an host: a mighty man is not delivered by much strength.* The Psalm states plainly the truth Jacob prays in Jasher 37:14 — Yahuah, not the size of the army, saves.'
  FROM cross_reference_threads t, cross_references x, _session252_ja37_lookup sv, _session252_ja37_lookup tv
 WHERE t.slug='jasher-37-jacob-prays-the-few-from-the-many'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=37 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=33 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-37-terror-of-elohim-on-the-nations
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 35:5 — *And they journeyed: and the terror of Elohim (God) was upon the cities that were round about them, and they did not pursue after the sons of Jacob.* The canon''s terror of Elohim on the cities around Shechem is the very consternation that seizes the kings when Jacob ceases praying in Jasher 37:17.'
  FROM cross_reference_threads t, cross_references x, _session252_ja37_lookup sv, _session252_ja37_lookup tv
 WHERE t.slug='jasher-37-terror-of-elohim-on-the-nations'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=37 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=35 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 15:16 — *Fear and dread shall fall upon them; by the greatness of thine arm they shall be as still as a stone; till thy people pass over, O Yahuah (LORD), till the people pass over, which thou hast purchased.* The dread Yahuah pours on the kings by the phantom voice of chariots in Jasher 37:19 is the same fear the Song of the Sea sings over Canaan.'
  FROM cross_reference_threads t, cross_references x, _session252_ja37_lookup sv, _session252_ja37_lookup tv
 WHERE t.slug='jasher-37-terror-of-elohim-on-the-nations'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=37 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=15 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Joshua 24:12 — *And I sent the hornet before you, which drave them out from before you, even the two kings of the Amorites; but not with thy sword, nor with thy bow.* Joshua''s witness that the Amorite kings fell by Yahuah''s terror, not the seed''s blade, matches the unearthly army-voice of Jasher 37:19.'
  FROM cross_reference_threads t, cross_references x, _session252_ja37_lookup sv, _session252_ja37_lookup tv
 WHERE t.slug='jasher-37-terror-of-elohim-on-the-nations'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=37 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=24 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-37-judah-runs-first-the-lion
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 49:8 — *Yahudah (Judah), thou art he whom thy brethren shall praise: thy hand shall be in the neck of thine enemies; thy father’s children shall bow down before thee.* Jacob''s blessing that Judah''s hand would be on the neck of his enemies is enacted as Judah runs first before his brethren against the kings in Jasher 37:26.'
  FROM cross_reference_threads t, cross_references x, _session252_ja37_lookup sv, _session252_ja37_lookup tv
 WHERE t.slug='jasher-37-judah-runs-first-the-lion'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=37 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 49:9 — *Yahudah (Judah) is a lion’s whelp: from the prey, my son, thou art gone up: he stooped down, he couched as a lion, and as an old lion; who shall rouse him up?* The lion''s whelp risen from the prey is Judah felling and beheading Jashub king of Tapnach in Jasher 37:39-40.'
  FROM cross_reference_threads t, cross_references x, _session252_ja37_lookup sv, _session252_ja37_lookup tv
 WHERE t.slug='jasher-37-judah-runs-first-the-lion'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=37 AND sv.verse_number=39
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 5:5 — *And one of the elders saith unto me, Weep not: behold, the Lion of the tribe of Juda, the Root of David, hath prevailed to open the book, and to loose the seven seals thereof.* The same tribe of the lion that triumphs through Judah in Jasher 37:40 prevails at the last as the Lion of the tribe of Judah.'
  FROM cross_reference_threads t, cross_references x, _session252_ja37_lookup sv, _session252_ja37_lookup tv
 WHERE t.slug='jasher-37-judah-runs-first-the-lion'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=37 AND sv.verse_number=40
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=5 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalms 60:12 — *Through Elohim (God) we shall do valiantly: for he it is that shall tread down our enemies.* Judah''s valor before the kings in Jasher 37:26 is the doing-valiantly the Psalm credits to Elohim treading down the enemy.'
  FROM cross_reference_threads t, cross_references x, _session252_ja37_lookup sv, _session252_ja37_lookup tv
 WHERE t.slug='jasher-37-judah-runs-first-the-lion'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=37 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=60 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-37-levi-guards-the-rear-the-zeal
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 49:5 — *Simeon and Levi are brethren; instruments of cruelty are in their habitations.* The Levi who again takes up the sword against Elon in Jasher 37:49 is the same brother whose fierceness Jacob marks in the blessing.'
  FROM cross_reference_threads t, cross_references x, _session252_ja37_lookup sv, _session252_ja37_lookup tv
 WHERE t.slug='jasher-37-levi-guards-the-rear-the-zeal'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=37 AND sv.verse_number=49
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 49:7 — *Cursed be their anger, for it was fierce; and their wrath, for it was cruel: I will divide them in Jacob, and scatter them in Yashar''el (Israel).* Levi''s fierce slaughter of Elon and his captains in Jasher 37:50 is the wrath Jacob prophesied would be divided and scattered, yet kept within the covenant nation.'
  FROM cross_reference_threads t, cross_references x, _session252_ja37_lookup sv, _session252_ja37_lookup tv
 WHERE t.slug='jasher-37-levi-guards-the-rear-the-zeal'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=37 AND sv.verse_number=50
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 34:6 — *And he arose from his housel he and his three sons and all the servants of his father, and his own servants, and he went against them with six thousand men, who carried swords. And he slew them in the pastures of Shechem, and pursued those who fled, and he slew them with the edge of the sword, and he slew ’Arêsa and Tâphû and Sarêgân and Sêlô and ’Amânîsakîr and Gâgâ’as, and he recovered his herds.* Jubilees compresses the whole battle Jasher 37:50 narrates king by king into one rout of the Amorite kings in the pastures of Shechem.'
  FROM cross_reference_threads t, cross_references x, _session252_ja37_lookup sv, _session252_ja37_lookup tv
 WHERE t.slug='jasher-37-levi-guards-the-rear-the-zeal'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=37 AND sv.verse_number=50
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=34 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

