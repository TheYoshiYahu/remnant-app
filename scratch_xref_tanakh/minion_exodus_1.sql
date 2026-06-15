-- ----- fragment: minion_exodus_1.sql (Exodus 1) -----
-- Chapter: Exodus 1 — the bondage in Egypt; the midwives who feared Elohim; Pharaoh's drown-decree
-- Tag: ex01   Session prefix: s305   Sort band base: 29000 (step 3)
-- Greenfield: 0 existing exodus-1-* slugs in EXISTING_SLUGS.txt
--
-- Per-verse coverage checklist:
--   v.1-6  names/seventy souls/Joseph died:
--          NT: none warranted   Extras: Jubilees 46:1-4 (woven via the seed thread)   Tanakh: Genesis 46 (the descent, woven)
--   v.7  fruitful, increased, multiplied, waxed mighty, land filled:
--          NT: Acts 7:17 (people grew and multiplied)   Extras: Jubilees 46:1 (multiplied, became a great nation)
--          Tanakh: Genesis 15:13-14 (400 years foretold), Genesis 46:3 (a great nation), Deuteronomy 26:5 (a few became a nation)
--   v.8  new king knew not Joseph:
--          NT: Acts 7:18 (quotes it verbatim), Acts 7:19 (dealt subtilly)   Extras: Jubilees 46:13 (deal wisely with them)   Tanakh: (woven w/ v.7 turn)
--   v.9-10 deal wisely / lest they multiply:
--          NT: Acts 7:19   Extras: Jubilees 46:13   Tanakh: none warranted (woven w/ v.8)
--   v.11-14 taskmasters / bitter service with rigour / morter and brick:
--          NT: none warranted   Extras: Jubilees 46:14-15 (taskmasters, rigour)
--          Tanakh: Genesis 15:13 (thy seed shall serve and be afflicted), Deuteronomy 4:20 (iron furnace), Deuteronomy 26:6 (hard bondage)
--   v.15-21 ★ midwives Shiphrah & Puah feared Elohim, disobeyed the murder-decree, Elohim made them houses:
--          NT: Acts 5:29 (obey Elohim rather than men)   Extras: none warranted (clean witness scarce; not forced)
--          Tanakh: Proverbs 1:7 + Proverbs 8:13 (the fear of Yahuah)
--   v.22 ★ cast every son into the river — the dragon devouring the seed:
--          NT: Revelation 12:4 (dragon to devour the child), Matthew 2:16 (Herod slays the infants)
--          Extras: Jubilees 47:2 (cast all male children into the river)   Tanakh: Genesis 3:15 (enmity, seed-war)
--
-- Threads (slug — target libraries):
--   exodus-1-the-seed-multiplied-in-egypt-as-sworn-to-abraham   — Tanakh(Gen,Deut)+NT(Acts)+Extras(Jubilees)  [extras]
--   exodus-1-a-new-king-who-knew-not-joseph                     — NT(Acts)+Extras(Jubilees)                    [extras]
--   exodus-1-the-bitter-bondage-with-rigour-the-iron-furnace    — Tanakh(Gen,Deut)+Extras(Jubilees)            [extras]
--   exodus-1-the-midwives-feared-elohim-rather-than-the-king    — NT(Acts)+Tanakh(Proverbs)                    [free]
--   exodus-1-the-decree-to-drown-the-sons-the-dragon-and-the-seed — NT(Rev,Matt)+Tanakh(Gen)+Extras(Jubilees) [extras]
--
-- Framework-load-bearing framings:
--   v.7  — the seed-promise flourishing EXACTLY as sworn to Abraham (Gen 15); the covenant seed, not mere demographics.
--   v.15-21 — civil disobedience to an unjust murder-decree out of the fear of Elohim; Elohim BUILDS the righteous (made them houses).
--   v.22 — the standing TYPE of the serpent's-seed war (Gen 3:15) against the firstborn-son people: dragon (Rev 12), Herod (Matt 2).

