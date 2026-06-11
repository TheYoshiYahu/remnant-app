-- ----- fragment: minion_jubilees_11.sql (session251 jubilees 11) -----
-- Source anchor: jubilees/jubilees ch11. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ju11 (view _session251_ju11_lookup). Sort band base 53250, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session251_ju11_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jubilees-11-shem-to-terah-line
  ('jubilees', 'jubilees', 11, 1, 'canon', 'genesis', 11, 20, 'free', E'Genesis 11:20 — *And Reu lived two and thirty years, and begat Serug:* the same father-son link Jubilees 11:1 records when Reu begets the one he names Sêrôḫ.'),
  ('jubilees', 'jubilees', 11, 6, 'canon', 'genesis', 11, 22, 'free', E'Genesis 11:22 — *And Serug lived thirty years, and begat Nahor:* matching Jubilees 11:6-8 where Serug dwells in Ur and his wife bears him Nahor.'),
  ('jubilees', 'jubilees', 11, 10, 'canon', 'genesis', 11, 24, 'free', E'Genesis 11:24 — *And Nahor lived nine and twenty years, and begat Terah:* the very birth Jubilees 11:10 dates when ''Îjâskâ bears Nahor a son named Terah.'),
  ('jubilees', 'jubilees', 11, 14, 'canon', 'genesis', 11, 26, 'free', E'Genesis 11:26 — *And Terah lived seventy years, and begat Abram, Nahor, and Haran:* the climax of the line, Abram born to Terah exactly as Jubilees 11:14 narrates.'),
  -- thread: jubilees-11-idolatry-bloodshed-babel
  ('jubilees', 'jubilees', 11, 4, 'canon', 'joshua', 24, 2, 'free', E'Joshua 24:2 — *Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods.* Joshua names the very idolatry Jubilees 11:4 says Terah''s generation fell into.'),
  ('jubilees', 'jubilees', 11, 2, 'canon', 'acts', 7, 2, 'free', E'Acts 7:2 — *The Elohim (God) of glory appeared unto our father Abraham, when he was in Mesopotamia, before he dwelt in Charran,* Stephen placing the call in the blood-and-idol world Jubilees 11:2-4 describes.'),
  ('jubilees', 'jubilees', 11, 4, 'canon', 'isaiah', 44, 9, 'free', E'Isaiah 44:9 — *They that make a graven image are all of them vanity; and their delectable things shall not profit; and they are their own witnesses; they see not, nor know; that they may be ashamed.* The prophetic verdict on the molten images Jubilees 11:4 says they worshipped.'),
  -- thread: jubilees-11-mastema-seed-war
  ('jubilees', 'jubilees', 11, 5, 'jubilees', 'jubilees', 10, 8, 'extras', E'Jubilees 10:8 — *And the chief of the spirits, Mastêmâ, came and said: “Yahuah (God), Creator, let some of them remain before me, and let them hearken to my voice, and do all that I shall say to them; for if some of them are not left to me, I shall not be able to execute the power of my will on the sons of men...”* the tenth-part of spirits whom Jubilees 11:5 now shows Mastêmâ sending out to corrupt and shed blood.'),
  ('jubilees', 'jubilees', 11, 5, 'enoch', '1-enoch', 10, 9, 'extras', E'1 Enoch 10:9 — *Proceed against the bastards and the reprobates, and against the children of fornication: and destroy [the children of fornication and] the children of the Watchers from amongst men... send them one against the other that they may destroy each other in battle: for length of days shall they not have.* The Watcher-spawn whose mutual slaughter Jubilees 11:5 echoes as Mastêmâ''s bloodshed on the earth.'),
  ('jubilees', 'jubilees', 11, 5, 'enoch', '1-enoch', 10, 15, 'extras', E'1 Enoch 10:15 — *And destroy all the spirits of the reprobate and the children of the Watchers, because they have wronged mankind.* The judgement on the very spirits Jubilees 11:5 says Mastêmâ unleashed to corrupt and destroy.'),
  -- thread: jubilees-11-abraham-turns-from-idols
  ('jubilees', 'jubilees', 11, 14, 'canon', 'joshua', 24, 3, 'free', E'Joshua 24:3 — *And I took your father Abraham from the other side of the flood, and led him throughout all the land of Canaan, and multiplied his seed, and gave him Isaac.* The election Jubilees 11:14 dramatizes as the boy separating himself from his father''s idols.'),
  ('jubilees', 'jubilees', 11, 17, 'canon', 'isaiah', 41, 8, 'free', E'Isaiah 41:8 — *But thou, Yashar''el (Israel), art my servant, Jacob whom I have chosen, the seed of Abraham my friend.* The friend-of-God title earned by the very turning-to-the-Creator Jubilees 11:17 records in Abraham''s prayer.'),
  ('jubilees', 'jubilees', 11, 17, 'canon', 'acts', 7, 3, 'free', E'Acts 7:3 — *And said unto him, Get thee out of thy country, and from thy kindred, and come into the land which I shall shew thee.* The call out of the idolatrous house Jubilees 11:14-17 shows Abraham already straining toward as a child.'),
  -- thread: jubilees-11-ravens-seed-plough
  ('jubilees', 'jubilees', 11, 11, 'canon', 'genesis', 8, 22, 'free', E'Genesis 8:22 — *While the earth remaineth, seedtime and harvest, and cold and heat, and summer and winter, and day and night shall not cease.* The covenant of the seedtime Mastêmâ tries to break in Jubilees 11:11 by sending ravens against the sown seed.'),
  ('jubilees', 'jubilees', 11, 23, 'enoch', '1-enoch', 10, 18, 'extras', E'1 Enoch 10:18 — *And then shall the whole earth be tilled in righteousness, and shall all be planted with trees and be full of blessing.* The tilled, freed land Jubilees 11:23 anticipates once Abram''s plough lets them sow without fear of the birds.'),
  ('jubilees', 'jubilees', 11, 19, 'apocrypha', 'the-wisdom-of-solomon', 13, 1, 'extras', E'Wisdom of Solomon 13:1 — *Surely vain are all men by nature, who are ignorant of Yahuah (God), and could not out of the good things that are seen know him that is: neither by considering the works did they acknowledge the workmaster;* the idol-vanity Abram leaves behind in Jubilees 11:19 as he commands the ravens in the Creator''s name.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session251_ju11_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session251_ju11_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-11-shem-to-terah-line',
       E'The line of Shem to Terah — the genealogy retold',
       E'Jubilees walks the same descent Genesis records — *Reu took to himself a wife, and her name was ''Ôrâ... and she bare him a son, and he called his name Sêrôḫ* (Jubilees 11:1), Serug to Nahor to *Terah in the seventh year of this week* (Jubilees 11:10), down to *Abram, by the name of the father of his mother* (Jubilees 11:14). Lay it beside Genesis and the line is identical: *And Reu lived two and thirty years, and begat Serug* (Genesis 11:20), *And Serug lived thirty years, and begat Nahor* (Genesis 11:22), *And Terah lived seventy years, and begat Abram, Nahor, and Haran* (Genesis 11:26). It ain''t new — Jubilees is the Book of Division retelling Bereshit, the chosen seed traced one name at a time through the post-Babel world toward Abraham.',
       sv.verse_id, ev.verse_id, 'extras', 53250
  FROM _session251_ju11_lookup sv, _session251_ju11_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=11 AND sv.verse_number=1
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=11 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-11-idolatry-bloodshed-babel',
       E'Idolatry and bloodshed spread — the fathers served other gods',
       E'After Babel the sons of Noah turn on each other and on heaven: *they made for themselves molten images, and they worshipped each the idol... and malignant spirits assisted and seduced (them) into committing transgression and uncleanness* (Jubilees 11:4), warring *to shed the blood of men on the earth, and to eat blood* (Jubilees 11:2). This is the world Abraham is born into — and Scripture names it bluntly: *Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham... and they served other gods* (Joshua 24:2). Stephen retells the same call out of that idolatry — *The Elohim (God) of glory appeared unto our father Abraham, when he was in Mesopotamia* (Acts 7:2). And Isaiah exposes the molten images for the vanity they are: *They that make a graven image are all of them vanity... they see not, nor know; that they may be ashamed* (Isaiah 44:9). The seed is kept holy not because the line was pure, but because Yahuah chose out of the idol-house.',
       sv.verse_id, ev.verse_id, 'extras', 53253
  FROM _session251_ju11_lookup sv, _session251_ju11_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=11 AND sv.verse_number=2
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=11 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-11-mastema-seed-war',
       E'Mastêmâ''s spirits — the seed-war loosed on the earth',
       E'The prince of the demons drives the corruption: *the prince Mastêmâ exerted himself to do all this, and he sent forth other spirits, those which were put under his hand, to do all manner of wrong and sin... to corrupt and destroy, and to shed blood upon the earth* (Jubilees 11:5). This is the tenth-part of spirits left under his hand one chapter earlier — *let some of them remain before me... for if some of them are not left to me, I shall not be able to execute the power of my will on the sons of men* (Jubilees 10:8). The live 1 Enoch apparatus is the root: the Watchers'' bastard spirits set *one against the other that they may destroy each other in battle* (1 Enoch 10:9), and the charge to *destroy all the spirits of the reprobate and the children of the Watchers, because they have wronged mankind* (1 Enoch 10:15). Same seed-war, three witnesses — the demons left on earth wage Mastêmâ''s campaign against the chosen line, and against the very seed in the ground (Jubilees 11:11).',
       sv.verse_id, ev.verse_id, 'extras', 53256
  FROM _session251_ju11_lookup sv, _session251_ju11_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=11 AND sv.verse_number=5
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=11 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-11-abraham-turns-from-idols',
       E'Abraham turns from idols — election out of the idolatrous line',
       E'While still a boy in Ur, Abraham breaks from his father''s idol-house: *the child began to understand the errors of the earth that all went astray after graven images and after uncleanness... and he separated himself from his father that he might not worship idols with him* (Jubilees 11:14), and *he began to pray to the Creator of all things that He might save him from the errors of the children of men* (Jubilees 11:17). Election precedes confession, and Scripture frames it the same way: out of the fathers who *served other gods*, *I took your father Abraham from the other side of the flood, and led him throughout all the land of Canaan* (Joshua 24:3). Isaiah calls him by the name this choosing earns: *thou, Yashar''el (Israel), art my servant, Jacob whom I have chosen, the seed of Abraham my friend... I have taken from the ends of the earth, and called thee from the chief men thereof* (Isaiah 41:8-9). And Stephen: *Get thee out of thy country, and from thy kindred* (Acts 7:3). Abraham is chosen out of idolatry — not because the line was clean, but because Yahuah called him from it.',
       sv.verse_id, ev.verse_id, 'extras', 53259
  FROM _session251_ju11_lookup sv, _session251_ju11_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=11 AND sv.verse_number=14
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=11 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-11-ravens-seed-plough',
       E'The ravens devour the seed — Abraham drives them off and invents the seed-plough',
       E'Mastêmâ wages the seed-war in the dirt: *the prince Mastêmâ sent ravens and birds to devour the seed which was sown in the land, in order to destroy the land, and rob the children of men of their labours* (Jubilees 11:11). But the chosen child turns the tide — *Abram ran to meet them... and said, “Descend not: return to the place whence you came,” and they proceeded to turn back* (Jubilees 11:19), seventy times in a day, and then *Abram taught those who made implements for oxen... and they made a vessel above the ground, facing the frame of the plough, in order to put the seed thereon... and they no longer feared the ravens* (Jubilees 11:23). Set this against the covenant Yahuah swore over the earth after the flood: *While the earth remaineth, seedtime and harvest, and cold and heat, and summer and winter, and day and night shall not cease* (Genesis 8:22) — Mastêmâ assaults the seedtime; Yahuah''s word guarantees it. And the healed, fruitful earth is exactly what 1 Enoch promises after the Watchers are bound: *then shall the whole earth be tilled in righteousness, and shall all be planted with trees and be full of blessing* (1 Enoch 10:18). The vanity of the idols that could not protect a single field stands rebuked beside the living God: *vain are all men by nature, who are ignorant of Yahuah (God)... neither by considering the works did they acknowledge the workmaster* (Wisdom of Solomon 13:1).',
       sv.verse_id, ev.verse_id, 'extras', 53262
  FROM _session251_ju11_lookup sv, _session251_ju11_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=11 AND sv.verse_number=11
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=11 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jubilees-11-shem-to-terah-line
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 11:20 — *And Reu lived two and thirty years, and begat Serug:* the same father-son link Jubilees 11:1 records when Reu begets the one he names Sêrôḫ.'
  FROM cross_reference_threads t, cross_references x, _session251_ju11_lookup sv, _session251_ju11_lookup tv
 WHERE t.slug='jubilees-11-shem-to-terah-line'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=11 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=11 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 11:22 — *And Serug lived thirty years, and begat Nahor:* matching Jubilees 11:6-8 where Serug dwells in Ur and his wife bears him Nahor.'
  FROM cross_reference_threads t, cross_references x, _session251_ju11_lookup sv, _session251_ju11_lookup tv
 WHERE t.slug='jubilees-11-shem-to-terah-line'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=11 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=11 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 11:24 — *And Nahor lived nine and twenty years, and begat Terah:* the very birth Jubilees 11:10 dates when ''Îjâskâ bears Nahor a son named Terah.'
  FROM cross_reference_threads t, cross_references x, _session251_ju11_lookup sv, _session251_ju11_lookup tv
 WHERE t.slug='jubilees-11-shem-to-terah-line'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=11 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=11 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 11:26 — *And Terah lived seventy years, and begat Abram, Nahor, and Haran:* the climax of the line, Abram born to Terah exactly as Jubilees 11:14 narrates.'
  FROM cross_reference_threads t, cross_references x, _session251_ju11_lookup sv, _session251_ju11_lookup tv
 WHERE t.slug='jubilees-11-shem-to-terah-line'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=11 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=11 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-11-idolatry-bloodshed-babel
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joshua 24:2 — *Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods.* Joshua names the very idolatry Jubilees 11:4 says Terah''s generation fell into.'
  FROM cross_reference_threads t, cross_references x, _session251_ju11_lookup sv, _session251_ju11_lookup tv
 WHERE t.slug='jubilees-11-idolatry-bloodshed-babel'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=11 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=24 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Acts 7:2 — *The Elohim (God) of glory appeared unto our father Abraham, when he was in Mesopotamia, before he dwelt in Charran,* Stephen placing the call in the blood-and-idol world Jubilees 11:2-4 describes.'
  FROM cross_reference_threads t, cross_references x, _session251_ju11_lookup sv, _session251_ju11_lookup tv
 WHERE t.slug='jubilees-11-idolatry-bloodshed-babel'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=11 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 44:9 — *They that make a graven image are all of them vanity; and their delectable things shall not profit; and they are their own witnesses; they see not, nor know; that they may be ashamed.* The prophetic verdict on the molten images Jubilees 11:4 says they worshipped.'
  FROM cross_reference_threads t, cross_references x, _session251_ju11_lookup sv, _session251_ju11_lookup tv
 WHERE t.slug='jubilees-11-idolatry-bloodshed-babel'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=11 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-11-mastema-seed-war
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jubilees 10:8 — *And the chief of the spirits, Mastêmâ, came and said: “Yahuah (God), Creator, let some of them remain before me, and let them hearken to my voice, and do all that I shall say to them; for if some of them are not left to me, I shall not be able to execute the power of my will on the sons of men...”* the tenth-part of spirits whom Jubilees 11:5 now shows Mastêmâ sending out to corrupt and shed blood.'
  FROM cross_reference_threads t, cross_references x, _session251_ju11_lookup sv, _session251_ju11_lookup tv
 WHERE t.slug='jubilees-11-mastema-seed-war'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=11 AND sv.verse_number=5
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=10 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 10:9 — *Proceed against the bastards and the reprobates, and against the children of fornication: and destroy [the children of fornication and] the children of the Watchers from amongst men... send them one against the other that they may destroy each other in battle: for length of days shall they not have.* The Watcher-spawn whose mutual slaughter Jubilees 11:5 echoes as Mastêmâ''s bloodshed on the earth.'
  FROM cross_reference_threads t, cross_references x, _session251_ju11_lookup sv, _session251_ju11_lookup tv
 WHERE t.slug='jubilees-11-mastema-seed-war'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=11 AND sv.verse_number=5
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 10:15 — *And destroy all the spirits of the reprobate and the children of the Watchers, because they have wronged mankind.* The judgement on the very spirits Jubilees 11:5 says Mastêmâ unleashed to corrupt and destroy.'
  FROM cross_reference_threads t, cross_references x, _session251_ju11_lookup sv, _session251_ju11_lookup tv
 WHERE t.slug='jubilees-11-mastema-seed-war'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=11 AND sv.verse_number=5
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-11-abraham-turns-from-idols
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joshua 24:3 — *And I took your father Abraham from the other side of the flood, and led him throughout all the land of Canaan, and multiplied his seed, and gave him Isaac.* The election Jubilees 11:14 dramatizes as the boy separating himself from his father''s idols.'
  FROM cross_reference_threads t, cross_references x, _session251_ju11_lookup sv, _session251_ju11_lookup tv
 WHERE t.slug='jubilees-11-abraham-turns-from-idols'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=11 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=24 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 41:8 — *But thou, Yashar''el (Israel), art my servant, Jacob whom I have chosen, the seed of Abraham my friend.* The friend-of-God title earned by the very turning-to-the-Creator Jubilees 11:17 records in Abraham''s prayer.'
  FROM cross_reference_threads t, cross_references x, _session251_ju11_lookup sv, _session251_ju11_lookup tv
 WHERE t.slug='jubilees-11-abraham-turns-from-idols'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=11 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=41 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 7:3 — *And said unto him, Get thee out of thy country, and from thy kindred, and come into the land which I shall shew thee.* The call out of the idolatrous house Jubilees 11:14-17 shows Abraham already straining toward as a child.'
  FROM cross_reference_threads t, cross_references x, _session251_ju11_lookup sv, _session251_ju11_lookup tv
 WHERE t.slug='jubilees-11-abraham-turns-from-idols'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=11 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-11-ravens-seed-plough
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 8:22 — *While the earth remaineth, seedtime and harvest, and cold and heat, and summer and winter, and day and night shall not cease.* The covenant of the seedtime Mastêmâ tries to break in Jubilees 11:11 by sending ravens against the sown seed.'
  FROM cross_reference_threads t, cross_references x, _session251_ju11_lookup sv, _session251_ju11_lookup tv
 WHERE t.slug='jubilees-11-ravens-seed-plough'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=11 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=8 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 10:18 — *And then shall the whole earth be tilled in righteousness, and shall all be planted with trees and be full of blessing.* The tilled, freed land Jubilees 11:23 anticipates once Abram''s plough lets them sow without fear of the birds.'
  FROM cross_reference_threads t, cross_references x, _session251_ju11_lookup sv, _session251_ju11_lookup tv
 WHERE t.slug='jubilees-11-ravens-seed-plough'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=11 AND sv.verse_number=23
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Wisdom of Solomon 13:1 — *Surely vain are all men by nature, who are ignorant of Yahuah (God), and could not out of the good things that are seen know him that is: neither by considering the works did they acknowledge the workmaster;* the idol-vanity Abram leaves behind in Jubilees 11:19 as he commands the ravens in the Creator''s name.'
  FROM cross_reference_threads t, cross_references x, _session251_ju11_lookup sv, _session251_ju11_lookup tv
 WHERE t.slug='jubilees-11-ravens-seed-plough'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=11 AND sv.verse_number=19
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=13 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

