-- ----- fragment: minion_jasher_38.sql (session252 jasher 38) -----
-- Source anchor: jasher/jasher ch38. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja38 (view _session252_ja38_lookup). Sort band base 55925, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja38_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-38-jacobs-bow-amorite
  ('jasher', 'jasher', 38, 1, 'canon', 'genesis', 48, 22, 'free', E'Genesis 48:22 — *Moreover I have given to thee one portion above thy brethren, which I took out of the hand of the Amorite with my sword and with my bow.* The canon''s own word for Jacob''s sword-and-bow against the Amorite is exactly the bow that drops Ihuri and the kings in Jasher 38:1, 5.'),
  ('jasher', 'jasher', 38, 5, 'canon', 'joshua', 24, 12, 'free', E'Joshua 24:12 — *And I sent the hornet before you, which drave them out from before you, even the two kings of the Amorites; but not with thy sword, nor with thy bow.* Joshua frames the same Amorite-kings warfare of Jasher 38:5 as ultimately Yahuah''s deliverance of the elect seed, not the bow''s own strength.'),
  ('jasher', 'jasher', 38, 6, 'jubilees', 'jubilees', 34, 6, 'extras', E'Jubilees 34:6 — *And he arose from his housel he and his three sons and all the servants of his father, and his own servants, and he went against them with six thousand men, who carried swords. And he slew them in the pastures of Shechem, and pursued those who fled, and he slew them with the edge of the sword.* Jubilees tells the identical war of Jacob slaying the Amorite kings that Jasher 38:6 details king by king.'),
  -- thread: jasher-38-simeon-levi-zeal
  ('jasher', 'jasher', 38, 15, 'canon', 'genesis', 49, 5, 'free', E'Genesis 49:5 — *Simeon and Levi are brethren; instruments of cruelty are in their habitations.* Jacob''s deathbed word over the very pair who lead the slaughter at Chazar in Jasher 38:15.'),
  ('jasher', 'jasher', 38, 14, 'canon', 'genesis', 49, 6, 'free', E'Genesis 49:6 — *O my soul, come not thou into their secret; unto their assembly, mine honour, be not thou united: for in their anger they slew a man, and in their selfwill they digged down a wall.* The brothers spring and breach the wall of Chazar in Jasher 38:14, the very wall-digging Genesis names of Simeon and Levi.'),
  ('jasher', 'jasher', 38, 39, 'canon', 'genesis', 49, 7, 'free', E'Genesis 49:7 — *Cursed be their anger, for it was fierce; and their wrath, for it was cruel: I will divide them in Jacob, and scatter them in Yashar''el (Israel).* The fierce wrath that lets Levi sever his attacker''s head in Jasher 38:39 is the very anger Jacob both rebukes and divides among the tribes.'),
  -- thread: jasher-38-one-chase-a-thousand
  ('jasher', 'jasher', 38, 50, 'canon', 'leviticus', 26, 8, 'free', E'Leviticus 26:8 — *And five of you shall chase an hundred, and an hundred of you shall put ten thousand to flight: and your enemies shall fall before you by the sword.* The covenant proportion of Torah underlies the very ''one would pursue a thousand'' boast of the men of Sarton in Jasher 38:50.'),
  ('jasher', 'jasher', 38, 50, 'canon', 'deuteronomy', 32, 30, 'free', E'Deuteronomy 32:30 — *How should one chase a thousand, and two put ten thousand to flight, except their Rock had sold them, and Yahuah (LORD) had shut them up?* The Song of Moses names the same one-chasing-a-thousand measure of Jasher 38:50 and ties it to the Rock''s hand, not mere strength.'),
  ('jasher', 'jasher', 38, 52, 'canon', 'leviticus', 26, 7, 'free', E'Leviticus 26:7 — *And ye shall chase your enemies, and they shall fall before you by the sword.* The sword-falling of Jasher 38:52, where the sons of Jacob smite Sarton as they did Chazar, is the covenant chase Torah pledges.'),
  -- thread: jasher-38-amorite-kings-vs-seed
  ('jasher', 'jasher', 38, 2, 'jubilees', 'jubilees', 34, 2, 'extras', E'Jubilees 34:2 — *And the seven kings of the Amorites assembled themselves together against them, to slay them, hiding themselves under the trees, and to take their cattle as a prey.* Jubilees gives the gathering of the Amorite kings against the seed that Jasher 38:2 shows already breaking and fleeing.'),
  ('jasher', 'jasher', 38, 6, 'jubilees', 'jubilees', 34, 4, 'extras', E'Jubilees 34:4 — *And there came the kings of Tâphû, and the kings of ''Arêsa, and the kings of Sêragân, and the kings of Sêlô, and the kings of Gâ''as, and the king of Bêthôrôn, and the king of Ma''anîsâkîr, and all those who dwell in these mountains (and) who dwell in the woods in the land of Canaan.* The king-roster of Sêlô and Bêthôrôn matches Jasher 38:6''s Ihuri of Shiloh and Laban of Bethchorin slain by the bow.'),
  ('jasher', 'jasher', 38, 22, 'canon', 'genesis', 35, 5, 'free', E'Genesis 35:5 — *And they journeyed: and the terror of Elohim (God) was upon the cities that were round about them, and they did not pursue after the sons of Jacob.* The canon''s register that the surrounding cities cannot finally prevail against the seed stands behind the terrified, broken Amorites of Jasher 38:22.'),
  -- thread: jasher-38-jacob-prayed-prevailed
  ('jasher', 'jasher', 38, 45, 'canon', 'psalms', 44, 5, 'free', E'Psalm 44:5 — *Through thee will we push down our enemies: through thy name will we tread them under that rise up against us.* Jacob''s prayer to Yahuah before he goes against the mighty men in Jasher 38:45 is the very through-thy-name warfare of the covenant Psalm.'),
  ('jasher', 'jasher', 38, 46, 'canon', 'psalms', 44, 6, 'free', E'Psalm 44:6 — *For I will not trust in my bow, neither shall my sword save me.* Jacob draws his bow only after praying in Jasher 38:46, the Psalm''s refusal to trust the bow apart from Yahuah.'),
  ('jasher', 'jasher', 38, 47, 'canon', 'psalms', 44, 7, 'free', E'Psalm 44:7 — *But thou hast saved us from our enemies, and hast put them to shame that hated us.* The rout and slaughter of the remaining mighty men in Jasher 38:47 is the Psalm''s salvation from the enemies who hated the seed.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja38_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja38_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-38-jacobs-bow-amorite',
       E'Jacob''s bow against the Amorite kings',
       E'Jasher 38 opens mid-battle, the sons of Jacob warring the Amorite kings, and Jacob himself working his bow: *And Ihuri king of Shiloh came up to assist Elon, and he approached Jacob, when Jacob drew his bow that was in his hand and with an arrow struck Ihuri which caused his death* (Jasher 38:1), and again *whilst they were smiting the army of the kings, Jacob was occupied with his bow confining himself to smiting the kings, and he slew them all* (Jasher 38:5). The canon names this very weapon when the dying Jacob deeds Joseph the spoil he took from these same nations: *Moreover I have given to thee one portion above thy brethren, which I took out of the hand of the Amorite with my sword and with my bow* (Genesis 48:22). Joshua reminds Israel the land was finally won not by their own arm but by Yahuah''s hornet: *And I sent the hornet before you, which drave them out from before you, even the two kings of the Amorites; but not with thy sword, nor with thy bow* (Joshua 24:12) — the elect seed kept, the victory the Lord''s. Jubilees narrates the identical battle: *And he arose from his housel he and his three sons and all the servants of his father, and his own servants, and he went against them with six thousand men, who carried swords. And he slew them in the pastures of Shechem, and pursued those who fled, and he slew them with the edge of the sword* (Jubilees 34:6). It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55925
  FROM _session252_ja38_lookup sv, _session252_ja38_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=38 AND sv.verse_number=1
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=38 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-38-simeon-levi-zeal',
       E'Simeon and Levi, the two zealous brothers',
       E'Throughout Jasher 38 it is Simeon and Levi who breach the walls and bear the fiercest of the fighting: *And Simeon and Levi slew all the men who ran for safety into the city, and also the inhabitants of the city with their wives and little ones, they slew with the edge of the sword, and the cries of the city ascended up to heaven* (Jasher 38:15), and when the twelve mighty men press them hard, *one of them struck at Levi''s head with his sword, when Levi hastily placed his hand to his head, for he was afraid of the sword, and the sword struck Levi''s hand* (Jasher 38:38), yet Levi wrests the very blade away — *And Levi seized the sword of the valiant man in his hand, and took it forcibly from the man, and with it he struck at the head of the powerful man, and he severed his head* (Jasher 38:39). This is the same pair the dying Jacob marks in the canon: *Simeon and Levi are brethren; instruments of cruelty are in their habitations* (Genesis 49:5), *for in their anger they slew a man, and in their selfwill they digged down a wall* (Genesis 49:6) — and Jasher''s brothers do exactly that, springing the wall and digging the city down — *Cursed be their anger, for it was fierce; and their wrath, for it was cruel: I will divide them in Jacob, and scatter them in Yashar''el (Israel)* (Genesis 49:7). The zeal that defends the seed is the same zeal the canon both honors and disciplines. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55928
  FROM _session252_ja38_lookup sv, _session252_ja38_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=38 AND sv.verse_number=14
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=38 AND ev.verse_number=39
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-38-one-chase-a-thousand',
       E'One chasing a thousand — the covenant defense',
       E'Jasher 38 closes on the prowess of the men of Sarton, and the proportion of the fight rings straight out of the covenant promises: *And all the inhabitants of the city of Sarton were powerful men, one of them would pursue a thousand, and two of them would not flee from ten thousand of the rest of men* (Jasher 38:50). That is the very measure Torah sets for Yahuah''s people when they keep His way: *And five of you shall chase an hundred, and an hundred of you shall put ten thousand to flight: and your enemies shall fall before you by the sword* (Leviticus 26:8), the chasing pledged in *And ye shall chase your enemies, and they shall fall before you by the sword* (Leviticus 26:7). The Song of Moses makes plain the arithmetic is never mere muscle but the Rock''s hand: *How should one chase a thousand, and two put ten thousand to flight, except their Rock had sold them, and Yahuah (LORD) had shut them up?* (Deuteronomy 32:30). The seed kept and fought for — Torah-before-Sinai, it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55931
  FROM _session252_ja38_lookup sv, _session252_ja38_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=38 AND sv.verse_number=50
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=38 AND ev.verse_number=52
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-38-amorite-kings-vs-seed',
       E'The kings of the nations against the chosen seed',
       E'The whole of Jasher 38 is the assembled Amorite cities making war on Jacob''s house — *the four remaining kings fled from their station with the rest of the captains... saying, We have no more strength with the Hebrews after their having killed the three kings and their captains* (Jasher 38:2), and city by city the inhabitants of Chazar and Sarton rise against them and are broken. Jubilees tells the same gathering of the nations against the seed: *And the seven kings of the Amorites assembled themselves together against them, to slay them, hiding themselves under the trees, and to take their cattle as a prey* (Jubilees 34:2), naming the very kings — *the kings of Sêlô... and the king of Bêthôrôn* (Jubilees 34:4) — that Jasher carries as Ihuri king of Shiloh and Laban king of Bethchorin. The canon''s own register is that no nation finally prevails over the chosen line: *And they journeyed: and the terror of Elohim (God) was upon the cities that were round about them, and they did not pursue after the sons of Jacob* (Genesis 35:5). The seed-war runs through, the wheat kept against the tares — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55934
  FROM _session252_ja38_lookup sv, _session252_ja38_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=38 AND sv.verse_number=2
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=38 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-38-jacob-prayed-prevailed',
       E'Jacob prayed to Yahuah and prevailed',
       E'When the eleven mighty men of Sarton cannot be overcome and his sons fight from morning to sunset in vain, Jacob does not trust the bow alone — *And this was told to Jacob, and he was sorely grieved, and he prayed to Yahuah (the Lord), and he and Naphtali his son went against these mighty men* (Jasher 38:45), and only then *Jacob approached and drew his bow, and came nigh to the mighty men, and slew three of their men with the bow* (Jasher 38:46). This is the posture of the covenant Psalm of war: *Through thee will we push down our enemies: through thy name will we tread them under that rise up against us* (Psalm 44:5), *For I will not trust in my bow, neither shall my sword save me* (Psalm 44:6), *But thou hast saved us from our enemies, and hast put them to shame that hated us* (Psalm 44:7). The father calls on the Name before he draws the bow — calling on Yahuah before the sword, Torah-before-Sinai. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55937
  FROM _session252_ja38_lookup sv, _session252_ja38_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=38 AND sv.verse_number=44
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=38 AND ev.verse_number=47
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-38-jacobs-bow-amorite
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 48:22 — *Moreover I have given to thee one portion above thy brethren, which I took out of the hand of the Amorite with my sword and with my bow.* The canon''s own word for Jacob''s sword-and-bow against the Amorite is exactly the bow that drops Ihuri and the kings in Jasher 38:1, 5.'
  FROM cross_reference_threads t, cross_references x, _session252_ja38_lookup sv, _session252_ja38_lookup tv
 WHERE t.slug='jasher-38-jacobs-bow-amorite'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=38 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=48 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Joshua 24:12 — *And I sent the hornet before you, which drave them out from before you, even the two kings of the Amorites; but not with thy sword, nor with thy bow.* Joshua frames the same Amorite-kings warfare of Jasher 38:5 as ultimately Yahuah''s deliverance of the elect seed, not the bow''s own strength.'
  FROM cross_reference_threads t, cross_references x, _session252_ja38_lookup sv, _session252_ja38_lookup tv
 WHERE t.slug='jasher-38-jacobs-bow-amorite'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=38 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=24 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 34:6 — *And he arose from his housel he and his three sons and all the servants of his father, and his own servants, and he went against them with six thousand men, who carried swords. And he slew them in the pastures of Shechem, and pursued those who fled, and he slew them with the edge of the sword.* Jubilees tells the identical war of Jacob slaying the Amorite kings that Jasher 38:6 details king by king.'
  FROM cross_reference_threads t, cross_references x, _session252_ja38_lookup sv, _session252_ja38_lookup tv
 WHERE t.slug='jasher-38-jacobs-bow-amorite'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=38 AND sv.verse_number=6
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=34 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-38-simeon-levi-zeal
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 49:5 — *Simeon and Levi are brethren; instruments of cruelty are in their habitations.* Jacob''s deathbed word over the very pair who lead the slaughter at Chazar in Jasher 38:15.'
  FROM cross_reference_threads t, cross_references x, _session252_ja38_lookup sv, _session252_ja38_lookup tv
 WHERE t.slug='jasher-38-simeon-levi-zeal'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=38 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 49:6 — *O my soul, come not thou into their secret; unto their assembly, mine honour, be not thou united: for in their anger they slew a man, and in their selfwill they digged down a wall.* The brothers spring and breach the wall of Chazar in Jasher 38:14, the very wall-digging Genesis names of Simeon and Levi.'
  FROM cross_reference_threads t, cross_references x, _session252_ja38_lookup sv, _session252_ja38_lookup tv
 WHERE t.slug='jasher-38-simeon-levi-zeal'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=38 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 49:7 — *Cursed be their anger, for it was fierce; and their wrath, for it was cruel: I will divide them in Jacob, and scatter them in Yashar''el (Israel).* The fierce wrath that lets Levi sever his attacker''s head in Jasher 38:39 is the very anger Jacob both rebukes and divides among the tribes.'
  FROM cross_reference_threads t, cross_references x, _session252_ja38_lookup sv, _session252_ja38_lookup tv
 WHERE t.slug='jasher-38-simeon-levi-zeal'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=38 AND sv.verse_number=39
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-38-one-chase-a-thousand
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 26:8 — *And five of you shall chase an hundred, and an hundred of you shall put ten thousand to flight: and your enemies shall fall before you by the sword.* The covenant proportion of Torah underlies the very ''one would pursue a thousand'' boast of the men of Sarton in Jasher 38:50.'
  FROM cross_reference_threads t, cross_references x, _session252_ja38_lookup sv, _session252_ja38_lookup tv
 WHERE t.slug='jasher-38-one-chase-a-thousand'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=38 AND sv.verse_number=50
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 32:30 — *How should one chase a thousand, and two put ten thousand to flight, except their Rock had sold them, and Yahuah (LORD) had shut them up?* The Song of Moses names the same one-chasing-a-thousand measure of Jasher 38:50 and ties it to the Rock''s hand, not mere strength.'
  FROM cross_reference_threads t, cross_references x, _session252_ja38_lookup sv, _session252_ja38_lookup tv
 WHERE t.slug='jasher-38-one-chase-a-thousand'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=38 AND sv.verse_number=50
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 26:7 — *And ye shall chase your enemies, and they shall fall before you by the sword.* The sword-falling of Jasher 38:52, where the sons of Jacob smite Sarton as they did Chazar, is the covenant chase Torah pledges.'
  FROM cross_reference_threads t, cross_references x, _session252_ja38_lookup sv, _session252_ja38_lookup tv
 WHERE t.slug='jasher-38-one-chase-a-thousand'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=38 AND sv.verse_number=52
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-38-amorite-kings-vs-seed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jubilees 34:2 — *And the seven kings of the Amorites assembled themselves together against them, to slay them, hiding themselves under the trees, and to take their cattle as a prey.* Jubilees gives the gathering of the Amorite kings against the seed that Jasher 38:2 shows already breaking and fleeing.'
  FROM cross_reference_threads t, cross_references x, _session252_ja38_lookup sv, _session252_ja38_lookup tv
 WHERE t.slug='jasher-38-amorite-kings-vs-seed'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=38 AND sv.verse_number=2
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=34 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jubilees 34:4 — *And there came the kings of Tâphû, and the kings of ''Arêsa, and the kings of Sêragân, and the kings of Sêlô, and the kings of Gâ''as, and the king of Bêthôrôn, and the king of Ma''anîsâkîr, and all those who dwell in these mountains (and) who dwell in the woods in the land of Canaan.* The king-roster of Sêlô and Bêthôrôn matches Jasher 38:6''s Ihuri of Shiloh and Laban of Bethchorin slain by the bow.'
  FROM cross_reference_threads t, cross_references x, _session252_ja38_lookup sv, _session252_ja38_lookup tv
 WHERE t.slug='jasher-38-amorite-kings-vs-seed'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=38 AND sv.verse_number=6
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=34 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 35:5 — *And they journeyed: and the terror of Elohim (God) was upon the cities that were round about them, and they did not pursue after the sons of Jacob.* The canon''s register that the surrounding cities cannot finally prevail against the seed stands behind the terrified, broken Amorites of Jasher 38:22.'
  FROM cross_reference_threads t, cross_references x, _session252_ja38_lookup sv, _session252_ja38_lookup tv
 WHERE t.slug='jasher-38-amorite-kings-vs-seed'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=38 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=35 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-38-jacob-prayed-prevailed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 44:5 — *Through thee will we push down our enemies: through thy name will we tread them under that rise up against us.* Jacob''s prayer to Yahuah before he goes against the mighty men in Jasher 38:45 is the very through-thy-name warfare of the covenant Psalm.'
  FROM cross_reference_threads t, cross_references x, _session252_ja38_lookup sv, _session252_ja38_lookup tv
 WHERE t.slug='jasher-38-jacob-prayed-prevailed'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=38 AND sv.verse_number=45
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=44 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 44:6 — *For I will not trust in my bow, neither shall my sword save me.* Jacob draws his bow only after praying in Jasher 38:46, the Psalm''s refusal to trust the bow apart from Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session252_ja38_lookup sv, _session252_ja38_lookup tv
 WHERE t.slug='jasher-38-jacob-prayed-prevailed'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=38 AND sv.verse_number=46
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=44 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 44:7 — *But thou hast saved us from our enemies, and hast put them to shame that hated us.* The rout and slaughter of the remaining mighty men in Jasher 38:47 is the Psalm''s salvation from the enemies who hated the seed.'
  FROM cross_reference_threads t, cross_references x, _session252_ja38_lookup sv, _session252_ja38_lookup tv
 WHERE t.slug='jasher-38-jacob-prayed-prevailed'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=38 AND sv.verse_number=47
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=44 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