CREATE TEMP VIEW _s305_ex01_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================ CROSS_REFERENCES ============================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: the seed multiplied as sworn (v.7)
    ('canon','exodus',1,7,'canon','genesis',15,13,'free',
     E'*And he said unto Abram, Know of a surety that thy seed shall be a stranger in a land that is not theirs, and shall serve them; and they shall afflict them four hundred years;* (Genesis 15:13). The increase in *Exodus 1:7* — *the children of Yashar''el (Israel) were fruitful, and increased abundantly, and multiplied, and waxed exceeding mighty; and the land was filled with them* — is the covenant seed flourishing inside the very sojourn Yahuah (LORD) foretold to Abram. The multiplying and the affliction are one sworn word unfolding.'),
    ('canon','exodus',1,7,'canon','genesis',15,14,'free',
     E'*And also that nation, whom they shall serve, will I judge: and afterward shall they come out with great substance.* (Genesis 15:14). The seed that *waxed exceeding mighty* in Egypt (Exodus 1:7) is the seed whose oppressor Yahuah (LORD) pledged to judge and bring out — the bondage of Exodus 1 is the front half of this oath.'),
    ('canon','exodus',1,7,'canon','genesis',46,3,'free',
     E'*And he said, I am Elohim (God), the Elohim (God) of thy father: fear not to go down into Egypt; for I will there make of thee a great nation:* (Genesis 46:3). Yahuah swore to Jacob that the descent into Egypt was the womb of a nation; *Exodus 1:7* reports the promise kept — *the land was filled with them*.'),
    ('canon','exodus',1,7,'canon','deuteronomy',26,5,'free',
     E'*And thou shalt speak and say before Yahuah Elohayka (the LORD thy God), A Syrian ready to perish was my father, and he went down into Egypt, and sojourned there with a few, and became there a nation, great, mighty, and populous:* (Deuteronomy 26:5). Yashar''el''s firstfruits confession reaches back to this very growth — *a few* who *became there a nation, great, mighty, and populous*, the exact arc of *Exodus 1:7*.'),
    ('canon','exodus',1,7,'canon','acts',7,17,'free',
     E'*But when the time of the promise drew nigh, which Elohim (God) had sworn to Abraham, the people grew and multiplied in Egypt,* (Acts 7:17). Stephen reads the increase of *Exodus 1:7* as the clock of *the promise* sworn to Abraham striking — the people *grew and multiplied* precisely because the deliverance hour drew near.'),
    ('canon','exodus',1,7,'jubilees','jubilees',46,1,'extras',
     E'*And it came to pass that after Jacob died the children of Yashar’el (Israel) multiplied in the land of Egypt, and they became a great nation, and they were of one accord in heart, so that brother loved brother and every man helped his brother, and they increased abundantly and multiplied exceedingly, ten weeks of years, all the days of the life of Joseph.* (Jubilees 46:1). The restored witness echoes *Exodus 1:7* word for word — they *increased abundantly and multiplied exceedingly* and *became a great nation*, the seed-promise visibly kept.'),

    -- THREAD 2: a new king who knew not Joseph (v.8)
    ('canon','exodus',1,8,'canon','acts',7,18,'free',
     E'*Till another king arose, which knew not Joseph.* (Acts 7:18). Stephen quotes *Exodus 1:8* almost verbatim — *there arose up a new king over Egypt, which knew not Joseph* — marking the turn from a Yoseph (Joseph) who had saved Egypt to a throne that forgot him and turned on his people.'),
    ('canon','exodus',1,8,'canon','acts',7,19,'free',
     E'*The same dealt subtilly with our kindred, and evil entreated our fathers, so that they cast out their young children, to the end they might not live.* (Acts 7:19). The new king of *Exodus 1:8* is the one who, in Stephen''s telling, *dealt subtilly* — the same *deal wisely with them* of Exodus 1:10 — and drove the murder of the children that Exodus 1 unfolds.'),
    ('canon','exodus',1,8,'jubilees','jubilees',46,13,'extras',
     E'*"Behold the people of the children of Yashar’el (Israel) have increased and multiplied more than we. Come and let us deal wisely with them before they become too many, and let us afflict them with slavery before war come upon us and before they too fight against us; else they will join themselves to our enemies and get them up out of our land, for their hearts and faces are towards the land of Canaan."* (Jubilees 46:13). The restored account puts the very policy of *Exodus 1:8-10* in the new king''s mouth — *let us deal wisely with them* lest they multiply and *join also unto our enemies*.'),

    -- THREAD 3: the bitter bondage with rigour, the iron furnace (v.11-14)
    ('canon','exodus',1,11,'canon','genesis',15,13,'free',
     E'*And he said unto Abram, Know of a surety that thy seed shall be a stranger in a land that is not theirs, and shall serve them; and they shall afflict them four hundred years;* (Genesis 15:13). The taskmasters of *Exodus 1:11* — set *over them... to afflict them with their burdens* — are the affliction Yahuah (LORD) named centuries before to Abram: *thy seed... shall serve them; and they shall afflict them*.'),
    ('canon','exodus',1,14,'canon','deuteronomy',4,20,'free',
     E'*But Yahuah (LORD) hath taken you, and brought you forth out of the iron furnace, even out of Egypt, to be unto him a people of inheritance, as ye are this day.* (Deuteronomy 4:20). The *hard bondage, in morter, and in brick* of *Exodus 1:14* is what Moses later names *the iron furnace* — the smelting-fire out of which Yahuah drew a people for his own inheritance.'),
    ('canon','exodus',1,14,'canon','deuteronomy',26,6,'free',
     E'*And the Egyptians evil entreated us, and afflicted us, and laid upon us hard bondage:* (Deuteronomy 26:6). Yashar''el''s confession remembers the exact *hard bondage* of *Exodus 1:14* — the bitter service *with rigour* — every harvest, lest the rescue be forgotten.'),
    ('canon','exodus',1,14,'jubilees','jubilees',46,14,'extras',
     E'*And he set over them taskmasters to afflict them with slavery; and they built strong cities for Pharaoh, Pithom and Raamses, and they built all the walls and all the fortifications which had fallen in the cities of Egypt.* (Jubilees 46:14). The restored witness names the same *taskmasters*, the same *Pithom and Raamses* of *Exodus 1:11-14*, the bondage laid on the seed.'),
    ('canon','exodus',1,12,'jubilees','jubilees',46,15,'extras',
     E'*And they made them serve with rigour, and the more they dealt evilly with them, the more they increased and multiplied.* (Jubilees 46:15). The paradox of *Exodus 1:12* — *the more they afflicted them, the more they multiplied and grew* — stands in the restored account too: the harder the *rigour*, the more the covenant seed flourished.'),

    -- THREAD 4: the midwives feared Elohim rather than the king (v.15-21)
    ('canon','exodus',1,17,'canon','acts',5,29,'free',
     E'*Then Peter and the other apostles answered and said, We ought to obey Elohim (God) rather than men.* (Acts 5:29). Shiphrah and Puah live this verse long before it is spoken — *the midwives feared Elohim (God), and did not as the king of Egypt commanded them, but saved the men children alive* (Exodus 1:17). When the throne commands murder, the fear of Elohim outranks the fear of the king.'),
    ('canon','exodus',1,17,'canon','proverbs',1,7,'free',
     E'*The fear of Yahuah (LORD) is the beginning of knowledge: but fools despise wisdom and instruction.* (Proverbs 1:7). The midwives'' refusal in *Exodus 1:17* is wisdom''s first principle in action — *the midwives feared Elohim (God)* and so knew, where the king did not, that the sons must live.'),
    ('canon','exodus',1,21,'canon','proverbs',8,13,'free',
     E'*The fear of Yahuah (LORD) is to hate evil: pride, and arrogancy, and the evil way, and the froward mouth, do I hate.* (Proverbs 8:13). Because the midwives *feared Elohim (God)... he made them houses* (Exodus 1:21) — the fear of Yahuah that *hate[s] evil* and refuses the murder-decree is the fear Elohim rewards by building the household.'),

    -- THREAD 5: the decree to drown the sons — the dragon and the seed (v.22)
    ('canon','exodus',1,22,'canon','genesis',3,15,'free',
     E'*And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* (Genesis 3:15). Pharaoh''s decree — *Every son that is born ye shall cast into the river* (Exodus 1:22) — is the serpent''s-seed war on the woman''s seed: drown the sons, and the deliverer never comes. The enmity sworn in Eden takes the shape of a river.'),
    ('canon','exodus',1,22,'canon','revelation',12,4,'free',
     E'*And his tail drew the third part of the stars of heaven, and did cast them to the earth: and the dragon stood before the woman which was ready to be delivered, for to devour her child as soon as it was born.* (Revelation 12:4). The river-decree of *Exodus 1:22* is one face of the standing type John sees — *the dragon stood before the woman... for to devour her child as soon as it was born* — the ancient war to swallow the seed at birth.'),
    ('canon','exodus',1,22,'canon','matthew',2,16,'free',
     E'*Then Herod, when he saw that he was mocked of the wise men, was exceeding wroth, and sent forth, and slew all the children that were in Bethlehem, and in all the coasts thereof, from two years old and under, according to the time which he had diligently enquired of the wise men.* (Matthew 2:16). Herod re-runs Pharaoh''s script of *Exodus 1:22* — slay the male infants to kill the deliverer in the cradle. The same serpent, the same firstborn-son war.'),
    ('canon','exodus',1,22,'jubilees','jubilees',47,2,'extras',
     E'*And Pharaoh, king of Egypt, issued a command regarding them that they should cast all their male children which were born into the river.* (Jubilees 47:2). The restored witness names the decree of *Exodus 1:22* plainly — *cast all their male children... into the river* — the throne''s war on the Hebrew sons just as Moses is about to be born.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s305_ex01_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s305_ex01_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================ THREADS ============================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-1-the-seed-multiplied-in-egypt-as-sworn-to-abraham',
       E'The seed multiplied in Egypt, exactly as sworn to Abraham',
       E'*And the children of Yashar''el (Israel) were fruitful, and increased abundantly, and multiplied, and waxed exceeding mighty; and the land was filled with them* (Exodus 1:7). This is no accident of demography — it is the covenant seed flourishing inside the very sojourn Yahuah (LORD) foretold. To Abram: *thy seed shall be a stranger in a land that is not theirs, and shall serve them; and they shall afflict them four hundred years* (Genesis 15:13), and *afterward shall they come out with great substance* (Genesis 15:14). To Jacob at the descent: *fear not to go down into Egypt; for I will there make of thee a great nation* (Genesis 46:3). Yashar''el''s own firstfruits confession sings it: *he went down into Egypt, and sojourned there with a few, and became there a nation, great, mighty, and populous* (Deuteronomy 26:5). Stephen reads the increase as the promise-clock striking: *when the time of the promise drew nigh, which Elohim (God) had sworn to Abraham, the people grew and multiplied in Egypt* (Acts 7:17). And the restored witness echoes it word for word: *they increased abundantly and multiplied exceedingly... and they became a great nation* (Jubilees 46:1). The multiplying and the coming bondage are one sworn word unfolding.',
       sv.verse_id, ev.verse_id, 'extras', 29000
  FROM _s305_ex01_lookup sv, _s305_ex01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=1 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=1 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-1-a-new-king-who-knew-not-joseph',
       E'A new king who knew not Joseph',
       E'*Now there arose up a new king over Egypt, which knew not Joseph* (Exodus 1:8). The throne that Yoseph (Joseph) had saved from famine forgets him and turns on his people. Stephen quotes the verse almost verbatim — *Till another king arose, which knew not Joseph* (Acts 7:18) — and names the policy that followed: *The same dealt subtilly with our kindred, and evil entreated our fathers, so that they cast out their young children, to the end they might not live* (Acts 7:19), the very *deal wisely with them* of Exodus 1:10. The restored account puts the whole scheme in the king''s mouth: *Behold the people of the children of Yashar''el (Israel) have increased and multiplied more than we. Come and let us deal wisely with them... else they will join themselves to our enemies and get them up out of our land* (Jubilees 46:13). The favor of one generation becomes the bondage of the next.',
       sv.verse_id, ev.verse_id, 'extras', 29003
  FROM _s305_ex01_lookup sv, _s305_ex01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=1 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=1 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-1-the-bitter-bondage-with-rigour-the-iron-furnace',
       E'The bitter bondage with rigour — the iron furnace',
       E'*And they made their lives bitter with hard bondage, in morter, and in brick, and in all manner of service in the field... was with rigour* (Exodus 1:14). The taskmasters set *over them... to afflict them with their burdens* (Exodus 1:11) are the affliction Yahuah (LORD) named to Abram centuries before: *thy seed... shall serve them; and they shall afflict them four hundred years* (Genesis 15:13). Moses later gives the bondage its name — *the iron furnace* — the smelting-fire out of which a people was drawn: *Yahuah (LORD) hath taken you, and brought you forth out of the iron furnace, even out of Egypt, to be unto him a people of inheritance* (Deuteronomy 4:20). Yashar''el''s confession remembers the *hard bondage* (Deuteronomy 26:6). And the restored account names the same *taskmasters*, the same *Pithom and Raamses* (Jubilees 46:14), with the same paradox the text marks at Exodus 1:12 — *the more they dealt evilly with them, the more they increased and multiplied* (Jubilees 46:15). The harder the rigour, the more the covenant seed flourished.',
       sv.verse_id, ev.verse_id, 'extras', 29006
  FROM _s305_ex01_lookup sv, _s305_ex01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=1 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=1 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-1-the-midwives-feared-elohim-rather-than-the-king',
       E'The midwives feared Elohim rather than the king',
       E'*But the midwives feared Elohim (God), and did not as the king of Egypt commanded them, but saved the men children alive* (Exodus 1:17). Shiphrah and Puah are handed a murder-decree by the most powerful throne on earth, and they quietly refuse it — civil disobedience to an unjust command, out of the fear of Elohim. They live, long before it is spoken, the rule Peter would state: *We ought to obey Elohim (God) rather than men* (Acts 5:29). Their refusal is wisdom''s first principle in motion — *The fear of Yahuah (LORD) is the beginning of knowledge* (Proverbs 1:7) — and wisdom''s hatred of evil — *The fear of Yahuah (LORD) is to hate evil... and the evil way... do I hate* (Proverbs 8:13). And Elohim answers: *because the midwives feared Elohim (God), that he made them houses* (Exodus 1:21). The throne builds treasure-cities on Hebrew backs; Elohim builds households for the women who would not kill.',
       sv.verse_id, ev.verse_id, 'free', 29009
  FROM _s305_ex01_lookup sv, _s305_ex01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=1 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=1 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-1-the-decree-to-drown-the-sons-the-dragon-and-the-seed',
       E'The decree to drown the sons — the dragon and the seed',
       E'*And Pharaoh charged all his people, saying, Every son that is born ye shall cast into the river* (Exodus 1:22). This is the oldest war wearing a new face. The enmity sworn in Eden — *I will put enmity between thee and the woman, and between thy seed and her seed* (Genesis 3:15) — takes the shape of a river: drown the sons, and the deliverer never comes. John sees the standing type from above: *the dragon stood before the woman which was ready to be delivered, for to devour her child as soon as it was born* (Revelation 12:4). And Herod re-runs Pharaoh''s exact script at the birth of the Formed Son — *slew all the children that were in Bethlehem... from two years old and under* (Matthew 2:16). The restored witness names the decree plainly: *Pharaoh, king of Egypt, issued a command regarding them that they should cast all their male children which were born into the river* (Jubilees 47:2). One serpent, one firstborn-son people, one unbroken war on the seed — and a deliverer drawn out of the very river meant to drown him.',
       sv.verse_id, ev.verse_id, 'extras', 29012
  FROM _s305_ex01_lookup sv, _s305_ex01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=1 AND sv.verse_number=22
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=1 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

-- ============================ THREAD MEMBERS ============================
-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*thy seed... shall serve them; and they shall afflict them four hundred years* (Genesis 15:13) — the multiplying happens inside the sworn sojourn.'
  FROM cross_reference_threads t
  JOIN _s305_ex01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=1 AND sv.verse_number=7
  JOIN _s305_ex01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-1-the-seed-multiplied-in-egypt-as-sworn-to-abraham'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*afterward shall they come out with great substance* (Genesis 15:14) — the same oath pledges judgment on the oppressor.'
  FROM cross_reference_threads t
  JOIN _s305_ex01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=1 AND sv.verse_number=7
  JOIN _s305_ex01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-1-the-seed-multiplied-in-egypt-as-sworn-to-abraham'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*I will there make of thee a great nation* (Genesis 46:3) — sworn to Jacob at the descent into Egypt.'
  FROM cross_reference_threads t
  JOIN _s305_ex01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=1 AND sv.verse_number=7
  JOIN _s305_ex01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=46 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-1-the-seed-multiplied-in-egypt-as-sworn-to-abraham'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*a few... became there a nation, great, mighty, and populous* (Deuteronomy 26:5) — Yashar''el''s firstfruits confession of this exact growth.'
  FROM cross_reference_threads t
  JOIN _s305_ex01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=1 AND sv.verse_number=7
  JOIN _s305_ex01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=26 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-1-the-seed-multiplied-in-egypt-as-sworn-to-abraham'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*when the time of the promise drew nigh... the people grew and multiplied in Egypt* (Acts 7:17) — Stephen reads the increase as the promise-clock striking.'
  FROM cross_reference_threads t
  JOIN _s305_ex01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=1 AND sv.verse_number=7
  JOIN _s305_ex01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-1-the-seed-multiplied-in-egypt-as-sworn-to-abraham'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*they increased abundantly and multiplied exceedingly... and they became a great nation* (Jubilees 46:1) — the restored witness echoes Exodus 1:7 word for word.'
  FROM cross_reference_threads t
  JOIN _s305_ex01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=1 AND sv.verse_number=7
  JOIN _s305_ex01_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=46 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-1-the-seed-multiplied-in-egypt-as-sworn-to-abraham'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Till another king arose, which knew not Joseph* (Acts 7:18) — Stephen quotes Exodus 1:8 almost verbatim.'
  FROM cross_reference_threads t
  JOIN _s305_ex01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=1 AND sv.verse_number=8
  JOIN _s305_ex01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-1-a-new-king-who-knew-not-joseph'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*The same dealt subtilly with our kindred... so that they cast out their young children* (Acts 7:19) — the policy the new king set in motion.'
  FROM cross_reference_threads t
  JOIN _s305_ex01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=1 AND sv.verse_number=8
  JOIN _s305_ex01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-1-a-new-king-who-knew-not-joseph'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*let us deal wisely with them... else they will join themselves to our enemies* (Jubilees 46:13) — the very policy of Exodus 1:8-10 in the king''s mouth.'
  FROM cross_reference_threads t
  JOIN _s305_ex01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=1 AND sv.verse_number=8
  JOIN _s305_ex01_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=46 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-1-a-new-king-who-knew-not-joseph'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*thy seed... shall serve them; and they shall afflict them* (Genesis 15:13) — the taskmasters are the foretold affliction.'
  FROM cross_reference_threads t
  JOIN _s305_ex01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=1 AND sv.verse_number=11
  JOIN _s305_ex01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-1-the-bitter-bondage-with-rigour-the-iron-furnace'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*the iron furnace, even out of Egypt* (Deuteronomy 4:20) — Moses names the bondage of Exodus 1:14 the smelting-fire.'
  FROM cross_reference_threads t
  JOIN _s305_ex01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=1 AND sv.verse_number=14
  JOIN _s305_ex01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=4 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-1-the-bitter-bondage-with-rigour-the-iron-furnace'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*afflicted us, and laid upon us hard bondage* (Deuteronomy 26:6) — Yashar''el''s confession remembers the same bondage.'
  FROM cross_reference_threads t
  JOIN _s305_ex01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=1 AND sv.verse_number=14
  JOIN _s305_ex01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=26 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-1-the-bitter-bondage-with-rigour-the-iron-furnace'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*he set over them taskmasters... Pithom and Raamses* (Jubilees 46:14) — the restored witness names the same taskmasters and cities.'
  FROM cross_reference_threads t
  JOIN _s305_ex01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=1 AND sv.verse_number=14
  JOIN _s305_ex01_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=46 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-1-the-bitter-bondage-with-rigour-the-iron-furnace'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*the more they dealt evilly with them, the more they increased and multiplied* (Jubilees 46:15) — the paradox of Exodus 1:12 in the restored account.'
  FROM cross_reference_threads t
  JOIN _s305_ex01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=1 AND sv.verse_number=12
  JOIN _s305_ex01_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=46 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-1-the-bitter-bondage-with-rigour-the-iron-furnace'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*We ought to obey Elohim (God) rather than men* (Acts 5:29) — the rule the midwives lived before it was spoken.'
  FROM cross_reference_threads t
  JOIN _s305_ex01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=1 AND sv.verse_number=17
  JOIN _s305_ex01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=5 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-1-the-midwives-feared-elohim-rather-than-the-king'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*The fear of Yahuah (LORD) is the beginning of knowledge* (Proverbs 1:7) — the midwives'' refusal is wisdom''s first principle in action.'
  FROM cross_reference_threads t
  JOIN _s305_ex01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=1 AND sv.verse_number=17
  JOIN _s305_ex01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=1 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-1-the-midwives-feared-elohim-rather-than-the-king'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*The fear of Yahuah (LORD) is to hate evil* (Proverbs 8:13) — the fear that hates the murder-decree is the fear Elohim rewards by building the household.'
  FROM cross_reference_threads t
  JOIN _s305_ex01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=1 AND sv.verse_number=21
  JOIN _s305_ex01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=8 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-1-the-midwives-feared-elohim-rather-than-the-king'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*I will put enmity between thee and the woman, and between thy seed and her seed* (Genesis 3:15) — the river-decree is the serpent''s-seed war on the woman''s seed.'
  FROM cross_reference_threads t
  JOIN _s305_ex01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=1 AND sv.verse_number=22
  JOIN _s305_ex01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-1-the-decree-to-drown-the-sons-the-dragon-and-the-seed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*the dragon stood before the woman... for to devour her child as soon as it was born* (Revelation 12:4) — the standing type the river-decree wears.'
  FROM cross_reference_threads t
  JOIN _s305_ex01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=1 AND sv.verse_number=22
  JOIN _s305_ex01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=12 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-1-the-decree-to-drown-the-sons-the-dragon-and-the-seed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*slew all the children that were in Bethlehem... from two years old and under* (Matthew 2:16) — Herod re-runs Pharaoh''s script at the deliverer''s birth.'
  FROM cross_reference_threads t
  JOIN _s305_ex01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=1 AND sv.verse_number=22
  JOIN _s305_ex01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=2 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-1-the-decree-to-drown-the-sons-the-dragon-and-the-seed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*cast all their male children which were born into the river* (Jubilees 47:2) — the restored witness names the decree plainly.'
  FROM cross_reference_threads t
  JOIN _s305_ex01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=1 AND sv.verse_number=22
  JOIN _s305_ex01_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=47 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-1-the-decree-to-drown-the-sons-the-dragon-and-the-seed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
